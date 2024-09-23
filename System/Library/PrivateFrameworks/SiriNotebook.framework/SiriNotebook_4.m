uint64_t OUTLINED_FUNCTION_53_22()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_54_12()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_55_17()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_56_16(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_57_10()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_58_17()
{
  return sub_21B368E54();
}

uint64_t OUTLINED_FUNCTION_61_12()
{
  uint64_t v0;
  __int128 *v1;

  return sub_21B171D88(v1, v0);
}

_QWORD *OUTLINED_FUNCTION_62_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 24));
}

uint64_t OUTLINED_FUNCTION_64_15()
{
  return sub_21B369100();
}

uint64_t OUTLINED_FUNCTION_68_11()
{
  return sub_21B36B818();
}

uint64_t OUTLINED_FUNCTION_69_12@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_71_13(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_21B196024(a1, a2, (uint64_t *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_74_8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a2;
  *(_QWORD *)(v2 - 112) = a1;
  return __swift_instantiateConcreteTypeFromMangledName(*(uint64_t **)(v2 - 144));
}

uint64_t sub_21B3480AC(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 16))
    {
      swift_bridgeObjectRetain_n();
      __asm { BR              X9 }
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

void sub_21B348390()
{
  OUTLINED_FUNCTION_6_2();
  JUMPOUT(0x21B34835CLL);
}

void sub_21B3483A0()
{
  JUMPOUT(0x21B348360);
}

uint64_t INTaskPriority.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0x6E776F6E6B6E752ELL;
    case 1:
      return 0x67616C46746F6E2ELL;
    case 2:
      return 0x64656767616C662ELL;
  }
  sub_21B36B974();
  swift_bridgeObjectRelease();
  sub_21B36BCA4();
  sub_21B36B4F4();
  OUTLINED_FUNCTION_6_2();
  sub_21B36B4F4();
  return 0xD000000000000014;
}

uint64_t sub_21B348550()
{
  uint64_t *v0;

  return INTaskPriority.description.getter(*v0);
}

uint64_t OUTLINED_FUNCTION_0_72()
{
  return 0x656C706D6F636E69;
}

uint64_t OUTLINED_FUNCTION_4_63()
{
  return 0x6E69727275636572;
}

uint64_t OUTLINED_FUNCTION_5_69()
{
  return 0x6D69745F65746164;
}

uint64_t OUTLINED_FUNCTION_8_60()
{
  return 0x6574656C706D6F63;
}

uint64_t sub_21B3485BC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v0 = sub_21B36B020();
  if (v1)
  {
    if (v0 == 0xD000000000000015 && v1 == 0x800000021B3906E0)
    {
      OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_6_2();
      return 1;
    }
    v2 = sub_21B36BCBC();
    OUTLINED_FUNCTION_6_2();
    if ((v2 & 1) != 0)
    {
      OUTLINED_FUNCTION_3_4();
      return 1;
    }
  }
  v4 = sub_21B36B020();
  if (!v5)
  {
    OUTLINED_FUNCTION_3_4();
    return 2;
  }
  if (v4 == 0xD000000000000013 && v5 == 0x800000021B38E000)
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_3_4();
    return 0;
  }
  v6 = sub_21B36BCBC();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_3_4();
  result = 0;
  if ((v6 & 1) == 0)
    return 2;
  return result;
}

uint64_t sub_21B3486D0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v2 + 96) = a2;
  *(_QWORD *)(v2 + 64) = a1;
  v3 = sub_21B368458();
  *(_QWORD *)(v2 + 72) = v3;
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  return swift_task_switch();
}

id sub_21B348734()
{
  uint64_t v0;
  int v1;
  const char *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = *(unsigned __int8 *)(v0 + 96);
  v21 = __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 64), *(_QWORD *)(*(_QWORD *)(v0 + 64) + 24));
  if (v1)
  {
    if (v1 == 1)
    {
      v20 = 0xD000000000000020;
      v2 = "NOTES_ACTIVITY_NOTIFICATION_BODY";
    }
    else
    {
      v20 = 0xD000000000000022;
      v2 = "GENERIC_ACTIVITY_NOTIFICATION_BODY";
    }
  }
  else
  {
    v20 = 0xD000000000000024;
    v2 = "REMINDERS_ACTIVITY_NOTIFICATION_BODY";
  }
  v3 = (unint64_t)(v2 - 32) | 0x8000000000000000;
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 72);
  sub_21B368428();
  *(_QWORD *)(v0 + 16) = sub_21B3683D4();
  *(_QWORD *)(v0 + 24) = v7;
  *(_QWORD *)(v0 + 32) = 45;
  *(_QWORD *)(v0 + 40) = 0xE100000000000000;
  *(_QWORD *)(v0 + 48) = 95;
  *(_QWORD *)(v0 + 56) = 0xE100000000000000;
  v19 = sub_21B162704();
  v18 = MEMORY[0x24BEE0D00];
  v8 = sub_21B36B854();
  v10 = v9;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance, v18, v19, v19, v19);
  if (result)
  {
    v12 = result;
    v13 = type metadata accessor for StringLocalizer();
    v14 = sub_21B1FC918(v20, v3, 0x617A696C61636F4CLL, 0xEB00000000656C62, *(_QWORD *)((char *)v21 + *(int *)(v13 + 20)), v8, v10, v12);
    v16 = v15;

    if (v16)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v14, v16);
    }
    else
    {
      sub_21B1FCEB4();
      swift_allocError();
      *v17 = v20;
      v17[1] = v3;
      v17[2] = 0x617A696C61636F4CLL;
      v17[3] = 0xEB00000000656C62;
      v17[4] = v8;
      v17[5] = v10;
      swift_bridgeObjectRetain();
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      return (id)(*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t _s20HandleIntentStrategyVwxx_1(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 184);
}

uint64_t _s20HandleIntentStrategyVwcp_1(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  __int128 v13;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  v7 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_retain();
  swift_retain();
  v9(a1 + 96, a2 + 96, v8);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  v10 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 168) = v10;
  v11 = v10;
  v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
  swift_retain();
  v12(a1 + 144, a2 + 144, v11);
  v13 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 184, a2 + 184);
  return a1;
}

uint64_t *_s20HandleIntentStrategyVwca_1(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  a1[11] = a2[11];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  a1[17] = a2[17];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 18, a2 + 18);
  __swift_assign_boxed_opaque_existential_1(a1 + 23, a2 + 23);
  return a1;
}

uint64_t _s20HandleIntentStrategyVwta_1(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  swift_release();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  v7 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v7;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  v8 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v8;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  return a1;
}

uint64_t _s20HandleIntentStrategyVwet_1(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 224))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s20HandleIntentStrategyVwst_1(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 216) = 0;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 224) = 1;
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
    *(_BYTE *)(result + 224) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s20HandleIntentStrategyVMa_1()
{
  return &_s20HandleIntentStrategyVN_1;
}

uint64_t sub_21B348D54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  v4 = OUTLINED_FUNCTION_61_1();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = OUTLINED_FUNCTION_23_1();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514D2F8);
  v3[9] = v5;
  v3[10] = *(_QWORD *)(v5 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B348DD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
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

  if (qword_2551411E0 != -1)
    swift_once();
  v1 = v0[12];
  v3 = v0[9];
  v2 = v0[10];
  v4 = v0[4];
  v5 = OUTLINED_FUNCTION_9_0();
  v6 = __swift_project_value_buffer(v5, (uint64_t)&unk_25517A6C8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v7(v1, v4, v3);
  sub_21B36B29C();
  v8 = OUTLINED_FUNCTION_29_1();
  v9 = OUTLINED_FUNCTION_19_1(v8);
  v10 = v0[12];
  if (v9)
  {
    v11 = v0[11];
    v46 = v0[10];
    v12 = v0[9];
    v13 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    v7(v11, v10, v12);
    v14 = sub_21B36B47C();
    v0[2] = sub_21B196024(v14, v15, &v47);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v10, v12);
    _os_log_impl(&dword_21B15D000, v6, (os_log_type_t)v3, "[CreateNote HandleIntentStrategy] Creating intent handled response for: %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }
  (*(void (**)(_QWORD, _QWORD))(v0[10] + 8))(v0[12], v0[9]);

  v16 = (void *)sub_21B369184();
  v17 = objc_msgSend(v16, sel_createdNote);
  v0[13] = v17;

  if (!v17)
  {
    v28 = (void *)sub_21B36B29C();
    v29 = sub_21B36B71C();
    if (OUTLINED_FUNCTION_18_16(v29))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_18() = 0;
      OUTLINED_FUNCTION_3_28(&dword_21B15D000, v30, v31, "[CreateNote HandleIntentStrategy] Created Note is nil in the intent response");
      OUTLINED_FUNCTION_3();
    }

    sub_21B1644F8();
    swift_allocError();
    *(_OWORD *)v32 = 0u;
    *(_OWORD *)(v32 + 16) = 0u;
    *(_BYTE *)(v32 + 32) = 4;
    swift_willThrow();
    OUTLINED_FUNCTION_14_46();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_69_5();
    __asm { BR              X0 }
  }
  v18 = (_QWORD *)v0[5];
  if (v18[17])
  {
    v19 = (void *)sub_21B3691A8();
    sub_21B21E394(v19);

    v18 = (_QWORD *)v0[5];
  }
  sub_21B2C4FE8();
  v20 = v18[21];
  v21 = v18[22];
  __swift_project_boxed_opaque_existential_1(v18 + 18, v20);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v21 + 56))(v20, v21) & 1) != 0)
  {
    v22 = (_QWORD *)swift_task_alloc();
    v0[14] = v22;
    *v22 = v0;
    v22[1] = sub_21B3491A4;
    OUTLINED_FUNCTION_69_5();
    return sub_21B3493D0(v23, v24, v25, v26);
  }
  else
  {
    OUTLINED_FUNCTION_34_35();
    v34 = sub_21B1FDEE0();
    swift_release();
    v0[16] = OUTLINED_FUNCTION_34_35();
    v0[17] = sub_21B3691A8();
    v35 = (_QWORD *)swift_task_alloc();
    if ((v34 & 1) != 0)
    {
      v0[18] = v35;
      OUTLINED_FUNCTION_11_52(v35);
      OUTLINED_FUNCTION_69_5();
      return sub_21B3499D8(v36, v37, v38, v39, v40);
    }
    else
    {
      v0[20] = v35;
      OUTLINED_FUNCTION_11_52(v35);
      OUTLINED_FUNCTION_69_5();
      return sub_21B349EA0(v41, v42, v43, v44, v45);
    }
  }
}

uint64_t sub_21B3491A4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_15_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 120) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B3491F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_46_7();
  return v4();
}

uint64_t sub_21B34925C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_11_1();
  *v3 = *v2;
  *(_QWORD *)(v0 + 152) = v1;
  swift_task_dealloc();

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_32_1();
}

uint64_t sub_21B3492BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_11_1();
  *v3 = *v2;
  *(_QWORD *)(v0 + 168) = v1;
  swift_task_dealloc();

  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_32_1();
}

uint64_t sub_21B34931C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_48();
  OUTLINED_FUNCTION_12_18();
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B349358()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_48();
  OUTLINED_FUNCTION_12_18();
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B349394()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_48();
  OUTLINED_FUNCTION_12_18();
  OUTLINED_FUNCTION_14_46();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B3493D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  v6 = sub_21B368C44();
  v5[12] = v6;
  v5[13] = *(_QWORD *)(v6 - 8);
  v5[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142588);
  v5[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0A0);
  v5[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  v5[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0);
  v5[18] = swift_task_alloc();
  v5[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B3494D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  sub_21B36AF3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D2F8);
  v1 = sub_21B369190();
  v2 = sub_21B1BB91C(v1);
  v0[20] = v2;
  v3 = (void *)sub_21B3691A8();
  v4 = objc_msgSend(v3, sel_groupName);

  if (v4)
  v5 = v4 != 0;
  v6 = (void *)v0[8];
  type metadata accessor for NotebookNoteConcept(0);
  v7 = sub_21B34E9C0(v6);
  v0[21] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v0[22] = v8;
  *v8 = v0;
  v8[1] = sub_21B3495D8;
  return sub_21B163B58(v2, v5, v7);
}

uint64_t sub_21B3495D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 184) = a1;
  *(_QWORD *)(v3 + 192) = v1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_17_0();
  if (v1)
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_36_0();
    return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v3 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_32_1();
  }
}

uint64_t sub_21B349688()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
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
  id v21;
  _QWORD *v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(uint64_t **)(v0 + 152);
  v4 = *(void **)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  sub_21B186684(*(_QWORD *)(v0 + 88) + 184, v0 + 16);
  sub_21B34A43C(v4, v3, v2);
  v5 = *(void **)(v0 + 184);
  if (v1)
  {
    sub_21B186B10(v0 + 16);

    swift_task_dealloc();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_36_0();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 144);
    v7 = *(_QWORD *)(v0 + 152);
    v9 = *(_QWORD *)(v0 + 128);
    v10 = *(_QWORD *)(v0 + 136);
    v11 = *(_QWORD *)(v0 + 120);
    v12 = *(_QWORD *)(v0 + 80);
    type metadata accessor for Snippet();
    OUTLINED_FUNCTION_29_32(v7, 0);
    OUTLINED_FUNCTION_29_32(v8, 1);
    v13 = OUTLINED_FUNCTION_61_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v10, v12, v13);
    __swift_storeEnumTagSinglePayload(v10, 0, 1, v13);
    v14 = sub_21B36AC78();
    OUTLINED_FUNCTION_6_1(v9, v15, v16, v14);
    v17 = sub_21B368CBC();
    OUTLINED_FUNCTION_6_1(v11, v18, v19, v17);
    sub_21B368C20();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0C0);
    v20 = OUTLINED_FUNCTION_14_16();
    *(_OWORD *)(v20 + 16) = xmmword_21B36D370;
    *(_QWORD *)(v20 + 32) = v5;
    OUTLINED_FUNCTION_25_35();
    *(_QWORD *)(v0 + 200) = v23;
    v21 = v5;
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v22;
    *v22 = v0;
    v22[1] = sub_21B349888;
    return sub_21B34FF90(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 144), v23, 0, 0, *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112));
  }
}

uint64_t sub_21B349888()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  OUTLINED_FUNCTION_15_2();
  v10 = (uint64_t)(v0 + 2);
  v2 = v0[18];
  v1 = v0[19];
  v4 = v0[16];
  v3 = v0[17];
  v6 = v0[14];
  v5 = v0[15];
  v8 = v0[12];
  v7 = v0[13];
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_21B163F9C(v5, &qword_255142588);
  sub_21B163F9C(v4, (uint64_t *)&unk_25514D0A0);
  sub_21B163F9C(v3, &qword_2551420E8);
  sub_21B163F9C(v2, &qword_25514D0B0);
  sub_21B163F9C(v1, &qword_25514D0B0);
  sub_21B186B10(v10);
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B349978()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_36_0();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_46_7();
  return OUTLINED_FUNCTION_31_1(v1);
}

uint64_t sub_21B3499D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[16] = a5;
  v6[17] = v5;
  v6[14] = a3;
  v6[15] = a4;
  v6[12] = a1;
  v6[13] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  v6[18] = swift_task_alloc();
  v7 = sub_21B368F98();
  v6[19] = v7;
  v6[20] = *(_QWORD *)(v7 - 8);
  v6[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B349A64()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t inited;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v19;

  if (qword_2551411E0 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_9_0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)&unk_25517A6C8);
  sub_21B36B29C();
  v4 = OUTLINED_FUNCTION_29_1();
  if (OUTLINED_FUNCTION_19_1(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_2_18();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B15D000, v3, v0, "[CreateNote HandleIntentStrategy] Creating response for  first party", v5, 2u);
    OUTLINED_FUNCTION_3();
  }
  v6 = *(void **)(v1 + 112);

  OUTLINED_FUNCTION_0_6(v7, &qword_25514F2D0);
  *(_QWORD *)(v1 + 176) = __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21B36D370;
  *(_QWORD *)(inited + 32) = v6;
  OUTLINED_FUNCTION_25_35();
  v9 = v6;
  *(_QWORD *)(v1 + 184) = sub_21B3313CC(v19);
  sub_21B36B020();
  v11 = v10;
  if (v10)
  {
    sub_21B36AF3C();
    v11 = sub_21B1BBD74();
  }
  *(_QWORD *)(v1 + 192) = v11;
  v12 = objc_msgSend(*(id *)(v1 + 120), sel_groupName);
  v13 = v12;
  if (v12)

  v14 = v13 != 0;
  v15 = *(void **)(v1 + 112);
  type metadata accessor for NotebookNoteConcept(0);
  v16 = sub_21B34E9C0(v15);
  *(_QWORD *)(v1 + 200) = v16;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 208) = v17;
  *v17 = v1;
  v17[1] = sub_21B349C50;
  return sub_21B35DC2C(*(_QWORD *)(v1 + 168), v11, v14, v16);
}

uint64_t sub_21B349C50()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_15_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 216) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17_0();
  swift_release();
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B349CC0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t (*v10)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(void **)(v0 + 184);
  v12 = *(_QWORD *)(v0 + 168);
  v13 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 144);
  v14 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(uint64_t **)(v0 + 96);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 136) + 96), *(_QWORD *)(*(_QWORD *)(v0 + 136) + 120));
  sub_21B368BCC();
  v5 = OUTLINED_FUNCTION_14_16();
  *(_OWORD *)(v5 + 16) = xmmword_21B36D370;
  *(_QWORD *)(v5 + 32) = v1;
  sub_21B36B5C0();
  v6 = OUTLINED_FUNCTION_61_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v2, v3, v6);
  __swift_storeEnumTagSinglePayload(v2, 0, 1, v6);
  v7 = sub_21B3694E4();
  *(_OWORD *)(v0 + 72) = 0u;
  *(_QWORD *)(v0 + 88) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  v8 = MEMORY[0x24BE99088];
  v4[3] = v7;
  v4[4] = v8;
  __swift_allocate_boxed_opaque_existential_0(v4);
  v9 = v1;
  sub_21B368DC4();
  swift_bridgeObjectRelease();

  sub_21B163F9C(v0 + 56, &qword_2551420F0);
  sub_21B163F9C(v2, &qword_2551420E8);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_15_1();
  v10 = (uint64_t (*)(void))OUTLINED_FUNCTION_46_7();
  return v10();
}

uint64_t sub_21B349E60()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B349EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[11] = a5;
  v6[12] = v5;
  v6[9] = a3;
  v6[10] = a4;
  v6[7] = a1;
  v6[8] = a2;
  sub_21B368C44();
  v6[13] = OUTLINED_FUNCTION_23_1();
  v7 = sub_21B3692A4();
  v6[14] = v7;
  v6[15] = *(_QWORD *)(v7 - 8);
  v6[16] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B349F04()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  _QWORD *v33;
  char *v35;

  if (qword_2551411E0 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_9_0();
  v2 = (void *)__swift_project_value_buffer(v1, (uint64_t)&unk_25517A6C8);
  sub_21B36B29C();
  v3 = OUTLINED_FUNCTION_29_1();
  if (OUTLINED_FUNCTION_18_16(v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_2_18() = 0;
    OUTLINED_FUNCTION_3_28(&dword_21B15D000, v4, v5, "[CreateNote HandleIntentStrategy] Creating response for third party");
    OUTLINED_FUNCTION_3();
  }
  v6 = *(_QWORD *)(v0 + 64);
  v7 = *(void **)(v0 + 72);

  v8 = v7;
  swift_retain();
  v9 = sub_21B1EB424(v8, v6);
  v11 = v10;
  OUTLINED_FUNCTION_0_6(v9, (unint64_t *)&qword_255147140);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_17();
  v15 = sub_21B1A6A44(v12, v13, v14, 0, 0, 0, 0, 0, 0, 0, 0, 0, v9, v11);
  v16 = objc_msgSend(v15, sel__metadata);
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, sel_setBackgroundLaunch_, 0);

  }
  v18 = objc_msgSend(v15, sel__metadata);
  if (v18)
  {
    v19 = v18;
    sub_21B36B020();
    if (v20)
    {
      v21 = (void *)sub_21B36B434();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v19, sel_setLaunchId_, v21);

  }
  v22 = *(_QWORD *)(v0 + 96);
  v23 = *(void **)(v0 + 80);
  OUTLINED_FUNCTION_0_6((uint64_t)v18, (unint64_t *)&unk_255145490);
  v24 = (void *)sub_21B36B7A0();

  v25 = sub_21B36B7DC();
  v27 = v26;

  swift_bridgeObjectRelease();
  swift_release();
  *(_QWORD *)(v0 + 136) = v27;
  sub_21B167310(v22, v0 + 16);
  v28 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v29 = objc_msgSend(v23, sel_groupName);
  v30 = v29;
  if (v29)

  v31 = *v28;
  v35 = (char *)&dword_25514F920 + dword_25514F920;
  v32 = *(id *)(v0 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  v33 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v33;
  *v33 = v0;
  v33[1] = sub_21B34A1E0;
  return ((uint64_t (*)(BOOL, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))v35)(v30 != 0, v31, *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 64), v25, v27);
}

uint64_t sub_21B34A1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_11_1();
  *(_QWORD *)(v0 + 152) = v2;
  *(_QWORD *)(v0 + 160) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_32_1();
}

uint64_t sub_21B34A244()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[12];
  v2 = v0[11];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  sub_21B368C20();
  *(_QWORD *)(swift_task_alloc() + 16) = v2;
  sub_21B369220();
  OUTLINED_FUNCTION_18_1();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 64));
  v3 = (_QWORD *)swift_task_alloc();
  v0[21] = v3;
  *v3 = v0;
  v3[1] = sub_21B34A310;
  return sub_21B369034();
}

uint64_t sub_21B34A310()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_15_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 176) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B34A360()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_34_33();
  OUTLINED_FUNCTION_15_1();
  return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B34A3A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_18_1();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_46_7();
  return OUTLINED_FUNCTION_31_1(v4);
}

uint64_t sub_21B34A3F8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12_18();
  OUTLINED_FUNCTION_34_33();
  OUTLINED_FUNCTION_15_1();
  return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B34A43C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  unsigned __int8 v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D2F8);
  sub_21B369190();
  v11 = 1;
  v6 = sub_21B1633B4(&v11);
  swift_release();
  if ((v6 & 1) == 0)
    return static Snippet.createNote3p(note:record:)(a1, a2, (uint64_t)a3);
  v7 = sub_21B35F78C(a1);
  if (v8)
  {
    *a3 = v7;
    a3[1] = v8;
    type metadata accessor for Snippet();
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    sub_21B1644F8();
    swift_allocError();
    *(_QWORD *)v10 = 0xD000000000000017;
    *(_QWORD *)(v10 + 8) = 0x800000021B3957E0;
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)(v10 + 24) = 0;
    *(_BYTE *)(v10 + 32) = 3;
    return swift_willThrow();
  }
}

uint64_t sub_21B34A548(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21B368F44();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v5, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  return sub_21B36925C();
}

uint64_t sub_21B34A5EC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B16C55C;
  return sub_21B368638();
}

uint64_t sub_21B34A668()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B16C55C;
  return sub_21B368644();
}

uint64_t sub_21B34A6E4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B16C55C;
  return sub_21B368608();
}

uint64_t sub_21B34A760(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21B16C55C;
  return sub_21B348D54(a1, a2);
}

uint64_t sub_21B34A7C0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B16C55C;
  return sub_21B36862C();
}

uint64_t sub_21B34A83C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B16C55C;
  return sub_21B368620();
}

uint64_t sub_21B34A8B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B1672D0;
  return sub_21B3685FC();
}

unint64_t sub_21B34A938()
{
  unint64_t result;

  result = qword_255151888[0];
  if (!qword_255151888[0])
  {
    result = MEMORY[0x2207623FC](&unk_21B38C0C8, &_s20HandleIntentStrategyVN_1);
    atomic_store(result, qword_255151888);
  }
  return result;
}

uint64_t sub_21B34A974(uint64_t a1)
{
  uint64_t v1;

  return sub_21B34A548(a1, *(_QWORD *)(v1 + 16));
}

uint64_t OUTLINED_FUNCTION_11_52(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 24);
}

void OUTLINED_FUNCTION_13_48()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_14_46()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_25_35()
{
  return sub_21B36B5C0();
}

uint64_t OUTLINED_FUNCTION_29_32(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_34_35()
{
  return sub_21B369190();
}

uint64_t sub_21B34A9E4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  if (a1 >> 62)
    goto LABEL_17;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_34_2();
  for (; v2; v2 = sub_21B36BB30())
  {
    v3 = MEMORY[0x24BEE4AF8];
    v4 = 4;
    v14 = v2;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x220761AB4](v4 - 4, a1);
      else
        swift_retain();
      v5 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v6 = sub_21B369CC4();
      v8 = v7;
      swift_release();
      if (v8)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_19_26();
          sub_21B29C298();
          v3 = v11;
        }
        v9 = *(_QWORD *)(v3 + 16);
        if (v9 >= *(_QWORD *)(v3 + 24) >> 1)
        {
          sub_21B29C298();
          v3 = v12;
        }
        *(_QWORD *)(v3 + 16) = v9 + 1;
        v10 = v3 + 16 * v9;
        *(_QWORD *)(v10 + 32) = v6;
        *(_QWORD *)(v10 + 40) = v8;
        v2 = v14;
      }
      ++v4;
      if (v5 == v2)
        goto LABEL_19;
    }
    __break(1u);
LABEL_17:
    OUTLINED_FUNCTION_34_2();
  }
  v3 = MEMORY[0x24BEE4AF8];
LABEL_19:
  OUTLINED_FUNCTION_29_3();
  return v3;
}

uint64_t sub_21B34AB48(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v8 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_34_2();
  for (; v2; v2 = sub_21B36BB30())
  {
    for (i = 4; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x220761AB4](i - 4, a1);
      else
        OUTLINED_FUNCTION_4_15();
      v4 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      swift_getKeyPath();
      OUTLINED_FUNCTION_4_15();
      swift_getAtKeyPath();
      swift_release();
      v5 = swift_release_n();
      if (v7)
      {
        MEMORY[0x2207616A0](v5);
        if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_21B36B5D8();
        sub_21B36B5FC();
        sub_21B36B5C0();
      }
      if (v4 == v2)
      {
        OUTLINED_FUNCTION_29_3();
        return v8;
      }
    }
    __break(1u);
LABEL_15:
    OUTLINED_FUNCTION_34_2();
  }
  OUTLINED_FUNCTION_29_3();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_21B34ACD4()
{
  unint64_t v0;
  uint64_t v2;

  sub_21B369754();
  if (v2)
  {
    sub_21B369BD4();
    v0 = sub_21B369CDC();
    if (v0)
    {
      sub_21B34AB48(v0);
      OUTLINED_FUNCTION_7_9();
    }
  }
  OUTLINED_FUNCTION_63_1();
  return v2;
}

uint64_t sub_21B34AD7C@<X0>(_QWORD *a1@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  swift_retain();
  sub_21B369754();
  OUTLINED_FUNCTION_37_0();
  swift_retain();
  sub_21B36A150();
  OUTLINED_FUNCTION_37_0();
  if (v9)
  {
    swift_retain();
    v2 = sub_21B1972D8();
    OUTLINED_FUNCTION_63_1();
    if (v2 >> 62)
    {
LABEL_19:
      OUTLINED_FUNCTION_10_4();
      v3 = OUTLINED_FUNCTION_39_22();
      OUTLINED_FUNCTION_7_9();
      if (v3)
        goto LABEL_4;
    }
    else
    {
      v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v3)
      {
LABEL_4:
        v4 = 0;
        while (1)
        {
          if ((v2 & 0xC000000000000001) != 0)
          {
            OUTLINED_FUNCTION_10_4();
            OUTLINED_FUNCTION_49_20();
          }
          OUTLINED_FUNCTION_10_4();
          OUTLINED_FUNCTION_4_15();
          v5 = sub_21B369BD4();
          OUTLINED_FUNCTION_7_9();
          OUTLINED_FUNCTION_3_4();
          swift_release();
          if (v5)
            break;
          v6 = v4 + 1;
          if (__OFADD__(v4, 1))
            goto LABEL_18;
          ++v4;
          if (v6 == v3)
            goto LABEL_13;
        }
        if (v3 == v4)
          goto LABEL_13;
        sub_21B347CB8(v4, 1, v2);
        OUTLINED_FUNCTION_5_6();
        v7 = sub_21B369BD4();
        OUTLINED_FUNCTION_2_9();
        if (!v7)
        {
          __break(1u);
LABEL_18:
          __break(1u);
          goto LABEL_19;
        }
        goto LABEL_14;
      }
    }
LABEL_13:
    v7 = 0;
LABEL_14:
    OUTLINED_FUNCTION_7_9();
    goto LABEL_15;
  }
  v7 = 0;
LABEL_15:
  result = OUTLINED_FUNCTION_37_0();
  *a1 = v9;
  a1[1] = v9;
  a1[2] = 0;
  a1[3] = v7;
  a1[4] = 0;
  return result;
}

uint64_t sub_21B34AF20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  v2 = swift_retain();
  return sub_21B1DB39C(v2, 0, a1);
}

uint64_t sub_21B34AF4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  v2 = swift_retain();
  return sub_21B1DB39C(v2, 0, a1);
}

void sub_21B34AF78(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain();
  if ((sub_21B34E624(0, a2) & 1) == 0)
    sub_21B34E624(1, a2);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_21B34AFD4()
{
  uint64_t v0;
  unint64_t v1;
  char v3;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  if ((sub_21B34E624(0, v1) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v3 = sub_21B34E624(1, v1);
    swift_bridgeObjectRelease();
    if ((v3 & 1) != 0)
      return 2;
    else
      return 0;
  }
}

uint64_t sub_21B34B03C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  char *v26;
  BOOL v27;
  unsigned __int8 v28;
  _QWORD v30[2];
  uint64_t v31;
  char *v32;
  int v33;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  unsigned int v38;
  unint64_t v39;

  v2 = sub_21B369FAC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v32 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v30 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v30 - v15;
  if (a1)
  {
    v17 = sub_21B369BBC();
    LOBYTE(v18) = v17;
    if (v17)
    {
      v35 = v11;
      v30[1] = a1;
      v19 = sub_21B34AB48(v17);
      swift_bridgeObjectRelease();
      if (v19 >> 62)
        goto LABEL_28;
      v18 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v18; v18 = sub_21B36BB30())
      {
        v39 = v19 & 0xC000000000000001;
        v38 = *MEMORY[0x24BEA1800];
        v20 = 4;
        v36 = v18;
        v37 = v19;
        v31 = v5;
        v34 = v16;
        while (1)
        {
          if (v39)
            MEMORY[0x220761AB4](v20 - 4, v19);
          else
            swift_retain();
          v19 = v20 - 3;
          if (__OFADD__(v20 - 4, 1))
            break;
          if (sub_21B369AB4())
          {
            sub_21B369760();
            swift_release();
          }
          else
          {
            __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v2);
          }
          (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v14, v38, v2);
          __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v2);
          v21 = (uint64_t)&v7[*(int *)(v5 + 48)];
          sub_21B235088((uint64_t)v16, (uint64_t)v7);
          sub_21B235088((uint64_t)v14, v21);
          if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v2) == 1)
          {
            if (__swift_getEnumTagSinglePayload(v21, 1, v2) == 1)
            {
              sub_21B165410((uint64_t)v7, &qword_255147FD8);
              sub_21B165410((uint64_t)v14, &qword_255147FD8);
              sub_21B165410((uint64_t)v16, &qword_255147FD8);
              swift_release();
LABEL_24:
              LOBYTE(v18) = 1;
              goto LABEL_25;
            }
            goto LABEL_18;
          }
          v22 = (uint64_t)v35;
          sub_21B235088((uint64_t)v7, (uint64_t)v35);
          if (__swift_getEnumTagSinglePayload(v21, 1, v2) == 1)
          {
            (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v22, v2);
            v16 = v34;
LABEL_18:
            sub_21B165410((uint64_t)v7, &qword_255147FD0);
            sub_21B165410((uint64_t)v14, &qword_255147FD8);
            sub_21B165410((uint64_t)v16, &qword_255147FD8);
            swift_release();
            goto LABEL_20;
          }
          v23 = v32;
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v32, v21, v2);
          sub_21B2350D0();
          v33 = sub_21B36B428();
          v24 = v3;
          v25 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
          v25(v22, v2);
          v26 = v23;
          v5 = v31;
          v25((uint64_t)v26, v2);
          v3 = v24;
          sub_21B165410((uint64_t)v7, &qword_255147FD8);
          sub_21B165410((uint64_t)v14, &qword_255147FD8);
          v16 = v34;
          sub_21B165410((uint64_t)v34, &qword_255147FD8);
          swift_release();
          if ((v33 & 1) != 0)
            goto LABEL_24;
LABEL_20:
          ++v20;
          v27 = v19 == v36;
          v19 = v37;
          if (v27)
          {
            LOBYTE(v18) = 0;
            goto LABEL_25;
          }
        }
        __break(1u);
LABEL_28:
        swift_bridgeObjectRetain();
      }
LABEL_25:
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  sub_21B34BE08();
  return (v18 | v28) & 1;
}

uint64_t sub_21B34B498(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(uint64_t, uint64_t);
  char *v27;
  char v28;
  unsigned __int8 v29;
  _QWORD v31[2];
  uint64_t v32;
  char *v33;
  int v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;

  v6 = sub_21B369FAC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v33 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (uint64_t)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v31 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v40 = a4;
  if (a4)
  {
    v41 = (uint64_t)v31 - v19;
    if (v40 >> 62)
      goto LABEL_25;
    v20 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (; v20; v20 = sub_21B36BB30())
    {
      v36 = v15;
      v31[1] = a1;
      v39 = v40 & 0xC000000000000001;
      v38 = *MEMORY[0x24BEA1800];
      v15 = 4;
      v37 = v20;
      v32 = v9;
      v35 = v18;
      while (1)
      {
        if (v39)
        {
          a1 = MEMORY[0x220761AB4](v15 - 4, v40);
        }
        else
        {
          a1 = *(_QWORD *)(v40 + 8 * v15);
          swift_retain();
        }
        v21 = v15 - 3;
        if (__OFADD__(v15 - 4, 1))
          break;
        if (sub_21B369AB4())
        {
          v22 = v41;
          sub_21B369760();
          swift_release();
        }
        else
        {
          v22 = v41;
          __swift_storeEnumTagSinglePayload(v41, 1, 1, v6);
        }
        (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v18, v38, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v6);
        v23 = (uint64_t)&v11[*(int *)(v9 + 48)];
        sub_21B235088(v22, (uint64_t)v11);
        sub_21B235088((uint64_t)v18, v23);
        if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6) == 1)
        {
          if (__swift_getEnumTagSinglePayload(v23, 1, v6) == 1)
          {
            sub_21B165410((uint64_t)v11, &qword_255147FD8);
            sub_21B165410((uint64_t)v18, &qword_255147FD8);
            sub_21B165410(v41, &qword_255147FD8);
            swift_release();
LABEL_22:
            v28 = 1;
            goto LABEL_27;
          }
          goto LABEL_17;
        }
        v24 = v36;
        sub_21B235088((uint64_t)v11, v36);
        if (__swift_getEnumTagSinglePayload(v23, 1, v6) == 1)
        {
          (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v24, v6);
          v18 = v35;
LABEL_17:
          sub_21B165410((uint64_t)v11, &qword_255147FD0);
          sub_21B165410((uint64_t)v18, &qword_255147FD8);
          sub_21B165410(v41, &qword_255147FD8);
          swift_release();
          goto LABEL_19;
        }
        v25 = v33;
        (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v33, v23, v6);
        sub_21B2350D0();
        v34 = sub_21B36B428();
        v26 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
        v26(v24, v6);
        v27 = v25;
        v9 = v32;
        v26((uint64_t)v27, v6);
        sub_21B165410((uint64_t)v11, &qword_255147FD8);
        v18 = v35;
        sub_21B165410((uint64_t)v35, &qword_255147FD8);
        sub_21B165410(v41, &qword_255147FD8);
        swift_release();
        if ((v34 & 1) != 0)
          goto LABEL_22;
LABEL_19:
        ++v15;
        if (v21 == v37)
        {
          v28 = 0;
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_25:
      swift_bridgeObjectRetain_n();
    }
    v28 = 0;
LABEL_27:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v28 = 0;
  }
  sub_21B34CB60();
  return (v28 | v29) & 1;
}

uint64_t sub_21B34B8E0()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  char *v23;
  unsigned __int8 v24;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  int v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unint64_t v34;
  uint64_t v35;

  v1 = sub_21B369FAC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v28 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD0);
  MEMORY[0x24BDAC7A8](v35);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v26 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v26 - v13;
  v15 = *(_QWORD *)(v0 + 32);
  if (v15)
  {
    if (v15 >> 62)
      goto LABEL_26;
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    for (; v16; v16 = sub_21B36BB30())
    {
      v31 = v9;
      v26 = v0;
      v34 = v15 & 0xC000000000000001;
      v33 = *MEMORY[0x24BEA1800];
      v9 = 4;
      v32 = v16;
      v27 = v15;
      v30 = v14;
      while (1)
      {
        v0 = v9 - 4;
        if (v34)
          MEMORY[0x220761AB4](v9 - 4, v15);
        else
          swift_retain();
        v17 = v9 - 3;
        if (__OFADD__(v0, 1))
          break;
        if (sub_21B369AB4())
        {
          sub_21B369760();
          swift_release();
        }
        else
        {
          __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v1);
        }
        (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v12, v33, v1);
        __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v1);
        v18 = (uint64_t)&v5[*(int *)(v35 + 48)];
        sub_21B235088((uint64_t)v14, (uint64_t)v5);
        sub_21B235088((uint64_t)v12, v18);
        if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v1) == 1)
        {
          if (__swift_getEnumTagSinglePayload(v18, 1, v1) == 1)
          {
            sub_21B165410((uint64_t)v5, &qword_255147FD8);
            sub_21B165410((uint64_t)v12, &qword_255147FD8);
            sub_21B165410((uint64_t)v14, &qword_255147FD8);
            swift_release();
LABEL_22:
            LOBYTE(v16) = 1;
            goto LABEL_23;
          }
          goto LABEL_17;
        }
        v19 = v31;
        sub_21B235088((uint64_t)v5, v31);
        if (__swift_getEnumTagSinglePayload(v18, 1, v1) == 1)
        {
          (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v19, v1);
          v14 = v30;
LABEL_17:
          sub_21B165410((uint64_t)v5, &qword_255147FD0);
          sub_21B165410((uint64_t)v12, &qword_255147FD8);
          sub_21B165410((uint64_t)v14, &qword_255147FD8);
          swift_release();
          goto LABEL_19;
        }
        v20 = v28;
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v28, v18, v1);
        sub_21B2350D0();
        v29 = sub_21B36B428();
        v21 = v2;
        v22 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
        v22(v19, v1);
        v23 = v20;
        v15 = v27;
        v22((uint64_t)v23, v1);
        v2 = v21;
        sub_21B165410((uint64_t)v5, &qword_255147FD8);
        sub_21B165410((uint64_t)v12, &qword_255147FD8);
        v14 = v30;
        sub_21B165410((uint64_t)v30, &qword_255147FD8);
        swift_release();
        if ((v29 & 1) != 0)
          goto LABEL_22;
LABEL_19:
        ++v9;
        if (v17 == v32)
        {
          LOBYTE(v16) = 0;
          goto LABEL_23;
        }
      }
      __break(1u);
LABEL_26:
      swift_bridgeObjectRetain_n();
    }
LABEL_23:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    LOBYTE(v16) = 0;
  }
  sub_21B34C400();
  return (v16 | v24) & 1;
}

void sub_21B34BD0C(uint64_t a1)
{
  if (a1 && sub_21B369C10())
  {
    OUTLINED_FUNCTION_41_18();
    OUTLINED_FUNCTION_37_0();
  }
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_21B34BD58(uint64_t a1)
{
  uint64_t v1;

  if (a1 && sub_21B369C10())
  {
    v1 = sub_21B369EF8();
    OUTLINED_FUNCTION_3_4();
  }
  else
  {
    v1 = 0;
  }
  return sub_21B311B28(v1);
}

void sub_21B34BD9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1)
  {
    v1 = sub_21B369CC4();
    if (v2)
    {
      v3 = v1;
      v4 = v2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255141E10);
      v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_21B36D150;
      *(_QWORD *)(v5 + 32) = v3;
      *(_QWORD *)(v5 + 40) = v4;
    }
    OUTLINED_FUNCTION_0();
  }
}

void sub_21B34BE08()
{
  uint64_t v0;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;

  v1 = OUTLINED_FUNCTION_31_31();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD8);
  OUTLINED_FUNCTION_4_1();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v21 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v21 - v16;
  if (v0 && sub_21B369AB4())
  {
    sub_21B369760();
    OUTLINED_FUNCTION_3_4();
  }
  else
  {
    OUTLINED_FUNCTION_67_1((uint64_t)v17, 1);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v15, *MEMORY[0x24BEA1800], v1);
  OUTLINED_FUNCTION_67_1((uint64_t)v15, 0);
  v18 = (uint64_t)&v8[*(int *)(v5 + 48)];
  sub_21B235088((uint64_t)v17, (uint64_t)v8);
  sub_21B235088((uint64_t)v15, v18);
  OUTLINED_FUNCTION_2_10((uint64_t)v8);
  if (v19)
  {
    sub_21B165410((uint64_t)v15, &qword_255147FD8);
    sub_21B165410((uint64_t)v17, &qword_255147FD8);
    OUTLINED_FUNCTION_2_10(v18);
  }
  else
  {
    sub_21B235088((uint64_t)v8, (uint64_t)v12);
    OUTLINED_FUNCTION_2_10(v18);
    if (v19)
    {
      OUTLINED_FUNCTION_11_20((uint64_t)v15);
      OUTLINED_FUNCTION_11_20((uint64_t)v17);
      (*(void (**)(char *, uint64_t))(v2 + 8))(v12, v1);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v4, v18, v1);
      sub_21B2350D0();
      sub_21B36B428();
      v20 = *(void (**)(char *, uint64_t))(v2 + 8);
      v20(v4, v1);
      OUTLINED_FUNCTION_37_26((uint64_t)v15);
      OUTLINED_FUNCTION_37_26((uint64_t)v17);
      v20(v12, v1);
    }
  }
  OUTLINED_FUNCTION_37_26((uint64_t)v8);
  OUTLINED_FUNCTION_20_0();
}

void sub_21B34C07C()
{
  uint64_t *v0;

  sub_21B34BD0C(*v0);
}

uint64_t sub_21B34C084()
{
  uint64_t *v0;

  return sub_21B34BD58(*v0);
}

void sub_21B34C08C()
{
  uint64_t *v0;

  sub_21B34BD9C(*v0);
}

uint64_t sub_21B34C094@<X0>(uint64_t *a1@<X8>)
{
  return sub_21B34AF20(a1);
}

void sub_21B34C0B0()
{
  uint64_t v0;

  sub_21B34AF78(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
}

uint64_t sub_21B34C0CC(uint64_t a1, uint64_t a2)
{
  return sub_21B34CEC0(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_21B34B03C);
}

uint64_t sub_21B34C0D8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21B34C0E0()
{
  return sub_21B162D14();
}

void sub_21B34C0EC()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 8))
  {
    sub_21B369B2C();
    if (!v1)
    {
      if (sub_21B369EF8())
      {
        sub_21B369C1C();
        OUTLINED_FUNCTION_3_4();
      }
    }
  }
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_21B34C150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_21B34D2DC(v0 + 8, (uint64_t)&v3);
  sub_21B34D2DC((uint64_t)&v3, (uint64_t)&v4);
  if (v4)
    v1 = sub_21B369EF8();
  else
    v1 = 0;
  return sub_21B311B28(v1);
}

uint64_t sub_21B34C1A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _BYTE v4[8];
  uint64_t v5;

  sub_21B34D2DC(v1, (uint64_t)v4);
  sub_21B34D2DC((uint64_t)v4, (uint64_t)&v5);
  if (!v5)
    return MEMORY[0x24BEE4AF8];
  v2 = sub_21B1972D8();
  OUTLINED_FUNCTION_12_50(v2);
  OUTLINED_FUNCTION_8_37();
  return v0;
}

uint64_t sub_21B34C204()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  _BYTE v29[8];
  uint64_t v30;

  sub_21B34D2DC(v0 + 8, (uint64_t)v29);
  sub_21B34D2DC((uint64_t)v29, (uint64_t)&v30);
  if (!v30)
    return 0;
  v1 = sub_21B369E68();
  if (!v1)
    return 0;
  v2 = v1;
  swift_getKeyPath();
  if (v2 >> 62)
    goto LABEL_23;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_4();
  for (; v3; v3 = sub_21B36BB30())
  {
    v4 = MEMORY[0x24BEE4AF8];
    v5 = 4;
    v6 = MEMORY[0x24BE930B8];
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_36_25();
      v7 = *(_QWORD *)(v2 + 8 * v5);
      OUTLINED_FUNCTION_5_6();
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      *(_QWORD *)&v28 = v7;
      OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_26_32();
      OUTLINED_FUNCTION_2_9();
      if (v23)
      {
        *((_QWORD *)&v26 + 1) = sub_21B369C28();
        v27 = v6;
        *(_QWORD *)&v25 = v23;
      }
      else
      {
        v27 = 0;
        v25 = 0u;
        v26 = 0u;
      }
      OUTLINED_FUNCTION_2_9();
      if (*((_QWORD *)&v26 + 1))
      {
        v9 = sub_21B171D88(&v25, (uint64_t)&v28);
        OUTLINED_FUNCTION_47_16(v9, v10, v11, v12, v13, v14, v15, v16, v21, v23, v25, *((uint64_t *)&v25 + 1), v26, *((uint64_t *)&v26 + 1), v27, v28);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_19_26();
          sub_21B29C484();
          v4 = v18;
        }
        v17 = *(_QWORD *)(v4 + 16);
        if (v17 >= *(_QWORD *)(v4 + 24) >> 1)
        {
          sub_21B29C484();
          v4 = v19;
        }
        *(_QWORD *)(v4 + 16) = v17 + 1;
        OUTLINED_FUNCTION_45_24(v4 + 40 * v17, v22, v24, v25);
      }
      else
      {
        sub_21B165410((uint64_t)&v25, &qword_255148220);
      }
      ++v5;
      if (v8 == v3)
        goto LABEL_25;
    }
    __break(1u);
LABEL_23:
    OUTLINED_FUNCTION_4_15();
    OUTLINED_FUNCTION_4();
  }
  v4 = MEMORY[0x24BEE4AF8];
LABEL_25:
  OUTLINED_FUNCTION_71_0();
  swift_release_n();
  return v4;
}

void sub_21B34C400()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int v32;
  unint64_t v33;
  char v34[8];
  uint64_t v35;

  v4 = sub_21B369FAC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_2();
  v26 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_65_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_15_43();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_14_32();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - v12;
  sub_21B34D2DC(v0, (uint64_t)v34);
  sub_21B34D2DC((uint64_t)v34, (uint64_t)&v35);
  if (v35)
  {
    v14 = sub_21B1972D8();
    v15 = v14;
    if (v14 >> 62)
      goto LABEL_29;
    v16 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v16; v16 = OUTLINED_FUNCTION_39_22())
    {
      v29 = v2;
      v33 = v15 & 0xC000000000000001;
      v32 = *MEMORY[0x24BEA1800];
      v2 = 4;
      v30 = v16;
      v31 = v15;
      v25 = v7;
      v28 = v13;
      while (1)
      {
        if (v33)
        {
          v17 = MEMORY[0x220761AB4](v2 - 4, v15);
        }
        else
        {
          v17 = *(_QWORD *)(v15 + 8 * v2);
          swift_retain();
        }
        v15 = v2 - 3;
        if (__OFADD__(v2 - 4, 1))
          break;
        if (sub_21B369AB4())
        {
          OUTLINED_FUNCTION_32_30();
          OUTLINED_FUNCTION_3_4();
        }
        else
        {
          OUTLINED_FUNCTION_13_49();
        }
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v3, v32, v4);
        OUTLINED_FUNCTION_5_70();
        OUTLINED_FUNCTION_35_25();
        OUTLINED_FUNCTION_1_44(v1);
        if (v19)
        {
          OUTLINED_FUNCTION_1_44(v17);
          if (v19)
          {
            OUTLINED_FUNCTION_12_29(v1);
            OUTLINED_FUNCTION_12_29(v3);
            OUTLINED_FUNCTION_12_29((uint64_t)v13);
            OUTLINED_FUNCTION_2_39();
            goto LABEL_26;
          }
          goto LABEL_20;
        }
        v18 = v29;
        sub_21B235088(v1, v29);
        OUTLINED_FUNCTION_1_44(v17);
        if (v19)
        {
          OUTLINED_FUNCTION_40_24(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
          v13 = v28;
LABEL_20:
          sub_21B165410(v1, &qword_255147FD0);
          OUTLINED_FUNCTION_11_20(v3);
          OUTLINED_FUNCTION_11_20((uint64_t)v13);
          OUTLINED_FUNCTION_2_39();
          goto LABEL_22;
        }
        v20 = v26;
        OUTLINED_FUNCTION_27_30(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
        sub_21B2350D0();
        v27 = OUTLINED_FUNCTION_11_53();
        v21 = v5;
        v22 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
        v22(v18, v4);
        v23 = v20;
        v7 = v25;
        v22(v23, v4);
        v5 = v21;
        OUTLINED_FUNCTION_11_20(v1);
        OUTLINED_FUNCTION_11_20(v3);
        v13 = v28;
        OUTLINED_FUNCTION_11_20((uint64_t)v28);
        OUTLINED_FUNCTION_2_39();
        if ((v27 & 1) != 0)
          goto LABEL_26;
LABEL_22:
        ++v2;
        v19 = v15 == v30;
        v15 = v31;
        if (v19)
          goto LABEL_26;
      }
      __break(1u);
LABEL_29:
      swift_bridgeObjectRetain();
    }
LABEL_26:
    OUTLINED_FUNCTION_71_0();
  }
  OUTLINED_FUNCTION_20_0();
}

uint64_t sub_21B34C710()
{
  return sub_21B34C150();
}

uint64_t sub_21B34C748()
{
  return sub_21B34C1A0();
}

uint64_t sub_21B34C780@<X0>(uint64_t *a1@<X8>)
{
  return sub_21B34AF4C(a1);
}

uint64_t sub_21B34C7B8()
{
  return sub_21B34AFD4();
}

uint64_t sub_21B34C7F0()
{
  return sub_21B34B8E0();
}

uint64_t sub_21B34C82C()
{
  return sub_21B34C204();
}

uint64_t sub_21B34C864()
{
  return sub_21B162D14() & 1;
}

void sub_21B34C8A0(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    OUTLINED_FUNCTION_41_18();
    if (!v1)
    {
      if (sub_21B369EF8())
      {
        sub_21B369C1C();
        OUTLINED_FUNCTION_37_0();
      }
    }
  }
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_21B34C908(uint64_t a1)
{
  if (a1)
    a1 = sub_21B369EF8();
  return sub_21B311B28(a1);
}

uint64_t sub_21B34C92C(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;

  if (!a1)
    return MEMORY[0x24BEE4AF8];
  v2 = sub_21B19727C();
  OUTLINED_FUNCTION_12_50(v2);
  OUTLINED_FUNCTION_8_37();
  return v1;
}

uint64_t sub_21B34C978(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;

  if (!a1)
    return 0;
  v1 = sub_21B369E68();
  if (!v1)
    return 0;
  v2 = v1;
  swift_getKeyPath();
  if (v2 >> 62)
    goto LABEL_23;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_4();
  for (; v3; v3 = sub_21B36BB30())
  {
    v4 = MEMORY[0x24BEE4AF8];
    v5 = 4;
    v6 = MEMORY[0x24BE930B8];
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_36_25();
      v7 = *(_QWORD *)(v2 + 8 * v5);
      OUTLINED_FUNCTION_5_6();
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      *(_QWORD *)&v28 = v7;
      OUTLINED_FUNCTION_5_6();
      OUTLINED_FUNCTION_26_32();
      OUTLINED_FUNCTION_2_9();
      if (v23)
      {
        *((_QWORD *)&v26 + 1) = sub_21B369C28();
        v27 = v6;
        *(_QWORD *)&v25 = v23;
      }
      else
      {
        v27 = 0;
        v25 = 0u;
        v26 = 0u;
      }
      OUTLINED_FUNCTION_2_9();
      if (*((_QWORD *)&v26 + 1))
      {
        v9 = sub_21B171D88(&v25, (uint64_t)&v28);
        OUTLINED_FUNCTION_47_16(v9, v10, v11, v12, v13, v14, v15, v16, v21, v23, v25, *((uint64_t *)&v25 + 1), v26, *((uint64_t *)&v26 + 1), v27, v28);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_19_26();
          sub_21B29C484();
          v4 = v18;
        }
        v17 = *(_QWORD *)(v4 + 16);
        if (v17 >= *(_QWORD *)(v4 + 24) >> 1)
        {
          sub_21B29C484();
          v4 = v19;
        }
        *(_QWORD *)(v4 + 16) = v17 + 1;
        OUTLINED_FUNCTION_45_24(v4 + 40 * v17, v22, v24, v25);
      }
      else
      {
        sub_21B165410((uint64_t)&v25, &qword_255148220);
      }
      ++v5;
      if (v8 == v3)
      {
        OUTLINED_FUNCTION_3_4();
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_23:
    OUTLINED_FUNCTION_4_15();
    OUTLINED_FUNCTION_4();
  }
  OUTLINED_FUNCTION_3_4();
  v4 = MEMORY[0x24BEE4AF8];
LABEL_25:
  OUTLINED_FUNCTION_71_0();
  OUTLINED_FUNCTION_3_4();
  return v4;
}

void sub_21B34CB60()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;

  v4 = OUTLINED_FUNCTION_31_31();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_2();
  v25 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_65_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255147FD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_15_43();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_14_32();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - v12;
  if (v0)
  {
    v14 = sub_21B19727C();
    if (v14 >> 62)
      goto LABEL_29;
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_34_2();
    for (; v15; v15 = OUTLINED_FUNCTION_39_22())
    {
      v28 = v2;
      v32 = v14 & 0xC000000000000001;
      v31 = *MEMORY[0x24BEA1800];
      v2 = 4;
      v29 = v15;
      v30 = v14;
      v24 = v7;
      v27 = v13;
      while (1)
      {
        if (v32)
        {
          v16 = MEMORY[0x220761AB4](v2 - 4, v14);
        }
        else
        {
          v16 = *(_QWORD *)(v14 + 8 * v2);
          swift_retain();
        }
        v14 = v2 - 3;
        if (__OFADD__(v2 - 4, 1))
          break;
        if (sub_21B369AB4())
        {
          OUTLINED_FUNCTION_32_30();
          OUTLINED_FUNCTION_3_4();
        }
        else
        {
          OUTLINED_FUNCTION_13_49();
        }
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v3, v31, v4);
        OUTLINED_FUNCTION_5_70();
        OUTLINED_FUNCTION_35_25();
        OUTLINED_FUNCTION_1_44(v1);
        if (v18)
        {
          OUTLINED_FUNCTION_1_44(v16);
          if (v18)
          {
            OUTLINED_FUNCTION_12_29(v1);
            OUTLINED_FUNCTION_12_29(v3);
            OUTLINED_FUNCTION_12_29((uint64_t)v13);
            OUTLINED_FUNCTION_2_39();
            goto LABEL_26;
          }
          goto LABEL_20;
        }
        v17 = v28;
        sub_21B235088(v1, v28);
        OUTLINED_FUNCTION_1_44(v16);
        if (v18)
        {
          OUTLINED_FUNCTION_40_24(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
          v13 = v27;
LABEL_20:
          sub_21B165410(v1, &qword_255147FD0);
          OUTLINED_FUNCTION_11_20(v3);
          OUTLINED_FUNCTION_11_20((uint64_t)v13);
          OUTLINED_FUNCTION_2_39();
          goto LABEL_22;
        }
        v19 = v25;
        OUTLINED_FUNCTION_27_30(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
        sub_21B2350D0();
        v26 = OUTLINED_FUNCTION_11_53();
        v20 = v5;
        v21 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
        v21(v17, v4);
        v22 = v19;
        v7 = v24;
        v21(v22, v4);
        v5 = v20;
        OUTLINED_FUNCTION_11_20(v1);
        OUTLINED_FUNCTION_11_20(v3);
        v13 = v27;
        OUTLINED_FUNCTION_11_20((uint64_t)v27);
        OUTLINED_FUNCTION_2_39();
        if ((v26 & 1) != 0)
          goto LABEL_26;
LABEL_22:
        ++v2;
        v18 = v14 == v29;
        v14 = v30;
        if (v18)
          goto LABEL_26;
      }
      __break(1u);
LABEL_29:
      OUTLINED_FUNCTION_34_2();
    }
LABEL_26:
    OUTLINED_FUNCTION_71_0();
  }
  OUTLINED_FUNCTION_20_0();
}

BOOL sub_21B34CE44(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  if (a1)
  {
    v2 = sub_21B19727C();
    OUTLINED_FUNCTION_12_50(v2);
    OUTLINED_FUNCTION_8_37();
  }
  else
  {
    v1 = MEMORY[0x24BEE4AF8];
  }
  v3 = *(_QWORD *)(v1 + 16);
  OUTLINED_FUNCTION_6_2();
  return v3 == 0;
}

void sub_21B34CE9C()
{
  uint64_t *v0;

  sub_21B34C8A0(*v0);
}

uint64_t sub_21B34CEA4()
{
  uint64_t *v0;

  return sub_21B34C908(*v0);
}

uint64_t sub_21B34CEAC()
{
  uint64_t *v0;

  return sub_21B34C92C(*v0);
}

uint64_t sub_21B34CEB4(uint64_t a1, uint64_t a2)
{
  return sub_21B34CEC0(a1, a2, sub_21B34B498);
}

uint64_t sub_21B34CEC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(*v3, v3[1], v3[2], v3[3]);
}

uint64_t sub_21B34CEE4()
{
  uint64_t *v0;

  return sub_21B34C978(*v0);
}

BOOL sub_21B34CEEC()
{
  uint64_t *v0;

  return sub_21B34CE44(*v0);
}

void type metadata accessor for AddTasksReminderIntentModelNLv4()
{
  OUTLINED_FUNCTION_173();
}

uint64_t sub_21B34CF18()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21B34CF58(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_21B34CFC4(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21B34D068(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for AddTasksUpdateReminderListIntentModelNLv4()
{
  OUTLINED_FUNCTION_173();
}

uint64_t sub_21B34D0D8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_21B34D110(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  v3 = a2[3];
  a1[2] = a2[2];
  a1[3] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_4_7();
}

void sub_21B34D158(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  OUTLINED_FUNCTION_37_0();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  OUTLINED_FUNCTION_37_0();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_7();
}

void sub_21B34D1D4(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_21B34D224(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21B34D278(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

void type metadata accessor for AddTasksCreateReminderListIntentModelNLv4()
{
  OUTLINED_FUNCTION_173();
}

uint64_t sub_21B34D2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255143350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_storeEnumTagSinglePayload(v2, 0, 1, v0);
  return sub_21B235088(v3, v1);
}

uint64_t OUTLINED_FUNCTION_11_53()
{
  return sub_21B36B428();
}

uint64_t OUTLINED_FUNCTION_12_50(unint64_t a1)
{
  return sub_21B34A9E4(a1);
}

uint64_t OUTLINED_FUNCTION_13_49()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_26_32()
{
  return swift_getAtKeyPath();
}

uint64_t OUTLINED_FUNCTION_27_30@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_31_31()
{
  return sub_21B369FAC();
}

uint64_t OUTLINED_FUNCTION_32_30()
{
  return sub_21B369760();
}

uint64_t OUTLINED_FUNCTION_35_25()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21B235088(v1, v0);
}

void OUTLINED_FUNCTION_36_25()
{
  JUMPOUT(0x220761AB4);
}

void OUTLINED_FUNCTION_37_26(uint64_t a1)
{
  uint64_t *v1;

  sub_21B165410(a1, v1);
}

uint64_t OUTLINED_FUNCTION_39_22()
{
  return sub_21B36BB30();
}

uint64_t OUTLINED_FUNCTION_40_24@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_41_18()
{
  return sub_21B369B2C();
}

uint64_t OUTLINED_FUNCTION_45_24@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, __int128 a4)
{
  return sub_21B171D88(&a4, a1 + 32);
}

uint64_t OUTLINED_FUNCTION_47_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, __int128 a16)
{
  return sub_21B171D88(&a16, (uint64_t)&a11);
}

void OUTLINED_FUNCTION_49_20()
{
  JUMPOUT(0x220761AB4);
}

uint64_t type metadata accessor for NotebookReadingCATsSimple()
{
  uint64_t result;

  result = qword_2551518E8;
  if (!qword_2551518E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21B34D48C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21B34D4C8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B32F438;
  return OUTLINED_FUNCTION_22_32(0xD000000000000019, 0x800000021B395900, MEMORY[0x24BEE4AF8], v3);
}

uint64_t sub_21B34D528()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B238690;
  v2 = OUTLINED_FUNCTION_12_51();
  return OUTLINED_FUNCTION_22_32(v2, v3, v4, v5);
}

uint64_t sub_21B34D57C()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B32F438;
  v2 = OUTLINED_FUNCTION_12_51();
  return OUTLINED_FUNCTION_22_32(v2, v3, v4, v5);
}

uint64_t sub_21B34D5D0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 72) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0D0);
  *(_QWORD *)(v4 + 40) = swift_task_alloc();
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B34D630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int EnumTagSinglePayload;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t (*v15)(void);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v3 = OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v0 + 48) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_21B3705A0;
  v4 = (uint64_t *)(v3 + 48);
  *(_QWORD *)(v3 + 32) = 0x6C7469547473696CLL;
  *(_QWORD *)(v3 + 40) = 0xE900000000000065;
  sub_21B163F58(v2, v1, (uint64_t *)&unk_25514D0D0);
  v5 = sub_21B36AF60();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v5);
  v7 = *(_QWORD *)(v0 + 40);
  if (EnumTagSinglePayload == 1)
  {
    sub_21B163F9C(*(_QWORD *)(v0 + 40), (uint64_t *)&unk_25514D0D0);
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
  }
  else
  {
    *(_QWORD *)(v3 + 72) = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v4);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(boxed_opaque_existential_0, v7, v5);
  }
  v9 = *(_BYTE *)(v0 + 72);
  *(_QWORD *)(v3 + 80) = 0x6E756F436B736174;
  *(_QWORD *)(v3 + 88) = 0xE900000000000074;
  if ((v9 & 1) != 0)
  {
    v11 = 0;
    v10 = 0;
    *(_QWORD *)(v3 + 104) = 0;
    *(_QWORD *)(v3 + 112) = 0;
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 24);
    v11 = MEMORY[0x24BEE13C8];
  }
  *(_QWORD *)(v3 + 120) = v11;
  *(_QWORD *)(v3 + 96) = v10;
  v12 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 56) = v12;
  *v12 = v0;
  v12[1] = sub_21B34D7A4;
  OUTLINED_FUNCTION_12();
  return OUTLINED_FUNCTION_3_19(0xD000000000000024, v13, v3, v15);
}

uint64_t sub_21B34D7A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 64) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_0_3();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_1_2(a1, *(uint64_t (**)(void))(v4 + 8));
  }
}

uint64_t sub_21B34D81C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B34D82C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(void);

  v1 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v2 = OUTLINED_FUNCTION_6_5();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_21B36D150;
  *(_QWORD *)(v2 + 32) = 1702129518;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  v3 = 0;
  if (v1)
  {
    v3 = type metadata accessor for NotebookNoteConcept(0);
  }
  else
  {
    *(_QWORD *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 64) = 0;
  }
  *(_QWORD *)(v2 + 48) = v1;
  *(_QWORD *)(v2 + 72) = v3;
  OUTLINED_FUNCTION_4_9();
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_21B34D8F0;
  OUTLINED_FUNCTION_12();
  return OUTLINED_FUNCTION_3_19(0xD000000000000018, v5, v2, v7);
}

uint64_t sub_21B34D8F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_3_1();
  if (v1)
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_0_3();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_1_2(v0, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_21B34D93C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B34D94C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t (*v7)(void);

  v1 = v0[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v2 = OUTLINED_FUNCTION_6_5();
  v0[4] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_21B36D150;
  *(_QWORD *)(v2 + 32) = 1802723700;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  v3 = 0;
  if (v1)
  {
    v3 = type metadata accessor for NotebookReminderConcept(0);
  }
  else
  {
    *(_QWORD *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 64) = 0;
  }
  *(_QWORD *)(v2 + 48) = v1;
  *(_QWORD *)(v2 + 72) = v3;
  OUTLINED_FUNCTION_4_9();
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_21B1B31DC;
  OUTLINED_FUNCTION_12();
  return OUTLINED_FUNCTION_3_19(0xD00000000000001CLL, v5, v2, v7);
}

uint64_t sub_21B34DA10()
{
  return type metadata accessor for NotebookReadingCATsSimple();
}

unint64_t OUTLINED_FUNCTION_12_51()
{
  return 0xD00000000000002ALL;
}

uint64_t destroy for NotesUnsupportedOnDeviceStrategy(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  switch(*(_BYTE *)(a1 + 96))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
      __swift_destroy_boxed_opaque_existential_1(a1 + 40);
      break;
    case 5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    default:
      break;
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 144);
}

uint64_t initializeWithCopy for NotesUnsupportedOnDeviceStrategy(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  _OWORD *v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = (_OWORD *)(a1 + 40);
  v6 = (_OWORD *)(a2 + 40);
  switch(*(_BYTE *)(a2 + 96))
  {
    case 0:
      v7 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 64) = v7;
      (**(void (***)(_OWORD *, _OWORD *))(v7 - 8))(v5, v6);
      *(_BYTE *)(a1 + 96) = 0;
      break;
    case 1:
      v9 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 64) = v9;
      (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v5, v6);
      v10 = 1;
      goto LABEL_10;
    case 2:
      v11 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 64) = v11;
      (**(void (***)(_OWORD *, _OWORD *))(v11 - 8))(v5, v6);
      v10 = 2;
      goto LABEL_10;
    case 3:
      v12 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 64) = v12;
      (**(void (***)(_OWORD *, _OWORD *))(v12 - 8))(v5, v6);
      v10 = 3;
      goto LABEL_10;
    case 4:
      v13 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 64) = v13;
      (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v5, v6);
      v10 = 4;
      goto LABEL_10;
    case 5:
      v14 = *(_QWORD *)(a2 + 48);
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = v14;
      *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_BYTE *)(a1 + 96) = 5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 6:
      v15 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 64) = v15;
      (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v5, v6);
      v10 = 6;
LABEL_10:
      *(_BYTE *)(a1 + 96) = v10;
      break;
    default:
      v8 = *(_OWORD *)(a2 + 56);
      *v5 = *v6;
      *(_OWORD *)(a1 + 56) = v8;
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 81) = *(_OWORD *)(a2 + 81);
      break;
  }
  v16 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 104, a2 + 104);
  v17 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 168) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 144, a2 + 144);
  return a1;
}

uint64_t assignWithCopy for NotesUnsupportedOnDeviceStrategy(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  if (a1 != a2)
  {
    sub_21B1700E0(a1 + 40);
    switch(*(_BYTE *)(a2 + 96))
    {
      case 0:
        v4 = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 64) = v4;
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 40, a2 + 40);
        *(_BYTE *)(a1 + 96) = 0;
        break;
      case 1:
        v8 = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 64) = v8;
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 40, a2 + 40);
        v9 = 1;
        goto LABEL_11;
      case 2:
        v10 = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 64) = v10;
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 40, a2 + 40);
        v9 = 2;
        goto LABEL_11;
      case 3:
        v11 = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 64) = v11;
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 40, a2 + 40);
        v9 = 3;
        goto LABEL_11;
      case 4:
        v12 = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 64) = v12;
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 40, a2 + 40);
        v9 = 4;
        goto LABEL_11;
      case 5:
        *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
        *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
        *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
        *(_BYTE *)(a1 + 96) = 5;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 6:
        v13 = *(_QWORD *)(a2 + 64);
        *(_QWORD *)(a1 + 64) = v13;
        *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 40, a2 + 40);
        v9 = 6;
LABEL_11:
        *(_BYTE *)(a1 + 96) = v9;
        break;
      default:
        v5 = *(_OWORD *)(a2 + 40);
        v6 = *(_OWORD *)(a2 + 56);
        v7 = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a1 + 81) = *(_OWORD *)(a2 + 81);
        *(_OWORD *)(a1 + 56) = v6;
        *(_OWORD *)(a1 + 72) = v7;
        *(_OWORD *)(a1 + 40) = v5;
        break;
    }
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 144), (uint64_t *)(a2 + 144));
  return a1;
}

uint64_t assignWithTake for NotesUnsupportedOnDeviceStrategy(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  if (a1 != a2)
  {
    sub_21B1700E0(a1 + 40);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 81) = *(_OWORD *)(a2 + 81);
  }
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  v5 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v5;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  return a1;
}

uint64_t getEnumTagSinglePayload for NotesUnsupportedOnDeviceStrategy(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 184))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NotesUnsupportedOnDeviceStrategy(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 184) = 1;
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
    *(_BYTE *)(result + 184) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NotesUnsupportedOnDeviceStrategy()
{
  return &type metadata for NotesUnsupportedOnDeviceStrategy;
}

uint64_t sub_21B34DFB8()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  char v3;
  _BYTE v5[40];
  uint64_t v6;

  v1 = (uint64_t)v0;
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  v2 = sub_21B368BE4();
  sub_21B1BECCC(v1, (uint64_t)v5);
  if ((v2 & 1) != 0)
    v3 = sub_21B34E03C((uint64_t)&v6);
  else
    v3 = 0;
  sub_21B1BED3C((uint64_t)v5);
  return v3 & 1;
}

uint64_t sub_21B34E03C(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12[8];
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  __int128 v17[3];
  char v18;

  sub_21B1700A4(a1, (uint64_t)v17);
  if (v18 == 3)
  {
    sub_21B171D88(v17, (uint64_t)v14);
    v3 = v15;
    v4 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else if (v18 == 2)
  {
    sub_21B1700E0((uint64_t)v17);
    v2 = 1;
  }
  else
  {
    if (qword_2551411E0 != -1)
      swift_once();
    v5 = sub_21B36B2B4();
    __swift_project_value_buffer(v5, (uint64_t)&unk_25517A6C8);
    sub_21B1700A4(a1, (uint64_t)v14);
    v6 = sub_21B36B29C();
    v7 = sub_21B36B71C();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_DWORD *)v8 = 136315138;
      sub_21B1700A4((uint64_t)v14, (uint64_t)v12);
      v9 = sub_21B36B47C();
      v12[0] = sub_21B196024(v9, v10, &v13);
      sub_21B36B818();
      swift_bridgeObjectRelease();
      sub_21B1700E0((uint64_t)v14);
      _os_log_impl(&dword_21B15D000, v6, v7, "[NotesUnsupportedOnWatchStrategy] unexpected task of %s, this is likely a good indication that this guard flow is not needed for the current task.", v8, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
    }
    sub_21B1700E0((uint64_t)v14);

    sub_21B1700E0((uint64_t)v17);
    v2 = 0;
  }
  return v2 & 1;
}

uint64_t sub_21B34E254(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  sub_21B368C44();
  v2[4] = OUTLINED_FUNCTION_23_1();
  v3 = sub_21B3692A4();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = OUTLINED_FUNCTION_23_1();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B34E2B4()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 24) + 104), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 128));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_21B34E30C;
  return sub_21B1B0C14();
}

uint64_t sub_21B34E30C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_21B34E390()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 24);
  sub_21B368C20();
  sub_21B369220();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 144), *(_QWORD *)(v1 + 168));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *v2 = v0;
  v2[1] = sub_21B34E434;
  return sub_21B369034();
}

uint64_t sub_21B34E434()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B34E490()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);

  OUTLINED_FUNCTION_4_64(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B34E4E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);

  OUTLINED_FUNCTION_4_64(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B34E54C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B1F2A74;
  return sub_21B34E254(a1);
}

uint64_t OUTLINED_FUNCTION_4_64@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t type metadata accessor for NotebookSuggestionsCATs()
{
  uint64_t result;

  result = qword_253DF2600;
  if (!qword_253DF2600)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21B34E5E0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21B34E61C()
{
  return type metadata accessor for NotebookSuggestionsCATs();
}

uint64_t sub_21B34E624(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v10;

  if (a2)
    v3 = a2;
  else
    v3 = MEMORY[0x24BEE4AF8];
  if (v3 >> 62)
    goto LABEL_16;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_21B36BB30())
  {
    v5 = 4;
    while (1)
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x220761AB4](v5 - 4, v3);
      }
      else
      {
        v6 = *(_QWORD *)(v3 + 8 * v5);
        swift_retain();
      }
      v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v10 = v6;
      v8 = sub_21B34E74C(&v10, a1);
      swift_release();
      if ((v8 & 1) != 0)
      {
        OUTLINED_FUNCTION_21_3();
        return 1;
      }
      ++v5;
      if (v7 == v4)
        goto LABEL_13;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
LABEL_13:
  OUTLINED_FUNCTION_21_3();
  return 0;
}

uint64_t sub_21B34E74C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = sub_21B369880();
  v39 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v9 = sub_21B369AC0();
  if (v9)
  {
    v32 = v8;
    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v30 = a2;
      v31 = v2;
      v11 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
      v29 = v9;
      v12 = v9 + v11;
      v13 = *(_QWORD *)(v39 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
      v34 = v13;
      v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v33(v7, v12, v5);
        v15 = sub_21B369868();
        v17 = v16;
        (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21B29C298();
          v14 = v20;
        }
        v18 = v14[2];
        if (v18 >= v14[3] >> 1)
        {
          sub_21B29C298();
          v14 = v21;
        }
        v14[2] = v18 + 1;
        v19 = &v14[2 * v18];
        v19[4] = v15;
        v19[5] = v17;
        v12 += v34;
        --v10;
      }
      while (v10);
      swift_bridgeObjectRelease();
      LOBYTE(a2) = v30;
    }
    else
    {
      swift_bridgeObjectRelease();
      v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v22 = sub_21B1CADD4(*(_QWORD *)&aFlag[8 * (char)a2], qword_21B38C440[(char)a2], v14);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  v23 = sub_21B369C40();
  if (v24)
  {
    v37 = v23;
    v38 = v24;
    v25 = *(_QWORD *)&aFlag[8 * (char)a2];
    v26 = qword_21B38C440[(char)a2];
    v35 = v25;
    v36 = v26;
    sub_21B162704();
    v27 = sub_21B36B860();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 |= v27 == 0;
  }
  return v22 & 1;
}

uint64_t sub_21B34E9C0(void *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255142210);
  MEMORY[0x24BDAC7A8](v2);
  v56 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v56 - v5;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v6);
  v57 = (char *)&v56 - v7;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v8);
  v59 = (char *)&v56 - v9;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v10);
  v60 = (char *)&v56 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0D0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v56 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v56 - v19;
  sub_21B35F1B4();
  v63 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551471C0);
  sub_21B2196E4();
  v22 = sub_21B36B41C();
  v24 = v23;
  swift_bridgeObjectRelease();
  type metadata accessor for NotebookNoteConcept.Builder(0);
  OUTLINED_FUNCTION_1_4();
  v25 = sub_21B321FD8();
  v26 = OUTLINED_FUNCTION_4_46(v25, sel_title);
  sub_21B36B740();

  sub_21B36AF60();
  v27 = 1;
  OUTLINED_FUNCTION_34((uint64_t)v20, 0);
  OUTLINED_FUNCTION_0_73();
  sub_21B1989A8((uint64_t)v20, (uint64_t)v26);
  OUTLINED_FUNCTION_5_71();
  sub_21B163F9C((uint64_t)v20, (uint64_t *)&unk_25514D0D0);
  v61 = v22;
  v62 = v24;
  if (sub_21B1625C4(v22, v24))
  {
    sub_21B36B4AC();
    v27 = 0;
  }
  v28 = 1;
  OUTLINED_FUNCTION_34((uint64_t)v18, v27);
  v29 = v25 + OBJC_IVAR____TtCC12SiriNotebook19NotebookNoteConcept7Builder_textContent;
  swift_beginAccess();
  sub_21B1989A8((uint64_t)v18, v29);
  OUTLINED_FUNCTION_5_71();
  v30 = sub_21B163F9C((uint64_t)v18, (uint64_t *)&unk_25514D0D0);
  v31 = OUTLINED_FUNCTION_4_46(v30, sel_groupName);
  if (v31)
  {
    v32 = v31;
    sub_21B36B740();

    v28 = 0;
  }
  v33 = (uint64_t)v59;
  v34 = (uint64_t)v60;
  OUTLINED_FUNCTION_34((uint64_t)v15, v28);
  OUTLINED_FUNCTION_0_73();
  sub_21B1989A8((uint64_t)v15, v28);
  OUTLINED_FUNCTION_5_71();
  v35 = sub_21B163F9C((uint64_t)v15, (uint64_t *)&unk_25514D0D0);
  v36 = OUTLINED_FUNCTION_4_46(v35, sel_createdDateComponents);
  if (v36)
  {
    v37 = v36;
    sub_21B368134();

    v38 = sub_21B3681E8();
    v39 = v33;
    v40 = 0;
  }
  else
  {
    v38 = sub_21B3681E8();
    v39 = v33;
    v40 = 1;
  }
  __swift_storeEnumTagSinglePayload(v39, v40, 1, v38);
  sub_21B1A81F0(v33, v34);
  sub_21B3681E8();
  if (__swift_getEnumTagSinglePayload(v34, 1, v38) == 1)
  {
    sub_21B163F9C(v34, &qword_255142210);
    v41 = 0;
  }
  else
  {
    sub_21B36AE4C();
    v42 = *(_QWORD *)(v38 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v57, v34, v38);
    v41 = OUTLINED_FUNCTION_2_64();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v34, v38);
  }
  v43 = (uint64_t)v58;
  v44 = (uint64_t)v56;
  sub_21B322068(v41);
  swift_release();
  v45 = swift_release();
  v46 = OUTLINED_FUNCTION_4_46(v45, sel_modifiedDateComponents);
  if (v46)
  {
    v47 = v46;
    sub_21B368134();

    v48 = 0;
  }
  else
  {
    v48 = 1;
  }
  __swift_storeEnumTagSinglePayload(v44, v48, 1, v38);
  sub_21B1A81F0(v44, v43);
  if (__swift_getEnumTagSinglePayload(v43, 1, v38) == 1)
  {
    sub_21B163F9C(v43, &qword_255142210);
    v49 = 0;
  }
  else
  {
    sub_21B36AE4C();
    v50 = *(_QWORD *)(v38 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v57, v43, v38);
    v49 = OUTLINED_FUNCTION_2_64();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v43, v38);
  }
  v51 = sub_21B322074(v49);
  swift_release();
  swift_release();
  v52 = sub_21B34EF24();
  swift_bridgeObjectRelease();
  v53 = v51 + OBJC_IVAR____TtCC12SiriNotebook19NotebookNoteConcept7Builder_attachmentCount;
  *(double *)v53 = v52;
  *(_BYTE *)(v53 + 8) = 0;
  type metadata accessor for NotebookNoteConcept(0);
  OUTLINED_FUNCTION_1_4();
  v54 = sub_21B3220F8(v51);

  return v54;
}

double sub_21B34EF24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  char v6;
  uint64_t v7;

  swift_bridgeObjectRetain();
  v0 = sub_21B36B500();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    v4 = 0.0;
    while (1)
    {
      if (qword_255141478 != -1)
        swift_once();
      if (v2 == qword_25517A9D8 && v3 == unk_25517A9E0)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v6 = sub_21B36BCBC();
        swift_bridgeObjectRelease();
        if ((v6 & 1) == 0)
          goto LABEL_13;
      }
      v4 = v4 + 1.0;
LABEL_13:
      v2 = sub_21B36B500();
      v3 = v7;
      if (!v7)
        goto LABEL_16;
    }
  }
  v4 = 0.0;
LABEL_16:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t OUTLINED_FUNCTION_0_73()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_64()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return sub_21B21D850(v0);
}

uint64_t OUTLINED_FUNCTION_5_71()
{
  return swift_endAccess();
}

BOOL static DIConfirmationResponse.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void static DIConfirmationResponse.identifier.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000028;
  a1[1] = 0x800000021B390F60;
  a1[2] = 0xD000000000000014;
  a1[3] = 0x800000021B392260;
}

uint64_t DIConfirmationResponse.hash(into:)()
{
  return sub_21B36BD7C();
}

uint64_t sub_21B34F0F0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x656D7269666E6F63 && a2 == 0xE900000000000064;
  if (v3 || (sub_21B36BCBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x64657463656A6572 && a2 == 0xE800000000000000;
    if (v6 || (sub_21B36BCBC() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x656C6C65636E6163 && a2 == 0xE900000000000064)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_21B36BCBC();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_21B34F23C(char a1)
{
  return *(_QWORD *)&aConfirmereject[8 * a1];
}

uint64_t sub_21B34F25C()
{
  sub_21B34F5EC();
  return sub_21B36BDDC();
}

uint64_t sub_21B34F284()
{
  sub_21B34F5EC();
  return sub_21B36BDE8();
}

uint64_t sub_21B34F2B0()
{
  char *v0;

  return sub_21B34F23C(*v0);
}

uint64_t sub_21B34F2B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21B34F0F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21B34F2DC()
{
  sub_21B34F5B0();
  return sub_21B36BDDC();
}

uint64_t sub_21B34F304()
{
  sub_21B34F5B0();
  return sub_21B36BDE8();
}

uint64_t sub_21B34F32C()
{
  sub_21B34F664();
  return sub_21B36BDDC();
}

uint64_t sub_21B34F354()
{
  sub_21B34F664();
  return sub_21B36BDE8();
}

uint64_t sub_21B34F37C()
{
  sub_21B34F628();
  return sub_21B36BDDC();
}

uint64_t sub_21B34F3A4()
{
  sub_21B34F628();
  return sub_21B36BDE8();
}

void DIConfirmationResponse.encode(to:)(_QWORD *a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  unsigned __int8 *v3;
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
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255151990);
  v24 = *(_QWORD *)(v5 - 8);
  v25 = v5;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_2();
  v23 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255151998);
  v21 = *(_QWORD *)(v8 - 8);
  v22 = v8;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_128_1();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551519A0);
  v10 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_21();
  v13 = v12 - v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551519A8);
  v26 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_21();
  v18 = v17 - v16;
  v19 = *v3;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21B34F5B0();
  sub_21B36BDD0();
  if (v19)
  {
    if (v19 == 1)
    {
      OUTLINED_FUNCTION_8_61();
      OUTLINED_FUNCTION_6_11();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v2, v22);
    }
    else
    {
      OUTLINED_FUNCTION_11_54();
      OUTLINED_FUNCTION_6_11();
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
    }
  }
  else
  {
    sub_21B34F664();
    OUTLINED_FUNCTION_6_11();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v20);
  }
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v18, v14);
  OUTLINED_FUNCTION_0_10();
}

unint64_t sub_21B34F5B0()
{
  unint64_t result;

  result = qword_2551519B0;
  if (!qword_2551519B0)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C86C, &type metadata for DIConfirmationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2551519B0);
  }
  return result;
}

unint64_t sub_21B34F5EC()
{
  unint64_t result;

  result = qword_2551519B8;
  if (!qword_2551519B8)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C81C, &type metadata for DIConfirmationResponse.CancelledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2551519B8);
  }
  return result;
}

unint64_t sub_21B34F628()
{
  unint64_t result;

  result = qword_2551519C0;
  if (!qword_2551519C0)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C7CC, &type metadata for DIConfirmationResponse.RejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2551519C0);
  }
  return result;
}

unint64_t sub_21B34F664()
{
  unint64_t result;

  result = qword_2551519C8;
  if (!qword_2551519C8)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C77C, &type metadata for DIConfirmationResponse.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2551519C8);
  }
  return result;
}

void DIConfirmationResponse.hashValue.getter()
{
  sub_21B36BD70();
  OUTLINED_FUNCTION_106();
  sub_21B36BDA0();
  OUTLINED_FUNCTION_13_4();
}

void DIConfirmationResponse.init(from:)(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
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
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;

  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551519D0);
  v28 = *(_QWORD *)(v31 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_2();
  v34 = v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551519D8);
  v29 = *(_QWORD *)(v6 - 8);
  v30 = v6;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3_2();
  v33 = v8;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551519E0);
  v9 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_128_1();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551519E8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_21();
  v14 = v13 - v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21B34F5B0();
  sub_21B36BDB8();
  if (v35)
    goto LABEL_10;
  v36 = (uint64_t)a1;
  v15 = v14;
  v16 = sub_21B36BC08();
  v17 = *(_QWORD *)(v16 + 16);
  if (!v17
    || (v18 = *(unsigned __int8 *)(v16 + 32),
        sub_21B185334(1, v17, v16, v16 + 32, 0, (2 * v17) | 1),
        v20 = v19,
        v22 = v21,
        swift_bridgeObjectRelease(),
        v20 != v22 >> 1))
  {
    v24 = sub_21B36B9C8();
    swift_allocError();
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255142698);
    *v26 = &type metadata for DIConfirmationResponse;
    sub_21B36BB9C();
    sub_21B36B9BC();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BEE26D0], v24);
    swift_willThrow();
    OUTLINED_FUNCTION_90_1();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v10);
    a1 = (_QWORD *)v36;
LABEL_10:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    goto LABEL_11;
  }
  if (v18)
  {
    v37 = v18;
    if (v18 == 1)
    {
      OUTLINED_FUNCTION_8_61();
      OUTLINED_FUNCTION_0_74();
      v23 = a2;
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v33, v30);
    }
    else
    {
      OUTLINED_FUNCTION_11_54();
      OUTLINED_FUNCTION_0_74();
      v23 = a2;
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v34, v31);
    }
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_4_65(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  }
  else
  {
    sub_21B34F664();
    OUTLINED_FUNCTION_0_74();
    v37 = 0;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v27);
    OUTLINED_FUNCTION_90_1();
    OUTLINED_FUNCTION_4_65(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    v23 = a2;
  }
  *v23 = v37;
  __swift_destroy_boxed_opaque_existential_1(v36);
LABEL_11:
  OUTLINED_FUNCTION_0_10();
}

void sub_21B34FA94()
{
  sub_21B36BD70();
  OUTLINED_FUNCTION_106();
  sub_21B36BDA0();
  OUTLINED_FUNCTION_13_4();
}

void sub_21B34FAC8(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  DIConfirmationResponse.init(from:)(a1, a2);
}

void sub_21B34FADC(_QWORD *a1)
{
  DIConfirmationResponse.encode(to:)(a1);
}

unint64_t sub_21B34FAF4()
{
  unint64_t result;

  result = qword_2551519F0;
  if (!qword_2551519F0)
  {
    result = MEMORY[0x2207623FC](&protocol conformance descriptor for DIConfirmationResponse, &type metadata for DIConfirmationResponse);
    atomic_store(result, (unint64_t *)&qword_2551519F0);
  }
  return result;
}

unint64_t sub_21B34FB30(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_21B31873C();
  a1[2] = sub_21B1E143C();
  result = sub_21B34FAF4();
  a1[3] = result;
  return result;
}

ValueMetadata *type metadata accessor for DIConfirmationResponse()
{
  return &type metadata for DIConfirmationResponse;
}

uint64_t _s12SiriNotebook22DIConfirmationResponseOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21B34FBC8 + 4 * byte_21B38C465[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21B34FBFC + 4 * byte_21B38C460[v4]))();
}

uint64_t sub_21B34FBFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21B34FC04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21B34FC0CLL);
  return result;
}

uint64_t sub_21B34FC18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21B34FC20);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21B34FC24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21B34FC2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DIConfirmationResponse.CodingKeys()
{
  return &type metadata for DIConfirmationResponse.CodingKeys;
}

ValueMetadata *type metadata accessor for DIConfirmationResponse.ConfirmedCodingKeys()
{
  return &type metadata for DIConfirmationResponse.ConfirmedCodingKeys;
}

ValueMetadata *type metadata accessor for DIConfirmationResponse.RejectedCodingKeys()
{
  return &type metadata for DIConfirmationResponse.RejectedCodingKeys;
}

ValueMetadata *type metadata accessor for DIConfirmationResponse.CancelledCodingKeys()
{
  return &type metadata for DIConfirmationResponse.CancelledCodingKeys;
}

unint64_t sub_21B34FC7C()
{
  unint64_t result;

  result = qword_2551519F8;
  if (!qword_2551519F8)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C754, &type metadata for DIConfirmationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2551519F8);
  }
  return result;
}

unint64_t sub_21B34FCBC()
{
  unint64_t result;

  result = qword_255151A00;
  if (!qword_255151A00)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C674, &type metadata for DIConfirmationResponse.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255151A00);
  }
  return result;
}

unint64_t sub_21B34FCFC()
{
  unint64_t result;

  result = qword_255151A08;
  if (!qword_255151A08)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C69C, &type metadata for DIConfirmationResponse.ConfirmedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255151A08);
  }
  return result;
}

unint64_t sub_21B34FD3C()
{
  unint64_t result;

  result = qword_255151A10;
  if (!qword_255151A10)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C624, &type metadata for DIConfirmationResponse.RejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255151A10);
  }
  return result;
}

unint64_t sub_21B34FD7C()
{
  unint64_t result;

  result = qword_255151A18;
  if (!qword_255151A18)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C64C, &type metadata for DIConfirmationResponse.RejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255151A18);
  }
  return result;
}

unint64_t sub_21B34FDBC()
{
  unint64_t result;

  result = qword_255151A20;
  if (!qword_255151A20)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C5D4, &type metadata for DIConfirmationResponse.CancelledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255151A20);
  }
  return result;
}

unint64_t sub_21B34FDFC()
{
  unint64_t result;

  result = qword_255151A28;
  if (!qword_255151A28)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C5FC, &type metadata for DIConfirmationResponse.CancelledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255151A28);
  }
  return result;
}

unint64_t sub_21B34FE3C()
{
  unint64_t result;

  result = qword_255151A30;
  if (!qword_255151A30)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C6C4, &type metadata for DIConfirmationResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255151A30);
  }
  return result;
}

unint64_t sub_21B34FE7C()
{
  unint64_t result;

  result = qword_255151A38;
  if (!qword_255151A38)
  {
    result = MEMORY[0x2207623FC](&unk_21B38C6EC, &type metadata for DIConfirmationResponse.CodingKeys);
    atomic_store(result, &qword_255151A38);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_74()
{
  return sub_21B36BB90();
}

uint64_t OUTLINED_FUNCTION_4_65@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

unint64_t OUTLINED_FUNCTION_8_61()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return sub_21B34F628();
}

unint64_t OUTLINED_FUNCTION_11_54()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return sub_21B34F5EC();
}

id sub_21B34FEEC(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v5 = objc_allocWithZone(MEMORY[0x24BE811C8]);
  v6 = v4;
  v7 = objc_msgSend(v5, sel_init);
  sub_21B1DB2B0(a1, a2, v7);
  objc_msgSend(v6, sel_setDecoratedBodyText_, v7);

  return v6;
}

uint64_t sub_21B34FF90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  *(_QWORD *)(v9 + 288) = v19;
  *(_QWORD *)(v9 + 296) = v8;
  *(_BYTE *)(v9 + 499) = v18;
  *(_QWORD *)(v9 + 272) = a8;
  *(_QWORD *)(v9 + 280) = v17;
  *(_BYTE *)(v9 + 498) = v16;
  *(_BYTE *)(v9 + 497) = v15;
  *(_BYTE *)(v9 + 496) = v14;
  *(_QWORD *)(v9 + 256) = a6;
  *(_QWORD *)(v9 + 264) = a7;
  *(_QWORD *)(v9 + 240) = a4;
  *(_QWORD *)(v9 + 248) = a5;
  *(_QWORD *)(v9 + 224) = a2;
  *(_QWORD *)(v9 + 232) = a3;
  *(_QWORD *)(v9 + 216) = a1;
  *(_QWORD *)(v9 + 304) = type metadata accessor for Snippet();
  *(_QWORD *)(v9 + 312) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 320) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 328) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 336) = OUTLINED_FUNCTION_1_5();
  v10 = sub_21B368C44();
  *(_QWORD *)(v9 + 344) = v10;
  *(_QWORD *)(v9 + 352) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 360) = OUTLINED_FUNCTION_23_1();
  v11 = sub_21B3692A4();
  *(_QWORD *)(v9 + 368) = v11;
  *(_QWORD *)(v9 + 376) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 384) = OUTLINED_FUNCTION_23_1();
  v12 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0) - 8);
  *(_QWORD *)(v9 + 392) = v12;
  *(_QWORD *)(v9 + 400) = *(_QWORD *)(v12 + 64);
  *(_QWORD *)(v9 + 408) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 416) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 424) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 432) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 440) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v9 + 448) = OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B3500C8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
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
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v37;
  _QWORD *v38;
  uint64_t v40;
  _QWORD *v41;
  uint64_t *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v1 = *(_QWORD *)(v0 + 240);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_21B36BB30();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (v2)
  {
    v3 = v1 & 0xC000000000000001;
    sub_21B347CB8(0, v3 == 0, *(_QWORD *)(v0 + 240));
    if (v3)
      v4 = (id)MEMORY[0x220761AB4](0, *(_QWORD *)(v0 + 240));
    else
      v4 = *(id *)(*(_QWORD *)(v0 + 240) + 32);
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v4, sel_catId);

    v56 = sub_21B36B440();
    v59 = v6;

  }
  else
  {
    swift_bridgeObjectRelease();
    v56 = 0;
    v59 = 0;
  }
  v7 = *(_QWORD *)(v0 + 440);
  v8 = *(_QWORD *)(v0 + 448);
  v57 = *(_QWORD *)(v0 + 432);
  v10 = *(_QWORD *)(v0 + 392);
  v9 = *(_QWORD *)(v0 + 400);
  v11 = *(_QWORD *)(v0 + 360);
  v45 = *(_QWORD *)(v0 + 352);
  v47 = *(_QWORD *)(v0 + 344);
  v58 = *(_QWORD *)(v0 + 304);
  v54 = *(_BYTE *)(v0 + 499);
  v55 = *(_QWORD *)(v0 + 288);
  v53 = *(_QWORD *)(v0 + 280);
  v49 = *(_BYTE *)(v0 + 497);
  v51 = *(_BYTE *)(v0 + 496);
  v52 = *(_BYTE *)(v0 + 498);
  v44 = *(_QWORD *)(v0 + 272);
  v50 = *(_QWORD *)(v0 + 264);
  v48 = *(_QWORD *)(v0 + 256);
  v46 = *(_QWORD *)(v0 + 248);
  v13 = *(_QWORD *)(v0 + 224);
  v12 = *(_QWORD *)(v0 + 232);
  sub_21B186684(*(_QWORD *)(v0 + 296), v0 + 16);
  sub_21B163F58(v12, v8, &qword_25514D0B0);
  sub_21B163F58(v13, v7, &qword_25514D0B0);
  v14 = *(unsigned __int8 *)(v10 + 80);
  v15 = (v14 + 56) & ~v14;
  v16 = (v9 + v14 + v15) & ~v14;
  v17 = swift_allocObject();
  *(_QWORD *)(v0 + 456) = v17;
  v18 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v17 + 32) = v18;
  *(_QWORD *)(v17 + 48) = *(_QWORD *)(v0 + 48);
  sub_21B351644(v8, v17 + v15);
  sub_21B351644(v7, v17 + v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16))(v11, v44, v47);
  v19 = swift_task_alloc();
  *(_BYTE *)(v19 + 16) = v49;
  *(_QWORD *)(v19 + 24) = v46;
  *(_QWORD *)(v19 + 32) = v48;
  *(_QWORD *)(v19 + 40) = v56;
  *(_QWORD *)(v19 + 48) = v59;
  *(_QWORD *)(v19 + 56) = v50;
  *(_BYTE *)(v19 + 64) = v51;
  *(_BYTE *)(v19 + 65) = v52;
  *(_QWORD *)(v19 + 72) = sub_21B35168C;
  *(_QWORD *)(v19 + 80) = v17;
  *(_QWORD *)(v19 + 88) = v53;
  *(_BYTE *)(v19 + 96) = v54;
  *(_QWORD *)(v19 + 104) = v55;
  sub_21B369220();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25();
  sub_21B163F58(v13, v57, &qword_25514D0B0);
  if (__swift_getEnumTagSinglePayload(v57, 1, v58) == 1)
  {
    v20 = (uint64_t *)(v0 + 432);
  }
  else
  {
    v21 = *(_QWORD *)(v0 + 424);
    v22 = *(_QWORD *)(v0 + 232);
    sub_21B35172C(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 336));
    sub_21B163F58(v22, v21, &qword_25514D0B0);
    OUTLINED_FUNCTION_17_39();
    if (!v23)
    {
      v32 = *(_QWORD *)(v0 + 328);
      v31 = *(_QWORD *)(v0 + 336);
      v33 = *(_QWORD **)(v0 + 296);
      v34 = *(_QWORD *)(v0 + 304);
      sub_21B35172C(*(_QWORD *)(v0 + 424), v32);
      __swift_project_boxed_opaque_existential_1(v33, v33[3]);
      *(_QWORD *)(v0 + 160) = v34;
      v35 = sub_21B351770();
      *(_QWORD *)(v0 + 168) = v35;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 136));
      sub_21B2ADA1C(v31, (uint64_t)boxed_opaque_existential_0);
      *(_QWORD *)(v0 + 200) = v34;
      *(_QWORD *)(v0 + 208) = v35;
      v37 = OUTLINED_FUNCTION_54_13();
      sub_21B2ADA1C(v32, (uint64_t)v37);
      v38 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 464) = v38;
      *v38 = v0;
      v38[1] = sub_21B350658;
      OUTLINED_FUNCTION_15_44();
      return sub_21B369010();
    }
    v20 = (uint64_t *)(v0 + 424);
    sub_21B34165C(*(_QWORD *)(v0 + 336));
  }
  sub_21B1DC224(*v20, &qword_25514D0B0);
  OUTLINED_FUNCTION_36_26();
  OUTLINED_FUNCTION_17_39();
  if (v23)
  {
    v24 = *(_QWORD *)(v0 + 296);
    sub_21B1DC224(*(_QWORD *)(v0 + 416), &qword_25514D0B0);
    OUTLINED_FUNCTION_36_26();
    OUTLINED_FUNCTION_17_39();
    if (v23)
    {
      v25 = *(_QWORD **)(v0 + 296);
      sub_21B1DC224(*(_QWORD *)(v0 + 408), &qword_25514D0B0);
      __swift_project_boxed_opaque_existential_1(v25, *(_QWORD *)(v24 + 24));
      v26 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 488) = v26;
      *v26 = v0;
      v26[1] = sub_21B350860;
      OUTLINED_FUNCTION_15_44();
      return sub_21B369040();
    }
    else
    {
      v40 = *(_QWORD *)(v0 + 304);
      v41 = *(_QWORD **)(v0 + 296);
      sub_21B35172C(*(_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 312));
      __swift_project_boxed_opaque_existential_1(v41, *(_QWORD *)(v24 + 24));
      *(_QWORD *)(v0 + 80) = v40;
      *(_QWORD *)(v0 + 88) = sub_21B351770();
      v42 = OUTLINED_FUNCTION_54_13();
      OUTLINED_FUNCTION_57_11((uint64_t)v42);
      v43 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 480) = v43;
      OUTLINED_FUNCTION_10_47(v43);
      OUTLINED_FUNCTION_15_44();
      return sub_21B369028();
    }
  }
  else
  {
    v27 = *(_QWORD **)(v0 + 296);
    v28 = *(_QWORD *)(v0 + 304);
    sub_21B35172C(*(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 320));
    __swift_project_boxed_opaque_existential_1(v27, v27[3]);
    *(_QWORD *)(v0 + 120) = v28;
    *(_QWORD *)(v0 + 128) = sub_21B351770();
    v29 = OUTLINED_FUNCTION_54_13();
    OUTLINED_FUNCTION_57_11((uint64_t)v29);
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 472) = v30;
    OUTLINED_FUNCTION_10_47(v30);
    OUTLINED_FUNCTION_15_44();
    return sub_21B36901C();
  }
}

uint64_t sub_21B350658()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_15_2();
  v1 = v0 + 176;
  OUTLINED_FUNCTION_18_9();
  __swift_destroy_boxed_opaque_existential_1(v1);
  OUTLINED_FUNCTION_56_17();
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B3506A8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_7_52();
  v1 = *(_QWORD *)(v0 + 328);
  swift_release();
  sub_21B34165C(v1);
  OUTLINED_FUNCTION_55_18();
  OUTLINED_FUNCTION_0_75();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_33_20();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  return OUTLINED_FUNCTION_9_27(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B350718()
{
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_56_17();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B350754()
{
  uint64_t v0;

  OUTLINED_FUNCTION_7_52();
  swift_release();
  OUTLINED_FUNCTION_55_18();
  OUTLINED_FUNCTION_0_75();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_33_20();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  return OUTLINED_FUNCTION_9_27(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B3507BC()
{
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_56_17();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B3507F8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_7_52();
  swift_release();
  OUTLINED_FUNCTION_55_18();
  OUTLINED_FUNCTION_0_75();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_33_20();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  return OUTLINED_FUNCTION_9_27(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B350860()
{
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_18_9();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B350894()
{
  uint64_t v0;

  OUTLINED_FUNCTION_7_52();
  swift_release();
  OUTLINED_FUNCTION_0_75();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_33_20();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  return OUTLINED_FUNCTION_9_27(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B3508F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v4 = type metadata accessor for Snippet();
  if (__swift_getEnumTagSinglePayload(a3, 1, v4) != 1)
    return 2;
  if (qword_2551411E0 != -1)
    swift_once();
  v5 = sub_21B36B2B4();
  __swift_project_value_buffer(v5, (uint64_t)&unk_25517A6C8);
  v6 = sub_21B36B29C();
  v7 = sub_21B36B734();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    MEMORY[0x2207624E0](v8, -1, -1);
  }

  return 1;
}

uint64_t sub_21B3509F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned __int8 a8, char a9, unsigned __int8 (*a10)(uint64_t), uint64_t a11, uint64_t a12, char a13, uint64_t a14)
{
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;

  v48 = a7;
  v39 = a5;
  v15 = a8;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255142588);
  MEMORY[0x24BDAC7A8](v16);
  v46 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_21B368CBC();
  v45 = *(_QWORD *)(v47 - 8);
  v18 = MEMORY[0x24BDAC7A8](v47);
  v44 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v43 = (char *)&v39 - v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0A0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_21B36AC78();
  v41 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v42 = (char *)&v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v40 = (char *)&v39 - v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v39 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21B369250();
  if (!a4)
    swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_21B369244();
  sub_21B163F58(v48, (uint64_t)v30, &qword_2551420E8);
  sub_21B36925C();
  if (v15 == 2)
    sub_21B369268();
  v31 = sub_21B369274();
  if (a9 == 2 && a10(v31) == 2)
    sub_21B36928C();
  sub_21B369298();
  sub_21B163F58(a12, (uint64_t)v23, (uint64_t *)&unk_25514D0A0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24) == 1)
  {
    sub_21B1DC224((uint64_t)v23, (uint64_t *)&unk_25514D0A0);
  }
  else
  {
    v33 = v40;
    v32 = v41;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v40, v23, v24);
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v42, v33, v24);
    sub_21B36922C();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v24);
  }
  v35 = (uint64_t)v46;
  v34 = v47;
  if (a13 != 2)
    sub_21B369280();
  sub_21B163F58(a14, v35, &qword_255142588);
  if (__swift_getEnumTagSinglePayload(v35, 1, v34) == 1)
    return sub_21B1DC224(v35, &qword_255142588);
  v37 = v45;
  v38 = v43;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v43, v35, v34);
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v44, v38, v34);
  sub_21B369238();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v38, v34);
}

uint64_t sub_21B350DBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0) - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 56) & ~v3;
  v5 = (*(_QWORD *)(v2 + 64) + v3 + v4) & ~v3;
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v6 = v0 + v4;
  type metadata accessor for Snippet();
  if (!OUTLINED_FUNCTION_13_50())
  {
    switch(OUTLINED_FUNCTION_19_43())
    {
      case 0u:
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514C918);
        OUTLINED_FUNCTION_0_19(v7);
        type metadata accessor for Snippet.AppPunchout();
        goto LABEL_24;
      case 1u:
      case 8u:
        OUTLINED_FUNCTION_8_62();
        goto LABEL_24;
      case 2u:
        OUTLINED_FUNCTION_8_62();
        OUTLINED_FUNCTION_40_25();
        OUTLINED_FUNCTION_28();
        OUTLINED_FUNCTION_37_27();
        OUTLINED_FUNCTION_53_23();
        if (!v8)
          OUTLINED_FUNCTION_12_52();
        break;
      case 3u:
        OUTLINED_FUNCTION_8_62();
        v9 = v6 + *(int *)(type metadata accessor for Snippet.ReminderSearchResult(0) + 20);
        OUTLINED_FUNCTION_48_9();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 0u:
            v19 = OUTLINED_FUNCTION_149();
            OUTLINED_FUNCTION_260(v19);
            break;
          case 1u:
            OUTLINED_FUNCTION_29_33();
            OUTLINED_FUNCTION_47_17();
            swift_bridgeObjectRelease();
            if (*(unsigned __int8 *)(v9 + 96) != 255)
              OUTLINED_FUNCTION_52_21();
            break;
          case 2u:
          case 3u:
            OUTLINED_FUNCTION_29_33();
            break;
          default:
            break;
        }
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514C008);
        OUTLINED_FUNCTION_260(v20);
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514C010);
        goto LABEL_36;
      case 4u:
        OUTLINED_FUNCTION_8_62();
        if (*(_QWORD *)(v6 + 32))
        {
          OUTLINED_FUNCTION_40_25();
          OUTLINED_FUNCTION_28();
          OUTLINED_FUNCTION_37_27();
          OUTLINED_FUNCTION_53_23();
          if (!v8)
            OUTLINED_FUNCTION_12_52();
        }
        type metadata accessor for Snippet.AddTasks3p();
        goto LABEL_35;
      case 5u:
        v10 = sub_21B3683C8();
        OUTLINED_FUNCTION_0_19(v10);
        v11 = (int *)type metadata accessor for Snippet.Reminder(0);
        OUTLINED_FUNCTION_5_72();
        OUTLINED_FUNCTION_5_72();
        OUTLINED_FUNCTION_5_72();
        v12 = v6 + v11[8];
        if (*(_QWORD *)(v12 + 24))
        {
          OUTLINED_FUNCTION_29_33();
          OUTLINED_FUNCTION_47_17();
          swift_bridgeObjectRelease();
          if (*(unsigned __int8 *)(v12 + 96) != 255)
            OUTLINED_FUNCTION_52_21();
        }
        v13 = v6 + v11[9];
        __swift_instantiateConcreteTypeFromMangledName(&qword_2551425B8);
        OUTLINED_FUNCTION_31_32(v13);
        OUTLINED_FUNCTION_31_32(v6 + v11[10]);
        OUTLINED_FUNCTION_31_32(v6 + v11[11]);
        v1 = v6 + v11[12];
        v44 = type metadata accessor for Snippet.Reminder.LocationTrigger(0);
        if (!__swift_getEnumTagSinglePayload(v1, 1, v44))
        {
          swift_bridgeObjectRelease();
          v43 = v1 + *(int *)(v44 + 20);
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551425E0);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v43, v14);
          OUTLINED_FUNCTION_31_32(v1 + *(int *)(v44 + 24));
        }
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551425C8);
        OUTLINED_FUNCTION_260(v15);
        if (*(_QWORD *)(v6 + v11[14] + 8))
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_47_17();
        }
        OUTLINED_FUNCTION_11_55();
        v16 = v6 + v11[16];
        v17 = type metadata accessor for Snippet.Reminder.AppLink(0);
        if (!OUTLINED_FUNCTION_21_42(v17))
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            sub_21B180634(*(_QWORD *)v16, *(_QWORD *)(v16 + 8));
          }
          else
          {
            v22 = sub_21B3682C0();
            OUTLINED_FUNCTION_260(v22);
          }
        }
        OUTLINED_FUNCTION_11_55();
        type metadata accessor for Snippet.SetTaskAttribute3p();
        goto LABEL_35;
      case 6u:
LABEL_24:
        swift_bridgeObjectRelease();
        break;
      case 7u:
        OUTLINED_FUNCTION_14_47();
        OUTLINED_FUNCTION_41_19();
        OUTLINED_FUNCTION_39_23();
        swift_bridgeObjectRelease();
        type metadata accessor for Snippet.CreateNote3p();
        goto LABEL_35;
      case 9u:
        v18 = OUTLINED_FUNCTION_48_9();
        if (!__swift_getEnumTagSinglePayload(v6, 1, v18))
        {
          switch(swift_getEnumCaseMultiPayload())
          {
            case 0u:
              v41 = OUTLINED_FUNCTION_149();
              OUTLINED_FUNCTION_0_19(v41);
              break;
            case 1u:
              OUTLINED_FUNCTION_14_47();
              OUTLINED_FUNCTION_41_19();
              OUTLINED_FUNCTION_39_23();
              if (*(unsigned __int8 *)(v6 + 96) != 255)
                OUTLINED_FUNCTION_50_20();
              break;
            case 2u:
            case 3u:
              OUTLINED_FUNCTION_14_47();
              break;
            default:
              break;
          }
        }
        type metadata accessor for Snippet.SearchResult3p();
        OUTLINED_FUNCTION_11_55();
        OUTLINED_FUNCTION_11_55();
LABEL_35:
        OUTLINED_FUNCTION_14_47();
        type metadata accessor for Snippet.Interaction();
        v21 = sub_21B368584();
LABEL_36:
        OUTLINED_FUNCTION_0_19(v21);
        break;
      default:
        break;
    }
  }
  v23 = v0 + v5;
  if (!OUTLINED_FUNCTION_13_50())
  {
    switch(OUTLINED_FUNCTION_19_43())
    {
      case 0u:
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514C918);
        OUTLINED_FUNCTION_0_19(v24);
        type metadata accessor for Snippet.AppPunchout();
        goto LABEL_60;
      case 1u:
      case 8u:
        OUTLINED_FUNCTION_8_62();
        goto LABEL_60;
      case 2u:
        OUTLINED_FUNCTION_8_62();
        OUTLINED_FUNCTION_40_25();
        OUTLINED_FUNCTION_28();
        OUTLINED_FUNCTION_37_27();
        OUTLINED_FUNCTION_53_23();
        if (!v8)
          OUTLINED_FUNCTION_12_52();
        return swift_deallocObject();
      case 3u:
        OUTLINED_FUNCTION_8_62();
        v25 = v23 + *(int *)(type metadata accessor for Snippet.ReminderSearchResult(0) + 20);
        OUTLINED_FUNCTION_48_9();
        switch(swift_getEnumCaseMultiPayload())
        {
          case 0u:
            v36 = OUTLINED_FUNCTION_149();
            OUTLINED_FUNCTION_44_15(v36);
            break;
          case 1u:
            OUTLINED_FUNCTION_49_21();
            OUTLINED_FUNCTION_48_21();
            swift_bridgeObjectRelease();
            if (*(unsigned __int8 *)(v25 + 96) != 255)
              OUTLINED_FUNCTION_51_23();
            break;
          case 2u:
          case 3u:
            OUTLINED_FUNCTION_49_21();
            break;
          default:
            break;
        }
        v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514C008);
        OUTLINED_FUNCTION_44_15(v37);
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514C010);
        goto LABEL_72;
      case 4u:
        OUTLINED_FUNCTION_8_62();
        if (*(_QWORD *)(v23 + 32))
        {
          OUTLINED_FUNCTION_40_25();
          OUTLINED_FUNCTION_28();
          OUTLINED_FUNCTION_37_27();
          OUTLINED_FUNCTION_53_23();
          if (!v8)
            OUTLINED_FUNCTION_12_52();
        }
        type metadata accessor for Snippet.AddTasks3p();
        goto LABEL_71;
      case 5u:
        v26 = sub_21B3683C8();
        OUTLINED_FUNCTION_0_19(v26);
        v27 = (int *)type metadata accessor for Snippet.Reminder(0);
        OUTLINED_FUNCTION_5_72();
        OUTLINED_FUNCTION_5_72();
        OUTLINED_FUNCTION_5_72();
        v28 = v23 + v27[8];
        if (*(_QWORD *)(v28 + 24))
        {
          OUTLINED_FUNCTION_49_21();
          OUTLINED_FUNCTION_48_21();
          swift_bridgeObjectRelease();
          if (*(unsigned __int8 *)(v28 + 96) != 255)
            OUTLINED_FUNCTION_51_23();
        }
        v29 = v23 + v27[9];
        __swift_instantiateConcreteTypeFromMangledName(&qword_2551425B8);
        OUTLINED_FUNCTION_79_5(v29);
        OUTLINED_FUNCTION_79_5(v23 + v27[10]);
        OUTLINED_FUNCTION_79_5(v23 + v27[11]);
        v30 = v23 + v27[12];
        v31 = type metadata accessor for Snippet.Reminder.LocationTrigger(0);
        if (!OUTLINED_FUNCTION_21_42(v31))
        {
          OUTLINED_FUNCTION_29_33();
          v45 = v30 + *(int *)(v1 + 20);
          v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551425E0);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v45, v32);
          OUTLINED_FUNCTION_79_5(v30 + *(int *)(v1 + 24));
        }
        v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551425C8);
        OUTLINED_FUNCTION_44_15(v33);
        if (*(_QWORD *)(v23 + v27[14] + 8))
        {
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_48_21();
        }
        OUTLINED_FUNCTION_11_55();
        v34 = v23 + v27[16];
        v35 = type metadata accessor for Snippet.Reminder.AppLink(0);
        if (!__swift_getEnumTagSinglePayload(v34, 1, v35))
        {
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            sub_21B180634(*(_QWORD *)v34, *(_QWORD *)(v34 + 8));
          }
          else
          {
            v39 = sub_21B3682C0();
            OUTLINED_FUNCTION_44_15(v39);
          }
        }
        OUTLINED_FUNCTION_11_55();
        type metadata accessor for Snippet.SetTaskAttribute3p();
        goto LABEL_71;
      case 6u:
LABEL_60:
        swift_bridgeObjectRelease();
        return swift_deallocObject();
      case 7u:
        OUTLINED_FUNCTION_14_47();
        OUTLINED_FUNCTION_41_19();
        OUTLINED_FUNCTION_39_23();
        swift_bridgeObjectRelease();
        type metadata accessor for Snippet.CreateNote3p();
        goto LABEL_71;
      case 9u:
        OUTLINED_FUNCTION_48_9();
        if (!OUTLINED_FUNCTION_13_50())
        {
          switch(OUTLINED_FUNCTION_19_43())
          {
            case 0u:
              v42 = OUTLINED_FUNCTION_149();
              OUTLINED_FUNCTION_0_19(v42);
              break;
            case 1u:
              OUTLINED_FUNCTION_14_47();
              OUTLINED_FUNCTION_41_19();
              OUTLINED_FUNCTION_39_23();
              if (*(unsigned __int8 *)(v23 + 96) != 255)
                OUTLINED_FUNCTION_50_20();
              break;
            case 2u:
            case 3u:
              OUTLINED_FUNCTION_14_47();
              break;
            default:
              break;
          }
        }
        type metadata accessor for Snippet.SearchResult3p();
        OUTLINED_FUNCTION_11_55();
        OUTLINED_FUNCTION_11_55();
LABEL_71:
        swift_bridgeObjectRelease();
        type metadata accessor for Snippet.Interaction();
        v38 = sub_21B368584();
LABEL_72:
        OUTLINED_FUNCTION_96(v38);
        break;
      default:
        return swift_deallocObject();
    }
  }
  return swift_deallocObject();
}

uint64_t sub_21B351644(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21B35168C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  return sub_21B3508F4(v0 + 16, v0 + ((v2 + 56) & ~v2), v0 + ((*(_QWORD *)(v1 + 64) + v2 + ((v2 + 56) & ~v2)) & ~v2));
}

uint64_t sub_21B3516D4(uint64_t a1)
{
  uint64_t v1;

  return sub_21B3509F0(a1, *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_BYTE *)(v1 + 64), *(_BYTE *)(v1 + 65), *(unsigned __int8 (**)(uint64_t))(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_BYTE *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

uint64_t sub_21B35172C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Snippet();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21B351770()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255151A48;
  if (!qword_255151A48)
  {
    v1 = type metadata accessor for Snippet();
    result = MEMORY[0x2207623FC](&protocol conformance descriptor for Snippet, v1);
    atomic_store(result, (unint64_t *)&qword_255151A48);
  }
  return result;
}

ValueMetadata *type metadata accessor for OutputHelper()
{
  return &type metadata for OutputHelper;
}

uint64_t OUTLINED_FUNCTION_0_75()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[47] + 8))(v0[48], v0[46]);
}

uint64_t OUTLINED_FUNCTION_5_72()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_62()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_47(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 216);
}

uint64_t OUTLINED_FUNCTION_11_55()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_52()
{
  return OUTLINED_FUNCTION_0_11();
}

uint64_t OUTLINED_FUNCTION_13_50()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_14_47()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_17_39()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_19_43()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_21_42(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_29_33()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31_32(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_36_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  return sub_21B163F58(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_37_27()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_25()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_41_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47_17()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_48_21()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_49_21()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_50_20()
{
  return OUTLINED_FUNCTION_0_11();
}

uint64_t OUTLINED_FUNCTION_51_23()
{
  return OUTLINED_FUNCTION_0_11();
}

uint64_t OUTLINED_FUNCTION_52_21()
{
  return OUTLINED_FUNCTION_0_11();
}

uint64_t *OUTLINED_FUNCTION_54_13()
{
  uint64_t *v0;

  return __swift_allocate_boxed_opaque_existential_0(v0);
}

uint64_t OUTLINED_FUNCTION_55_18()
{
  uint64_t v0;

  return sub_21B34165C(v0);
}

uint64_t OUTLINED_FUNCTION_56_17()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_57_11(uint64_t a1)
{
  uint64_t v1;

  return sub_21B2ADA1C(v1, a1);
}

uint64_t sub_21B351964()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_15_45();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B3519A4()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_35_26();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_22_8(v0);
  OUTLINED_FUNCTION_17_40(v1);
  return sub_21B1C0BE4();
}

uint64_t sub_21B3519E8()
{
  OUTLINED_FUNCTION_55_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B351A24()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_15_45();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B351A64()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_35_26();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_22_8(v0);
  OUTLINED_FUNCTION_17_40(v1);
  return sub_21B1C0D08();
}

uint64_t sub_21B351AA8()
{
  OUTLINED_FUNCTION_55_13();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B351AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = sub_21B1CB904();
  v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_25();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v6);
}

uint64_t sub_21B351B50()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B351B84()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_15_45();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B351BC4()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_35_26();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_22_8(v0);
  OUTLINED_FUNCTION_17_40(v1);
  return sub_21B1C0FB0();
}

uint64_t sub_21B351C08()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_15_45();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B351C48()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_35_26();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_22_8(v0);
  OUTLINED_FUNCTION_17_40(v1);
  return sub_21B1C0F50();
}

uint64_t sub_21B351C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[199] = v2;
  v3[193] = a2;
  v3[187] = a1;
  v4 = *(_QWORD *)(OUTLINED_FUNCTION_19_44() - 8);
  v3[205] = v4;
  v3[211] = *(_QWORD *)(v4 + 64);
  v3[217] = swift_task_alloc();
  v3[223] = swift_task_alloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B351CF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t inited;
  void *v18;
  uint64_t v19;
  void *v20;

  v1 = v0[223];
  v2 = v0[217];
  v3 = v0[211];
  v4 = v0[205];
  v5 = v0[199];
  v18 = (void *)v0[193];
  v6 = (void *)v0[187];
  v7 = objc_msgSend(v6, sel_temporalEventTrigger);
  v8 = sub_21B352354(v7);
  v19 = v9;
  v20 = v8;

  sub_21B1866FC(v5, v1);
  v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v11 = (v3 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = OUTLINED_FUNCTION_39_24();
  v0[224] = v12;
  sub_21B353078(v1, v12 + v10);
  *(_QWORD *)(v12 + v11) = v6;
  v13 = v6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25514D2F0);
  swift_asyncLet_begin();
  sub_21B1866FC(v5, v2);
  v14 = OUTLINED_FUNCTION_39_24();
  v0[225] = v14;
  sub_21B353078(v2, v14 + v10);
  *(_QWORD *)(v14 + v11) = v18;
  v15 = v18;
  OUTLINED_FUNCTION_4_15();
  swift_asyncLet_begin();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255147130);
  inited = swift_initStackObject();
  v0[226] = inited;
  *(_OWORD *)(inited + 16) = xmmword_21B36D160;
  *(_QWORD *)(inited + 32) = v20;
  *(_QWORD *)(inited + 40) = v19;
  return swift_asyncLet_get_throwing();
}

uint64_t sub_21B351ED4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 1816) = v0;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B351EF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[226];
  v2 = v0[180];
  *(_QWORD *)(v1 + 48) = v0[179];
  *(_QWORD *)(v1 + 56) = v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_50();
  return swift_asyncLet_get_throwing();
}

uint64_t sub_21B351F4C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 1824) = v0;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B351F6C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v1 = (_QWORD *)v0[226];
  v2 = v0[178];
  v1[8] = v0[177];
  v1[9] = v2;
  v3 = v1[2];
  swift_bridgeObjectRetain();
  if (v3)
  {
    v4 = 0;
    v5 = MEMORY[0x24BEE4AF8];
    do
    {
      v6 = v0[226] + v4;
      v7 = *(_QWORD *)(v6 + 40);
      if (v7)
      {
        v8 = *(_QWORD *)(v6 + 32);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_0_38();
          v5 = v11;
        }
        v9 = *(_QWORD *)(v5 + 16);
        if (v9 >= *(_QWORD *)(v5 + 24) >> 1)
        {
          OUTLINED_FUNCTION_0_38();
          v5 = v12;
        }
        *(_QWORD *)(v5 + 16) = v9 + 1;
        v10 = v5 + 16 * v9;
        *(_QWORD *)(v10 + 32) = v8;
        *(_QWORD *)(v10 + 40) = v7;
      }
      v4 += 16;
      --v3;
    }
    while (v3);
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v0[181] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551471C0);
  sub_21B2196E4();
  v13 = sub_21B36B41C();
  v15 = v14;
  swift_bridgeObjectRelease();
  v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v16 = v13 & 0xFFFFFFFFFFFFLL;
  if (!v16)
  {
    swift_bridgeObjectRelease();
    v13 = 0;
    v15 = 0;
  }
  v0[230] = v15;
  v0[229] = v13;
  return swift_asyncLet_finish();
}

uint64_t sub_21B3520F0()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B3520FC()
{
  OUTLINED_FUNCTION_23_37();
  OUTLINED_FUNCTION_50();
  return OUTLINED_FUNCTION_21_1();
}

uint64_t sub_21B352134()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B352140()
{
  uint64_t v0;

  swift_release_n();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_0_23(*(_QWORD *)(v0 + 1832), *(_QWORD *)(v0 + 1840), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B352194()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_38_21();
  sub_21B202F98();
  return OUTLINED_FUNCTION_3_77();
}

uint64_t sub_21B3521E8()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B3521F4()
{
  OUTLINED_FUNCTION_23_37();
  OUTLINED_FUNCTION_50();
  return OUTLINED_FUNCTION_21_1();
}

uint64_t sub_21B35222C()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B352238()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_44();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  return OUTLINED_FUNCTION_2_24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B352270()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_38_21();
  sub_21B202F98();
  return OUTLINED_FUNCTION_3_77();
}

uint64_t sub_21B3522CC()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B3522D8()
{
  OUTLINED_FUNCTION_23_37();
  OUTLINED_FUNCTION_50();
  return OUTLINED_FUNCTION_21_1();
}

uint64_t sub_21B352310()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35231C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_44();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  return OUTLINED_FUNCTION_2_24(*(uint64_t (**)(void))(v0 + 8));
}

void *sub_21B352354(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;

  v2 = OUTLINED_FUNCTION_19_44();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v35 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255142E88);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21B368374();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v35 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v35 - v19;
  if (a1)
  {
    v39 = v5;
    v21 = a1;
    v22 = objc_msgSend(v21, sel_dateComponentsRange);
    sub_21B3285AC();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
    {

      sub_21B353648((uint64_t)v10, &qword_255142E88);
      return 0;
    }
    v37 = v21;
    v38 = v22;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v20, v10, v11);
    v23 = v40;
    v36 = *(int *)(v2 + 32);
    v24 = *(void **)(v40 + v36);
    v25 = sub_21B3683F8();
    objc_msgSend(v24, sel_setLocale_, v25);

    LOBYTE(v25) = sub_21B368470();
    sub_21B1866FC(v23, (uint64_t)v7);
    OUTLINED_FUNCTION_40_26((uint64_t)v18);
    if ((v25 & 1) != 0)
      v26 = 1;
    else
      v26 = sub_21B3684AC();
    v27 = v39;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v11);
    sub_21B186BE0((uint64_t)v7);
    sub_21B1866FC(v40, (uint64_t)v27);
    OUTLINED_FUNCTION_40_26((uint64_t)v15);
    if ((v26 & 1) != 0)
    {
      OUTLINED_FUNCTION_27_31();
      sub_21B186BE0((uint64_t)v27);
      v28 = v37;
    }
    else
    {
      v29 = sub_21B3684B8();
      OUTLINED_FUNCTION_27_31();
      sub_21B186BE0((uint64_t)v27);
      v28 = v37;
      if ((v29 & 1) == 0)
      {
        v30 = *(void **)(v40 + v36);
        OUTLINED_FUNCTION_31_33();
        v41 = 0x64642F4D4DLL;
        v42 = 0xE500000000000000;
        sub_21B36B4F4();
        swift_bridgeObjectRelease();
        v31 = (void *)sub_21B36B434();
        swift_bridgeObjectRelease();
        objc_msgSend(v30, sel_setLocalizedDateFormatFromTemplate_, v31);

        goto LABEL_13;
      }
    }
    v30 = *(void **)(v40 + v36);
    objc_msgSend(v30, sel_setDateStyle_, 1);
    objc_msgSend(v30, sel_setTimeStyle_, OUTLINED_FUNCTION_31_33());
    objc_msgSend(v30, sel_setDoesRelativeDateFormatting_, 1);
LABEL_13:
    v32 = (void *)sub_21B368314();
    v33 = objc_msgSend(v30, sel_stringFromDate_, v32);

    a1 = (void *)sub_21B36B440();
    ((void (*)(char *, uint64_t))v2)(v20, v11);
  }
  return a1;
}

uint64_t type metadata accessor for SnippetFormatter()
{
  uint64_t result;

  result = qword_255151AA8;
  if (!qword_255151AA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_21B35277C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  id v22;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = (void *)a2[2];
    a1[1] = a2[1];
    a1[2] = (uint64_t)v8;
    v9 = a3[7];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_21B368458();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_retain();
    swift_retain();
    v14 = v8;
    v13(v10, v11, v12);
    v15 = a3[8];
    v16 = a3[9];
    v17 = *(void **)((char *)a2 + v15);
    *(uint64_t *)((char *)v7 + v15) = (uint64_t)v17;
    v18 = (char *)v7 + v16;
    v19 = (char *)a2 + v16;
    v20 = sub_21B368530();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    v22 = v17;
    v21(v18, v19, v20);
  }
  return v7;
}

uint64_t sub_21B35287C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_release();
  swift_release();

  v4 = a1 + a2[7];
  v5 = sub_21B368458();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  v6 = a1 + a2[9];
  v7 = sub_21B368530();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *sub_21B35290C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  id v21;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (void *)a2[2];
  a1[2] = v7;
  v8 = a3[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_21B368458();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_retain();
  swift_retain();
  v13 = v7;
  v12(v9, v10, v11);
  v14 = a3[8];
  v15 = a3[9];
  v16 = *(void **)((char *)a2 + v14);
  *(_QWORD *)((char *)a1 + v14) = v16;
  v17 = (char *)a1 + v15;
  v18 = (char *)a2 + v15;
  v19 = sub_21B368530();
  v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  v21 = v16;
  v20(v17, v18, v19);
  return a1;
}

_QWORD *sub_21B3529E4(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v6 = (void *)a1[2];
  v7 = (void *)a2[2];
  a1[2] = v7;
  v8 = v7;

  v9 = a3[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_21B368458();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[8];
  v14 = *(void **)((char *)a2 + v13);
  v15 = *(void **)((char *)a1 + v13);
  *(_QWORD *)((char *)a1 + v13) = v14;
  v16 = v14;

  v17 = a3[9];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = sub_21B368530();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 24))(v18, v19, v20);
  return a1;
}

uint64_t sub_21B352AD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = a3[7];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_21B368458();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_21B368530();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

_QWORD *sub_21B352B78(_QWORD *a1, _QWORD *a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  v6 = (void *)a1[2];
  a1[2] = a2[2];

  v7 = a3[7];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21B368458();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[8];
  v12 = *(void **)((char *)a1 + v11);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);

  v13 = a3[9];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_21B368530();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t sub_21B352C4C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21B352C58(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_5_25();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 28);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_37_28();
      v10 = *(int *)(a3 + 36);
    }
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + v10, a2, v9);
  }
}

uint64_t sub_21B352CE8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_21B352CF4(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_5_25();
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 28);
    }
    else
    {
      v9 = OUTLINED_FUNCTION_37_28();
      v10 = *(int *)(a4 + 36);
    }
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_21B352D80()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21B368458();
  if (v1 <= 0x3F)
  {
    result = sub_21B368530();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_21B352E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = sub_21B368F98();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B352E90()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;

  v1 = objc_msgSend(*(id *)(v0 + 32), sel_spatialEventTrigger);
  *(_QWORD *)(v0 + 64) = v1;
  if (v1)
  {
    type metadata accessor for NotebookSpatialEventTriggerConcept(0);
    v2 = sub_21B198348(v1);
    *(_QWORD *)(v0 + 72) = v2;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v3;
    *v3 = v0;
    v3[1] = sub_21B352F54;
    return sub_21B194ABC(*(_QWORD *)(v0 + 56), v2);
  }
  else
  {
    v5 = *(_QWORD **)(v0 + 16);
    *v5 = 0;
    v5[1] = 0;
    swift_task_dealloc();
    return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_21B352F54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B352FAC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;

  v1 = *(void **)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = sub_21B1CB904();
  v7 = v6;
  OUTLINED_FUNCTION_17_0();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v8 = *(uint64_t **)(v0 + 16);
  *v8 = v5;
  v8[1] = v7;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B353034()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 64);

  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_15_1();
  return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B353078(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SnippetFormatter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21B3530BC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_19_44();
  OUTLINED_FUNCTION_10_48();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_29(v1);
  return sub_21B352E2C(v2, v3, v4);
}

uint64_t sub_21B353114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_21B35316C;
  return sub_21B35332C(a3);
}

uint64_t sub_21B35316C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v7 + 8))();
  *(_QWORD *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 40) = a1;
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B3531E8()
{
  uint64_t v0;

  *(int8x16_t *)*(_QWORD *)(v0 + 16) = vextq_s8(*(int8x16_t *)(v0 + 32), *(int8x16_t *)(v0 + 32), 8uLL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  void (*v9)(uint64_t);

  v1 = (int *)OUTLINED_FUNCTION_19_44();
  v2 = *((_QWORD *)v1 - 1);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3;
  swift_release();
  swift_release();

  v6 = v5 + v1[7];
  OUTLINED_FUNCTION_5_25();
  OUTLINED_FUNCTION_17_23();
  v7(v6);

  v8 = v5 + v1[9];
  OUTLINED_FUNCTION_37_28();
  OUTLINED_FUNCTION_17_23();
  v9(v8);

  return swift_deallocObject();
}

uint64_t sub_21B3532D4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_19_44();
  OUTLINED_FUNCTION_10_48();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_29(v1);
  return sub_21B353114(v2, v3, v4);
}

uint64_t sub_21B35332C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_21B368F98();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0D0);
  v2[7] = OUTLINED_FUNCTION_23_1();
  v4 = OUTLINED_FUNCTION_5_25();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B3533A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  _QWORD *v16;

  v1 = *(void **)(v0 + 16);
  if (v1
    && (v2 = objc_msgSend(v1, sel_triggerContact), (*(_QWORD *)(v0 + 88) = v2) != 0))
  {
    v3 = v2;
    v5 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 24);
    sub_21B36AE10();
    v8 = OUTLINED_FUNCTION_19_44();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7 + *(int *)(v8 + 28), v6);
    v9 = v3;
    v10 = sub_21B36ADF8();
    *(_QWORD *)(v0 + 96) = v10;
    v11 = *(_QWORD *)(v0 + 56);
    if (v10)
    {
      v12 = *(void **)(*(_QWORD *)(v0 + 24) + 16);
      v13 = v12;
      OUTLINED_FUNCTION_4_15();
      MEMORY[0x220760EFC](v12);
      OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_4_15();
      sub_21B36AE04();
      OUTLINED_FUNCTION_3_4();
    }
    else
    {
      v15 = sub_21B36AF60();
      __swift_storeEnumTagSinglePayload(v11, 1, 1, v15);
    }
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v16;
    *v16 = v0;
    v16[1] = sub_21B353504;
    return sub_21B194760(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  }
  else
  {
    OUTLINED_FUNCTION_42_25();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_15_1();
    return OUTLINED_FUNCTION_21_43(0, 0, *(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_21B353504()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B35355C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v6 = sub_21B1CB904();
  v8 = v7;

  OUTLINED_FUNCTION_17_0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  sub_21B353648(v3, (uint64_t *)&unk_25514D0D0);
  OUTLINED_FUNCTION_42_25();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_15_1();
  return OUTLINED_FUNCTION_21_43(v6, v8, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B3535F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);

  OUTLINED_FUNCTION_3_4();
  sub_21B353648(v1, (uint64_t *)&unk_25514D0D0);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  return OUTLINED_FUNCTION_2_24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B353648(uint64_t a1, uint64_t *a2)
{
  void (*v3)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_17_23();
  v3(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_15_45()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return sub_21B368F98();
}

uint64_t OUTLINED_FUNCTION_17_40(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 40);
}

uint64_t OUTLINED_FUNCTION_18_44()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_19_44()
{
  return type metadata accessor for SnippetFormatter();
}

uint64_t OUTLINED_FUNCTION_21_43(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_23_37()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_27_31()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

BOOL OUTLINED_FUNCTION_31_33()
{
  return sub_21B3292DC();
}

uint64_t OUTLINED_FUNCTION_37_28()
{
  return sub_21B368530();
}

uint64_t OUTLINED_FUNCTION_38_21()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_setDeallocating();
}

uint64_t OUTLINED_FUNCTION_39_24()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_40_26(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_42_25()
{
  return swift_task_dealloc();
}

void sub_21B353760(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  const char *v22;
  uint64_t v23;
  os_log_type_t v24;

  v4 = *a1;
  v3 = a1[1];
  v6 = a1[2];
  v5 = a1[3];
  v7 = a1[5];
  v8 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v8 = v6 & 0xFFFFFFFFFFFFLL;
  if (!v8)
  {
    v9 = HIBYTE(v3) & 0xF;
    if ((v3 & 0x2000000000000000) == 0)
      v9 = v4 & 0xFFFFFFFFFFFFLL;
    if (!v9)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_29_3();
      OUTLINED_FUNCTION_62();
      if (qword_2551411E0 != -1)
        swift_once();
      v23 = OUTLINED_FUNCTION_9_0();
      __swift_project_value_buffer(v23, (uint64_t)&unk_25517A6C8);
      v19 = OUTLINED_FUNCTION_68_2();
      v24 = sub_21B36B71C();
      if (OUTLINED_FUNCTION_19_1(v24))
      {
        v21 = (uint8_t *)OUTLINED_FUNCTION_2_18();
        *(_WORD *)v21 = 0;
        v22 = "[SetTaskAttributeDirectInvocationIntentWrapper] Need either task title or task ID! Returning nil";
LABEL_23:
        _os_log_impl(&dword_21B15D000, v19, (os_log_type_t)v3, v22, v21, 2u);
        OUTLINED_FUNCTION_3();
      }
LABEL_24:

      v4 = 0;
      v6 = 0;
      v5 = 0;
      v12 = 0;
      v3 = 1;
      goto LABEL_25;
    }
  }
  v10 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v10 = a1[4] & 0xFFFFFFFFFFFFLL;
  if (!v10)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29_3();
    OUTLINED_FUNCTION_62();
    if (qword_2551411E0 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_9_0();
    __swift_project_value_buffer(v18, (uint64_t)&unk_25517A6C8);
    v19 = OUTLINED_FUNCTION_68_2();
    v20 = sub_21B36B71C();
    if (OUTLINED_FUNCTION_19_1(v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_2_18();
      *(_WORD *)v21 = 0;
      v22 = "[SetTaskAttributeDirectInvocationIntentWrapper] No appId! Returning nil";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v11 = sub_21B36B038();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12 = sub_21B36B014();
  v13 = qword_2551411E0;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_9_0();
  __swift_project_value_buffer(v14, (uint64_t)&unk_25517A6C8);
  v15 = OUTLINED_FUNCTION_68_2();
  v16 = sub_21B36B704();
  if (OUTLINED_FUNCTION_44_1(v16))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_2_18();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_21B15D000, v15, v11, "[SetTaskAttributeDirectInvocationIntentWrapper] Created", v17, 2u);
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_62();

  swift_release();
  OUTLINED_FUNCTION_29_3();
LABEL_25:
  *a2 = v4;
  a2[1] = v3;
  a2[2] = v6;
  a2[3] = v5;
  a2[4] = v12;
}

uint64_t sub_21B3539E8()
{
  uint64_t v0;
  _QWORD *v1;

  v1[3] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142210);
  v1[4] = swift_task_alloc();
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B353A54()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  v1 = *(uint64_t **)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v4 = sub_21B161A30(0, &qword_255144DB0);
  sub_21B161A30(0, (unint64_t *)&qword_2551417A8);
  v5 = *v1;
  v6 = (void *)v1[1];
  swift_bridgeObjectRetain();
  sub_21B1D64C4(v5, v6);
  sub_21B3681E8();
  OUTLINED_FUNCTION_11_8(v2);
  OUTLINED_FUNCTION_11_8(v3);
  v7 = v1[2];
  v32 = swift_bridgeObjectRetain();
  v8 = (void *)OUTLINED_FUNCTION_2_65();
  sub_21B3266A8(v8, v9, v10, v11, v12, v2, v3, v7, v32, 0, 0, 0, 0, 0);
  v13 = objc_allocWithZone(MEMORY[0x24BDDA128]);
  v14 = (void *)OUTLINED_FUNCTION_2_65();
  v19 = sub_21B347C40(v14, v15, v16, v17, v18, 0);
  if (qword_2551411E0 != -1)
    swift_once();
  v20 = OUTLINED_FUNCTION_9_0();
  __swift_project_value_buffer(v20, (uint64_t)&unk_25517A6C8);
  v21 = v19;
  v22 = sub_21B36B29C();
  v23 = sub_21B36B704();
  if (OUTLINED_FUNCTION_44_1(v23))
  {
    v33 = (uint64_t *)(v0 + 16);
    v24 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    *(_DWORD *)v24 = 136315138;
    v25 = v21;
    v26 = objc_msgSend(v25, sel_description);
    v27 = sub_21B36B440();
    v29 = v28;

    *v33 = sub_21B196024(v27, v29, &v34);
    sub_21B36B818();
    OUTLINED_FUNCTION_29_3();

    _os_log_impl(&dword_21B15D000, v22, v4, "[SetTaskAttributeDirectInvocationIntentWrapper] Intent: %s", v24, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  v30 = sub_21B220B98();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v30);
}

uint64_t sub_21B353D18()
{
  return swift_retain();
}

uint64_t sub_21B353D20()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 48) = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v3;
  *v3 = v1;
  v3[1] = sub_21B353D80;
  return sub_21B3539E8();
}

uint64_t sub_21B353D80(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t destroy for SetTaskAttributeDirectInvocationIntentWrapper()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for SetTaskAttributeDirectInvocationIntentWrapper(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SetTaskAttributeDirectInvocationIntentWrapper(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SetTaskAttributeDirectInvocationIntentWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SetTaskAttributeDirectInvocationIntentWrapper(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SetTaskAttributeDirectInvocationIntentWrapper(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SetTaskAttributeDirectInvocationIntentWrapper()
{
  return &type metadata for SetTaskAttributeDirectInvocationIntentWrapper;
}

uint64_t OUTLINED_FUNCTION_2_65()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_21B354008(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    sub_21B36BA04();
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4;
      v4 += 2;
      v6 = v5;
      sub_21B36B9E0();
      sub_21B36BA10();
      sub_21B36BA1C();
      sub_21B36B9EC();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

id sub_21B3540B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[3];
  ValueMetadata *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v2 = sub_21B3683C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551411E0 != -1)
    swift_once();
  v6 = sub_21B36B2B4();
  __swift_project_value_buffer(v6, (uint64_t)&unk_25517A6C8);
  swift_bridgeObjectRetain_n();
  v7 = sub_21B36B29C();
  v8 = sub_21B36B734();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v23[2] = v2;
    *(_QWORD *)&v25 = v10;
    v23[1] = v3;
    *(_DWORD *)v9 = 136315138;
    v11 = swift_bridgeObjectRetain();
    v12 = MEMORY[0x2207616C4](v11, &type metadata for CasinoCards.SectionData);
    v14 = v13;
    swift_bridgeObjectRelease();
    v24 = (ValueMetadata *)sub_21B196024(v12, v14, (uint64_t *)&v25);
    sub_21B36B818();
    OUTLINED_FUNCTION_20_30();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21B15D000, v7, v8, "Making casino card with sections: %s", v9, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_20_30();
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84D80]), sel_init);
  v16 = sub_21B354008(a1);
  sub_21B354644(v16, v15);
  sub_21B3683BC();
  v17 = sub_21B36838C();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_21B3546A4(v17, v19, v15);
  v24 = &type metadata for CasinoCards;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151B50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151B58);
  if (swift_dynamicCast())
  {
    v20 = *((_QWORD *)&v26 + 1);
    v21 = v27;
    __swift_project_boxed_opaque_existential_1(&v25, *((uint64_t *)&v26 + 1));
    sub_21B35439C(v15, v20, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  }
  else
  {
    v27 = 0;
    v25 = 0u;
    v26 = 0u;
    sub_21B3546F4((uint64_t)&v25);
  }
  return v15;
}

void sub_21B35439C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;

  v6 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 32);
  v7 = (void *)v6(a2, a3);
  v8 = objc_msgSend(v7, sel_backingStore);

  v9 = objc_msgSend(v8, sel_data);
  if (v9)
  {
    v10 = sub_21B3682E4();
    v12 = v11;

    v9 = (id)sub_21B3682CC();
    sub_21B180634(v10, v12);
  }
  objc_msgSend(a1, sel_setIntentMessageData_, v9);

  v13 = (void *)v6(a2, a3);
  v14 = objc_msgSend(v13, sel_typeName);

  if (!v14)
  {
    sub_21B36B440();
    v14 = (id)sub_21B36B434();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(a1, sel_setIntentMessageName_, v14);

  v15 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 40);
  v16 = (void *)v15(a2, a3);
  v17 = objc_msgSend(v16, sel_backingStore);

  if (v17)
  {
    v18 = objc_msgSend(v17, sel_data);

    if (v18)
    {
      v19 = sub_21B3682E4();
      v21 = v20;

      v22 = (void *)sub_21B3682CC();
      sub_21B180634(v19, v21);
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(a1, sel_setIntentResponseMessageData_, v22);

    v23 = (void *)v15(a2, a3);
    v24 = objc_msgSend(v23, sel__payloadResponseTypeName);

    objc_msgSend(a1, sel_setIntentResponseMessageName_, v24);
  }
  else
  {
    __break(1u);
  }
}

id sub_21B3545D0(uint64_t a1, void *a2)
{
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81988]), sel_init);
  if (a2)
    a2 = (void *)sub_21B36B434();
  objc_msgSend(v3, sel_setApplicationBundleIdentifier_, a2);

  return v3;
}

void sub_21B354644(uint64_t a1, void *a2)
{
  id v3;

  sub_21B354734();
  v3 = (id)sub_21B36B59C();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCardSections_, v3);

}

void sub_21B3546A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21B36B434();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setCardId_, v4);

}

uint64_t sub_21B3546F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255151B60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21B354734()
{
  unint64_t result;

  result = qword_255151B68;
  if (!qword_255151B68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255151B68);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for CasinoCards.SectionData(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CasinoCards.SectionData(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for CasinoCards.SectionData(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for CasinoCards.SectionData(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CasinoCards.SectionData()
{
  return &type metadata for CasinoCards.SectionData;
}

ValueMetadata *type metadata accessor for CasinoCards()
{
  return &type metadata for CasinoCards;
}

uint64_t storeEnumTagSinglePayload for ViewCreationError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21B3548C0 + 4 * byte_21B38C9E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21B3548E0 + 4 * byte_21B38C9E5[v4]))();
}

_BYTE *sub_21B3548C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21B3548E0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21B3548E8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21B3548F0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21B3548F8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21B354900(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ViewCreationError()
{
  return &type metadata for ViewCreationError;
}

unint64_t sub_21B354920()
{
  unint64_t result;

  result = qword_255151B70[0];
  if (!qword_255151B70[0])
  {
    result = MEMORY[0x2207623FC](&unk_21B38CAC4, &type metadata for ViewCreationError);
    atomic_store(result, qword_255151B70);
  }
  return result;
}

void Entity<A>.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  void *v42;
  id v43;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
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
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  id v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  id v197;
  uint64_t v198;
  id v199;
  id v200;
  id v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;

  OUTLINED_FUNCTION_17_3();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_5_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1F8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_32_31(v8, v183);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_64(v10, v184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_92(v12, v185);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_93(v14, v186);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0B0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_129();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFC0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_3_2();
  v18 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E038);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_65_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_3_2();
  v22 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_3_2();
  v25 = v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255144418);
  v206 = *(_QWORD *)(v26 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_18_7();
  v28 = objc_msgSend(v5, sel_temporalEventTrigger);
  v208 = v25;
  v205 = (uint64_t)v5;
  if (v28)
  {
    v201 = v28;
    Entity<A>.init(_:)();
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
    OUTLINED_FUNCTION_6_1(v25, v30, v31, v29);
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
    v204 = v22;
    OUTLINED_FUNCTION_6_1(v22, v33, v34, v32);
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E040);
    OUTLINED_FUNCTION_6_1(v2, v36, v37, v35);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFC8);
    v41 = OUTLINED_FUNCTION_6_1(v18, v39, v40, v38);
    v42 = v3;
    v43 = objc_msgSend(OUTLINED_FUNCTION_4_46(v41, sel_title), sel_spokenPhrase);
    OUTLINED_FUNCTION_80_7();
    v44 = OUTLINED_FUNCTION_112_5();
    v194 = v45;
    v198 = v44;

    v46 = v206;
    (*(void (**)(void *, uint64_t, uint64_t))(v206 + 16))(v42, v0, v26);
    OUTLINED_FUNCTION_21_4();
    OUTLINED_FUNCTION_66_9(v47, v48, v49);
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
    OUTLINED_FUNCTION_6_1(v211, v51, v52, v50);
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
    OUTLINED_FUNCTION_6_1(v209, v54, v55, v53);
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
    OUTLINED_FUNCTION_6_1(v210, v57, v58, v56);
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_255141E58);
    OUTLINED_FUNCTION_6_1(v212, v60, v61, v59);
    v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
    __swift_storeEnumTagSinglePayload(v1, 1, 1, v62);
    v63 = OUTLINED_FUNCTION_65_7();
    Entity<A>.init(assignee:associatedDateTime:attachments:childReminders:completionStatus:list:name:stringContent:tags:trigger:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v63, v64, v65, v66, v67, v18, v198, v194, 0, 0, v178, v181, v211, v209, v210, v212, v1, v182, v187,
      v188,
      v190,
      v194,
      v198,
      (uint64_t)v201,
      v204,
      (uint64_t)v5,
      v206,
      v2,
      v25);

    OUTLINED_FUNCTION_75_9();
    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v0, v26);
  }
  else
  {
    v68 = OUTLINED_FUNCTION_4_46(0, sel_spatialEventTrigger);
    if (v68)
    {
      v199 = v68;
      Entity<A>.init(_:)();
      v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
      OUTLINED_FUNCTION_6_1(v25, v70, v71, v69);
      v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
      OUTLINED_FUNCTION_6_1(v22, v73, v74, v72);
      v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E040);
      OUTLINED_FUNCTION_6_1(v2, v76, v77, v75);
      v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFC8);
      v81 = OUTLINED_FUNCTION_6_1(v18, v79, v80, v78);
      v82 = objc_msgSend(OUTLINED_FUNCTION_4_46(v81, sel_title), sel_spokenPhrase);
      OUTLINED_FUNCTION_80_7();
      v83 = OUTLINED_FUNCTION_112_5();
      v191 = v84;
      v195 = v83;

      v85 = v206;
      (*(void (**)(void *, uint64_t, uint64_t))(v206 + 16))(v3, v0, v26);
      OUTLINED_FUNCTION_0_8((uint64_t)v3, 0);
      v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
      OUTLINED_FUNCTION_6_1(v211, v87, v88, v86);
      v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
      OUTLINED_FUNCTION_6_1(v209, v90, v91, v89);
      v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
      OUTLINED_FUNCTION_6_1(v210, v93, v94, v92);
      v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_255141E58);
      OUTLINED_FUNCTION_6_1(v212, v96, v97, v95);
      v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
      __swift_storeEnumTagSinglePayload(v1, 1, 1, v98);
      v99 = OUTLINED_FUNCTION_65_7();
      Entity<A>.init(assignee:associatedDateTime:attachments:childReminders:completionStatus:list:name:stringContent:tags:trigger:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v99, v100, v101, v102, v103, v18, v195, v191, 0, 0, v178, v181, v211, v209, v210, v212, v1, v182, v187,
        v188,
        v191,
        v195,
        (uint64_t)v199,
        v26,
        v22,
        (uint64_t)v5,
        v206,
        v2,
        v208);

      OUTLINED_FUNCTION_75_9();
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v0, v26);
    }
    else
    {
      v104 = OUTLINED_FUNCTION_4_46(0, sel_contactEventTrigger);
      if (v104)
      {
        v196 = v104;
        Entity<A>.init(_:)();
        v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
        OUTLINED_FUNCTION_6_1(v25, v106, v107, v105);
        v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
        OUTLINED_FUNCTION_6_1(v22, v109, v110, v108);
        v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E040);
        OUTLINED_FUNCTION_6_1(v2, v112, v113, v111);
        v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFC8);
        v117 = OUTLINED_FUNCTION_6_1(v18, v115, v116, v114);
        v118 = objc_msgSend(OUTLINED_FUNCTION_4_46(v117, sel_title), sel_spokenPhrase);
        OUTLINED_FUNCTION_80_7();
        v119 = OUTLINED_FUNCTION_112_5();
        v189 = v120;
        v192 = v119;

        v121 = v206;
        OUTLINED_FUNCTION_48_5((uint64_t)v3, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v206 + 16));
        OUTLINED_FUNCTION_45_25((uint64_t)v3);
        v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
        OUTLINED_FUNCTION_6_1(v211, v123, v124, v122);
        v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
        OUTLINED_FUNCTION_6_1(v209, v126, v127, v125);
        v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
        OUTLINED_FUNCTION_6_1(v210, v129, v130, v128);
        v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_255141E58);
        OUTLINED_FUNCTION_6_1(v212, v132, v133, v131);
        v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
        __swift_storeEnumTagSinglePayload(v1, 1, 1, v134);
        v179 = MEMORY[0x24BEE4AF8];
        v135 = OUTLINED_FUNCTION_78_5();
        Entity<A>.init(assignee:associatedDateTime:attachments:childReminders:completionStatus:list:name:stringContent:tags:trigger:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v135, v136, v137, v138, v139, v18, v192, v189, 0, 0, v179, (uint64_t)v3, v211, v209, v210, v212, v1, v182, v18,
          v189,
          v192,
          (uint64_t)v196,
          (uint64_t)v3,
          v26,
          v203,
          (uint64_t)v5,
          v206,
          v2,
          v25);

        OUTLINED_FUNCTION_75_9();
        (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v0, v26);
      }
      else
      {
        v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
        OUTLINED_FUNCTION_6_1(v25, v141, v142, v140);
        v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
        OUTLINED_FUNCTION_6_1(v22, v144, v145, v143);
        v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E040);
        OUTLINED_FUNCTION_6_1(v2, v147, v148, v146);
        v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFC8);
        v152 = OUTLINED_FUNCTION_6_1(v18, v150, v151, v149);
        v153 = v5;
        v154 = OUTLINED_FUNCTION_4_46(v152, sel_title);
        v155 = objc_msgSend(v154, sel_spokenPhrase);

        v156 = sub_21B36B440();
        v207 = v157;

        OUTLINED_FUNCTION_6_1((uint64_t)v3, v158, v159, v26);
        v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
        OUTLINED_FUNCTION_6_1(v211, v161, v162, v160);
        v163 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
        OUTLINED_FUNCTION_6_1(v209, v164, v165, v163);
        v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
        OUTLINED_FUNCTION_6_1(v210, v167, v168, v166);
        v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_255141E58);
        OUTLINED_FUNCTION_6_1(v212, v170, v171, v169);
        v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
        __swift_storeEnumTagSinglePayload(v1, 1, 1, v172);
        v180 = MEMORY[0x24BEE4AF8];
        v173 = OUTLINED_FUNCTION_78_5();
        Entity<A>.init(assignee:associatedDateTime:attachments:childReminders:completionStatus:list:name:stringContent:tags:trigger:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v173, v174, v175, v176, v177, v18, v156, v207, 0, 0, v180, (uint64_t)v3, v211, v209, v210, v212, v1, v182, v187,
          v188,
          v190,
          v193,
          (uint64_t)v3,
          v26,
          v203,
          v205,
          v207,
          v2,
          v25);

      }
    }
  }
  OUTLINED_FUNCTION_20_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v42;
  uint64_t v43;
  id v44;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  OUTLINED_FUNCTION_17_3();
  v7 = (void *)v6;
  v91 = v6;
  v97 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_32_31(v10, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0B0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_93(v12, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_9_64(v14, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_92(v16, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_45_0(v18, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF48);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3_2();
  v21 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_18_7();
  v87 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_8_17();
  v26 = v24 - v25;
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v86 - v28;
  v88 = (uint64_t)&v86 - v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_128_1();
  v89 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_5_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DEC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_2_12();
  v90 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE20);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_65_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0B8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_2_3();
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E110);
  OUTLINED_FUNCTION_6_1(v3, v36, v37, v35);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE28);
  OUTLINED_FUNCTION_6_1(v2, v39, v40, v38);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF00);
  OUTLINED_FUNCTION_6_1(v5, v42, v43, v41);
  v44 = objc_msgSend(v7, sel_dateComponentsRange);
  Entity<A>.init(_:)((uint64_t)v44, v45, v46, v47, v48, v49, v50, v51, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96,
    v97);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
  OUTLINED_FUNCTION_21_4();
  __swift_storeEnumTagSinglePayload(v52, v53, v54, v55);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDE8);
  OUTLINED_FUNCTION_6_1(v4, v57, v58, v56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
  OUTLINED_FUNCTION_11_33((uint64_t)v29, 1);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD70);
  OUTLINED_FUNCTION_6_1(v0, v60, v61, v59);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E030);
  v63 = v21;
  OUTLINED_FUNCTION_6_1(v21, v64, v65, v62);
  v66 = v26;
  OUTLINED_FUNCTION_11_33(v26, 1);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
  v68 = v92;
  OUTLINED_FUNCTION_6_1(v92, v69, v70, v67);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
  v72 = v93;
  OUTLINED_FUNCTION_6_1(v93, v73, v74, v71);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
  v76 = v94;
  OUTLINED_FUNCTION_6_1(v94, v77, v78, v75);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_255144418);
  v80 = v95;
  OUTLINED_FUNCTION_6_1(v95, v81, v82, v79);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
  v84 = v96;
  __swift_storeEnumTagSinglePayload(v96, 1, 1, v83);
  Entity<A>.init(attributes:communicationTrigger:contactAddressTrigger:dateTimeRangeTrigger:dateTimeTrigger:geographicAreaTrigger:personTrigger:pointOfInterestTrigger:recurringDateTimeTrigger:specifyingContactTrigger:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(MEMORY[0x24BEE4AF8], v3, v2, v90, v1, v89, v88, v87, v63, v66, v68, v72, v76, v80, v84, v85, v86, v87, v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94);
  OUTLINED_FUNCTION_77_5();
  OUTLINED_FUNCTION_20_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;

  OUTLINED_FUNCTION_17_3();
  v7 = v6;
  v95 = v6;
  v103 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_93(v10, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0B0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_9_64(v12, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_92(v14, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_45_0(v16, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_16_30(v18, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF48);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_27_24(v20, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_3_2();
  v104 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v23);
  v96 = (uint64_t)&v89 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v25);
  v89 = (uint64_t)&v89 - v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_46_1();
  v91 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_128_1();
  v92 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DEC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_20_4();
  v93 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE20);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_63_13(v31, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0B8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_30_3();
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD70);
  v90 = *(_QWORD *)(v33 - 8);
  v34 = v90;
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_129();
  v35 = objc_msgSend(v7, sel_placemark);
  Entity<A>.init(_:)((uint64_t)v35, v36, v37, v38, v39, v40, v41, v42, v89, v90, v91, v92, v93, v94, (uint64_t)v95, v96, v97, v98, v99,
    v100);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E110);
  OUTLINED_FUNCTION_6_1(v3, v44, v45, v43);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE28);
  OUTLINED_FUNCTION_6_1(v1, v47, v48, v46);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF00);
  OUTLINED_FUNCTION_6_1(v2, v50, v51, v49);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
  OUTLINED_FUNCTION_6_1(v5, v53, v54, v52);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDE8);
  OUTLINED_FUNCTION_6_1(v0, v56, v57, v55);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
  v58 = OUTLINED_FUNCTION_38_22();
  OUTLINED_FUNCTION_66_9(v58, v59, v60);
  v61 = v104;
  OUTLINED_FUNCTION_48_5(v104, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 16));
  OUTLINED_FUNCTION_45_25(v61);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E030);
  v63 = v97;
  OUTLINED_FUNCTION_6_1(v97, v64, v65, v62);
  v66 = v96;
  v67 = OUTLINED_FUNCTION_24_42();
  OUTLINED_FUNCTION_66_9(v67, v68, v69);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
  v71 = v98;
  OUTLINED_FUNCTION_6_1(v98, v72, v73, v70);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
  v75 = v99;
  OUTLINED_FUNCTION_6_1(v99, v76, v77, v74);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
  v79 = v100;
  OUTLINED_FUNCTION_6_1(v100, v80, v81, v78);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_255144418);
  v83 = v101;
  OUTLINED_FUNCTION_6_1(v101, v84, v85, v82);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
  v87 = v102;
  __swift_storeEnumTagSinglePayload(v102, 1, 1, v86);
  Entity<A>.init(attributes:communicationTrigger:contactAddressTrigger:dateTimeRangeTrigger:dateTimeTrigger:geographicAreaTrigger:personTrigger:pointOfInterestTrigger:recurringDateTimeTrigger:specifyingContactTrigger:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(MEMORY[0x24BEE4AF8], v3, v94, v93, v92, v91, v89, v104, v63, v66, v71, v75, v79, v83, v87, v88, v89, v90, v91,
    v92,
    v93,
    v94,
    (uint64_t)v95,
    v96,
    v97);

  (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v4, v33);
  OUTLINED_FUNCTION_20_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
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
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;

  OUTLINED_FUNCTION_17_3();
  v95 = v7;
  v101 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_32_31(v10, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0B0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_93(v12, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_9_64(v14, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_92(v16, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_45_0(v18, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF48);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_27_24(v20, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_20_4();
  v86 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v22);
  v93 = (uint64_t)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v86 - v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_2_12();
  v88 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_46_1();
  v90 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DEC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_63_13(v30, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE20);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_128_1();
  v92 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0B8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_2_3();
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
  v89 = *(_QWORD *)(v33 - 8);
  v34 = v89;
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_30_3();
  v95 = v95;
  Entity<A>.init(_:)();
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E110);
  OUTLINED_FUNCTION_6_1(v3, v36, v37, v35);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE28);
  OUTLINED_FUNCTION_6_1(v5, v39, v40, v38);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF00);
  OUTLINED_FUNCTION_6_1(v1, v42, v43, v41);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
  OUTLINED_FUNCTION_6_1(v0, v45, v46, v44);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDE8);
  OUTLINED_FUNCTION_6_1(v6, v48, v49, v47);
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
  v87 = v26;
  v50(v26, v4, v33);
  OUTLINED_FUNCTION_21_4();
  __swift_storeEnumTagSinglePayload(v51, v52, v53, v33);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD70);
  OUTLINED_FUNCTION_6_1(v2, v55, v56, v54);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E030);
  v58 = v94;
  OUTLINED_FUNCTION_6_1(v94, v59, v60, v57);
  v61 = v93;
  OUTLINED_FUNCTION_36_27();
  __swift_storeEnumTagSinglePayload(v62, v63, v64, v33);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
  v66 = v96;
  OUTLINED_FUNCTION_6_1(v96, v67, v68, v65);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
  v70 = v97;
  OUTLINED_FUNCTION_6_1(v97, v71, v72, v69);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
  v74 = v98;
  OUTLINED_FUNCTION_6_1(v98, v75, v76, v73);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_255144418);
  v78 = v99;
  OUTLINED_FUNCTION_6_1(v99, v79, v80, v77);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
  v82 = v100;
  OUTLINED_FUNCTION_11_56(v81, v83, v84, v81);
  Entity<A>.init(attributes:communicationTrigger:contactAddressTrigger:dateTimeRangeTrigger:dateTimeTrigger:geographicAreaTrigger:personTrigger:pointOfInterestTrigger:recurringDateTimeTrigger:specifyingContactTrigger:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(MEMORY[0x24BEE4AF8], v3, v92, v91, v90, v88, (uint64_t)v87, v86, v58, v61, v66, v70, v74, v78, v82, v85, v86, (uint64_t)v87, v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94);
  OUTLINED_FUNCTION_77_5();
  (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v4, v33);
  OUTLINED_FUNCTION_20_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
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
  uint64_t v64;

  OUTLINED_FUNCTION_17_3();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1F8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_30_3();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255141E58);
  v64 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_89();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_48_2();
  v63 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_45_0(v11, v52);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFC0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_16_30(v13, v53);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_27_24(v15, v54);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_79_1(v17, v55);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_68_7(v19, v56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_2_3();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
  OUTLINED_FUNCTION_6_1(v0, v22, v23, v21);
  v24 = objc_msgSend(v4, sel_title);
  v25 = objc_msgSend(v24, sel_spokenPhrase);

  sub_21B36B440();
  v26 = objc_msgSend(v4, sel_tasks);
  sub_21B1B5578();
  v27 = sub_21B36B5A8();

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_21B36BB30();
  }
  else
  {
    v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v28)
  {
LABEL_17:
    swift_bridgeObjectRelease_n();
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
    OUTLINED_FUNCTION_6_1(v57, v38, v39, v37);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
    OUTLINED_FUNCTION_6_1(v58, v41, v42, v40);
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
    OUTLINED_FUNCTION_6_1(v59, v44, v45, v43);
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFC8);
    OUTLINED_FUNCTION_6_1(v60, v47, v48, v46);
    v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
    OUTLINED_FUNCTION_6_1(v61, v50, v51, v49);
    Entity<A>.init(associatedDateTime:name:reminders:tags:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)();

    OUTLINED_FUNCTION_20_0();
    return;
  }
  if (v28 >= 1)
  {
    v29 = 0;
    v30 = MEMORY[0x24BEE4AF8];
    v62 = v2;
    do
    {
      if ((v27 & 0xC000000000000001) != 0)
        v31 = (id)MEMORY[0x220761AB4](v29, v27);
      else
        v31 = *(id *)(v27 + 8 * v29 + 32);
      v32 = v31;
      Entity<A>.init(_:)();
      OUTLINED_FUNCTION_0_8(v1, 0);

      if (__swift_getEnumTagSinglePayload(v1, 1, v6) == 1)
      {
        sub_21B163F9C(v1, &qword_25514E1F8);
      }
      else
      {
        OUTLINED_FUNCTION_89_7(v63, v1);
        OUTLINED_FUNCTION_89_7(v2, v63);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_82_3();
          v30 = v35;
        }
        v33 = *(_QWORD *)(v30 + 16);
        if (v33 >= *(_QWORD *)(v30 + 24) >> 1)
        {
          OUTLINED_FUNCTION_82_3();
          v30 = v36;
        }
        *(_QWORD *)(v30 + 16) = v33 + 1;
        v34 = v30
            + ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))
            + *(_QWORD *)(v64 + 72) * v33;
        v2 = v62;
        OUTLINED_FUNCTION_89_7(v34, v62);
      }
      ++v29;
    }
    while (v28 != v29);
    goto LABEL_17;
  }
  __break(1u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
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
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  char v101;

  OUTLINED_FUNCTION_17_3();
  v5 = v4;
  v99 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_9_64(v8, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_92(v10, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_45_0(v12, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_79_1(v14, v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3_2();
  v91 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE20);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_3_2();
  v89 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0E0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_12_0();
  v21 = v20;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_48_2();
  v24 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_128_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E058);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_18_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E128);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_5_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_8_17();
  v31 = v29 - v30;
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v86 - v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E130);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_2_3();
  v101 = 1;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1F0);
  OUTLINED_FUNCTION_6_1(v2, v37, v38, v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF70);
  OUTLINED_FUNCTION_11_33((uint64_t)v34, 1);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E198);
  v92 = v1;
  OUTLINED_FUNCTION_6_1(v1, v40, v41, v39);
  v90 = v31;
  OUTLINED_FUNCTION_11_33(v31, 1);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E060);
  v94 = v0;
  OUTLINED_FUNCTION_6_1(v0, v43, v44, v42);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1E0);
  v95 = v3;
  OUTLINED_FUNCTION_6_1(v3, v46, v47, v45);
  v100 = v5;
  v48 = objc_msgSend(v5, sel_triggerContact);
  if (v48)
  {
    v49 = v48;
    v50 = objc_msgSend(v48, sel_displayName);

    v51 = sub_21B36B440();
    v87 = v52;
    v88 = v51;

  }
  else
  {
    v87 = 0;
    v88 = 0;
  }
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0E8);
  v54 = OUTLINED_FUNCTION_23_38();
  __swift_storeEnumTagSinglePayload(v54, v55, v56, v53);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE28);
  v58 = v89;
  OUTLINED_FUNCTION_6_1(v89, v59, v60, v57);
  v61 = v21;
  v62 = OUTLINED_FUNCTION_24_42();
  __swift_storeEnumTagSinglePayload(v62, v63, v64, v53);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
  v66 = v91;
  OUTLINED_FUNCTION_6_1(v91, v67, v68, v65);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
  v70 = v93;
  OUTLINED_FUNCTION_6_1(v93, v71, v72, v69);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
  v74 = v96;
  OUTLINED_FUNCTION_6_1(v96, v75, v76, v73);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
  v78 = v97;
  OUTLINED_FUNCTION_6_1(v97, v79, v80, v77);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
  v82 = v98;
  OUTLINED_FUNCTION_4_66(v81, v83, v84, v81);
  Entity<A>.init(definedValue:age:associatedDate:associatedOrganization:attributes:birthdate:identifyingRelationship:location:name:phoneticName:phoneticStructuredName:relationships:specifyingContactAddress:structuredName:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)((uint64_t)&v101, v2, (uint64_t)v34, v92, MEMORY[0x24BEE4AF8], v90, v94, v95, v88, v87, 0, 0, v24, MEMORY[0x24BEE4AF8], v58, v61, v66, v70, v74,
    v78,
    v82,
    v85,
    v86,
    v87,
    v88,
    v89,
    v90,
    v91,
    v92,
    v93,
    v94,
    v95,
    v96);

  OUTLINED_FUNCTION_20_0();
}

#error "21B3564F0: call analysis failed (funcsize=254)"

void Entity<A>.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t EnumTagSinglePayload;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
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
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char v164;
  uint64_t v165;
  char v166;
  uint64_t v167;
  uint64_t v168;
  char v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  char v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  char v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  char v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t KeyPath;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  char v330;
  _BYTE v331[2];
  _BYTE v332[2];
  uint64_t v333;

  OUTLINED_FUNCTION_17_3();
  a19 = v25;
  a20 = v26;
  v28 = v27;
  v313 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514E090);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v31);
  v321 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E098);
  v312 = *(_QWORD *)(v321 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_68_7(v33, v290);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF48);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_12_0();
  v296 = v37;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_10_0(v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDB0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_12_0();
  v310 = v43;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v44);
  v315 = (uint64_t)&v290 - v45;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_48_2();
  v319 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v49);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF68);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v51);
  v324 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF70);
  v311 = *(_QWORD *)(v324 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_3_2();
  v320 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_93(v55, v290);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_9_64(v57, v290);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_92(v59, v290);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v60);
  OUTLINED_FUNCTION_16_30(v61, v290);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DEB8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v62);
  OUTLINED_FUNCTION_65_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DEC0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_20_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v64);
  OUTLINED_FUNCTION_89();
  MEMORY[0x24BDAC7A8](v65);
  v67 = (char *)&v290 - v66;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DEC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_3_2();
  v70 = v69;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD98);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v71);
  OUTLINED_FUNCTION_129();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_79_1(v73, v290);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142210);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v74);
  OUTLINED_FUNCTION_2_12();
  v75 = sub_21B3681E8();
  v76 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_45_0(v77, v290);
  v314 = v28;
  sub_21B328870(v24);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v24, 1, v75);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_84_5(EnumTagSinglePayload, &qword_255142210);
    v332[1] = 1;
    OUTLINED_FUNCTION_6_1(v323, v79, v80, v324);
    v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDA0);
    OUTLINED_FUNCTION_6_1(v22, v82, v83, v81);
    v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF00);
    OUTLINED_FUNCTION_6_1(v70, v85, v86, v84);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
    OUTLINED_FUNCTION_12_53((uint64_t)v67);
    v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E050);
    OUTLINED_FUNCTION_6_1(v20, v88, v89, v87);
    OUTLINED_FUNCTION_22_40(v21);
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
    v91 = v325;
    OUTLINED_FUNCTION_6_1(v325, v92, v93, v90);
    v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
    v95 = v327;
    OUTLINED_FUNCTION_6_1(v327, v96, v97, v94);
    v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
    v99 = v328;
    OUTLINED_FUNCTION_6_1(v328, v100, v101, v98);
    OUTLINED_FUNCTION_12_53(v23);
    v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
    v103 = v329;
    OUTLINED_FUNCTION_11_56(v102, v104, v105, v102);
    OUTLINED_FUNCTION_64_16();
    Entity<A>.init(definedValue:date:direction:name:occurringIn:offsetReference:offsetValue:time:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v106, v107, v108, v109, v110, v111, v112, v113, v21, v91, v95, v99, v23, v103, v290, v291, v292, v293, v294,
      v295,
      v296,
      v297,
      KeyPath,
      v299,
      v300,
      v301);
    OUTLINED_FUNCTION_81_8();
  }
  else
  {
    v301 = v22;
    v294 = v23;
    v302 = v67;
    v295 = v20;
    v303 = v21;
    v292 = v76;
    v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 32);
    v293 = v75;
    v114(v326, v24, v75);
    v332[0] = 5;
    v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E088);
    OUTLINED_FUNCTION_6_1(v307, v116, v117, v115);
    v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E0D8);
    OUTLINED_FUNCTION_6_1(v308, v119, v120, v118);
    v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDB8);
    OUTLINED_FUNCTION_12_53(v319);
    v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E158);
    OUTLINED_FUNCTION_6_1(v309, v123, v124, v122);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514E150);
    v125 = OUTLINED_FUNCTION_73_8((uint64_t)&a14);
    OUTLINED_FUNCTION_87_5(v125, v126, v127, v128, v129);
    v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DF00);
    v131 = v70;
    OUTLINED_FUNCTION_87_5(v70, 1, 1, v130, (uint64_t)&v333);
    v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E030);
    v133 = KeyPath;
    OUTLINED_FUNCTION_6_1(KeyPath, v134, v135, v132);
    v136 = v315;
    OUTLINED_FUNCTION_12_53(v315);
    v137 = v310;
    v138 = OUTLINED_FUNCTION_83_6();
    *(_QWORD *)(v139 - 256) = v121;
    OUTLINED_FUNCTION_28_35(v138, v140, v141);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
    v142 = v325;
    OUTLINED_FUNCTION_36_27();
    v318 = v143;
    __swift_storeEnumTagSinglePayload(v144, v145, v146, v143);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
    v147 = v327;
    OUTLINED_FUNCTION_36_27();
    v317 = v148;
    __swift_storeEnumTagSinglePayload(v149, v150, v151, v148);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
    v152 = v328;
    OUTLINED_FUNCTION_36_27();
    v316 = v153;
    __swift_storeEnumTagSinglePayload(v154, v155, v156, v153);
    v157 = v323;
    OUTLINED_FUNCTION_6_1(v323, v158, v159, v324);
    v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
    v161 = v329;
    OUTLINED_FUNCTION_87_5(v329, 1, 1, v160, (uint64_t)&a15);
    v284 = v152;
    v283 = v137;
    v162 = v136;
    v163 = v319;
    Entity<A>.init(definedValue:calendarEra:calendarSystem:dateType:dayOfMonth:dayOfWeek:monthOfYear:name:occurringIn:partOfRecurringDateTime:weekOfYear:year:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)((uint64_t)v332, v307, v308, MEMORY[0x24BEE4AF8], v319, v309, v20, 0, 0, v131, v133, v136, v283, v142, v147, v284, v157, v161, v290,
      v291,
      v292,
      v293,
      v294,
      v295,
      v296,
      v297,
      KeyPath,
      v299,
      v300,
      v301);
    sub_21B368140();
    v297 = v131;
    if ((v164 & 1) == 0)
    {
      v165 = sub_21B36817C();
      if ((v166 & 1) == 0)
      {
        v167 = v165;
        v168 = sub_21B368170();
        if ((v169 & 1) == 0)
        {
          v309 = v168;
          swift_getKeyPath();
          __swift_storeEnumTagSinglePayload(v142, 1, 1, v318);
          OUTLINED_FUNCTION_13_51(v147);
          v170 = v328;
          OUTLINED_FUNCTION_46_20(v328);
          v290 = v167;
          v171 = v304;
          __swift_storeEnumTagSinglePayload(v136, 1, 1, v304);
          v172 = v329;
          __swift_storeEnumTagSinglePayload(v329, 1, 1, v306);
          OUTLINED_FUNCTION_55_19();
          Entity<A>.init(integerValue:name:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v173, v174, v175, v176, v177, v178, v179, v136, v172, v287, v290, v291, v292, v293, v294, v295, v296, v297, KeyPath,
            v299,
            v300);
          OUTLINED_FUNCTION_11_33(v163, 0);
          v307 = sub_21B161AF8(&qword_25514DEE0, type metadata accessor for Common.Date, (uint64_t)&protocol conformance descriptor for Common.Date);
          v308 = sub_21B161AF8(&qword_25514DDC0, type metadata accessor for Common.Integer, (uint64_t)&protocol conformance descriptor for Common.Integer);
          OUTLINED_FUNCTION_56_18();
          KeyPath = swift_getKeyPath();
          v330 = 12;
          OUTLINED_FUNCTION_36_27();
          __swift_storeEnumTagSinglePayload(v180, v181, v182, v318);
          OUTLINED_FUNCTION_36_27();
          v183 = v317;
          __swift_storeEnumTagSinglePayload(v184, v185, v186, v317);
          v187 = OUTLINED_FUNCTION_30_34();
          __swift_storeEnumTagSinglePayload(v187, v188, v189, v316);
          v190 = v315;
          v191 = OUTLINED_FUNCTION_38_22();
          __swift_storeEnumTagSinglePayload(v191, v192, v193, v171);
          __swift_storeEnumTagSinglePayload(v172, 1, 1, v306);
          OUTLINED_FUNCTION_55_19();
          Entity<A>.init(integerValue:name:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v194, v195, v196, v197, v198, v199, v200, v190, v172, v288, v290, v291, v292, v293, v294, v295, v296, v297, KeyPath,
            v299,
            v300);
          OUTLINED_FUNCTION_11_33(v163, 0);
          OUTLINED_FUNCTION_3_23(v325, 1);
          OUTLINED_FUNCTION_36_27();
          __swift_storeEnumTagSinglePayload(v201, v202, v203, v183);
          OUTLINED_FUNCTION_0_8(v170, 1);
          v204 = OUTLINED_FUNCTION_73_8((uint64_t)&v328);
          __swift_storeEnumTagSinglePayload(v204, v206, v207, *(_QWORD *)(v205 - 256));
          v208 = v329;
          OUTLINED_FUNCTION_27_32();
          v209 = v305;
          Entity<A>.init(definedValue:integerValue:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)();
          OUTLINED_FUNCTION_11_33(v209, 0);
          sub_21B161AF8(&qword_25514DF90, type metadata accessor for Common.MonthOfYear, (uint64_t)&protocol conformance descriptor for Common.MonthOfYear);
          OUTLINED_FUNCTION_56_18();
          v305 = swift_getKeyPath();
          OUTLINED_FUNCTION_47_18(v325);
          OUTLINED_FUNCTION_13_51(v327);
          OUTLINED_FUNCTION_46_20(v170);
          v210 = v315;
          v211 = OUTLINED_FUNCTION_23_38();
          __swift_storeEnumTagSinglePayload(v211, v212, v213, v304);
          OUTLINED_FUNCTION_27_32();
          v285 = v208;
          v214 = v325;
          v147 = v327;
          Entity<A>.init(integerValue:name:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(v309, 0, 0, 0, v325, v327, v170, v210, v285, v289, v290, v291, v292, v293, v294, v295, v296, v297, KeyPath,
            v299,
            v300);
          OUTLINED_FUNCTION_3_23(v163, 0);
          v142 = v214;
          OUTLINED_FUNCTION_56_18();
        }
      }
    }
    v331[1] = 5;
    v215 = OUTLINED_FUNCTION_83_6();
    OUTLINED_FUNCTION_28_35(v215, v216, v217);
    OUTLINED_FUNCTION_12_53(v162);
    v218 = OUTLINED_FUNCTION_51_24();
    OUTLINED_FUNCTION_48_22(v218, v219, v220, (uint64_t)&v333);
    OUTLINED_FUNCTION_12_53(v310);
    v221 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1A0);
    OUTLINED_FUNCTION_6_1(v300, v222, v223, v221);
    __swift_storeEnumTagSinglePayload(v142, 1, 1, v318);
    OUTLINED_FUNCTION_13_51(v147);
    OUTLINED_FUNCTION_36_27();
    __swift_storeEnumTagSinglePayload(v224, v225, v226, v316);
    OUTLINED_FUNCTION_22_40(v303);
    v227 = OUTLINED_FUNCTION_51_24();
    v228 = v306;
    OUTLINED_FUNCTION_66_9(v227, v229, v230);
    v231 = v315;
    OUTLINED_FUNCTION_64_16();
    Entity<A>.init(definedValue:hour:minute:name:occurringIn:second:timeZone:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)();
    v232 = sub_21B368164();
    if ((v233 & 1) == 0)
    {
      v234 = v232;
      swift_getKeyPath();
      v235 = v325;
      OUTLINED_FUNCTION_47_18(v325);
      v236 = v327;
      OUTLINED_FUNCTION_13_51(v327);
      v237 = v328;
      __swift_storeEnumTagSinglePayload(v328, 1, 1, v316);
      __swift_storeEnumTagSinglePayload(v231, 1, 1, v304);
      v238 = v329;
      __swift_storeEnumTagSinglePayload(v329, 1, 1, v228);
      v286 = v238;
      v239 = v319;
      OUTLINED_FUNCTION_86_6(v234, 0, 0, 0, v235, v236, v237, v240, v286, v287, v290, v291, v292, v293, v294, v295, v296, v297, KeyPath,
        v299,
        v300);
      OUTLINED_FUNCTION_11_33(v239, 0);
      v241 = sub_21B161AF8(&qword_25514DEF8, type metadata accessor for Common.Time, (uint64_t)&protocol conformance descriptor for Common.Time);
      v242 = sub_21B161AF8(&qword_25514DDC0, type metadata accessor for Common.Integer, (uint64_t)&protocol conformance descriptor for Common.Integer);
      OUTLINED_FUNCTION_74_9();
      sub_21B368194();
      if ((v243 & 1) == 0)
      {
        v309 = swift_getKeyPath();
        __swift_storeEnumTagSinglePayload(v325, 1, 1, v318);
        OUTLINED_FUNCTION_13_51(v327);
        v310 = v242;
        __swift_storeEnumTagSinglePayload(v328, 1, 1, v316);
        __swift_storeEnumTagSinglePayload(v231, 1, 1, v304);
        __swift_storeEnumTagSinglePayload(v329, 1, 1, v228);
        v244 = OUTLINED_FUNCTION_37_29();
        OUTLINED_FUNCTION_86_6(v244, v245, v246, v247, v248, v249, v250, v251, v290, v291, v292, v293, v294, v295, v296, v297, KeyPath, v299, v300,
          v301,
          (uint64_t)v302);
        OUTLINED_FUNCTION_50_21();
        OUTLINED_FUNCTION_74_9();
        sub_21B3681A0();
        if ((v252 & 1) == 0)
        {
          v309 = swift_getKeyPath();
          __swift_storeEnumTagSinglePayload(v325, 1, 1, v318);
          OUTLINED_FUNCTION_13_51(v327);
          v308 = v241;
          __swift_storeEnumTagSinglePayload(v328, 1, 1, v316);
          __swift_storeEnumTagSinglePayload(v231, 1, 1, v304);
          __swift_storeEnumTagSinglePayload(v329, 1, 1, v228);
          v253 = OUTLINED_FUNCTION_37_29();
          OUTLINED_FUNCTION_86_6(v253, v254, v255, v256, v257, v258, v259, v260, v292, v293, v294, v295, v296, v297, KeyPath, v299, v300, v301, (uint64_t)v302,
            v303,
            v304);
          OUTLINED_FUNCTION_50_21();
          sub_21B36A4D4();
        }
      }
    }
    v331[0] = 1;
    v261 = v323;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v311 + 16))(v323, v320, v324);
    OUTLINED_FUNCTION_21_4();
    OUTLINED_FUNCTION_28_35(v262, v263, v264);
    v265 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDA0);
    OUTLINED_FUNCTION_6_1(v301, v266, v267, v265);
    v268 = v297;
    v269 = OUTLINED_FUNCTION_30_34();
    OUTLINED_FUNCTION_48_22(v269, v270, v271, (uint64_t)&v333);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514DED8);
    OUTLINED_FUNCTION_12_53((uint64_t)v302);
    v272 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E050);
    v273 = v295;
    OUTLINED_FUNCTION_6_1(v295, v274, v275, v272);
    v276 = v303;
    v277 = v321;
    OUTLINED_FUNCTION_48_5(v303, v322, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v312 + 16));
    OUTLINED_FUNCTION_45_25(v276);
    v278 = v325;
    OUTLINED_FUNCTION_47_18(v325);
    v279 = v327;
    OUTLINED_FUNCTION_13_51(v327);
    v280 = v328;
    OUTLINED_FUNCTION_46_20(v328);
    v281 = v294;
    OUTLINED_FUNCTION_12_53(v294);
    v282 = v329;
    OUTLINED_FUNCTION_27_32();
    Entity<A>.init(definedValue:date:direction:name:occurringIn:offsetReference:offsetValue:time:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)((uint64_t)v331, v261, v301, 0, 0, v268, (uint64_t)v302, v273, v276, v278, v279, v280, v281, v282, v294, v295, v296, v297, KeyPath,
      v299,
      v300,
      v301,
      (uint64_t)v302,
      v303,
      v304,
      v305);
    OUTLINED_FUNCTION_81_8();
    (*(void (**)(uint64_t, uint64_t))(v312 + 8))(v322, v277);
    (*(void (**)(uint64_t, uint64_t))(v311 + 8))(v320, v324);
    (*(void (**)(uint64_t, uint64_t))(v292 + 8))(v326, v293);
  }
  OUTLINED_FUNCTION_20_0();
}

{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
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
  uint64_t KeyPath;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v165;
  char v166[9];

  OUTLINED_FUNCTION_17_3();
  a19 = v21;
  a20 = v22;
  v150 = v23;
  v146 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_3_2();
  v145 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_3_2();
  v152 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_3_2();
  v151 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_93(v32, KeyPath);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD68);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_45_0(v34, KeyPath);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_9_64(v36, KeyPath);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_92(v38, KeyPath);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DCE8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_3_2();
  v147 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_8_17();
  v44 = v42 - v43;
  v149 = v42 - v43;
  v46 = MEMORY[0x24BDAC7A8](v45);
  v48 = (char *)&KeyPath - v47;
  v49 = MEMORY[0x24BDAC7A8](v46);
  v51 = (char *)&KeyPath - v50;
  v52 = MEMORY[0x24BDAC7A8](v49);
  v148 = (uint64_t)&KeyPath - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v56 = (char *)&KeyPath - v55;
  v153 = (uint64_t)&KeyPath - v55;
  MEMORY[0x24BDAC7A8](v54);
  v58 = (char *)&KeyPath - v57;
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1D8);
  v144 = *(_QWORD *)(v59 - 8);
  v158 = v59;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v60);
  OUTLINED_FUNCTION_30_3();
  v155 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514DDE8);
  v154 = v58;
  OUTLINED_FUNCTION_10_15((uint64_t)v58);
  OUTLINED_FUNCTION_10_15((uint64_t)v56);
  OUTLINED_FUNCTION_57_12();
  OUTLINED_FUNCTION_10_15((uint64_t)v51);
  OUTLINED_FUNCTION_10_15((uint64_t)v48);
  OUTLINED_FUNCTION_10_15(v44);
  v156 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1B8);
  v61 = v147;
  OUTLINED_FUNCTION_6_1(v147, v62, v63, v156);
  v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DFE0);
  v64 = v162;
  OUTLINED_FUNCTION_6_1(v162, v65, v66, v157);
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E160);
  v67 = v163;
  OUTLINED_FUNCTION_6_1(v163, v68, v69, v159);
  v70 = v161;
  OUTLINED_FUNCTION_3_23(v161, 1);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE40);
  v71 = v164;
  __swift_storeEnumTagSinglePayload(v164, 1, 1, v160);
  v136 = v71;
  v132 = v64;
  v133 = v67;
  v72 = v61;
  v73 = v153;
  v74 = v148;
  Entity<A>.init(city:country:crossStreet:label:neighborhood:postalCode:province:street:streetNumber:subStreetAddress:value:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)((uint64_t)v58, v153, v148, 0, 0, (uint64_t)v51, 0, 0, (uint64_t)v48, v149, 0, 0, 0, 0, 0, 0, v61, v132, v133,
    v70,
    v136,
    v138,
    KeyPath,
    v142,
    v143,
    v144,
    v145,
    v146,
    v147,
    v148,
    v149,
    (uint64_t)v150,
    v151);
  KeyPath = swift_getKeyPath();
  v166[0] = 2;
  v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E138);
  v75 = v151;
  OUTLINED_FUNCTION_7_63(v149, v76, v77, v149);
  OUTLINED_FUNCTION_10_15(v73);
  v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514E1E0);
  v78 = v152;
  OUTLINED_FUNCTION_6_1(v152, v79, v80, v143);
  sub_21B3581C0(v150, (SEL *)&selRef_thoroughfare);
  v82 = v81;
  v84 = v83;
  OUTLINED_FUNCTION_22_40(v61);
  v85 = v162;
  v86 = OUTLINED_FUNCTION_51_24();
  OUTLINED_FUNCTION_76_10(v86, v87, v88);
  v89 = v163;
  OUTLINED_FUNCTION_85_6(v163, 1, 1);
  OUTLINED_FUNCTION_57_12();
  v90 = v164;
  __swift_storeEnumTagSinglePayload(v164, 1, 1, v160);
  v135 = v74;
  v134 = v89;
  v91 = (uint64_t)v154;
  v92 = v75;
  Entity<A>.init(definedValue:areaType:associatedPerson:containedIn:contains:name:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)((uint64_t)v166, 0, 0, v75, v153, v78, v82, v84, v72, v85, v134, v135, v90, v139, KeyPath, v142, v143, v144, v145,
    v146,
    v147,
    v148,
    v149,
    (uint64_t)v150,
    v151);
  OUTLINED_FUNCTION_68_12(v91);
  sub_21B161AF8(&qword_25514DD80, type metadata accessor for Common.PostalAddress, (uint64_t)&protocol conformance descriptor for Common.PostalAddress);
  v142 = sub_21B161AF8(&qword_25514DD90, type metadata accessor for Common.GeographicArea, (uint64_t)&protocol conformance descriptor for Common.GeographicArea);
  OUTLINED_FUNCTION_56_18();
  v93 = swift_getKeyPath();
  v94 = v150;
  OUTLINED_FUNCTION_69_13(v93, (SEL *)&selRef_subThoroughfare);
  sub_21B36A4E0();
  KeyPath = swift_getKeyPath();
  v165 = 2;
  __swift_storeEnumTagSinglePayload(v92, 1, 1, v149);
  OUTLINED_FUNCTION_59_16();
  OUTLINED_FUNCTION_36_27();
  v98 = OUTLINED_FUNCTION_48_22(v95, v96, v97, (uint64_t)&a17);
  OUTLINED_FUNCTION_69_13(v98, (SEL *)&selRef_locality);
  v100 = v99;
  v102 = v101;
  v103 = v72;
  OUTLINED_FUNCTION_22_40(v72);
  v104 = v162;
  v105 = OUTLINED_FUNCTION_24_42();
  OUTLINED_FUNCTION_76_10(v105, v106, v107);
  v108 = v163;
  v109 = OUTLINED_FUNCTION_23_38();
  OUTLINED_FUNCTION_85_6(v109, v110, v111);
  v112 = v148;
  OUTLINED_FUNCTION_59_16();
  v113 = v164;
  __swift_storeEnumTagSinglePayload(v164, 1, 1, v160);
  v137 = v113;
  v114 = (uint64_t)v154;
  Entity<A>.init(definedValue:areaType:associatedPerson:containedIn:contains:name:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)((uint64_t)&v165, 0, 0, v151, v153, v152, v100, v102, v103, v104, v108, v112, v137, v140, KeyPath, v142, v143, v144, v145,
    v146,
    v147,
    v148,
    v149,
    (uint64_t)v150,
    v151);
  OUTLINED_FUNCTION_68_12(v114);
  v115 = v158;
  OUTLINED_FUNCTION_56_18();
  v116 = swift_getKeyPath();
  OUTLINED_FUNCTION_69_13(v116, (SEL *)&selRef_postalCode);
  sub_21B36A4E0();
  v117 = v144;
  v118 = v161;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v144 + 16))(v161, v104, v115);
  OUTLINED_FUNCTION_0_8(v118, 0);
  v119 = OUTLINED_FUNCTION_23_38();
  __swift_storeEnumTagSinglePayload(v119, v120, v121, v149);
  v122 = OUTLINED_FUNCTION_10_15(v114);
  OUTLINED_FUNCTION_69_13(v122, (SEL *)&selRef_name);
  OUTLINED_FUNCTION_22_40(v147);
  v123 = OUTLINED_FUNCTION_30_34();
  OUTLINED_FUNCTION_76_10(v123, v124, v125);
  v126 = OUTLINED_FUNCTION_38_22();
  OUTLINED_FUNCTION_85_6(v126, v127, v128);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DD70);
  OUTLINED_FUNCTION_6_1(v145, v130, v131, v129);
  __swift_storeEnumTagSinglePayload(v164, 1, 1, v160);
  Entity<A>.init(address:associatedPerson:categories:containedIn:name:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)();

  (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v155, v158);
  OUTLINED_FUNCTION_20_0();
}

void sub_21B358184(void *a1)
{
  sub_21B3581C0(a1, (SEL *)&selRef_name);
}

void sub_21B358190(void *a1)
{
  sub_21B3581C0(a1, (SEL *)&selRef_thoroughfare);
}

void sub_21B35819C(void *a1)
{
  sub_21B3581C0(a1, (SEL *)&selRef_subThoroughfare);
}

void sub_21B3581A8(void *a1)
{
  sub_21B3581C0(a1, (SEL *)&selRef_locality);
}

void sub_21B3581B4(void *a1)
{
  sub_21B3581C0(a1, (SEL *)&selRef_postalCode);
}

void sub_21B3581C0(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_21B36B440();

  }
  OUTLINED_FUNCTION_4_7();
}

void sub_21B358214()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OUTLINED_FUNCTION_35_27();
  v2 = OUTLINED_FUNCTION_52_22((uint64_t)v1);
  sub_21B3582A4(v2, v3);
  *(_QWORD *)(v0 + 32) = v4;
  OUTLINED_FUNCTION_4_7();
}

void sub_21B358248()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OUTLINED_FUNCTION_35_27();
  v2 = OUTLINED_FUNCTION_52_22((uint64_t)v1);
  sub_21B3583C4(v2, v3);
  *(_QWORD *)(v0 + 32) = v4;
  OUTLINED_FUNCTION_4_7();
}

void sub_21B358278(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_21B3582A4(uint64_t a1, uint64_t a2)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_29_34(a1, a2);
  sub_21B347CB8(v4, v5, v6);
  if (v3)
    OUTLINED_FUNCTION_54_14();
  *v2 = OUTLINED_FUNCTION_53_24();
  OUTLINED_FUNCTION_4_7();
}

uint64_t sub_21B3582E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21B35832C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514DE78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21B3583C4(uint64_t a1, uint64_t a2)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_29_34(a1, a2);
  sub_21B347CB8(v4, v5, v6);
  if (v3)
    OUTLINED_FUNCTION_54_14();
  *v2 = OUTLINED_FUNCTION_53_24();
  OUTLINED_FUNCTION_4_7();
}

void sub_21B358404(id *a1)
{

}

uint64_t OUTLINED_FUNCTION_4_66(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_7_63(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
}

void OUTLINED_FUNCTION_9_64(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_11_56(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_12_53(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_13_51(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, *(_QWORD *)(v1 - 200));
}

uint64_t OUTLINED_FUNCTION_22_40(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, *(_QWORD *)(v1 - 168));
}

uint64_t OUTLINED_FUNCTION_23_38()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_24_42()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_27_32()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, *(_QWORD *)(v1 - 288));
}

uint64_t OUTLINED_FUNCTION_28_35(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_29_34(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_30_34()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_32_31(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void *OUTLINED_FUNCTION_35_27()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_37_29()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_38_22()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_45_25(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_46_20(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, *(_QWORD *)(v1 - 208));
}

uint64_t OUTLINED_FUNCTION_47_18(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, *(_QWORD *)(v1 - 192));
}

uint64_t OUTLINED_FUNCTION_48_22@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, *(_QWORD *)(a4 - 256));
}

uint64_t OUTLINED_FUNCTION_50_21()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_51_24()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_52_22(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

id OUTLINED_FUNCTION_53_24()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1 + 32);
}

void OUTLINED_FUNCTION_54_14()
{
  JUMPOUT(0x220761AB4);
}

uint64_t OUTLINED_FUNCTION_56_18()
{
  return sub_21B36A4D4();
}

uint64_t OUTLINED_FUNCTION_57_12()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_59_16()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

void OUTLINED_FUNCTION_63_13(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_65_7()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_66_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_68_12(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

void OUTLINED_FUNCTION_69_13(uint64_t a1, SEL *a2)
{
  void *v2;

  sub_21B3581C0(v2, a2);
}

uint64_t OUTLINED_FUNCTION_73_8@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_74_9()
{
  return sub_21B36A4D4();
}

void OUTLINED_FUNCTION_75_9()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_76_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, *(_QWORD *)(v3 - 160));
}

void OUTLINED_FUNCTION_77_5()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_78_5()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 128);
}

void OUTLINED_FUNCTION_80_7()
{
  void *v0;

}

void OUTLINED_FUNCTION_81_8()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_82_3()
{
  sub_21B29C27C();
}

uint64_t OUTLINED_FUNCTION_83_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_84_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_21B163F9C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_85_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, *(_QWORD *)(v3 - 144));
}

void OUTLINED_FUNCTION_86_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;

  Entity<A>.init(integerValue:name:usoAssociatedApp:usoListPosition:usoQuantifier:usoSameAs:usoSearchQualifier:)(a1, a2, a3, a4, a5, a6, a7, v21, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21);
}

uint64_t OUTLINED_FUNCTION_87_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_QWORD *)(a5 - 256) = a4;
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_89_7(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t sub_21B35877C(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 120);
}

_OWORD *sub_21B3587B0(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  v7 = a2[9];
  a1[9] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 120, (uint64_t)a2 + 120);
  return a1;
}

uint64_t *sub_21B35884C(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  __swift_assign_boxed_opaque_existential_1(a1 + 15, a2 + 15);
  return a1;
}

void *__swift_memcpy160_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA0uLL);
}

uint64_t sub_21B3588A0(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  return a1;
}

uint64_t sub_21B358930(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 160))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_21B358970(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 160) = 1;
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
    *(_BYTE *)(result + 160) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ContinueInAppDialogStrategy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ContinueInAppDialogStrategy);
}

void sub_21B3589E4()
{
  JUMPOUT(0x2207623FCLL);
}

uint64_t sub_21B3589F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B1F2A74;
  return sub_21B36871C();
}

uint64_t sub_21B358A70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_21B36AC90();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  sub_21B36AC18();
  sub_21B36AC0C();
  sub_21B36AC00();
  swift_release();
  sub_21B36AC9C();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BEA8D78], v0);
  v7 = sub_21B36AC84();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

uint64_t type metadata accessor for NetworkAvailabilityProvider()
{
  return objc_opt_self();
}

uint64_t static Snippet.Contact.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_21B36BCBC(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
    {
      return 1;
    }
    else
    {
      OUTLINED_FUNCTION_26_4();
      return sub_21B36BCBC();
    }
  }
  return result;
}

uint64_t Snippet.Contact.init(identifier:name:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t Snippet.Contact.identifier.getter()
{
  OUTLINED_FUNCTION_62_0();
  return OUTLINED_FUNCTION_26_4();
}

void Snippet.Contact.identifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_4_7();
}

uint64_t (*Snippet.Contact.identifier.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t Snippet.Contact.name.getter()
{
  OUTLINED_FUNCTION_62_0();
  return OUTLINED_FUNCTION_26_4();
}

void Snippet.Contact.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  OUTLINED_FUNCTION_4_7();
}

uint64_t (*Snippet.Contact.name.modify())(_QWORD)
{
  return nullsub_1;
}

uint64_t Snippet.Contact.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_21B36B4B8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_62_0();
  sub_21B36B4B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21B358D58(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v3 || (sub_21B36BCBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21B36BCBC();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21B358E34(char a1)
{
  if ((a1 & 1) != 0)
    return 1701667182;
  else
    return 0x696669746E656469;
}

uint64_t sub_21B358E6C()
{
  char *v0;

  return sub_21B358E34(*v0);
}

uint64_t sub_21B358E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21B358D58(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21B358E98()
{
  sub_21B358FD0();
  return sub_21B36BDDC();
}

uint64_t sub_21B358EC0()
{
  sub_21B358FD0();
  return sub_21B36BDE8();
}

void Snippet.Contact.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_3();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255151CB0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_20_4();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_21B358FD0();
  sub_21B36BDD0();
  OUTLINED_FUNCTION_113();
  if (!v0)
    OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_29_35(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_0_10();
}

unint64_t sub_21B358FD0()
{
  unint64_t result;

  result = qword_255151CB8;
  if (!qword_255151CB8)
  {
    result = MEMORY[0x2207623FC](&unk_21B38CF74, &_s14descr24DE733C1C7ContactV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151CB8);
  }
  return result;
}

uint64_t Snippet.Contact.hashValue.getter()
{
  OUTLINED_FUNCTION_17_4();
  swift_bridgeObjectRetain();
  sub_21B36B4B8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_62_0();
  sub_21B36B4B8();
  OUTLINED_FUNCTION_31_0();
  return OUTLINED_FUNCTION_25_5();
}

void Snippet.Contact.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;

  OUTLINED_FUNCTION_11_3();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151CC0);
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x24BDAC7A8](v6);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_21B358FD0();
  sub_21B36BDB8();
  if (v0)
  {
    OUTLINED_FUNCTION_110();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_14_48();
    v9 = v8;
    swift_bridgeObjectRetain();
    v10 = OUTLINED_FUNCTION_14_48();
    v12 = v11;
    v13 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
    v14 = v10;
    OUTLINED_FUNCTION_10_49(v13);
    *v5 = v7;
    v5[1] = v9;
    v5[2] = v14;
    v5[3] = v12;
    OUTLINED_FUNCTION_62_0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0_10();
}

void sub_21B3591BC()
{
  Snippet.Contact.init(from:)();
}

void sub_21B3591D0()
{
  Snippet.Contact.encode(to:)();
}

unint64_t sub_21B3591F0()
{
  unint64_t result;

  result = qword_255151CC8;
  if (!qword_255151CC8)
  {
    result = MEMORY[0x2207623FC](&protocol conformance descriptor for Snippet.Contact, &type metadata for Snippet.Contact);
    atomic_store(result, (unint64_t *)&qword_255151CC8);
  }
  return result;
}

void type metadata accessor for Snippet.Contact()
{
  OUTLINED_FUNCTION_173();
}

ValueMetadata *_s14descr24DE733C1C7ContactV10CodingKeysOMa()
{
  return &_s14descr24DE733C1C7ContactV10CodingKeysON;
}

unint64_t sub_21B359254()
{
  unint64_t result;

  result = qword_255151CD0;
  if (!qword_255151CD0)
  {
    result = MEMORY[0x2207623FC](&unk_21B38CF4C, &_s14descr24DE733C1C7ContactV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151CD0);
  }
  return result;
}

unint64_t sub_21B359294()
{
  unint64_t result;

  result = qword_255151CD8;
  if (!qword_255151CD8)
  {
    result = MEMORY[0x2207623FC](&unk_21B38CEBC, &_s14descr24DE733C1C7ContactV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151CD8);
  }
  return result;
}

unint64_t sub_21B3592D4()
{
  unint64_t result;

  result = qword_255151CE0;
  if (!qword_255151CE0)
  {
    result = MEMORY[0x2207623FC](&unk_21B38CEE4, &_s14descr24DE733C1C7ContactV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151CE0);
  }
  return result;
}

uint64_t sub_21B359310(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_21B359368(a1);
  if (!v3 && *(_QWORD *)(a2 + 16))
    OUTLINED_FUNCTION_62_0();
  return OUTLINED_FUNCTION_26_4();
}

uint64_t sub_21B359368(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v1 = objc_allocWithZone(MEMORY[0x24BDBAD88]);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21B36B434();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithStringValue_, v2);

  v4 = v3;
  v5 = objc_msgSend(v4, sel_formattedStringValue);
  if (v5)
  {
    v6 = v5;
    v7 = sub_21B36B440();

  }
  else
  {

    v7 = 0;
  }

  return v7;
}

uint64_t sub_21B35944C()
{
  swift_bridgeObjectRetain();
  sub_21B180088();
  OUTLINED_FUNCTION_31_0();
  swift_bridgeObjectRetain();
  sub_21B180088();
  return swift_bridgeObjectRelease();
}

void sub_21B3594A8(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  char v6;

  sub_21B17DB9C(a1, a3);
  if ((v6 & 1) != 0)
    sub_21B17DB9C(a2, a4);
}

uint64_t sub_21B3594EC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x73656E6F6870 && a2 == 0xE600000000000000;
  if (v3 || (sub_21B36BCBC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736C69616D65 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21B36BCBC();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21B3595C8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x736C69616D65;
  else
    return 0x73656E6F6870;
}

void sub_21B3595F0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11_3();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151D28);
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_20_4();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_21B35A3D4();
  sub_21B36BDD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551471C0);
  sub_21B2BD8F4(&qword_255151D30, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  OUTLINED_FUNCTION_5_73();
  if (!v0)
    OUTLINED_FUNCTION_5_73();
  OUTLINED_FUNCTION_29_35(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_0_10();
}

void sub_21B3596E4()
{
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_62_0();
  sub_21B180088();
  OUTLINED_FUNCTION_31_0();
  swift_bridgeObjectRetain();
  sub_21B180088();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_5();
  OUTLINED_FUNCTION_13_4();
}

uint64_t sub_21B35973C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  OUTLINED_FUNCTION_11_3();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151D08);
  OUTLINED_FUNCTION_48_0();
  MEMORY[0x24BDAC7A8](v3);
  v4 = v2[3];
  __swift_project_boxed_opaque_existential_1(v2, v4);
  sub_21B35A3D4();
  sub_21B36BDB8();
  if (v0)
  {
    OUTLINED_FUNCTION_110();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2551471C0);
    sub_21B2BD8F4(&qword_255151D20, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_4_67();
    v4 = v6;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_4_67();
    OUTLINED_FUNCTION_15_20();
    OUTLINED_FUNCTION_62_0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5_7();
  }
  return v4;
}

void sub_21B35989C()
{
  sub_21B36BD70();
  sub_21B36BD7C();
  OUTLINED_FUNCTION_25_5();
  OUTLINED_FUNCTION_13_4();
}

uint64_t sub_21B3598D0()
{
  char *v0;

  return sub_21B3595C8(*v0);
}

uint64_t sub_21B3598D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21B3594EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21B3598FC()
{
  sub_21B35A3D4();
  return sub_21B36BDDC();
}

uint64_t sub_21B359924()
{
  sub_21B35A3D4();
  return sub_21B36BDE8();
}

uint64_t sub_21B35994C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21B35973C();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v4;
  }
  return result;
}

void sub_21B359974()
{
  sub_21B3595F0();
}

void sub_21B35998C()
{
  sub_21B3596E4();
}

uint64_t sub_21B359994()
{
  return sub_21B35944C();
}

uint64_t sub_21B35999C()
{
  sub_21B36BD70();
  swift_bridgeObjectRetain();
  sub_21B180088();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21B180088();
  swift_bridgeObjectRelease();
  return sub_21B36BDA0();
}

void sub_21B359A08(_QWORD **a1, _QWORD **a2)
{
  sub_21B3594A8(*a1, a1[1], *a2, a2[1]);
}

uint64_t sub_21B359A1C()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0C0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21B36D370;
  *(_QWORD *)(v0 + 32) = objc_msgSend((id)objc_opt_self(), sel_descriptorForRequiredKeysForStyle_, 0);
  result = sub_21B36B5C0();
  qword_25517AC10 = v0;
  return result;
}

double sub_21B359AA4@<D0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  objc_class *v17;
  objc_class *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double result;
  uint64_t v36;
  NSObject *v37;
  objc_class *v38;
  os_log_type_t v39;
  uint8_t *v40;
  objc_class *v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)objc_opt_self();
  v53 = a2;
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_10_4();
  sub_21B29B764();
  v9 = (void *)sub_21B36B59C();
  OUTLINED_FUNCTION_31_0();
  v10 = objc_msgSend(v8, sel_predicateForContactsMatchingHandleStrings_, v9);

  if (qword_255141590 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151CE8);
  v11 = (void *)sub_21B36B59C();
  v53 = 0;
  v12 = objc_msgSend(a3, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v10, v11, &v53);

  v13 = v53;
  if (!v12)
  {
    v20 = v53;
    v14 = sub_21B36826C();

    swift_willThrow();
LABEL_27:
    if (qword_2551411F0 != -1)
      swift_once();
    v46 = OUTLINED_FUNCTION_9_0();
    __swift_project_value_buffer(v46, (uint64_t)&unk_25517A6F8);
    OUTLINED_FUNCTION_13_52();
    OUTLINED_FUNCTION_32_32();
    sub_21B36B29C();
    v47 = OUTLINED_FUNCTION_51();
    if (os_log_type_enabled((os_log_t)v14, v47))
    {
      v48 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v49 = OUTLINED_FUNCTION_3_3();
      v54 = a2;
      v55[0] = v49;
      *(_DWORD *)v48 = 136315138;
      v53 = a1;
      OUTLINED_FUNCTION_101();
      OUTLINED_FUNCTION_10_4();
      v50 = sub_21B36B47C();
      sub_21B196024(v50, v51, v55);
      OUTLINED_FUNCTION_27_33();
      sub_21B36B818();
      OUTLINED_FUNCTION_71_0();
      OUTLINED_FUNCTION_71_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17_1(&dword_21B15D000, v14, v47, "[Snippet.ContactResolver] Could not find contact matching handles: %s", v48);
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_71_0();
    OUTLINED_FUNCTION_71_0();

    goto LABEL_32;
  }
  sub_21B35A24C();
  v14 = sub_21B36B5A8();
  v15 = v13;

  if (v14 >> 62)
  {
    OUTLINED_FUNCTION_62_0();
    if (sub_21B36BB30())
      goto LABEL_6;
    goto LABEL_26;
  }
  v16 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_62_0();
  if (!v16)
  {
LABEL_26:
    OUTLINED_FUNCTION_71_0();
    goto LABEL_27;
  }
LABEL_6:
  sub_21B347CB8(0, (v14 & 0xC000000000000001) == 0, v14);
  if ((v14 & 0xC000000000000001) != 0)
    v17 = (objc_class *)MEMORY[0x220761AB4](0, v14);
  else
    v17 = (objc_class *)*(id *)(v14 + 32);
  v18 = v17;
  OUTLINED_FUNCTION_31_0();
  if (v14 >> 62)
  {
    OUTLINED_FUNCTION_62_0();
    v19 = sub_21B36BB30();
    OUTLINED_FUNCTION_31_0();
  }
  else
  {
    v19 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  OUTLINED_FUNCTION_31_0();
  if (v19 >= 2)
  {
    v52 = v10;
    if (qword_2551411F0 != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_9_0();
    __swift_project_value_buffer(v21, (uint64_t)&unk_25517A6F8);
    OUTLINED_FUNCTION_13_52();
    OUTLINED_FUNCTION_32_32();
    sub_21B36B29C();
    v22 = OUTLINED_FUNCTION_51();
    if (os_log_type_enabled((os_log_t)v14, v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v24 = OUTLINED_FUNCTION_3_3();
      v54 = a2;
      v55[0] = v24;
      *(_DWORD *)v23 = 136315138;
      v53 = a1;
      OUTLINED_FUNCTION_101();
      OUTLINED_FUNCTION_10_4();
      v25 = sub_21B36B47C();
      sub_21B196024(v25, v26, v55);
      OUTLINED_FUNCTION_27_33();
      sub_21B36B818();
      OUTLINED_FUNCTION_71_0();
      OUTLINED_FUNCTION_71_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_17_1(&dword_21B15D000, v14, v22, "[Snippet.ContactResolver] Found multiple contacts when expecting only one. Taking first result matching: %s", v23);
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_71_0();
    OUTLINED_FUNCTION_71_0();
    v10 = v52;
  }
  v27 = sub_21B35A198((uint64_t)v18, (uint64_t)a1, (uint64_t)a2);
  if (v28)
  {
    v29 = v27;
    v30 = v28;
    v31 = -[objc_class identifier](v18, sel_identifier);
    v32 = sub_21B36B440();
    v34 = v33;

    *a4 = v32;
    a4[1] = v34;
    a4[2] = v29;
    a4[3] = v30;
    return result;
  }
  if (qword_2551411F0 != -1)
    swift_once();
  v36 = OUTLINED_FUNCTION_9_0();
  v37 = __swift_project_value_buffer(v36, (uint64_t)&unk_25517A6F8);
  v38 = v18;
  sub_21B36B29C();
  v39 = OUTLINED_FUNCTION_51();
  if (os_log_type_enabled(v37, v39))
  {
    v40 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v53 = (id)OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v40 = 136315138;
    v41 = v38;
    v42 = -[objc_class description](v41, sel_description);
    v43 = sub_21B36B440();
    v45 = v44;

    v55[0] = sub_21B196024(v43, v45, (uint64_t *)&v53);
    sub_21B36B818();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_17_1(&dword_21B15D000, v37, v39, "[Snippet.ContactResolver] Could not get name from contact %s)", v40);
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_3();
  }

LABEL_32:
  result = 0.0;
  *(_OWORD *)a4 = 0u;
  *((_OWORD *)a4 + 1) = 0u;
  return result;
}

uint64_t sub_21B35A198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACC0]), sel_init);
  objc_msgSend(v6, sel_setStyle_, 0);
  v7 = objc_msgSend(v6, sel_stringFromContact_, a1);
  if (v7)
  {
    v8 = v7;
    v9 = sub_21B36B440();

  }
  else
  {
    v9 = sub_21B359310(a2, a3);

  }
  return v9;
}

unint64_t sub_21B35A24C()
{
  unint64_t result;

  result = qword_255151CF0;
  if (!qword_255151CF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255151CF0);
  }
  return result;
}

uint64_t sub_21B35A28C()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_21B35A2B4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_62_0();
  return a1;
}

_QWORD *sub_21B35A2E4(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_21B35A340(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

void _s14descr24DE733C1C14ContactHandlesVMa()
{
  OUTLINED_FUNCTION_173();
}

void _s14descr24DE733C1C15ContactResolverVMa()
{
  OUTLINED_FUNCTION_173();
}

unint64_t sub_21B35A398()
{
  unint64_t result;

  result = qword_255151D00;
  if (!qword_255151D00)
  {
    result = MEMORY[0x2207623FC](&unk_21B38CFF0, &unk_24DE73288);
    atomic_store(result, (unint64_t *)&qword_255151D00);
  }
  return result;
}

unint64_t sub_21B35A3D4()
{
  unint64_t result;

  result = qword_255151D10;
  if (!qword_255151D10)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D170, &_s14descr24DE733C1C14ContactHandlesV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151D10);
  }
  return result;
}

uint64_t _s14descr24DE733C1C7ContactV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21B35A45C + 4 * byte_21B38CDC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21B35A490 + 4 * byte_21B38CDC0[v4]))();
}

uint64_t sub_21B35A490(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21B35A498(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21B35A4A0);
  return result;
}

uint64_t sub_21B35A4AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21B35A4B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21B35A4B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21B35A4C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr24DE733C1C14ContactHandlesV10CodingKeysOMa()
{
  return &_s14descr24DE733C1C14ContactHandlesV10CodingKeysON;
}

unint64_t sub_21B35A4E0()
{
  unint64_t result;

  result = qword_255151D38;
  if (!qword_255151D38)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D148, &_s14descr24DE733C1C14ContactHandlesV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151D38);
  }
  return result;
}

unint64_t sub_21B35A520()
{
  unint64_t result;

  result = qword_255151D40;
  if (!qword_255151D40)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D0B8, &_s14descr24DE733C1C14ContactHandlesV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151D40);
  }
  return result;
}

unint64_t sub_21B35A560()
{
  unint64_t result;

  result = qword_255151D48;
  if (!qword_255151D48)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D0E0, &_s14descr24DE733C1C14ContactHandlesV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_255151D48);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_67()
{
  return sub_21B36BBFC();
}

uint64_t OUTLINED_FUNCTION_5_73()
{
  return sub_21B36BC80();
}

uint64_t OUTLINED_FUNCTION_10_49@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_13_52()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_14_48()
{
  return sub_21B36BBD8();
}

uint64_t OUTLINED_FUNCTION_29_35@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_32_32()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_21B35A638@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25[3];
  uint64_t v26;
  uint64_t v27;

  v1 = sub_21B36A600();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_21();
  v4 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151D50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151D58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514FE30);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_21();
  v10 = v9 - v8;
  v11 = sub_21B369B98();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_21();
  v15 = v14 - v13;
  sub_21B36A5F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255143408);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_11_33(v10, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v15, v10, v11);
    v26 = v11;
    v27 = MEMORY[0x24BEA01A0];
    __swift_allocate_boxed_opaque_existential_0(v25);
    sub_21B1A60E8();
    sub_21B36A5B8();
    sub_21B36A558();
    sub_21B36A564();
    sub_21B36A5D0();
    sub_21B36A588();
    sub_21B36A540();
    sub_21B36A570();
    sub_21B36A5DC();
    sub_21B36A5C4();
    sub_21B36A5AC();
    sub_21B36A594();
    sub_21B36A5A0();
    sub_21B36A54C();
    sub_21B36A57C();
    sub_21B36A5E8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  }
  else
  {
    OUTLINED_FUNCTION_11_33(v10, 1);
    sub_21B35AAAC(v10);
    if (qword_2551411E0 != -1)
      swift_once();
    v17 = sub_21B36B2B4();
    __swift_project_value_buffer(v17, (uint64_t)&unk_25517A6C8);
    OUTLINED_FUNCTION_3_79(v4);
    v18 = sub_21B36B29C();
    v19 = sub_21B36B728();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      *(_DWORD *)v20 = 136315138;
      sub_21B36A5F4();
      __swift_project_boxed_opaque_existential_1(v25, v26);
      swift_getDynamicType();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255143410);
      v21 = sub_21B36B47C();
      v25[0] = sub_21B196024(v21, v22, &v24);
      sub_21B36B818();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_76();
      _os_log_impl(&dword_21B15D000, v18, v19, "Root node of intent was not a NonTerminalIntentNode, was: %s", v20, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
    }
    OUTLINED_FUNCTION_0_76();

    return OUTLINED_FUNCTION_3_79(a1);
  }
}

uint64_t sub_21B35AAAC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25514FE30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_76()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_79(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t sub_21B35AB08()
{
  unint64_t v0;

  v0 = sub_21B36BB84();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_21B35AB50(char a1)
{
  return *(_QWORD *)&aTitle_19[8 * a1];
}

void sub_21B35AB70()
{
  sub_21B1ACA94();
}

void sub_21B35AB7C()
{
  sub_21B1AD30C();
}

uint64_t sub_21B35AB84()
{
  return sub_21B1AE090();
}

void sub_21B35AB8C()
{
  sub_21B1AE494();
}

uint64_t sub_21B35AB94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21B35AB08();
  *a1 = result;
  return result;
}

uint64_t sub_21B35ABC0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21B35AB50(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21B35ABE8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t result;
  _QWORD v28[2];
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _BYTE v35[24];
  ValueMetadata *v36;
  _UNKNOWN **v37;
  uint64_t v38[3];
  uint64_t v39;
  _UNKNOWN **v40;
  _QWORD v41[6];

  v28[1] = a2;
  v29 = a1;
  v32 = a4;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255151D78);
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_21();
  v8 = v7 - v6;
  v9 = sub_21B36AFFC();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_21();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255146468);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v28 - v15;
  sub_21B3694B4();
  type metadata accessor for CreateNoteCATPatternsExecutor(0);
  OUTLINED_FUNCTION_0_77();
  v17 = OUTLINED_FUNCTION_4_68();
  v39 = v4;
  v40 = &off_24DE70040;
  v38[0] = v17;
  type metadata accessor for NotebookLabelsV2CATs();
  OUTLINED_FUNCTION_0_77();
  v18 = OUTLINED_FUNCTION_4_68();
  v36 = &type metadata for TCCTemplateProvider;
  v37 = &off_24DE61808;
  v19 = sub_21B368F5C();
  OUTLINED_FUNCTION_1_4();
  v20 = sub_21B368F50();
  v34[3] = v19;
  v34[4] = MEMORY[0x24BE97F18];
  v34[0] = v20;
  type metadata accessor for CreateNoteCATs();
  OUTLINED_FUNCTION_0_77();
  v21 = OUTLINED_FUNCTION_4_68();
  type metadata accessor for CreateNoteCATsSimple();
  OUTLINED_FUNCTION_0_77();
  v22 = sub_21B36AF84();
  v33[3] = &type metadata for NotebookFeatureManager;
  v33[4] = &protocol witness table for NotebookFeatureManager;
  swift_retain();
  sub_21B1FDFF0((uint64_t)v41, (uint64_t)v38, v18, (uint64_t)v35, (uint64_t)v34, v21, v22, v33, a3);
  sub_21B161A30(0, (unint64_t *)&qword_2551417A0);
  sub_21B161A30(0, &qword_25514D300);
  sub_21B368998();
  sub_21B368A10();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151D80);
  OUTLINED_FUNCTION_1_4();
  sub_21B368A64();
  v41[0] = sub_21B338340;
  v41[1] = 0;
  sub_21B35B618();
  swift_retain();
  sub_21B368D94();
  v23 = v29[3];
  v24 = v29[4];
  __swift_project_boxed_opaque_existential_1(v29, v23);
  v25 = (void *)sub_21B30E9B4(v23, v24);
  v26 = v30;
  sub_21B368D88();
  OUTLINED_FUNCTION_4_2();

  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v8, v26);
  result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  *v32 = v8;
  return result;
}

uint64_t sub_21B35AF4C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_21B368458();
  v0[7] = v1;
  v0[8] = *(_QWORD *)(v1 - 8);
  v0[9] = OUTLINED_FUNCTION_23_1();
  v0[10] = type metadata accessor for StringLocalizer();
  v0[11] = OUTLINED_FUNCTION_23_1();
  return swift_task_switch();
}

uint64_t sub_21B35AFB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD *v5;
  char *v7;

  sub_21B3694B4();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_21B368BB4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  if (qword_2551411D0 != -1)
    swift_once();
  v1 = v0[10];
  v2 = v0[11];
  v3 = (void *)qword_25517A6A8;
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[8] + 32))(v2, v0[9], v0[7]);
  *(_QWORD *)(v2 + *(int *)(v1 + 20)) = v3;
  v7 = (char *)&dword_255146320 + dword_255146320;
  v4 = v3;
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = v5;
  *v5 = v0;
  v5[1] = sub_21B1FBC90;
  return ((uint64_t (*)(_QWORD, uint64_t))v7)(v0[11], 1);
}

uint64_t sub_21B35B0B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_21B35B0D4()
{
  uint64_t v0;
  uint64_t v2;

  sub_21B35ABE8(*(_QWORD **)(v0 + 32), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 40), &v2);
  *(_QWORD *)(v0 + 16) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151D68);
  sub_21B35B5D4();
  sub_21B368AAC();
  OUTLINED_FUNCTION_4_2();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v0 + 16);
}

uint64_t sub_21B35B148(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255141E10);
    v1 = OUTLINED_FUNCTION_0_14();
    *(_OWORD *)(v1 + 16) = xmmword_21B36D150;
    if (qword_255141500 == -1)
      goto LABEL_8;
    goto LABEL_9;
  }
  if (a1 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255141E10);
    v1 = OUTLINED_FUNCTION_0_14();
    *(_OWORD *)(v1 + 16) = xmmword_21B36D150;
    if (qword_2551414F0 == -1)
      goto LABEL_8;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141E10);
  v1 = OUTLINED_FUNCTION_0_14();
  *(_OWORD *)(v1 + 16) = xmmword_21B36D150;
  if (qword_255141518 != -1)
LABEL_9:
    swift_once();
LABEL_8:
  swift_retain();
  sub_21B1FA2B4();
  v3 = v2;
  v5 = v4;
  swift_release();
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v1 + 40) = v5;
  return v1;
}

uint64_t sub_21B35B294(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18[4];
  uint64_t v19;
  _QWORD v20[3];
  uint64_t v21;

  v4 = sub_21B36B2B4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_21();
  v8 = v7 - v6;
  sub_21B1BB350(a1, (uint64_t)v20);
  if (v21)
  {
    sub_21B369D84();
    if ((OUTLINED_FUNCTION_6_32() & 1) != 0)
    {
      OUTLINED_FUNCTION_17_22();
      sub_21B369754();
      OUTLINED_FUNCTION_2_9();
      if (v20[0])
      {
LABEL_9:
        swift_retain();
        v9 = sub_21B369850();
        OUTLINED_FUNCTION_2_9();
        swift_release_n();
        return v9;
      }
      OUTLINED_FUNCTION_2_9();
    }
  }
  else
  {
    sub_21B1BB408((uint64_t)v20);
  }
  sub_21B1BB350(a1, (uint64_t)v20);
  if (v21)
  {
    sub_21B369DE4();
    if ((OUTLINED_FUNCTION_6_32() & 1) != 0)
    {
      OUTLINED_FUNCTION_17_22();
      sub_21B369754();
      OUTLINED_FUNCTION_2_9();
      if (v20[0])
        goto LABEL_9;
      OUTLINED_FUNCTION_2_9();
    }
  }
  else
  {
    sub_21B1BB408((uint64_t)v20);
  }
  if (qword_2551411E0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v4, (uint64_t)&unk_25517A6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
  sub_21B1BB398(a1, (uint64_t)v20);
  v11 = sub_21B36B29C();
  v12 = sub_21B36B71C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v14 = *(_QWORD *)&aTitle_19[8 * a2];
    *(_DWORD *)v13 = 136315394;
    v18[0] = sub_21B196024(v14, *(_QWORD *)&aGroupnam_1[8 * a2 + 8], &v19);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    sub_21B1BB350((uint64_t)v20, (uint64_t)v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514CDD0);
    v15 = sub_21B36B47C();
    v18[0] = sub_21B196024(v15, v16, &v19);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    sub_21B1BB3D4((uint64_t)v20);
    _os_log_impl(&dword_21B15D000, v11, v12, "[CreateNote resolveSelectedEntity] Unable to resolve entity for %s from intent %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }
  sub_21B1BB3D4((uint64_t)v20);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
  return 0;
}

uint64_t sub_21B35B5BC()
{
  char *v0;

  return sub_21B35B148(*v0);
}

uint64_t sub_21B35B5C4()
{
  unsigned __int8 *v0;

  return sub_21B35B290(*v0);
}

uint64_t sub_21B35B5CC(uint64_t a1)
{
  char *v1;

  return sub_21B35B294(a1, *v1);
}

unint64_t sub_21B35B5D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255151D70;
  if (!qword_255151D70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255151D68);
    result = MEMORY[0x2207623FC](MEMORY[0x24BE96B80], v1);
    atomic_store(result, (unint64_t *)&qword_255151D70);
  }
  return result;
}

unint64_t sub_21B35B618()
{
  unint64_t result;

  result = qword_255151D88;
  if (!qword_255151D88)
  {
    result = MEMORY[0x2207623FC](&unk_21B38AE6C, &_s12FlowStrategyVN_2);
    atomic_store(result, (unint64_t *)&qword_255151D88);
  }
  return result;
}

uint64_t sub_21B35B654(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21B35B694 + 4 * byte_21B38D1C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21B35B6B4 + 4 * byte_21B38D1C5[v4]))();
}

_BYTE *sub_21B35B694(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21B35B6B4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21B35B6BC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21B35B6C4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21B35B6CC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21B35B6D4(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for CreateNote.Errors()
{
  OUTLINED_FUNCTION_173();
}

void type metadata accessor for CreateNote()
{
  OUTLINED_FUNCTION_173();
}

uint64_t sub_21B35B6F8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21B35B744 + 4 * byte_21B38D1CF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21B35B778 + 4 * byte_21B38D1CA[v4]))();
}

uint64_t sub_21B35B778(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21B35B780(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21B35B788);
  return result;
}

uint64_t sub_21B35B794(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21B35B79CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21B35B7A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21B35B7A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for CreateNote.Parameter()
{
  OUTLINED_FUNCTION_173();
}

unint64_t sub_21B35B7C4()
{
  unint64_t result;

  result = qword_255151D98;
  if (!qword_255151D98)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D2B0, &unk_24DE735A0);
    atomic_store(result, (unint64_t *)&qword_255151D98);
  }
  return result;
}

unint64_t sub_21B35B804()
{
  unint64_t result;

  result = qword_255151DA0;
  if (!qword_255151DA0)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D318, &unk_24DE734F0);
    atomic_store(result, (unint64_t *)&qword_255151DA0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_77()
{
  return sub_21B36AFF0();
}

uint64_t OUTLINED_FUNCTION_4_68()
{
  return sub_21B36AEDC();
}

uint64_t sub_21B35B858(uint64_t a1)
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[32];

  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_34;
  sub_21B1BB350(a1, (uint64_t)v34);
  sub_21B369FC4();
  if (!OUTLINED_FUNCTION_0_78())
  {
    sub_21B36A054();
    if (OUTLINED_FUNCTION_0_78())
    {
      v5 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v5, v6);
      v4 = 18;
      goto LABEL_35;
    }
    sub_21B36A3B4();
    if (OUTLINED_FUNCTION_0_78())
    {
      v7 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v7, v8);
      v4 = 19;
      goto LABEL_35;
    }
    sub_21B36A228();
    if (OUTLINED_FUNCTION_0_78())
    {
      v9 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v9, v10);
      v4 = 16;
      goto LABEL_35;
    }
    sub_21B36A21C();
    if (OUTLINED_FUNCTION_0_78())
    {
      v11 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v11, v12);
      v4 = 13;
      goto LABEL_35;
    }
    sub_21B36A234();
    if (OUTLINED_FUNCTION_0_78())
    {
      v13 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v13, v14);
      v4 = 8;
      goto LABEL_35;
    }
    sub_21B36A198();
    if (OUTLINED_FUNCTION_0_78())
    {
      v15 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v15, v16);
      v4 = 7;
      goto LABEL_35;
    }
    sub_21B369C64();
    if (OUTLINED_FUNCTION_0_78())
    {
      v17 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v17, v18);
      v4 = 21;
      goto LABEL_35;
    }
    sub_21B369DA8();
    if (OUTLINED_FUNCTION_0_78())
    {
      v19 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v19, v20);
      v4 = 6;
      goto LABEL_35;
    }
    sub_21B369D90();
    if (OUTLINED_FUNCTION_0_78())
    {
      v21 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v21, v22);
      v4 = 9;
      goto LABEL_35;
    }
    sub_21B36A42C();
    if (OUTLINED_FUNCTION_0_78()
      || (sub_21B36A108(), OUTLINED_FUNCTION_0_78())
      || (sub_21B36A1A4(), OUTLINED_FUNCTION_0_78())
      || (sub_21B36A264(), OUTLINED_FUNCTION_0_78()))
    {
      v23 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v23, v24);
      v4 = 1;
      goto LABEL_35;
    }
    sub_21B36A0F0();
    if (OUTLINED_FUNCTION_0_78())
    {
      v25 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v25, v26);
      v4 = 2;
      goto LABEL_35;
    }
    sub_21B36A0FC();
    if (OUTLINED_FUNCTION_0_78())
    {
      v27 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v27, v28);
      v4 = 4;
      goto LABEL_35;
    }
    sub_21B36A12C();
    v29 = swift_dynamicCast();
    if ((_DWORD)v29)
    {
      v31 = OUTLINED_FUNCTION_2_66();
      OUTLINED_FUNCTION_1_65(v31, v32);
      v4 = 3;
      goto LABEL_35;
    }
    OUTLINED_FUNCTION_1_65(v29, v30);
LABEL_34:
    v4 = 24;
    goto LABEL_35;
  }
  v2 = OUTLINED_FUNCTION_2_66();
  OUTLINED_FUNCTION_1_65(v2, v3);
  v4 = 10;
LABEL_35:
  sub_21B1BB408(a1);
  return v4;
}

uint64_t OUTLINED_FUNCTION_0_78()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_65(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_2_66()
{
  return swift_release();
}

id sub_21B35BB3C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  v11 = sub_21B36B758();
  v1 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21B36B74C();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_21B36B3A4();
  MEMORY[0x24BDAC7A8](v5);
  *(_QWORD *)&v0[OBJC_IVAR____TtC12SiriNotebook15LocationManager_locationManager] = 0;
  *(_DWORD *)&v0[OBJC_IVAR____TtC12SiriNotebook15LocationManager__authorizationStatus] = 0;
  v10 = OBJC_IVAR____TtC12SiriNotebook15LocationManager_locationQueue;
  sub_21B35BE3C();
  v6 = v0;
  sub_21B36B398();
  v13 = MEMORY[0x24BEE4AF8];
  sub_21B35BE78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255151E60);
  sub_21B35BEB8();
  sub_21B36B8B4();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v11);
  *(_QWORD *)&v0[v10] = sub_21B36B764();

  v7 = (objc_class *)type metadata accessor for LocationManager();
  v12.receiver = v6;
  v12.super_class = v7;
  return objc_msgSendSuper2(&v12, sel_init);
}

id sub_21B35BD38(void *a1)
{
  uint64_t v1;
  id result;

  result = objc_msgSend(a1, sel_authorizationStatus);
  *(_DWORD *)(v1 + OBJC_IVAR____TtC12SiriNotebook15LocationManager__authorizationStatus) = (_DWORD)result;
  return result;
}

id sub_21B35BDB4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LocationManager()
{
  return objc_opt_self();
}

unint64_t sub_21B35BE3C()
{
  unint64_t result;

  result = qword_255151E50;
  if (!qword_255151E50)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255151E50);
  }
  return result;
}

unint64_t sub_21B35BE78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255151E58;
  if (!qword_255151E58)
  {
    v1 = sub_21B36B74C();
    result = MEMORY[0x2207623FC](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_255151E58);
  }
  return result;
}

unint64_t sub_21B35BEB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255151E68;
  if (!qword_255151E68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255151E60);
    result = MEMORY[0x2207623FC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, &qword_255151E68);
  }
  return result;
}

uint64_t sub_21B35BEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25514D1E8 + dword_25514D1E8);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21B173098;
  return v7(a1, a2);
}

uint64_t sub_21B35BF68()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35BFA8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_21B35BFC0()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  v1 = MEMORY[0x24BEE4AF8];
  sub_21B29BC48();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_0_79(v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35C018()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_26_33(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_6_0(v2, v3, v4, v5);
}

uint64_t sub_21B35C060()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C0A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_21_44();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_10_50(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_5_15(v2, v3, v4, v5, v6);
}

uint64_t sub_21B35C0E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_26_33(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_6_0(v2, v3, v4, v5);
}

uint64_t sub_21B35C12C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C16C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C1AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v4)(uint64_t);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_40_27(v1, (uint64_t)sub_21B173098);
  return v4(v2);
}

uint64_t sub_21B35C220()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C260()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C2A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_21_44();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_10_50(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_5_15(v2, v3, v4, v5, v6);
}

uint64_t sub_21B35C2E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C324(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25514D1F0 + dword_25514D1F0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B173098;
  return v5(a1);
}

uint64_t sub_21B35C384(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25514D1C0 + dword_25514D1C0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B173098;
  return v5(a1);
}

uint64_t sub_21B35C3EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C42C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_21_44();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_10_50(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_5_15(v2, v3, v4, v5, v6);
}

uint64_t sub_21B35C470()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_18_45();
  v1 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_3_80(v1, (uint64_t)sub_21B173098);
  return OUTLINED_FUNCTION_0_79(v2, v3);
}

uint64_t sub_21B35C4B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v4)(uint64_t);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_40_27(v1, (uint64_t)sub_21B173098);
  return v4(v2);
}

uint64_t sub_21B35C524(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = v1;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35C534()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 120) + 48), sel_modifiedTask);
  *(_QWORD *)(v0 + 128) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)(v0 + 120);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514E780);
    v4 = OUTLINED_FUNCTION_6_5();
    *(_OWORD *)(v4 + 16) = xmmword_21B36D150;
    v5 = *(_QWORD *)(v3 + 56);
    v6 = v2;
    swift_retain();
    v7 = sub_21B1EB424(v6, v5);
    *(_QWORD *)(v4 + 56) = &unk_24DE61F28;
    *(_QWORD *)(v4 + 64) = &off_24DE61F50;
    *(_QWORD *)(v4 + 32) = v7;
    *(_QWORD *)(v4 + 40) = v8;
    *(_QWORD *)(v4 + 48) = v9;
    sub_21B167310(v3, v0 + 72);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v10;
    *v10 = v0;
    v10[1] = sub_21B35C6C4;
    return sub_21B19F080(v0 + 16, (uint64_t)v6, (uint64_t)&unk_24DE590C0, v4, v0 + 72);
  }
  else
  {
    v12 = *(_QWORD **)(v0 + 112);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514E790);
    v13 = OUTLINED_FUNCTION_6_5();
    *(_OWORD *)(v13 + 16) = xmmword_21B3705A0;
    *(_QWORD *)(v13 + 32) = &unk_255144E30;
    *(_QWORD *)(v13 + 40) = 0;
    *(_QWORD *)(v13 + 48) = &unk_255144EA0;
    *(_QWORD *)(v13 + 56) = 0;
    v14 = OUTLINED_FUNCTION_6_5();
    *(_QWORD *)(v14 + 16) = v13;
    *v12 = &unk_255144E80;
    v12[1] = v14;
    return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_21B35C6C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B35C71C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 128);
  v2 = OUTLINED_FUNCTION_6_5();
  v3 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514E790);
  v4 = OUTLINED_FUNCTION_6_5();
  *(_OWORD *)(v4 + 16) = xmmword_21B36D150;
  *(_QWORD *)(v4 + 32) = &unk_255144E90;
  *(_QWORD *)(v4 + 40) = v2;

  v5 = OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(_QWORD **)(v0 + 112);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514E790);
  v7 = OUTLINED_FUNCTION_6_5();
  *(_OWORD *)(v7 + 16) = xmmword_21B3705A0;
  *(_QWORD *)(v7 + 32) = &unk_255144E30;
  *(_QWORD *)(v7 + 40) = 0;
  *(_QWORD *)(v7 + 48) = &unk_255151EF0;
  *(_QWORD *)(v7 + 56) = v5;
  v8 = OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v8 + 16) = v7;
  *v6 = &unk_255144E80;
  v6[1] = v8;
  return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35C828()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35C854()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 1496) = v0;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35C864()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  id v10;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 1496) + 48), sel_modifiedTask);
  *(_QWORD *)(v0 + 1504) = v1;
  if (!v1)
  {
    if (qword_2551411E0 != -1)
      swift_once();
    v12 = sub_21B36B2B4();
    __swift_project_value_buffer(v12, (uint64_t)&unk_25517A6C8);
    v13 = (void *)sub_21B36B29C();
    v14 = sub_21B36B71C();
    if (OUTLINED_FUNCTION_18_16(v14))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_18() = 0;
      OUTLINED_FUNCTION_32_33();
    }

    OUTLINED_FUNCTION_7_15();
    __asm { BR              X1 }
  }
  v2 = v1;
  v3 = *(_QWORD *)(v0 + 1496);
  sub_21B35D3F0(v3, v0 + 1336);
  v4 = (_OWORD *)OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v0 + 1512) = v4;
  v5 = *(_OWORD *)(v0 + 1352);
  v4[1] = *(_OWORD *)(v0 + 1336);
  v4[2] = v5;
  v6 = *(_OWORD *)(v0 + 1384);
  v4[3] = *(_OWORD *)(v0 + 1368);
  v4[4] = v6;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25514D2F0);
  swift_asyncLet_begin();
  sub_21B35D3F0(v3, v0 + 1400);
  v7 = OUTLINED_FUNCTION_6_5();
  *(_QWORD *)(v0 + 1520) = v7;
  v8 = *(_OWORD *)(v0 + 1416);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)(v0 + 1400);
  *(_OWORD *)(v7 + 32) = v8;
  v9 = *(_OWORD *)(v0 + 1448);
  *(_OWORD *)(v7 + 48) = *(_OWORD *)(v0 + 1432);
  *(_OWORD *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 80) = v2;
  v10 = v2;
  swift_retain();
  swift_asyncLet_begin();
  OUTLINED_FUNCTION_7_15();
  return swift_asyncLet_get_throwing();
}

uint64_t sub_21B35CA68()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 1528) = v0;
  if (v0)
    return swift_asyncLet_finish();
  else
    return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35CA94()
{
  _QWORD *v0;

  v0[192] = v0[186];
  v0[193] = v0[185];
  swift_bridgeObjectRetain();
  return swift_asyncLet_get_throwing();
}

uint64_t sub_21B35CAF4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 1552) = v0;
  if (!v0)
    *(_QWORD *)(v1 + 1560) = sub_21B161A30(0, (unint64_t *)&unk_255151EA0);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B35CB4C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  v1 = v0[192];
  v2 = (void *)v0[188];
  if (v1)
    v3 = v0[193];
  else
    v3 = 0;
  if (v1)
    v4 = v0[192];
  else
    v4 = 0xE000000000000000;
  v5 = v0[183];
  v6 = v0[184];
  swift_bridgeObjectRetain();
  v7 = sub_21B19EC6C(v2, v3, v4, v5, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0C0);
  v8 = OUTLINED_FUNCTION_6_5();
  *(_OWORD *)(v8 + 16) = xmmword_21B36D370;
  *(_QWORD *)(v8 + 32) = v7;
  v10 = v8;
  OUTLINED_FUNCTION_53_6();
  v0[196] = v10;
  OUTLINED_FUNCTION_7_15();
  return swift_asyncLet_finish();
}

uint64_t sub_21B35CC24()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35CC30()
{
  OUTLINED_FUNCTION_16_42();
  OUTLINED_FUNCTION_34_36();
  return OUTLINED_FUNCTION_21_1();
}

uint64_t sub_21B35CC60()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35CC6C()
{
  uint64_t v0;

  swift_release_n();
  swift_release();
  return OUTLINED_FUNCTION_1_0(*(_QWORD *)(v0 + 1568), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35CCB8()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35CCC4()
{
  OUTLINED_FUNCTION_16_42();
  OUTLINED_FUNCTION_34_36();
  return OUTLINED_FUNCTION_21_1();
}

uint64_t sub_21B35CCF4()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35CD00()
{
  uint64_t v0;

  OUTLINED_FUNCTION_36_28();
  OUTLINED_FUNCTION_20_16();
  swift_release();
  return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35CD38()
{
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_21_1();
}

uint64_t sub_21B35CD8C()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35CD98()
{
  OUTLINED_FUNCTION_16_42();
  OUTLINED_FUNCTION_34_36();
  return OUTLINED_FUNCTION_21_1();
}

uint64_t sub_21B35CDC8()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35CDD4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_36_28();
  OUTLINED_FUNCTION_20_16();
  swift_release();
  return OUTLINED_FUNCTION_0_9(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35CE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_21B35CE24()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 24), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_21B35CE78;
  return sub_21B351964();
}

uint64_t sub_21B35CE78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (v2)
    return OUTLINED_FUNCTION_31_1(*(uint64_t (**)(void))(v7 + 8));
  *(_QWORD *)(v6 + 40) = a2;
  *(_QWORD *)(v6 + 48) = a1;
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_32_1();
}

uint64_t sub_21B35CEEC()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_17_41(*(int8x16_t **)(v0 + 16), *(int8x16_t *)(v0 + 40));
}

uint64_t sub_21B35CEF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_21B35CF14()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;

  v1 = v0[3];
  __swift_project_boxed_opaque_existential_1((_QWORD *)v1, *(_QWORD *)(v1 + 24));
  v2 = objc_msgSend(*(id *)(v1 + 40), sel_contactEventTrigger);
  v0[5] = v2;
  v3 = (_QWORD *)swift_task_alloc();
  v0[6] = v3;
  *v3 = v0;
  v3[1] = sub_21B35CF9C;
  return sub_21B351C8C(v0[4], (uint64_t)v2);
}

uint64_t sub_21B35CF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 56) = v2;
  swift_task_dealloc();
  if (!v2)
  {

    *(_QWORD *)(v6 + 64) = a2;
    *(_QWORD *)(v6 + 72) = a1;
  }
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_32_1();
}

uint64_t sub_21B35D014()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_17_41(*(int8x16_t **)(v0 + 16), *(int8x16_t *)(v0 + 64));
}

uint64_t sub_21B35D020()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35D04C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35D05C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 64) + 48), sel_modifiedTask);
  *(_QWORD *)(v0 + 72) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 64);
    __swift_project_boxed_opaque_existential_1((_QWORD *)v2, *(_QWORD *)(v2 + 24));
    *(_QWORD *)(v0 + 80) = objc_msgSend(*(id *)(v2 + 40), sel_contactEventTrigger);
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v3;
    v4 = OUTLINED_FUNCTION_15_27(v3, (uint64_t)sub_21B35D19C);
    return sub_21B351C8C(v4, v5);
  }
  else
  {
    if (qword_2551411E0 != -1)
      swift_once();
    v7 = sub_21B36B2B4();
    __swift_project_value_buffer(v7, (uint64_t)&unk_25517A6C8);
    v8 = (void *)sub_21B36B29C();
    v9 = sub_21B36B71C();
    if (OUTLINED_FUNCTION_18_16(v9))
    {
      *(_WORD *)OUTLINED_FUNCTION_2_18() = 0;
      OUTLINED_FUNCTION_32_33();
    }

    return OUTLINED_FUNCTION_0_79(MEMORY[0x24BEE4AF8], *(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_21B35D19C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 96) = a1;
  *(_QWORD *)(v4 + 104) = a2;
  *(_QWORD *)(v4 + 112) = v2;
  swift_task_dealloc();
  if (!v2)

  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_32_1();
}

uint64_t sub_21B35D20C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t inited;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 64) + 56);
  v2 = sub_21B36B020();
  if (v3)
  {
    v4 = v2;
    v5 = v3;
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815B0]), sel_init);
    sub_21B35D560(v4, v5, v6);
  }
  else
  {
    v6 = 0;
  }
  v8 = *(_QWORD *)(v0 + 96);
  v7 = *(_QWORD *)(v0 + 104);
  v9 = *(void **)(v0 + 72);
  sub_21B161A30(0, (unint64_t *)&unk_25514F2A0);
  swift_retain();
  v10 = sub_21B218ED8(v9, v1, v8, v7);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255144E20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21B3705A0;
  *(_QWORD *)(inited + 32) = v6;
  *(_QWORD *)(inited + 40) = v10;
  v20 = inited;
  OUTLINED_FUNCTION_53_6();
  v12 = v20;
  v21 = MEMORY[0x24BEE4AF8];
  if (*(_QWORD *)(v12 + 32))
  {
    swift_unknownObjectRetain();
    v13 = v6;
    MEMORY[0x2207616A0](v10);
    OUTLINED_FUNCTION_37_30();
    if (v14)
      OUTLINED_FUNCTION_22_41();
    OUTLINED_FUNCTION_29_36();
    OUTLINED_FUNCTION_53_6();
  }
  else
  {
    v15 = v6;
    v16 = v10;
  }
  if (*(_QWORD *)(v12 + 40))
  {
    v17 = swift_unknownObjectRetain();
    MEMORY[0x2207616A0](v17);
    OUTLINED_FUNCTION_37_30();
    if (v14)
      OUTLINED_FUNCTION_22_41();
    OUTLINED_FUNCTION_29_36();
    OUTLINED_FUNCTION_53_6();
  }
  v18 = *(void **)(v0 + 72);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
}

uint64_t sub_21B35D3B8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 72);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B35D3F0(uint64_t a1, uint64_t a2)
{
  _s15AddTasksSnippetVwcp(a2, a1);
  return a2;
}

uint64_t sub_21B35D424()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21B35D460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_6_15();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_21B173088;
  return sub_21B35CE0C(v0, v1);
}

uint64_t sub_21B35D4B4()
{
  id *v0;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21B35D4F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = v1 + 16;
  v5 = *(_QWORD *)(v1 + 80);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_21B1670BC;
  return sub_21B35CEF8(a1, v4, v5);
}

void sub_21B35D560(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21B36B434();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setBundleId_, v4);

}

uint64_t sub_21B35D5B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_15_27(v1, (uint64_t)sub_21B173098);
  return sub_21B35BEFC(v2, v3);
}

uint64_t sub_21B35D5F8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B173098;
  return sub_21B35BFA8(a1);
}

uint64_t sub_21B35D644(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B1719EC;
  return sub_21B35C324(a1);
}

uint64_t sub_21B35D690()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21B35D6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(a2 + 48);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 72) = v4;
  v5 = OUTLINED_FUNCTION_15_27(v4, (uint64_t)sub_21B35D714);
  return sub_21B35C384(v5);
}

uint64_t sub_21B35D714(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v6 = *v2;
  v4 = swift_task_dealloc();
  if (!v1)
    v4 = a1;
  return OUTLINED_FUNCTION_1_0(v4, *(uint64_t (**)(void))(v6 + 8));
}

uint64_t sub_21B35D760()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

ValueMetadata *_s23SetTaskAttributeSnippetVMa()
{
  return &_s23SetTaskAttributeSnippetVN;
}

uint64_t sub_21B35D7AC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_21B35D7BC(uint64_t a1)
{
  unint64_t result;

  result = sub_21B35D7E0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_21B35D7E0()
{
  unint64_t result;

  result = qword_255152020;
  if (!qword_255152020)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D3E8, &_s23SetTaskAttributeSnippetVN);
    atomic_store(result, (unint64_t *)&qword_255152020);
  }
  return result;
}

unint64_t sub_21B35D81C(uint64_t a1)
{
  unint64_t result;

  result = sub_21B35D840();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_21B35D840()
{
  unint64_t result;

  result = qword_255152028;
  if (!qword_255152028)
  {
    result = MEMORY[0x2207623FC](&unk_21B38D404, &_s23SetTaskAttributeSnippetVN);
    atomic_store(result, (unint64_t *)&qword_255152028);
  }
  return result;
}

_UNKNOWN **sub_21B35D87C()
{
  return &off_25514CEA0;
}

uint64_t OUTLINED_FUNCTION_0_79(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_3_80@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_10_50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

uint64_t OUTLINED_FUNCTION_16_42()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_17_41@<X0>(int8x16_t *a1@<X8>, int8x16_t a2@<Q0>)
{
  uint64_t v2;

  *a1 = vextq_s8(a2, a2, 8uLL);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t OUTLINED_FUNCTION_22_41()
{
  return sub_21B36B5D8();
}

uint64_t OUTLINED_FUNCTION_26_33@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_29_36()
{
  return sub_21B36B5FC();
}

void OUTLINED_FUNCTION_32_33()
{
  JUMPOUT(0x2207624E0);
}

uint64_t OUTLINED_FUNCTION_34_36()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_36_28()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_40_27@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

ValueMetadata *type metadata accessor for CommonLabelGenerator()
{
  return &type metadata for CommonLabelGenerator;
}

uint64_t type metadata accessor for CreateNoteCATs()
{
  uint64_t result;

  result = qword_255152030;
  if (!qword_255152030)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21B35D9F8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21B35DA34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35DA48()
{
  _QWORD *v0;
  unint64_t v1;
  __n128 *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v2 = (__n128 *)OUTLINED_FUNCTION_10();
  v0[5] = v2;
  OUTLINED_FUNCTION_13(v2, (__n128)xmmword_21B36D150);
  v2[4].n128_u64[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_255141D00);
  v2[3].n128_u64[0] = v1;
  OUTLINED_FUNCTION_9();
  v3 = (_QWORD *)OUTLINED_FUNCTION_31();
  v0[6] = v3;
  OUTLINED_FUNCTION_9_6(v3);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_47_3();
  return OUTLINED_FUNCTION_4_69(v4, v5, v6, v7, v8);
}

uint64_t sub_21B35DADC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35DAF0()
{
  _QWORD *v0;
  unint64_t v1;
  __n128 *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v2 = (__n128 *)OUTLINED_FUNCTION_10();
  v0[5] = v2;
  OUTLINED_FUNCTION_13(v2, (__n128)xmmword_21B36D150);
  v2[4].n128_u64[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_255141D00);
  v2[3].n128_u64[0] = v1;
  OUTLINED_FUNCTION_9();
  v3 = (_QWORD *)OUTLINED_FUNCTION_31();
  v0[6] = v3;
  OUTLINED_FUNCTION_9_6(v3);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_47_3();
  return OUTLINED_FUNCTION_4_69(v4, v5, v6, v7, v8);
}

uint64_t sub_21B35DB84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35DB98()
{
  _QWORD *v0;
  unint64_t v1;
  __n128 *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);

  v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v2 = (__n128 *)OUTLINED_FUNCTION_10();
  v0[5] = v2;
  OUTLINED_FUNCTION_13(v2, (__n128)xmmword_21B36D150);
  v2[4].n128_u64[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_255141D00);
  v2[3].n128_u64[0] = v1;
  OUTLINED_FUNCTION_9();
  v3 = (_QWORD *)OUTLINED_FUNCTION_31();
  v0[6] = v3;
  OUTLINED_FUNCTION_9_6(v3);
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_47_3();
  return OUTLINED_FUNCTION_4_69(v4, v5, v6, v7, v8);
}

uint64_t sub_21B35DC2C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = v4;
  *(_BYTE *)(v5 + 72) = a3;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B35DC44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(void);

  v1 = *(_QWORD *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v2 = swift_allocObject();
  *(_QWORD *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_21B36D160;
  *(_QWORD *)(v2 + 32) = 7368801;
  *(_QWORD *)(v2 + 40) = 0xE300000000000000;
  if (v1)
  {
    v3 = sub_21B36AF3C();
    v4 = v1;
  }
  else
  {
    v4 = 0;
    v3 = 0;
    *(_QWORD *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 64) = 0;
  }
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(_BYTE *)(v0 + 72);
  *(_QWORD *)(v2 + 48) = v4;
  *(_QWORD *)(v2 + 72) = v3;
  *(_QWORD *)(v2 + 80) = 0xD000000000000014;
  *(_QWORD *)(v2 + 88) = 0x800000021B390730;
  v7 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v2 + 96) = v6;
  *(_QWORD *)(v2 + 120) = v7;
  *(_QWORD *)(v2 + 128) = 1702129518;
  *(_QWORD *)(v2 + 136) = 0xE400000000000000;
  v8 = 0;
  if (v5)
  {
    v8 = type metadata accessor for NotebookNoteConcept(0);
  }
  else
  {
    *(_QWORD *)(v2 + 152) = 0;
    *(_QWORD *)(v2 + 160) = 0;
  }
  *(_QWORD *)(v2 + 144) = v5;
  *(_QWORD *)(v2 + 168) = v8;
  v11 = (uint64_t (*)(void))((int)*MEMORY[0x24BE92870] + MEMORY[0x24BE92870]);
  swift_retain();
  swift_retain();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v9;
  *v9 = v0;
  v9[1] = sub_21B35DDA8;
  OUTLINED_FUNCTION_8_9();
  return v11();
}

uint64_t sub_21B35DDA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_1_6();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_2_8(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_21B35DE08()
{
  return type metadata accessor for CreateNoteCATs();
}

uint64_t OUTLINED_FUNCTION_4_69(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t _s20HandleIntentStrategyVwxx_2(uint64_t a1)
{
  uint64_t v2;

  v2 = a1 + 88;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  return __swift_destroy_boxed_opaque_existential_1(v2);
}

uint64_t _s20HandleIntentStrategyVwcp_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  __int128 v8;
  __int128 v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = a2 + 8;
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_retain();
  v7(a1 + 8, v4, v6);
  v8 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 48, a2 + 48);
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 88, a2 + 88);
  return a1;
}

uint64_t *_s20HandleIntentStrategyVwca_2(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v4;

  v4 = a2 + 11;
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, a2 + 1);
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  __swift_assign_boxed_opaque_existential_1(a1 + 11, v4);
  return a1;
}

uint64_t _s20HandleIntentStrategyVwta_2(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 88);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  return a1;
}

uint64_t _s20HandleIntentStrategyVwet_2(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 128))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s20HandleIntentStrategyVwst_2(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
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
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s20HandleIntentStrategyVMa_2()
{
  return &_s20HandleIntentStrategyVN_2;
}

uint64_t sub_21B35E0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  v4 = sub_21B368C44();
  v3[11] = v4;
  v3[12] = *(_QWORD *)(v4 - 8);
  v3[13] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142588);
  v3[14] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0A0);
  v3[15] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  v3[16] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0);
  v3[17] = OUTLINED_FUNCTION_4_6();
  v3[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0D0);
  v3[19] = OUTLINED_FUNCTION_23_1();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255150950);
  v3[20] = v5;
  v3[21] = *(_QWORD *)(v5 - 8);
  v3[22] = OUTLINED_FUNCTION_4_6();
  v3[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B35E1C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  uint64_t v34;

  if (qword_2551411E0 != -1)
    swift_once();
  v1 = v0[23];
  v2 = v0[20];
  v3 = v0[21];
  v4 = v0[9];
  v5 = sub_21B36B2B4();
  __swift_project_value_buffer(v5, (uint64_t)&unk_25517A6C8);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v1, v4, v2);
  v7 = sub_21B36B29C();
  v8 = sub_21B36B734();
  v9 = os_log_type_enabled(v7, v8);
  v10 = v0[23];
  if (v9)
  {
    v11 = v0[22];
    v33 = v0[21];
    v12 = v0[20];
    v13 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    v6(v11, v10, v12);
    v14 = sub_21B36B47C();
    v0[7] = sub_21B196024(v14, v15, &v34);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v10, v12);
    _os_log_impl(&dword_21B15D000, v7, v8, "[SnoozeTasks HandleIntentStrategy] Making intent handled response for: %s", v13, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }
  (*(void (**)(_QWORD, _QWORD))(v0[21] + 8))(v0[23], v0[20]);

  v16 = (void *)sub_21B369184();
  v17 = sub_21B35EF3C(v16);
  if (!v17)
    goto LABEL_14;
  v18 = v17;
  if (!(v17 >> 62))
  {
    if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
      goto LABEL_8;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v23 = sub_21B36BB30();
  OUTLINED_FUNCTION_31_0();
  if (v23 != 1 || (swift_bridgeObjectRetain(), v24 = sub_21B36BB30(), OUTLINED_FUNCTION_31_0(), !v24))
  {
LABEL_13:
    OUTLINED_FUNCTION_31_0();
LABEL_14:
    v22 = 1;
    goto LABEL_15;
  }
LABEL_8:
  sub_21B347CB8(0, (v18 & 0xC000000000000001) == 0, v18);
  if ((v18 & 0xC000000000000001) != 0)
    v19 = (id)MEMORY[0x220761AB4](0, v18);
  else
    v19 = *(id *)(v18 + 32);
  v20 = v19;
  OUTLINED_FUNCTION_31_0();
  v21 = objc_msgSend(v20, sel_title);

  sub_21B36B740();
  v22 = 0;
LABEL_15:
  v25 = v0[19];
  v26 = sub_21B36AF60();
  __swift_storeEnumTagSinglePayload(v25, v22, 1, v26);
  v27 = (void *)sub_21B3691A8();
  v28 = objc_msgSend(v27, sel_nextTriggerTime);

  if (v28)
  {
    sub_21B327C58();
    v30 = v29;

  }
  else
  {
    v30 = 0;
  }
  v0[24] = v30;
  v31 = (_QWORD *)swift_task_alloc();
  v0[25] = v31;
  *v31 = v0;
  v31[1] = sub_21B35E52C;
  return sub_21B1B34B8(v0[19], v30);
}

uint64_t sub_21B35E52C(uint64_t a1)
{
  uint64_t v1;
  uint64_t **v2;
  uint64_t *v3;

  v3 = *v2;
  v3[26] = a1;
  v3[27] = v1;
  swift_task_dealloc();
  sub_21B163F9C(v3[19], (uint64_t *)&unk_25514D0D0);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_21B35E5BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  void *v4;
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
  id v21;
  _QWORD *v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(uint64_t **)(v0 + 72);
  sub_21B186684(*(_QWORD *)(v0 + 80) + 48, v0 + 16);
  sub_21B35E94C(v3, v2);
  v4 = *(void **)(v0 + 208);
  if (v1)
  {
    sub_21B186B10(v0 + 16);

    OUTLINED_FUNCTION_5_74();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_76();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 136);
    v9 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 120);
    v10 = type metadata accessor for Snippet();
    OUTLINED_FUNCTION_5_1(v6, v11, v12, v10);
    v13 = sub_21B368F44();
    OUTLINED_FUNCTION_5_1(v7, v14, v15, v13);
    v16 = sub_21B36AC78();
    OUTLINED_FUNCTION_5_1(v8, v17, v18, v16);
    v19 = sub_21B368CBC();
    __swift_storeEnumTagSinglePayload(v9, 1, 1, v19);
    sub_21B368C20();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0C0);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_21B36D370;
    *(_QWORD *)(v20 + 32) = v4;
    v23 = v20;
    sub_21B36B5C0();
    *(_QWORD *)(v0 + 224) = v23;
    v21 = v4;
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v22;
    *v22 = v0;
    v22[1] = sub_21B35E794;
    return sub_21B34FF90(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 136), v23, 0, 0, *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
  }
}

uint64_t sub_21B35E794()
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
  uint64_t v10;

  OUTLINED_FUNCTION_9_22();
  v10 = *(_QWORD *)v0 + 16;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 136);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 144);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 128);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  v8 = *(_QWORD *)(*(_QWORD *)v0 + 88);
  v7 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_21B163F9C(v5, &qword_255142588);
  sub_21B163F9C(v4, (uint64_t *)&unk_25514D0A0);
  sub_21B163F9C(v3, &qword_2551420E8);
  sub_21B163F9C(v2, &qword_25514D0B0);
  sub_21B163F9C(v1, &qword_25514D0B0);
  sub_21B186B10(v10);
  return swift_task_switch();
}

uint64_t sub_21B35E884()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_22();

  swift_task_dealloc();
  OUTLINED_FUNCTION_15_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_76();
  return OUTLINED_FUNCTION_3_18(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35E8F4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_22();
  OUTLINED_FUNCTION_5_74();
  OUTLINED_FUNCTION_15_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_76();
  return OUTLINED_FUNCTION_3_18(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B35E94C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v42;
  unsigned __int8 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unsigned __int8 v79;
  uint64_t v80;
  uint64_t v81;
  unsigned __int8 v82;
  uint64_t *v83;

  v4 = v2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255150950);
  v68 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v69 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Snippet.Reminder(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v54 - v14;
  v83 = a1;
  v16 = (void *)sub_21B369184();
  v17 = sub_21B35EF3C(v16);
  if (v17)
    v18 = v17;
  else
    v18 = MEMORY[0x24BEE4AF8];
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    v52 = sub_21B36BB30();
    swift_bridgeObjectRelease();
    if (v52)
      goto LABEL_6;
LABEL_13:
    swift_bridgeObjectRelease();
    v53 = type metadata accessor for Snippet();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v53);
  }
  if (!*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_13;
LABEL_6:
  sub_21B347CB8(0, (v18 & 0xC000000000000001) == 0, v18);
  v67 = v3;
  if ((v18 & 0xC000000000000001) != 0)
    v19 = (id)MEMORY[0x220761AB4](0, v18);
  else
    v19 = *(id *)(v18 + 32);
  v20 = v19;
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + 88), *(_QWORD *)(v4 + 112));
  v62 = v20;
  sub_21B3137DC(v62, (uint64_t)v13);
  sub_21B18A548();
  sub_21B1936D8((uint64_t)v13);
  v21 = v71;
  v54 = v70;
  v55 = v72;
  v61 = v73;
  v22 = v75;
  v56 = v74;
  v57 = v76;
  v58 = v77;
  v59 = v78;
  v60 = v79;
  v63 = v80;
  v65 = v81;
  v66 = v82;
  v23 = v83;
  sub_21B369190();
  v24 = sub_21B1FDEE0();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0E0);
  v25 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_21B36D150;
  v64 = v15;
  sub_21B193694((uint64_t)v15, v26 + v25);
  if ((v24 & 1) != 0)
  {
    v27 = v62;

    sub_21B1936D8((uint64_t)v64);
    v28 = v54;
    *(_QWORD *)a2 = v26;
    *(_QWORD *)(a2 + 8) = v28;
    v29 = v55;
    *(_QWORD *)(a2 + 16) = v21;
    *(_QWORD *)(a2 + 24) = v29;
    v30 = v56;
    *(_QWORD *)(a2 + 32) = v61;
    *(_QWORD *)(a2 + 40) = v30;
    v31 = v57;
    *(_QWORD *)(a2 + 48) = v22;
    *(_QWORD *)(a2 + 56) = v31;
    v32 = v59;
    *(_QWORD *)(a2 + 64) = v58;
    *(_QWORD *)(a2 + 72) = v32;
    *(_BYTE *)(a2 + 80) = v60;
    v33 = v65;
    *(_QWORD *)(a2 + 88) = v63;
    *(_QWORD *)(a2 + 96) = v33;
    *(_BYTE *)(a2 + 104) = v66;
    v34 = type metadata accessor for Snippet();
    swift_storeEnumTagMultiPayload();
    v35 = a2;
    v36 = v34;
  }
  else
  {
    v37 = (uint64_t)v69;
    (*(void (**)(char *, uint64_t *, uint64_t))(v68 + 16))(v69, v23, v7);
    v83 = (uint64_t *)(a2 + *(int *)(type metadata accessor for Snippet.AddTasks3p() + 24));
    v38 = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v39 = v21;
    swift_bridgeObjectRetain();
    v40 = v61;
    swift_bridgeObjectRetain();
    v41 = v63;
    v42 = v65;
    v43 = v66;
    sub_21B177120(v63, v65, v66);
    sub_21B32AFAC(v37, v83);
    v44 = v54;
    *(_QWORD *)a2 = v26;
    *(_QWORD *)(a2 + 8) = v44;
    v45 = v55;
    *(_QWORD *)(a2 + 16) = v39;
    *(_QWORD *)(a2 + 24) = v45;
    v46 = v56;
    *(_QWORD *)(a2 + 32) = v40;
    *(_QWORD *)(a2 + 40) = v46;
    v47 = v57;
    *(_QWORD *)(a2 + 48) = v38;
    *(_QWORD *)(a2 + 56) = v47;
    v48 = v59;
    *(_QWORD *)(a2 + 64) = v58;
    *(_QWORD *)(a2 + 72) = v48;
    *(_QWORD *)(a2 + 80) = v60;
    *(_QWORD *)(a2 + 88) = v41;
    *(_QWORD *)(a2 + 96) = v42;
    *(_BYTE *)(a2 + 104) = v43;
    v49 = type metadata accessor for Snippet();
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = v62;

    swift_bridgeObjectRelease();
    sub_21B17724C(v41, v42, v43);
    sub_21B1936D8((uint64_t)v64);
    v35 = a2;
    v36 = v49;
  }
  return __swift_storeEnumTagSinglePayload(v35, 0, 1, v36);
}

uint64_t sub_21B35EE24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_21B35EE40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21B16C55C;
  return sub_21B35E0C0(a1, a2);
}

uint64_t sub_21B35EEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21B167228;
  return sub_21B35EE24(a1, a2);
}

unint64_t sub_21B35EF00()
{
  unint64_t result;

  result = qword_2551520A8[0];
  if (!qword_2551520A8[0])
  {
    result = MEMORY[0x2207623FC](&unk_21B38D4D8, &_s20HandleIntentStrategyVN_2);
    atomic_store(result, qword_2551520A8);
  }
  return result;
}

uint64_t sub_21B35EF3C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_snoozedTasks);

  if (!v2)
    return 0;
  sub_21B1B5578();
  v3 = sub_21B36B5A8();

  return v3;
}

uint64_t OUTLINED_FUNCTION_5_74()
{
  return swift_task_dealloc();
}

void sub_21B35EFB0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255142210);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (id)MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v22 - v14;
  if (a1)
  {
    v16 = a1;
  }
  else
  {
    OUTLINED_FUNCTION_0_6((uint64_t)v13, (unint64_t *)&qword_2551417A8);
    v13 = sub_21B326638();
    v16 = v13;
  }
  OUTLINED_FUNCTION_0_6((uint64_t)v13, (unint64_t *)&qword_255142220);
  v17 = a1;
  v18 = (void *)sub_21B36B59C();
  OUTLINED_FUNCTION_6_2();
  v23 = a4;
  sub_21B1F2ABC(a4, (uint64_t)v15);
  v19 = sub_21B3681E8();
  v20 = 0;
  if (OUTLINED_FUNCTION_16_7((uint64_t)v15) != 1)
  {
    v20 = (void *)sub_21B368128();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v15, v19);
  }
  sub_21B1F2ABC(a5, (uint64_t)v12);
  if (OUTLINED_FUNCTION_16_7((uint64_t)v12) == 1)
  {
    v21 = 0;
  }
  else
  {
    v21 = (void *)sub_21B368128();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v12, v19);
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithTitle_contents_groupName_createdDateComponents_modifiedDateComponents_identifier_, v16, v18, a3, v20, v21, 0);

  sub_21B1EB2C0(a5);
  sub_21B1EB2C0(v23);
  OUTLINED_FUNCTION_20_0();
}

void sub_21B35F1B4()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = objc_msgSend(v0, sel_contents);
  OUTLINED_FUNCTION_0_6((uint64_t)v1, (unint64_t *)&qword_255142220);
  v2 = OUTLINED_FUNCTION_24_35();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_18:
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_20_0();
    return;
  }
  OUTLINED_FUNCTION_1_66();
  v3 = sub_21B36BB30();
  if (!v3)
    goto LABEL_18;
LABEL_3:
  if (v3 >= 1)
  {
    v4 = 0;
    v5 = MEMORY[0x24BEE4AF8];
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_3_21();
      v6 = OUTLINED_FUNCTION_2_17();
      objc_opt_self();
      v7 = (void *)swift_dynamicCastObjCClass();
      if (v7)
      {
        v8 = sub_21B35F4CC(v7);
        if (v9)
        {
          v10 = v8;
          v11 = v9;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_0_38();
            v5 = v14;
          }
          v12 = *(_QWORD *)(v5 + 16);
          if (v12 >= *(_QWORD *)(v5 + 24) >> 1)
          {
            OUTLINED_FUNCTION_0_38();
            v5 = v15;
          }
          *(_QWORD *)(v5 + 16) = v12 + 1;
          v13 = v5 + 16 * v12;
          *(_QWORD *)(v13 + 32) = v10;
          *(_QWORD *)(v13 + 40) = v11;
        }
      }
      else
      {

      }
      ++v4;
    }
    while (v3 != v4);
    goto LABEL_18;
  }
  __break(1u);
}

uint64_t sub_21B35F328()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v1 = objc_msgSend(v0, sel_contents);
  OUTLINED_FUNCTION_0_6((uint64_t)v1, (unint64_t *)&qword_255142220);
  v2 = OUTLINED_FUNCTION_24_35();

  v10 = MEMORY[0x24BEE4AF8];
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_16:
    OUTLINED_FUNCTION_6_2();
    v9 = MEMORY[0x24BEE4AF8];
LABEL_17:
    OUTLINED_FUNCTION_6_2();
    return v9;
  }
  OUTLINED_FUNCTION_1_66();
  result = sub_21B36BB30();
  v3 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_3_21();
      v6 = OUTLINED_FUNCTION_2_17();
      objc_opt_self();
      v7 = (void *)swift_dynamicCastObjCClass();
      if (v7)
      {
        v8 = objc_msgSend(v7, sel_image);

        if (v8)
        {
          MEMORY[0x2207616A0]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_21B36B5D8();
          sub_21B36B5FC();
          sub_21B36B5C0();
        }
      }
      else
      {

      }
    }
    OUTLINED_FUNCTION_6_2();
    v9 = v10;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_21B35F4CC(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_text);

  if (!v2)
    return 0;
  v3 = sub_21B36B440();

  return v3;
}

uint64_t OUTLINED_FUNCTION_1_66()
{
  return swift_bridgeObjectRetain();
}

void INTask.asDynamicEntity.getter()
{
  OUTLINED_FUNCTION_1_67();
  Entity<A>.init(_:)();
}

uint64_t sub_21B35F570()
{
  void *v0;

  return sub_21B313EAC(v0);
}

void INTaskList.asDynamicEntity.getter()
{
  OUTLINED_FUNCTION_1_67();
  Entity<A>.init(_:)();
}

uint64_t sub_21B35F5A0()
{
  void *v0;

  return sub_21B313EAC(v0);
}

uint64_t INNote.asDynamicEntity.getter()
{
  id v0;

  v0 = OUTLINED_FUNCTION_1_67();
  return Entity<A>.init(_:)(v0);
}

void INSpatialEventTrigger.asDynamicEntity.getter()
{
  OUTLINED_FUNCTION_1_67();
  Entity<A>.init(_:)();
}

void INTemporalEventTrigger.asDynamicEntity.getter()
{
  OUTLINED_FUNCTION_1_67();
  Entity<A>.init(_:)();
}

void INContactEventTrigger.asDynamicEntity.getter()
{
  OUTLINED_FUNCTION_1_67();
  Entity<A>.init(_:)();
}

void INDateComponentsRange.asDynamicEntity.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v20 = OUTLINED_FUNCTION_1_67();
  Entity<A>.init(_:)((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t sub_21B35F680()
{
  return sub_21B161AF8(&qword_25514DFD8, type metadata accessor for Common.Reminder, (uint64_t)&protocol conformance descriptor for Common.Reminder);
}

uint64_t sub_21B35F6AC()
{
  return sub_21B161AF8(&qword_25514DFD0, type metadata accessor for Common.ReminderList, (uint64_t)&protocol conformance descriptor for Common.ReminderList);
}

uint64_t sub_21B35F6D8()
{
  return sub_21B161AF8(&qword_25514DE90, type metadata accessor for Common.Note, (uint64_t)&protocol conformance descriptor for Common.Note);
}

uint64_t sub_21B35F704()
{
  return sub_21B161AF8(&qword_25514E0C0, type metadata accessor for Common.EventTrigger, (uint64_t)&protocol conformance descriptor for Common.EventTrigger);
}

uint64_t sub_21B35F730()
{
  return sub_21B161AF8(&qword_25514DD88, type metadata accessor for Common.Person, (uint64_t)&protocol conformance descriptor for Common.Person);
}

uint64_t sub_21B35F75C()
{
  return sub_21B161AF8(&qword_25514DE98, type metadata accessor for Common.DateTime, (uint64_t)&protocol conformance descriptor for Common.DateTime);
}

id OUTLINED_FUNCTION_1_67()
{
  void *v0;

  return v0;
}

uint64_t sub_21B35F798(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142588);
  v3[10] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0A0);
  v3[11] = OUTLINED_FUNCTION_23_1();
  v4 = sub_21B368C44();
  v3[12] = v4;
  v3[13] = *(_QWORD *)(v4 - 8);
  v3[14] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  v3[15] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B35F86C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = v0[16];
  v1 = v0[17];
  v3 = v0[8];
  v4 = v0[9];
  v5 = type metadata accessor for DefaultUnsupportedIntentStrategy();
  sub_21B186684(v4 + *(int *)(v5 + 24), (uint64_t)(v0 + 2));
  v6 = type metadata accessor for Snippet();
  OUTLINED_FUNCTION_6_1(v1, v7, v8, v6);
  static Snippet.appPunchout(to:siriLocale:)(v3, v4 + *(int *)(v5 + 20), v2);
  v9 = (_QWORD *)swift_task_alloc();
  v0[18] = v9;
  *v9 = v0;
  v9[1] = sub_21B35F914;
  return sub_21B35FCB8();
}

uint64_t sub_21B35F914(uint64_t a1)
{
  uint64_t v1;
  uint64_t **v2;
  uint64_t *v4;
  uint64_t v5;

  v4 = *v2;
  (*v2)[19] = v1;
  swift_task_dealloc();
  if (v1)
  {
    v5 = v4[17];
    sub_21B163F9C(v4[16], &qword_25514D0B0);
    sub_21B163F9C(v5, &qword_25514D0B0);
    sub_21B186B10((uint64_t)(v4 + 2));
  }
  else
  {
    v4[20] = a1;
  }
  return swift_task_switch();
}

uint64_t sub_21B35F9B4()
{
  uint64_t *v0;
  void *v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  uint64_t v18;

  v1 = (void *)v0[20];
  v2 = v0[15];
  v4 = v0[10];
  v3 = v0[11];
  v5 = sub_21B368F44();
  OUTLINED_FUNCTION_6_1(v2, v6, v7, v5);
  sub_21B368C20();
  v8 = sub_21B36AC78();
  OUTLINED_FUNCTION_6_1(v3, v9, v10, v8);
  v11 = sub_21B368CBC();
  OUTLINED_FUNCTION_6_1(v4, v12, v13, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0C0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_21B36D370;
  *(_QWORD *)(v14 + 32) = v1;
  v18 = v14;
  sub_21B36B5C0();
  v0[21] = v18;
  v15 = v1;
  v16 = (_QWORD *)swift_task_alloc();
  v0[22] = (uint64_t)v16;
  *v16 = v0;
  v16[1] = sub_21B35FAEC;
  return sub_21B34FF90(v0[7], v0[17], v0[16], v18, 0, 0, v0[15], v0[14]);
}

uint64_t sub_21B35FAEC()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_15_2();
  v2 = (void *)v1[20];
  v3 = v1[16];
  v4 = v1[17];
  v5 = v1[14];
  v11 = v1[15];
  v12 = (uint64_t)(v1 + 2);
  v7 = v1[12];
  v6 = v1[13];
  v8 = v1[10];
  v9 = v1[11];
  OUTLINED_FUNCTION_18_9();
  swift_bridgeObjectRelease();

  sub_21B163F9C(v8, &qword_255142588);
  sub_21B163F9C(v9, (uint64_t *)&unk_25514D0A0);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  sub_21B163F9C(v11, &qword_2551420E8);
  sub_21B163F9C(v3, &qword_25514D0B0);
  sub_21B163F9C(v4, &qword_25514D0B0);
  sub_21B186B10(v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B35FC0C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for DefaultUnsupportedIntentStrategy()
{
  uint64_t result;

  result = qword_255152278;
  if (!qword_255152278)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21B35FCB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_21B35FCD0()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  _QWORD *v3;
  _QWORD *v5;
  _QWORD *v6;

  v1 = v0[2];
  v2 = *(unsigned __int8 *)(v1 + *(int *)(type metadata accessor for DefaultUnsupportedIntentStrategy() + 28));
  if (v2 == 23)
  {
    v5 = (_QWORD *)swift_task_alloc();
    v0[4] = v5;
    *v5 = v0;
    v5[1] = sub_21B345054;
    return sub_21B32F378();
  }
  else if (v2 == 20)
  {
    v3 = (_QWORD *)swift_task_alloc();
    v0[3] = v3;
    *v3 = v0;
    v3[1] = sub_21B34501C;
    return sub_21B32F3D8();
  }
  else
  {
    v6 = (_QWORD *)swift_task_alloc();
    v0[5] = v6;
    *v6 = v0;
    v6[1] = sub_21B34508C;
    return sub_21B32F318();
  }
}

_QWORD *sub_21B35FDA4(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  __int128 v14;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21B368458();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = *(_OWORD *)((char *)a2 + v13 + 24);
    *(_OWORD *)((char *)v7 + v13 + 24) = v14;
    (**(void (***)(void))(v14 - 8))();
    *((_BYTE *)v7 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  }
  return v7;
}

uint64_t sub_21B35FE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21B368458();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 24));
}

_QWORD *sub_21B35FED8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  __int128 v12;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21B368458();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = *(_OWORD *)((char *)a2 + v11 + 24);
  *(_OWORD *)((char *)a1 + v11 + 24) = v12;
  (**(void (***)(void))(v12 - 8))();
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

_QWORD *sub_21B35FF88(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21B368458();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  __swift_assign_boxed_opaque_existential_1((_QWORD *)((char *)a1 + a3[6]), (_QWORD *)((char *)a2 + a3[6]));
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

_QWORD *sub_21B360020(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21B368458();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  *((_BYTE *)a1 + v11) = *((_BYTE *)a2 + v11);
  return a1;
}

_QWORD *sub_21B3600B0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  __int128 v13;

  *a1 = *a2;
  swift_release();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21B368458();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1 + v10);
  v13 = *((_OWORD *)v12 + 1);
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *((_OWORD *)v11 + 1) = v13;
  *((_QWORD *)v11 + 4) = *((_QWORD *)v12 + 4);
  *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
  return a1;
}

uint64_t sub_21B360154()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21B360160(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_21B368458();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_21B3601D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_21B3601E0(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v7 = sub_21B368458();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_21B36024C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21B368458();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *_s14descr24DE739E1V18NeedsValueStrategyVMa()
{
  return &_s14descr24DE739E1V18NeedsValueStrategyVN;
}

uint64_t sub_21B3602E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void (*v5)(_QWORD *__return_ptr, char *, uint64_t);
  int8x16_t v6;
  uint64_t v7;
  void *v8;
  os_log_type_t v9;
  _DWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  os_log_type_t v17;
  _DWORD *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28[8];
  uint64_t v29;
  _QWORD v30[8];
  _QWORD v31[3];
  int8x16_t v32;
  int8x16_t v33;
  char v34;
  _BYTE v35[64];
  _QWORD v36[9];

  v1 = sub_21B369490();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void (**)(_QWORD *__return_ptr, char *, uint64_t))(v0 + 48);
  sub_21B36940C();
  v5(v36, v4, 1);
  OUTLINED_FUNCTION_19_25((uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_21B19BFD0((uint64_t)v36, (uint64_t)v35);
  if (v35[56] == 255)
    goto LABEL_6;
  sub_21B19BFD0((uint64_t)v35, (uint64_t)v31);
  if (v34 != 3)
  {
    if (v34 == 7)
    {
      v6 = vorrq_s8(v32, v33);
      if (!(*(_QWORD *)&vorr_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) | v31[2] | v31[1] | v31[0]))
      {
        if (qword_2551411E0 != -1)
          swift_once();
        v24 = OUTLINED_FUNCTION_9_0();
        v25 = __swift_project_value_buffer(v24, (uint64_t)&unk_25517A6C8);
        sub_21B36B29C();
        v26 = OUTLINED_FUNCTION_29_1();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)OUTLINED_FUNCTION_3_3();
          *(_WORD *)v27 = 0;
          _os_log_impl(&dword_21B15D000, v25, v26, "[SFNI.NeedsValueStrategy] Returning .cancel().", v27, 2u);
          OUTLINED_FUNCTION_3();
        }

        sub_21B368D58();
        goto LABEL_11;
      }
    }
    sub_21B1700E0((uint64_t)v31);
LABEL_6:
    if (qword_2551411E0 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_9_0();
    v8 = (void *)__swift_project_value_buffer(v7, (uint64_t)&unk_25517A6C8);
    sub_21B19BFD0((uint64_t)v36, (uint64_t)v31);
    sub_21B36B29C();
    v9 = OUTLINED_FUNCTION_29_1();
    if (OUTLINED_FUNCTION_8_2(v9))
    {
      v10 = (_DWORD *)OUTLINED_FUNCTION_3_3();
      v28[0] = OUTLINED_FUNCTION_3_3();
      *v10 = 136315138;
      sub_21B19BFD0((uint64_t)v31, (uint64_t)v30);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255142190);
      v11 = sub_21B36B47C();
      v30[0] = sub_21B196024(v11, v12, v28);
      OUTLINED_FUNCTION_18_33();
      swift_bridgeObjectRelease();
      sub_21B163F9C((uint64_t)v31, &qword_255142190);
      OUTLINED_FUNCTION_26_5(&dword_21B15D000, v13, v14, "[SFNI.NeedsValueStrategy] Returning .ignore() for task: %s.");
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_3();
    }
    sub_21B163F9C((uint64_t)v31, &qword_255142190);

    sub_21B368D70();
LABEL_11:
    sub_21B163F9C((uint64_t)v36, &qword_255142190);
    return sub_21B163F9C((uint64_t)v35, &qword_255142190);
  }
  if (qword_2551411E0 != -1)
    swift_once();
  v15 = OUTLINED_FUNCTION_9_0();
  v16 = (void *)__swift_project_value_buffer(v15, (uint64_t)&unk_25517A6C8);
  sub_21B19BFD0((uint64_t)v36, (uint64_t)v30);
  sub_21B36B29C();
  v17 = OUTLINED_FUNCTION_29_1();
  if (OUTLINED_FUNCTION_8_2(v17))
  {
    v18 = (_DWORD *)OUTLINED_FUNCTION_3_3();
    v29 = OUTLINED_FUNCTION_3_3();
    *v18 = 136315138;
    sub_21B19BFD0((uint64_t)v30, (uint64_t)v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255142190);
    v19 = sub_21B36B47C();
    v28[0] = sub_21B196024(v19, v20, &v29);
    OUTLINED_FUNCTION_18_33();
    swift_bridgeObjectRelease();
    sub_21B163F9C((uint64_t)v30, &qword_255142190);
    OUTLINED_FUNCTION_26_5(&dword_21B15D000, v21, v22, "[SFNI.NeedsValueStrategy] Returning .handle() for task: %s.");
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_3();
  }
  sub_21B163F9C((uint64_t)v30, &qword_255142190);

  sub_21B368D64();
  sub_21B163F9C((uint64_t)v36, &qword_255142190);
  sub_21B1700E0((uint64_t)v31);
  return sub_21B163F9C((uint64_t)v35, &qword_255142190);
}

uint64_t sub_21B360770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[18] = a3;
  v4[19] = v3;
  v4[16] = a1;
  v4[17] = a2;
  v5 = sub_21B369490();
  v4[20] = v5;
  v4[21] = *(_QWORD *)(v5 - 8);
  v4[22] = OUTLINED_FUNCTION_23_1();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B3607C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 152) + 48);
  sub_21B36940C();
  v3(v1, 0);
  OUTLINED_FUNCTION_19_25(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v4 = *(unsigned __int8 *)(v0 + 72);
  if (v4 == 3)
  {
    sub_21B171D88((__int128 *)(v0 + 16), v0 + 80);
    v5 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 112);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 80), v5);
    v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v6 + 40) + *(_QWORD *)(v6 + 40));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v7;
    *v7 = v0;
    v7[1] = sub_21B360908;
    return v11(1, v5, v6);
  }
  else
  {
    if (v4 == 255)
      sub_21B163F9C(v0 + 16, &qword_255142190);
    else
      sub_21B1700E0(v0 + 16);
    sub_21B1644F8();
    v9 = OUTLINED_FUNCTION_26_2();
    OUTLINED_FUNCTION_9_50(v9, v10);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_21B360908(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 192) = a1;
  *(_QWORD *)(v3 + 200) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B36096C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23[4];

  v1 = *(void **)(v0 + 192);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255143788);
  v2 = (void *)sub_21B3692BC();
  v3 = sub_21B1A736C(v1);

  if (qword_2551411E0 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_9_0();
  v5 = __swift_project_value_buffer(v4, (uint64_t)&unk_25517A6C8);
  v6 = v3;
  v7 = v5;
  sub_21B36B29C();
  v8 = OUTLINED_FUNCTION_29_1();
  if (os_log_type_enabled(v5, v8))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v23[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v9 = 136315138;
    v10 = v6;
    v11 = objc_msgSend(v10, sel_description);
    v12 = sub_21B36B440();
    v14 = v13;

    *(_QWORD *)(v0 + 120) = sub_21B196024(v12, v14, v23);
    sub_21B36B818();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21B15D000, v7, v8, "[SFNI.NeedsValueStrategy] Parsed response and updated intent: %s.", v9, 0xCu);
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_3();
  }

  v15 = *(void **)(v0 + 192);
  v16 = *(_QWORD *)(v0 + 128);
  v17 = (void *)sub_21B3692C8();
  v18 = objc_msgSend(v17, sel_resolvedValue);

  sub_21B36B884();
  swift_unknownObjectRelease();
  sub_21B361550();
  sub_21B368FF8();

  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255152308);
  OUTLINED_FUNCTION_21_13(v16, v20, v21, v19);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  swift_task_dealloc();
  return OUTLINED_FUNCTION_3_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B360BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  v3[21] = OUTLINED_FUNCTION_23_1();
  v4 = sub_21B368F98();
  v3[22] = v4;
  v3[23] = *(_QWORD *)(v4 - 8);
  v3[24] = OUTLINED_FUNCTION_23_1();
  v5 = sub_21B3690E8();
  v3[25] = v5;
  v3[26] = *(_QWORD *)(v5 - 8);
  v3[27] = swift_task_alloc();
  v3[28] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255143788);
  v3[29] = v6;
  v3[30] = *(_QWORD *)(v6 - 8);
  v3[31] = OUTLINED_FUNCTION_23_1();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B360CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_2551411E0 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = OUTLINED_FUNCTION_9_0();
  __swift_project_value_buffer(v5, (uint64_t)&unk_25517A6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v6 = sub_21B36B29C();
  v7 = sub_21B36B734();
  if (os_log_type_enabled(v6, v7))
  {
    v25 = *(_QWORD *)(v0 + 240);
    v8 = *(_QWORD *)(v0 + 224);
    v23 = *(_QWORD *)(v0 + 208);
    v24 = *(_QWORD *)(v0 + 200);
    v9 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v26 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v9 = 136315138;
    sub_21B3692D4();
    v10 = sub_21B3690DC();
    v12 = v11;
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v8, v24);
    *(_QWORD *)(v0 + 136) = sub_21B196024(v10, v12, &v26);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16_28(v25);
    _os_log_impl(&dword_21B15D000, v6, v7, "[SFNI.NeedsValueStrategy] Making prompt for %s.", v9, 0xCu);
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_16_28(*(_QWORD *)(v0 + 240));

  v14 = *(_QWORD *)(v0 + 208);
  v13 = *(_QWORD *)(v0 + 216);
  sub_21B3692D4();
  v15 = sub_21B3690DC();
  v17 = v16;
  OUTLINED_FUNCTION_19_25(v13, *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
  swift_bridgeObjectRetain();
  v18 = sub_21B1B9B8C();
  *(_BYTE *)(v0 + 272) = v18;
  if (v18 == 10)
  {
    sub_21B1644F8();
    OUTLINED_FUNCTION_26_2();
    *(_QWORD *)v19 = v15;
    *(_QWORD *)(v19 + 8) = v17;
    *(_QWORD *)(v19 + 16) = 0;
    *(_QWORD *)(v19 + 24) = 0;
    *(_BYTE *)(v19 + 32) = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_18_1();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_3_8(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v21 = v18;
    swift_bridgeObjectRelease();
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v22;
    *v22 = v0;
    v22[1] = sub_21B360F80;
    return sub_21B361180(*(_QWORD *)(v0 + 192), v21);
  }
}

uint64_t sub_21B360F80()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_15_2();
  *v2 = *v1;
  *(_QWORD *)(v3 + 264) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B360FD4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = *(_BYTE *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 168);
  v13 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(uint64_t **)(v0 + 144);
  sub_21B167310(v5 + 8, v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 8), *(_QWORD *)(v5 + 32));
  sub_21B368BCC();
  *(_QWORD *)(v0 + 80) = &type metadata for SearchForNotebookItems.Parameter;
  *(_QWORD *)(v0 + 88) = &off_24DE5FB50;
  *(_BYTE *)(v0 + 56) = v1;
  sub_21B19C83C();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v7 = sub_21B368F44();
  OUTLINED_FUNCTION_21_13(v4, v8, v9, v7);
  v10 = sub_21B3694E4();
  *(_OWORD *)(v0 + 112) = 0u;
  *(_QWORD *)(v0 + 128) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  v11 = MEMORY[0x24BE99088];
  v6[3] = v10;
  v6[4] = v11;
  __swift_allocate_boxed_opaque_existential_0(v6);
  sub_21B368DDC();
  sub_21B163F9C(v0 + 96, &qword_2551420F0);
  sub_21B163F9C(v4, &qword_2551420E8);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_15_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B361180(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 96) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  return swift_task_switch();
}

void sub_21B36119C()
{
  __asm { BR              X10 }
}

uint64_t sub_21B3611D0()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C85AC();
}

uint64_t sub_21B361208()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C8554();
}

uint64_t sub_21B361240()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C86C4();
}

uint64_t sub_21B361278()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C843C();
}

uint64_t sub_21B3612B0()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C8604();
}

uint64_t sub_21B3612E8()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C84FC();
}

uint64_t sub_21B361320()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C849C();
}

uint64_t sub_21B361358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_21B1644F8();
  v1 = OUTLINED_FUNCTION_26_2();
  OUTLINED_FUNCTION_9_50(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B361388()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_41_1();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  OUTLINED_FUNCTION_21_7(v1);
  return sub_21B1C8664();
}

uint64_t sub_21B3613C0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_18_9();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B3613EC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_18_9();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B361418()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_18_9();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B361448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21B1A115C;
  return sub_21B360770(a1, a2, a3);
}

uint64_t sub_21B3614B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21B1A0E48;
  return sub_21B360BE8(a1, a2);
}

unint64_t sub_21B361514()
{
  unint64_t result;

  result = qword_2551522C8[0];
  if (!qword_2551522C8[0])
  {
    result = MEMORY[0x2207623FC](&unk_21B38D7A4, &_s14descr24DE739E1V18NeedsValueStrategyVN);
    atomic_store(result, qword_2551522C8);
  }
  return result;
}

unint64_t sub_21B361550()
{
  unint64_t result;

  result = qword_255147140;
  if (!qword_255147140)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255147140);
  }
  return result;
}

void sub_21B36158C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 >> 62)
    goto LABEL_20;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_21B165AAC();
    if (v2 < 0)
    {
      __break(1u);
      return;
    }
    v3 = 0;
    while (v2 != v3)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v4 = (id)MEMORY[0x220761AB4](v3, a1);
      else
        v4 = *(id *)(a1 + 8 * v3 + 32);
      v5 = v4;
      v6 = objc_msgSend(v5, sel_notificationId);
      if (v6)
      {
        v7 = v6;
        v8 = sub_21B36B440();
        v10 = v9;

      }
      else
      {
        v8 = 0;
        v10 = 0;
      }

      if (!v10)
        goto LABEL_19;
      v11 = *(_QWORD *)(v13 + 16);
      if (v11 >= *(_QWORD *)(v13 + 24) >> 1)
        sub_21B165AAC();
      ++v3;
      *(_QWORD *)(v13 + 16) = v11 + 1;
      v12 = v13 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v8;
      *(_QWORD *)(v12 + 40) = v10;
      if (v2 == v3)
        return;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
    v2 = sub_21B36BB30();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21B361724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B361788()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;

  v1 = v0[10];
  v2 = (_QWORD *)v0[11];
  v4 = v0[8];
  v3 = v0[9];
  v5 = v0[7];
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81490]), sel_init);
  v0[12] = v6;
  sub_21B361D74(v5, v4, v6);
  sub_21B361DB8(v3, v1, v6);
  sub_21B161A30(0, (unint64_t *)&qword_255146FF8);
  v7 = (void *)sub_21B36B7B8();
  objc_msgSend(v6, sel_setSupportsSpokenNotifications_, v7);

  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  v8 = (_QWORD *)swift_task_alloc();
  v0[13] = v8;
  sub_21B161A30(0, &qword_255152318);
  *v8 = v0;
  v8[1] = sub_21B3618E4;
  return sub_21B369148();
}

uint64_t sub_21B3618E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B36198C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  _DWORD *v8;
  _QWORD *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_2551411E0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 112);
  v2 = sub_21B36B2B4();
  __swift_project_value_buffer(v2, (uint64_t)&unk_25517A6C8);
  v3 = v1;
  v4 = sub_21B36B29C();
  v5 = sub_21B36B734();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 112);
  if (v6)
  {
    v8 = (_DWORD *)OUTLINED_FUNCTION_3_3();
    v9 = (_QWORD *)OUTLINED_FUNCTION_3_3();
    *v8 = 138412290;
    v10 = objc_msgSend(v7, sel_dictionary);
    v11 = v10;
    if (v10)
      *(_QWORD *)(v0 + 48) = v10;
    else
      *(_QWORD *)(v0 + 40) = 0;
    sub_21B36B818();
    v12 = *(void **)(v0 + 112);
    *v9 = v11;

    OUTLINED_FUNCTION_7_24(&dword_21B15D000, v4, v5, "[NotificationProvider] Notification search completed: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_2551430F0);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  v13 = *(void **)(v0 + 112);
  v14 = sub_21B361DFC(v13);
  if (v14)
    v15 = v14;
  else
    v15 = MEMORY[0x24BEE4AF8];
  sub_21B36158C(v15);
  v17 = v16;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v17);
}

uint64_t sub_21B361B84()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  _DWORD *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (qword_2551411E0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 120);
  v2 = sub_21B36B2B4();
  __swift_project_value_buffer(v2, (uint64_t)&unk_25517A6C8);
  v3 = v1;
  v4 = v1;
  v5 = sub_21B36B29C();
  v6 = sub_21B36B71C();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 120);
  if (v7)
  {
    v9 = (_DWORD *)OUTLINED_FUNCTION_3_3();
    v14[0] = OUTLINED_FUNCTION_3_3();
    *v9 = 136446210;
    *(_QWORD *)(v0 + 16) = v8;
    v10 = v8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255145470);
    v11 = sub_21B36B47C();
    *(_QWORD *)(v0 + 24) = sub_21B196024(v11, v12, v14);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_67();
    OUTLINED_FUNCTION_2_67();
    OUTLINED_FUNCTION_7_24(&dword_21B15D000, v5, v6, "[NotificationProvider] Got error when searching notifications: %{public}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_2_67();
  OUTLINED_FUNCTION_2_67();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

void sub_21B361D74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21B36B434();
  objc_msgSend(a3, sel_setSourceAppId_, v4);

}

void sub_21B361DB8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21B36B434();
  objc_msgSend(a3, sel_setAfterNotificationId_, v4);

}

uint64_t sub_21B361DFC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_notifications);
  if (!v1)
    return 0;
  v2 = v1;
  sub_21B161A30(0, qword_255152320);
  v3 = sub_21B36B5A8();

  return v3;
}

ValueMetadata *type metadata accessor for NotificationProvider()
{
  return &type metadata for NotificationProvider;
}

void OUTLINED_FUNCTION_2_67()
{
  void *v0;

}

uint64_t sub_21B361E80()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21B361E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6 = OUTLINED_FUNCTION_26_1();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v7 = OUTLINED_FUNCTION_5_25();
    v8 = a1 + *(int *)(a3 + 36);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_21B361F24()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21B361F30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = OUTLINED_FUNCTION_26_1();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
      return result;
    }
    v9 = OUTLINED_FUNCTION_5_25();
    v10 = a1 + *(int *)(a4 + 36);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t type metadata accessor for SetTaskAttributeNLv3IntentWrapper()
{
  uint64_t result;

  result = qword_255152380;
  if (!qword_255152380)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21B361FFC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21B36A600();
  if (v1 <= 0x3F)
  {
    result = sub_21B368458();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_21B362098(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142048);
  v3[5] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B3620E0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  int EnumTagSinglePayload;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD);

  v1 = v0[5];
  sub_21B1FD794(v0[2], v1);
  v2 = sub_21B369988();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  v4 = v0[5];
  if (EnumTagSinglePayload == 1)
  {
    sub_21B1853B0(v0[5], &qword_255142048);
    v5 = 0;
  }
  else
  {
    v5 = sub_21B369934();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v4, v2);
  }
  v0[6] = v5;
  v6 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_21B3621B4;
  return v8(v5, v0[3], 0);
}

uint64_t sub_21B3621B4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B36220C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 64);
  if (v1)
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA250]), sel_initWithDateComponentsRange_, v1);

  }
  else
  {
    v2 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v2);
}

uint64_t sub_21B362278(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 880) = v1;
  *(_BYTE *)(v2 + 1096) = a1;
  v3 = OUTLINED_FUNCTION_21_45();
  *(_QWORD *)(v2 + 888) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 896) = v4;
  *(_QWORD *)(v2 + 904) = *(_QWORD *)(v4 + 64);
  *(_QWORD *)(v2 + 912) = swift_task_alloc();
  type metadata accessor for IntentTriggerTemporalModelNLv3();
  *(_QWORD *)(v2 + 920) = OUTLINED_FUNCTION_23_1();
  v5 = OUTLINED_FUNCTION_5_25();
  *(_QWORD *)(v2 + 928) = v5;
  *(_QWORD *)(v2 + 936) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 944) = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142048);
  *(_QWORD *)(v2 + 952) = OUTLINED_FUNCTION_23_1();
  v6 = OUTLINED_FUNCTION_26_1();
  *(_QWORD *)(v2 + 960) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 968) = v7;
  *(_QWORD *)(v2 + 976) = *(_QWORD *)(v7 + 64);
  *(_QWORD *)(v2 + 984) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v2 + 992) = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v2 + 1000) = OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B36234C()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(_QWORD, uint64_t);
  uint64_t v17;

  if (*(_BYTE *)(v0 + 1096) == 1)
    sub_21B35A638(*(_QWORD *)(v0 + 1000));
  else
    sub_21B1804F0(*(_QWORD *)(v0 + 880), *(_QWORD *)(v0 + 1000), type metadata accessor for NotebookNLv3Intent);
  if (qword_2551411D8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 1000);
  v3 = *(_QWORD *)(v0 + 992);
  v4 = sub_21B36B2B4();
  *(_QWORD *)(v0 + 1008) = v4;
  __swift_project_value_buffer(v4, (uint64_t)&unk_25517A6B0);
  sub_21B1804F0(v2, v3, type metadata accessor for NotebookNLv3Intent);
  v5 = sub_21B36B29C();
  v6 = sub_21B36B710();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 992);
  if (v7)
  {
    OUTLINED_FUNCTION_17_42();
    v17 = OUTLINED_FUNCTION_12_54();
    *v1 = 136315138;
    sub_21B21B6F8(&qword_255145168, (uint64_t)&unk_21B389604);
    v9 = sub_21B36BCA4();
    *(_QWORD *)(v0 + 872) = sub_21B196024(v9, v10, &v17);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    sub_21B1BF2BC(v8, type metadata accessor for NotebookNLv3Intent);
    OUTLINED_FUNCTION_9_36(&dword_21B15D000, v5, v6, "[SetTaskAttributeNLv3IntentWrapper] attempting to parse %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }
  sub_21B1BF2BC(*(_QWORD *)(v0 + 992), type metadata accessor for NotebookNLv3Intent);

  v11 = (_QWORD *)(*(_QWORD *)(v0 + 880) + *(int *)(*(_QWORD *)(v0 + 888) + 20));
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  sub_21B31BB48();
  if (qword_255141288 != -1)
    swift_once();
  v12 = sub_21B36A990();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_25517A848);
  v14 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v0 + 1016) = v14;
  *v14 = v0;
  v14[1] = sub_21B3625D8;
  return v16(*(_QWORD *)(v0 + 952), v13);
}

uint64_t sub_21B3625D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 952);
  *(_QWORD *)(*(_QWORD *)v1 + 1024) = a1;
  swift_task_dealloc();
  sub_21B1853B0(v2, &qword_255142048);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B36263C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(unsigned __int8 *)(v0 + 1096);
  (*(void (**)(_QWORD))(*(_QWORD *)(v0 + 936) + 16))(*(_QWORD *)(v0 + 944));
  if (v1 == 1)
  {
    *(_QWORD *)(v0 + 728) = 0;
    *(_OWORD *)(v0 + 696) = 0u;
    *(_OWORD *)(v0 + 712) = 0u;
  }
  else
  {
    sub_21B167310(*(_QWORD *)(v0 + 880) + *(int *)(*(_QWORD *)(v0 + 888) + 32), v0 + 696);
  }
  v2 = *(_QWORD *)(v0 + 944);
  v3 = *(_QWORD *)(v0 + 936);
  v4 = *(_QWORD *)(v0 + 928);
  v5 = sub_21B332748(*(_QWORD *)(v0 + 1000), v2, v0 + 696);
  *(_QWORD *)(v0 + 1032) = v5;
  sub_21B1853B0(v0 + 696, &qword_255145160);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = objc_msgSend(v5, sel_temporalEventTrigger);
  if (qword_2551414D0 != -1)
    swift_once();
  v7 = *(void **)(v0 + 1024);
  v8 = *(_QWORD *)(v0 + 1000);
  v9 = *(_QWORD *)(v0 + 984);
  v10 = *(_QWORD *)(v0 + 920);
  v11 = *(_QWORD *)(v0 + 912);
  v22 = *(_QWORD *)(v0 + 976);
  v20 = *(_QWORD *)(v0 + 896);
  v21 = *(_QWORD *)(v0 + 968);
  v12 = *(_QWORD *)(v0 + 880);
  sub_21B21B6F8((unint64_t *)&qword_255141798, (uint64_t)&unk_21B389FAC);
  sub_21B369B50();
  *(_QWORD *)(v0 + 1040) = sub_21B347DD4(v6, v7, v10);

  sub_21B1BF2BC(v10, (uint64_t (*)(_QWORD))type metadata accessor for IntentTriggerTemporalModelNLv3);
  sub_21B1804F0(v8, v9, type metadata accessor for NotebookNLv3Intent);
  sub_21B1804F0(v12, v11, (uint64_t (*)(_QWORD))type metadata accessor for SetTaskAttributeNLv3IntentWrapper);
  v13 = (*(unsigned __int8 *)(v21 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v14 = (v22 + *(unsigned __int8 *)(v20 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v0 + 1048) = v15;
  sub_21B18093C(v9, v15 + v13, type metadata accessor for NotebookNLv3Intent);
  sub_21B18093C(v11, v15 + v14, (uint64_t (*)(_QWORD))type metadata accessor for SetTaskAttributeNLv3IntentWrapper);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2551472B0);
  swift_asyncLet_begin();
  *(_QWORD *)(v0 + 1056) = sub_21B3337FC();
  if (qword_255141528 != -1)
    swift_once();
  v16 = sub_21B369B5C();
  sub_21B1D58C4(v16);
  *(_QWORD *)(v0 + 1064) = v17;
  v18 = sub_21B369B5C();
  *(_QWORD *)(v0 + 1072) = sub_21B3480AC(v18);
  return swift_asyncLet_get_throwing();
}

uint64_t sub_21B36296C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 1080) = v0;
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B36298C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int *v4;
  void *v5;
  void *v6;
  int *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;

  v1 = v0[134];
  v2 = v0[133];
  v3 = (void *)v0[132];
  v4 = (int *)v0[130];
  v5 = (void *)v0[129];
  v6 = (void *)v0[107];
  objc_allocWithZone(MEMORY[0x24BDDA128]);
  v7 = v4;
  v8 = v5;
  v9 = v6;
  v10 = sub_21B347C40(v5, v3, v2, v1, v6, v4);
  v11 = (id)sub_21B31C3E4();
  if (v11)
  {
    sub_21B31F7C4();
    swift_release();
    v11 = (id)v0[100];
    if (v11)
    {
      v4 = (int *)v0[111];
      v12 = v0[110];
      v13 = v0[101];
      __swift_project_boxed_opaque_existential_1(v0 + 97, v0[100]);
      v14 = (int *)sub_21B1A83E0(v10, (_QWORD *)(v12 + v4[7]), (uint64_t)&unk_24DE591E0, (uint64_t)v11, *(_QWORD *)(v13 + 8));
      if (v14)
      {
        v4 = v14;
        v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9C40]), sel_initWithTriggerContact_, v14);

        __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 97));
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 97));
        v11 = 0;
      }
    }
    else
    {
      sub_21B1853B0((uint64_t)(v0 + 97), qword_2551472B8);
    }
  }
  objc_msgSend(v10, sel_setContactEventTrigger_, v11);

  if (qword_2551411E0 != -1)
    swift_once();
  __swift_project_value_buffer(v0[126], (uint64_t)&unk_25517A6C8);
  v15 = v10;
  v16 = sub_21B36B29C();
  v17 = sub_21B36B734();
  if (os_log_type_enabled(v16, v17))
  {
    OUTLINED_FUNCTION_17_42();
    v24 = OUTLINED_FUNCTION_12_54();
    *v4 = 136315138;
    v18 = v15;
    v19 = objc_msgSend(v18, sel_description);
    v20 = sub_21B36B440();
    v22 = v21;

    v0[108] = sub_21B196024(v20, v22, &v24);
    sub_21B36B818();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_9_36(&dword_21B15D000, v16, v17, "⚙️ [SetTaskAttributeNLv3IntentWrapper] made intent: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  v0[136] = sub_21B220B98();
  return swift_asyncLet_finish();
}

uint64_t sub_21B362C9C()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B362CA8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v3 = *(void **)(v1 + 1032);
  OUTLINED_FUNCTION_2_68(*(void **)(v1 + 1040));

  sub_21B1BF2BC(v0, type metadata accessor for NotebookNLv3Intent);
  OUTLINED_FUNCTION_101_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v1 + 8))(*(_QWORD *)(v1 + 1088));
}

uint64_t sub_21B362D5C()
{
  uint64_t v0;

  return swift_asyncLet_finish();
}

uint64_t sub_21B362DB0()
{
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_21B362DBC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v3 = *(void **)(v1 + 1040);
  OUTLINED_FUNCTION_2_68(*(void **)(v1 + 1032));

  sub_21B1BF2BC(v0, type metadata accessor for NotebookNLv3Intent);
  OUTLINED_FUNCTION_101_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21B362E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = a3 + *(int *)(type metadata accessor for SetTaskAttributeNLv3IntentWrapper() + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_21B362ED4;
  return sub_21B332A7C(a2, v5);
}

uint64_t sub_21B362ED4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 32) = a1;
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B362F4C(char a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B16B400;
  return sub_21B362278(a1);
}

uint64_t sub_21B362F9C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_26_1() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = (int *)OUTLINED_FUNCTION_21_45();
  v5 = *(unsigned __int8 *)(*((_QWORD *)v4 - 1) + 80);
  v6 = (v2 + v3 + v5) & ~v5;
  sub_21B36A600();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_13_53(v4[5]);
  OUTLINED_FUNCTION_13_53(v4[6]);
  OUTLINED_FUNCTION_13_53(v4[7]);
  OUTLINED_FUNCTION_13_53(v4[8]);
  v7 = v0 + v6 + v4[9];
  v8 = OUTLINED_FUNCTION_5_25();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21B36308C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(OUTLINED_FUNCTION_26_1() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_21_45() - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = v1 + v5;
  v10 = v1 + (v8 & ~v7);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_21B1672D0;
  return sub_21B362E6C(a1, v9, v10);
}

void OUTLINED_FUNCTION_2_68(void *a1@<X8>)
{

}

uint64_t OUTLINED_FUNCTION_12_54()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_13_53@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_destroy_boxed_opaque_existential_1(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_17_42()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_21_45()
{
  return type metadata accessor for SetTaskAttributeNLv3IntentWrapper();
}

uint64_t sub_21B363178()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21B3631C8(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[7] = a1;
  v2[8] = v1;
  v2[9] = *v1;
  return swift_task_switch();
}

uint64_t sub_21B3631E8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  os_log_type_t v39;
  uint64_t (*v40)(unint64_t);
  uint64_t v41;

  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_QWORD *)(v2 + 48);
  *(_QWORD *)(v1 + 80) = v3;
  v4 = *(unsigned __int8 *)(v2 + 56);
  *(_BYTE *)(v1 + 104) = v4;
  if (v4 >> 6)
  {
    if (v4 >> 6 == 1)
    {
      OUTLINED_FUNCTION_9_3();
      if ((v4 & 1) != 0)
      {
        if (qword_2551411E0 != -1)
          swift_once();
        v24 = OUTLINED_FUNCTION_9_0();
        v6 = __swift_project_value_buffer(v24, (uint64_t)&unk_25517A6C8);
        OUTLINED_FUNCTION_9_3();
        OUTLINED_FUNCTION_9_3();
        sub_21B36B29C();
        v25 = OUTLINED_FUNCTION_29_1();
        if (os_log_type_enabled(v6, v25))
        {
          v26 = (uint8_t *)OUTLINED_FUNCTION_3_3();
          v41 = OUTLINED_FUNCTION_3_3();
          *(_DWORD *)v26 = 136446210;
          *(_QWORD *)(v1 + 32) = v3;
          OUTLINED_FUNCTION_9_3();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255145470);
          v27 = sub_21B36B47C();
          *(_QWORD *)(v1 + 40) = sub_21B196024(v27, v28, &v41);
          sub_21B36B818();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_2_26();
          _os_log_impl(&dword_21B15D000, v6, v25, "[AppResolutionFlow] App resolution resulted in a handled error of %{public}s", v26, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_3();
        }
      }
      else
      {
        if (qword_2551411E0 != -1)
          swift_once();
        v5 = OUTLINED_FUNCTION_9_0();
        __swift_project_value_buffer(v5, (uint64_t)&unk_25517A6C8);
        OUTLINED_FUNCTION_9_3();
        OUTLINED_FUNCTION_9_3();
        v6 = sub_21B36B29C();
        v7 = sub_21B36B71C();
        if (os_log_type_enabled(v6, v7))
        {
          v8 = (uint8_t *)OUTLINED_FUNCTION_3_3();
          v41 = OUTLINED_FUNCTION_3_3();
          *(_DWORD *)v8 = 136446210;
          *(_QWORD *)(v1 + 16) = v3;
          OUTLINED_FUNCTION_9_3();
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255145470);
          v9 = sub_21B36B47C();
          *(_QWORD *)(v1 + 24) = sub_21B196024(v9, v10, &v41);
          sub_21B36B818();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_2_26();
          _os_log_impl(&dword_21B15D000, v6, v7, "[AppResolutionFlow] App resolution resulted in an unhandled error of %{public}s", v8, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_3();
        }
      }
      OUTLINED_FUNCTION_2_26();

      sub_21B368E60();
      sub_21B1ED4C4((void *)v3, v4);
      return (*(uint64_t (**)(void))(v1 + 8))();
    }
    if (!(v3 | v4 ^ 0x80))
    {
      if (qword_2551411E0 != -1)
        swift_once();
      v29 = OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_20_1(v29, (uint64_t)&unk_25517A6C8);
      v30 = OUTLINED_FUNCTION_29_1();
      if (OUTLINED_FUNCTION_18_16(v30))
      {
        *(_WORD *)OUTLINED_FUNCTION_3_3() = 0;
        OUTLINED_FUNCTION_3_28(&dword_21B15D000, v31, v32, "[AppResolutionFlow] Starting app resolution.");
        OUTLINED_FUNCTION_3();
      }
      v33 = *(_QWORD *)(v1 + 64);

      v34 = (*(uint64_t (**)(void))(v33 + 16))();
      v35 = *(void **)(v2 + 48);
      *(_QWORD *)(v2 + 48) = 8;
      v36 = *(_BYTE *)(v2 + 56);
      *(_BYTE *)(v2 + 56) = 0x80;
      sub_21B1ED4C4(v35, v36);
      *(_QWORD *)(v1 + 48) = v34;
      sub_21B3638A4();
      v37 = sub_21B3686B0();
      MEMORY[0x2207623FC](MEMORY[0x24BE96288], v37);
      sub_21B368E18();
      swift_release();
      swift_release();
      return (*(uint64_t (**)(void))(v1 + 8))();
    }
    if (v4 == 128 && v3 == 8)
    {
      if (qword_2551411E0 != -1)
        swift_once();
      v19 = OUTLINED_FUNCTION_9_0();
      v0 = (void *)OUTLINED_FUNCTION_20_1(v19, (uint64_t)&unk_25517A6C8);
      v20 = sub_21B36B728();
      if (OUTLINED_FUNCTION_18_16(v20))
      {
        *(_WORD *)OUTLINED_FUNCTION_3_3() = 0;
        v23 = "[AppResolutionFlow] Execute called durning app resolution flow";
        goto LABEL_37;
      }
    }
    else
    {
      if (qword_2551411E0 != -1)
        swift_once();
      v38 = OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_20_1(v38, (uint64_t)&unk_25517A6C8);
      v39 = OUTLINED_FUNCTION_29_1();
      if (OUTLINED_FUNCTION_18_16(v39))
      {
        *(_WORD *)OUTLINED_FUNCTION_3_3() = 0;
        v23 = "[AppResolutionFlow] User cancelled app resolution.";
LABEL_37:
        OUTLINED_FUNCTION_3_28(&dword_21B15D000, v21, v22, v23);
        OUTLINED_FUNCTION_3();
      }
    }

    sub_21B368E60();
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  v11 = qword_2551411E0;
  swift_retain();
  if (v11 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20_1(v12, (uint64_t)&unk_25517A6C8);
  v13 = OUTLINED_FUNCTION_29_1();
  if (os_log_type_enabled(v11, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_21B15D000, v11, v13, "[AppResolutionFlow] App resolution completed successfully, pushing the main flow", v14, 2u);
    OUTLINED_FUNCTION_3();
  }
  v15 = *(_QWORD *)(v1 + 64);

  v40 = (uint64_t (*)(unint64_t))(**(int **)(v15 + 32) + *(_QWORD *)(v15 + 32));
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 88) = v16;
  *v16 = v1;
  v16[1] = sub_21B3637EC;
  return v40(v3);
}

uint64_t sub_21B3637EC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21B363848()
{
  uint64_t v0;
  void *v1;
  unsigned __int8 v2;

  v1 = *(void **)(v0 + 80);
  v2 = *(_BYTE *)(v0 + 104);
  sub_21B368E54();
  swift_release();
  sub_21B1ED4C4(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void (*sub_21B3638A4())(uint64_t)
{
  swift_retain();
  return sub_21B363BE4;
}

uint64_t sub_21B3638D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v5 = type metadata accessor for NotebookAppResolutionFlow(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  MEMORY[0x2207623FC](&unk_21B38D9B8, v5);
  return sub_21B368AC4();
}

void sub_21B363944(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;

  v3 = *v1;
  v4 = sub_21B368674();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x24BE960F0])
  {
    OUTLINED_FUNCTION_19_10(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 96));
    v11 = (void *)v1[6];
    v1[6] = *(_QWORD *)v7;
    v12 = *((_BYTE *)v1 + 56);
    *((_BYTE *)v1 + 56) = 0;
  }
  else if (v8 == *MEMORY[0x24BE960E8])
  {
    OUTLINED_FUNCTION_19_10(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 96));
    v13 = v7[8] | 0x40;
    v11 = (void *)v1[6];
    v1[6] = *(_QWORD *)v7;
    v12 = *((_BYTE *)v1 + 56);
    *((_BYTE *)v1 + 56) = v13;
  }
  else
  {
    if (v8 != *MEMORY[0x24BE960F8])
    {
      v14 = type metadata accessor for NotebookAppResolutionFlow.Errors(0, *(_QWORD *)(v3 + 80), v9, v10);
      MEMORY[0x2207623FC](&unk_21B38DA90, v14);
      v15 = swift_allocError();
      v16 = (void *)v1[6];
      v1[6] = v15;
      v17 = *((_BYTE *)v1 + 56);
      *((_BYTE *)v1 + 56) = 64;
      sub_21B1ED4C4(v16, v17);
      OUTLINED_FUNCTION_19_10(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
      return;
    }
    v11 = (void *)v1[6];
    v1[6] = 16;
    v12 = *((_BYTE *)v1 + 56);
    *((_BYTE *)v1 + 56) = 0x80;
  }
  sub_21B1ED4C4(v11, v12);
}

uint64_t sub_21B363AD0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_21B1ED4C4(*(void **)(v0 + 48), *(_BYTE *)(v0 + 56));
  return v0;
}

uint64_t sub_21B363B00()
{
  sub_21B363AD0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NotebookAppResolutionFlow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NotebookAppResolutionFlow);
}

uint64_t type metadata accessor for NotebookAppResolutionFlow.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NotebookAppResolutionFlow.State);
}

uint64_t sub_21B363B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21B3638D4(a1, a2, a3, a4);
}

uint64_t sub_21B363B58(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B1672D0;
  return sub_21B3631C8(a1);
}

uint64_t sub_21B363BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for NotebookAppResolutionFlow(0, *(_QWORD *)(a1 + 80), a3, a4);
  return sub_21B368AF4();
}

uint64_t type metadata accessor for NotebookAppResolutionFlow.Errors(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NotebookAppResolutionFlow.Errors);
}

uint64_t sub_21B363BE8(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21B363C28 + 4 * byte_21B38D910[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21B363C48 + 4 * byte_21B38D915[v4]))();
}

_BYTE *sub_21B363C28(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21B363C48(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21B363C50(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21B363C58(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21B363C60(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21B363C68(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_21B363C74()
{
  JUMPOUT(0x2207623FCLL);
}

ValueMetadata *_s14descr24DE73E09V25NeedsConfirmationStrategyVMa()
{
  return &_s14descr24DE73E09V25NeedsConfirmationStrategyVN;
}

uint64_t sub_21B363C94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(_QWORD *__return_ptr, char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[9];

  v15 = a1;
  v17 = a2;
  v16 = sub_21B369490();
  v3 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OUTLINED_FUNCTION_24_2();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(_QWORD *__return_ptr, char *, uint64_t, uint64_t))(v2 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255143788);
  sub_21B3692D4();
  v11 = sub_21B3690DC();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_21B36940C();
  v10(v18, v5, v11, v13);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  OUTLINED_FUNCTION_34_1();
  sub_21B16FD80(v18);
  return sub_21B163F9C((uint64_t)v18, &qword_255142188);
}

uint64_t sub_21B363DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[61] = a3;
  v4[62] = v3;
  v4[59] = a1;
  v4[60] = a2;
  v5 = sub_21B369424();
  v4[63] = v5;
  v4[64] = *(_QWORD *)(v5 - 8);
  v4[65] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551425A8);
  v4[66] = OUTLINED_FUNCTION_23_1();
  v6 = sub_21B369490();
  v4[67] = v6;
  v4[68] = *(_QWORD *)(v6 - 8);
  v4[69] = OUTLINED_FUNCTION_23_1();
  v7 = OUTLINED_FUNCTION_24_2();
  v4[70] = v7;
  v4[71] = *(_QWORD *)(v7 - 8);
  v4[72] = OUTLINED_FUNCTION_4_6();
  v4[73] = OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B363E7C()
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
  void (*v9)(uint64_t, uint64_t);
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  _OWORD *v27;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68[2];

  v66 = v0 + 16;
  v1 = *(_QWORD *)(v0 + 584);
  v2 = *(_QWORD *)(v0 + 568);
  v3 = *(_QWORD *)(v0 + 560);
  v4 = *(_QWORD *)(v0 + 552);
  v62 = *(_QWORD *)(v0 + 544);
  v63 = *(_QWORD *)(v0 + 536);
  v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 496) + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255143788);
  sub_21B3692D4();
  v5 = sub_21B3690DC();
  v7 = v6;
  v8 = v3;
  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v1, v8);
  sub_21B36940C();
  v61(v4, v5, v7);
  v10 = (unsigned __int8 *)(v0 + 88);
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v4, v63);
  swift_bridgeObjectRelease();
  sub_21B163F58(v0 + 16, v0 + 88, &qword_255142188);
  v11 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 592) = v11;
  if (v11 == 2)
  {
    sub_21B176D64(v10);
    goto LABEL_5;
  }
  if (v11 == 3)
  {
    sub_21B163F9C((uint64_t)v10, &qword_255142188);
LABEL_5:
    if (qword_2551411E0 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_9_0();
    __swift_project_value_buffer(v12, (uint64_t)&unk_25517A6C8);
    OUTLINED_FUNCTION_8_6();
    v13 = sub_21B36B29C();
    v14 = sub_21B36B71C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = *(_QWORD *)(v0 + 520);
      v64 = *(_QWORD *)(v0 + 512);
      v65 = *(_QWORD *)(v0 + 504);
      v16 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v68[0] = OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v16 = 136315138;
      sub_21B36940C();
      v17 = sub_21B36B47C();
      *(_QWORD *)(v0 + 432) = sub_21B196024(v17, v18, v68);
      sub_21B36B818();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v15, v65);
      OUTLINED_FUNCTION_17_1(&dword_21B15D000, v13, v14, "[SFNI NeedsConfirmation] Did not get ConfirmationTask from parse: %s", v16);
      OUTLINED_FUNCTION_27_1();
      OUTLINED_FUNCTION_3();
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 512) + 8))(*(_QWORD *)(v0 + 520), *(_QWORD *)(v0 + 504));

    sub_21B1644F8();
    OUTLINED_FUNCTION_26_2();
    *v27 = 0u;
    v27[1] = 0u;
    OUTLINED_FUNCTION_19_7((uint64_t)v27, 4);
    v26 = v0 + 16;
    goto LABEL_12;
  }
  v19 = *(_QWORD *)(v0 + 576);
  v20 = *(_QWORD *)(v0 + 560);
  sub_21B170020(v0 + 96, v0 + 160);
  sub_21B3692D4();
  v21 = sub_21B3690DC();
  v23 = v22;
  v9(v19, v20);
  swift_bridgeObjectRetain();
  v24 = sub_21B1B9B8C();
  if (v24 == 10)
  {
    sub_21B1644F8();
    OUTLINED_FUNCTION_26_2();
    *v25 = v21;
    v25[1] = v23;
    v25[2] = 0;
    v25[3] = 0;
    OUTLINED_FUNCTION_19_7((uint64_t)v25, 1);
    sub_21B163F9C(v0 + 160, &qword_255142190);
    v26 = v0 + 16;
LABEL_12:
    sub_21B163F9C(v26, &qword_255142188);
    OUTLINED_FUNCTION_19_29();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    return OUTLINED_FUNCTION_3_8(*(uint64_t (**)(void))(v0 + 8));
  }
  v29 = v24;
  v30 = v11 & 1;
  swift_bridgeObjectRelease();
  v31 = (void *)sub_21B3692BC();
  if (v30)
  {
    sub_21B1A6B70(v29);
    v37 = v35;

    v34 = v0 + 160;
  }
  else
  {
    v32 = (void *)sub_21B3692C8();
    v33 = objc_msgSend(v32, sel_itemToConfirm);

    sub_21B36B884();
    swift_unknownObjectRelease();
    sub_21B1A70A8(v29);
    v34 = v0 + 160;
    v37 = v36;
    __swift_destroy_boxed_opaque_existential_1(v0 + 328);

  }
  *(_QWORD *)(v0 + 456) = v37;
  if (qword_2551411E0 != -1)
    swift_once();
  v38 = OUTLINED_FUNCTION_9_0();
  *(_QWORD *)(v0 + 600) = __swift_project_value_buffer(v38, (uint64_t)&unk_25517A6C8);
  v39 = sub_21B36B29C();
  v40 = sub_21B36B734();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = OUTLINED_FUNCTION_3_3();
    v68[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v41 = 136315394;
    *(_BYTE *)(v0 + 81) = v30;
    v42 = sub_21B36B47C();
    *(_QWORD *)(v0 + 448) = sub_21B196024(v42, v43, v68);
    sub_21B36B818();
    OUTLINED_FUNCTION_34_1();
    *(_WORD *)(v41 + 12) = 2080;
    OUTLINED_FUNCTION_16_4();
    v44 = *(id *)(v0 + 456);
    v45 = objc_msgSend(v44, sel_description);
    v46 = sub_21B36B440();
    v48 = v47;

    *(_QWORD *)(v0 + 464) = sub_21B196024(v46, v48, v68);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21B15D000, v39, v40, "[SFNI NeedsConfirmation] Parsed response as %s. Updated intent: %s", (uint8_t *)v41, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  sub_21B163F58(v34, v0 + 224, &qword_255142190);
  v49 = *(unsigned __int8 *)(v0 + 280);
  if (v49 == 3)
  {
    sub_21B171D88((__int128 *)(v0 + 224), v0 + 288);
    v50 = *(_QWORD *)(v0 + 312);
    v51 = *(_QWORD *)(v0 + 320);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 288), v50);
    v67 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v51 + 40) + *(_QWORD *)(v51 + 40));
    v52 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 608) = v52;
    *v52 = v0;
    v52[1] = sub_21B364688;
    return v67(1, v50, v51);
  }
  else
  {
    if (v49 == 255)
      sub_21B163F9C(v0 + 224, &qword_255142190);
    else
      sub_21B1700E0(v0 + 224);
    v53 = *(_QWORD *)(v0 + 592);
    v54 = *(_QWORD *)(v0 + 528);
    v55 = v0;
    v56 = sub_21B3690F4();
    v57 = (unsigned int *)MEMORY[0x24BE98400];
    if ((v53 & 1) != 0)
      v57 = (unsigned int *)MEMORY[0x24BE983F8];
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v56 - 8) + 104))(v54, *v57, v56);
    __swift_storeEnumTagSinglePayload(v54, 0, 1, v56);
    OUTLINED_FUNCTION_16_4();
    v58 = *(void **)(v0 + 456);
    sub_21B361550();
    v59 = v58;
    v60 = sub_21B369214();
    OUTLINED_FUNCTION_27(v60, &qword_255142190);
    sub_21B163F9C(v66, &qword_255142188);

    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_52();
    OUTLINED_FUNCTION_33_1();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_3_8(*(uint64_t (**)(void))(v55 + 8));
  }
}

uint64_t sub_21B364688(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 616) = a1;
  *(_QWORD *)(v3 + 624) = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B3646EC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  void *v19;
  id v20;
  uint64_t v22;

  v1 = *(void **)(v0 + 616);
  swift_beginAccess();
  v2 = *(id *)(v0 + 456);
  v3 = sub_21B1A736C(v1);

  v4 = *(void **)(v0 + 456);
  *(_QWORD *)(v0 + 456) = v3;

  v5 = v3;
  v6 = sub_21B36B29C();
  v7 = sub_21B36B734();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v22 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v8 = 136315138;
    v9 = v5;
    v10 = objc_msgSend(v9, sel_description);
    v11 = sub_21B36B440();
    v13 = v12;

    *(_QWORD *)(v0 + 440) = sub_21B196024(v11, v13, &v22);
    sub_21B36B818();
    OUTLINED_FUNCTION_34_1();

    OUTLINED_FUNCTION_17_1(&dword_21B15D000, v6, v7, "[SFNI NeedsConfirmation] Merged intent from secondary task: %s", v8);
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_3();
  }
  v14 = *(void **)(v0 + 616);

  __swift_destroy_boxed_opaque_existential_1(v0 + 288);
  v15 = *(_QWORD *)(v0 + 592);
  v16 = *(_QWORD *)(v0 + 528);
  v17 = sub_21B3690F4();
  v18 = (unsigned int *)MEMORY[0x24BE98400];
  if ((v15 & 1) != 0)
    v18 = (unsigned int *)MEMORY[0x24BE983F8];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v16, *v18, v17);
  __swift_storeEnumTagSinglePayload(v16, 0, 1, v17);
  OUTLINED_FUNCTION_16_4();
  v19 = *(void **)(v0 + 456);
  sub_21B361550();
  v20 = v19;
  sub_21B369214();
  sub_21B163F9C(v0 + 160, &qword_255142190);
  sub_21B163F9C(v0 + 16, &qword_255142188);

  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_33_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_52();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21B3649B8()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_110_2();
  sub_21B163F9C(v0 + 160, &qword_255142190);
  sub_21B163F9C(v0 + 16, &qword_255142188);
  __swift_destroy_boxed_opaque_existential_1(v0 + 288);

  OUTLINED_FUNCTION_19_29();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_31_12();
  return v1(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_21B364A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[10] = a3;
  v4[11] = v3;
  v4[8] = a1;
  v4[9] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255142588);
  v4[12] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0A0);
  v4[13] = OUTLINED_FUNCTION_23_1();
  v5 = sub_21B368C44();
  v4[14] = v5;
  v4[15] = *(_QWORD *)(v5 - 8);
  v4[16] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551420E8);
  v4[17] = OUTLINED_FUNCTION_23_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0B0);
  v4[18] = OUTLINED_FUNCTION_4_6();
  v4[19] = OUTLINED_FUNCTION_1_5();
  v6 = sub_21B368F44();
  v4[20] = v6;
  v4[21] = *(_QWORD *)(v6 - 8);
  v4[22] = OUTLINED_FUNCTION_23_1();
  v7 = OUTLINED_FUNCTION_24_2();
  v4[23] = v7;
  v4[24] = *(_QWORD *)(v7 - 8);
  v4[25] = OUTLINED_FUNCTION_4_6();
  v4[26] = OUTLINED_FUNCTION_1_5();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255143788);
  v4[27] = v8;
  v4[28] = *(_QWORD *)(v8 - 8);
  v4[29] = OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_7_0();
}

uint64_t sub_21B364B48()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t *v16;
  char v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (qword_2551411E0 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_9_0();
  __swift_project_value_buffer(v1, (uint64_t)&unk_25517A6C8);
  OUTLINED_FUNCTION_8_6();
  v2 = sub_21B36B29C();
  v3 = sub_21B36B734();
  if (os_log_type_enabled(v2, v3))
  {
    v24 = *(_QWORD *)(v0 + 224);
    v4 = *(_QWORD *)(v0 + 208);
    v22 = *(_QWORD *)(v0 + 192);
    v23 = *(_QWORD *)(v0 + 184);
    v5 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v25 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v5 = 136315138;
    sub_21B3692D4();
    v6 = sub_21B3690DC();
    v8 = v7;
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v4, v23);
    *(_QWORD *)(v0 + 56) = sub_21B196024(v6, v8, &v25);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_18_6(*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
    OUTLINED_FUNCTION_17_1(&dword_21B15D000, v2, v3, "[SFNI NeedsConfirmation] making prompt for confirming %s", v5);
    OUTLINED_FUNCTION_27_1();
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_18_6(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 224) + 8));

  v10 = *(_QWORD *)(v0 + 192);
  v9 = *(_QWORD *)(v0 + 200);
  v11 = *(_QWORD *)(v0 + 184);
  sub_21B3692D4();
  v12 = sub_21B3690DC();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  swift_bridgeObjectRetain();
  v15 = sub_21B1B9B8C();
  if (v15 == 10)
  {
    sub_21B1644F8();
    OUTLINED_FUNCTION_26_2();
    *v16 = v12;
    v16[1] = v14;
    v16[2] = 0;
    v16[3] = 0;
    OUTLINED_FUNCTION_19_7((uint64_t)v16, 1);
    OUTLINED_FUNCTION_24_4();
    swift_task_dealloc();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_35();
    swift_task_dealloc();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_3_8(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v18 = v15;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 40) = &type metadata for SearchForNotebookItems.Parameter;
    *(_QWORD *)(v0 + 48) = &off_24DE5FB50;
    *(_BYTE *)(v0 + 16) = v18;
    sub_21B19C714((_QWORD *)(v0 + 16));
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    v19 = (void *)sub_21B3692C8();
    objc_msgSend(v19, sel_confirmationReason);

    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v20;
    *v20 = v0;
    v20[1] = sub_21B364E70;
    v21 = OUTLINED_FUNCTION_43_5(*(_QWORD *)(v0 + 72));
    return sub_21B365168(v21, v18);
  }
}

uint64_t sub_21B364E70(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v6 = *v2;
  v4 = v6;
  OUTLINED_FUNCTION_18_2(&v6);
  *(_QWORD *)(v4 + 248) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 256) = a1;
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B364EDC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v1 = v0[21];
  v2 = v0[22];
  v4 = v0[19];
  v3 = v0[20];
  v6 = v0[17];
  v5 = (_WORD *)v0[18];
  v7 = v0[13];
  v16 = v0[12];
  v17 = (void *)v0[32];
  type metadata accessor for Snippet();
  OUTLINED_FUNCTION_2_25(v4, 1);
  *v5 = 1541;
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_2_25((uint64_t)v5, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v6, v2, v3);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v3);
  sub_21B368C2C();
  v8 = sub_21B36AC78();
  OUTLINED_FUNCTION_15_11(v7, 1, v9, v8);
  v10 = sub_21B368CBC();
  OUTLINED_FUNCTION_15_11(v16, 1, v11, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25514D0C0);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_21B36D370;
  *(_QWORD *)(v12 + 32) = v17;
  v18 = v12;
  sub_21B36B5C0();
  v0[33] = v18;
  v13 = v17;
  v14 = (_QWORD *)swift_task_alloc();
  v0[34] = (uint64_t)v14;
  *v14 = v0;
  v14[1] = sub_21B36508C;
  return sub_21B34FF90(v0[8], v0[19], v0[18], v18, 0, 0, v0[17], v0[16]);
}

uint64_t sub_21B36508C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 144);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 152);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_21B163F9C(v5, &qword_255142588);
  sub_21B163F9C(v4, (uint64_t *)&unk_25514D0A0);
  v6 = OUTLINED_FUNCTION_18_6(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_27(v6, &qword_2551420E8);
  sub_21B163F9C(v2, &qword_25514D0B0);
  sub_21B163F9C(v1, &qword_25514D0B0);
  OUTLINED_FUNCTION_17();
  return swift_task_switch();
}

uint64_t sub_21B365168(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 296) = a2;
  *(_QWORD *)(v3 + 88) = a1;
  *(_QWORD *)(v3 + 96) = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0D0);
  *(_QWORD *)(v3 + 104) = swift_task_alloc();
  *(_QWORD *)(v3 + 112) = swift_task_alloc();
  *(_QWORD *)(v3 + 120) = swift_task_alloc();
  *(_QWORD *)(v3 + 128) = swift_task_alloc();
  *(_QWORD *)(v3 + 136) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B3651FC()
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

  OUTLINED_FUNCTION_110_2();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_21B365230 + 4 * byte_21B38DAD0[*(unsigned __int8 *)(v0 + 296)]))(v1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_21B365230()
{
  uint64_t v0;
  _OWORD *v1;

  sub_21B1644F8();
  OUTLINED_FUNCTION_26_2();
  *v1 = 0u;
  v1[1] = 0u;
  OUTLINED_FUNCTION_19_7((uint64_t)v1, 4);
  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B365278()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = (_QWORD *)OUTLINED_FUNCTION_26_34();
  sub_21B1F8368(v2);
  if (v0)
    JUMPOUT(0x21B365258);
  sub_21B2FA9E8(v3, *(_QWORD *)(v1 + 136));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 144) = v4;
  *v4 = v1;
  v4[1] = sub_21B365560;
  OUTLINED_FUNCTION_43_5(*(_QWORD *)(v1 + 136));
  OUTLINED_FUNCTION_31_12();
  return sub_21B20C77C(v5);
}

uint64_t sub_21B3652D0()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v2 = (_QWORD *)OUTLINED_FUNCTION_26_34();
  v1[20] = sub_21B1F8014(v2);
  if (v0)
    JUMPOUT(0x21B365258);
  v3 = v1[16];
  sub_21B36B740();
  v4 = sub_21B36AF60();
  OUTLINED_FUNCTION_15_11(v3, 0, v5, v4);
  v6 = (_QWORD *)swift_task_alloc();
  v1[21] = (uint64_t)v6;
  *v6 = v1;
  v6[1] = sub_21B3655D0;
  OUTLINED_FUNCTION_43_5(v1[16]);
  OUTLINED_FUNCTION_31_12();
  return sub_21B20CA14(v7);
}

uint64_t sub_21B365350()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v2 = (_QWORD *)OUTLINED_FUNCTION_26_34();
  sub_21B1F828C(v2);
  if (v0)
    JUMPOUT(0x21B365258);
  v3 = *(_QWORD *)(v1 + 120);
  sub_21B36B4AC();
  swift_bridgeObjectRelease();
  v4 = sub_21B36AF60();
  OUTLINED_FUNCTION_15_11(v3, 0, v5, v4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 184) = v6;
  *v6 = v1;
  v6[1] = sub_21B365688;
  OUTLINED_FUNCTION_43_5(*(_QWORD *)(v1 + 120));
  OUTLINED_FUNCTION_31_12();
  return sub_21B20C4EC(v7);
}

uint64_t sub_21B3653D0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = (_QWORD *)OUTLINED_FUNCTION_26_34();
  sub_21B1F8260(v2);
  if (v0)
    JUMPOUT(0x21B365258);
  sub_21B1D60C8(v3, *(_QWORD *)(v1 + 112));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 200) = v4;
  *v4 = v1;
  v4[1] = sub_21B3656FC;
  OUTLINED_FUNCTION_43_5(*(_QWORD *)(v1 + 112));
  OUTLINED_FUNCTION_31_12();
  return sub_21B20C920(v5);
}

uint64_t sub_21B365428()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;

  v2 = (_QWORD *)OUTLINED_FUNCTION_26_34();
  v3 = sub_21B1F822C(v2);
  v1[27] = v3;
  if (v0)
    JUMPOUT(0x21B365258);
  v4 = (void *)v3;
  sub_21B36AEC4();
  v5 = v4;
  v1[28] = sub_21B16747C(v4);
  v6 = (_QWORD *)swift_task_alloc();
  v1[29] = v6;
  *v6 = v1;
  v6[1] = sub_21B365770;
  OUTLINED_FUNCTION_31_12();
  return sub_21B20C878(v7);
}

uint64_t sub_21B3654A4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = (_QWORD *)OUTLINED_FUNCTION_26_34();
  v1[31] = sub_21B1F807C(v2);
  if (v0)
    JUMPOUT(0x21B365258);
  sub_21B327D7C();
  v1[32] = v3;
  v4 = (_QWORD *)swift_task_alloc();
  v1[33] = v4;
  *v4 = v1;
  v4[1] = sub_21B365818;
  OUTLINED_FUNCTION_31_12();
  return sub_21B20C6D4(v5);
}

uint64_t sub_21B36550C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = (_QWORD *)OUTLINED_FUNCTION_26_34();
  sub_21B1F81D4(v2);
  if (v0)
    JUMPOUT(0x21B365258);
  sub_21B2F9078(v3, *(_QWORD *)(v1 + 104));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 280) = v4;
  *v4 = v1;
  v4[1] = sub_21B3658C0;
  OUTLINED_FUNCTION_43_5(*(_QWORD *)(v1 + 104));
  OUTLINED_FUNCTION_31_12();
  return sub_21B20C5E0(v5);
}

uint64_t sub_21B365560()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_16_43();
  OUTLINED_FUNCTION_18_2(v2);
  *(_QWORD *)(v1 + 152) = v0;
  v3 = swift_task_dealloc();
  OUTLINED_FUNCTION_39_19(v3, (uint64_t *)&unk_25514D0D0);
  if (v0)
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_4_70();
  }
  else
  {
    OUTLINED_FUNCTION_15_46();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    v5 = OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_1_68(v5, v6);
  }
}

uint64_t sub_21B3655D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v4 = v3[16];
  v3[22] = v1;
  swift_task_dealloc();
  sub_21B163F9C(v4, (uint64_t *)&unk_25514D0D0);
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_1_6();
}

uint64_t sub_21B365644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_110_2();

  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  v1 = OUTLINED_FUNCTION_21_16();
  return OUTLINED_FUNCTION_1_68(v1, v2);
}

uint64_t sub_21B365688()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_16_43();
  OUTLINED_FUNCTION_18_2(v2);
  *(_QWORD *)(v1 + 192) = v0;
  v3 = swift_task_dealloc();
  OUTLINED_FUNCTION_39_19(v3, (uint64_t *)&unk_25514D0D0);
  if (v0)
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_4_70();
  }
  else
  {
    OUTLINED_FUNCTION_15_46();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    v5 = OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_1_68(v5, v6);
  }
}

uint64_t sub_21B3656FC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_16_43();
  OUTLINED_FUNCTION_18_2(v2);
  *(_QWORD *)(v1 + 208) = v0;
  v3 = swift_task_dealloc();
  OUTLINED_FUNCTION_39_19(v3, (uint64_t *)&unk_25514D0D0);
  if (v0)
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_4_70();
  }
  else
  {
    OUTLINED_FUNCTION_15_46();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    v5 = OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_1_68(v5, v6);
  }
}

uint64_t sub_21B365770(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;

  v3 = (_QWORD *)*v2;
  v5 = v3;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = v1;
  OUTLINED_FUNCTION_18_2(&v5);
  v3[30] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_1_6();
}

uint64_t sub_21B3657D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_110_2();

  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  v1 = OUTLINED_FUNCTION_21_16();
  return OUTLINED_FUNCTION_1_68(v1, v2);
}

uint64_t sub_21B365818(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;

  v3 = (_QWORD *)*v2;
  v5 = v3;
  v3[8] = v2;
  v3[9] = a1;
  v3[10] = v1;
  OUTLINED_FUNCTION_18_2(&v5);
  v3[34] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_17();
  return OUTLINED_FUNCTION_1_6();
}

uint64_t sub_21B36587C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_110_2();

  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  v1 = OUTLINED_FUNCTION_21_16();
  return OUTLINED_FUNCTION_1_68(v1, v2);
}

uint64_t sub_21B3658C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_16_43();
  OUTLINED_FUNCTION_18_2(v2);
  *(_QWORD *)(v1 + 288) = v0;
  v3 = swift_task_dealloc();
  OUTLINED_FUNCTION_39_19(v3, (uint64_t *)&unk_25514D0D0);
  if (v0)
  {
    OUTLINED_FUNCTION_17();
    return OUTLINED_FUNCTION_4_70();
  }
  else
  {
    OUTLINED_FUNCTION_15_46();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_33_1();
    v5 = OUTLINED_FUNCTION_24();
    return OUTLINED_FUNCTION_1_68(v5, v6);
  }
}

uint64_t sub_21B365934()
{
  uint64_t v0;

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B365970()
{
  uint64_t v0;

  OUTLINED_FUNCTION_110_2();

  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B3659B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B3659F0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B365A2C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_110_2();

  swift_release();
  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B365A78()
{
  uint64_t v0;

  OUTLINED_FUNCTION_110_2();

  swift_release();
  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B365AC4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_110_2();
  OUTLINED_FUNCTION_2_69();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_33_1();
  return OUTLINED_FUNCTION_16_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B365B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21B16C55C;
  return sub_21B363DDC(a1, a2, a3);
}

uint64_t sub_21B365B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21B16C55C;
  return sub_21B364A38(a1, a2, a3);
}

uint64_t sub_21B365BD4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21B1672D0;
  return sub_21B3686F8();
}

unint64_t sub_21B365C54()
{
  unint64_t result;

  result = qword_2551525A0[0];
  if (!qword_2551525A0[0])
  {
    result = MEMORY[0x2207623FC](&unk_21B38DAFC, &_s14descr24DE73E09V25NeedsConfirmationStrategyVN);
    atomic_store(result, qword_2551525A0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_68(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_2_69()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_70()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_15_46()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_16_43()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_26_34()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t sub_21B365CF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 == 2 || a1 == 1)
  {
    sub_21B36B4AC();
    v4 = OUTLINED_FUNCTION_29();
    v5 = a2;
    v6 = 0;
    return __swift_storeEnumTagSinglePayload(v5, v6, 1, v4);
  }
  if (!a1)
  {
    v4 = OUTLINED_FUNCTION_29();
    v5 = a2;
    v6 = 1;
    return __swift_storeEnumTagSinglePayload(v5, v6, 1, v4);
  }
  if (qword_2551411E0 != -1)
    swift_once();
  v8 = sub_21B36B2B4();
  __swift_project_value_buffer(v8, (uint64_t)&unk_25517A6C8);
  v9 = sub_21B36B29C();
  v10 = sub_21B36B71C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v15 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v11 = 136446210;
    v12 = INSpatialEvent.description.getter(a1);
    sub_21B196024(v12, v13, &v15);
    sub_21B36B818();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21B15D000, v9, v10, "[INSpatialEvent catEnumValue] Got unknown value: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  v14 = OUTLINED_FUNCTION_29();
  return __swift_storeEnumTagSinglePayload(a2, 1, 1, v14);
}

uint64_t sub_21B365EF0(uint64_t a1)
{
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
  int v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_255145250);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21B36976C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v19 - v10;
  sub_21B366294(a1, (uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    OUTLINED_FUNCTION_1_69();
    sub_21B3662DC((uint64_t)v4);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v9, v5);
  if (v13 == *MEMORY[0x24BE9EDC8])
    goto LABEL_7;
  if (v13 != *MEMORY[0x24BE9EDD0])
  {
    if (v13 == *MEMORY[0x24BE9EDD8])
    {
LABEL_7:
      OUTLINED_FUNCTION_1_69();
      OUTLINED_FUNCTION_2_70();
      return 1;
    }
    if (v13 != *MEMORY[0x24BE9EDE0])
    {
      if (qword_2551411E0 != -1)
        swift_once();
      v14 = sub_21B36B2B4();
      __swift_project_value_buffer(v14, (uint64_t)&unk_25517A6C8);
      v15 = sub_21B36B29C();
      v16 = sub_21B36B71C();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)OUTLINED_FUNCTION_3_3();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_21B15D000, v15, v16, "[INSpatialEvent] Got unknown eventTriggerAttribute value", v17, 2u);
        OUTLINED_FUNCTION_3();
      }

      OUTLINED_FUNCTION_1_69();
      v18 = *(void (**)(char *, uint64_t))(v6 + 8);
      v18(v11, v5);
      v18(v9, v5);
      return 0;
    }
  }
  OUTLINED_FUNCTION_1_69();
  OUTLINED_FUNCTION_2_70();
  return 2;
}

uint64_t sub_21B366160(char a1)
{
  if (a1 == 4)
    return 0;
  else
    return qword_21B38DBE8[a1];
}

uint64_t INSpatialEvent.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 0x6E776F6E6B6E752ELL;
    case 2:
      return 0x7472617065642ELL;
    case 1:
      return 0x6576697272612ELL;
  }
  sub_21B36B974();
  swift_bridgeObjectRelease();
  sub_21B36BCA4();
  sub_21B36B4F4();
  swift_bridgeObjectRelease();
  sub_21B36B4F4();
  return 0xD000000000000014;
}

uint64_t sub_21B36628C()
{
  uint64_t *v0;

  return INSpatialEvent.description.getter(*v0);
}

uint64_t sub_21B366294(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_255145250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21B3662DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_255145250);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_69()
{
  uint64_t v0;

  return sub_21B3662DC(v0);
}

uint64_t OUTLINED_FUNCTION_2_70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

ValueMetadata *type metadata accessor for LocationGuardPromptWrapperStrategy()
{
  return &type metadata for LocationGuardPromptWrapperStrategy;
}

uint64_t sub_21B366344(uint64_t a1, void (*a2)(_QWORD *__return_ptr, char *, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  _QWORD v16[7];
  unsigned __int8 v17;

  v3 = sub_21B368908();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21B369490();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21B36940C();
  a2(v16, v10, 0);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v17 == 255)
  {
    sub_21B19C018((uint64_t)v16);
    return 0;
  }
  sub_21B3382A8();
  v12 = v11;
  v13 = v11;
  sub_21B1700E0((uint64_t)v16);
  if (v13 == 2)
    return 0;
  sub_21B311E64(v12);
  v14 = sub_21B3688CC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v14;
}

uint64_t sub_21B366494(uint64_t a1)
{
  void (**v1)(_QWORD *__return_ptr, char *, _QWORD);

  return sub_21B366344(a1, *v1);
}

void sub_21B36649C()
{
  qword_255152600 = 0xD000000000000028;
  *(_QWORD *)algn_255152608 = 0x800000021B390F60;
  qword_255152610 = 0x656761507478656ELL;
  unk_255152618 = 0xE800000000000000;
}

uint64_t static NextPageInvocation.identifier.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_255141598 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_255152608;
  v3 = qword_255152610;
  v4 = unk_255152618;
  *a1 = qword_255152600;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t static NextPageInvocation.== infix(_:_:)()
{
  return 1;
}

uint64_t sub_21B36654C()
{
  sub_21B366660();
  return sub_21B36BDDC();
}

uint64_t sub_21B366574()
{
  sub_21B366660();
  return sub_21B36BDE8();
}

uint64_t NextPageInvocation.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255152620);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21B366660();
  sub_21B36BDD0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_21B366660()
{
  unint64_t result;

  result = qword_255152628;
  if (!qword_255152628)
  {
    result = MEMORY[0x2207623FC](&unk_21B38DD60, &type metadata for NextPageInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255152628);
  }
  return result;
}

uint64_t NextPageInvocation.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

unint64_t sub_21B3666C4(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_21B3666F8();
  a1[2] = sub_21B366734();
  result = sub_21B366770();
  a1[3] = result;
  return result;
}

unint64_t sub_21B3666F8()
{
  unint64_t result;

  result = qword_255152630;
  if (!qword_255152630)
  {
    result = MEMORY[0x2207623FC](&protocol conformance descriptor for NextPageInvocation, &type metadata for NextPageInvocation);
    atomic_store(result, (unint64_t *)&qword_255152630);
  }
  return result;
}

unint64_t sub_21B366734()
{
  unint64_t result;

  result = qword_255152638;
  if (!qword_255152638)
  {
    result = MEMORY[0x2207623FC](&protocol conformance descriptor for NextPageInvocation, &type metadata for NextPageInvocation);
    atomic_store(result, (unint64_t *)&qword_255152638);
  }
  return result;
}

unint64_t sub_21B366770()
{
  unint64_t result;

  result = qword_255152640;
  if (!qword_255152640)
  {
    result = MEMORY[0x2207623FC](&protocol conformance descriptor for NextPageInvocation, &type metadata for NextPageInvocation);
    atomic_store(result, (unint64_t *)&qword_255152640);
  }
  return result;
}

uint64_t sub_21B3667AC(uint64_t a1)
{
  return NextPageInvocation.init(from:)(a1);
}

uint64_t sub_21B3667C0(_QWORD *a1)
{
  return NextPageInvocation.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for NextPageInvocation()
{
  return &type metadata for NextPageInvocation;
}

ValueMetadata *type metadata accessor for NextPageInvocation.CodingKeys()
{
  return &type metadata for NextPageInvocation.CodingKeys;
}

unint64_t sub_21B3667F8()
{
  unint64_t result;

  result = qword_255152648;
  if (!qword_255152648)
  {
    result = MEMORY[0x2207623FC](&unk_21B38DD10, &type metadata for NextPageInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255152648);
  }
  return result;
}

unint64_t sub_21B366838()
{
  unint64_t result;

  result = qword_255152650;
  if (!qword_255152650)
  {
    result = MEMORY[0x2207623FC](&unk_21B38DD38, &type metadata for NextPageInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255152650);
  }
  return result;
}

uint64_t type metadata accessor for SnoozeTasksCATs()
{
  uint64_t result;

  result = qword_255152658;
  if (!qword_255152658)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21B3668AC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21B3668E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_21B366904()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v2 = swift_allocObject();
  v0[5] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_21B36D150;
  *(_QWORD *)(v2 + 32) = 0x736D657469;
  *(_QWORD *)(v2 + 40) = 0xE500000000000000;
  *(_QWORD *)(v2 + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_255141D00);
  *(_QWORD *)(v2 + 48) = v1;
  v5 = (uint64_t (*)(void))((int)*MEMORY[0x24BE92870] + MEMORY[0x24BE92870]);
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[6] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_21B3669E8;
  return OUTLINED_FUNCTION_3_20(v0[2], 0xD00000000000001DLL, 0x800000021B391240, v2, v5);
}

uint64_t sub_21B3669E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return OUTLINED_FUNCTION_1_6();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_2_8(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_21B366A4C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v3 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B1B4A14;
  return OUTLINED_FUNCTION_3_20(a1, 0xD000000000000024, 0x800000021B395B10, MEMORY[0x24BEE4AF8], v5);
}

uint64_t sub_21B366ABC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v3 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B1B4118;
  return OUTLINED_FUNCTION_3_20(a1, 0xD00000000000001ALL, 0x800000021B395AF0, MEMORY[0x24BEE4AF8], v5);
}

uint64_t sub_21B366B2C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v3 = (_QWORD *)OUTLINED_FUNCTION_7_17();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21B1B4A14;
  return OUTLINED_FUNCTION_3_20(a1, 0xD000000000000026, 0x800000021B395AC0, MEMORY[0x24BEE4AF8], v5);
}

uint64_t sub_21B366B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25514D0D0);
  v4[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21B366BFC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int EnumTagSinglePayload;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(_QWORD, unint64_t, unint64_t, uint64_t);

  v1 = v0[6];
  v2 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141CF8);
  v3 = swift_allocObject();
  v0[7] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_21B3705A0;
  v4 = (uint64_t *)(v3 + 48);
  *(_QWORD *)(v3 + 32) = 0xD000000000000010;
  *(_QWORD *)(v3 + 40) = 0x800000021B3913B0;
  sub_21B163F58(v2, v1, (uint64_t *)&unk_25514D0D0);
  v5 = sub_21B36AF60();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v5);
  v7 = v0[6];
  if (EnumTagSinglePayload == 1)
  {
    sub_21B163F9C(v0[6], (uint64_t *)&unk_25514D0D0);
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
  }
  else
  {
    *(_QWORD *)(v3 + 72) = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v4);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(boxed_opaque_existential_0, v7, v5);
  }
  v9 = v0[4];
  *(_QWORD *)(v3 + 80) = 7368801;
  *(_QWORD *)(v3 + 88) = 0xE300000000000000;
  v10 = 0;
  if (v9)
  {
    v10 = sub_21B36AF3C();
  }
  else
  {
    *(_QWORD *)(v3 + 104) = 0;
    *(_QWORD *)(v3 + 112) = 0;
  }
  *(_QWORD *)(v3 + 96) = v9;
  *(_QWORD *)(v3 + 120) = v10;
  v13 = (uint64_t (*)(_QWORD, unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92870]
                                                                                    + MEMORY[0x24BE92870]);
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  v0[8] = v11;
  *v11 = v0;
  v11[1] = sub_21B366D94;
  return v13(v0[2], 0xD000000000000028, 0x800000021B395A90, v3);
}

uint64_t sub_21B366D94()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return OUTLINED_FUNCTION_1_6();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_8(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_21B366E04()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21B366E38()
{
  return type metadata accessor for SnoozeTasksCATs();
}

void sub_21B366E40(uint64_t a1@<X8>)
{
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, _QWORD, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  void (*v108)(uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t, uint64_t);
  char v114;
  void (*v115)(uint64_t, uint64_t);
  uint64_t v116;
  void (*v117)(uint64_t, uint64_t, uint64_t);
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
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
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;

  v213 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D20);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_2();
  v212 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D28);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3_2();
  v220 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D30);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3_2();
  v211 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D38);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_2();
  v210 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D40);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_3_2();
  v209 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D48);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3_2();
  v219 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D50);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3_2();
  v214 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D58);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_3_2();
  v222 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D60);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3_2();
  v208 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D68);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_3_2();
  v207 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D70);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_3_2();
  v223 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D78);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_3_2();
  v221 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141DC8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D80);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D90);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141D98);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141DA0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141DA8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141DB0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_21_31(v40);
  v195 = sub_21B36A69C();
  v194 = *(_QWORD *)(v195 - 8);
  MEMORY[0x24BDAC7A8](v195);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_21_31(v41);
  v189 = sub_21B36A84C();
  v186 = *(_QWORD *)(v189 - 8);
  MEMORY[0x24BDAC7A8](v189);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_21_31(v42);
  v43 = sub_21B36A030();
  v216 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_10_0(v44);
  v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551526D0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_12_0();
  v200 = v46;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v47);
  v49 = (char *)&v181 - v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551526D8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_12_0();
  v182 = v51;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_6_23();
  v202 = (char *)v53;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_6_23();
  v201 = v55;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_6_23();
  v184 = v57;
  OUTLINED_FUNCTION_29_0();
  v59 = MEMORY[0x24BDAC7A8](v58);
  v61 = (char *)&v181 - v60;
  MEMORY[0x24BDAC7A8](v59);
  v203 = (char *)&v181 - v62;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141DC0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v63);
  v65 = (char *)&v181 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141DD0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v66);
  OUTLINED_FUNCTION_12_0();
  v218 = v67;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_6_23();
  v188 = v69;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v70);
  v72 = (char *)&v181 - v71;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255141DD8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_12_0();
  v205 = v74;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_20_52();
  MEMORY[0x24BDAC7A8](v76);
  v78 = (char *)&v181 - v77;
  sub_21B36A780();
  OUTLINED_FUNCTION_11_33((uint64_t)v78, 1);
  v79 = sub_21B36AA74();
  v217 = v72;
  v185 = v79;
  __swift_storeEnumTagSinglePayload((uint64_t)v72, 1, 1, v79);
  sub_21B36A048();
  if (v80)
  {
    v81 = sub_21B36A774();
    OUTLINED_FUNCTION_6_1((uint64_t)v65, v82, v83, v81);
    sub_21B36A768();
    OUTLINED_FUNCTION_11_20((uint64_t)v78);
    OUTLINED_FUNCTION_11_33(v2, 0);
    v84 = OUTLINED_FUNCTION_27_34();
    sub_21B165A80(v84, v85, &qword_255141DD8);
  }
  v206 = v78;
  v86 = (uint64_t)v203;
  v204 = v1;
  sub_21B369760();
  v87 = *(void (**)(char *, _QWORD, uint64_t))(v216 + 104);
  v87(v61, *MEMORY[0x24BEA1B98], v43);
  __swift_storeEnumTagSinglePayload((uint64_t)v61, 0, 1, v43);
  v88 = (uint64_t)&v49[*(int *)(v215 + 48)];
  sub_21B165448(v86, (uint64_t)v49, &qword_2551526D8);
  sub_21B165448((uint64_t)v61, v88, &qword_2551526D8);
  OUTLINED_FUNCTION_2_10((uint64_t)v49);
  if (v93)
  {
    OUTLINED_FUNCTION_165_3((uint64_t)v61);
    OUTLINED_FUNCTION_165_3(v86);
    v89 = OUTLINED_FUNCTION_2_10(v88);
    v90 = v222;
    if (v93)
    {
      v91 = v221;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  v92 = v184;
  sub_21B165448((uint64_t)v49, v184, &qword_2551526D8);
  OUTLINED_FUNCTION_2_10(v88);
  if (v93)
  {
    OUTLINED_FUNCTION_11_20((uint64_t)v61);
    OUTLINED_FUNCTION_11_20(v86);
    v89 = OUTLINED_FUNCTION_35_2(v92, *(uint64_t (**)(uint64_t, uint64_t))(v216 + 8));
    v90 = v222;
LABEL_11:
    OUTLINED_FUNCTION_96_0(v89, &qword_2551526D0);
    v91 = v221;
    v94 = v201;
    goto LABEL_12;
  }
  v105 = v216;
  v106 = v183;
  OUTLINED_FUNCTION_25_7(v183, v88, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v216 + 32));
  sub_21B367FD0();
  v107 = OUTLINED_FUNCTION_17_43();
  v108 = *(void (**)(uint64_t, uint64_t))(v105 + 8);
  v108(v106, v43);
  OUTLINED_FUNCTION_165_3((uint64_t)v61);
  OUTLINED_FUNCTION_165_3(v86);
  v108(v92, v43);
  OUTLINED_FUNCTION_165_3((uint64_t)v49);
  v91 = v221;
  v90 = v222;
  v94 = v201;
  if ((v107 & 1) != 0)
    goto LABEL_24;
LABEL_12:
  sub_21B369760();
  v95 = (uint64_t)v202;
  v87(v202, *MEMORY[0x24BEA1BA0], v43);
  v96 = v95;
  OUTLINED_FUNCTION_12_55();
  v97 = v200;
  v98 = v200 + *(int *)(v215 + 48);
  sub_21B165448(v94, v200, &qword_2551526D8);
  sub_21B165448(v96, v98, &qword_2551526D8);
  OUTLINED_FUNCTION_2_10(v97);
  if (v93)
  {
    OUTLINED_FUNCTION_11_20(v96);
    OUTLINED_FUNCTION_11_20(v94);
    v89 = OUTLINED_FUNCTION_2_10(v98);
    v99 = v214;
    v100 = v223;
    if (!v93)
      goto LABEL_20;
LABEL_16:
    OUTLINED_FUNCTION_96_0(v89, &qword_2551526D8);
LABEL_24:
    v116 = *MEMORY[0x24BE93758];
    v117 = *(void (**)(uint64_t, uint64_t, uint64_t))(v186 + 104);
    v118 = v187;
    v119 = v189;
    v117(v187, v116, v189);
    v216 = sub_21B36A840();
    v121 = v120;
    OUTLINED_FUNCTION_18_46();
    v117(v118, v116, v119);
    sub_21B36A840();
    OUTLINED_FUNCTION_18_46();
    v122 = sub_21B36A870();
    OUTLINED_FUNCTION_5_1(v190, v123, v124, v122);
    v125 = sub_21B36A864();
    OUTLINED_FUNCTION_6_1(v191, v126, v127, v125);
    v128 = v192;
    sub_21B36A858();
    v129 = sub_21B36A87C();
    __swift_storeEnumTagSinglePayload(v128, 0, 1, v129);
    v130 = sub_21B36A690();
    OUTLINED_FUNCTION_5_1(v196, v131, v132, v130);
    v133 = sub_21B36ABB8();
    OUTLINED_FUNCTION_6_1(v197, v134, v135, v133);
    v136 = v193;
    sub_21B36A684();
    v137 = sub_21B36A960();
    OUTLINED_FUNCTION_6_1(v198, v138, v139, v137);
    v140 = v194;
    OUTLINED_FUNCTION_25_7(v199, v136, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v194 + 16));
    OUTLINED_FUNCTION_12_55();
    v141 = v188;
    v103 = v121;
    sub_21B36AA68();
    OUTLINED_FUNCTION_35_2(v136, *(uint64_t (**)(uint64_t, uint64_t))(v140 + 8));
    v142 = (uint64_t)v217;
    OUTLINED_FUNCTION_12_29((uint64_t)v217);
    __swift_storeEnumTagSinglePayload(v141, 0, 1, v185);
    sub_21B165A80(v141, v142, &qword_255141DD0);
    v143 = v218;
    v104 = v219;
    v99 = v214;
    v100 = v223;
    goto LABEL_27;
  }
  v101 = v182;
  sub_21B165448(v97, v182, &qword_2551526D8);
  OUTLINED_FUNCTION_2_10(v98);
  if (v102)
  {
    OUTLINED_FUNCTION_12_29((uint64_t)v202);
    OUTLINED_FUNCTION_12_29(v94);
    v89 = OUTLINED_FUNCTION_35_2(v101, *(uint64_t (**)(uint64_t, uint64_t))(v216 + 8));
    v99 = v214;
    v100 = v223;
LABEL_20:
    OUTLINED_FUNCTION_96_0(v89, &qword_2551526D0);
    v216 = 0;
    v103 = 0;
    v104 = v219;
    goto LABEL_26;
  }
  v109 = v216;
  v110 = v183;
  v111 = OUTLINED_FUNCTION_27_34();
  OUTLINED_FUNCTION_25_7(v111, v112, v113);
  sub_21B367FD0();
  v114 = OUTLINED_FUNCTION_17_43();
  v115 = *(void (**)(uint64_t, uint64_t))(v109 + 8);
  v115(v110, v43);
  OUTLINED_FUNCTION_11_20((uint64_t)v202);
  v90 = v222;
  OUTLINED_FUNCTION_11_20(v94);
  v115(v101, v43);
  v91 = v221;
  OUTLINED_FUNCTION_11_20(v97);
  if ((v114 & 1) != 0)
    goto LABEL_24;
  v216 = 0;
  v103 = 0;
  v104 = v219;
  v99 = v214;
  v100 = v223;
LABEL_26:
  v142 = (uint64_t)v217;
  v143 = v218;
LABEL_27:
  v144 = sub_21B36AA98();
  OUTLINED_FUNCTION_5_1(v91, v145, v146, v144);
  v147 = sub_21B36AAA4();
  OUTLINED_FUNCTION_5_1(v100, v148, v149, v147);
  v150 = sub_21B36AAC8();
  OUTLINED_FUNCTION_5_1(v207, v151, v152, v150);
  v153 = sub_21B36AA80();
  OUTLINED_FUNCTION_5_1(v208, v154, v155, v153);
  v156 = sub_21B36AA5C();
  OUTLINED_FUNCTION_5_1(v90, v157, v158, v156);
  v159 = sub_21B36AAD4();
  OUTLINED_FUNCTION_6_1(v99, v160, v161, v159);
  sub_21B165448(v142, v143, &qword_255141DD0);
  v162 = sub_21B36ABC4();
  OUTLINED_FUNCTION_5_1(v104, v163, v164, v162);
  v165 = sub_21B36AB64();
  OUTLINED_FUNCTION_5_1(v209, v166, v167, v165);
  v168 = sub_21B36A804();
  OUTLINED_FUNCTION_5_1(v210, v169, v170, v168);
  v171 = sub_21B36A7E0();
  OUTLINED_FUNCTION_5_1(v211, v172, v173, v171);
  v174 = sub_21B36A894();
  OUTLINED_FUNCTION_6_1(v220, v175, v176, v174);
  v177 = (uint64_t)v206;
  sub_21B165448((uint64_t)v206, v205, &qword_255141DD8);
  if (!v103)
    v216 = sub_21B36A048();
  v178 = sub_21B36AA8C();
  OUTLINED_FUNCTION_6_1(v212, v179, v180, v178);
  sub_21B36AB94();
  sub_21B165410((uint64_t)v217, &qword_255141DD0);
  sub_21B165410(v177, &qword_255141DD8);
}

BOOL sub_21B367B94()
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  void (*v26)(_BYTE *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  void (*v44)(uint64_t, uint64_t);
  _BYTE v46[4];
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v2 = sub_21B36A030();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_2();
  v48 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551526D0);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12_0();
  v53 = v7;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v46[-v9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2551526D8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_12_0();
  v49 = v12;
  OUTLINED_FUNCTION_29_0();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = &v46[-v15];
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_6_23();
  v52 = v17;
  OUTLINED_FUNCTION_29_0();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_20_52();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = &v46[-v21];
  MEMORY[0x24BDAC7A8](v20);
  v24 = &v46[-v23];
  v51 = v0;
  sub_21B369760();
  v25 = *MEMORY[0x24BEA1B98];
  v54 = v3;
  v26 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 104);
  v26(v22, v25, v2);
  OUTLINED_FUNCTION_13_17((uint64_t)v22);
  v50 = v5;
  v27 = (uint64_t)&v10[*(int *)(v5 + 48)];
  sub_21B165448((uint64_t)v24, (uint64_t)v10, &qword_2551526D8);
  sub_21B165448((uint64_t)v22, v27, &qword_2551526D8);
  OUTLINED_FUNCTION_1_44((uint64_t)v10);
  if (v29)
  {
    OUTLINED_FUNCTION_165_3((uint64_t)v22);
    OUTLINED_FUNCTION_165_3((uint64_t)v24);
    OUTLINED_FUNCTION_1_44(v27);
    if (v29)
    {
      v28 = (uint64_t)v10;
      goto LABEL_15;
    }
    goto LABEL_9;
  }
  sub_21B165448((uint64_t)v10, v1, &qword_2551526D8);
  OUTLINED_FUNCTION_1_44(v27);
  if (v29)
  {
    OUTLINED_FUNCTION_11_20((uint64_t)v22);
    OUTLINED_FUNCTION_11_20((uint64_t)v24);
    v30 = OUTLINED_FUNCTION_27_34();
    v31(v30);
LABEL_9:
    sub_21B165410((uint64_t)v10, &qword_2551526D0);
    goto LABEL_10;
  }
  v36 = v54;
  v37 = v48;
  OUTLINED_FUNCTION_28_36(v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 32));
  sub_21B367FD0();
  v47 = OUTLINED_FUNCTION_19_45();
  v38 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
  v38(v37, v2);
  OUTLINED_FUNCTION_30_35((uint64_t)v22);
  OUTLINED_FUNCTION_30_35((uint64_t)v24);
  v39 = OUTLINED_FUNCTION_27_34();
  ((void (*)(uint64_t))v38)(v39);
  OUTLINED_FUNCTION_30_35((uint64_t)v10);
  if ((v47 & 1) != 0)
    return 1;
LABEL_10:
  v32 = v52;
  sub_21B369760();
  v26(v16, *MEMORY[0x24BEA1BA0], v2);
  OUTLINED_FUNCTION_13_17((uint64_t)v16);
  v33 = v53;
  v34 = v53 + *(int *)(v50 + 48);
  sub_21B165448(v32, v53, &qword_2551526D8);
  sub_21B165448((uint64_t)v16, v34, &qword_2551526D8);
  OUTLINED_FUNCTION_1_44(v33);
  if (v29)
  {
    OUTLINED_FUNCTION_37_26((uint64_t)v16);
    OUTLINED_FUNCTION_37_26(v32);
    OUTLINED_FUNCTION_1_44(v34);
    if (!v29)
      goto LABEL_19;
    v28 = v33;
LABEL_15:
    sub_21B165410(v28, &qword_2551526D8);
    return 1;
  }
  sub_21B165448(v33, v49, &qword_2551526D8);
  OUTLINED_FUNCTION_1_44(v34);
  if (v35)
  {
    OUTLINED_FUNCTION_11_20((uint64_t)v16);
    OUTLINED_FUNCTION_11_20(v32);
    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v49, v2);
LABEL_19:
    sub_21B165410(v33, &qword_2551526D0);
    return 0;
  }
  v40 = v54;
  v41 = v48;
  OUTLINED_FUNCTION_28_36(v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 32));
  sub_21B367FD0();
  v42 = v49;
  v43 = OUTLINED_FUNCTION_19_45();
  v44 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v44(v41, v2);
  OUTLINED_FUNCTION_37_26((uint64_t)v16);
  OUTLINED_FUNCTION_37_26(v32);
  v44(v42, v2);
  OUTLINED_FUNCTION_37_26(v33);
  return (v43 & 1) != 0;
}

unint64_t sub_21B367FD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2551526E0;
  if (!qword_2551526E0)
  {
    v1 = sub_21B36A030();
    result = MEMORY[0x2207623FC](MEMORY[0x24BEA1BB8], v1);
    atomic_store(result, (unint64_t *)&qword_2551526E0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_12_55()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_17_43()
{
  return sub_21B36B428();
}

uint64_t OUTLINED_FUNCTION_18_46()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t OUTLINED_FUNCTION_19_45()
{
  return sub_21B36B428();
}

uint64_t OUTLINED_FUNCTION_27_34()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_28_36@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

void OUTLINED_FUNCTION_30_35(uint64_t a1)
{
  uint64_t *v1;

  sub_21B165410(a1, v1);
}

uint64_t sub_21B368080()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_21B36808C()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_21B368098()
{
  return MEMORY[0x24BDCB6E8]();
}

uint64_t sub_21B3680A4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21B3680B0()
{
  return MEMORY[0x24BDCB9D8]();
}

uint64_t sub_21B3680BC()
{
  return MEMORY[0x24BDCB9E8]();
}

uint64_t sub_21B3680C8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21B3680D4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21B3680E0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21B3680EC()
{
  return MEMORY[0x24BDCBC30]();
}

uint64_t sub_21B3680F8()
{
  return MEMORY[0x24BDCBC48]();
}

uint64_t sub_21B368104()
{
  return MEMORY[0x24BDCBC60]();
}

uint64_t sub_21B368110()
{
  return MEMORY[0x24BDCBC70]();
}

uint64_t sub_21B36811C()
{
  return MEMORY[0x24BDCBC88]();
}

uint64_t sub_21B368128()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_21B368134()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_21B368140()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_21B36814C()
{
  return MEMORY[0x24BDCBCE8]();
}

uint64_t sub_21B368158()
{
  return MEMORY[0x24BDCBD00]();
}

uint64_t sub_21B368164()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_21B368170()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_21B36817C()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_21B368188()
{
  return MEMORY[0x24BDCBD58]();
}

uint64_t sub_21B368194()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_21B3681A0()
{
  return MEMORY[0x24BDCBD70]();
}

uint64_t sub_21B3681AC()
{
  return MEMORY[0x24BDCBD80]();
}

uint64_t sub_21B3681B8()
{
  return MEMORY[0x24BDCBD90]();
}

uint64_t sub_21B3681C4()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_21B3681D0()
{
  return MEMORY[0x24BDCBDB0]();
}

uint64_t sub_21B3681DC()
{
  return MEMORY[0x24BDCBDD0]();
}

uint64_t sub_21B3681E8()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21B3681F4()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21B368200()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21B36820C()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_21B368218()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21B368224()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_21B368230()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_21B36823C()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_21B368248()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_21B368254()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_21B368260()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_21B36826C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21B368278()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_21B368284()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21B368290()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21B36829C()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_21B3682A8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21B3682B4()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_21B3682C0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21B3682CC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21B3682D8()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_21B3682E4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21B3682F0()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_21B3682FC()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_21B368308()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_21B368314()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21B368320()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_21B36832C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_21B368338()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_21B368344()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_21B368350()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_21B36835C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_21B368368()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21B368374()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21B368380()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_21B36838C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21B368398()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_21B3683A4()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_21B3683B0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_21B3683BC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21B3683C8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21B3683D4()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_21B3683E0()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_21B3683EC()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_21B3683F8()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_21B368404()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_21B368410()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_21B36841C()
{
  return MEMORY[0x24BDCED50]();
}

uint64_t sub_21B368428()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_21B368434()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_21B368440()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_21B36844C()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_21B368458()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21B368464()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_21B368470()
{
  return MEMORY[0x24BDCF008]();
}

uint64_t sub_21B36847C()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_21B368488()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_21B368494()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_21B3684A0()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_21B3684AC()
{
  return MEMORY[0x24BDCF098]();
}

uint64_t sub_21B3684B8()
{
  return MEMORY[0x24BDCF0A0]();
}

uint64_t sub_21B3684C4()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_21B3684D0()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_21B3684DC()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_21B3684E8()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_21B3684F4()
{
  return MEMORY[0x24BDCF188]();
}

uint64_t sub_21B368500()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_21B36850C()
{
  return MEMORY[0x24BDCF1C0]();
}

uint64_t sub_21B368518()
{
  return MEMORY[0x24BDCF1C8]();
}

uint64_t sub_21B368524()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21B368530()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21B36853C()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_21B368548()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_21B368554()
{
  return MEMORY[0x24BEAC3E0]();
}

uint64_t sub_21B368560()
{
  return MEMORY[0x24BEAC3E8]();
}

uint64_t sub_21B36856C()
{
  return MEMORY[0x24BEAC3F0]();
}

uint64_t sub_21B368578()
{
  return MEMORY[0x24BEAC3F8]();
}

uint64_t sub_21B368584()
{
  return MEMORY[0x24BEAC400]();
}

uint64_t sub_21B368590()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_21B36859C()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_21B3685A8()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_21B3685B4()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_21B3685C0()
{
  return MEMORY[0x24BEAD358]();
}

uint64_t sub_21B3685CC()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_21B3685D8()
{
  return MEMORY[0x24BE95F50]();
}

uint64_t sub_21B3685E4()
{
  return MEMORY[0x24BE95F60]();
}

uint64_t sub_21B3685F0()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_21B3685FC()
{
  return MEMORY[0x24BE95FD0]();
}

uint64_t sub_21B368608()
{
  return MEMORY[0x24BE95FF0]();
}

uint64_t sub_21B368614()
{
  return MEMORY[0x24BE96000]();
}

uint64_t sub_21B368620()
{
  return MEMORY[0x24BE96008]();
}

uint64_t sub_21B36862C()
{
  return MEMORY[0x24BE96018]();
}

uint64_t sub_21B368638()
{
  return MEMORY[0x24BE96028]();
}

uint64_t sub_21B368644()
{
  return MEMORY[0x24BE96038]();
}

uint64_t sub_21B368650()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_21B36865C()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_21B368668()
{
  return MEMORY[0x24BE960D0]();
}

uint64_t sub_21B368674()
{
  return MEMORY[0x24BE96100]();
}

uint64_t sub_21B368680()
{
  return MEMORY[0x24BE96200]();
}

uint64_t sub_21B36868C()
{
  return MEMORY[0x24BE96210]();
}

uint64_t sub_21B368698()
{
  return MEMORY[0x24BE96220]();
}

uint64_t sub_21B3686A4()
{
  return MEMORY[0x24BE96230]();
}

uint64_t sub_21B3686B0()
{
  return MEMORY[0x24BE96278]();
}

uint64_t sub_21B3686BC()
{
  return MEMORY[0x24BE96290]();
}

uint64_t sub_21B3686C8()
{
  return MEMORY[0x24BE962B8]();
}

uint64_t sub_21B3686D4()
{
  return MEMORY[0x24BE962C8]();
}

uint64_t sub_21B3686E0()
{
  return MEMORY[0x24BE962D8]();
}

uint64_t sub_21B3686EC()
{
  return MEMORY[0x24BE962E0]();
}

uint64_t sub_21B3686F8()
{
  return MEMORY[0x24BE962F0]();
}

uint64_t sub_21B368704()
{
  return MEMORY[0x24BE96300]();
}

uint64_t sub_21B368710()
{
  return MEMORY[0x24BE96310]();
}

uint64_t sub_21B36871C()
{
  return MEMORY[0x24BE96460]();
}

uint64_t sub_21B368728()
{
  return MEMORY[0x24BE96490]();
}

uint64_t sub_21B368734()
{
  return MEMORY[0x24BE96498]();
}

uint64_t sub_21B368740()
{
  return MEMORY[0x24BE964A0]();
}

uint64_t sub_21B36874C()
{
  return MEMORY[0x24BE964B0]();
}

uint64_t sub_21B368758()
{
  return MEMORY[0x24BE964C0]();
}

uint64_t sub_21B368764()
{
  return MEMORY[0x24BE964D0]();
}

uint64_t sub_21B368770()
{
  return MEMORY[0x24BE964D8]();
}

uint64_t sub_21B36877C()
{
  return MEMORY[0x24BE96550]();
}

uint64_t sub_21B368788()
{
  return MEMORY[0x24BE96560]();
}

uint64_t sub_21B368794()
{
  return MEMORY[0x24BE96570]();
}

uint64_t sub_21B3687A0()
{
  return MEMORY[0x24BE96580]();
}

uint64_t sub_21B3687AC()
{
  return MEMORY[0x24BE96590]();
}

uint64_t sub_21B3687B8()
{
  return MEMORY[0x24BE965B0]();
}

uint64_t sub_21B3687C4()
{
  return MEMORY[0x24BE965E0]();
}

uint64_t sub_21B3687D0()
{
  return MEMORY[0x24BE965F0]();
}

uint64_t sub_21B3687DC()
{
  return MEMORY[0x24BE96600]();
}

uint64_t sub_21B3687E8()
{
  return MEMORY[0x24BE96610]();
}

uint64_t sub_21B3687F4()
{
  return MEMORY[0x24BE96620]();
}

uint64_t sub_21B368800()
{
  return MEMORY[0x24BE96630]();
}

uint64_t sub_21B36880C()
{
  return MEMORY[0x24BE96738]();
}

uint64_t sub_21B368818()
{
  return MEMORY[0x24BE96760]();
}

uint64_t sub_21B368824()
{
  return MEMORY[0x24BE96770]();
}

uint64_t sub_21B368830()
{
  return MEMORY[0x24BE96840]();
}

uint64_t sub_21B36883C()
{
  return MEMORY[0x24BE96848]();
}

uint64_t sub_21B368848()
{
  return MEMORY[0x24BE96858]();
}

uint64_t sub_21B368854()
{
  return MEMORY[0x24BE96868]();
}

uint64_t sub_21B368860()
{
  return MEMORY[0x24BE96888]();
}

uint64_t sub_21B36886C()
{
  return MEMORY[0x24BE968A8]();
}

uint64_t sub_21B368878()
{
  return MEMORY[0x24BE968E0]();
}

uint64_t sub_21B368884()
{
  return MEMORY[0x24BE968F8]();
}

uint64_t sub_21B368890()
{
  return MEMORY[0x24BE96900]();
}

uint64_t sub_21B36889C()
{
  return MEMORY[0x24BE96908]();
}

uint64_t sub_21B3688A8()
{
  return MEMORY[0x24BE96918]();
}

uint64_t sub_21B3688B4()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_21B3688C0()
{
  return MEMORY[0x24BE96940]();
}

uint64_t sub_21B3688CC()
{
  return MEMORY[0x24BE96A38]();
}

uint64_t sub_21B3688D8()
{
  return MEMORY[0x24BE96A40]();
}

uint64_t sub_21B3688E4()
{
  return MEMORY[0x24BE96A68]();
}

uint64_t sub_21B3688F0()
{
  return MEMORY[0x24BE96A70]();
}

uint64_t sub_21B3688FC()
{
  return MEMORY[0x24BE96A78]();
}

uint64_t sub_21B368908()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_21B368914()
{
  return MEMORY[0x24BE96AA0]();
}

uint64_t sub_21B368920()
{
  return MEMORY[0x24BE96B18]();
}

uint64_t sub_21B36892C()
{
  return MEMORY[0x24BE96B30]();
}

uint64_t sub_21B368938()
{
  return MEMORY[0x24BE96B38]();
}

uint64_t sub_21B368944()
{
  return MEMORY[0x24BE96B40]();
}

uint64_t sub_21B368950()
{
  return MEMORY[0x24BE96B48]();
}

uint64_t sub_21B36895C()
{
  return MEMORY[0x24BE96B50]();
}

uint64_t sub_21B368968()
{
  return MEMORY[0x24BE96B58]();
}

uint64_t sub_21B368974()
{
  return MEMORY[0x24BE96B60]();
}

uint64_t sub_21B368980()
{
  return MEMORY[0x24BE96B88]();
}

uint64_t sub_21B36898C()
{
  return MEMORY[0x24BE96BA8]();
}

uint64_t sub_21B368998()
{
  return MEMORY[0x24BE96BB8]();
}

uint64_t sub_21B3689A4()
{
  return MEMORY[0x24BE96BD8]();
}

uint64_t sub_21B3689B0()
{
  return MEMORY[0x24BE96BF0]();
}

uint64_t sub_21B3689BC()
{
  return MEMORY[0x24BE96C00]();
}

uint64_t sub_21B3689C8()
{
  return MEMORY[0x24BE96C10]();
}

uint64_t sub_21B3689D4()
{
  return MEMORY[0x24BE96C28]();
}

uint64_t sub_21B3689E0()
{
  return MEMORY[0x24BE96C30]();
}

uint64_t sub_21B3689EC()
{
  return MEMORY[0x24BE96C40]();
}

uint64_t sub_21B3689F8()
{
  return MEMORY[0x24BE96C68]();
}

uint64_t sub_21B368A04()
{
  return MEMORY[0x24BE96C70]();
}

uint64_t sub_21B368A10()
{
  return MEMORY[0x24BE96C78]();
}

uint64_t sub_21B368A1C()
{
  return MEMORY[0x24BE96C88]();
}

uint64_t sub_21B368A28()
{
  return MEMORY[0x24BE96C90]();
}

uint64_t sub_21B368A34()
{
  return MEMORY[0x24BE96C98]();
}

uint64_t sub_21B368A40()
{
  return MEMORY[0x24BE96CA0]();
}

uint64_t sub_21B368A4C()
{
  return MEMORY[0x24BE96CA8]();
}

uint64_t sub_21B368A58()
{
  return MEMORY[0x24BE96CB8]();
}

uint64_t sub_21B368A64()
{
  return MEMORY[0x24BE96CD0]();
}

uint64_t sub_21B368A70()
{
  return MEMORY[0x24BE96E00]();
}

uint64_t sub_21B368A7C()
{
  return MEMORY[0x24BE96E30]();
}

uint64_t sub_21B368A88()
{
  return MEMORY[0x24BE96E58]();
}

uint64_t sub_21B368A94()
{
  return MEMORY[0x24BE96E60]();
}

uint64_t sub_21B368AA0()
{
  return MEMORY[0x24BE96E70]();
}

uint64_t sub_21B368AAC()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_21B368AB8()
{
  return MEMORY[0x24BE96E80]();
}

uint64_t sub_21B368AC4()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_21B368AD0()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_21B368ADC()
{
  return MEMORY[0x24BE96EB8]();
}

uint64_t sub_21B368AE8()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_21B368AF4()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_21B368B00()
{
  return MEMORY[0x24BE96EE0]();
}

uint64_t sub_21B368B0C()
{
  return MEMORY[0x24BE96EE8]();
}

uint64_t sub_21B368B18()
{
  return MEMORY[0x24BE96EF8]();
}

uint64_t sub_21B368B24()
{
  return MEMORY[0x24BE96F08]();
}

uint64_t sub_21B368B30()
{
  return MEMORY[0x24BE96F18]();
}

uint64_t sub_21B368B3C()
{
  return MEMORY[0x24BE96F28]();
}

uint64_t sub_21B368B48()
{
  return MEMORY[0x24BE97000]();
}

uint64_t sub_21B368B54()
{
  return MEMORY[0x24BE97008]();
}

uint64_t sub_21B368B60()
{
  return MEMORY[0x24BE97130]();
}

uint64_t sub_21B368B6C()
{
  return MEMORY[0x24BE97158]();
}

uint64_t sub_21B368B78()
{
  return MEMORY[0x24BE97160]();
}

uint64_t sub_21B368B84()
{
  return MEMORY[0x24BE97240]();
}

uint64_t sub_21B368B90()
{
  return MEMORY[0x24BE97248]();
}

uint64_t sub_21B368B9C()
{
  return MEMORY[0x24BE97250]();
}

uint64_t sub_21B368BA8()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_21B368BB4()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_21B368BC0()
{
  return MEMORY[0x24BE97588]();
}

uint64_t sub_21B368BCC()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_21B368BD8()
{
  return MEMORY[0x24BE975D0]();
}

uint64_t sub_21B368BE4()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_21B368BF0()
{
  return MEMORY[0x24BE97600]();
}

uint64_t sub_21B368BFC()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_21B368C08()
{
  return MEMORY[0x24BE97670]();
}

uint64_t sub_21B368C14()
{
  return MEMORY[0x24BE97698]();
}

uint64_t sub_21B368C20()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_21B368C2C()
{
  return MEMORY[0x24BE976C0]();
}

uint64_t sub_21B368C38()
{
  return MEMORY[0x24BE976D0]();
}

uint64_t sub_21B368C44()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_21B368C50()
{
  return MEMORY[0x24BE97718]();
}

uint64_t sub_21B368C5C()
{
  return MEMORY[0x24BE97720]();
}

uint64_t sub_21B368C68()
{
  return MEMORY[0x24BE97730]();
}

uint64_t sub_21B368C74()
{
  return MEMORY[0x24BE97740]();
}

uint64_t sub_21B368C80()
{
  return MEMORY[0x24BE97748]();
}

uint64_t sub_21B368C8C()
{
  return MEMORY[0x24BE97770]();
}

uint64_t sub_21B368C98()
{
  return MEMORY[0x24BE97778]();
}

uint64_t sub_21B368CA4()
{
  return MEMORY[0x24BE97780]();
}

uint64_t sub_21B368CB0()
{
  return MEMORY[0x24BE97948]();
}

uint64_t sub_21B368CBC()
{
  return MEMORY[0x24BE97968]();
}

uint64_t sub_21B368CC8()
{
  return MEMORY[0x24BE97988]();
}

uint64_t sub_21B368CD4()
{
  return MEMORY[0x24BE979B8]();
}

uint64_t sub_21B368CE0()
{
  return MEMORY[0x24BE979D8]();
}

uint64_t sub_21B368CEC()
{
  return MEMORY[0x24BE979E0]();
}

uint64_t sub_21B368CF8()
{
  return MEMORY[0x24BE979E8]();
}

uint64_t sub_21B368D04()
{
  return MEMORY[0x24BE97A08]();
}

uint64_t sub_21B368D10()
{
  return MEMORY[0x24BE97A10]();
}

uint64_t sub_21B368D1C()
{
  return MEMORY[0x24BE97A18]();
}

uint64_t sub_21B368D28()
{
  return MEMORY[0x24BE97A68]();
}

uint64_t sub_21B368D34()
{
  return MEMORY[0x24BE97A70]();
}

uint64_t sub_21B368D40()
{
  return MEMORY[0x24BE97A80]();
}

uint64_t sub_21B368D4C()
{
  return MEMORY[0x24BE97A98]();
}

uint64_t sub_21B368D58()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_21B368D64()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_21B368D70()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_21B368D7C()
{
  return MEMORY[0x24BE97B10]();
}

uint64_t sub_21B368D88()
{
  return MEMORY[0x24BE97C18]();
}

uint64_t sub_21B368D94()
{
  return MEMORY[0x24BE97C20]();
}

uint64_t sub_21B368DA0()
{
  return MEMORY[0x24BE97C60]();
}

uint64_t sub_21B368DAC()
{
  return MEMORY[0x24BE97C70]();
}

uint64_t sub_21B368DB8()
{
  return MEMORY[0x24BE97C78]();
}

uint64_t sub_21B368DC4()
{
  return MEMORY[0x24BE97CA0]();
}

uint64_t sub_21B368DD0()
{
  return MEMORY[0x24BE97CB0]();
}

uint64_t sub_21B368DDC()
{
  return MEMORY[0x24BE97CB8]();
}

uint64_t sub_21B368DE8()
{
  return MEMORY[0x24BE97CE8]();
}

uint64_t sub_21B368DF4()
{
  return MEMORY[0x24BE97CF0]();
}

uint64_t sub_21B368E00()
{
  return MEMORY[0x24BE97CF8]();
}

uint64_t sub_21B368E0C()
{
  return MEMORY[0x24BE97D00]();
}

uint64_t sub_21B368E18()
{
  return MEMORY[0x24BE97D08]();
}

uint64_t sub_21B368E24()
{
  return MEMORY[0x24BE97D10]();
}

uint64_t sub_21B368E30()
{
  return MEMORY[0x24BE97D20]();
}

uint64_t sub_21B368E3C()
{
  return MEMORY[0x24BE97D30]();
}

uint64_t sub_21B368E48()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_21B368E54()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t sub_21B368E60()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_21B368E6C()
{
  return MEMORY[0x24BE97D78]();
}

uint64_t sub_21B368E78()
{
  return MEMORY[0x24BE97DA0]();
}

uint64_t sub_21B368E84()
{
  return MEMORY[0x24BE97DA8]();
}

uint64_t sub_21B368E90()
{
  return MEMORY[0x24BE97DB8]();
}

uint64_t sub_21B368E9C()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_21B368EA8()
{
  return MEMORY[0x24BE97DD0]();
}

uint64_t sub_21B368EB4()
{
  return MEMORY[0x24BE97DE0]();
}

uint64_t sub_21B368EC0()
{
  return MEMORY[0x24BE97DF0]();
}

uint64_t sub_21B368ECC()
{
  return MEMORY[0x24BE97DF8]();
}

uint64_t sub_21B368ED8()
{
  return MEMORY[0x24BE97E00]();
}

uint64_t sub_21B368EE4()
{
  return MEMORY[0x24BE97E08]();
}

uint64_t sub_21B368EF0()
{
  return MEMORY[0x24BE97E10]();
}

uint64_t sub_21B368EFC()
{
  return MEMORY[0x24BE97E18]();
}

uint64_t sub_21B368F08()
{
  return MEMORY[0x24BE97E20]();
}

uint64_t sub_21B368F14()
{
  return MEMORY[0x24BE97E28]();
}

uint64_t sub_21B368F20()
{
  return MEMORY[0x24BE97E30]();
}

uint64_t sub_21B368F2C()
{
  return MEMORY[0x24BE97E48]();
}

uint64_t sub_21B368F38()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_21B368F44()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_21B368F50()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t sub_21B368F5C()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_21B368F68()
{
  return MEMORY[0x24BE97F80]();
}

uint64_t sub_21B368F74()
{
  return MEMORY[0x24BE97FB0]();
}

uint64_t sub_21B368F80()
{
  return MEMORY[0x24BE97FC0]();
}

uint64_t sub_21B368F8C()
{
  return MEMORY[0x24BE97FD8]();
}

uint64_t sub_21B368F98()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_21B368FA4()
{
  return MEMORY[0x24BE98080]();
}

uint64_t sub_21B368FB0()
{
  return MEMORY[0x24BE98090]();
}

uint64_t sub_21B368FBC()
{
  return MEMORY[0x24BE98118]();
}

uint64_t sub_21B368FC8()
{
  return MEMORY[0x24BE98150]();
}

uint64_t sub_21B368FD4()
{
  return MEMORY[0x24BE98160]();
}

uint64_t sub_21B368FE0()
{
  return MEMORY[0x24BE98180]();
}

uint64_t sub_21B368FEC()
{
  return MEMORY[0x24BE98188]();
}

uint64_t sub_21B368FF8()
{
  return MEMORY[0x24BE981B8]();
}

uint64_t sub_21B369004()
{
  return MEMORY[0x24BE981C0]();
}

uint64_t sub_21B369010()
{
  return MEMORY[0x24BE98248]();
}

uint64_t sub_21B36901C()
{
  return MEMORY[0x24BE98258]();
}

uint64_t sub_21B369028()
{
  return MEMORY[0x24BE98278]();
}

uint64_t sub_21B369034()
{
  return MEMORY[0x24BE98288]();
}

uint64_t sub_21B369040()
{
  return MEMORY[0x24BE98298]();
}

uint64_t sub_21B36904C()
{
  return MEMORY[0x24BE98310]();
}

uint64_t sub_21B369058()
{
  return MEMORY[0x24BE98320]();
}

uint64_t sub_21B369064()
{
  return MEMORY[0x24BE98338]();
}

uint64_t sub_21B369070()
{
  return MEMORY[0x24BE98340]();
}

uint64_t sub_21B36907C()
{
  return MEMORY[0x24BE98348]();
}

uint64_t sub_21B369088()
{
  return MEMORY[0x24BE98350]();
}

uint64_t sub_21B369094()
{
  return MEMORY[0x24BE98360]();
}

uint64_t sub_21B3690A0()
{
  return MEMORY[0x24BE98368]();
}

uint64_t sub_21B3690AC()
{
  return MEMORY[0x24BE98370]();
}

uint64_t sub_21B3690B8()
{
  return MEMORY[0x24BE983A8]();
}

uint64_t sub_21B3690C4()
{
  return MEMORY[0x24BE983B8]();
}

uint64_t sub_21B3690D0()
{
  return MEMORY[0x24BE983C8]();
}

uint64_t sub_21B3690DC()
{
  return MEMORY[0x24BE983D0]();
}

uint64_t sub_21B3690E8()
{
  return MEMORY[0x24BE983D8]();
}

uint64_t sub_21B3690F4()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_21B369100()
{
  return MEMORY[0x24BE98458]();
}

uint64_t sub_21B36910C()
{
  return MEMORY[0x24BE984A0]();
}

uint64_t sub_21B369118()
{
  return MEMORY[0x24BE984E0]();
}

uint64_t sub_21B369124()
{
  return MEMORY[0x24BE984F0]();
}

uint64_t sub_21B369130()
{
  return MEMORY[0x24BE98500]();
}

uint64_t sub_21B36913C()
{
  return MEMORY[0x24BE98538]();
}

uint64_t sub_21B369148()
{
  return MEMORY[0x24BE985F8]();
}

uint64_t sub_21B369154()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_21B369160()
{
  return MEMORY[0x24BE98660]();
}

uint64_t sub_21B36916C()
{
  return MEMORY[0x24BE98670]();
}

uint64_t sub_21B369178()
{
  return MEMORY[0x24BE98678]();
}

uint64_t sub_21B369184()
{
  return MEMORY[0x24BE98698]();
}

uint64_t sub_21B369190()
{
  return MEMORY[0x24BE986A0]();
}

uint64_t sub_21B36919C()
{
  return MEMORY[0x24BE986A8]();
}

uint64_t sub_21B3691A8()
{
  return MEMORY[0x24BE986B0]();
}

uint64_t sub_21B3691B4()
{
  return MEMORY[0x24BE986B8]();
}

uint64_t sub_21B3691C0()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_21B3691CC()
{
  return MEMORY[0x24BE986E8]();
}

uint64_t sub_21B3691D8()
{
  return MEMORY[0x24BE986F0]();
}

uint64_t sub_21B3691E4()
{
  return MEMORY[0x24BE98740]();
}

uint64_t sub_21B3691F0()
{
  return MEMORY[0x24BE98750]();
}

uint64_t sub_21B3691FC()
{
  return MEMORY[0x24BE98760]();
}

uint64_t sub_21B369208()
{
  return MEMORY[0x24BE98768]();
}

uint64_t sub_21B369214()
{
  return MEMORY[0x24BE98770]();
}

uint64_t sub_21B369220()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_21B36922C()
{
  return MEMORY[0x24BE98820]();
}

uint64_t sub_21B369238()
{
  return MEMORY[0x24BE98830]();
}

uint64_t sub_21B369244()
{
  return MEMORY[0x24BE98848]();
}

uint64_t sub_21B369250()
{
  return MEMORY[0x24BE98858]();
}

uint64_t sub_21B36925C()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_21B369268()
{
  return MEMORY[0x24BE98890]();
}

uint64_t sub_21B369274()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_21B369280()
{
  return MEMORY[0x24BE988C0]();
}

uint64_t sub_21B36928C()
{
  return MEMORY[0x24BE988C8]();
}

uint64_t sub_21B369298()
{
  return MEMORY[0x24BE988D0]();
}

uint64_t sub_21B3692A4()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_21B3692B0()
{
  return MEMORY[0x24BE98948]();
}

uint64_t sub_21B3692BC()
{
  return MEMORY[0x24BE98950]();
}

uint64_t sub_21B3692C8()
{
  return MEMORY[0x24BE98958]();
}

uint64_t sub_21B3692D4()
{
  return MEMORY[0x24BE98960]();
}

uint64_t sub_21B3692E0()
{
  return MEMORY[0x24BE98968]();
}

uint64_t sub_21B3692EC()
{
  return MEMORY[0x24BE989A8]();
}

uint64_t sub_21B3692F8()
{
  return MEMORY[0x24BE989B0]();
}

uint64_t sub_21B369304()
{
  return MEMORY[0x24BE989B8]();
}

uint64_t sub_21B369310()
{
  return MEMORY[0x24BE98A38]();
}

uint64_t sub_21B36931C()
{
  return MEMORY[0x24BE98A48]();
}

uint64_t sub_21B369328()
{
  return MEMORY[0x24BE98A58]();
}

uint64_t sub_21B369334()
{
  return MEMORY[0x24BE98A68]();
}

uint64_t sub_21B369340()
{
  return MEMORY[0x24BE98A78]();
}

uint64_t sub_21B36934C()
{
  return MEMORY[0x24BE98A88]();
}

uint64_t sub_21B369358()
{
  return MEMORY[0x24BE98B58]();
}

uint64_t sub_21B369364()
{
  return MEMORY[0x24BE98B68]();
}

uint64_t sub_21B369370()
{
  return MEMORY[0x24BE98B78]();
}

uint64_t sub_21B36937C()
{
  return MEMORY[0x24BE98B88]();
}

uint64_t sub_21B369388()
{
  return MEMORY[0x24BE98C78]();
}

uint64_t sub_21B369394()
{
  return MEMORY[0x24BE98C88]();
}

uint64_t sub_21B3693A0()
{
  return MEMORY[0x24BE98CA8]();
}

uint64_t sub_21B3693AC()
{
  return MEMORY[0x24BE98CB8]();
}

uint64_t sub_21B3693B8()
{
  return MEMORY[0x24BE98CF0]();
}

uint64_t sub_21B3693C4()
{
  return MEMORY[0x24BE98D28]();
}

uint64_t sub_21B3693D0()
{
  return MEMORY[0x24BE98D30]();
}

uint64_t sub_21B3693DC()
{
  return MEMORY[0x24BE98D48]();
}

uint64_t sub_21B3693E8()
{
  return MEMORY[0x24BE98D50]();
}

uint64_t sub_21B3693F4()
{
  return MEMORY[0x24BE98D58]();
}

uint64_t sub_21B369400()
{
  return MEMORY[0x24BE98D60]();
}

uint64_t sub_21B36940C()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_21B369418()
{
  return MEMORY[0x24BE98DC8]();
}

uint64_t sub_21B369424()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_21B369430()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_21B36943C()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_21B369448()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_21B369454()
{
  return MEMORY[0x24BE98E58]();
}

uint64_t sub_21B369460()
{
  return MEMORY[0x24BE98E60]();
}

uint64_t sub_21B36946C()
{
  return MEMORY[0x24BE98E68]();
}

uint64_t sub_21B369478()
{
  return MEMORY[0x24BE98E70]();
}

uint64_t sub_21B369484()
{
  return MEMORY[0x24BE98E78]();
}

uint64_t sub_21B369490()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_21B36949C()
{
  return MEMORY[0x24BE98EC8]();
}

uint64_t sub_21B3694A8()
{
  return MEMORY[0x24BE98ED8]();
}

uint64_t sub_21B3694B4()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_21B3694C0()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_21B3694CC()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_21B3694D8()
{
  return MEMORY[0x24BE99070]();
}

uint64_t sub_21B3694E4()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_21B3694F0()
{
  return MEMORY[0x24BEA63C0]();
}

uint64_t sub_21B3694FC()
{
  return MEMORY[0x24BEA6570]();
}

uint64_t sub_21B369508()
{
  return MEMORY[0x24BEA6588]();
}

uint64_t sub_21B369514()
{
  return MEMORY[0x24BEA65D0]();
}

uint64_t sub_21B369520()
{
  return MEMORY[0x24BEA65D8]();
}

uint64_t sub_21B36952C()
{
  return MEMORY[0x24BEA65F0]();
}

uint64_t sub_21B369538()
{
  return MEMORY[0x24BEA65F8]();
}

uint64_t sub_21B369544()
{
  return MEMORY[0x24BEA6630]();
}

uint64_t sub_21B369550()
{
  return MEMORY[0x24BEA6638]();
}

uint64_t sub_21B36955C()
{
  return MEMORY[0x24BEA6748]();
}

uint64_t sub_21B369568()
{
  return MEMORY[0x24BEA6830]();
}

uint64_t sub_21B369574()
{
  return MEMORY[0x24BEA6848]();
}

uint64_t sub_21B369580()
{
  return MEMORY[0x24BEA6868]();
}

uint64_t sub_21B36958C()
{
  return MEMORY[0x24BEA6870]();
}

uint64_t sub_21B369598()
{
  return MEMORY[0x24BEA6880]();
}

uint64_t sub_21B3695A4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21B3695B0()
{
  return MEMORY[0x24BE9C160]();
}

uint64_t sub_21B3695BC()
{
  return MEMORY[0x24BE9C168]();
}

uint64_t sub_21B3695C8()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_21B3695D4()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_21B3695E0()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t sub_21B3695EC()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t sub_21B3695F8()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_21B369604()
{
  return MEMORY[0x24BE9C770]();
}

uint64_t sub_21B369610()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t sub_21B36961C()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_21B369628()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_21B369634()
{
  return MEMORY[0x24BE9CAD8]();
}

uint64_t sub_21B369640()
{
  return MEMORY[0x24BE9CAE8]();
}

uint64_t sub_21B36964C()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t sub_21B369658()
{
  return MEMORY[0x24BE9CB18]();
}

uint64_t sub_21B369664()
{
  return MEMORY[0x24BE9CB20]();
}

uint64_t sub_21B369670()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_21B36967C()
{
  return MEMORY[0x24BE9CCD0]();
}

uint64_t sub_21B369688()
{
  return MEMORY[0x24BE9CD28]();
}

uint64_t sub_21B369694()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t sub_21B3696A0()
{
  return MEMORY[0x24BE9CD58]();
}

uint64_t sub_21B3696AC()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_21B3696B8()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_21B3696C4()
{
  return MEMORY[0x24BE9CF00]();
}

uint64_t sub_21B3696D0()
{
  return MEMORY[0x24BE9CF08]();
}

uint64_t sub_21B3696DC()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_21B3696E8()
{
  return MEMORY[0x24BE9D0E8]();
}

uint64_t sub_21B3696F4()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t sub_21B369700()
{
  return MEMORY[0x24BE9E000]();
}

uint64_t sub_21B36970C()
{
  return MEMORY[0x24BE9E010]();
}

uint64_t sub_21B369718()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_21B369724()
{
  return MEMORY[0x24BE9EAF8]();
}

uint64_t sub_21B369730()
{
  return MEMORY[0x24BE9EB00]();
}

uint64_t sub_21B36973C()
{
  return MEMORY[0x24BE9EB10]();
}

uint64_t sub_21B369748()
{
  return MEMORY[0x24BE9EB20]();
}

uint64_t sub_21B369754()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_21B369760()
{
  return MEMORY[0x24BE9EDC0]();
}

uint64_t sub_21B36976C()
{
  return MEMORY[0x24BE9EDE8]();
}

uint64_t sub_21B369778()
{
  return MEMORY[0x24BE9EE30]();
}

uint64_t sub_21B369784()
{
  return MEMORY[0x24BE9EE38]();
}

uint64_t sub_21B369790()
{
  return MEMORY[0x24BE9EE40]();
}

uint64_t sub_21B36979C()
{
  return MEMORY[0x24BE9EE48]();
}

uint64_t sub_21B3697A8()
{
  return MEMORY[0x24BE9EE58]();
}

uint64_t sub_21B3697B4()
{
  return MEMORY[0x24BE9EE60]();
}

uint64_t sub_21B3697C0()
{
  return MEMORY[0x24BE9EED0]();
}

uint64_t sub_21B3697CC()
{
  return MEMORY[0x24BE9EEE8]();
}

uint64_t sub_21B3697D8()
{
  return MEMORY[0x24BE9EEF0]();
}

uint64_t sub_21B3697E4()
{
  return MEMORY[0x24BE9EEF8]();
}

uint64_t sub_21B3697F0()
{
  return MEMORY[0x24BE9EF00]();
}

uint64_t sub_21B3697FC()
{
  return MEMORY[0x24BE9EF08]();
}

uint64_t sub_21B369808()
{
  return MEMORY[0x24BE9EF18]();
}

uint64_t sub_21B369814()
{
  return MEMORY[0x24BE9EF20]();
}

uint64_t sub_21B369820()
{
  return MEMORY[0x24BE9F6F8]();
}

uint64_t sub_21B36982C()
{
  return MEMORY[0x24BE9F700]();
}

uint64_t sub_21B369838()
{
  return MEMORY[0x24BE9F710]();
}

uint64_t sub_21B369844()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_21B369850()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_21B36985C()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_21B369868()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_21B369874()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_21B369880()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_21B36988C()
{
  return MEMORY[0x24BE9FA18]();
}

uint64_t sub_21B369898()
{
  return MEMORY[0x24BE9FAB0]();
}

uint64_t sub_21B3698A4()
{
  return MEMORY[0x24BE9FAB8]();
}

uint64_t sub_21B3698B0()
{
  return MEMORY[0x24BE9FAC0]();
}

uint64_t sub_21B3698BC()
{
  return MEMORY[0x24BE9FAC8]();
}

uint64_t sub_21B3698C8()
{
  return MEMORY[0x24BE9FAD0]();
}

uint64_t sub_21B3698D4()
{
  return MEMORY[0x24BE9FB18]();
}

uint64_t sub_21B3698E0()
{
  return MEMORY[0x24BE9FB30]();
}

uint64_t sub_21B3698EC()
{
  return MEMORY[0x24BE9FB48]();
}

uint64_t sub_21B3698F8()
{
  return MEMORY[0x24BE9FB60]();
}

uint64_t sub_21B369904()
{
  return MEMORY[0x24BE9FB68]();
}

uint64_t sub_21B369910()
{
  return MEMORY[0x24BE9FB70]();
}

uint64_t sub_21B36991C()
{
  return MEMORY[0x24BE9FB78]();
}

uint64_t sub_21B369928()
{
  return MEMORY[0x24BE9FB80]();
}

uint64_t sub_21B369934()
{
  return MEMORY[0x24BE93088]();
}

uint64_t sub_21B369940()
{
  return MEMORY[0x24BE9FB88]();
}

uint64_t sub_21B36994C()
{
  return MEMORY[0x24BE9FB90]();
}

uint64_t sub_21B369958()
{
  return MEMORY[0x24BE9FB98]();
}

uint64_t sub_21B369964()
{
  return MEMORY[0x24BE9FBA0]();
}

uint64_t sub_21B369970()
{
  return MEMORY[0x24BE9FBA8]();
}

uint64_t sub_21B36997C()
{
  return MEMORY[0x24BE9FBB0]();
}

uint64_t sub_21B369988()
{
  return MEMORY[0x24BE9FBC0]();
}

uint64_t sub_21B369994()
{
  return MEMORY[0x24BE9FBF0]();
}

uint64_t sub_21B3699A0()
{
  return MEMORY[0x24BE9FBF8]();
}

uint64_t sub_21B3699AC()
{
  return MEMORY[0x24BE9FC30]();
}

uint64_t sub_21B3699B8()
{
  return MEMORY[0x24BE9FCB8]();
}

uint64_t sub_21B3699C4()
{
  return MEMORY[0x24BE9FCD0]();
}

uint64_t sub_21B3699D0()
{
  return MEMORY[0x24BE9FCF8]();
}

uint64_t sub_21B3699DC()
{
  return MEMORY[0x24BE9FD10]();
}

uint64_t sub_21B3699E8()
{
  return MEMORY[0x24BE9FD20]();
}

uint64_t sub_21B3699F4()
{
  return MEMORY[0x24BE9FD28]();
}

uint64_t sub_21B369A00()
{
  return MEMORY[0x24BE9FDA8]();
}

uint64_t sub_21B369A0C()
{
  return MEMORY[0x24BE9FE40]();
}

uint64_t sub_21B369A18()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t sub_21B369A24()
{
  return MEMORY[0x24BE9FE60]();
}

uint64_t sub_21B369A30()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_21B369A3C()
{
  return MEMORY[0x24BE9FE88]();
}

uint64_t sub_21B369A48()
{
  return MEMORY[0x24BE9FEA0]();
}

uint64_t sub_21B369A54()
{
  return MEMORY[0x24BE9FEE8]();
}

uint64_t sub_21B369A60()
{
  return MEMORY[0x24BE93098]();
}

uint64_t sub_21B369A6C()
{
  return MEMORY[0x24BE9FEF0]();
}

uint64_t sub_21B369A78()
{
  return MEMORY[0x24BE9FEF8]();
}

uint64_t sub_21B369A84()
{
  return MEMORY[0x24BE9FF08]();
}

uint64_t sub_21B369A90()
{
  return MEMORY[0x24BE9FF10]();
}

uint64_t sub_21B369A9C()
{
  return MEMORY[0x24BE9FF28]();
}

uint64_t sub_21B369AA8()
{
  return MEMORY[0x24BE9FF38]();
}

uint64_t sub_21B369AB4()
{
  return MEMORY[0x24BE9FF40]();
}

uint64_t sub_21B369AC0()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_21B369ACC()
{
  return MEMORY[0x24BE9FF70]();
}

uint64_t sub_21B369AD8()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_21B369AE4()
{
  return MEMORY[0x24BE9FFA0]();
}

uint64_t sub_21B369AF0()
{
  return MEMORY[0x24BE9FFB0]();
}

uint64_t sub_21B369AFC()
{
  return MEMORY[0x24BE9FFD0]();
}

uint64_t sub_21B369B08()
{
  return MEMORY[0x24BE9FFD8]();
}

uint64_t sub_21B369B14()
{
  return MEMORY[0x24BEA00A8]();
}

uint64_t sub_21B369B20()
{
  return MEMORY[0x24BEA00B8]();
}

uint64_t sub_21B369B2C()
{
  return MEMORY[0x24BEA00D8]();
}

uint64_t sub_21B369B38()
{
  return MEMORY[0x24BEA0148]();
}

uint64_t sub_21B369B44()
{
  return MEMORY[0x24BEA0150]();
}

uint64_t sub_21B369B50()
{
  return MEMORY[0x24BEA0168]();
}

uint64_t sub_21B369B5C()
{
  return MEMORY[0x24BEA0170]();
}

uint64_t sub_21B369B68()
{
  return MEMORY[0x24BEA0180]();
}

uint64_t sub_21B369B74()
{
  return MEMORY[0x24BEA0188]();
}

uint64_t sub_21B369B80()
{
  return MEMORY[0x24BEA0190]();
}

uint64_t sub_21B369B8C()
{
  return MEMORY[0x24BEA0198]();
}

uint64_t sub_21B369B98()
{
  return MEMORY[0x24BEA01A8]();
}

uint64_t sub_21B369BA4()
{
  return MEMORY[0x24BEA01F0]();
}

uint64_t sub_21B369BB0()
{
  return MEMORY[0x24BEA01F8]();
}

uint64_t sub_21B369BBC()
{
  return MEMORY[0x24BEA0250]();
}

uint64_t sub_21B369BC8()
{
  return MEMORY[0x24BEA0258]();
}

uint64_t sub_21B369BD4()
{
  return MEMORY[0x24BEA0260]();
}

uint64_t sub_21B369BE0()
{
  return MEMORY[0x24BEA0268]();
}

uint64_t sub_21B369BEC()
{
  return MEMORY[0x24BEA0270]();
}

uint64_t sub_21B369BF8()
{
  return MEMORY[0x24BEA0278]();
}

uint64_t sub_21B369C04()
{
  return MEMORY[0x24BE930C0]();
}

uint64_t sub_21B369C10()
{
  return MEMORY[0x24BEA04C0]();
}

uint64_t sub_21B369C1C()
{
  return MEMORY[0x24BEA04D8]();
}

uint64_t sub_21B369C28()
{
  return MEMORY[0x24BEA04E8]();
}

uint64_t sub_21B369C34()
{
  return MEMORY[0x24BEA0510]();
}

uint64_t sub_21B369C40()
{
  return MEMORY[0x24BEA0658]();
}

uint64_t sub_21B369C4C()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_21B369C58()
{
  return MEMORY[0x24BEA06A0]();
}

uint64_t sub_21B369C64()
{
  return MEMORY[0x24BEA06A8]();
}

uint64_t sub_21B369C70()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_21B369C7C()
{
  return MEMORY[0x24BE930C8]();
}

uint64_t sub_21B369C88()
{
  return MEMORY[0x24BEA07B0]();
}

uint64_t sub_21B369C94()
{
  return MEMORY[0x24BEA07B8]();
}

uint64_t sub_21B369CA0()
{
  return MEMORY[0x24BEA07C0]();
}

uint64_t sub_21B369CAC()
{
  return MEMORY[0x24BEA07C8]();
}

uint64_t sub_21B369CB8()
{
  return MEMORY[0x24BEA07D0]();
}

uint64_t sub_21B369CC4()
{
  return MEMORY[0x24BEA07D8]();
}

uint64_t sub_21B369CD0()
{
  return MEMORY[0x24BEA07E0]();
}

uint64_t sub_21B369CDC()
{
  return MEMORY[0x24BEA07E8]();
}

uint64_t sub_21B369CE8()
{
  return MEMORY[0x24BEA07F0]();
}

uint64_t sub_21B369CF4()
{
  return MEMORY[0x24BEA0900]();
}

uint64_t sub_21B369D00()
{
  return MEMORY[0x24BEA0908]();
}

uint64_t sub_21B369D0C()
{
  return MEMORY[0x24BEA0910]();
}

uint64_t sub_21B369D18()
{
  return MEMORY[0x24BEA0918]();
}

uint64_t sub_21B369D24()
{
  return MEMORY[0x24BEA0920]();
}

uint64_t sub_21B369D30()
{
  return MEMORY[0x24BEA0928]();
}

uint64_t sub_21B369D3C()
{
  return MEMORY[0x24BEA0930]();
}

uint64_t sub_21B369D48()
{
  return MEMORY[0x24BEA0938]();
}

uint64_t sub_21B369D54()
{
  return MEMORY[0x24BEA0940]();
}

uint64_t sub_21B369D60()
{
  return MEMORY[0x24BEA0948]();
}

uint64_t sub_21B369D6C()
{
  return MEMORY[0x24BEA0968]();
}

uint64_t sub_21B369D78()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_21B369D84()
{
  return MEMORY[0x24BEA0A98]();
}

uint64_t sub_21B369D90()
{
  return MEMORY[0x24BEA0AA0]();
}

uint64_t sub_21B369D9C()
{
  return MEMORY[0x24BEA0AB0]();
}

uint64_t sub_21B369DA8()
{
  return MEMORY[0x24BEA0B18]();
}

uint64_t sub_21B369DB4()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_21B369DC0()
{
  return MEMORY[0x24BEA0BA0]();
}

uint64_t sub_21B369DCC()
{
  return MEMORY[0x24BEA0C18]();
}

uint64_t sub_21B369DD8()
{
  return MEMORY[0x24BEA0C60]();
}

uint64_t sub_21B369DE4()
{
  return MEMORY[0x24BEA0CF8]();
}

uint64_t sub_21B369DF0()
{
  return MEMORY[0x24BEA0D28]();
}

uint64_t sub_21B369DFC()
{
  return MEMORY[0x24BEA0D80]();
}

uint64_t sub_21B369E08()
{
  return MEMORY[0x24BEA0D88]();
}

uint64_t sub_21B369E14()
{
  return MEMORY[0x24BEA0D90]();
}

uint64_t sub_21B369E20()
{
  return MEMORY[0x24BEA0DE0]();
}

uint64_t sub_21B369E2C()
{
  return MEMORY[0x24BEA0DE8]();
}

uint64_t sub_21B369E38()
{
  return MEMORY[0x24BEA0DF0]();
}

uint64_t sub_21B369E44()
{
  return MEMORY[0x24BEA0DF8]();
}

uint64_t sub_21B369E50()
{
  return MEMORY[0x24BEA0E00]();
}

uint64_t sub_21B369E5C()
{
  return MEMORY[0x24BEA0F58]();
}

uint64_t sub_21B369E68()
{
  return MEMORY[0x24BEA10A8]();
}

uint64_t sub_21B369E74()
{
  return MEMORY[0x24BEA10B0]();
}

uint64_t sub_21B369E80()
{
  return MEMORY[0x24BEA10B8]();
}

uint64_t sub_21B369E8C()
{
  return MEMORY[0x24BEA10C0]();
}

uint64_t sub_21B369E98()
{
  return MEMORY[0x24BEA10C8]();
}

uint64_t sub_21B369EA4()
{
  return MEMORY[0x24BEA10D0]();
}

uint64_t sub_21B369EB0()
{
  return MEMORY[0x24BEA10D8]();
}

uint64_t sub_21B369EBC()
{
  return MEMORY[0x24BEA10E0]();
}

uint64_t sub_21B369EC8()
{
  return MEMORY[0x24BEA10E8]();
}

uint64_t sub_21B369ED4()
{
  return MEMORY[0x24BEA12B8]();
}

uint64_t sub_21B369EE0()
{
  return MEMORY[0x24BEA12C0]();
}

uint64_t sub_21B369EEC()
{
  return MEMORY[0x24BEA12C8]();
}

uint64_t sub_21B369EF8()
{
  return MEMORY[0x24BEA12D0]();
}

uint64_t sub_21B369F04()
{
  return MEMORY[0x24BEA12D8]();
}

uint64_t sub_21B369F10()
{
  return MEMORY[0x24BEA12E0]();
}

uint64_t sub_21B369F1C()
{
  return MEMORY[0x24BEA1410]();
}

uint64_t sub_21B369F28()
{
  return MEMORY[0x24BEA14E0]();
}

uint64_t sub_21B369F34()
{
  return MEMORY[0x24BEA1508]();
}

uint64_t sub_21B369F40()
{
  return MEMORY[0x24BEA1510]();
}

uint64_t sub_21B369F4C()
{
  return MEMORY[0x24BE930D0]();
}

uint64_t sub_21B369F58()
{
  return MEMORY[0x24BEA1798]();
}

uint64_t sub_21B369F64()
{
  return MEMORY[0x24BEA17A0]();
}

uint64_t sub_21B369F70()
{
  return MEMORY[0x24BEA17A8]();
}

uint64_t sub_21B369F7C()
{
  return MEMORY[0x24BEA17B0]();
}

uint64_t sub_21B369F88()
{
  return MEMORY[0x24BEA17B8]();
}

uint64_t sub_21B369F94()
{
  return MEMORY[0x24BEA17D0]();
}

uint64_t sub_21B369FA0()
{
  return MEMORY[0x24BEA17F0]();
}

uint64_t sub_21B369FAC()
{
  return MEMORY[0x24BEA1808]();
}

uint64_t sub_21B369FB8()
{
  return MEMORY[0x24BEA18A0]();
}

uint64_t sub_21B369FC4()
{
  return MEMORY[0x24BEA18A8]();
}

uint64_t sub_21B369FD0()
{
  return MEMORY[0x24BEA18C0]();
}

uint64_t sub_21B369FDC()
{
  return MEMORY[0x24BEA18E8]();
}

uint64_t sub_21B369FE8()
{
  return MEMORY[0x24BEA1910]();
}

uint64_t sub_21B369FF4()
{
  return MEMORY[0x24BEA1918]();
}

uint64_t sub_21B36A000()
{
  return MEMORY[0x24BEA1B58]();
}

uint64_t sub_21B36A00C()
{
  return MEMORY[0x24BEA1B60]();
}

uint64_t sub_21B36A018()
{
  return MEMORY[0x24BEA1B68]();
}

uint64_t sub_21B36A024()
{
  return MEMORY[0x24BEA1B90]();
}

uint64_t sub_21B36A030()
{
  return MEMORY[0x24BEA1BA8]();
}

uint64_t sub_21B36A03C()
{
  return MEMORY[0x24BEA1BC0]();
}

uint64_t sub_21B36A048()
{
  return MEMORY[0x24BEA1BC8]();
}

uint64_t sub_21B36A054()
{
  return MEMORY[0x24BEA1C28]();
}

uint64_t sub_21B36A060()
{
  return MEMORY[0x24BEA1C68]();
}

uint64_t sub_21B36A06C()
{
  return MEMORY[0x24BEA1CD8]();
}

uint64_t sub_21B36A078()
{
  return MEMORY[0x24BEA1D20]();
}

uint64_t sub_21B36A084()
{
  return MEMORY[0x24BEA1D28]();
}

uint64_t sub_21B36A090()
{
  return MEMORY[0x24BEA1D98]();
}

uint64_t sub_21B36A09C()
{
  return MEMORY[0x24BEA1DA0]();
}

uint64_t sub_21B36A0A8()
{
  return MEMORY[0x24BEA1DA8]();
}

uint64_t sub_21B36A0B4()
{
  return MEMORY[0x24BEA1DB0]();
}

uint64_t sub_21B36A0C0()
{
  return MEMORY[0x24BEA1DB8]();
}

uint64_t sub_21B36A0CC()
{
  return MEMORY[0x24BEA1DC0]();
}

uint64_t sub_21B36A0D8()
{
  return MEMORY[0x24BEA1ED0]();
}

uint64_t sub_21B36A0E4()
{
  return MEMORY[0x24BEA1ED8]();
}

uint64_t sub_21B36A0F0()
{
  return MEMORY[0x24BEA1F78]();
}

uint64_t sub_21B36A0FC()
{
  return MEMORY[0x24BEA1F80]();
}

uint64_t sub_21B36A108()
{
  return MEMORY[0x24BEA1F88]();
}

uint64_t sub_21B36A114()
{
  return MEMORY[0x24BEA1FB0]();
}

uint64_t sub_21B36A120()
{
  return MEMORY[0x24BEA2000]();
}

uint64_t sub_21B36A12C()
{
  return MEMORY[0x24BEA2038]();
}

uint64_t sub_21B36A138()
{
  return MEMORY[0x24BEA2050]();
}

uint64_t sub_21B36A144()
{
  return MEMORY[0x24BEA2060]();
}

uint64_t sub_21B36A150()
{
  return MEMORY[0x24BEA2068]();
}

uint64_t sub_21B36A15C()
{
  return MEMORY[0x24BEA2120]();
}

uint64_t sub_21B36A168()
{
  return MEMORY[0x24BEA2140]();
}

uint64_t sub_21B36A174()
{
  return MEMORY[0x24BEA21D8]();
}

uint64_t sub_21B36A180()
{
  return MEMORY[0x24BEA2210]();
}

uint64_t sub_21B36A18C()
{
  return MEMORY[0x24BEA2218]();
}

uint64_t sub_21B36A198()
{
  return MEMORY[0x24BEA2260]();
}

uint64_t sub_21B36A1A4()
{
  return MEMORY[0x24BEA22B0]();
}

uint64_t sub_21B36A1B0()
{
  return MEMORY[0x24BEA22E0]();
}

uint64_t sub_21B36A1BC()
{
  return MEMORY[0x24BEA22F8]();
}

uint64_t sub_21B36A1C8()
{
  return MEMORY[0x24BEA2320]();
}

uint64_t sub_21B36A1D4()
{
  return MEMORY[0x24BEA2328]();
}

uint64_t sub_21B36A1E0()
{
  return MEMORY[0x24BEA2370]();
}

uint64_t sub_21B36A1EC()
{
  return MEMORY[0x24BEA2380]();
}

uint64_t sub_21B36A1F8()
{
  return MEMORY[0x24BEA2388]();
}

uint64_t sub_21B36A204()
{
  return MEMORY[0x24BE930F0]();
}

uint64_t sub_21B36A210()
{
  return MEMORY[0x24BEA24D8]();
}

uint64_t sub_21B36A21C()
{
  return MEMORY[0x24BEA24E0]();
}

uint64_t sub_21B36A228()
{
  return MEMORY[0x24BEA24F0]();
}

uint64_t sub_21B36A234()
{
  return MEMORY[0x24BEA24F8]();
}

uint64_t sub_21B36A240()
{
  return MEMORY[0x24BEA2510]();
}

uint64_t sub_21B36A24C()
{
  return MEMORY[0x24BEA2548]();
}

uint64_t sub_21B36A258()
{
  return MEMORY[0x24BEA2760]();
}

uint64_t sub_21B36A264()
{
  return MEMORY[0x24BEA2770]();
}

uint64_t sub_21B36A270()
{
  return MEMORY[0x24BEA27E8]();
}

uint64_t sub_21B36A27C()
{
  return MEMORY[0x24BEA27F0]();
}

uint64_t sub_21B36A288()
{
  return MEMORY[0x24BEA2800]();
}

uint64_t sub_21B36A294()
{
  return MEMORY[0x24BEA2810]();
}

uint64_t sub_21B36A2A0()
{
  return MEMORY[0x24BEA2818]();
}

uint64_t sub_21B36A2AC()
{
  return MEMORY[0x24BEA2890]();
}

uint64_t sub_21B36A2B8()
{
  return MEMORY[0x24BEA2898]();
}

uint64_t sub_21B36A2C4()
{
  return MEMORY[0x24BEA28A0]();
}

uint64_t sub_21B36A2D0()
{
  return MEMORY[0x24BEA28A8]();
}

uint64_t sub_21B36A2DC()
{
  return MEMORY[0x24BEA29B8]();
}

uint64_t sub_21B36A2E8()
{
  return MEMORY[0x24BEA29C0]();
}

uint64_t sub_21B36A2F4()
{
  return MEMORY[0x24BEA2BC8]();
}

uint64_t sub_21B36A300()
{
  return MEMORY[0x24BEA2BE0]();
}

uint64_t sub_21B36A30C()
{
  return MEMORY[0x24BEA2BE8]();
}

uint64_t sub_21B36A318()
{
  return MEMORY[0x24BEA2BF0]();
}

uint64_t sub_21B36A324()
{
  return MEMORY[0x24BEA2C08]();
}

uint64_t sub_21B36A330()
{
  return MEMORY[0x24BEA2C50]();
}

uint64_t sub_21B36A33C()
{
  return MEMORY[0x24BEA2C58]();
}

uint64_t sub_21B36A348()
{
  return MEMORY[0x24BEA2C70]();
}

uint64_t sub_21B36A354()
{
  return MEMORY[0x24BEA2C78]();
}

uint64_t sub_21B36A360()
{
  return MEMORY[0x24BEA2C90]();
}

uint64_t sub_21B36A36C()
{
  return MEMORY[0x24BEA2C98]();
}

uint64_t sub_21B36A378()
{
  return MEMORY[0x24BEA2CB0]();
}

uint64_t sub_21B36A384()
{
  return MEMORY[0x24BEA2D08]();
}

uint64_t sub_21B36A390()
{
  return MEMORY[0x24BEA2D50]();
}

uint64_t sub_21B36A39C()
{
  return MEMORY[0x24BEA2D58]();
}

uint64_t sub_21B36A3A8()
{
  return MEMORY[0x24BEA2E20]();
}

uint64_t sub_21B36A3B4()
{
  return MEMORY[0x24BEA2E28]();
}

uint64_t sub_21B36A3C0()
{
  return MEMORY[0x24BEA2EF0]();
}

uint64_t sub_21B36A3CC()
{
  return MEMORY[0x24BEA2F00]();
}

uint64_t sub_21B36A3D8()
{
  return MEMORY[0x24BEA2F08]();
}

uint64_t sub_21B36A3E4()
{
  return MEMORY[0x24BEA2FE8]();
}

uint64_t sub_21B36A3F0()
{
  return MEMORY[0x24BEA2FF0]();
}

uint64_t sub_21B36A3FC()
{
  return MEMORY[0x24BEA3020]();
}

uint64_t sub_21B36A408()
{
  return MEMORY[0x24BEA3028]();
}

uint64_t sub_21B36A414()
{
  return MEMORY[0x24BEA30A8]();
}

uint64_t sub_21B36A420()
{
  return MEMORY[0x24BEA30B0]();
}

uint64_t sub_21B36A42C()
{
  return MEMORY[0x24BEA30B8]();
}

uint64_t sub_21B36A438()
{
  return MEMORY[0x24BEA3168]();
}

uint64_t sub_21B36A444()
{
  return MEMORY[0x24BEA3170]();
}

uint64_t sub_21B36A450()
{
  return MEMORY[0x24BEA3258]();
}

uint64_t sub_21B36A45C()
{
  return MEMORY[0x24BEA34B8]();
}

uint64_t sub_21B36A468()
{
  return MEMORY[0x24BEA34C0]();
}

uint64_t sub_21B36A474()
{
  return MEMORY[0x24BEA34C8]();
}

uint64_t sub_21B36A480()
{
  return MEMORY[0x24BEA34D0]();
}

uint64_t sub_21B36A48C()
{
  return MEMORY[0x24BEA34D8]();
}

uint64_t sub_21B36A498()
{
  return MEMORY[0x24BEA34E0]();
}

uint64_t sub_21B36A4A4()
{
  return MEMORY[0x24BEA3520]();
}

uint64_t sub_21B36A4B0()
{
  return MEMORY[0x24BEA3538]();
}

uint64_t sub_21B36A4BC()
{
  return MEMORY[0x24BEA3550]();
}

uint64_t sub_21B36A4C8()
{
  return MEMORY[0x24BEA3570]();
}

uint64_t sub_21B36A4D4()
{
  return MEMORY[0x24BEA3588]();
}

uint64_t sub_21B36A4E0()
{
  return MEMORY[0x24BEA3598]();
}

uint64_t sub_21B36A4EC()
{
  return MEMORY[0x24BEA35B0]();
}

uint64_t sub_21B36A4F8()
{
  return MEMORY[0x24BEA35B8]();
}

uint64_t sub_21B36A504()
{
  return MEMORY[0x24BEA35C8]();
}

uint64_t sub_21B36A510()
{
  return MEMORY[0x24BEA35D8]();
}

uint64_t sub_21B36A51C()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_21B36A528()
{
  return MEMORY[0x24BEA3640]();
}

uint64_t sub_21B36A534()
{
  return MEMORY[0x24BEA3670]();
}

uint64_t sub_21B36A540()
{
  return MEMORY[0x24BEA3678]();
}

uint64_t sub_21B36A54C()
{
  return MEMORY[0x24BEA3680]();
}

uint64_t sub_21B36A558()
{
  return MEMORY[0x24BEA3698]();
}

uint64_t sub_21B36A564()
{
  return MEMORY[0x24BEA36A0]();
}

uint64_t sub_21B36A570()
{
  return MEMORY[0x24BEA36A8]();
}

uint64_t sub_21B36A57C()
{
  return MEMORY[0x24BEA36B0]();
}

uint64_t sub_21B36A588()
{
  return MEMORY[0x24BEA36B8]();
}

uint64_t sub_21B36A594()
{
  return MEMORY[0x24BEA36C0]();
}

uint64_t sub_21B36A5A0()
{
  return MEMORY[0x24BEA36C8]();
}

uint64_t sub_21B36A5AC()
{
  return MEMORY[0x24BEA36D0]();
}

uint64_t sub_21B36A5B8()
{
  return MEMORY[0x24BEA36D8]();
}

uint64_t sub_21B36A5C4()
{
  return MEMORY[0x24BEA36E0]();
}

uint64_t sub_21B36A5D0()
{
  return MEMORY[0x24BEA36E8]();
}

uint64_t sub_21B36A5DC()
{
  return MEMORY[0x24BEA36F0]();
}

uint64_t sub_21B36A5E8()
{
  return MEMORY[0x24BEA36F8]();
}

uint64_t sub_21B36A5F4()
{
  return MEMORY[0x24BEA3700]();
}

uint64_t sub_21B36A600()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_21B36A60C()
{
  return MEMORY[0x24BEA3818]();
}

uint64_t sub_21B36A618()
{
  return MEMORY[0x24BE93130]();
}

uint64_t sub_21B36A624()
{
  return MEMORY[0x24BE93260]();
}

uint64_t sub_21B36A630()
{
  return MEMORY[0x24BE93268]();
}

uint64_t sub_21B36A63C()
{
  return MEMORY[0x24BE93270]();
}

uint64_t sub_21B36A648()
{
  return MEMORY[0x24BE93350]();
}

uint64_t sub_21B36A654()
{
  return MEMORY[0x24BE93358]();
}

uint64_t sub_21B36A660()
{
  return MEMORY[0x24BE93368]();
}

uint64_t sub_21B36A66C()
{
  return MEMORY[0x24BE93378]();
}

uint64_t sub_21B36A678()
{
  return MEMORY[0x24BE93388]();
}

uint64_t sub_21B36A684()
{
  return MEMORY[0x24BE933C0]();
}

uint64_t sub_21B36A690()
{
  return MEMORY[0x24BE933D0]();
}

uint64_t sub_21B36A69C()
{
  return MEMORY[0x24BE933E8]();
}

uint64_t sub_21B36A6A8()
{
  return MEMORY[0x24BE933F8]();
}

uint64_t sub_21B36A6B4()
{
  return MEMORY[0x24BE93400]();
}

uint64_t sub_21B36A6C0()
{
  return MEMORY[0x24BE93410]();
}

uint64_t sub_21B36A6CC()
{
  return MEMORY[0x24BE93420]();
}

uint64_t sub_21B36A6D8()
{
  return MEMORY[0x24BE93430]();
}

uint64_t sub_21B36A6E4()
{
  return MEMORY[0x24BE93440]();
}

uint64_t sub_21B36A6F0()
{
  return MEMORY[0x24BE93450]();
}

uint64_t sub_21B36A6FC()
{
  return MEMORY[0x24BE93478]();
}

uint64_t sub_21B36A708()
{
  return MEMORY[0x24BE93488]();
}

uint64_t sub_21B36A714()
{
  return MEMORY[0x24BE93490]();
}

uint64_t sub_21B36A720()
{
  return MEMORY[0x24BE93498]();
}

uint64_t sub_21B36A72C()
{
  return MEMORY[0x24BE934A0]();
}

uint64_t sub_21B36A738()
{
  return MEMORY[0x24BE934A8]();
}

uint64_t sub_21B36A744()
{
  return MEMORY[0x24BE934B0]();
}

uint64_t sub_21B36A750()
{
  return MEMORY[0x24BE934B8]();
}

uint64_t sub_21B36A75C()
{
  return MEMORY[0x24BE934C0]();
}

uint64_t sub_21B36A768()
{
  return MEMORY[0x24BE934D8]();
}

uint64_t sub_21B36A774()
{
  return MEMORY[0x24BE934E8]();
}

uint64_t sub_21B36A780()
{
  return MEMORY[0x24BE934F8]();
}

uint64_t sub_21B36A78C()
{
  return MEMORY[0x24BE93508]();
}

uint64_t sub_21B36A798()
{
  return MEMORY[0x24BE93518]();
}

uint64_t sub_21B36A7A4()
{
  return MEMORY[0x24BE93528]();
}

uint64_t sub_21B36A7B0()
{
  return MEMORY[0x24BE93538]();
}

uint64_t sub_21B36A7BC()
{
  return MEMORY[0x24BE93548]();
}

uint64_t sub_21B36A7C8()
{
  return MEMORY[0x24BE93550]();
}

uint64_t sub_21B36A7D4()
{
  return MEMORY[0x24BE93560]();
}

uint64_t sub_21B36A7E0()
{
  return MEMORY[0x24BE93620]();
}

uint64_t sub_21B36A7EC()
{
  return MEMORY[0x24BE93630]();
}

uint64_t sub_21B36A7F8()
{
  return MEMORY[0x24BE93640]();
}

uint64_t sub_21B36A804()
{
  return MEMORY[0x24BE93648]();
}

uint64_t sub_21B36A810()
{
  return MEMORY[0x24BE93690]();
}

uint64_t sub_21B36A81C()
{
  return MEMORY[0x24BE93708]();
}

uint64_t sub_21B36A828()
{
  return MEMORY[0x24BE93710]();
}

uint64_t sub_21B36A834()
{
  return MEMORY[0x24BE93720]();
}

uint64_t sub_21B36A840()
{
  return MEMORY[0x24BE93750]();
}

uint64_t sub_21B36A84C()
{
  return MEMORY[0x24BE93760]();
}

uint64_t sub_21B36A858()
{
  return MEMORY[0x24BE93778]();
}

uint64_t sub_21B36A864()
{
  return MEMORY[0x24BE93780]();
}

uint64_t sub_21B36A870()
{
  return MEMORY[0x24BE93790]();
}

uint64_t sub_21B36A87C()
{
  return MEMORY[0x24BE937A0]();
}

uint64_t sub_21B36A888()
{
  return MEMORY[0x24BE937B8]();
}

uint64_t sub_21B36A894()
{
  return MEMORY[0x24BE937D8]();
}

uint64_t sub_21B36A8A0()
{
  return MEMORY[0x24BE937E8]();
}

uint64_t sub_21B36A8AC()
{
  return MEMORY[0x24BE937F0]();
}

uint64_t sub_21B36A8B8()
{
  return MEMORY[0x24BE937F8]();
}

uint64_t sub_21B36A8C4()
{
  return MEMORY[0x24BE93810]();
}

uint64_t sub_21B36A8D0()
{
  return MEMORY[0x24BE93818]();
}

uint64_t sub_21B36A8DC()
{
  return MEMORY[0x24BE93820]();
}

uint64_t sub_21B36A8E8()
{
  return MEMORY[0x24BE93880]();
}

uint64_t sub_21B36A8F4()
{
  return MEMORY[0x24BE93890]();
}

uint64_t sub_21B36A900()
{
  return MEMORY[0x24BE938A0]();
}

uint64_t sub_21B36A90C()
{
  return MEMORY[0x24BE938E0]();
}

uint64_t sub_21B36A918()
{
  return MEMORY[0x24BE938F0]();
}

uint64_t sub_21B36A924()
{
  return MEMORY[0x24BE93900]();
}

uint64_t sub_21B36A930()
{
  return MEMORY[0x24BE93908]();
}

uint64_t sub_21B36A93C()
{
  return MEMORY[0x24BE93910]();
}

uint64_t sub_21B36A948()
{
  return MEMORY[0x24BE93918]();
}

uint64_t sub_21B36A954()
{
  return MEMORY[0x24BE93928]();
}

uint64_t sub_21B36A960()
{
  return MEMORY[0x24BE93938]();
}

uint64_t sub_21B36A96C()
{
  return MEMORY[0x24BE93978]();
}

uint64_t sub_21B36A978()
{
  return MEMORY[0x24BE93998]();
}

uint64_t sub_21B36A984()
{
  return MEMORY[0x24BE939A0]();
}

uint64_t sub_21B36A990()
{
  return MEMORY[0x24BE939B8]();
}

uint64_t sub_21B36A99C()
{
  return MEMORY[0x24BE939C8]();
}

uint64_t sub_21B36A9A8()
{
  return MEMORY[0x24BE939D0]();
}

uint64_t sub_21B36A9B4()
{
  return MEMORY[0x24BE939E0]();
}

uint64_t sub_21B36A9C0()
{
  return MEMORY[0x24BE939E8]();
}

uint64_t sub_21B36A9CC()
{
  return MEMORY[0x24BE939F0]();
}

uint64_t sub_21B36A9D8()
{
  return MEMORY[0x24BE93A20]();
}

uint64_t sub_21B36A9E4()
{
  return MEMORY[0x24BE93A30]();
}

uint64_t sub_21B36A9F0()
{
  return MEMORY[0x24BE93A40]();
}

uint64_t sub_21B36A9FC()
{
  return MEMORY[0x24BE93A48]();
}

uint64_t sub_21B36AA08()
{
  return MEMORY[0x24BE93A58]();
}

uint64_t sub_21B36AA14()
{
  return MEMORY[0x24BE93A60]();
}

uint64_t sub_21B36AA20()
{
  return MEMORY[0x24BE93A68]();
}

uint64_t sub_21B36AA2C()
{
  return MEMORY[0x24BE93A70]();
}

uint64_t sub_21B36AA38()
{
  return MEMORY[0x24BE93AB0]();
}

uint64_t sub_21B36AA44()
{
  return MEMORY[0x24BE93AB8]();
}

uint64_t sub_21B36AA50()
{
  return MEMORY[0x24BE93AC8]();
}

uint64_t sub_21B36AA5C()
{
  return MEMORY[0x24BE93AD8]();
}

uint64_t sub_21B36AA68()
{
  return MEMORY[0x24BE93B00]();
}

uint64_t sub_21B36AA74()
{
  return MEMORY[0x24BE93B10]();
}

uint64_t sub_21B36AA80()
{
  return MEMORY[0x24BE93B48]();
}

uint64_t sub_21B36AA8C()
{
  return MEMORY[0x24BE93B80]();
}

uint64_t sub_21B36AA98()
{
  return MEMORY[0x24BE93B90]();
}

uint64_t sub_21B36AAA4()
{
  return MEMORY[0x24BE93D30]();
}

uint64_t sub_21B36AAB0()
{
  return MEMORY[0x24BE93D40]();
}

uint64_t sub_21B36AABC()
{
  return MEMORY[0x24BE93D48]();
}

uint64_t sub_21B36AAC8()
{
  return MEMORY[0x24BE93D58]();
}

uint64_t sub_21B36AAD4()
{
  return MEMORY[0x24BE93D68]();
}

uint64_t sub_21B36AAE0()
{
  return MEMORY[0x24BE93DD8]();
}

uint64_t sub_21B36AAEC()
{
  return MEMORY[0x24BE93E70]();
}

uint64_t sub_21B36AAF8()
{
  return MEMORY[0x24BE93F78]();
}

uint64_t sub_21B36AB04()
{
  return MEMORY[0x24BE94110]();
}

uint64_t sub_21B36AB10()
{
  return MEMORY[0x24BE941B0]();
}

uint64_t sub_21B36AB1C()
{
  return MEMORY[0x24BE941E0]();
}

uint64_t sub_21B36AB28()
{
  return MEMORY[0x24BE941E8]();
}

uint64_t sub_21B36AB34()
{
  return MEMORY[0x24BE941F0]();
}

uint64_t sub_21B36AB40()
{
  return MEMORY[0x24BE941F8]();
}

uint64_t sub_21B36AB4C()
{
  return MEMORY[0x24BE94200]();
}

uint64_t sub_21B36AB58()
{
  return MEMORY[0x24BE942A8]();
}

uint64_t sub_21B36AB64()
{
  return MEMORY[0x24BE942E0]();
}

uint64_t sub_21B36AB70()
{
  return MEMORY[0x24BE942F0]();
}

uint64_t sub_21B36AB7C()
{
  return MEMORY[0x24BE94378]();
}

uint64_t sub_21B36AB88()
{
  return MEMORY[0x24BE94300]();
}

uint64_t sub_21B36AB94()
{
  return MEMORY[0x24BE94310]();
}

uint64_t sub_21B36ABA0()
{
  return MEMORY[0x24BE94318]();
}

uint64_t sub_21B36ABAC()
{
  return MEMORY[0x24BE94340]();
}

uint64_t sub_21B36ABB8()
{
  return MEMORY[0x24BE94350]();
}

uint64_t sub_21B36ABC4()
{
  return MEMORY[0x24BE94360]();
}

uint64_t sub_21B36ABD0()
{
  return MEMORY[0x24BE990C8]();
}

uint64_t sub_21B36ABDC()
{
  return MEMORY[0x24BE990E0]();
}

uint64_t sub_21B36ABE8()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_21B36ABF4()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_21B36AC00()
{
  return MEMORY[0x24BEA87F8]();
}

uint64_t sub_21B36AC0C()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_21B36AC18()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_21B36AC24()
{
  return MEMORY[0x24BEA8958]();
}

uint64_t sub_21B36AC30()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t sub_21B36AC3C()
{
  return MEMORY[0x24BEA89C8]();
}

uint64_t sub_21B36AC48()
{
  return MEMORY[0x24BEA8A48]();
}

uint64_t sub_21B36AC54()
{
  return MEMORY[0x24BEA8AC0]();
}

uint64_t sub_21B36AC60()
{
  return MEMORY[0x24BEA8AD8]();
}

uint64_t sub_21B36AC6C()
{
  return MEMORY[0x24BEA8AE0]();
}

uint64_t sub_21B36AC78()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t sub_21B36AC84()
{
  return MEMORY[0x24BEA8D80]();
}

uint64_t sub_21B36AC90()
{
  return MEMORY[0x24BEA8D98]();
}

uint64_t sub_21B36AC9C()
{
  return MEMORY[0x24BEA8DA8]();
}

uint64_t sub_21B36ACA8()
{
  return MEMORY[0x24BEA7958]();
}

uint64_t sub_21B36ACB4()
{
  return MEMORY[0x24BEA7970]();
}

uint64_t sub_21B36ACC0()
{
  return MEMORY[0x24BEA7980]();
}

uint64_t sub_21B36ACCC()
{
  return MEMORY[0x24BEA7988]();
}

uint64_t sub_21B36ACD8()
{
  return MEMORY[0x24BEA7990]();
}

uint64_t sub_21B36ACE4()
{
  return MEMORY[0x24BEA7998]();
}

uint64_t sub_21B36ACF0()
{
  return MEMORY[0x24BE920B8]();
}

uint64_t sub_21B36ACFC()
{
  return MEMORY[0x24BE920C0]();
}

uint64_t sub_21B36AD08()
{
  return MEMORY[0x24BE920C8]();
}

uint64_t sub_21B36AD14()
{
  return MEMORY[0x24BE920D0]();
}

uint64_t sub_21B36AD20()
{
  return MEMORY[0x24BE920D8]();
}

uint64_t sub_21B36AD2C()
{
  return MEMORY[0x24BE920E0]();
}

uint64_t sub_21B36AD38()
{
  return MEMORY[0x24BE92250]();
}

uint64_t sub_21B36AD44()
{
  return MEMORY[0x24BE92260]();
}

uint64_t sub_21B36AD50()
{
  return MEMORY[0x24BE92268]();
}

uint64_t sub_21B36AD5C()
{
  return MEMORY[0x24BE92270]();
}

uint64_t sub_21B36AD68()
{
  return MEMORY[0x24BE92280]();
}

uint64_t sub_21B36AD74()
{
  return MEMORY[0x24BE92290]();
}

uint64_t sub_21B36AD80()
{
  return MEMORY[0x24BE922A0]();
}

uint64_t sub_21B36AD8C()
{
  return MEMORY[0x24BE922C0]();
}

uint64_t sub_21B36AD98()
{
  return MEMORY[0x24BE922C8]();
}

uint64_t sub_21B36ADA4()
{
  return MEMORY[0x24BE922D0]();
}

uint64_t sub_21B36ADB0()
{
  return MEMORY[0x24BE922E0]();
}

uint64_t sub_21B36ADBC()
{
  return MEMORY[0x24BE922F0]();
}

uint64_t sub_21B36ADC8()
{
  return MEMORY[0x24BE92318]();
}

uint64_t sub_21B36ADD4()
{
  return MEMORY[0x24BE92320]();
}

uint64_t sub_21B36ADE0()
{
  return MEMORY[0x24BE92328]();
}

uint64_t sub_21B36ADEC()
{
  return MEMORY[0x24BE92448]();
}

uint64_t sub_21B36ADF8()
{
  return MEMORY[0x24BE92488]();
}

uint64_t sub_21B36AE04()
{
  return MEMORY[0x24BE92570]();
}

uint64_t sub_21B36AE10()
{
  return MEMORY[0x24BE92588]();
}

uint64_t sub_21B36AE1C()
{
  return MEMORY[0x24BE92668]();
}

uint64_t sub_21B36AE28()
{
  return MEMORY[0x24BE92670]();
}

uint64_t sub_21B36AE34()
{
  return MEMORY[0x24BE92678]();
}

uint64_t sub_21B36AE40()
{
  return MEMORY[0x24BE92680]();
}

uint64_t sub_21B36AE4C()
{
  return MEMORY[0x24BE92690]();
}

uint64_t sub_21B36AE58()
{
  return MEMORY[0x24BE92740]();
}

uint64_t sub_21B36AE64()
{
  return MEMORY[0x24BE92748]();
}

uint64_t sub_21B36AE70()
{
  return MEMORY[0x24BE92750]();
}

uint64_t sub_21B36AE7C()
{
  return MEMORY[0x24BE92760]();
}

uint64_t sub_21B36AE88()
{
  return MEMORY[0x24BE92770]();
}

uint64_t sub_21B36AE94()
{
  return MEMORY[0x24BE92790]();
}

uint64_t sub_21B36AEA0()
{
  return MEMORY[0x24BE92798]();
}

uint64_t sub_21B36AEAC()
{
  return MEMORY[0x24BE927A0]();
}

uint64_t sub_21B36AEB8()
{
  return MEMORY[0x24BE927A8]();
}

uint64_t sub_21B36AEC4()
{
  return MEMORY[0x24BE927B0]();
}

uint64_t sub_21B36AED0()
{
  return MEMORY[0x24BE92860]();
}

uint64_t sub_21B36AEDC()
{
  return MEMORY[0x24BE92888]();
}

uint64_t sub_21B36AEE8()
{
  return MEMORY[0x24BE92898]();
}

uint64_t sub_21B36AEF4()
{
  return MEMORY[0x24BE928B0]();
}

uint64_t sub_21B36AF00()
{
  return MEMORY[0x24BE928B8]();
}

uint64_t sub_21B36AF0C()
{
  return MEMORY[0x24BE928C0]();
}

uint64_t sub_21B36AF18()
{
  return MEMORY[0x24BE928D8]();
}

uint64_t sub_21B36AF24()
{
  return MEMORY[0x24BE928E0]();
}

uint64_t sub_21B36AF30()
{
  return MEMORY[0x24BE928E8]();
}

uint64_t sub_21B36AF3C()
{
  return MEMORY[0x24BE928F8]();
}

uint64_t sub_21B36AF48()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_21B36AF54()
{
  return MEMORY[0x24BE929B0]();
}

uint64_t sub_21B36AF60()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_21B36AF6C()
{
  return MEMORY[0x24BE929F0]();
}

uint64_t sub_21B36AF78()
{
  return MEMORY[0x24BE92A00]();
}

uint64_t sub_21B36AF84()
{
  return MEMORY[0x24BE92A10]();
}

uint64_t sub_21B36AF90()
{
  return MEMORY[0x24BE92A28]();
}

uint64_t sub_21B36AF9C()
{
  return MEMORY[0x24BE92B30]();
}

uint64_t sub_21B36AFA8()
{
  return MEMORY[0x24BE92B38]();
}

uint64_t sub_21B36AFB4()
{
  return MEMORY[0x24BE92B40]();
}

uint64_t sub_21B36AFC0()
{
  return MEMORY[0x24BE92B50]();
}

uint64_t sub_21B36AFCC()
{
  return MEMORY[0x24BE92B58]();
}

uint64_t sub_21B36AFD8()
{
  return MEMORY[0x24BE92B70]();
}

uint64_t sub_21B36AFE4()
{
  return MEMORY[0x24BE92B78]();
}

uint64_t sub_21B36AFF0()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_21B36AFFC()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_21B36B008()
{
  return MEMORY[0x24BE90B70]();
}

uint64_t sub_21B36B014()
{
  return MEMORY[0x24BE90B88]();
}

uint64_t sub_21B36B020()
{
  return MEMORY[0x24BE90B90]();
}

uint64_t sub_21B36B02C()
{
  return MEMORY[0x24BE90BB0]();
}

uint64_t sub_21B36B038()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_21B36B044()
{
  return MEMORY[0x24BE90BD8]();
}

uint64_t sub_21B36B050()
{
  return MEMORY[0x24BE90BE0]();
}

uint64_t sub_21B36B05C()
{
  return MEMORY[0x24BE90BE8]();
}

uint64_t sub_21B36B068()
{
  return MEMORY[0x24BE90CF8]();
}

uint64_t sub_21B36B074()
{
  return MEMORY[0x24BE90D00]();
}

uint64_t sub_21B36B080()
{
  return MEMORY[0x24BE94388]();
}

uint64_t sub_21B36B08C()
{
  return MEMORY[0x24BE94390]();
}

uint64_t sub_21B36B098()
{
  return MEMORY[0x24BE94398]();
}

uint64_t sub_21B36B0A4()
{
  return MEMORY[0x24BEA6A98]();
}

uint64_t sub_21B36B0B0()
{
  return MEMORY[0x24BEA6AA0]();
}

uint64_t sub_21B36B0BC()
{
  return MEMORY[0x24BEA6B40]();
}

uint64_t sub_21B36B0C8()
{
  return MEMORY[0x24BEA6B48]();
}

uint64_t sub_21B36B0D4()
{
  return MEMORY[0x24BEA6B60]();
}

uint64_t sub_21B36B0E0()
{
  return MEMORY[0x24BEA6B70]();
}

uint64_t sub_21B36B0EC()
{
  return MEMORY[0x24BEA6B90]();
}

uint64_t sub_21B36B0F8()
{
  return MEMORY[0x24BEA6BB0]();
}

uint64_t sub_21B36B104()
{
  return MEMORY[0x24BEA6BB8]();
}

uint64_t sub_21B36B110()
{
  return MEMORY[0x24BEA6BE8]();
}

uint64_t sub_21B36B11C()
{
  return MEMORY[0x24BEA6BF0]();
}

uint64_t sub_21B36B128()
{
  return MEMORY[0x24BEA6D00]();
}

uint64_t sub_21B36B134()
{
  return MEMORY[0x24BEA6D20]();
}

uint64_t sub_21B36B140()
{
  return MEMORY[0x24BEA6F38]();
}

uint64_t sub_21B36B14C()
{
  return MEMORY[0x24BEA6F78]();
}

uint64_t sub_21B36B158()
{
  return MEMORY[0x24BEA6F80]();
}

uint64_t sub_21B36B164()
{
  return MEMORY[0x24BE7E2A8]();
}

uint64_t sub_21B36B170()
{
  return MEMORY[0x24BE7E2B0]();
}

uint64_t sub_21B36B17C()
{
  return MEMORY[0x24BE7E2B8]();
}

uint64_t sub_21B36B188()
{
  return MEMORY[0x24BE7E2C0]();
}

uint64_t sub_21B36B194()
{
  return MEMORY[0x24BE7E2D0]();
}

uint64_t sub_21B36B1A0()
{
  return MEMORY[0x24BE7E2E0]();
}

uint64_t sub_21B36B1AC()
{
  return MEMORY[0x24BE7E2F8]();
}

uint64_t sub_21B36B1B8()
{
  return MEMORY[0x24BE92ED0]();
}

uint64_t sub_21B36B1C4()
{
  return MEMORY[0x24BE92F08]();
}

uint64_t sub_21B36B1D0()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_21B36B1DC()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_21B36B1E8()
{
  return MEMORY[0x24BEA54F8]();
}

uint64_t sub_21B36B1F4()
{
  return MEMORY[0x24BE7E328]();
}

uint64_t sub_21B36B200()
{
  return MEMORY[0x24BE7E330]();
}

uint64_t sub_21B36B20C()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_21B36B218()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_21B36B224()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_21B36B230()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_21B36B23C()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_21B36B248()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_21B36B254()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_21B36B260()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_21B36B26C()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_21B36B278()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_21B36B284()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_21B36B290()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_21B36B29C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21B36B2A8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21B36B2B4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21B36B2C0()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_21B36B2CC()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_21B36B2D8()
{
  return MEMORY[0x24BEA5668]();
}

uint64_t sub_21B36B2E4()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_21B36B2F0()
{
  return MEMORY[0x24BEA59D8]();
}

uint64_t sub_21B36B2FC()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_21B36B308()
{
  return MEMORY[0x24BEA5A00]();
}

uint64_t sub_21B36B314()
{
  return MEMORY[0x24BEA5A18]();
}

uint64_t sub_21B36B320()
{
  return MEMORY[0x24BEA5A40]();
}

uint64_t sub_21B36B32C()
{
  return MEMORY[0x24BEA5A48]();
}

uint64_t sub_21B36B338()
{
  return MEMORY[0x24BEA5A58]();
}

uint64_t sub_21B36B344()
{
  return MEMORY[0x24BEA5A68]();
}

uint64_t sub_21B36B350()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_21B36B35C()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_21B36B368()
{
  return MEMORY[0x24BEB98B0]();
}

uint64_t sub_21B36B374()
{
  return MEMORY[0x24BEB98B8]();
}

uint64_t sub_21B36B380()
{
  return MEMORY[0x24BEB99D0]();
}

uint64_t sub_21B36B38C()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_21B36B398()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_21B36B3A4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21B36B3B0()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_21B36B3BC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21B36B3C8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21B36B3D4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21B36B3E0()
{
  return MEMORY[0x24BEE0350]();
}

uint64_t sub_21B36B3EC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21B36B3F8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21B36B404()
{
  return MEMORY[0x24BEE0698]();
}

uint64_t sub_21B36B410()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_21B36B41C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21B36B428()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21B36B434()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21B36B440()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21B36B44C()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_21B36B458()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_21B36B464()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_21B36B470()
{
  return MEMORY[0x24BEAD540]();
}

uint64_t sub_21B36B47C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21B36B488()
{
  return MEMORY[0x24BEE09F8]();
}

uint64_t sub_21B36B494()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_21B36B4A0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21B36B4AC()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_21B36B4B8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21B36B4C4()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21B36B4D0()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21B36B4DC()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_21B36B4E8()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_21B36B4F4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21B36B500()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_21B36B50C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21B36B518()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_21B36B524()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_21B36B530()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21B36B53C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21B36B548()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_21B36B554()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_21B36B560()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_21B36B56C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_21B36B578()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_21B36B584()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_21B36B590()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21B36B59C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21B36B5A8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21B36B5B4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21B36B5C0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21B36B5CC()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_21B36B5D8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21B36B5E4()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21B36B5F0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21B36B5FC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21B36B608()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21B36B614()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21B36B620()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_21B36B62C()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_21B36B638()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_21B36B644()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21B36B650()
{
  return MEMORY[0x24BEE6938]();
}

uint64_t sub_21B36B65C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21B36B668()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21B36B674()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_21B36B680()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21B36B68C()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_21B36B698()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_21B36B6A4()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21B36B6B0()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21B36B6BC()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21B36B6C8()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_21B36B6D4()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_21B36B6E0()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21B36B6EC()
{
  return MEMORY[0x24BEE1B50]();
}

uint64_t sub_21B36B6F8()
{
  return MEMORY[0x24BE99110]();
}

uint64_t sub_21B36B704()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21B36B710()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21B36B71C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21B36B728()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21B36B734()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21B36B740()
{
  return MEMORY[0x24BE92C50]();
}

uint64_t sub_21B36B74C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21B36B758()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21B36B764()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21B36B770()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_21B36B77C()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_21B36B788()
{
  return MEMORY[0x24BEE5AD8]();
}

uint64_t sub_21B36B794()
{
  return MEMORY[0x24BEE5AE0]();
}

uint64_t sub_21B36B7A0()
{
  return MEMORY[0x24BE99130]();
}

uint64_t sub_21B36B7AC()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_21B36B7B8()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_21B36B7C4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21B36B7D0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21B36B7DC()
{
  return MEMORY[0x24BE99138]();
}

uint64_t sub_21B36B7E8()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_21B36B7F4()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_21B36B800()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21B36B80C()
{
  return MEMORY[0x24BEE1D60]();
}

uint64_t sub_21B36B818()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21B36B824()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21B36B830()
{
  return MEMORY[0x24BDD04D8]();
}

uint64_t sub_21B36B83C()
{
  return MEMORY[0x24BDD04E8]();
}

uint64_t sub_21B36B848()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_21B36B854()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21B36B860()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_21B36B86C()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_21B36B878()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21B36B884()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21B36B890()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_21B36B89C()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_21B36B8A8()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21B36B8B4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21B36B8C0()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_21B36B8CC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21B36B8D8()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_21B36B8E4()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_21B36B8F0()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_21B36B8FC()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_21B36B908()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_21B36B914()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_21B36B920()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21B36B92C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21B36B938()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21B36B944()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21B36B950()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21B36B95C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_21B36B968()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21B36B974()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21B36B980()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21B36B98C()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_21B36B998()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_21B36B9A4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21B36B9B0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21B36B9BC()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_21B36B9C8()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_21B36B9D4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21B36B9E0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21B36B9EC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21B36B9F8()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_21B36BA04()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21B36BA10()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21B36BA1C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21B36BA28()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_21B36BA34()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21B36BA40()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_21B36BA4C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21B36BA58()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_21B36BA64()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_21B36BA70()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_21B36BA7C()
{
  return MEMORY[0x24BEE2EA0]();
}

uint64_t sub_21B36BA88()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_21B36BA94()
{
  return MEMORY[0x24BEE2EB8]();
}

uint64_t sub_21B36BAA0()
{
  return MEMORY[0x24BEE2EC0]();
}

uint64_t sub_21B36BAAC()
{
  return MEMORY[0x24BEE2ED0]();
}

uint64_t sub_21B36BAB8()
{
  return MEMORY[0x24BEE2ED8]();
}

uint64_t sub_21B36BAC4()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_21B36BAD0()
{
  return MEMORY[0x24BEE2EE8]();
}

uint64_t sub_21B36BADC()
{
  return MEMORY[0x24BEE2EF8]();
}

uint64_t sub_21B36BAE8()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_21B36BAF4()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_21B36BB00()
{
  return MEMORY[0x24BEE2F38]();
}

uint64_t sub_21B36BB0C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21B36BB18()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21B36BB24()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_21B36BB30()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21B36BB3C()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_21B36BB48()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21B36BB54()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21B36BB60()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_21B36BB6C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21B36BB78()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21B36BB84()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21B36BB90()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_21B36BB9C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_21B36BBA8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21B36BBB4()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_21B36BBC0()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_21B36BBCC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21B36BBD8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21B36BBE4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_21B36BBF0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_21B36BBFC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21B36BC08()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_21B36BC14()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_21B36BC20()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_21B36BC2C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21B36BC38()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_21B36BC44()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_21B36BC50()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21B36BC5C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21B36BC68()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_21B36BC74()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_21B36BC80()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21B36BC8C()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_21B36BC98()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21B36BCA4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21B36BCB0()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_21B36BCBC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21B36BCC8()
{
  return MEMORY[0x24BEE3A78]();
}

uint64_t sub_21B36BCD4()
{
  return MEMORY[0x24BEE3B10]();
}

uint64_t sub_21B36BCE0()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_21B36BCEC()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_21B36BCF8()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_21B36BD04()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21B36BD10()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21B36BD1C()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_21B36BD28()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_21B36BD34()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21B36BD40()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21B36BD4C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21B36BD58()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21B36BD64()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21B36BD70()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21B36BD7C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21B36BD88()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21B36BD94()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_21B36BDA0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21B36BDAC()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_21B36BDB8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21B36BDC4()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_21B36BDD0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21B36BDDC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21B36BDE8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x24BDD9918]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x24BEB0BD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocEmptyBox()
{
  return MEMORY[0x24BEE4B60]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x24BEE71A8]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x24BEE71B0]();
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


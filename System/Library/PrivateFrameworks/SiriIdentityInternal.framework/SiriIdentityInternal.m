uint64_t sub_246383EF8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[24] = v0;
  v2 = sub_2463C05B8();
  v1[25] = v2;
  v1[26] = *(_QWORD *)(v2 - 8);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = type metadata accessor for Signpost.OpenSignpost();
  v1[30] = swift_task_alloc();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246383F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;

  if (qword_25756EF48 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 232);
  v1 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = (id)qword_25756F958;
  sub_2463C0588();
  sub_2463C0750();
  v12 = MEMORY[0x24BEE4AF8];
  LOBYTE(v11) = 2;
  sub_2463C0570();
  v5 = *(int *)(v2 + 20);
  *(_DWORD *)(v0 + 256) = v5;
  v6 = v1 + v5;
  *(_QWORD *)v6 = "MafHomeMemberNames";
  *(_QWORD *)(v6 + 8) = 18;
  *(_WORD *)(v6 + 16) = 258;
  v7 = *(void **)(v3 + 16);
  *(_QWORD *)(v0 + 56) = v0 + 176;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_2463840EC;
  v8 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v9 = (_QWORD *)(v0 + 80);
  v9[1] = 0x40000000;
  v9[2] = sub_246384B48;
  v9[3] = &block_descriptor;
  v9[4] = v8;
  objc_msgSend(v7, sel_homeUserIdToNames_, v9, 19, v11, v12);
  return swift_continuation_await();
}

uint64_t sub_2463840EC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 248) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246384144()
{
  _QWORD *v0;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  char v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  int64_t v67;
  uint64_t v68;
  uint64_t v69[3];

  v2 = v0[26];
  v3 = v0[22];
  v4 = 0;
  v0[21] = sub_2463C05E8();
  v5 = v0 + 21;
  v59 = v3 + 64;
  v63 = v3;
  v6 = -1;
  v7 = -1 << *(_BYTE *)(v3 + 32);
  if (-v7 < 64)
    v6 = ~(-1 << -(char)v7);
  v8 = v6 & *(_QWORD *)(v3 + 64);
  v60 = (unint64_t)(63 - v7) >> 6;
  v58 = v0;
  v9 = v2;
  v61 = v2;
  v62 = v5;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_20:
    v15 = (uint64_t *)(*(_QWORD *)(v63 + 48) + 16 * v11);
    v17 = *v15;
    v16 = v15[1];
    v18 = *(void **)(*(_QWORD *)(v63 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    v19 = v18;
    sub_24638571C(v19);
    OUTLINED_FUNCTION_6();
    if (v18)
    {
      v66 = v8;
      isUniquelyReferenced_nonNull_native = sub_24638571C(v19);
      v21 = v20;
      v23 = sub_246385728(v19);
      v24 = v22;
      v67 = v4;
      v65 = isUniquelyReferenced_nonNull_native;
      if (v21)
      {
        v68 = MEMORY[0x24BEE4B08];
        swift_bridgeObjectRetain();
        v64 = v21;
        sub_2463903DC(v69, isUniquelyReferenced_nonNull_native, v21);
        swift_bridgeObjectRelease();
        if (!v24)
          goto LABEL_28;
      }
      else
      {
        if (!v22)
        {
          v44 = *v5;
          swift_bridgeObjectRetain();
          v45 = OUTLINED_FUNCTION_4();
          v47 = v46;
          swift_bridgeObjectRelease();
          if ((v47 & 1) != 0)
          {
            swift_isUniquelyReferenced_nonNull_native();
            v69[0] = v44;
            __swift_instantiateConcreteTypeFromMangledName(&qword_25756F170);
            sub_2463C0858();
            v48 = v69[0];
            swift_bridgeObjectRelease();
            isUniquelyReferenced_nonNull_native = *(_QWORD *)(*(_QWORD *)(v48 + 56) + 104 * v45 + 40);
            sub_2463C0864();
            *v62 = v48;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            OUTLINED_FUNCTION_10();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_13();
            v5 = v62;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v9 = v61;
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();

          }
          goto LABEL_37;
        }
        v64 = 0;
        v68 = MEMORY[0x24BEE4B08];
      }
      swift_bridgeObjectRetain();
      sub_2463903DC(v69, v23, v24);
      swift_bridgeObjectRelease();
LABEL_28:
      v25 = *v5;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v69[0] = v25;
      *v5 = 0x8000000000000000;
      v26 = OUTLINED_FUNCTION_4();
      if (__OFADD__(*(_QWORD *)(v25 + 16), (v27 & 1) == 0))
      {
        __break(1u);
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
      v28 = v26;
      v29 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25756F170);
      v30 = sub_2463C0858();
      v31 = (_QWORD *)v69[0];
      if ((v30 & 1) != 0)
      {
        v32 = OUTLINED_FUNCTION_4();
        if ((v29 & 1) != (v33 & 1))
          return sub_2463C093C();
        v28 = v32;
      }
      if ((v29 & 1) != 0)
      {
        v34 = v31[7] + 104 * v28;
        isUniquelyReferenced_nonNull_native = *(_QWORD *)(v34 + 56);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_13();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(_QWORD *)v34 = v65;
        *(_QWORD *)(v34 + 8) = v64;
        *(_OWORD *)(v34 + 16) = 0u;
        *(_OWORD *)(v34 + 32) = 0u;
        *(_OWORD *)(v34 + 48) = 0u;
        *(_QWORD *)(v34 + 64) = v23;
        *(_QWORD *)(v34 + 72) = v24;
        *(_QWORD *)(v34 + 80) = 0;
        *(_QWORD *)(v34 + 88) = 0;
        *(_QWORD *)(v34 + 96) = v68;
      }
      else
      {
        v31[(v28 >> 6) + 8] |= 1 << v28;
        v35 = (uint64_t *)(v31[6] + 16 * v28);
        *v35 = v17;
        v35[1] = v16;
        v36 = v31[7] + 104 * v28;
        *(_QWORD *)v36 = v65;
        *(_QWORD *)(v36 + 8) = v64;
        *(_OWORD *)(v36 + 16) = 0u;
        *(_OWORD *)(v36 + 32) = 0u;
        *(_OWORD *)(v36 + 48) = 0u;
        *(_QWORD *)(v36 + 64) = v23;
        *(_QWORD *)(v36 + 72) = v24;
        *(_QWORD *)(v36 + 80) = 0;
        *(_QWORD *)(v36 + 88) = 0;
        *(_QWORD *)(v36 + 96) = v68;
        v37 = v31[2];
        v38 = __OFADD__(v37, 1);
        v39 = v37 + 1;
        if (v38)
          goto LABEL_53;
        v31[2] = v39;
        swift_bridgeObjectRetain();
      }
      v5 = v62;
      *v62 = (uint64_t)v31;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_11();
      v9 = v61;
LABEL_37:
      v8 = v66;
      v4 = v67;
    }
    else
    {
      sub_246385728(v19);
      OUTLINED_FUNCTION_6();
      isUniquelyReferenced_nonNull_native = v16;
      if (qword_25756EFB8 != -1)
        swift_once();
      v40 = __swift_project_value_buffer(v58[25], (uint64_t)qword_2575745E0);
      OUTLINED_FUNCTION_12(v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
      OUTLINED_FUNCTION_14();
      v41 = sub_2463C05A0();
      v42 = sub_2463C072C();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = OUTLINED_FUNCTION_5();
        v69[0] = OUTLINED_FUNCTION_5();
        *(_DWORD *)v43 = 136315138;
        OUTLINED_FUNCTION_14();
        *(_QWORD *)(v43 + 4) = sub_24639AE68(v17, v16, v69);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_246381000, v41, v42, "Did not get first or nick name for homeUserId=%s", (uint8_t *)v43, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_11();
      swift_bridgeObjectRelease_n();

      OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    }
  }
  v12 = v4 + 1;
  if (__OFADD__(v4, 1))
    goto LABEL_52;
  if (v12 < v60)
  {
    v13 = *(_QWORD *)(v59 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v60)
        goto LABEL_46;
      v13 = *(_QWORD *)(v59 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v60)
          goto LABEL_46;
        v13 = *(_QWORD *)(v59 + 8 * v4);
        if (!v13)
        {
          v14 = v12 + 3;
          if (v14 >= v60)
            goto LABEL_46;
          v13 = *(_QWORD *)(v59 + 8 * v14);
          if (!v13)
          {
            while (1)
            {
              v4 = v14 + 1;
              if (__OFADD__(v14, 1))
                goto LABEL_54;
              if (v4 >= v60)
                goto LABEL_46;
              v13 = *(_QWORD *)(v59 + 8 * v4);
              ++v14;
              if (v13)
                goto LABEL_19;
            }
          }
          v4 = v14;
        }
      }
    }
LABEL_19:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_20;
  }
LABEL_46:
  isUniquelyReferenced_nonNull_native = v9;
  swift_release();
  if (qword_25756EFB8 == -1)
    goto LABEL_47;
LABEL_55:
  swift_once();
LABEL_47:
  v49 = __swift_project_value_buffer(v58[25], (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_12(v49, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native + 16));
  v50 = sub_2463C05A0();
  v51 = sub_2463C0720();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)OUTLINED_FUNCTION_5();
    v69[0] = OUTLINED_FUNCTION_5();
    *(_DWORD *)v52 = 136315138;
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_14();
    v53 = sub_2463C05DC();
    v55 = v54;
    OUTLINED_FUNCTION_13();
    v58[23] = sub_24639AE68(v53, v55, v69);
    sub_2463C078C();
    OUTLINED_FUNCTION_10();
    _os_log_impl(&dword_246381000, v50, v51, "Got these home member names from MAF: %s", v52, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(isUniquelyReferenced_nonNull_native + 8));
  OUTLINED_FUNCTION_7();
  v57 = v58[21];
  sub_2463C0744();
  sub_2463C057C();
  sub_246384DA8(v58[30]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t))v58[1])(v57);
}

uint64_t sub_246384A7C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 248);
  swift_willThrow();
  v2 = sub_2463C05E8();

  sub_2463C0744();
  sub_2463C057C();
  sub_246384DA8(*(_QWORD *)(v0 + 240));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_246384B48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    return sub_246384BB0(v3, (uint64_t)a3);
  sub_246384DFC();
  v5 = sub_2463C05D0();
  return sub_246384C00(v3, v5);
}

uint64_t sub_246384BB0(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F180);
  swift_allocError();
  *v3 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_246384C00(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_246384C10()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of IdentityNLv3Intent.verbNode()
{
  return OUTLINED_FUNCTION_3(&qword_25756EFD8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249559D5C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of IdentityNLv3Intent.nounNode()
{
  return OUTLINED_FUNCTION_3(&qword_25756EFE0);
}

uint64_t variable initialization expression of IdentityNLv3Intent.referenceNode()
{
  return OUTLINED_FUNCTION_2(&qword_25756EFE8);
}

uint64_t variable initialization expression of IdentityNLv3Intent.userIdentityNode()
{
  _s24UserIdentityOntologyNodeCMa();
  OUTLINED_FUNCTION_8();
  return sub_2463A4D58();
}

uint64_t variable initialization expression of IdentityNLv3Intent.identityConfirmationNode()
{
  return OUTLINED_FUNCTION_2(&qword_25756EFF0);
}

uint64_t sub_246384D28(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_8();
  return sub_2463C0174();
}

uint64_t variable initialization expression of IdentityFlowProvider.disallowInSharing()
{
  return 0;
}

uint64_t variable initialization expression of SwitchProfileUseCases.useCase()
{
  return 3;
}

uint64_t variable initialization expression of UserIdentifyIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SwitchProfileIntentResponse.code()
{
  return 0;
}

uint64_t type metadata accessor for AssistantServicesProvider()
{
  return objc_opt_self();
}

uint64_t sub_246384DA8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Signpost.OpenSignpost();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_246384DFC()
{
  unint64_t result;

  result = qword_25756F178;
  if (!qword_25756F178)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25756F178);
  }
  return result;
}

void type metadata accessor for FLOWSchemaFLOWProfileSwitchByNameType(uint64_t a1)
{
  sub_246384E60(a1, &qword_25756F188);
}

void type metadata accessor for FLOWSchemaFLOWProfileSwitchMethod(uint64_t a1)
{
  sub_246384E60(a1, (unint64_t *)&unk_25756F190);
}

void sub_246384E60(uint64_t a1, unint64_t *a2)
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

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x249559E1CLL);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t *a1)
{
  return sub_246384D28(a1);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t *a1)
{
  return sub_246384D28(a1);
}

unint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2463BC4E4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_11()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_bridgeObjectRetain();
}

void sub_246384F3C()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultContext);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE092B8]), sel_initWithInstanceContext_, v0);

  qword_25756F500 = (uint64_t)v1;
}

void *sub_246384FA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v11;

  v0 = sub_2463C05B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25756EF40 != -1)
    swift_once();
  v4 = (void *)qword_25756F500;
  if (!qword_25756F500)
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
    v6 = sub_2463C05A0();
    v7 = sub_2463C072C();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_246381000, v6, v7, "Did not get AFSettingsConnection", v8, 2u);
      MEMORY[0x249559E1C](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  v9 = v4;
  return v4;
}

id sub_246385114()
{
  objc_class *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = objc_allocWithZone(v0);
  v2 = (void *)sub_2463C060C();
  v3 = sub_246385734(0, 0xE000000000000000, (uint64_t)v2, v1);

  v4 = v3;
  v5 = (void *)sub_2463C06CC();
  objc_msgSend(v4, sel_setFullConfidence_, v5);

  v6 = (void *)sub_2463C06CC();
  objc_msgSend(v4, sel_setSetupInProgress_, v6);

  v7 = (void *)sub_2463C06CC();
  objc_msgSend(v4, sel_setIsMultiUserContext_, v7);

  return v4;
}

void sub_2463851FC(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F508);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12_0();
  v7 = (void *)(v6 - v5);
  v8 = sub_2463BF8B0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_12_0();
  v12 = (id)(v11 - v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_12_0();
  v16 = v15 - v14;
  v50 = 0;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBAD50]), sel_init);
  sub_2463856C8(a1, v16);
  v18 = sub_2463BFD84();
  if (__swift_getEnumTagSinglePayload(v16, 1, v18) == 1)
  {
    sub_2463857A0(v16, &qword_25756F510);
    goto LABEL_16;
  }
  v19 = (void *)sub_2463BFD78();
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v16, v18);
  if (v19)
  {
    v21 = OUTLINED_FUNCTION_13_0(v20, (SEL *)&selRef_firstName);
    if (v22)
    {
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_8_0();
      if (v24)
      {
        __break(1u);
        goto LABEL_37;
      }
      v50 = v23;
      swift_bridgeObjectRetain();
      v12 = v17;
      v25 = (void *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_2_0((uint64_t)v25, sel_setGivenName_);

      OUTLINED_FUNCTION_1_0();
    }
    v26 = OUTLINED_FUNCTION_13_0(v21, (SEL *)&selRef_middleName);
    if (!v27)
    {
LABEL_10:
      v30 = OUTLINED_FUNCTION_13_0(v26, (SEL *)&selRef_lastName);
      if (!v31)
      {
LABEL_13:
        OUTLINED_FUNCTION_13_0(v30, (SEL *)&selRef_nickName);
        if (!v34)
        {

          goto LABEL_33;
        }
        OUTLINED_FUNCTION_10_0();
        OUTLINED_FUNCTION_0_0();
        OUTLINED_FUNCTION_8_0();
        if (!v24)
        {
          OUTLINED_FUNCTION_6_0(v35);
          OUTLINED_FUNCTION_11_0();
          v36 = (void *)OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_2_0((uint64_t)v36, sel_setNickname_);

          OUTLINED_FUNCTION_1_0();
          goto LABEL_33;
        }
        goto LABEL_39;
      }
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_8_0();
      if (!v24)
      {
        OUTLINED_FUNCTION_6_0(v32);
        OUTLINED_FUNCTION_11_0();
        v33 = (void *)OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_2_0((uint64_t)v33, sel_setFamilyName_);

        OUTLINED_FUNCTION_1_0();
        goto LABEL_13;
      }
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_8_0();
    if (!v24)
    {
      OUTLINED_FUNCTION_6_0(v28);
      OUTLINED_FUNCTION_11_0();
      v29 = (void *)OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_2_0((uint64_t)v29, sel_setMiddleName_);

      OUTLINED_FUNCTION_1_0();
      goto LABEL_10;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_16:
  sub_2463857DC(v2, (SEL *)&selRef_name);
  if (!v37)
    goto LABEL_33;
  sub_2463BF8BC();
  OUTLINED_FUNCTION_14_0((uint64_t)v7, 0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_2463857A0((uint64_t)v7, &qword_25756F508);
    goto LABEL_33;
  }
  (*(void (**)(id, void *, uint64_t))(v9 + 32))(v12, v7, v8);
  sub_2463BF880();
  if (v38)
  {
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_8_0();
    if (!v24)
    {
      OUTLINED_FUNCTION_6_0(v39);
      OUTLINED_FUNCTION_7_0();
      v40 = (void *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_4_0((uint64_t)v40, sel_setGivenName_);

      OUTLINED_FUNCTION_1_0();
      goto LABEL_23;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_23:
  sub_2463BF898();
  if (!v41)
    goto LABEL_26;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_0();
  if (v24)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  OUTLINED_FUNCTION_6_0(v42);
  OUTLINED_FUNCTION_7_0();
  v43 = (void *)OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((uint64_t)v43, sel_setMiddleName_);

  OUTLINED_FUNCTION_1_0();
LABEL_26:
  sub_2463BF88C();
  if (!v44)
    goto LABEL_29;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_0();
  if (v24)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_6_0(v45);
  OUTLINED_FUNCTION_7_0();
  v46 = (void *)OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((uint64_t)v46, sel_setFamilyName_);

  OUTLINED_FUNCTION_1_0();
LABEL_29:
  sub_2463BF8A4();
  if (v47)
  {
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_8_0();
    if (!v24)
    {
      OUTLINED_FUNCTION_6_0(v48);
      OUTLINED_FUNCTION_7_0();
      v49 = (void *)OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_4_0((uint64_t)v49, sel_setNickname_);

      OUTLINED_FUNCTION_1_0();
      goto LABEL_32;
    }
LABEL_43:
    __break(1u);
    return;
  }
LABEL_32:
  (*(void (**)(id, uint64_t))(v9 + 8))(v12, v8);
LABEL_33:
  swift_beginAccess();
  if (!v50)

}

uint64_t sub_2463856C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_24638571C(void *a1)
{
  return sub_2463857DC(a1, (SEL *)&selRef_firstName);
}

uint64_t sub_246385728(void *a1)
{
  return sub_2463857DC(a1, (SEL *)&selRef_nickName);
}

id sub_246385734(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = (void *)sub_2463C060C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(a4, sel_initWithIdentifier_displayString_, v6, a3);

  return v7;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2463857A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2463857DC(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_2463C0618();

  return v4;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_2_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_2463C060C();
}

id OUTLINED_FUNCTION_4_0(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_2463C060C();
}

id OUTLINED_FUNCTION_6_0@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  uint64_t v0;

  return v0 - 88;
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;

  return v0 - 88;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, SEL *a2)
{
  void *v2;

  return sub_2463857DC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t initializeBufferWithCopyOfBuffer for RemoteDeviceFilter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for RemoteDeviceFilter()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RemoteDeviceFilter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RemoteDeviceFilter(uint64_t a1, __int128 *a2)
{
  __int128 v4;

  v4 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for RemoteDeviceFilter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RemoteDeviceFilter(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for RemoteDeviceFilter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteDeviceFilter()
{
  return &type metadata for RemoteDeviceFilter;
}

uint64_t sub_246385B40()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_246385B9C(v0);
  sub_246385C78(v0);
  sub_2463C0654();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_246385B9C(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _BYTE v4[16];
  uint64_t v5;
  unint64_t v6;

  sub_246385D54(a1 + 24, (uint64_t)v4);
  sub_246385D54((uint64_t)v4, (uint64_t)&v5);
  if (!v6)
    return 0;
  v1 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0)
    v1 = v5 & 0xFFFFFFFFFFFFLL;
  if (!v1)
    return 0;
  sub_2463C07E0();
  swift_bridgeObjectRelease();
  strcpy((char *)v3, "deviceName: \"");
  HIWORD(v3[1]) = -4864;
  sub_2463C0654();
  sub_2463C0654();
  return v3[0];
}

uint64_t sub_246385C78(uint64_t a1)
{
  uint64_t v1;
  _BYTE v3[16];
  uint64_t v4;
  unint64_t v5;

  sub_246385D54(a1 + 40, (uint64_t)v3);
  sub_246385D54((uint64_t)v3, (uint64_t)&v4);
  if (!v5)
    return 0;
  v1 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v1 = v4 & 0xFFFFFFFFFFFFLL;
  if (!v1)
    return 0;
  sub_2463C0654();
  sub_2463C0654();
  return 0x22203A6D6F6F72;
}

uint64_t sub_246385D14()
{
  return sub_246385B40();
}

uint64_t sub_246385D54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246385D9C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[28] = a1;
  v2[29] = a2;
  v3 = sub_2463C05B8();
  v2[30] = v3;
  v2[31] = *(_QWORD *)(v3 - 8);
  v2[32] = OUTLINED_FUNCTION_11_1();
  v2[33] = OUTLINED_FUNCTION_11_1();
  v2[34] = OUTLINED_FUNCTION_11_1();
  return swift_task_switch();
}

uint64_t sub_246385E0C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(NSObject *, uint64_t, _QWORD);
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
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
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  unint64_t v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t *buf;
  uint8_t *bufa;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  os_log_t log;
  NSObject *logb;
  os_log_t loga;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  os_log_type_t type;
  uint64_t (*typea)(void);
  uint64_t v82;
  uint64_t v83[3];

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(NSObject **)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = __swift_project_value_buffer(*(_QWORD *)(v0 + 240), (uint64_t)qword_2575745E0);
  v5 = *(void (**)(NSObject *, uint64_t, _QWORD))(v3 + 16);
  OUTLINED_FUNCTION_8_1((uint64_t)v2);
  sub_246385D54(v1 + 24, v0 + 128);
  sub_246385D54(v1 + 40, v0 + 112);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1();
  sub_2463C05A0();
  type = OUTLINED_FUNCTION_14_1();
  v6 = os_log_type_enabled(v2, type);
  v7 = *(_QWORD *)(v0 + 272);
  v8 = *(_QWORD *)(v0 + 240);
  v9 = *(_QWORD *)(v0 + 248);
  if (v6)
  {
    logb = v2;
    v10 = *(_QWORD *)(v0 + 224);
    v11 = (uint8_t *)OUTLINED_FUNCTION_5();
    v82 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v11 = 136315138;
    sub_246386794(v0 + 128);
    OUTLINED_FUNCTION_6_1();
    v12 = sub_246385B9C(v10);
    v14 = v13;
    sub_246385C78(v10);
    v83[0] = v12;
    v83[1] = v14;
    sub_2463C0654();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_1();
    sub_2463867BC(v0 + 112);
    *(_QWORD *)(v0 + 216) = sub_24639AE68(v12, v14, &v82);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_10_1();
    OUTLINED_FUNCTION_3_1();
    _os_log_impl(&dword_246381000, logb, type, "#hal Invoking device resolution service with filter: %s", v11, 0xCu);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  sub_2463867BC(v0 + 128);
  OUTLINED_FUNCTION_3_1();
  sub_2463867BC(v0 + 128);
  OUTLINED_FUNCTION_3_1();

  v15 = *(uint64_t (**)(void))(v9 + 8);
  ((void (*)(uint64_t, uint64_t))v15)(v7, v8);
  v16 = OUTLINED_FUNCTION_12_1();
  v17 = sub_2463B1EFC(v16);
  OUTLINED_FUNCTION_10();
  swift_retain();
  swift_bridgeObjectRetain();
  if ((v17 & 0x8000000000000000) != 0 || (v18 = (_QWORD *)v17, (v17 & 0x4000000000000000) != 0))
  {
    v18 = sub_2463B1E38(v17);
    swift_release();
  }
  v83[0] = (uint64_t)v18;
  sub_2463867E4(v83);
  v19 = (_QWORD *)(v0 + 192);
  v20 = *(NSObject **)(v0 + 264);
  swift_release_n();
  *(_QWORD *)(v0 + 192) = v83[0];
  OUTLINED_FUNCTION_8_1((uint64_t)v20);
  v21 = v20;
  sub_2463C05A0();
  v22 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_13_1(v22))
  {
    v23 = OUTLINED_FUNCTION_5();
    v83[0] = OUTLINED_FUNCTION_5();
    *(_DWORD *)v23 = 134218242;
    OUTLINED_FUNCTION_7();
    if (*v19 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_2463C08B8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = *(_QWORD *)((*v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    *(_QWORD *)(v0 + 200) = v24;
    sub_2463C078C();
    *(_WORD *)(v23 + 12) = 2080;
    v25 = swift_bridgeObjectRetain();
    v26 = sub_2463B1274(v25);
    v28 = v27;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 208) = sub_24639AE68(v26, v28, v83);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246381000, v20, v22, "#hal %ld device(s): %s", (uint8_t *)v23, 0x16u);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  v29 = *(_QWORD *)(v0 + 264);
  v30 = *(_QWORD *)(v0 + 240);

  OUTLINED_FUNCTION_15(v29, v30, v31, v32, v33, v34, v35, v36, v62, v64, (uint64_t)buf, v68, v70, (uint64_t)log, v75, v0 + 112, v78, v15);
  sub_246385D54(v77, v0 + 160);
  v37 = *(_QWORD *)(v0 + 168);
  if (v37)
  {
    v38 = *(_QWORD *)(v0 + 160);
    OUTLINED_FUNCTION_2_1();
    sub_246386794(v77);
    v39 = swift_bridgeObjectRetain();
    v40 = sub_246386548(v39, v38, v37, MEMORY[0x24BEA90D0]);
    OUTLINED_FUNCTION_4_1(v40);
  }
  sub_246385D54(v0 + 128, v0 + 144);
  v41 = *(_QWORD *)(v0 + 152);
  if (v41)
  {
    v42 = *(_QWORD *)(v0 + 144);
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_7_1();
    v43 = OUTLINED_FUNCTION_12_1();
    v44 = sub_246386548(v43, v42, v41, MEMORY[0x24BEA90C8]);
    OUTLINED_FUNCTION_4_1(v44);
  }
  v45 = *(NSObject **)(v0 + 256);
  v5(v45, v4, *(_QWORD *)(v0 + 240));
  v46 = *(_QWORD *)(v0 + 192);
  swift_bridgeObjectRetain_n();
  sub_2463C05A0();
  v47 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_13_1(v47))
  {
    v48 = OUTLINED_FUNCTION_5();
    v83[0] = OUTLINED_FUNCTION_5();
    *(_DWORD *)v48 = 134218242;
    if (v46 >> 62)
    {
      OUTLINED_FUNCTION_12_1();
      v49 = sub_2463C08B8();
      OUTLINED_FUNCTION_10();
    }
    else
    {
      v49 = *(_QWORD *)((v46 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    OUTLINED_FUNCTION_10();
    *(_QWORD *)(v0 + 184) = v49;
    sub_2463C078C();
    OUTLINED_FUNCTION_10();
    *(_WORD *)(v48 + 12) = 2080;
    v50 = sub_2463B1274(v46);
    *(_QWORD *)(v0 + 176) = sub_24639AE68(v50, v51, v83);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246381000, v45, v47, "#hal %ld device(s) match provided filter: %s", (uint8_t *)v48, 0x16u);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  v52 = *(_QWORD *)(v0 + 256);
  v53 = *(_QWORD *)(v0 + 240);
  swift_bridgeObjectRelease_n();

  OUTLINED_FUNCTION_15(v52, v53, v54, v55, v56, v57, v58, v59, v63, v65, (uint64_t)bufa, v69, v71, (uint64_t)loga, v76, v77, v79, typea);
  OUTLINED_FUNCTION_7();
  v60 = *(_QWORD *)(v0 + 192);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v60);
}

uint64_t sub_246386548(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v20;

  v20 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_24;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      v6 = 0;
      v7 = a3;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v8 = (id)MEMORY[0x249559828](v6, a1);
LABEL_7:
        v9 = v8;
        v10 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_23;
        v11 = a4();
        if (v12)
        {
          if (v11 == a2 && v12 == v7)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v14 = sub_2463C0900();
            swift_bridgeObjectRelease();
            if ((v14 & 1) == 0)
            {

LABEL_18:
              v7 = a3;
              goto LABEL_19;
            }
          }
          sub_2463C0810();
          sub_2463C0834();
          sub_2463C0840();
          sub_2463C081C();
          goto LABEL_18;
        }

LABEL_19:
        ++v6;
        if (v10 == v5)
        {
          v15 = v20;
          goto LABEL_26;
        }
      }
      if (v6 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      v5 = sub_2463C08B8();
      if (!v5)
        goto LABEL_25;
    }
    v8 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_7;
  }
LABEL_25:
  v15 = MEMORY[0x24BEE4AF8];
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_2463866F0(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_2463C0894();
    __break(1u);
  }
  else if (a1)
  {
    sub_2463C0504();
    result = sub_2463C06B4();
    *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_246386794(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2463867BC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2463867E4(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_2463873CC();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_24638685C(v6);
  return sub_2463C081C();
}

void sub_24638685C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  char v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *__dst;
  uint64_t v111;
  uint64_t v112;

  v3 = a1[1];
  v4 = sub_2463C08E8();
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_246386F78(0, v3, 1, a1);
      return;
    }
    goto LABEL_135;
  }
  v5 = v4;
  v6 = sub_2463866F0(v3 / 2);
  __dst = v7;
  v112 = v6;
  v108 = v3;
  v104 = a1;
  if (v3 <= 0)
  {
LABEL_97:
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v45 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_98:
    if (v45 < 2)
    {
      v95 = v108;
LABEL_111:
      swift_bridgeObjectRelease();
      if (v95 >= -1)
        goto LABEL_112;
      goto LABEL_139;
    }
    v96 = *v104;
    v95 = v108;
    while (1)
    {
      v97 = v45 - 2;
      if (v45 < 2)
        break;
      if (!v96)
        goto LABEL_143;
      v98 = v10;
      v99 = *(_QWORD *)&v10[16 * v97 + 32];
      v100 = *(_QWORD *)&v10[16 * v45 + 24];
      sub_246387068((id *)(v96 + 8 * v99), (id *)(v96 + 8 * *(_QWORD *)&v10[16 * v45 + 16]), v96 + 8 * v100, __dst);
      if (v1)
        goto LABEL_95;
      if (v100 < v99)
        goto LABEL_130;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v98 = sub_2463873B8((uint64_t)v98);
      if (v97 >= *((_QWORD *)v98 + 2))
        goto LABEL_131;
      v101 = &v98[16 * v97 + 32];
      *(_QWORD *)v101 = v99;
      *((_QWORD *)v101 + 1) = v100;
      v102 = *((_QWORD *)v98 + 2);
      if (v45 > v102)
        goto LABEL_132;
      memmove(&v98[16 * v45 + 16], &v98[16 * v45 + 32], 16 * (v102 - v45));
      v10 = v98;
      *((_QWORD *)v98 + 2) = v102 - 1;
      v45 = v102 - 1;
      if (v102 <= 2)
        goto LABEL_111;
    }
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
    return;
  }
  v105 = v5;
  v8 = 0;
  v9 = *a1;
  v103 = *a1 - 8;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v11 = v3;
  v111 = *a1;
  while (1)
  {
    v12 = v8++;
    v109 = v12;
    if (v8 < v11)
    {
      v106 = v10;
      v13 = *(void **)(v9 + 8 * v12);
      v14 = *(id *)(v9 + 8 * v8);
      v15 = v13;
      sub_2463C04F8();
      sub_2463C04F8();
      v16 = sub_2463C0564();
      v17 = sub_2463C0564();

      v12 = v109;
      v8 = v109 + 2;
      if (v109 + 2 < v11)
      {
        v18 = v109;
        v8 = v108;
        while (1)
        {
          v19 = v111 + 8 * v18;
          v20 = *(void **)(v19 + 8);
          v21 = *(id *)(v19 + 16);
          v22 = v20;
          sub_2463C04F8();
          sub_2463C04F8();
          v23 = sub_2463C0564();
          v24 = sub_2463C0564();

          if (v17 < v16 == v24 >= v23)
            break;
          v25 = v18 + 3;
          ++v18;
          if (v25 >= v108)
            goto LABEL_11;
        }
        v8 = v18 + 2;
LABEL_11:
        v12 = v109;
      }
      v10 = v106;
      if (v17 >= v16)
      {
        v9 = v111;
      }
      else
      {
        v9 = v111;
        if (v8 < v12)
          goto LABEL_136;
        if (v12 < v8)
        {
          v26 = (uint64_t *)(v103 + 8 * v8);
          v27 = v8;
          v28 = v12;
          v29 = (uint64_t *)(v111 + 8 * v12);
          do
          {
            if (v28 != --v27)
            {
              if (!v111)
                goto LABEL_142;
              v30 = *v29;
              *v29 = *v26;
              *v26 = v30;
            }
            ++v28;
            --v26;
            ++v29;
          }
          while (v28 < v27);
        }
      }
    }
    if (v8 < v108)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_134;
      if (v8 - v12 < v105)
      {
        if (__OFADD__(v12, v105))
          goto LABEL_137;
        if (v12 + v105 >= v108)
          v31 = v108;
        else
          v31 = v12 + v105;
        if (v31 < v12)
          goto LABEL_138;
        if (v8 != v31)
        {
          v107 = v10;
          v32 = v103 + 8 * v8;
          do
          {
            v33 = *(void **)(v9 + 8 * v8);
            v34 = v12;
            v35 = v32;
            while (1)
            {
              v36 = *(void **)v35;
              v37 = v33;
              v38 = v36;
              sub_2463C04F8();
              sub_2463C04F8();
              v39 = sub_2463C0564();
              v40 = sub_2463C0564();

              if (v40 >= v39)
                break;
              v9 = v111;
              if (!v111)
                goto LABEL_140;
              v41 = *(void **)v35;
              v33 = *(void **)(v35 + 8);
              *(_QWORD *)v35 = v33;
              *(_QWORD *)(v35 + 8) = v41;
              v35 -= 8;
              if (v8 == ++v34)
                goto LABEL_38;
            }
            v9 = v111;
LABEL_38:
            ++v8;
            v32 += 8;
            v12 = v109;
          }
          while (v8 != v31);
          v8 = v31;
          v10 = v107;
        }
      }
    }
    if (v8 < v12)
      goto LABEL_133;
    v42 = v10;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v10 = v42;
    else
      v10 = sub_2463872C4(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
    v44 = *((_QWORD *)v10 + 2);
    v43 = *((_QWORD *)v10 + 3);
    v45 = v44 + 1;
    v9 = v111;
    if (v44 >= v43 >> 1)
    {
      v94 = sub_2463872C4((char *)(v43 > 1), v44 + 1, 1, v10);
      v9 = v111;
      v10 = v94;
    }
    *((_QWORD *)v10 + 2) = v45;
    v46 = v10 + 32;
    v47 = &v10[16 * v44 + 32];
    *(_QWORD *)v47 = v12;
    *((_QWORD *)v47 + 1) = v8;
    if (v44)
      break;
    v45 = 1;
LABEL_88:
    v11 = v108;
    if (v8 >= v108)
      goto LABEL_98;
  }
  while (1)
  {
    v48 = v45 - 1;
    if (v45 >= 4)
    {
      v53 = &v46[16 * v45];
      v54 = *((_QWORD *)v53 - 8);
      v55 = *((_QWORD *)v53 - 7);
      v59 = __OFSUB__(v55, v54);
      v56 = v55 - v54;
      if (v59)
        goto LABEL_118;
      v58 = *((_QWORD *)v53 - 6);
      v57 = *((_QWORD *)v53 - 5);
      v59 = __OFSUB__(v57, v58);
      v51 = v57 - v58;
      v52 = v59;
      if (v59)
        goto LABEL_119;
      v60 = v45 - 2;
      v61 = &v46[16 * v45 - 32];
      v63 = *(_QWORD *)v61;
      v62 = *((_QWORD *)v61 + 1);
      v59 = __OFSUB__(v62, v63);
      v64 = v62 - v63;
      if (v59)
        goto LABEL_120;
      v59 = __OFADD__(v51, v64);
      v65 = v51 + v64;
      if (v59)
        goto LABEL_122;
      if (v65 >= v56)
      {
        v83 = &v46[16 * v48];
        v85 = *(_QWORD *)v83;
        v84 = *((_QWORD *)v83 + 1);
        v59 = __OFSUB__(v84, v85);
        v86 = v84 - v85;
        if (v59)
          goto LABEL_128;
        v76 = v51 < v86;
        goto LABEL_77;
      }
    }
    else
    {
      if (v45 != 3)
      {
        v77 = *((_QWORD *)v10 + 4);
        v78 = *((_QWORD *)v10 + 5);
        v59 = __OFSUB__(v78, v77);
        v70 = v78 - v77;
        v71 = v59;
        goto LABEL_71;
      }
      v50 = *((_QWORD *)v10 + 4);
      v49 = *((_QWORD *)v10 + 5);
      v59 = __OFSUB__(v49, v50);
      v51 = v49 - v50;
      v52 = v59;
    }
    if ((v52 & 1) != 0)
      goto LABEL_121;
    v60 = v45 - 2;
    v66 = &v46[16 * v45 - 32];
    v68 = *(_QWORD *)v66;
    v67 = *((_QWORD *)v66 + 1);
    v69 = __OFSUB__(v67, v68);
    v70 = v67 - v68;
    v71 = v69;
    if (v69)
      goto LABEL_123;
    v72 = &v46[16 * v48];
    v74 = *(_QWORD *)v72;
    v73 = *((_QWORD *)v72 + 1);
    v59 = __OFSUB__(v73, v74);
    v75 = v73 - v74;
    if (v59)
      goto LABEL_125;
    if (__OFADD__(v70, v75))
      goto LABEL_127;
    if (v70 + v75 >= v51)
    {
      v76 = v51 < v75;
LABEL_77:
      if (v76)
        v48 = v60;
      goto LABEL_79;
    }
LABEL_71:
    if ((v71 & 1) != 0)
      goto LABEL_124;
    v79 = &v46[16 * v48];
    v81 = *(_QWORD *)v79;
    v80 = *((_QWORD *)v79 + 1);
    v59 = __OFSUB__(v80, v81);
    v82 = v80 - v81;
    if (v59)
      goto LABEL_126;
    if (v82 < v70)
      goto LABEL_88;
LABEL_79:
    v87 = v48 - 1;
    if (v48 - 1 >= v45)
    {
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
      goto LABEL_129;
    }
    if (!v9)
      goto LABEL_141;
    v88 = v10;
    v89 = &v46[16 * v87];
    v90 = *(_QWORD *)v89;
    v91 = &v46[16 * v48];
    v92 = *((_QWORD *)v91 + 1);
    sub_246387068((id *)(v9 + 8 * *(_QWORD *)v89), (id *)(v9 + 8 * *(_QWORD *)v91), v9 + 8 * v92, __dst);
    if (v1)
      break;
    if (v92 < v90)
      goto LABEL_115;
    if (v48 > *((_QWORD *)v88 + 2))
      goto LABEL_116;
    *(_QWORD *)v89 = v90;
    *(_QWORD *)&v46[16 * v87 + 8] = v92;
    v93 = *((_QWORD *)v88 + 2);
    if (v48 >= v93)
      goto LABEL_117;
    v45 = v93 - 1;
    memmove(&v46[16 * v48], v91 + 16, 16 * (v93 - 1 - v48));
    v10 = v88;
    *((_QWORD *)v88 + 2) = v93 - 1;
    v9 = v111;
    if (v93 <= 2)
      goto LABEL_88;
  }
  v95 = v108;
LABEL_95:
  swift_bridgeObjectRelease();
  if (v95 < -1)
  {
    __break(1u);
    goto LABEL_97;
  }
LABEL_112:
  *(_QWORD *)((v112 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_2463C069C();
  swift_bridgeObjectRelease();
}

void sub_246386F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
    while (2)
    {
      v7 = *(void **)(v5 + 8 * v4);
      v8 = a1;
      v9 = v6;
      do
      {
        v10 = *(void **)v9;
        v11 = v7;
        v12 = v10;
        sub_2463C04F8();
        sub_2463C04F8();
        v13 = sub_2463C0564();
        v14 = sub_2463C0564();

        if (v14 >= v13)
          break;
        if (!v5)
        {
          __break(1u);
          return;
        }
        v15 = *(void **)v9;
        v7 = *(void **)(v9 + 8);
        *(_QWORD *)v9 = v7;
        *(_QWORD *)(v9 + 8) = v15;
        v9 -= 8;
        ++v8;
      }
      while (v4 != v8);
      ++v4;
      v6 += 8;
      if (v4 != a2)
        continue;
      break;
    }
  }
}

uint64_t sub_246387068(id *__src, id *a2, unint64_t a3, char *__dst)
{
  id *v6;
  id *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  char *v14;
  char *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  BOOL v22;
  id *v25;
  char *v26;
  id *v27;
  void *v28;
  char *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  char *v35;
  BOOL v36;
  char *v39;
  id *v40;
  unint64_t v41;
  id *v42;

  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = a2 - __src;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v9 >= v11)
  {
    sub_2463B1994((char *)a2, (uint64_t)(a3 - (_QWORD)a2) / 8, __dst);
    v39 = __dst;
    v12 = &__dst[8 * v11];
    if (v7 >= v6 || v10 < 8)
    {
LABEL_39:
      v14 = v39;
      goto LABEL_40;
    }
    v25 = (id *)(a3 - 8);
    while (1)
    {
      v42 = v6;
      v40 = v25 + 1;
      v26 = v12 - 8;
      v27 = v6 - 1;
      v28 = *(v6 - 1);
      v29 = v12;
      v30 = *((id *)v12 - 1);
      v31 = v28;
      sub_2463C04F8();
      sub_2463C04F8();
      v32 = sub_2463C0564();
      v33 = sub_2463C0564();

      if (v33 >= v32)
      {
        v35 = v39;
        v36 = v40 != (id *)v29 || v25 >= (id *)v29;
        v27 = (id *)v26;
        v12 = v26;
        v6 = v42;
        if (!v36)
          goto LABEL_35;
      }
      else
      {
        v34 = v40 != v42 || v25 >= v42;
        v35 = v39;
        v12 = v29;
        v6 = v27;
        if (!v34)
          goto LABEL_35;
      }
      *v25 = *v27;
LABEL_35:
      --v25;
      if (v6 <= v7 || v12 <= v35)
        goto LABEL_39;
    }
  }
  sub_2463B1994((char *)__src, a2 - __src, __dst);
  v12 = &__dst[8 * v9];
  v13 = (unint64_t)v6 >= a3 || v8 < 8;
  v14 = __dst;
  if (!v13)
  {
    v41 = a3;
    do
    {
      v15 = v12;
      v16 = *(void **)v14;
      v17 = *v6;
      v18 = v16;
      sub_2463C04F8();
      sub_2463C04F8();
      v19 = sub_2463C0564();
      v20 = sub_2463C0564();

      if (v20 >= v19)
      {
        v21 = (id *)v14;
        v22 = v7 == (id *)v14;
        v14 += 8;
      }
      else
      {
        v21 = v6;
        v22 = v7 == v6++;
      }
      v12 = v15;
      if (!v22)
        *v7 = *v21;
      ++v7;
    }
    while (v14 < v15 && (unint64_t)v6 < v41);
  }
  v6 = v7;
LABEL_40:
  sub_2463B1994(v14, (v12 - v14) / 8, (char *)v6);
  return 1;
}

char *sub_2463872C4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756F528);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2463873B8(uint64_t a1)
{
  return sub_2463872C4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_2463873CC()
{
  JUMPOUT(0x24955990CLL);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;

  return sub_2463867BC(v0);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;

  return sub_246386794(v0);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;

  return sub_246386794(v0);
}

uint64_t OUTLINED_FUNCTION_8_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  uint64_t v0;

  return sub_2463867BC(v0);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_13_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_2463C0720();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t (*a18)(void))
{
  return a18();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_arrayDestroy();
}

uint64_t IdentityNLv3Intent.domainOntologyNode.getter()
{
  return swift_retain();
}

uint64_t IdentityNLv3Intent.domainOntologyNode.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_release();
  *v1 = a1;
  return result;
}

uint64_t (*IdentityNLv3Intent.domainOntologyNode.modify())()
{
  return nullsub_1;
}

uint64_t IdentityNLv3Intent.intent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_3_2() + 20);
  v4 = OUTLINED_FUNCTION_5_1();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for IdentityNLv3Intent()
{
  uint64_t result;

  result = qword_25756F590;
  if (!qword_25756F590)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246387520()
{
  return sub_2463888A8(&qword_257570280, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
}

uint64_t sub_246387544()
{
  return sub_2463888A8(&qword_25756F530, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
}

uint64_t sub_246387568@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  int *v3;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = (int *)OUTLINED_FUNCTION_3_2();
  v4 = v3[6];
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756EFD8);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1();
  v5 = OUTLINED_FUNCTION_4_2();
  *(uint64_t *)((char *)a2 + v4) = v5;
  v27 = v5;
  v6 = v3[7];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756EFE0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_1();
  v8 = OUTLINED_FUNCTION_4_2();
  *(uint64_t *)((char *)a2 + v6) = v8;
  v26 = v8;
  v9 = v3[8];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756EFE8);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6_2();
  v11 = OUTLINED_FUNCTION_4_2();
  *(uint64_t *)((char *)a2 + v9) = v11;
  v12 = v3[9];
  v13 = _s24UserIdentityOntologyNodeCMa();
  OUTLINED_FUNCTION_8();
  swift_retain();
  v14 = sub_2463A4D58();
  *(uint64_t *)((char *)a2 + v12) = v14;
  v15 = v3[10];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756EFF0);
  OUTLINED_FUNCTION_8();
  swift_retain();
  v17 = OUTLINED_FUNCTION_4_2();
  *(uint64_t *)((char *)a2 + v15) = v17;
  v18 = (char *)a2 + v3[5];
  v19 = OUTLINED_FUNCTION_5_1();
  v25 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v18, a1, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F5E0);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_2463C1470;
  *(_QWORD *)(v20 + 56) = v28;
  *(_QWORD *)(v20 + 64) = sub_246388868(&qword_25756F5E8, &qword_25756EFD8);
  *(_QWORD *)(v20 + 32) = v27;
  *(_QWORD *)(v20 + 96) = v7;
  *(_QWORD *)(v20 + 104) = sub_246388868(&qword_25756F5F0, &qword_25756EFE0);
  *(_QWORD *)(v20 + 72) = v26;
  *(_QWORD *)(v20 + 136) = v10;
  v21 = sub_246388868((unint64_t *)&qword_25756F5F8, &qword_25756EFE8);
  v22 = MEMORY[0x24BE9EB08];
  *(_QWORD *)(v20 + 112) = v11;
  *(_QWORD *)(v20 + 176) = v13;
  *(_QWORD *)(v20 + 184) = v22;
  *(_QWORD *)(v20 + 144) = v21;
  *(_QWORD *)(v20 + 152) = v14;
  *(_QWORD *)(v20 + 216) = v16;
  *(_QWORD *)(v20 + 224) = sub_246388868(&qword_25756F600, &qword_25756EFF0);
  *(_QWORD *)(v20 + 192) = v17;
  sub_2463C0168();
  OUTLINED_FUNCTION_8();
  swift_retain();
  OUTLINED_FUNCTION_1_1();
  v23 = sub_2463C015C();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(a1, v19);
  *a2 = v23;
  return result;
}

uint64_t sub_246387820()
{
  return sub_246387838();
}

uint64_t sub_24638782C()
{
  return sub_246387838();
}

uint64_t sub_246387838()
{
  uint64_t v1;

  OUTLINED_FUNCTION_3_2();
  sub_2463888A8(&qword_257570280, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  swift_retain();
  sub_2463C0240();
  swift_release();
  return v1;
}

uint64_t sub_2463878B8()
{
  return sub_246387838();
}

uint64_t sub_2463878C4()
{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_3_2();
  sub_2463888A8(&qword_257570280, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  sub_2463C0240();
  return v1;
}

uint64_t sub_246387928()
{
  if ((sub_246387958() & 1) != 0)
    return 2;
  if ((sub_246387C08() & 1) != 0)
    return 1;
  return 3;
}

uint64_t sub_246387958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  _BYTE v14[16];

  v1 = v0;
  type metadata accessor for IdentityNLv3Intent();
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v14[-v5];
  sub_2463888A8(&qword_257570280, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  sub_2463C0240();
  if (v14[15] == 6)
  {
    sub_2463888E8(v0, (uint64_t)v6);
    goto LABEL_3;
  }
  IdentityVerb.rawValue.getter();
  if (v9 == 0x796669646F6DLL && v8 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    sub_2463888E8(v0, (uint64_t)v6);
  }
  else
  {
    v11 = sub_2463C0900();
    swift_bridgeObjectRelease();
    sub_2463888E8(v0, (uint64_t)v6);
    if ((v11 & 1) == 0)
    {
LABEL_3:
      sub_2463C0240();
      v7 = v14[14];
      sub_24638892C((uint64_t)v6);
      sub_2463888E8(v1, (uint64_t)v4);
      if (v7 != 6)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  sub_24638892C((uint64_t)v6);
  sub_2463888E8(v0, (uint64_t)v4);
LABEL_13:
  v12 = sub_2463C024C();
  if (*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  swift_bridgeObjectRelease();
LABEL_16:
  sub_24638892C((uint64_t)v4);
  return 0;
}

uint64_t sub_246387C08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  _BYTE v17[16];

  v1 = type metadata accessor for IdentityNLv3Intent();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = &v17[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v17[-v5];
  sub_2463888A8(&qword_257570280, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  sub_2463C0240();
  if (v17[15] == 6)
  {
    sub_2463888E8(v0, (uint64_t)v6);
  }
  else
  {
    IdentityVerb.rawValue.getter();
    if (v8 == 0x796669746E656469 && v7 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      sub_2463888E8(v0, (uint64_t)v6);
      goto LABEL_19;
    }
    v10 = sub_2463C0900();
    swift_bridgeObjectRelease();
    sub_2463888E8(v0, (uint64_t)v6);
    if ((v10 & 1) != 0)
      goto LABEL_19;
  }
  sub_2463C0240();
  if (v17[14] == 6)
  {
    sub_24638892C((uint64_t)v6);
    sub_2463888E8(v0, (uint64_t)v4);
    goto LABEL_23;
  }
  IdentityVerb.rawValue.getter();
  if (v12 != 0x74736575516B7361 || v11 != 0xEB000000006E6F69)
  {
    v14 = sub_2463C0900();
    swift_bridgeObjectRelease();
    sub_24638892C((uint64_t)v6);
    sub_2463888E8(v0, (uint64_t)v4);
    if ((v14 & 1) == 0)
      goto LABEL_23;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  sub_24638892C((uint64_t)v6);
  sub_2463888E8(v0, (uint64_t)v4);
LABEL_20:
  v15 = sub_2463C024C();
  if (*(_QWORD *)(v15 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  swift_bridgeObjectRelease();
LABEL_23:
  sub_24638892C((uint64_t)v4);
  return 0;
}

uint64_t sub_246387F50()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_2();
  sub_2463888A8(&qword_257570280, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  v0 = sub_2463C024C();
  if (*(_QWORD *)(v0 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_246388078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_2463C0384();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_2463880B8()
{
  return swift_retain();
}

uint64_t sub_2463880C0()
{
  return sub_246387838();
}

uint64_t sub_2463880E4()
{
  return sub_246387838();
}

uint64_t sub_246388100()
{
  return sub_246387838();
}

uint64_t sub_246388120()
{
  sub_2463888A8(&qword_25756F608, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  return sub_2463C01E0();
}

uint64_t sub_246388168()
{
  sub_2463888A8(&qword_25756F608, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  return sub_2463C01C8();
}

uint64_t sub_2463881A0()
{
  sub_2463888A8(&qword_25756F608, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
  return sub_2463C01D4();
}

uint64_t *initializeBufferWithCopyOfBuffer for IdentityNLv3Intent(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2463C0384();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_retain();
    v12(v9, v10, v11);
    v13 = a3[7];
    *(uint64_t *)((char *)v7 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v7 + v13) = *(uint64_t *)((char *)a2 + v13);
    v14 = a3[9];
    *(uint64_t *)((char *)v7 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(uint64_t *)((char *)v7 + v14) = *(uint64_t *)((char *)a2 + v14);
    *(uint64_t *)((char *)v7 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t destroy for IdentityNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2463C0384();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for IdentityNLv3Intent(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2463C0384();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_retain();
  v10(v7, v8, v9);
  v11 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  v12 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for IdentityNLv3Intent(_QWORD *a1, _QWORD *a2, int *a3)
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
  v9 = sub_2463C0384();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_retain();
  swift_release();
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *initializeWithTake for IdentityNLv3Intent(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2463C0384();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  v11 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  return a1;
}

_QWORD *assignWithTake for IdentityNLv3Intent(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2463C0384();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_release();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_release();
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_release();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  swift_release();
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityNLv3Intent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2463886C0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    v8 = OUTLINED_FUNCTION_5_1();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for IdentityNLv3Intent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_24638873C(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = OUTLINED_FUNCTION_5_1();
    return (_QWORD *)__swift_storeEnumTagSinglePayload((uint64_t)v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2463887A4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2463C0384();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249559D68](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_246388868(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249559D74](MEMORY[0x24BE9EF30], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2463888A8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for IdentityNLv3Intent();
    result = MEMORY[0x249559D74](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2463888E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IdentityNLv3Intent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24638892C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IdentityNLv3Intent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return 0x797469746E656469;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return type metadata accessor for IdentityNLv3Intent();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_2463C0174();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_2463C0384();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_retain();
}

uint64_t sub_2463889AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t);

  v1 = OUTLINED_FUNCTION_7_2();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v3, v1);
  v4 = sub_2463C05A0();
  v5 = sub_2463C0720();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v4, v5, "EstablishUserFlowStrategy.actionForInput() called", v6);
    OUTLINED_FUNCTION_0();
  }

  v7 = OUTLINED_FUNCTION_10_2();
  v8(v7);
  return sub_2463BFCF4();
}

uint64_t sub_246388AC0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[13] = a1;
  v2 = sub_2463C0024();
  v1[14] = v2;
  v1[15] = *(_QWORD *)(v2 - 8);
  v1[16] = OUTLINED_FUNCTION_11_1();
  v1[17] = OUTLINED_FUNCTION_11_1();
  v3 = OUTLINED_FUNCTION_7_2();
  v1[18] = v3;
  v1[19] = *(_QWORD *)(v3 - 8);
  v1[20] = OUTLINED_FUNCTION_11_1();
  v1[21] = OUTLINED_FUNCTION_11_1();
  v1[22] = OUTLINED_FUNCTION_11_1();
  v1[23] = OUTLINED_FUNCTION_11_1();
  return swift_task_switch();
}

uint64_t sub_246388B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 152);
  v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 144), (uint64_t)qword_2575745E0);
  v3 = *(void (**)(uint64_t))(v1 + 16);
  v4 = OUTLINED_FUNCTION_10_2();
  v3(v4);
  v5 = sub_2463C05A0();
  v6 = sub_2463C0720();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v5, v6, "EstablishUserFlowStrategy.makeIntentFromParse() called", v7);
    OUTLINED_FUNCTION_0();
  }
  v8 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 184);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(_QWORD *)(v0 + 152);

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v9, v10);
  sub_2463A5CA0(v8, (uint64_t *)(v0 + 56));
  v13 = *(_QWORD *)(v0 + 144);
  if (*(_QWORD *)(v0 + 80))
  {
    v14 = *(_QWORD *)(v0 + 176);
    sub_246389878((__int128 *)(v0 + 56), v0 + 16);
    type metadata accessor for UserIdentifyIntent();
    sub_2463961A8((_QWORD *)(v0 + 16));
    v16 = v15;
    ((void (*)(uint64_t, uint64_t, uint64_t))v3)(v14, v2, v13);
    v17 = sub_2463C05A0();
    v18 = sub_2463C0720();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v19 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v17, v18, "Finished creating intent from parse", v19);
      OUTLINED_FUNCTION_0();
    }
    v20 = *(_QWORD *)(v0 + 176);
    v21 = *(_QWORD *)(v0 + 144);

    v12(v20, v21);
    if (objc_msgSend(v16, sel_caseType) != (id)4)
    {
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void *))(v0 + 8))(v16);
    }
    v22 = OUTLINED_FUNCTION_10_2();
    v3(v22);
    v23 = sub_2463C05A0();
    v24 = sub_2463C072C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v25 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v23, v24, "Unsupported Intent Case Type", v25);
      OUTLINED_FUNCTION_0();
    }
    v26 = *(_QWORD *)(v0 + 168);
    v27 = *(_QWORD *)(v0 + 144);

    v12(v26, v27);
    type metadata accessor for IdentityFlowError();
    OUTLINED_FUNCTION_8_2();
    v28 = OUTLINED_FUNCTION_6_3();
    sub_246389838((unint64_t *)&qword_257570250, 255, (uint64_t (*)(uint64_t))type metadata accessor for IdentityFlowError, (uint64_t)"i*=\vhJ");
    OUTLINED_FUNCTION_9_1();
    *v29 = v28;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    v50 = v12;
    v51 = *(_QWORD *)(v0 + 136);
    v31 = *(_QWORD *)(v0 + 112);
    v30 = *(_QWORD *)(v0 + 120);
    v32 = *(_QWORD *)(v0 + 104);
    sub_2463897F8(v0 + 56);
    v33 = OUTLINED_FUNCTION_10_2();
    v3(v33);
    v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
    v34(v51, v32, v31);
    v35 = sub_2463C05A0();
    v36 = sub_2463C072C();
    v37 = os_log_type_enabled(v35, v36);
    v38 = *(_QWORD *)(v0 + 160);
    v40 = *(_QWORD *)(v0 + 136);
    v39 = *(_QWORD *)(v0 + 144);
    if (v37)
    {
      v41 = *(_QWORD *)(v0 + 128);
      v49 = *(_QWORD *)(v0 + 120);
      v42 = *(_QWORD *)(v0 + 112);
      v43 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      *(_DWORD *)v43 = 136315138;
      v34(v41, v40, v42);
      v44 = sub_2463C0624();
      *(_QWORD *)(v0 + 96) = sub_24639AE68(v44, v45, &v52);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v40, v42);
      _os_log_impl(&dword_246381000, v35, v36, "Unable to make intent from parse %s", v43, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112));

    v50(v38, v39);
    type metadata accessor for IdentityFlowError();
    OUTLINED_FUNCTION_8_2();
    v47 = OUTLINED_FUNCTION_6_3();
    sub_246389838((unint64_t *)&qword_257570250, 255, (uint64_t (*)(uint64_t))type metadata accessor for IdentityFlowError, (uint64_t)"i*=\vhJ");
    OUTLINED_FUNCTION_9_1();
    *v48 = v47;
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2463890D4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EstablishUserFlowStrategy()
{
  return objc_opt_self();
}

uint64_t sub_246389104()
{
  return sub_2463889AC();
}

uint64_t sub_246389118(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246389164;
  return sub_246388AC0(a1);
}

uint64_t sub_246389164(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_2_3();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_24638919C()
{
  type metadata accessor for EstablishUserFlowStrategy();
  return sub_2463BFF04();
}

uint64_t sub_2463891D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BFEF8();
}

uint64_t sub_246389254(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v19[2];

  v5 = sub_2463BFBB0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_7_2();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v9, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v2, v11, v9);
  v12 = sub_2463C05A0();
  v13 = sub_2463C0720();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    v19[1] = a1;
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v12, v13, "EstablishUserIntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v14);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v9);
  sub_2463BFC10();
  v15 = objc_allocWithZone((Class)type metadata accessor for EstablishUserIntentHandler());
  swift_retain();
  objc_msgSend(v15, sel_init);
  type metadata accessor for UserIdentifyIntent();
  v16 = a2;
  sub_2463BFBA4();
  v17 = sub_2463BFC04();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v17;
}

uint64_t sub_24638944C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9F4();
}

uint64_t sub_2463894D0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9E8();
}

uint64_t sub_246389554()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9DC();
}

uint64_t sub_2463895D8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_24638966C;
  return sub_2463BF9D0();
}

uint64_t sub_24638966C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_3();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_246389698()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BFA84();
}

uint64_t sub_24638972C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = sub_246389254(a1, a2);
  return sub_2463897E8(*(uint64_t (**)(uint64_t))(v2 + 8), v2, v3);
}

uint64_t sub_246389764(uint64_t a1, uint64_t a2)
{
  return sub_246389838(&qword_25756F6D0, a2, (uint64_t (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy, (uint64_t)"\r3=\vHZ");
}

uint64_t sub_246389790(uint64_t a1, uint64_t a2)
{
  return sub_246389838(qword_25756F6D8, a2, (uint64_t (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy, (uint64_t)&unk_2463C15EC);
}

uint64_t sub_2463897BC(uint64_t a1, uint64_t a2)
{
  return sub_246389838(qword_25756F700, a2, (uint64_t (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy, (uint64_t)&unk_2463C1624);
}

uint64_t sub_2463897E8(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_2463897F8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570290);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246389838(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x249559D74](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246389878(__int128 *a1, uint64_t a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_4_3(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_2463B0A74(0);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_2463C05B8();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_246389938(uint64_t a1)
{
  os_log_type_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t result;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];
  uint64_t v38;

  v3 = sub_2463C05B8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v34 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v34 - v11;
  v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntent()), sel_init);
  if (!a1)
  {
    if (qword_25756EFC0 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
    v25 = sub_2463C05A0();
    v26 = sub_2463C072C();
    if (OUTLINED_FUNCTION_3_3(v26))
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_246381000, v25, v1, "Either the homeUserId or name must be provided", v27, 2u);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    goto LABEL_26;
  }
  v14 = v13;
  sub_2463BAB60(0x696669746E656469, 0xEA00000000007265, a1, v37);
  if (!v38)
  {
    sub_246389E40((uint64_t)v37);
    goto LABEL_6;
  }
  if ((OUTLINED_FUNCTION_1_3() & 1) == 0)
  {
LABEL_6:
    sub_2463BAB60(1701667182, 0xE400000000000000, a1, v37);
    if (v38)
    {
      if ((OUTLINED_FUNCTION_1_3() & 1) != 0)
      {
        sub_246396778(v35, v36, v14);
        v15 = 2;
        goto LABEL_9;
      }
      v28 = v3;
    }
    else
    {
      v28 = v3;
      sub_246389E40((uint64_t)v37);
    }
    if (qword_25756EFC0 != -1)
      swift_once();
    v29 = __swift_project_value_buffer(v28, (uint64_t)qword_2575745F8);
    v30 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v12, v29, v28);
    v31 = sub_2463C05A0();
    v32 = sub_2463C072C();
    if (OUTLINED_FUNCTION_3_3(v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_246381000, v31, (os_log_type_t)v14, "Either the homeUserId or name must be provided", v33, 2u);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v30);
LABEL_26:
    result = sub_2463C08A0();
    __break(1u);
    return result;
  }
  sub_24638F848(v35, v36, v14);
  v15 = 1;
LABEL_9:
  swift_bridgeObjectRelease();
  if (qword_25756EFC0 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v16, v3);
  v17 = sub_2463C05A0();
  v18 = sub_2463C0720();
  if (os_log_type_enabled(v17, v18))
  {
    v34[1] = v3;
    v19 = (uint8_t *)OUTLINED_FUNCTION_5();
    v20 = OUTLINED_FUNCTION_5();
    v34[0] = v4;
    v37[0] = v20;
    *(_DWORD *)v19 = 136315138;
    v21 = SwitchType.description.getter();
    v35 = sub_24639AE68(v21, v22, v37);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246381000, v17, v18, "Setting switchType with %s", v19, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
  objc_msgSend(v14, sel_setSwitchType_, v15);
  return (uint64_t)v14;
}

uint64_t sub_246389E40(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F730);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_dynamicCast();
}

BOOL OUTLINED_FUNCTION_3_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL sub_246389EA4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_246389EB4()
{
  return sub_2463C0984();
}

uint64_t sub_246389ED8()
{
  sub_2463C0978();
  sub_2463C0984();
  return sub_2463C0990();
}

BOOL sub_246389F1C(char *a1, char *a2)
{
  return sub_246389EA4(*a1, *a2);
}

uint64_t sub_246389F28()
{
  return sub_246389ED8();
}

uint64_t sub_246389F30()
{
  return sub_246389EB4();
}

uint64_t sub_246389F38()
{
  sub_2463C0978();
  sub_2463C0984();
  return sub_2463C0990();
}

uint64_t sub_246389F78()
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
  _BYTE v10[40];
  _BYTE v11[40];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_12_0();
  v3 = v2 - v1;
  v4 = OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_29(v3, v5, v6, v4);
  sub_2463C0030();
  sub_2463BFF58();
  type metadata accessor for BaseDialogProvider();
  v7 = OUTLINED_FUNCTION_34();
  sub_2463C051C();
  v8 = sub_2463C0510();
  return sub_24638BBC8(v3, (uint64_t)v11, (uint64_t)v10, v7, v8, 0);
}

uint64_t sub_24638A030(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - v7;
  v9 = OUTLINED_FUNCTION_23();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  sub_24638C5C4((uint64_t)v8, (uint64_t)v6);
  v10 = v1 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input;
  swift_beginAccess();
  sub_24638C540((uint64_t)v6, v10);
  swift_endAccess();
  *(_BYTE *)(v1 + 16) = 1;
  return 1;
}

uint64_t sub_24638A138()
{
  type metadata accessor for SwitchProfileWrapperFlow();
  sub_24638C588((unint64_t *)&qword_25756F948, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileWrapperFlow, (uint64_t)&unk_2463C1870);
  return sub_2463BFB44();
}

uint64_t sub_24638A1AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[5] = a1;
  v2[6] = v1;
  v3 = OUTLINED_FUNCTION_7_2();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = OUTLINED_FUNCTION_11_1();
  v2[10] = OUTLINED_FUNCTION_11_1();
  v2[11] = OUTLINED_FUNCTION_11_1();
  v2[12] = OUTLINED_FUNCTION_11_1();
  v4 = sub_2463C0024();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  v2[16] = OUTLINED_FUNCTION_3_4();
  v5 = OUTLINED_FUNCTION_23();
  v2[17] = v5;
  v2[18] = *(_QWORD *)(v5 - 8);
  v2[19] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

void sub_24638A260()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  char v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v2 = v0[16];
  v3 = v0[17];
  v4 = v0[6] + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input;
  swift_beginAccess();
  sub_24638C688(v4, v2, &qword_25756F940);
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) != 1)
  {
    v13 = v0[6];
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[18] + 32))(v0[19], v0[16], v0[17]);
    __asm { BR              X10 }
  }
  sub_24638C6C8(v0[16], &qword_25756F940);
  if (qword_25756EFB8 != -1)
    swift_once();
  OUTLINED_FUNCTION_17();
  v7 = *(NSObject **)(v1 + 72);
  v6 = (uint64_t *)(v1 + 72);
  v5 = v7;
  v8 = *(v6 - 1);
  OUTLINED_FUNCTION_4_4(v9, (uint64_t)qword_2575745E0);
  sub_2463C05A0();
  v10 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_7_3(v10);
  OUTLINED_FUNCTION_33();
  if ((v11 & 1) != 0)
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v12 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v5, (os_log_type_t)v8, "SwitchProfileWrapperFlow.execute Input is nil. Error executing request", v12);
    OUTLINED_FUNCTION_0();
  }
  v14 = *v6;
  v17 = v0 + 7;
  v15 = v0[7];
  v16 = v17[1];

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_24638A720()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24638A754()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24638A7C4()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24638A7F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags + 24);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags), v1);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2) & 1) == 0)
    return 0;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState), *(_QWORD *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState + 24));
  OUTLINED_FUNCTION_18();
  return sub_2463BFC70() & 1;
}

uint64_t sub_24638A87C(uint64_t a1)
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
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v26;
  _BYTE v27[24];
  uint64_t v28;
  _BYTE v29[40];
  _BYTE v30[40];
  __int128 v31[3];

  v2 = v1;
  v4 = OUTLINED_FUNCTION_23();
  v26 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12_0();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_7_2();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v8, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v1, v10, v8);
  v11 = sub_2463C05A0();
  v12 = sub_2463C0738();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v13 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v11, v12, "Target device resolution is required, pushing device resolution flow", v13);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v1, v8);
  *(_BYTE *)(v1 + 16) = 2;
  v14 = v1 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState;
  sub_24638C500(v1 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState, (uint64_t)v31);
  type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  v15 = OUTLINED_FUNCTION_34();
  sub_246389878(v31, v15 + 16);
  *(_QWORD *)(v15 + 56) = 0;
  *(_QWORD *)(v15 + 64) = 0;
  *(_BYTE *)(v15 + 72) = 1;
  *(_OWORD *)(v15 + 80) = 0u;
  *(_OWORD *)(v15 + 96) = 0u;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v7, a1, v4);
  sub_24638C500(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceResolutionProvider, (uint64_t)v31);
  sub_24638C500(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher, (uint64_t)v30);
  sub_24638C500(v14, (uint64_t)v29);
  sub_24638C500(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_dialogProvider, (uint64_t)v27);
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v28);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_12_0();
  v19 = (uint64_t *)(v18 - v17);
  (*(void (**)(uint64_t))(v20 + 16))(v18 - v17);
  v21 = *v19;
  v22 = swift_retain();
  v23 = sub_24638C268(v22, v7, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  *(_QWORD *)&v31[0] = v23;
  v24 = OUTLINED_FUNCTION_34();
  *(_QWORD *)(v24 + 16) = sub_24638C4B4;
  *(_QWORD *)(v24 + 24) = v2;
  type metadata accessor for ExecutionDeviceResolutionFlow();
  sub_24638C588(&qword_25756F938, (uint64_t (*)(uint64_t))type metadata accessor for ExecutionDeviceResolutionFlow, (uint64_t)&unk_2463C21D0);
  swift_retain();
  sub_2463BFDD8();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24638ABBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  v4 = sub_2463C0024();
  v3[11] = v4;
  v3[12] = *(_QWORD *)(v4 - 8);
  v3[13] = OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  v3[14] = OUTLINED_FUNCTION_3_4();
  v5 = OUTLINED_FUNCTION_7_2();
  v3[15] = v5;
  v3[16] = *(_QWORD *)(v5 - 8);
  v3[17] = OUTLINED_FUNCTION_11_1();
  v3[18] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24638AC4C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint8_t *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD *v23;
  _OWORD v25[2];
  uint64_t v26;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[16];
  v2 = __swift_project_value_buffer(v0[15], (uint64_t)qword_2575745E0);
  v0[19] = v2;
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v0[20] = v3;
  OUTLINED_FUNCTION_12(v2, v3);
  swift_retain_n();
  v4 = sub_2463C05A0();
  v5 = sub_2463C0714();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = v0[10];
    v7 = (uint8_t *)swift_slowAlloc();
    *(_QWORD *)&v25[0] = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    v8 = *(void **)(v6 + 24);
    if (v8)
    {
      v9 = objc_msgSend(v8, sel_description);
      v10 = sub_2463C0618();
      v12 = v11;

    }
    else
    {
      v12 = 0xE500000000000000;
      v10 = 0x3E6C696E3CLL;
    }
    v0[7] = sub_24639AE68(v10, v12, (uint64_t *)v25);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_246381000, v4, v5, "Executing RCHFlow with remoteDevice: %s", v7, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  v13 = v0[16];
  swift_release_n();

  v14 = *(void (**)(uint64_t))(v13 + 8);
  v15 = OUTLINED_FUNCTION_18();
  v14(v15);
  v0[21] = v14;
  v16 = v0[14];
  v17 = v0[10];
  sub_24638C500(v17 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState, (uint64_t)(v0 + 2));
  v18 = *(void **)(v17 + 24);
  v19 = sub_2463BFD84();
  memset(v25, 0, sizeof(v25));
  v26 = 0;
  OUTLINED_FUNCTION_29(v16, v20, v21, v19);
  type metadata accessor for SwitchProfileFlowStrategy();
  OUTLINED_FUNCTION_8();
  v22 = v18;
  v0[22] = sub_24638CE40((uint64_t)(v0 + 2), v18, (uint64_t)v25, 0, 0, v16);
  sub_2463BFFE8();
  v23 = (_QWORD *)swift_task_alloc();
  v0[23] = v23;
  *v23 = v0;
  v23[1] = sub_24638AF2C;
  return sub_24638D044(v0[13], 0);
}

uint64_t sub_24638AF2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 96);
  if (!v1)
    *(_QWORD *)(v4 + 200) = a1;
  OUTLINED_FUNCTION_31(v5);
  OUTLINED_FUNCTION_21();
  return swift_task_switch();
}

uint64_t sub_24638AFAC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory), *(_QWORD *)(v2 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory + 24));
  v3 = *(void **)(v2 + 24);
  v4 = v3;
  v5 = OUTLINED_FUNCTION_18();
  sub_2463B5284(v5, v6, (uint64_t)v1, v3);

  sub_2463BFDF0();
  swift_release();

  swift_release();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  return OUTLINED_FUNCTION_9_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24638B04C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(NSObject *, uint64_t, uint64_t);
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(void (**)(NSObject *, uint64_t, uint64_t))(v0 + 160);
  v3 = *(NSObject **)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 120);
  swift_release();
  v2(v3, v1, v4);
  v5 = v3;
  sub_2463C05A0();
  v6 = OUTLINED_FUNCTION_16_0();
  if (OUTLINED_FUNCTION_22(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v3, (os_log_type_t)v3, "Error thrown while creating RCH flow", v7);
    OUTLINED_FUNCTION_0();
  }
  v8 = *(void **)(v0 + 192);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
  v10 = *(_QWORD *)(v0 + 136);
  v11 = *(_QWORD *)(v0 + 120);

  v9(v10, v11);
  sub_2463BFDFC();

  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  return OUTLINED_FUNCTION_9_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24638B124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8[5];

  v1 = OUTLINED_FUNCTION_7_2();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v3, v1);
  v4 = sub_2463C05A0();
  v5 = sub_2463C0720();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v4, v5, "Device resolution was required but none were found. Dialoging failure and completing the flow.", v6);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  sub_24638C500(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher, (uint64_t)v8);
  sub_2463BF9C4();
  OUTLINED_FUNCTION_8();
  swift_retain();
  v8[0] = sub_2463BF9B8();
  sub_2463BFDE4();
  return swift_release();
}

uint64_t sub_24638B2A8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_2463C05B8();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24638B308()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  _QWORD *v9;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[5];
  v2 = v0[4];
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_12(v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v4 = sub_2463C05A0();
  v5 = sub_2463C0720();
  if (OUTLINED_FUNCTION_22(v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v4, (os_log_type_t)v2, "Returning remoteDeviceNotFound", v6);
    OUTLINED_FUNCTION_0();
  }

  v7 = OUTLINED_FUNCTION_18();
  v8(v7);
  v9 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_24638B41C;
  return sub_246394900(v0[2]);
}

uint64_t sub_24638B41C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_14_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_24638B454(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = OUTLINED_FUNCTION_7_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_12_0();
  v8 = v7 - v6;
  if (!a1)
  {
    v9 = 3;
    goto LABEL_7;
  }
  if (a1 == (void *)1)
  {
    v9 = 5;
LABEL_7:
    *(_BYTE *)(v1 + 16) = v9;
    return;
  }
  if (a1 != (void *)2)
  {
    v10 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = a1;
    v11 = a1;

    v9 = 4;
    goto LABEL_7;
  }
  v16 = v5;
  v17 = v8;
  v18 = v4;
  if (qword_25756EFB8 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v18, (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_12(v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16));
  v13 = sub_2463C05A0();
  v14 = sub_2463C072C();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v15 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v13, v14, "Unexpected device resolution result", v15);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
  OUTLINED_FUNCTION_28();
  __break(1u);
}

uint64_t sub_24638B5E8()
{
  uint64_t v0;

  sub_24638C6C8(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input, &qword_25756F940);
  OUTLINED_FUNCTION_12_2(OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState);
  OUTLINED_FUNCTION_12_2(OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceResolutionProvider);
  OUTLINED_FUNCTION_12_2(OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory);
  OUTLINED_FUNCTION_12_2(OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags);
  OUTLINED_FUNCTION_12_2(OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher);
  sub_24638C60C(v0 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_identityDialogs);
  OUTLINED_FUNCTION_12_2(OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_dialogProvider);
  return v0;
}

uint64_t sub_24638B674()
{
  sub_24638B5E8();
  return swift_deallocClassInstance();
}

uint64_t sub_24638B698()
{
  return type metadata accessor for SwitchProfileWrapperFlow();
}

uint64_t type metadata accessor for SwitchProfileWrapperFlow()
{
  uint64_t result;

  result = qword_25756F7A0;
  if (!qword_25756F7A0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24638B6D8()
{
  unint64_t v0;

  sub_24638B774();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_24638B774()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25756F7C0)
  {
    sub_2463BFFF4();
    v0 = sub_2463C0780();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25756F7C0);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SwitchProfileWrapperFlow.State(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 5) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SwitchProfileWrapperFlow.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_24638B8AC + 4 * byte_2463C174B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24638B8E0 + 4 * byte_2463C1746[v4]))();
}

uint64_t sub_24638B8E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24638B8E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24638B8F0);
  return result;
}

uint64_t sub_24638B8FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24638B904);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24638B908(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24638B910(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24638B91C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24638B924(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SwitchProfileWrapperFlow.State()
{
  return &type metadata for SwitchProfileWrapperFlow.State;
}

unint64_t sub_24638B940()
{
  unint64_t result;

  result = qword_25756F910[0];
  if (!qword_25756F910[0])
  {
    result = MEMORY[0x249559D74]("\t2=\v", &type metadata for SwitchProfileWrapperFlow.State);
    atomic_store(result, qword_25756F910);
  }
  return result;
}

uint64_t sub_24638B97C(uint64_t a1)
{
  sub_24638A030(a1);
  return 1;
}

uint64_t sub_24638B9A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24638BA08;
  return sub_2463BFB74();
}

uint64_t sub_24638BA08(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_4();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_24638BA4C()
{
  return sub_24638A138();
}

uint64_t sub_24638BA6C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24638BAC0;
  return sub_24638A1AC(a1);
}

uint64_t sub_24638BAC0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24638BAFC()
{
  type metadata accessor for SwitchProfileWrapperFlow();
  return sub_2463BFB80();
}

uint64_t sub_24638BB28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24638BAC0;
  return sub_24638B2A8(a1, v1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_24638BBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[24];
  ValueMetadata *v22;
  _UNKNOWN **v23;
  _QWORD v24[3];
  uint64_t v25;
  char **v26;

  v25 = type metadata accessor for BaseDialogProvider();
  v26 = &off_251795888;
  v24[0] = a4;
  v22 = &type metadata for IdentityFlowFactoryImpl;
  v23 = &off_251795D20;
  type metadata accessor for SwitchProfileWrapperFlow();
  v12 = swift_allocObject();
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (uint64_t *)&v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, (uint64_t)v22);
  MEMORY[0x24BDAC7A8](v17);
  (*(void (**)(void))(v18 + 16))();
  v19 = sub_24638BD30(a1, a2, a3, *v15, a5, a6, v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v19;
}

uint64_t sub_24638BD30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;
  __int128 v20[2];
  _BYTE v21[40];
  _BYTE v22[40];
  _QWORD __src[11];
  __int128 v24;
  ValueMetadata *v25;
  _UNKNOWN **v26;
  __int128 v27;
  uint64_t v28;
  char **v29;
  __int128 v30;
  ValueMetadata *v31;
  _UNKNOWN **v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_2463C051C();
  v35 = MEMORY[0x24BEA9118];
  *(_QWORD *)&v33 = a5;
  v31 = &type metadata for IdentityFeatureFlagsProvider;
  v32 = &protocol witness table for IdentityFeatureFlagsProvider;
  v28 = type metadata accessor for BaseDialogProvider();
  v29 = &off_251795888;
  *(_QWORD *)&v27 = a4;
  v25 = &type metadata for IdentityFlowFactoryImpl;
  v26 = &off_251795D20;
  *(_QWORD *)(a7 + 24) = 0;
  v14 = a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_input;
  v15 = sub_2463BFFF4();
  __swift_storeEnumTagSinglePayload(v14, 1, 1, v15);
  swift_beginAccess();
  sub_24638C640(a1, v14);
  swift_endAccess();
  sub_24638C500(a2, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceState);
  sub_24638C500(a3, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_outputPublisher);
  sub_24638C500((uint64_t)&v27, (uint64_t)v22);
  sub_24638C500(a2, (uint64_t)v21);
  sub_24638C500((uint64_t)v22, (uint64_t)__src);
  sub_24638C688((uint64_t)v21, (uint64_t)&v18, &qword_25756F950);
  if (v19)
  {
    sub_24638C6C8((uint64_t)v21, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    sub_246389878(&v18, (uint64_t)v20);
  }
  else
  {
    sub_2463C0030();
    sub_24638C6C8((uint64_t)v21, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    sub_24638C6C8((uint64_t)&v18, &qword_25756F950);
  }
  sub_246389878(v20, (uint64_t)&__src[5]);
  sub_24638C500((uint64_t)&__src[5], (uint64_t)v20);
  type metadata accessor for LocUtil();
  v16 = swift_allocObject();
  sub_246389878(v20, v16 + 16);
  __src[10] = v16;
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  sub_24638C6C8(a1, &qword_25756F940);
  memcpy((void *)(a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_identityDialogs), __src, 0x58uLL);
  sub_246389878(&v33, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_deviceResolutionProvider);
  *(_BYTE *)(a7 + 16) = a6;
  sub_246389878(&v24, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_flowFactory);
  sub_246389878(&v30, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_featureFlags);
  sub_246389878(&v27, a7 + OBJC_IVAR____TtC20SiriIdentityInternal24SwitchProfileWrapperFlow_dialogProvider);
  return a7;
}

_QWORD *sub_24638BFC8(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6, uint64_t a7, _QWORD *a8)
{
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;
  char **v21;

  a8[10] = type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  a8[11] = &off_251795BD0;
  a8[7] = a1;
  v20 = type metadata accessor for BaseDialogProvider();
  v21 = &off_251795888;
  *(_QWORD *)&v19 = a7;
  v16 = (uint64_t)a8 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_input;
  v17 = sub_2463BFFF4();
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
  swift_beginAccess();
  sub_24638C540(a2, v16);
  swift_endAccess();
  sub_246389878(a3, (uint64_t)(a8 + 2));
  *(_QWORD *)((char *)a8 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) = a4;
  sub_246389878(a5, (uint64_t)(a8 + 12));
  sub_246389878(a6, (uint64_t)(a8 + 17));
  sub_246389878(&v19, (uint64_t)(a8 + 22));
  return a8;
}

_QWORD *sub_24638C0E8(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6, uint64_t a7)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD v25[3];
  uint64_t v26;
  char **v27;
  _QWORD v28[3];
  uint64_t v29;
  _UNKNOWN **v30;

  v29 = type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  v30 = &off_251795BD0;
  v28[0] = a1;
  v26 = type metadata accessor for BaseDialogProvider();
  v27 = &off_251795888;
  v25[0] = a7;
  type metadata accessor for ExecutionDeviceResolutionFlow();
  v14 = (_QWORD *)swift_allocObject();
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (_QWORD *)((char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (_QWORD *)((char *)v25 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v22 + 16))(v21);
  v23 = sub_24638BFC8(*v17, a2, a3, a4, a5, a6, *v21, v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v23;
}

_QWORD *sub_24638C268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[5];
  __int128 v30[2];
  __int128 v31[2];
  __int128 v32[2];
  uint64_t v33[5];
  _QWORD v34[5];
  _QWORD v35[6];

  v28 = a2;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[3] = type metadata accessor for SwitchProfileDeviceResolutionStrategy();
  v35[4] = &off_251795BD0;
  v35[0] = a1;
  v34[3] = type metadata accessor for BaseDialogProvider();
  v34[4] = &off_251795888;
  v34[0] = a6;
  sub_24638C500((uint64_t)v35, (uint64_t)v33);
  v15 = sub_2463BFFF4();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v14, a2, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v15);
  sub_24638C500(a3, (uint64_t)v32);
  sub_24638C500(a4, (uint64_t)v31);
  sub_24638C500(a5, (uint64_t)v30);
  sub_24638C500((uint64_t)v34, (uint64_t)v29);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v33[3]);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (uint64_t *)((char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v29[3]);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (uint64_t *)((char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = sub_24638C0E8(*v19, (uint64_t)v14, v32, 0x8000000000000000, v31, v30, *v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v28, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  return v25;
}

uint64_t sub_24638C4B8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24638C4DC(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

void sub_24638C500(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_25();
}

uint64_t sub_24638C540(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_24638C588(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x249559D74](a3, v5), a1);
  }
  OUTLINED_FUNCTION_25();
}

uint64_t sub_24638C5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24638C60C(uint64_t a1)
{
  destroy for IdentityDialogProvider(a1);
  return a1;
}

uint64_t sub_24638C640(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

void sub_24638C688(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_25();
}

void sub_24638C6C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_25();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_4_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

BOOL OUTLINED_FUNCTION_7_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[18] + 8))(v0[19], v0[17]);
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_12_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_destroy_boxed_opaque_existential_1(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return sub_2463C072C();
}

uint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_task_dealloc();
}

BOOL OUTLINED_FUNCTION_22(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return sub_2463BFFF4();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_26()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_2463C08A0();
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_31@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_allocObject();
}

uint64_t *sub_24638C868(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2463C0594();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    *(_OWORD *)v9 = *(_OWORD *)v10;
    *((_WORD *)v9 + 8) = *((_WORD *)v10 + 8);
  }
  return a1;
}

uint64_t sub_24638C900(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2463C0594();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_24638C934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2463C0594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_WORD *)(v8 + 16) = *(_WORD *)(v9 + 16);
  return a1;
}

uint64_t sub_24638C9A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2463C0594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  *(_BYTE *)(v8 + 17) = *(_BYTE *)(v9 + 17);
  return a1;
}

uint64_t sub_24638CA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2463C0594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_WORD *)(v8 + 16) = *(_WORD *)(v9 + 16);
  return a1;
}

uint64_t sub_24638CA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2463C0594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  *(_BYTE *)(v8 + 17) = *(_BYTE *)(v9 + 17);
  return a1;
}

uint64_t sub_24638CAFC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24638CB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = sub_2463C0594();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 17);
  if (v8 >= 2)
    return ((v8 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_24638CB94()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24638CBA0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = sub_2463C0594();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20) + 17) = a2 + 1;
    OUTLINED_FUNCTION_0_1();
  }
}

uint64_t type metadata accessor for Signpost.OpenSignpost()
{
  uint64_t result;

  result = qword_25756F9B8;
  if (!qword_25756F9B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24638CC48()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2463C0594();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_24638CCB8()
{
  sub_24638CD44();
  if (qword_25756EFD0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  qword_25756F958 = sub_2463C0774();
  OUTLINED_FUNCTION_0_1();
}

unint64_t sub_24638CD44()
{
  unint64_t result;

  result = qword_25756F9F0;
  if (!qword_25756F9F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25756F9F0);
  }
  return result;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for IdentitySignpost(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 18))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 17);
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IdentitySignpost(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)(result + 17) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentitySignpost()
{
  return &type metadata for IdentitySignpost;
}

uint64_t sub_24638CE40(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char **a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  _BYTE v19[40];

  v7 = v6;
  v14 = OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_remoteDevice;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_remoteDevice) = 0;
  sub_24638F8D0(a1, v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_deviceState);
  v15 = *(void **)(v7 + v14);
  *(_QWORD *)(v7 + v14) = a2;
  v16 = a2;

  sub_24638C688(a3, (uint64_t)v19, &qword_25756FBB0);
  type metadata accessor for Globals();
  OUTLINED_FUNCTION_34();
  *(_QWORD *)(v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_globals) = sub_24639687C((uint64_t)v19);
  if (a4)
  {

  }
  else
  {
    type metadata accessor for UserDefaultsProvider();
    OUTLINED_FUNCTION_34();
    a4 = sub_2463A7568();

    a5 = &off_2517955F8;
  }
  OUTLINED_FUNCTION_30(v17, &qword_25756FBB0);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(_QWORD *)(v7 + 16) = a4;
  *(_QWORD *)(v7 + 24) = a5;
  sub_24638F914(a6, v7 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_identifiedUserOverride);
  return v7;
}

void sub_24638CF6C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_25_0(v7);
  sub_2463C05A0();
  v8 = OUTLINED_FUNCTION_55();
  if (OUTLINED_FUNCTION_31_0(v8))
  {
    v9 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_40(v9);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v2, v3, "SwitchProfileFlowStrategy.actionForInput() called", v4);
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_22_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_2463BFCF4();
  OUTLINED_FUNCTION_27_0();
}

uint64_t sub_24638D044(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  v4 = sub_2463C0018();
  v3[16] = v4;
  v3[17] = *(_QWORD *)(v4 - 8);
  v3[18] = OUTLINED_FUNCTION_11_1();
  v3[19] = OUTLINED_FUNCTION_11_1();
  v5 = sub_2463C0024();
  v3[20] = v5;
  v3[21] = *(_QWORD *)(v5 - 8);
  v3[22] = OUTLINED_FUNCTION_11_1();
  v3[23] = OUTLINED_FUNCTION_11_1();
  v3[24] = OUTLINED_FUNCTION_11_1();
  v3[25] = OUTLINED_FUNCTION_11_1();
  v6 = OUTLINED_FUNCTION_7_2();
  v3[26] = v6;
  v3[27] = *(_QWORD *)(v6 - 8);
  v3[28] = OUTLINED_FUNCTION_11_1();
  v3[29] = OUTLINED_FUNCTION_11_1();
  v3[30] = OUTLINED_FUNCTION_11_1();
  v3[31] = OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24638D124()
{
  uint64_t *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  _WORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v40;
  NSObject *v41;
  uint64_t v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint8_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t);
  void (*v77)(uint64_t, uint64_t);
  void (*v78)(NSObject *, uint64_t, uint64_t);
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  uint64_t v81;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[31];
  v2 = v0[26];
  v3 = v0[27];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2575745E0);
  v5 = *(void (**)(NSObject *, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  sub_2463C05A0();
  v6 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_3_3(v6))
  {
    v7 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_40(v7);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v1, (os_log_type_t)v2, "SwitchProfileFlowStrategy.makeIntentFromParse() called", (uint8_t *)v3);
    OUTLINED_FUNCTION_0();
  }
  v8 = v0[13];
  v9 = v0[31];
  v10 = v0[26];
  v11 = v0[27];

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v9, v10);
  sub_2463A5CA0(v8, v0 + 7);
  if (!v0[10])
  {
    v78 = v5;
    v26 = v0[25];
    v27 = v0[20];
    v28 = v0[21];
    OUTLINED_FUNCTION_30(v13, (uint64_t *)&unk_257570290);
    v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16);
    OUTLINED_FUNCTION_41(v26);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v28 + 88))(v26, v27) != *MEMORY[0x24BE98E88])
      goto LABEL_19;
    v77 = v12;
    v30 = v0[24];
    v31 = v0[20];
    v32 = v0[21];
    v33 = v0[19];
    v34 = v0[16];
    v35 = v0[17];
    v29(v30, v0[25], v31);
    (*(void (**)(uint64_t, uint64_t))(v32 + 96))(v30, v31);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 32))(v33, v30, v34);
    v36 = sub_2463C0000();
    v38 = v37;
    if (qword_25756EF50 != -1)
      swift_once();
    if (v36 == *(_QWORD *)(qword_257574568 + 96) && v38 == *(_QWORD *)(qword_257574568 + 104))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v40 = sub_2463C0900();
      swift_bridgeObjectRelease();
      v12 = v77;
      if ((v40 & 1) == 0)
      {
        (*(void (**)(uint64_t, uint64_t))(v0[17] + 8))(v0[19], v0[16]);
LABEL_19:
        v41 = v0[28];
        v42 = v0[23];
        v78(v41, v4, v0[26]);
        OUTLINED_FUNCTION_41(v42);
        sub_2463C05A0();
        v43 = OUTLINED_FUNCTION_16_0();
        v44 = os_log_type_enabled(v41, v43);
        v45 = v0[28];
        v46 = v0[26];
        v47 = v0[23];
        if (v44)
        {
          v48 = v29;
          v49 = v0[22];
          v79 = v0[21];
          v50 = v0[20];
          v51 = v48;
          v52 = (uint8_t *)OUTLINED_FUNCTION_5();
          v81 = OUTLINED_FUNCTION_5();
          *(_DWORD *)v52 = 136315138;
          v51(v49, v47, v50);
          v53 = sub_2463C0624();
          v0[12] = sub_24639AE68(v53, v54, &v81);
          OUTLINED_FUNCTION_57();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v47, v50);
          OUTLINED_FUNCTION_13_2(&dword_246381000, v41, v43, "Unable to make intent from parse %s", v52);
          OUTLINED_FUNCTION_16();
          OUTLINED_FUNCTION_0();
        }
        v80 = *(void (**)(uint64_t, uint64_t))(v0[21] + 8);
        v80(v0[23], v0[20]);

        v12(v45, v46);
        v55 = v0[25];
        v56 = v0[20];
        type metadata accessor for IdentityFlowError();
        OUTLINED_FUNCTION_34();
        v57 = sub_2463B0A74(0);
        sub_24638C588((unint64_t *)&qword_257570250, (uint64_t (*)(uint64_t))type metadata accessor for IdentityFlowError, (uint64_t)"i*=\vhJ");
        swift_allocError();
        *v58 = v57;
        swift_willThrow();
        v80(v55, v56);
        OUTLINED_FUNCTION_42();
        OUTLINED_FUNCTION_50();
        OUTLINED_FUNCTION_14_2();
        OUTLINED_FUNCTION_48();
        OUTLINED_FUNCTION_51();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_29_0();
        __asm { BR              X0 }
      }
    }
    v60 = v0[14];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[17] + 16))(v0[18], v0[19], v0[16]);
    v61 = (void *)v0[14];
    if (!v60)
    {
      OUTLINED_FUNCTION_47();
      v62 = sub_2463C000C();
      sub_246389938(v62);
      swift_bridgeObjectRelease();
    }
    v63 = v0[29];
    v64 = v0[26];
    v65 = *(void (**)(uint64_t))(v0[17] + 8);
    v66 = v61;
    v67 = OUTLINED_FUNCTION_43();
    v65(v67);
    v78(v63, v4, v64);
    sub_2463C05A0();
    v68 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_22(v68))
    {
      v69 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v69 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v63, (os_log_type_t)v4, "Finished creating direct invocation intent from parse", v69);
      OUTLINED_FUNCTION_0();
    }
    v70 = v0[29];
    v71 = v0[26];
    v72 = v0[19];
    v73 = v0[16];

    v77(v70, v71);
    ((void (*)(uint64_t, uint64_t))v65)(v72, v73);
    v74 = OUTLINED_FUNCTION_43();
    v75(v74);
LABEL_29:
    swift_task_dealloc();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_42();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_29_0();
    __asm { BR              X1 }
  }
  v14 = v0[30];
  v15 = v0[26];
  sub_246389878((__int128 *)(v0 + 7), (uint64_t)(v0 + 2));
  OUTLINED_FUNCTION_47();
  sub_2463964A0();
  v17 = v16;
  v0[32] = (uint64_t)v16;
  v5(v14, v4, v15);
  v18 = v14;
  sub_2463C05A0();
  v19 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v19))
  {
    v20 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_40(v20);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v14, (os_log_type_t)v4, "Finished creating intent from parse", (uint8_t *)v14);
    OUTLINED_FUNCTION_0();
  }
  v21 = v0[30];
  v22 = v0[26];

  v12(v21, v22);
  if (objc_msgSend(v17, sel_switchType) != (id)1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
    goto LABEL_29;
  }
  v23 = (_QWORD *)swift_task_alloc();
  v0[33] = (uint64_t)v23;
  *v23 = v0;
  v23[1] = sub_24638D840;
  OUTLINED_FUNCTION_29_0();
  return sub_24638DA38(v24);
}

uint64_t sub_24638D840()
{
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24638D88C()
{
  uint64_t v0;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v2 = *(_QWORD *)(v0 + 256);
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_24();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

void sub_24638D930(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t EnumTagSinglePayload;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_33_0();
  sub_24638C688(v1 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_identifiedUserOverride, v4, &qword_25756F510);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v4, 1, v2);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_30(EnumTagSinglePayload, &qword_25756F510);
    sub_2463C03E4();
    if (!static SiriEnvironment.getUserIdentity()())
    {
      v11 = 1;
      goto LABEL_7;
    }
    sub_2463BFF10();
    swift_release();
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
    v10(v3, v4, v2);
    v10(a1, v3, v2);
  }
  v11 = 0;
LABEL_7:
  __swift_storeEnumTagSinglePayload(a1, v11, 1, v2);
  OUTLINED_FUNCTION_27_0();
}

uint64_t sub_24638DA38(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = v1;
  v3 = OUTLINED_FUNCTION_7_2();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = OUTLINED_FUNCTION_11_1();
  v2[9] = OUTLINED_FUNCTION_11_1();
  v2[10] = OUTLINED_FUNCTION_11_1();
  v2[11] = OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24638DAA4()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  NSObject *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;

  sub_24638DF1C();
  if (v3)
  {
    v4 = v2;
    v5 = v3;
    v6 = *(void **)(v0 + 32);
    swift_bridgeObjectRetain();
    sub_24638F88C(v4, v5, v6);
    if (qword_25756EFB8 != -1)
      swift_once();
    v7 = *(NSObject **)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 48);
    v8 = *(_QWORD *)(v0 + 56);
    v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2575745E0);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    OUTLINED_FUNCTION_59();
    sub_2463C05A0();
    v11 = OUTLINED_FUNCTION_14_1();
    v12 = OUTLINED_FUNCTION_7_4(v11);
    v13 = *(_QWORD *)(v0 + 88);
    v14 = *(_QWORD *)(v0 + 48);
    v15 = *(_QWORD *)(v0 + 56);
    if (v12)
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_5();
      v46 = OUTLINED_FUNCTION_5();
      *(_DWORD *)v16 = 136315138;
      OUTLINED_FUNCTION_59();
      *(_QWORD *)(v0 + 24) = sub_24639AE68(v4, v5, &v46);
      sub_2463C078C();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v7, v1, "Setting iCloudAltDSID =%s", v16);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_19_0();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v17 = *(_QWORD *)(v0 + 80);
    v18 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 56);
    v20 = __swift_project_value_buffer(v18, (uint64_t)qword_2575745E0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v20, v18);
    v21 = sub_2463C05A0();
    v22 = sub_2463C0714();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v23 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v21, v22, "Did not find iCloudAltDSID", v23);
      OUTLINED_FUNCTION_0();
    }
    v24 = *(_QWORD *)(v0 + 80);
    v25 = *(_QWORD *)(v0 + 48);
    v26 = *(_QWORD *)(v0 + 56);

    v27 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v27(v24, v25);
    sub_24638E180();
    if (v29)
    {
      v30 = v28;
      v31 = v29;
      v32 = *(NSObject **)(v0 + 72);
      sub_24638F848(v28, v29, *(void **)(v0 + 32));
      OUTLINED_FUNCTION_38();
      swift_bridgeObjectRetain();
      v33 = v32;
      sub_2463C05A0();
      v34 = OUTLINED_FUNCTION_14_1();
      v35 = OUTLINED_FUNCTION_7_4(v34);
      v36 = *(_QWORD *)(v0 + 72);
      v37 = *(_QWORD *)(v0 + 48);
      if (v35)
      {
        v38 = (uint8_t *)OUTLINED_FUNCTION_5();
        v46 = OUTLINED_FUNCTION_5();
        *(_DWORD *)v38 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 16) = sub_24639AE68(v30, v31, &v46);
        sub_2463C078C();
        OUTLINED_FUNCTION_19_0();
        OUTLINED_FUNCTION_13_2(&dword_246381000, v33, (os_log_type_t)v27, "Setting homeUserID =%s", v38);
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_1_0();

      v27(v36, v37);
    }
    else
    {
      v39 = *(NSObject **)(v0 + 64);
      OUTLINED_FUNCTION_38();
      v40 = v39;
      sub_2463C05A0();
      v41 = OUTLINED_FUNCTION_16_0();
      if (OUTLINED_FUNCTION_22(v41))
      {
        v42 = (uint8_t *)OUTLINED_FUNCTION_5();
        *(_WORD *)v42 = 0;
        OUTLINED_FUNCTION_4_3(&dword_246381000, v39, (os_log_type_t)v39, "No IDs available; not setting ID in intent",
          v42);
        OUTLINED_FUNCTION_0();
      }
      v43 = *(_QWORD *)(v0 + 64);
      v44 = *(_QWORD *)(v0 + 48);

      v27(v43, v44);
    }
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_24638DF1C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD v23[3];
  uint64_t v24;

  OUTLINED_FUNCTION_28_0();
  v4 = v0;
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_26_0();
  MEMORY[0x24BDAC7A8](v6);
  v8 = ((char *)v23 - v7);
  v9 = *(NSObject **)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_globals);
  v10 = sub_246396848();
  if ((v10 & 1) != 0 && (v9 = *(NSObject **)(v4 + 16), v10 = sub_2463A73C8(), v11))
  {
    v12 = v10;
    v13 = v11;
    if (qword_25756EFB8 != -1)
      v10 = swift_once();
    OUTLINED_FUNCTION_18_0(v10, (uint64_t)qword_2575745E0);
    OUTLINED_FUNCTION_17_0((uint64_t)v8, v14, v15);
    OUTLINED_FUNCTION_46();
    sub_2463C05A0();
    v16 = OUTLINED_FUNCTION_14_1();
    if (os_log_type_enabled(v8, v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_5();
      v24 = OUTLINED_FUNCTION_5();
      *(_DWORD *)v17 = 136315138;
      v23[1] = v17 + 4;
      OUTLINED_FUNCTION_59();
      v18 = sub_24639AE68(v12, v13, &v24);
      OUTLINED_FUNCTION_56(v18);
      sub_2463C078C();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v8, v16, "default found with iCloudAltDSID = %s", v17);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_20((uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }
  else
  {
    if (qword_25756EFB8 != -1)
      v10 = swift_once();
    OUTLINED_FUNCTION_18_0(v10, (uint64_t)qword_2575745E0);
    OUTLINED_FUNCTION_17_0(v2, v19, v20);
    OUTLINED_FUNCTION_52();
    v21 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_3_3(v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v22 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v9, v1, "Looking up MAF for recognized iCloudAltDSID", v22);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_20(v2, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_24638E72C();
  }
  OUTLINED_FUNCTION_5_3();
}

void sub_24638E180()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_25_0(v7);
  sub_2463C05A0();
  v8 = OUTLINED_FUNCTION_55();
  if (OUTLINED_FUNCTION_31_0(v8))
  {
    v9 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_40(v9);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v2, v3, "Looking up MAF for recognized homeUserID", v4);
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_22_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  sub_24638E268();
}

void sub_24638E268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t EnumTagSinglePayload;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  OUTLINED_FUNCTION_28_0();
  v4 = OUTLINED_FUNCTION_7_2();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = ((char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x24BDAC7A8](v6);
  v41 = (uint64_t)v37 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v37 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_8_4();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_33_0();
  sub_24638D930(v2);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v0);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_30(EnumTagSinglePayload, &qword_25756F510);
LABEL_10:
    if (qword_25756EFB8 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v4, (uint64_t)qword_2575745E0);
    OUTLINED_FUNCTION_17_0((uint64_t)v8, v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    sub_2463C05A0();
    v29 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_3_3(v29))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v30 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v8, (os_log_type_t)v0, "No homeUserID found.", v30);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(NSObject *, uint64_t))(v5 + 8))(v8, v4);
    goto LABEL_15;
  }
  v40 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
  sub_2463BFD0C();
  if (!v19)
  {
    OUTLINED_FUNCTION_22_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    v5 = v40;
    goto LABEL_10;
  }
  v39 = v3;
  sub_2463BF910();
  v20 = sub_2463BF934();
  v21 = __swift_getEnumTagSinglePayload((uint64_t)v15, 1, v20);
  sub_24638C6C8((uint64_t)v15, &qword_25756FBA8);
  if ((_DWORD)v21 == 1)
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v4, (uint64_t)qword_2575745E0);
    v24 = v40;
    v23 = v41;
    OUTLINED_FUNCTION_17_0(v41, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16));
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_52();
    v25 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_7_4(v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_5();
      v38 = OUTLINED_FUNCTION_5();
      v42 = v38;
      *(_DWORD *)v26 = 136315138;
      v37[1] = v26 + 4;
      OUTLINED_FUNCTION_49();
      v27 = OUTLINED_FUNCTION_32_0();
      OUTLINED_FUNCTION_15_0(v27);
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v21, (os_log_type_t)v8, "Invalid homeUserID='%s' found.", v26);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_1_0();

    OUTLINED_FUNCTION_20(v23, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v1, v0);
  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v31 = __swift_project_value_buffer(v4, (uint64_t)qword_2575745E0);
    v32 = v40;
    OUTLINED_FUNCTION_17_0((uint64_t)v12, v31, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16));
    OUTLINED_FUNCTION_46();
    v33 = OUTLINED_FUNCTION_44();
    v34 = sub_2463C0714();
    if (OUTLINED_FUNCTION_7_4(v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_5();
      v41 = OUTLINED_FUNCTION_5();
      v42 = v41;
      *(_DWORD *)v35 = 136315138;
      v38 = (uint64_t)(v35 + 4);
      OUTLINED_FUNCTION_49();
      v36 = OUTLINED_FUNCTION_32_0();
      OUTLINED_FUNCTION_56(v36);
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v33, (os_log_type_t)v8, "Found new recognized user with homeUserID=%s", v35);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_1_0();

    OUTLINED_FUNCTION_20((uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
    OUTLINED_FUNCTION_22_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v39 + 8));
  }
LABEL_15:
  OUTLINED_FUNCTION_5_3();
}

void sub_24638E72C()
{
  NSObject *v0;
  uint64_t v1;
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
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);
  NSObject *v20;
  int v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD v31[3];
  int v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;

  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_39();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v31 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2463BFD84();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = ((char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_24638D930((uint64_t)v10);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_24638C6C8((uint64_t)v10, &qword_25756F510);
LABEL_9:
    if (qword_25756EFB8 != -1)
      v15 = swift_once();
    OUTLINED_FUNCTION_18_0(v15, (uint64_t)qword_2575745E0);
    OUTLINED_FUNCTION_17_0((uint64_t)v5, v27, v28);
    OUTLINED_FUNCTION_44();
    v29 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_3_3(v29))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v30 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v0, (os_log_type_t)v7, "No iCloudAltDSID found.", v30);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_20((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    goto LABEL_15;
  }
  (*(void (**)(NSObject *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  v0 = v14;
  v16 = sub_2463BFD18();
  if (!v17)
  {
    v15 = OUTLINED_FUNCTION_36();
    goto LABEL_9;
  }
  if (qword_25756EFB8 != -1)
    v16 = swift_once();
  OUTLINED_FUNCTION_18_0(v16, (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_17_0((uint64_t)v7, v18, v19);
  OUTLINED_FUNCTION_46();
  v20 = sub_2463C05A0();
  v21 = sub_2463C0714();
  v34 = v20;
  if (OUTLINED_FUNCTION_54())
  {
    v22 = (uint8_t *)OUTLINED_FUNCTION_5();
    v33 = OUTLINED_FUNCTION_5();
    v35 = v33;
    v32 = v21;
    *(_DWORD *)v22 = 136315138;
    v31[1] = v22 + 4;
    v31[2] = v22;
    swift_bridgeObjectRetain();
    v23 = OUTLINED_FUNCTION_43();
    v26 = sub_24639AE68(v23, v24, v25);
    OUTLINED_FUNCTION_15_0(v26);
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_13_2(&dword_246381000, v34, (os_log_type_t)v32, "Found new recognized user with iCloudAltDSID=%s", v22);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_1_0();

  OUTLINED_FUNCTION_20((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_36();
LABEL_15:
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_24638EA38()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_24638C6C8(v0 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_identifiedUserOverride, &qword_25756F510);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_deviceState);
  swift_release();
  return v0;
}

uint64_t sub_24638EA9C()
{
  sub_24638EA38();
  return swift_deallocClassInstance();
}

uint64_t sub_24638EAC0()
{
  return type metadata accessor for SwitchProfileFlowStrategy();
}

uint64_t type metadata accessor for SwitchProfileFlowStrategy()
{
  uint64_t result;

  result = qword_25756FA38;
  if (!qword_25756FA38)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24638EB00()
{
  unint64_t v0;

  sub_24638EB98();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_24638EB98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25756FA58[0])
  {
    sub_2463BFD84();
    v0 = sub_2463C0780();
    if (!v1)
      atomic_store(v0, qword_25756FA58);
  }
}

void sub_24638EBEC()
{
  sub_24638CF6C();
}

uint64_t sub_24638EC00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_246389164;
  return sub_24638D044(a1, a2);
}

uint64_t sub_24638EC60()
{
  type metadata accessor for SwitchProfileFlowStrategy();
  return sub_2463BFF04();
}

uint64_t sub_24638EC9C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSObject *v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint8_t *v29;
  id v30;
  id v31;
  uint64_t v32;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;

  v4 = sub_2463BFBB0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2463C05B8();
  v36 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v34 - v12;
  v14 = *(void **)(v2 + OBJC_IVAR____TtC20SiriIdentityInternal25SwitchProfileFlowStrategy_remoteDevice);
  if (v14)
  {
    v15 = qword_25756EFB8;
    v16 = v14;
    if (v15 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v8, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v13, v17, v8);
    v18 = v16;
    v19 = sub_2463C05A0();
    v20 = sub_2463C0720();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v35 = v8;
      v37 = v18;
      v22 = v18;
      v8 = v35;
      sub_2463C078C();
      v23 = v34;
      *v34 = v14;

      _os_log_impl(&dword_246381000, v19, v20, "makeIntentExecutionBehavior: handle on targetDevice: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575701F0);
      swift_arrayDestroy();
      MEMORY[0x249559E1C](v23, -1, -1);
      MEMORY[0x249559E1C](v21, -1, -1);
    }
    else
    {

      v19 = v18;
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v8);
    sub_2463BFC10();
    v32 = sub_2463BFBF8();

  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v8, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v11, v24, v8);
    v25 = sub_2463C05A0();
    v26 = sub_2463C0720();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = v8;
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_246381000, v25, v26, "IntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v28, 2u);
      v29 = v28;
      v8 = v27;
      MEMORY[0x249559E1C](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v8);
    sub_2463BFC10();
    v30 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler());
    swift_retain();
    objc_msgSend(v30, sel_init);
    type metadata accessor for SwitchProfileIntent();
    v31 = a2;
    sub_2463BFBA4();
    v32 = sub_2463BFC04();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v32;
}

uint64_t sub_24638F08C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  Class isa;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  objc_class *v20;
  os_log_type_t v21;
  uint8_t *v22;
  objc_class *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v31[2];
  uint64_t v32;
  objc_class *v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_28_0();
  v34 = v3;
  v35 = v4;
  v6 = v5;
  v8 = v7;
  sub_2463BFBB0();
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = OUTLINED_FUNCTION_7_2();
  v32 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_26_0();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v31 - v14;
  isa = v0[13].isa;
  if (isa)
  {
    v17 = qword_25756EFB8;
    v18 = isa;
    if (v17 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v12, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v15, v19, v12);
    v20 = v18;
    OUTLINED_FUNCTION_44();
    v21 = OUTLINED_FUNCTION_55();
    if (os_log_type_enabled(v8, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_5();
      v31[0] = OUTLINED_FUNCTION_5();
      *(_DWORD *)v22 = 138412290;
      v31[1] = v12;
      v33 = v20;
      v23 = v20;
      OUTLINED_FUNCTION_57();
      *(_QWORD *)v31[0] = isa;

      OUTLINED_FUNCTION_13_2(&dword_246381000, v8, v21, "makeIntentExecutionBehavior: handle on targetDevice: %@", v22);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575701F0);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v32 + 8))(v15, v12);
    sub_2463BFC10();
    v29 = sub_2463BFBF8();

  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v12, (uint64_t)qword_2575745E0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v1, v24, v12);
    OUTLINED_FUNCTION_52();
    v25 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_54())
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v26 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v0, v25, "IntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v26);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v1, v12);
    sub_2463BFC10();
    v27 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler());
    swift_retain();
    objc_msgSend(v27, sel_init);
    OUTLINED_FUNCTION_47();
    v28 = v6;
    sub_2463BFBA4();
    v29 = sub_2463BFC04();
    OUTLINED_FUNCTION_22_0((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  }
  return v29;
}

uint64_t sub_24638F3F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9F4();
}

uint64_t sub_24638F480()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9E8();
}

uint64_t sub_24638F508()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9DC();
}

uint64_t sub_24638F590()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileFlowStrategy();
  *v1 = v0;
  v1[1] = sub_24638966C;
  return sub_2463BF9D0();
}

uint64_t sub_24638F628()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BFA84();
}

uint64_t sub_24638F6C0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = sub_24638EC9C(a1, a2);
  return sub_2463897E8(*(uint64_t (**)(uint64_t))(v2 + 8), v2, v3);
}

void sub_24638F6F8()
{
  sub_24638C588(&qword_25756FB60, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy, (uint64_t)&unk_2463C19D8);
}

void sub_24638F724()
{
  sub_24638C588(qword_25756FB68, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy, (uint64_t)&unk_2463C1A08);
}

void sub_24638F750()
{
  sub_24638C588(qword_25756FB90, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy, (uint64_t)&unk_2463C1A40);
}

void sub_24638F77C(void (*a1)(void))
{
  a1();
  OUTLINED_FUNCTION_25();
}

void sub_24638F798(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_2463C078C();
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

void sub_24638F848(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463C060C();
  objc_msgSend(a3, sel_setHomeUserId_, v4);

}

void sub_24638F88C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463C060C();
  objc_msgSend(a3, sel_setICloudAltDSID_, v4);

}

uint64_t sub_24638F8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24638F914(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL OUTLINED_FUNCTION_7_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_13_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_2463C078C();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_2463BFD84();
}

uint64_t OUTLINED_FUNCTION_17_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_20@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_22_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, a1, v2);
}

void OUTLINED_FUNCTION_30(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_24638C6C8(v2, a2);
}

BOOL OUTLINED_FUNCTION_31_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_24639AE68(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v2, v1);
}

_WORD *OUTLINED_FUNCTION_40(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_2463C05A0();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return type metadata accessor for SwitchProfileIntent();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_2463C05A0();
}

BOOL OUTLINED_FUNCTION_54()
{
  NSObject *v0;
  os_log_type_t v1;

  return os_log_type_enabled(v0, v1);
}

uint64_t OUTLINED_FUNCTION_55()
{
  return sub_2463C0720();
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_2463C078C();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return swift_bridgeObjectRetain();
}

void sub_24638FBB0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X7>, uint64_t *a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];
  uint64_t v36;

  v18 = a12;
  v19 = a10;
  if (a2)
  {
    OUTLINED_FUNCTION_6_4();
    v36 = MEMORY[0x24BEE4B08];
    v22 = v21;
    swift_bridgeObjectRetain();
    sub_2463903DC(v35, a1, v22);
    OUTLINED_FUNCTION_1_5();
    v23 = a4;
    if (a4)
    {
LABEL_3:
      swift_bridgeObjectRetain();
      sub_2463903DC(v35, a3, v23);
      OUTLINED_FUNCTION_1_5();
    }
  }
  else
  {
    v23 = a4;
    if (!a4 && !a6 && !a12 && !a7 && !a10)
    {
      v28 = 0;
      v32 = 0;
      v33 = 0;
      v23 = 0;
      v12 = 0;
      v27 = 0;
      v13 = 0;
      v24 = 0;
      v18 = 0;
      v26 = 0;
      v25 = 0;
      goto LABEL_19;
    }
    OUTLINED_FUNCTION_6_4();
    v36 = MEMORY[0x24BEE4B08];
    if (a4)
      goto LABEL_3;
  }
  v32 = a3;
  v24 = a11;
  if (v12)
  {
    swift_bridgeObjectRetain();
    sub_2463903DC(v35, a5, v12);
    OUTLINED_FUNCTION_1_5();
  }
  v33 = a5;
  v25 = v29;
  if (a12)
  {
    swift_bridgeObjectRetain();
    sub_2463903DC(v35, a11, a12);
    OUTLINED_FUNCTION_1_5();
  }
  v26 = a9;
  if (v13)
  {
    swift_bridgeObjectRetain();
    sub_2463903DC(v35, v34, v13);
    OUTLINED_FUNCTION_1_5();
  }
  if (v29)
  {
    swift_bridgeObjectRetain();
    sub_2463903DC(v35, a9, v29);
    OUTLINED_FUNCTION_1_5();
  }
  v19 = v36;
  v27 = v34;
  v28 = a1;
LABEL_19:
  *a8 = v28;
  a8[1] = a2;
  a8[2] = v32;
  a8[3] = v23;
  a8[4] = v33;
  a8[5] = v12;
  a8[6] = v27;
  a8[7] = v13;
  a8[8] = v24;
  a8[9] = v18;
  a8[10] = v26;
  a8[11] = v25;
  a8[12] = v19;
}

uint64_t sub_24638FDA4()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _BYTE v5[16];
  _BYTE v6[16];
  _BYTE v7[16];
  _QWORD v8[2];

  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_2463C07E0();
  v3 = 0;
  v4 = 0xE000000000000000;
  sub_2463C0654();
  sub_246385D54(v0, (uint64_t)v8);
  sub_246385D54((uint64_t)v8, (uint64_t)v7);
  sub_246386794((uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F518);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_5();
  sub_2463C0654();
  sub_246385D54(v0 + 64, (uint64_t)v7);
  sub_246385D54((uint64_t)v7, (uint64_t)v6);
  sub_246386794((uint64_t)v7);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_5();
  sub_2463C0654();
  sub_246385D54(v0 + 48, (uint64_t)v6);
  sub_246385D54((uint64_t)v6, (uint64_t)v5);
  sub_246386794((uint64_t)v6);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_5();
  sub_2463C0654();
  sub_246385D54(v0 + 80, (uint64_t)v5);
  sub_246385D54((uint64_t)v5, (uint64_t)&v2);
  sub_246386794((uint64_t)v5);
  OUTLINED_FUNCTION_4_5();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  return v3;
}

uint64_t sub_24638FF74(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;

  v4 = a1[1];
  v5 = a2[1];
  if (v4)
  {
    if (!v5)
      return 0;
    v6 = *a1 == *a2 && v4 == v5;
    if (!v6 && (OUTLINED_FUNCTION_0_2() & 1) == 0)
      return 0;
  }
  else if (v5)
  {
    return 0;
  }
  v7 = a1[3];
  v8 = a2[3];
  if (v7)
  {
    if (!v8)
      return 0;
    v9 = a1[2] == a2[2] && v7 == v8;
    if (!v9 && (OUTLINED_FUNCTION_0_2() & 1) == 0)
      return 0;
  }
  else if (v8)
  {
    return 0;
  }
  v10 = a1[5];
  v11 = a2[5];
  if (v10)
  {
    if (!v11)
      return 0;
    v12 = a1[4] == a2[4] && v10 == v11;
    if (!v12 && (OUTLINED_FUNCTION_0_2() & 1) == 0)
      return 0;
  }
  else if (v11)
  {
    return 0;
  }
  v13 = a1[7];
  v14 = a2[7];
  if (v13)
  {
    if (!v14)
      return 0;
    v15 = a1[6] == a2[6] && v13 == v14;
    if (!v15 && (OUTLINED_FUNCTION_0_2() & 1) == 0)
      return 0;
  }
  else if (v14)
  {
    return 0;
  }
  v16 = a1[9];
  v17 = a2[9];
  if (v16)
  {
    if (!v17)
      return 0;
    v18 = a1[8] == a2[8] && v16 == v17;
    if (!v18 && (OUTLINED_FUNCTION_0_2() & 1) == 0)
      return 0;
  }
  else if (v17)
  {
    return 0;
  }
  v19 = a1[11];
  v20 = a2[11];
  if (v19)
  {
    if (v20)
    {
      v21 = a1[10] == a2[10] && v19 == v20;
      if (v21 || (OUTLINED_FUNCTION_0_2() & 1) != 0)
        return sub_24639011C(a1[12], a2[12]);
    }
  }
  else if (!v20)
  {
    return sub_24639011C(a1[12], a2[12]);
  }
  return 0;
}

uint64_t sub_2463900E4()
{
  const void *v0;
  _BYTE __dst[104];

  memcpy(__dst, v0, sizeof(__dst));
  return sub_24638FDA4();
}

uint64_t sub_24639011C(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  unint64_t j;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v4 = *(_QWORD *)(result + 56);
  v30 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & v4;
  v31 = (unint64_t)(v5 + 63) >> 6;
  v8 = a2 + 56;
  if ((v6 & v4) == 0)
    goto LABEL_8;
LABEL_7:
  v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  v32 = v3;
  for (i = v9 | (v3 << 6); ; i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    v15 = result;
    v16 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * i);
    v18 = *v16;
    v17 = v16[1];
    sub_2463C0978();
    swift_bridgeObjectRetain();
    sub_2463C0648();
    v19 = sub_2463C0990();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_41;
    v22 = *(_QWORD *)(a2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (!v24 && (sub_2463C0900() & 1) == 0)
    {
      v25 = ~v20;
      for (j = v21 + 1; ; j = v27 + 1)
      {
        v27 = j & v25;
        if (((*(_QWORD *)(v8 + (((j & v25) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v25)) & 1) == 0)
          break;
        v28 = (_QWORD *)(v22 + 16 * v27);
        v29 = *v28 == v18 && v28[1] == v17;
        if (v29 || (sub_2463C0900() & 1) != 0)
          goto LABEL_30;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    result = v15;
    v3 = v32;
    if (v7)
      goto LABEL_7;
LABEL_8:
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v11 >= v31)
      return 1;
    v12 = *(_QWORD *)(v30 + 8 * v11);
    v13 = v3 + 1;
    if (!v12)
    {
      v13 = v3 + 2;
      if (v3 + 2 >= v31)
        return 1;
      v12 = *(_QWORD *)(v30 + 8 * v13);
      if (!v12)
      {
        v13 = v3 + 3;
        if (v3 + 3 >= v31)
          return 1;
        v12 = *(_QWORD *)(v30 + 8 * v13);
        if (!v12)
        {
          v13 = v3 + 4;
          if (v3 + 4 >= v31)
            return 1;
          v12 = *(_QWORD *)(v30 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v7 = (v12 - 1) & v12;
    v32 = v13;
  }
  v14 = v3 + 5;
  if (v3 + 5 >= v31)
    return 1;
  v12 = *(_QWORD *)(v30 + 8 * v14);
  if (v12)
  {
    v13 = v3 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v31)
      return 1;
    v12 = *(_QWORD *)(v30 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_2463903C0(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_2463903DC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;

  v7 = *v3;
  sub_2463C0978();
  swift_bridgeObjectRetain();
  sub_2463C0648();
  v8 = sub_2463C0990();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  OUTLINED_FUNCTION_5_4();
  if ((v11 & 1) != 0)
  {
    v12 = *(_QWORD *)(v7 + 48);
    v13 = (_QWORD *)(v12 + 16 * v10);
    v14 = *v13 == a2 && v13[1] == a3;
    if (v14 || (OUTLINED_FUNCTION_0_2() & 1) != 0)
    {
LABEL_7:
      OUTLINED_FUNCTION_3_5();
      swift_bridgeObjectRelease();
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      OUTLINED_FUNCTION_5_4();
      if ((v19 & 1) == 0)
        break;
      v20 = (_QWORD *)(v12 + 16 * v10);
      v21 = *v20 == a2 && v20[1] == a3;
      if (v21 || (OUTLINED_FUNCTION_0_2() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24639083C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v23;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_246390564()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBB8);
  v3 = sub_2463C07D4();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_2463C0978();
      sub_2463C0648();
      result = sub_2463C0990();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_2463903C0(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24639083C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_246390564();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2463909D4();
      goto LABEL_22;
    }
    sub_246390B84();
  }
  v11 = *v4;
  sub_2463C0978();
  sub_2463C0648();
  result = sub_2463C0990();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2463C0900(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2463C0930();
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
          result = sub_2463C0900();
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

void *sub_2463909D4()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBB8);
  v2 = *v0;
  v3 = sub_2463C07C8();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_246390B84()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBB8);
  v3 = sub_2463C07D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_2463C0978();
    swift_bridgeObjectRetain();
    sub_2463C0648();
    result = sub_2463C0990();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t destroy for UserNames()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for UserNames(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for UserNames(_QWORD *a1, _QWORD *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t assignWithTake for UserNames(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserNames(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 104))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 96);
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

uint64_t storeEnumTagSinglePayload for UserNames(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 96) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserNames()
{
  return &type metadata for UserNames;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_2463C0900();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_2463C0654();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_2463C0624();
}

uint64_t destroy for UserAccountManager(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserAccountManager(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v7 = *(_QWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for UserAccountManager(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
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

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for UserAccountManager(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserAccountManager(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
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

uint64_t storeEnumTagSinglePayload for UserAccountManager(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAccountManager()
{
  return &type metadata for UserAccountManager;
}

uint64_t sub_246391578@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t result;
  _BYTE v14[24];
  uint64_t v15;

  type metadata accessor for UserAccount();
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12_0();
  v5 = OUTLINED_FUNCTION_33_1();
  sub_246394534(v5, v6, v7);
  sub_24638F8D0(a1, (uint64_t)v14);
  v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_12_0();
  (*(void (**)(uint64_t))(v11 + 16))(v10 - v9);
  v12 = sub_246393474();
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  *a2 = v12;
  return result;
}

unint64_t sub_246391664()
{
  uint64_t v0;
  uint64_t v1;

  sub_2463C07E0();
  swift_bridgeObjectRelease();
  v0 = OUTLINED_FUNCTION_9_3();
  v1 = swift_bridgeObjectRetain();
  MEMORY[0x2495596C0](v1, v0);
  sub_2463C0654();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  return 0xD000000000000014;
}

void sub_246391714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)();
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)();
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
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
  int *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  int *v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  _QWORD *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t v112;
  _QWORD *v113;
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
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  BOOL v134;
  unint64_t v135;
  unint64_t v136;
  char v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t v145;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v147;
  unint64_t v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  _QWORD *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  unint64_t v164;
  char v165;
  unint64_t v166;
  char v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t (*v172)(_QWORD);
  _QWORD v173[3];
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _QWORD *v177;
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
  char *v196;
  char *v197;
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
  _QWORD v208[5];
  unint64_t v209;
  uint64_t v210[13];
  _QWORD v211[14];

  OUTLINED_FUNCTION_28_0();
  v174 = v1;
  v3 = v2;
  v5 = v4;
  v177 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v7);
  v8 = OUTLINED_FUNCTION_5_5();
  MEMORY[0x24BDAC7A8](v8);
  v203 = (uint64_t)v173 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_10_3();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v173 - v12;
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_15_1();
  v199 = v14;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_15_1();
  v198 = v16;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_15_1();
  v200 = v18;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_15_1();
  v207 = v20;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_15_1();
  v186 = v22;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_15_1();
  v185 = v24;
  OUTLINED_FUNCTION_10_3();
  v26 = MEMORY[0x24BDAC7A8](v25);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)v173 - v31;
  v33 = *(_QWORD *)(v5 + 16);
  v206 = v28;
  v197 = v13;
  v173[2] = v34;
  if (v33)
  {
    v175 = v30;
    v176 = v29;
    OUTLINED_FUNCTION_34_0();
    v173[1] = v5;
    v202 = v35;
    v36 = v3;
    v37 = v5 + v35;
    v38 = MEMORY[0x24BEE4AF8];
    v39 = type metadata accessor for UserAccount;
    v41 = *(_QWORD *)(v40 + 72);
    v195 = v36;
    v196 = v32;
    v204 = v0;
    v201 = v41;
    while (1)
    {
      v42 = v39;
      OUTLINED_FUNCTION_19_1(v37, (uint64_t)v32);
      sub_2463936DC((uint64_t)v32, v0);
      v43 = sub_2463BF934();
      if (__swift_getEnumTagSinglePayload(v0, 1, v43) == 1)
      {
        sub_24639456C(v0, &qword_25756FBA8);
        v39 = v42;
        v44 = v201;
      }
      else
      {
        v205 = v38;
        v45 = sub_2463BF91C();
        v47 = v46;
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 8))(v0, v43);
        v48 = v195;
        if (*(_QWORD *)(v195 + 16))
        {
          v49 = sub_2463BC4E4(v45, v47);
          v39 = v42;
          if ((v50 & 1) != 0)
          {
            v51 = (uint64_t *)(*(_QWORD *)(v48 + 56) + 104 * v49);
            v52 = v51[1];
            v53 = v51[3];
            v193 = *v51;
            v194 = v53;
            v54 = v51[5];
            v55 = v51[7];
            v192 = v51[8];
            v56 = v51[9];
            v57 = v51[12];
            v181 = v51[11];
            swift_bridgeObjectRetain();
            v180 = v57;
            swift_bridgeObjectRetain();
            OUTLINED_FUNCTION_59();
            OUTLINED_FUNCTION_14();
            v184 = v54;
            swift_bridgeObjectRetain();
            v183 = v55;
            OUTLINED_FUNCTION_36_0();
            v182 = v56;
            OUTLINED_FUNCTION_18_1();
            OUTLINED_FUNCTION_2_5();
            v58 = v175;
            OUTLINED_FUNCTION_19_1((uint64_t)v196, v175);
            v59 = v206;
            if (v52)
            {
              v188 = v52;
            }
            else
            {
              v63 = (uint64_t *)(v58 + *(int *)(v206 + 28));
              v64 = v63[1];
              v193 = *v63;
              v188 = v64;
              swift_bridgeObjectRetain();
            }
            OUTLINED_FUNCTION_18_1();
            OUTLINED_FUNCTION_11_2(v58);
            v65 = *(int *)(v59 + 28);
            v32 = v196;
            v66 = &v196[v65];
            v67 = *((_QWORD *)v66 + 2);
            v68 = *((_QWORD *)v66 + 3);
            v69 = *((_QWORD *)v66 + 5);
            v190 = *((_QWORD *)v66 + 4);
            v191 = v67;
            v70 = *((_QWORD *)v66 + 7);
            v189 = *((_QWORD *)v66 + 6);
            v179 = v52;
            v72 = *((_QWORD *)v66 + 10);
            v71 = *((_QWORD *)v66 + 11);
            OUTLINED_FUNCTION_59();
            v73 = v182;
            OUTLINED_FUNCTION_36_0();
            OUTLINED_FUNCTION_14();
            OUTLINED_FUNCTION_4_6();
            OUTLINED_FUNCTION_18_1();
            sub_24638FBB0(v193, v188, v191, v68, v190, v69, v70, v210, v72, v71, v192, v73);
            v75 = v210[0];
            v74 = v210[1];
            v188 = v210[3];
            v189 = v210[2];
            v187 = v210[4];
            v192 = v210[6];
            v193 = v210[5];
            v190 = v210[8];
            v191 = v210[7];
            v76 = v210[10];
            v178 = v210[9];
            v78 = v210[11];
            v77 = v210[12];
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_3_6();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v79 = v176;
            sub_246394534((uint64_t)v32, v176, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
            sub_2463937E4((uint64_t)v210, (uint64_t)v211, &qword_25756FBE0);
            if (v211[12])
            {
              sub_24639409C(v79, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
              v183 = v76;
              v184 = v75;
              v194 = v74;
              v80 = (int *)v206;
              v81 = v178;
              v181 = v77;
              v182 = v78;
              v82 = v191;
            }
            else
            {
              v83 = (uint64_t *)(v79 + *(int *)(v206 + 28));
              v84 = *v83;
              v85 = v83[1];
              v86 = v83[2];
              v87 = v83[3];
              v88 = v83[5];
              v187 = v83[4];
              v192 = v83[6];
              v191 = v83[7];
              v89 = v83[8];
              v90 = v83[9];
              v189 = v86;
              v190 = v89;
              v91 = v83[11];
              v183 = v83[10];
              v184 = v84;
              v92 = v83[12];
              v182 = v91;
              swift_bridgeObjectRetain();
              v181 = v92;
              OUTLINED_FUNCTION_18_1();
              v194 = v85;
              OUTLINED_FUNCTION_14();
              v188 = v87;
              OUTLINED_FUNCTION_4_6();
              v193 = v88;
              v82 = v191;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v81 = v90;
              OUTLINED_FUNCTION_59();
              sub_24639409C(v79, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
              v80 = (int *)v206;
            }
            v93 = &v32[v80[6]];
            v95 = *(_QWORD *)v93;
            v94 = *((_QWORD *)v93 + 1);
            v96 = v185;
            sub_2463936DC((uint64_t)v32, v185);
            v97 = v80[6];
            v98 = &v32[v80[5]];
            v99 = v80;
            v100 = *(_QWORD *)v98;
            v101 = *((_QWORD *)v98 + 1);
            LOBYTE(v98) = v32[v99[8]];
            v102 = (_QWORD *)(v96 + v97);
            *v102 = v95;
            v102[1] = v94;
            v103 = (_QWORD *)(v96 + v99[5]);
            *v103 = v100;
            v103[1] = v101;
            *(_BYTE *)(v96 + v99[8]) = (_BYTE)v98;
            v104 = (uint64_t *)(v96 + v99[7]);
            v105 = v194;
            *v104 = v184;
            v104[1] = v105;
            v106 = v188;
            v104[2] = v189;
            v104[3] = v106;
            v107 = v186;
            v108 = v193;
            v104[4] = v187;
            v104[5] = v108;
            v104[6] = v192;
            v104[7] = v82;
            v104[8] = v190;
            v104[9] = v81;
            v109 = v182;
            v104[10] = v183;
            v104[11] = v109;
            v104[12] = v181;
            v39 = type metadata accessor for UserAccount;
            OUTLINED_FUNCTION_19_1(v96, v107);
            OUTLINED_FUNCTION_59();
            OUTLINED_FUNCTION_36_0();
            v38 = v205;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v38 = OUTLINED_FUNCTION_6_5(0, *(_QWORD *)(v38 + 16) + 1);
            v44 = v201;
            v111 = *(_QWORD *)(v38 + 16);
            v110 = *(_QWORD *)(v38 + 24);
            v8 = v206;
            if (v111 >= v110 >> 1)
              v38 = OUTLINED_FUNCTION_6_5(v110 > 1, v111 + 1);
            OUTLINED_FUNCTION_28_1();
            sub_246393724(v186, v112);
            OUTLINED_FUNCTION_11_2(v185);
            goto LABEL_17;
          }
          OUTLINED_FUNCTION_2_5();
          v38 = v205;
        }
        else
        {
          OUTLINED_FUNCTION_2_5();
          v38 = v205;
          v39 = v42;
        }
        v44 = v201;
        v8 = v206;
        v32 = v196;
      }
      OUTLINED_FUNCTION_19_1((uint64_t)v32, v207);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v38 = OUTLINED_FUNCTION_6_5(0, *(_QWORD *)(v38 + 16) + 1);
      v61 = *(_QWORD *)(v38 + 16);
      v60 = *(_QWORD *)(v38 + 24);
      if (v61 >= v60 >> 1)
        v38 = OUTLINED_FUNCTION_6_5(v60 > 1, v61 + 1);
      OUTLINED_FUNCTION_28_1();
      sub_246393724(v207, v62);
LABEL_17:
      OUTLINED_FUNCTION_11_2((uint64_t)v32);
      v37 += v44;
      --v33;
      v0 = v204;
      if (!v33)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v13 = v197;
        goto LABEL_29;
      }
    }
  }
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_3_6();
  v38 = MEMORY[0x24BEE4AF8];
LABEL_29:
  v113 = v177;
  v177[5] = v38;
  sub_24638F8D0(v174, (uint64_t)v113);
  swift_bridgeObjectRetain_n();
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC8);
  v115 = sub_2463C05E8();
  v209 = v115;
  v116 = *(_QWORD *)(v38 + 16);
  v205 = v38;
  v117 = v200;
  if (v116)
  {
    v196 = (char *)v114;
    OUTLINED_FUNCTION_34_0();
    v201 = v118;
    v119 = v38 + v118;
    v207 = *(_QWORD *)(v120 + 72);
    OUTLINED_FUNCTION_4_6();
    v195 = v119;
    v204 = v116;
    v121 = v116;
    v122 = v199;
    while (1)
    {
      OUTLINED_FUNCTION_20_0(v119, v117);
      if (*(_QWORD *)(v117 + *(int *)(v8 + 28) + 88))
        break;
LABEL_52:
      sub_24639409C(v117, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
      v119 += v207;
      if (!--v121)
      {
        OUTLINED_FUNCTION_2_5();
        v150 = v209;
        OUTLINED_FUNCTION_2_5();
        v177[6] = v150;
        OUTLINED_FUNCTION_4_6();
        v208[0] = sub_2463C05E8();
        OUTLINED_FUNCTION_4_6();
        v116 = v204;
        v151 = v204;
        v152 = v195;
        do
        {
          sub_246394534(v152, v122, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
          sub_246392488(v208, v122);
          sub_24639409C(v122, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
          v152 += v207;
          --v151;
        }
        while (v151);
        OUTLINED_FUNCTION_35();
        v113 = v177;
        v13 = v197;
        goto LABEL_57;
      }
    }
    v123 = sub_2463C0630();
    v125 = v123;
    v126 = v209;
    if (*(_QWORD *)(v209 + 16))
    {
      v127 = v123;
      v128 = v124;
      sub_2463BC4E4(v123, v124);
      if ((v129 & 1) != 0)
      {
LABEL_44:
        v202 = v128;
        sub_2463923EC(v208, v127, v128);
        if (*v143)
        {
          v144 = v143;
          OUTLINED_FUNCTION_20_0(v117, v198);
          v145 = *v144;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *v144 = v145;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v145 = OUTLINED_FUNCTION_40_0(0, *(_QWORD *)(v145 + 16) + 1);
            *v144 = v145;
          }
          v148 = *(_QWORD *)(v145 + 16);
          v147 = *(_QWORD *)(v145 + 24);
          if (v148 >= v147 >> 1)
          {
            v145 = OUTLINED_FUNCTION_40_0(v147 > 1, v148 + 1);
            *v144 = v145;
          }
          v8 = v206;
          v149 = v207;
          *(_QWORD *)(v145 + 16) = v148 + 1;
          sub_246393724(v198, v145 + v201 + v148 * v149);
          OUTLINED_FUNCTION_32_1();
          v122 = v199;
          v117 = v200;
        }
        else
        {
          OUTLINED_FUNCTION_32_1();
          v8 = v206;
        }
        swift_bridgeObjectRelease();
        goto LABEL_52;
      }
      v126 = v209;
      v124 = v128;
      v125 = v127;
    }
    v130 = v124;
    swift_bridgeObjectRetain();
    swift_isUniquelyReferenced_nonNull_native();
    v208[0] = v126;
    v209 = 0x8000000000000000;
    v127 = v125;
    v131 = v125;
    v128 = v130;
    sub_2463BC4E4(v131, v130);
    OUTLINED_FUNCTION_38_0();
    if (v134)
    {
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
      swift_bridgeObjectRelease();
      sub_24639409C(v130, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
      OUTLINED_FUNCTION_2_5();
      __break(1u);
LABEL_76:
      sub_2463C093C();
      __break(1u);
      return;
    }
    v135 = v132;
    v130 = v133;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBD8);
    if ((sub_2463C0858() & 1) != 0)
    {
      v136 = sub_2463BC4E4(v127, v128);
      if ((v130 & 1) != (v137 & 1))
        goto LABEL_76;
      v135 = v136;
    }
    v138 = (_QWORD *)v208[0];
    if ((v130 & 1) != 0)
    {
      v139 = *(_QWORD *)(v208[0] + 56);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v139 + 8 * v135) = MEMORY[0x24BEE4AF8];
    }
    else
    {
      *(_QWORD *)(v208[0] + 8 * (v135 >> 6) + 64) |= 1 << v135;
      v140 = (uint64_t *)(v138[6] + 16 * v135);
      *v140 = v127;
      v140[1] = v128;
      *(_QWORD *)(v138[7] + 8 * v135) = MEMORY[0x24BEE4AF8];
      v141 = v138[2];
      v134 = __OFADD__(v141, 1);
      v142 = v141 + 1;
      if (v134)
        goto LABEL_75;
      v138[2] = v142;
      OUTLINED_FUNCTION_18_1();
    }
    v209 = (unint64_t)v138;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_6();
    v38 = v205;
    v122 = v199;
    v117 = v200;
    goto LABEL_44;
  }
  v153 = v115;
  OUTLINED_FUNCTION_2_5();
  v113[6] = v153;
  OUTLINED_FUNCTION_4_6();
  v208[0] = sub_2463C05E8();
  OUTLINED_FUNCTION_2_5();
LABEL_57:
  v113[7] = v208[0];
  v154 = (_QWORD *)sub_2463C05E8();
  if (v116)
  {
    OUTLINED_FUNCTION_34_0();
    v156 = v38 + v155;
    v158 = *(_QWORD *)(v157 + 72);
    OUTLINED_FUNCTION_4_6();
    while (1)
    {
      sub_246394534(v156, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
      if (*(_QWORD *)&v13[*(int *)(v8 + 20) + 8])
      {
        v204 = v116;
        v159 = sub_2463C0630();
        v161 = v160;
        sub_246394534((uint64_t)v13, v203, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
        v130 = swift_isUniquelyReferenced_nonNull_native();
        v208[0] = v154;
        OUTLINED_FUNCTION_29_1();
        OUTLINED_FUNCTION_38_0();
        if (v134)
        {
          __break(1u);
          goto LABEL_73;
        }
        v164 = v162;
        v165 = v163;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBD0);
        if ((sub_2463C0858() & 1) != 0)
        {
          v166 = OUTLINED_FUNCTION_29_1();
          if ((v165 & 1) != (v167 & 1))
            goto LABEL_76;
          v164 = v166;
        }
        v154 = (_QWORD *)v208[0];
        if ((v165 & 1) != 0)
        {
          sub_2463937A0(v203, *(_QWORD *)(v208[0] + 56) + v164 * v158);
        }
        else
        {
          *(_QWORD *)(v208[0] + 8 * (v164 >> 6) + 64) |= 1 << v164;
          v168 = (uint64_t *)(v154[6] + 16 * v164);
          *v168 = v159;
          v168[1] = v161;
          sub_246393724(v203, v154[7] + v164 * v158);
          v169 = v154[2];
          v134 = __OFADD__(v169, 1);
          v170 = v169 + 1;
          if (v134)
            goto LABEL_74;
          v154[2] = v170;
          OUTLINED_FUNCTION_26_1();
        }
        OUTLINED_FUNCTION_7_5();
        swift_bridgeObjectRelease();
        v8 = v206;
        v13 = v197;
        v116 = v204;
      }
      v171 = OUTLINED_FUNCTION_33_1();
      sub_24639409C(v171, v172);
      v156 += v158;
      if (!--v116)
      {
        OUTLINED_FUNCTION_2_5();
        v113 = v177;
        break;
      }
    }
  }
  __swift_destroy_boxed_opaque_existential_1(v174);
  OUTLINED_FUNCTION_35();
  v113[8] = v154;
  OUTLINED_FUNCTION_5_3();
}

void (*sub_2463923EC(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_246393118(v6, a2, a3);
  return sub_246392458;
}

void sub_246392458(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_17_1(v1);
}

uint64_t sub_246392488(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  int64_t v11;
  int v12;
  int v13;
  char v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  int64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t *v31;
  void (*v32)(_QWORD *);
  uint64_t *v33;
  uint64_t v34;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t result;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  _QWORD v63[4];
  uint64_t v64;

  v4 = type metadata accessor for UserAccount();
  v60 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v58 = (uint64_t)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(int *)(v5 + 28);
  v61 = a2;
  v8 = *(_QWORD *)(a2 + v7 + 96);
  v9 = *(_QWORD *)(v8 + 16);
  v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v59 = a1;
  if (v9)
  {
    v63[0] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_2463B1FDC(0, v9, 0);
    v10 = (_QWORD *)v63[0];
    v11 = sub_246393900(v8);
    v13 = v12;
    v15 = v14 & 1;
    *(_QWORD *)&v62 = v8 + 56;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(_BYTE *)(v8 + 32))
    {
      if (((*(_QWORD *)(v62 + (((unint64_t)v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
        goto LABEL_34;
      if (*(_DWORD *)(v8 + 36) != v13)
        goto LABEL_35;
      LODWORD(v64) = v15;
      v16 = sub_2463C0630();
      v18 = v17;
      v63[0] = v10;
      v20 = v10[2];
      v19 = v10[3];
      if (v20 >= v19 >> 1)
      {
        sub_2463B1FDC((char *)(v19 > 1), v20 + 1, 1);
        v10 = (_QWORD *)v63[0];
      }
      v10[2] = v20 + 1;
      v21 = &v10[2 * v20];
      v21[4] = v16;
      v21[5] = v18;
      v22 = sub_24639381C(v11, v13, v64 & 1, v8);
      v11 = v22;
      v13 = v23;
      v15 = v24 & 1;
      if (!--v9)
      {
        sub_246393980(v22, v23, v15);
        swift_bridgeObjectRelease();
        a1 = v59;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    result = sub_2463C093C();
    __break(1u);
  }
  else
  {
LABEL_11:
    v25 = v10[2];
    if (v25)
    {
      v57 = v10;
      v26 = v10 + 5;
      v62 = xmmword_2463C1B70;
      do
      {
        v27 = *(v26 - 1);
        v28 = *v26;
        v29 = *(_QWORD *)(*a1 + 16);
        swift_bridgeObjectRetain();
        if (v29 && (sub_2463BC4E4(v27, v28), (v30 & 1) != 0))
        {
          v32 = sub_2463923EC(v63, v27, v28);
          if (*v31)
          {
            v33 = v31;
            sub_246394534(v61, v58, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
            v34 = *v33;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *v33 = v34;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v34 = sub_2463B9318(0, *(_QWORD *)(v34 + 16) + 1, 1, v34);
              *v33 = v34;
            }
            v37 = *(_QWORD *)(v34 + 16);
            v36 = *(_QWORD *)(v34 + 24);
            if (v37 >= v36 >> 1)
            {
              v34 = sub_2463B9318(v36 > 1, v37 + 1, 1, v34);
              *v33 = v34;
            }
            *(_QWORD *)(v34 + 16) = v37 + 1;
            sub_246393724(v58, v34+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(_QWORD *)(v60 + 72) * v37);
          }
          ((void (*)(_QWORD *, _QWORD))v32)(v63, 0);
          swift_bridgeObjectRelease();
        }
        else
        {
          v64 = v25;
          __swift_instantiateConcreteTypeFromMangledName(qword_25756FBE8);
          v38 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
          v39 = swift_allocObject();
          *(_OWORD *)(v39 + 16) = v62;
          sub_246394534(v61, v39 + v38, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
          swift_isUniquelyReferenced_nonNull_native();
          v63[0] = *a1;
          v40 = v63[0];
          *a1 = 0x8000000000000000;
          v41 = v27;
          v42 = v27;
          v43 = v28;
          v44 = sub_2463BC4E4(v42, v28);
          if (__OFADD__(*(_QWORD *)(v40 + 16), (v45 & 1) == 0))
            goto LABEL_36;
          v46 = v44;
          v47 = v45;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBD8);
          if ((sub_2463C0858() & 1) != 0)
          {
            v48 = sub_2463BC4E4(v41, v43);
            if ((v47 & 1) != (v49 & 1))
              goto LABEL_38;
            v46 = v48;
          }
          v50 = (_QWORD *)v63[0];
          if ((v47 & 1) != 0)
          {
            v51 = *(_QWORD *)(v63[0] + 56);
            swift_bridgeObjectRelease();
            *(_QWORD *)(v51 + 8 * v46) = v39;
          }
          else
          {
            *(_QWORD *)(v63[0] + 8 * (v46 >> 6) + 64) |= 1 << v46;
            v52 = (uint64_t *)(v50[6] + 16 * v46);
            *v52 = v41;
            v52[1] = v43;
            *(_QWORD *)(v50[7] + 8 * v46) = v39;
            v53 = v50[2];
            v54 = __OFADD__(v53, 1);
            v55 = v53 + 1;
            if (v54)
              goto LABEL_37;
            v50[2] = v55;
            swift_bridgeObjectRetain();
          }
          a1 = v59;
          *v59 = v50;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v25 = v64;
        }
        v26 += 2;
        --v25;
      }
      while (v25);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_246392930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = sub_2463C0630();
  v4 = sub_2463BABAC(v2, v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v4)
    return 1;
  v6 = *(_QWORD *)(v0 + 56);
  v7 = sub_2463C0630();
  v9 = sub_2463BABAC(v7, v8, v6) != 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_6();
  return (2 * v9);
}

void sub_2463929CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
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

  OUTLINED_FUNCTION_28_0();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC0);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_5_5();
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_33_0();
  v15 = MEMORY[0x24BEE4AF8];
  v8 = *(_QWORD *)(v0 + 48);
  v9 = OUTLINED_FUNCTION_27_1();
  v11 = sub_2463BABAC(v9, v10, v8);
  swift_bridgeObjectRelease();
  if (v11
    || (v12 = *(_QWORD *)(v0 + 56),
        v13 = OUTLINED_FUNCTION_27_1(),
        v11 = sub_2463BABAC(v13, v14, v12),
        OUTLINED_FUNCTION_7_5(),
        v11))
  {
    sub_2463B9604(v11);
  }
  if (*(_QWORD *)(v15 + 16) < 2uLL)
  {
    sub_246392B4C(v15, v1);
    OUTLINED_FUNCTION_3_6();
    if (__swift_getEnumTagSinglePayload(v1, 1, v6) == 1)
    {
      sub_24639456C(v1, &qword_25756FBC0);
    }
    else
    {
      sub_246393724(v1, v2);
      sub_246393724(v2, (uint64_t)v4);
    }
    OUTLINED_FUNCTION_24_0();
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_5_3();
  }
  else
  {
    *v4 = v15;
    OUTLINED_FUNCTION_24_0();
    swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_246392B4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for UserAccount();
  v6 = v5;
  if (v4)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
    sub_246394534(a1 + ((v7 + 32) & ~v7), a2, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v8, 1, v6);
}

void sub_246392BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;

  OUTLINED_FUNCTION_28_0();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  v26 = OUTLINED_FUNCTION_9_3();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_33_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC0);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_0(v25, 1);
  v31 = *(_QWORD *)(v20 + 40);
  if (*(_QWORD *)(v31 + 16) == 2)
  {
    OUTLINED_FUNCTION_34_0();
    v33 = v31 + v32;
    v34 = *(_QWORD *)(v27 + 72);
    swift_bridgeObjectRetain();
    LOBYTE(v35) = 0;
    v36 = 0;
    while (1)
    {
      v37 = v35;
      sub_246394534(v33 + v34 * v36, v21, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
      if ((*(_BYTE *)(v21 + *(int *)(v26 + 32)) & 1) == 0)
        break;
      sub_24639409C(v21, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
      v35 = 1;
      v36 = 1;
      if ((v37 & 1) != 0)
        goto LABEL_7;
    }
    sub_246393724(v21, (uint64_t)v30);
    v35 = 0;
LABEL_7:
    OUTLINED_FUNCTION_39_0((uint64_t)v30, v35);
    swift_bridgeObjectRelease();
    sub_24639456C(v25, &qword_25756FBC0);
    sub_2463937E4((uint64_t)v30, v25, &qword_25756FBC0);
  }
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_246392D00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  int EnumCaseMultiPayload;
  uint64_t v22;
  char v23;
  _BYTE v25[80];
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_28_0();
  v26 = v0;
  v27 = v1;
  v3 = v2;
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v25[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_21_0();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)&v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v25[-v11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCA0);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_12_0();
  v16 = v15 - v14;
  v18 = (uint64_t *)(v15 - v14 + *(int *)(v17 + 48));
  OUTLINED_FUNCTION_20_0(v3, v15 - v14);
  v19 = OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_20_0(v19, v20);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    sub_246394534(v16, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for UserAccountManager.LookupResult);
    if (!OUTLINED_FUNCTION_12_3())
    {
      sub_246393724((uint64_t)v18, (uint64_t)v6);
      v23 = sub_2463A8248((uint64_t)v12, (uint64_t)v6);
      OUTLINED_FUNCTION_11_2((uint64_t)v6);
      OUTLINED_FUNCTION_11_2((uint64_t)v12);
      goto LABEL_12;
    }
    sub_24639409C((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
    goto LABEL_10;
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_246394534(v16, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for UserAccountManager.LookupResult);
    v22 = *v10;
    if (OUTLINED_FUNCTION_12_3() == 1)
    {
      v23 = sub_246392F94(v22, *v18);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_6();
LABEL_12:
      sub_24639409C(v16, (uint64_t (*)(_QWORD))type metadata accessor for UserAccountManager.LookupResult);
      return v23 & 1;
    }
    OUTLINED_FUNCTION_3_6();
    goto LABEL_10;
  }
  if (OUTLINED_FUNCTION_12_3() != 2)
  {
LABEL_10:
    sub_24639456C(v16, &qword_25756FCA0);
    v23 = 0;
    return v23 & 1;
  }
  sub_24639409C(v16, (uint64_t (*)(_QWORD))type metadata accessor for UserAccountManager.LookupResult);
  v23 = 1;
  return v23 & 1;
}

void sub_246392F10()
{
  sub_2463C0978();
  sub_2463C0984();
  sub_2463C0990();
  OUTLINED_FUNCTION_31_1();
}

void sub_246392F54()
{
  sub_246392F10();
}

void sub_246392F5C()
{
  sub_2463C0978();
  sub_2463C0984();
  sub_2463C0990();
  OUTLINED_FUNCTION_31_1();
}

uint64_t sub_246392F94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for UserAccount();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_246394534(a1 + v12, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
        sub_246394534(a2 + v12, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
        v15 = sub_2463A8248((uint64_t)v10, (uint64_t)v7);
        sub_24639409C((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
        sub_24639409C((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

unint64_t sub_2463930D0(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

void (*sub_246393118(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_246393344(v6);
  v6[10] = sub_2463931F4(v6 + 4, a2, a3);
  return sub_2463931A8;
}

void sub_2463931A8(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  OUTLINED_FUNCTION_3_6();
  v2(v1, 0);
  free(v1);
}

void (*sub_2463931F4(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  void (*result)(uint64_t **);

  v4 = v3;
  v8 = malloc(0x30uLL);
  *a1 = v8;
  v8[2] = a3;
  v8[3] = v4;
  v8[1] = a2;
  v9 = *v4;
  v10 = sub_2463BC4E4(a2, a3);
  *((_BYTE *)v8 + 40) = v11 & 1;
  if (__OFADD__(*(_QWORD *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v12 = v10;
  v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBD8);
  if ((sub_2463C0858() & 1) != 0)
  {
    v14 = sub_2463BC4E4(a2, a3);
    if ((v13 & 1) == (v15 & 1))
    {
      v12 = v14;
      goto LABEL_5;
    }
LABEL_10:
    result = (void (*)(uint64_t **))sub_2463C093C();
    __break(1u);
    return result;
  }
LABEL_5:
  v8[4] = v12;
  if ((v13 & 1) != 0)
    v16 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v12);
  else
    v16 = 0;
  *v8 = v16;
  return sub_24639330C;
}

void sub_24639330C(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_246393370(*a1, *((_BYTE *)*a1 + 40), (_QWORD **)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17_1(v1);
}

uint64_t (*sub_246393344(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_246393364;
}

uint64_t sub_246393364(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_246393370(uint64_t *a1, char a2, _QWORD **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)((*a3)[7] + 8 * a4) = v6;
    }
    else
    {
      sub_2463930D0(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC8);
    sub_2463C0864();
  }
  return swift_bridgeObjectRetain();
}

void sub_246393430(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463C060C();
  objc_msgSend(a3, sel_setProfileId_, v4);

}

id sub_246393474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_28_0();
  v28 = v0;
  v29 = v1;
  v26 = v2;
  v27 = v3;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_9_3();
  v10 = *(_QWORD *)(v5 + *(int *)(v9 + 20) + 8);
  if (v10)
  {
    OUTLINED_FUNCTION_26_1();
    v11 = (void *)OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_7_5();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_allocWithZone((Class)type metadata accessor for Account());
  OUTLINED_FUNCTION_14();
  v13 = (void *)sub_2463C060C();
  OUTLINED_FUNCTION_2_5();
  v14 = objc_msgSend(v12, sel_initWithIdentifier_displayString_, v11, v13, v26);

  v15 = (uint64_t *)(v5 + *(int *)(v9 + 24));
  v16 = *v15;
  v17 = v15[1];
  v18 = v14;
  OUTLINED_FUNCTION_14();
  sub_246393430(v16, v17, v18);
  swift_bridgeObjectRelease();
  v19 = (void *)sub_2463C06CC();
  OUTLINED_FUNCTION_14_3((uint64_t)v19, sel_setIsActive_);

  v20 = objc_msgSend(v18, sel_setMatchedMultiple_, v27 & 1);
  if (v10)
  {
    OUTLINED_FUNCTION_26_1();
    v21 = (void *)OUTLINED_FUNCTION_30_0();
    v20 = (id)OUTLINED_FUNCTION_7_5();
  }
  else
  {
    v21 = 0;
  }
  OUTLINED_FUNCTION_14_3((uint64_t)v20, sel_setICloudAltDSID_);

  sub_2463936DC(v5, (uint64_t)v8);
  v22 = sub_2463BF934();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v22) == 1)
  {
    sub_24639456C((uint64_t)v8, &qword_25756FBA8);
    v24 = 0;
  }
  else
  {
    sub_2463BF91C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v8, v22);
    OUTLINED_FUNCTION_33_1();
    v24 = (void *)sub_2463C060C();
    v23 = OUTLINED_FUNCTION_7_5();
  }
  OUTLINED_FUNCTION_14_3(v23, sel_setHomeUserID_);

  objc_msgSend(v18, sel_setProfileImage_, 0);
  sub_24639409C(v5, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
  swift_release();
  return v18;
}

uint64_t sub_2463936DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246393724(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserAccount();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UserAccountManager.LookupResult()
{
  uint64_t result;

  result = qword_25756FC60;
  if (!qword_25756FC60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2463937A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserAccount();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2463937E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_37(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_25();
}

int64_t sub_24639381C(int64_t result, int a2, char a3, uint64_t a4)
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
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    v10 = *(_QWORD *)(v6 + 8 * v9);
    if (v10)
      return __clz(__rbit64(v10)) + (v9 << 6);
    v11 = (unint64_t)(result + 63) >> 6;
    v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      v10 = *(_QWORD *)(v6 + 8 * v9);
      if (v10)
        return __clz(__rbit64(v10)) + (v9 << 6);
      while (v5 + 3 < v11)
      {
        v10 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_246393900(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_246393980(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t *sub_24639398C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v8 = sub_2463BF934();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v8))
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v8);
      }
      v11 = (int *)type metadata accessor for UserAccount();
      v12 = v11[5];
      v13 = (uint64_t *)((char *)a1 + v12);
      v14 = (uint64_t *)((char *)a2 + v12);
      v16 = *v14;
      v15 = v14[1];
      *v13 = v16;
      v13[1] = v15;
      v17 = v11[6];
      v18 = (uint64_t *)((char *)a1 + v17);
      v19 = (uint64_t *)((char *)a2 + v17);
      v30 = v19[1];
      *v18 = *v19;
      v18[1] = v30;
      v20 = v11[7];
      v21 = (uint64_t *)((char *)a1 + v20);
      v22 = (uint64_t *)((char *)a2 + v20);
      v23 = v22[1];
      *v21 = *v22;
      v21[1] = v23;
      v24 = v22[3];
      v21[2] = v22[2];
      v21[3] = v24;
      v25 = v22[5];
      v21[4] = v22[4];
      v21[5] = v25;
      v26 = v22[7];
      v21[6] = v22[6];
      v21[7] = v26;
      v27 = v22[9];
      v21[8] = v22[8];
      v21[9] = v27;
      v28 = v22[11];
      v21[10] = v22[10];
      v21[11] = v28;
      v21[12] = v22[12];
      *((_BYTE *)a1 + v11[8]) = *((_BYTE *)a2 + v11[8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_11;
    }
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t sub_246393B9C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result)
      return result;
    v3 = sub_2463BF934();
    if (!__swift_getEnumTagSinglePayload(a1, 1, v3))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    type metadata accessor for UserAccount();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *sub_246393C74(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (!EnumCaseMultiPayload)
  {
    v7 = sub_2463BF934();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v9 = (int *)type metadata accessor for UserAccount();
    v10 = v9[5];
    v11 = (_QWORD *)((char *)a1 + v10);
    v12 = (_QWORD *)((char *)a2 + v10);
    v14 = *v12;
    v13 = v12[1];
    *v11 = v14;
    v11[1] = v13;
    v15 = v9[6];
    v16 = (_QWORD *)((char *)a1 + v15);
    v17 = (_QWORD *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = v9[7];
    v20 = (_QWORD *)((char *)a1 + v19);
    v21 = (_QWORD *)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = v21[3];
    v20[2] = v21[2];
    v20[3] = v23;
    v24 = v21[5];
    v20[4] = v21[4];
    v20[5] = v24;
    v25 = v21[7];
    v20[6] = v21[6];
    v20[7] = v25;
    v26 = v21[9];
    v20[8] = v21[8];
    v20[9] = v26;
    v27 = v21[11];
    v20[10] = v21[10];
    v20[11] = v27;
    v20[12] = v21[12];
    *((_BYTE *)a1 + v9[8]) = *((_BYTE *)a2 + v9[8]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *sub_246393E5C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  if (a1 != a2)
  {
    sub_24639409C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for UserAccountManager.LookupResult);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (!EnumCaseMultiPayload)
    {
      v7 = sub_2463BF934();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
      }
      v9 = (int *)type metadata accessor for UserAccount();
      v10 = v9[5];
      v11 = (_QWORD *)((char *)a1 + v10);
      v12 = (_QWORD *)((char *)a2 + v10);
      *v11 = *v12;
      v11[1] = v12[1];
      v13 = v9[6];
      v14 = (_QWORD *)((char *)a1 + v13);
      v15 = (_QWORD *)((char *)a2 + v13);
      *v14 = *v15;
      v14[1] = v15[1];
      v16 = v9[7];
      v17 = (_QWORD *)((char *)a1 + v16);
      v18 = (_QWORD *)((char *)a2 + v16);
      *v17 = *v18;
      v17[1] = v18[1];
      v17[2] = v18[2];
      v17[3] = v18[3];
      v17[4] = v18[4];
      v17[5] = v18[5];
      v17[6] = v18[6];
      v17[7] = v18[7];
      v17[8] = v18[8];
      v17[9] = v18[9];
      v17[10] = v18[10];
      v17[11] = v18[11];
      v17[12] = v18[12];
      *((_BYTE *)a1 + v9[8]) = *((_BYTE *)a2 + v9[8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_10;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void sub_24639409C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_13_3(v2);
  OUTLINED_FUNCTION_25();
}

char *sub_2463940C4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_2463BF934();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
    }
    v8 = (int *)type metadata accessor for UserAccount();
    *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
    *(_OWORD *)&a1[v8[6]] = *(_OWORD *)&a2[v8[6]];
    memcpy(&a1[v8[7]], &a2[v8[7]], 0x68uLL);
    a1[v8[8]] = a2[v8[8]];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_2463941E0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;

  if (a1 != a2)
  {
    sub_24639409C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for UserAccountManager.LookupResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_2463BF934();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
      {
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      }
      v8 = (int *)type metadata accessor for UserAccount();
      *(_OWORD *)&a1[v8[5]] = *(_OWORD *)&a2[v8[5]];
      *(_OWORD *)&a1[v8[6]] = *(_OWORD *)&a2[v8[6]];
      memcpy(&a1[v8[7]], &a2[v8[7]], 0x68uLL);
      a1[v8[8]] = a2[v8[8]];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_246394320()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_246394330()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UserAccount();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SwitchByNameType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SwitchByNameType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246394474 + 4 * byte_2463C1B85[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2463944A8 + 4 * byte_2463C1B80[v4]))();
}

uint64_t sub_2463944A8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463944B0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463944B8);
  return result;
}

uint64_t sub_2463944C4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463944CCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2463944D0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463944D8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SwitchByNameType()
{
  return &type metadata for SwitchByNameType;
}

unint64_t sub_2463944F8()
{
  unint64_t result;

  result = qword_25756FC98;
  if (!qword_25756FC98)
  {
    result = MEMORY[0x249559D74](&unk_2463C1C14, &type metadata for SwitchByNameType);
    atomic_store(result, (unint64_t *)&qword_25756FC98);
  }
  return result;
}

void sub_246394534(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_37(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_25();
}

void sub_24639456C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_13_3(v2);
  OUTLINED_FUNCTION_25();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return type metadata accessor for UserAccount();
}

uint64_t OUTLINED_FUNCTION_6_5(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_2463B9318(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return type metadata accessor for UserAccount();
}

void OUTLINED_FUNCTION_11_2(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_24639409C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_13_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

id OUTLINED_FUNCTION_14_3(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

void OUTLINED_FUNCTION_17_1(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_19_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_246394534(a1, a2, v2);
}

void OUTLINED_FUNCTION_20_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_246394534(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return type metadata accessor for UserAccountManager.LookupResult();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return sub_2463C0630();
}

void OUTLINED_FUNCTION_28_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
}

unint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2463BC4E4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return sub_2463C060C();
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(v0 + 296, 0);
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_37@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_39_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_40_0(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_2463B9318(a1, a2, 1, v2);
}

uint64_t destroy for IdentityDialogProvider(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return swift_release();
}

uint64_t initializeWithCopy for IdentityDialogProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for IdentityDialogProvider(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  a1[10] = a2[10];
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy88_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x58uLL);
}

uint64_t assignWithTake for IdentityDialogProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

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
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityDialogProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 88))
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

uint64_t storeEnumTagSinglePayload for IdentityDialogProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityDialogProvider()
{
  return &type metadata for IdentityDialogProvider;
}

uint64_t sub_246394900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_16_2(a1);
  *(_QWORD *)(v1 + 48) = OUTLINED_FUNCTION_6_6(v2);
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246394934()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_15_2();
  v0 = OUTLINED_FUNCTION_12_4();
  v1 = (_QWORD *)OUTLINED_FUNCTION_26_2(v0);
  OUTLINED_FUNCTION_25_1(v1);
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_7_6(v2, v3, v4, v5);
}

uint64_t sub_246394984()
{
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463949C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 64));
  sub_2463BFC58();
  v6 = sub_2463BFE80();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v7 = sub_2463C0060();
  memset(v10, 0, sizeof(v10));
  v11 = 0;
  v8 = MEMORY[0x24BE99088];
  a1[3] = v7;
  a1[4] = v8;
  __swift_allocate_boxed_opaque_existential_1Tm(a1);
  sub_2463BFDB4();
  sub_2463857A0((uint64_t)v10, &qword_257570230);
  return sub_2463857A0((uint64_t)v5, &qword_257570220);
}

uint64_t sub_246394B08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_16_2(a1);
  *(_QWORD *)(v1 + 48) = OUTLINED_FUNCTION_6_6(v2);
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246394B3C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_15_2();
  v0 = OUTLINED_FUNCTION_12_4();
  v1 = (_QWORD *)OUTLINED_FUNCTION_26_2(v0);
  OUTLINED_FUNCTION_25_1(v1);
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_7_6(v2, v3, v4, v5);
}

uint64_t sub_246394B8C()
{
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246394BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = *(_QWORD *)(v0 + 40);
  sub_2463949C0(*(uint64_t **)(v0 + 16));
  OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_14_2();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_1_6(v2);
}

uint64_t sub_246394C1C()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246394C48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_16_2(a1);
  *(_QWORD *)(v1 + 48) = OUTLINED_FUNCTION_6_6(v2);
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246394C7C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_15_2();
  v0 = OUTLINED_FUNCTION_12_4();
  v1 = (_QWORD *)OUTLINED_FUNCTION_26_2(v0);
  OUTLINED_FUNCTION_25_1(v1);
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_7_6(v2, v3, v4, v5);
}

uint64_t sub_246394CCC()
{
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246394D08()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint8_t *v27;
  uint8_t *v28;
  uint64_t v29;
  int v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[40];
  _QWORD v35[4];

  v1 = sub_2463BF94C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2463C05B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2463A442C(0x53474E4954544553, 0xE800000000000000);
  if (v10)
  {
    v11 = v9;
    v12 = v10;
    sub_246395EA8();
    v13 = sub_2463B97B8(v11, v12);
    swift_bridgeObjectRelease();
    return v13;
  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v5, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v15, v5);
    sub_246395E34(v0, (uint64_t)v34);
    v16 = sub_2463C05A0();
    v17 = sub_2463C072C();
    v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      v31 = v16;
      v19 = swift_slowAlloc();
      v30 = v18;
      v20 = (uint8_t *)v19;
      v21 = swift_slowAlloc();
      v29 = v21;
      v28 = v20;
      *(_DWORD *)v20 = 136315138;
      v33 = v21;
      v27 = v20 + 4;
      __swift_project_boxed_opaque_existential_1(v35, v35[3]);
      sub_2463BFC4C();
      sub_246395E68();
      v22 = sub_2463C08F4();
      v24 = v23;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v32 = sub_24639AE68(v22, v24, &v33);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      sub_24638C60C((uint64_t)v34);
      v16 = v31;
      v25 = v28;
      _os_log_impl(&dword_246381000, v31, (os_log_type_t)v30, "Missing Settings label for locale:%s", v28, 0xCu);
      v26 = v29;
      swift_arrayDestroy();
      MEMORY[0x249559E1C](v26, -1, -1);
      MEMORY[0x249559E1C](v25, -1, -1);
    }
    else
    {
      sub_24638C60C((uint64_t)v34);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return MEMORY[0x24BEE4AF8];
  }
}

uint64_t sub_246395000(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 136) = a2;
  *(_QWORD *)(v3 + 96) = a1;
  *(_QWORD *)(v3 + 104) = v2;
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_246395014()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_BYTE *)(v0 + 136);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v2 = OUTLINED_FUNCTION_21_1();
  *(_OWORD *)(v2 + 16) = xmmword_2463C1B70;
  strcpy((char *)(v2 + 32), "forNoNameMatch");
  *(_BYTE *)(v2 + 47) = -18;
  *(_QWORD *)(v2 + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(v2 + 48) = v1;
  *(_QWORD *)(v0 + 112) = sub_2463C05E8();
  OUTLINED_FUNCTION_8_5();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v3;
  *v3 = v0;
  v3[1] = sub_246395100;
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_30_1();
  return sub_2463AAD98(v4, v5, v6, v7);
}

uint64_t sub_246395100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_29_2(v3);
  *(_QWORD *)(v0 + 128) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_21();
    return OUTLINED_FUNCTION_2_6();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_1_6(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_246395158()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246395184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  v5 = sub_2463BFE98();
  v4[16] = v5;
  v4[17] = *(_QWORD *)(v5 - 8);
  v4[18] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463951D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[14];
  v2 = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v3 = OUTLINED_FUNCTION_21_1();
  *(_OWORD *)(v3 + 16) = xmmword_2463C1B70;
  *(_QWORD *)(v3 + 32) = 0x4E79616C70736964;
  *(_QWORD *)(v3 + 40) = 0xEB00000000656D61;
  *(_QWORD *)(v3 + 72) = MEMORY[0x24BEE0D00];
  if (v1)
    v4 = v2;
  else
    v4 = 0;
  OUTLINED_FUNCTION_37_0(v3, v4);
  v0[19] = OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_8_5();
  v5 = (_QWORD *)swift_task_alloc();
  v0[20] = v5;
  *v5 = v0;
  v5[1] = sub_2463952BC;
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_30_1();
  return OUTLINED_FUNCTION_18_2(v6, v7, v8, v9);
}

uint64_t sub_2463952BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_2_6();
}

uint64_t sub_24639531C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = *(_QWORD *)(v0 + 136);
  sub_2463949C0(*(uint64_t **)(v0 + 96));
  OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_14_2();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_1_6(v2);
}

uint64_t sub_246395370()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24639539C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_16_2(a1);
  *(_QWORD *)(v1 + 48) = OUTLINED_FUNCTION_6_6(v2);
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463953D0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_15_2();
  v0 = OUTLINED_FUNCTION_12_4();
  v1 = (_QWORD *)OUTLINED_FUNCTION_26_2(v0);
  OUTLINED_FUNCTION_25_1(v1);
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_7_6(v2, v3, v4, v5);
}

uint64_t sub_246395420(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_16_2(a1);
  *(_QWORD *)(v1 + 48) = OUTLINED_FUNCTION_6_6(v2);
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246395454()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_15_2();
  v0 = OUTLINED_FUNCTION_12_4();
  v1 = (_QWORD *)OUTLINED_FUNCTION_26_2(v0);
  OUTLINED_FUNCTION_25_1(v1);
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_24_1();
  return OUTLINED_FUNCTION_7_6(v2, v3, v4, v5);
}

uint64_t sub_2463954A4()
{
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463954E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t (*v3)(void);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(uint64_t **)(v0 + 16);
  sub_246394D08();
  sub_2463949C0(v2);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_14_2();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_1_6(v3);
}

uint64_t sub_24639554C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[14] = a3;
  v4[15] = v3;
  v4[12] = a1;
  v4[13] = a2;
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_246395560()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[14];
  v2 = v0[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v3 = OUTLINED_FUNCTION_21_1();
  *(_OWORD *)(v3 + 16) = xmmword_2463C1B70;
  *(_QWORD *)(v3 + 32) = 0x614E656369766564;
  *(_QWORD *)(v3 + 40) = 0xEA0000000000656DLL;
  *(_QWORD *)(v3 + 72) = MEMORY[0x24BEE0D00];
  if (v1)
    v4 = v2;
  else
    v4 = 0;
  OUTLINED_FUNCTION_37_0(v3, v4);
  v0[16] = OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_8_5();
  v5 = (_QWORD *)swift_task_alloc();
  v0[17] = v5;
  *v5 = v0;
  v5[1] = sub_246395648;
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_30_1();
  return OUTLINED_FUNCTION_18_2(v6, v7, v8, v9);
}

uint64_t sub_246395648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_29_2(v3);
  *(_QWORD *)(v0 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_21();
    return OUTLINED_FUNCTION_2_6();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_1_6(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_2463956A0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463956CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_2463956E0()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v1 = (__n128 *)OUTLINED_FUNCTION_32_2();
  v2 = OUTLINED_FUNCTION_23_0(v1, (__n128)xmmword_2463C1B70);
  v3 = OUTLINED_FUNCTION_19_2((uint64_t)v2, (uint64_t)"isCommunalDevice");
  OUTLINED_FUNCTION_27_2(v3, MEMORY[0x24BEE1328]);
  *(_QWORD *)(v0 + 120) = OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_8_5();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v4;
  *v4 = v0;
  v4[1] = sub_2463957A4;
  OUTLINED_FUNCTION_17_2();
  return OUTLINED_FUNCTION_10_4(v5, v6, v7, v8);
}

uint64_t sub_2463957A4()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_14_4();
  if (v0)
  {
    OUTLINED_FUNCTION_21();
    return OUTLINED_FUNCTION_2_6();
  }
  else
  {
    OUTLINED_FUNCTION_28_2();
    return OUTLINED_FUNCTION_1_6(*(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_2463957E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246395814(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_246395828()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v1 = (__n128 *)OUTLINED_FUNCTION_32_2();
  v2 = OUTLINED_FUNCTION_23_0(v1, (__n128)xmmword_2463C1B70);
  v3 = OUTLINED_FUNCTION_19_2((uint64_t)v2, (uint64_t)"isCommunalDevice");
  OUTLINED_FUNCTION_27_2(v3, MEMORY[0x24BEE1328]);
  *(_QWORD *)(v0 + 120) = OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_8_5();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v4;
  OUTLINED_FUNCTION_35_0(v4);
  OUTLINED_FUNCTION_17_2();
  return OUTLINED_FUNCTION_10_4(v5, v6, v7, v8);
}

uint64_t sub_2463958E0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_14_4();
  if (v0)
  {
    OUTLINED_FUNCTION_21();
    return OUTLINED_FUNCTION_2_6();
  }
  else
  {
    OUTLINED_FUNCTION_28_2();
    return OUTLINED_FUNCTION_1_6(*(uint64_t (**)(void))(v1 + 8));
  }
}

uint64_t sub_246395924(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_246395938()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v1 = (__n128 *)OUTLINED_FUNCTION_32_2();
  v2 = OUTLINED_FUNCTION_23_0(v1, (__n128)xmmword_2463C1B70);
  v3 = OUTLINED_FUNCTION_19_2((uint64_t)v2, (uint64_t)"isCommunalDevice");
  OUTLINED_FUNCTION_27_2(v3, MEMORY[0x24BEE1328]);
  *(_QWORD *)(v0 + 120) = OUTLINED_FUNCTION_36_1();
  OUTLINED_FUNCTION_8_5();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v4;
  OUTLINED_FUNCTION_35_0(v4);
  OUTLINED_FUNCTION_17_2();
  return OUTLINED_FUNCTION_10_4(v5, v6, v7, v8);
}

uint64_t sub_2463959F0(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v4 + 185) = a3;
  *(_BYTE *)(v4 + 184) = a2;
  *(_QWORD *)(v4 + 144) = a1;
  *(_QWORD *)(v4 + 152) = v3;
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_246395A08()
{
  uint64_t v0;
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_BYTE *)(v0 + 185);
  v2 = *(_BYTE *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v3 = OUTLINED_FUNCTION_21_1();
  *(_OWORD *)(v3 + 16) = xmmword_2463C1CB0;
  strcpy((char *)(v3 + 32), "highConfidence");
  *(_BYTE *)(v3 + 47) = -18;
  v4 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v3 + 48) = v2;
  *(_QWORD *)(v3 + 72) = v4;
  *(_QWORD *)(v3 + 80) = 0x506E497075746573;
  *(_QWORD *)(v3 + 88) = 0xEF73736572676F72;
  *(_QWORD *)(v3 + 120) = v4;
  *(_BYTE *)(v3 + 96) = v1;
  *(_QWORD *)(v0 + 160) = sub_2463C05E8();
  OUTLINED_FUNCTION_8_5();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v5;
  *v5 = v0;
  v5[1] = sub_246395B18;
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_30_1();
  return OUTLINED_FUNCTION_10_4(v6, v7, v8, v9);
}

uint64_t sub_246395B18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_29_2(v3);
  *(_QWORD *)(v0 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_21();
    return OUTLINED_FUNCTION_2_6();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_1_6(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_246395B70()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246395B9C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 184) = a2;
  *(_QWORD *)(v4 + 192) = v3;
  *(_BYTE *)(v4 + 232) = a3;
  *(_QWORD *)(v4 + 176) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FD10);
  *(_QWORD *)(v4 + 200) = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246395BE8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1Tm;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_BYTE *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FCB0);
  v4 = OUTLINED_FUNCTION_21_1();
  *(_OWORD *)(v4 + 16) = xmmword_2463C1CB0;
  *(_QWORD *)(v4 + 32) = 0xD000000000000012;
  *(_QWORD *)(v4 + 40) = 0x80000002463C4860;
  v5 = sub_2463C0450();
  v6 = OUTLINED_FUNCTION_38_1(v3);
  v7 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v4 + 48) = (v6 != 1) & v2;
  *(_QWORD *)(v4 + 72) = v7;
  *(_QWORD *)(v4 + 80) = 0x73696C6261747365;
  *(_QWORD *)(v4 + 88) = 0xEF656D614E646568;
  sub_246395EE4(v3, v1);
  v8 = OUTLINED_FUNCTION_38_1(v1);
  v9 = *(_QWORD *)(v0 + 200);
  if (v8 == 1)
  {
    v10 = MEMORY[0x24BEE0D00];
    sub_2463857A0(*(_QWORD *)(v0 + 200), &qword_25756FD10);
    *(_QWORD *)(v4 + 120) = v10;
    *(_QWORD *)(v4 + 96) = 0;
    *(_QWORD *)(v4 + 104) = 0xE000000000000000;
  }
  else
  {
    *(_QWORD *)(v0 + 168) = v5;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)(v0 + 144));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(boxed_opaque_existential_1Tm, v9, v5);
    sub_246395F68((_OWORD *)(v0 + 144), (_OWORD *)(v4 + 96));
  }
  *(_QWORD *)(v0 + 208) = sub_2463C05E8();
  OUTLINED_FUNCTION_8_5();
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v12;
  *v12 = v0;
  v12[1] = sub_246395DA0;
  OUTLINED_FUNCTION_17_2();
  return sub_2463AAD98(v13, v14, v15, v16);
}

uint64_t sub_246395DA0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_29_2(v2);
  *(_QWORD *)(v0 + 224) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_21();
    return OUTLINED_FUNCTION_2_6();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
    return OUTLINED_FUNCTION_1_6(v4);
  }
}

uint64_t sub_246395E00()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246395E34(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for IdentityDialogProvider(a2, a1);
  return a2;
}

unint64_t sub_246395E68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25756FCC0;
  if (!qword_25756FCC0)
  {
    v1 = sub_2463BF94C();
    result = MEMORY[0x249559D74](MEMORY[0x24BDCEEF0], v1);
    atomic_store(result, &qword_25756FCC0);
  }
  return result;
}

unint64_t sub_246395EA8()
{
  unint64_t result;

  result = qword_2575712D0;
  if (!qword_2575712D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575712D0);
  }
  return result;
}

uint64_t sub_246395EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FD10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
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

_OWORD *sub_246395F68(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_6(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3_7(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 64) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6_6(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(a1 - 8);
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_7_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

_QWORD *OUTLINED_FUNCTION_8_5()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_10_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2463AAD98(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 136) = v0;
  return swift_task_dealloc();
}

_QWORD *OUTLINED_FUNCTION_15_2()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 24), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24));
}

uint64_t OUTLINED_FUNCTION_16_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return sub_2463BFE98();
}

uint64_t OUTLINED_FUNCTION_18_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2463AAD98(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_19_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 32) = v2;
  *(_QWORD *)(a1 + 40) = (a2 - 32) | 0x8000000000000000;
  return sub_24639CE08();
}

void OUTLINED_FUNCTION_20_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_initStackObject();
}

uint64_t OUTLINED_FUNCTION_22_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

__n128 *OUTLINED_FUNCTION_23_0(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_25_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 48);
}

uint64_t OUTLINED_FUNCTION_26_2(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_27_2@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a2;
  *(_BYTE *)(v2 + 48) = result & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_29_2(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return swift_initStackObject();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_2463C05E8();
}

uint64_t OUTLINED_FUNCTION_35_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 96);
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return sub_2463C05E8();
}

uint64_t OUTLINED_FUNCTION_37_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 48) = a2;
  *(_QWORD *)(a1 + 56) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void sub_2463961A8(_QWORD *a1)
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
  id v11;
  void (*v12)(uint64_t *__return_ptr, char *);
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char v24;

  v2 = sub_2463C05B8();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_12_0();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FD58);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12_0();
  v10 = v9 - v8;
  v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntent()), sel_init);
  sub_2463C03F0();
  v12 = (void (*)(uint64_t *__return_ptr, char *))sub_2463C03FC();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  v13 = a1[3];
  v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 48))(v13, v14);
  v12(&v23, &v24);
  swift_release();
  objc_msgSend(v11, sel_setCaseType_, v23);
  type metadata accessor for Identity();
  v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v16 = sub_2463966E8(0, 0);
  OUTLINED_FUNCTION_3_8();
  v17 = OUTLINED_FUNCTION_5_7(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32));
  if (v18)
  {
    v19 = (void *)sub_2463C060C();
    v17 = swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0;
  }
  OUTLINED_FUNCTION_6_7(v17, sel_setName_);

  OUTLINED_FUNCTION_3_8();
  v20 = OUTLINED_FUNCTION_5_7(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40));
  if (v21)
  {
    v22 = (void *)sub_2463C060C();
    v20 = swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  OUTLINED_FUNCTION_6_7(v20, sel_setNegativeName_);

  objc_msgSend(v11, sel_setIdentity_, v16);
  OUTLINED_FUNCTION_5_3();
}

void sub_2463964A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v2 = sub_2463C05B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_12_0();
  v6 = v5 - v4;
  v7 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntent()), sel_init);
  OUTLINED_FUNCTION_4_8();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v0, v1);
  if (v9)
  {
    sub_246396778(v8, v9, v7);
    swift_bridgeObjectRelease();
    v10 = 2;
  }
  else
  {
    OUTLINED_FUNCTION_4_8();
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 24))(v0, v1) & 1;
  }
  if (qword_25756EFC0 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v2, (uint64_t)qword_2575745F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v11, v2);
  v12 = sub_2463C05A0();
  v13 = sub_2463C0720();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_5();
    v17 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v14 = 136315138;
    v15 = SwitchType.description.getter();
    sub_24639AE68(v15, v16, &v17);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246381000, v12, v13, "Setting switchType with %s", v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(v7, sel_setSwitchType_, v10);
  OUTLINED_FUNCTION_5_3();
}

id sub_2463966E8(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a2)
  {
    v3 = (void *)sub_2463C060C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)sub_2463C060C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithIdentifier_displayString_, v3, v4);

  return v5;
}

void sub_246396778(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463C060C();
  objc_msgSend(a3, sel_setName_, v4);

}

_QWORD *OUTLINED_FUNCTION_3_8()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

_QWORD *OUTLINED_FUNCTION_4_8()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_5_7@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_6_7(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_2463967F8()
{
  uint64_t v0;
  uint64_t result;
  _OWORD v2[2];
  uint64_t v3;

  type metadata accessor for Globals();
  memset(v2, 0, sizeof(v2));
  v3 = 0;
  v0 = swift_allocObject();
  result = sub_24639687C((uint64_t)v2);
  qword_257574568 = v0;
  return result;
}

uint64_t sub_246396848()
{
  uint64_t v0;
  int v1;
  uint64_t result;

  v1 = *(unsigned __int8 *)(v0 + 56);
  if (v1 != 2)
    return v1 & 1;
  result = os_variant_has_internal_ui();
  *(_BYTE *)(v0 + 56) = result;
  return result;
}

uint64_t sub_24639687C(uint64_t a1)
{
  uint64_t v1;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  ValueMetadata *v7;
  _UNKNOWN **v8;

  *(_BYTE *)(v1 + 56) = 2;
  *(_QWORD *)(v1 + 64) = 0xD000000000000023;
  *(_QWORD *)(v1 + 72) = 0x80000002463C49F0;
  *(_QWORD *)(v1 + 80) = 0xD00000000000003BLL;
  *(_QWORD *)(v1 + 88) = 0x80000002463C4A20;
  *(_QWORD *)(v1 + 96) = 0xD000000000000030;
  *(_QWORD *)(v1 + 104) = 0x80000002463C4A60;
  *(_QWORD *)(v1 + 112) = 0xD00000000000003DLL;
  *(_QWORD *)(v1 + 120) = 0x80000002463C4AA0;
  sub_2463969E4(a1, (uint64_t)&v4);
  if (v5)
  {
    sub_246396A2C(a1);
    sub_246389878(&v4, (uint64_t)&v6);
  }
  else
  {
    v7 = &type metadata for DarwinProvider;
    v8 = &off_251794EB8;
    sub_246396A2C(a1);
    sub_246396A2C((uint64_t)&v4);
  }
  sub_246389878(&v6, v1 + 16);
  return v1;
}

uint64_t sub_246396968()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2463969A4()
{
  sub_246396968();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Globals()
{
  return objc_opt_self();
}

uint64_t sub_2463969E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246396A2C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DarwinProvider()
{
  return &type metadata for DarwinProvider;
}

uint64_t sub_246396A7C()
{
  uint64_t result;

  type metadata accessor for FLOWSchemaFLOWProfileSwitchMethod(0);
  sub_246396F6C();
  result = sub_2463C05E8();
  qword_257574570 = result;
  return result;
}

uint64_t sub_246396AC8()
{
  uint64_t result;

  type metadata accessor for FLOWSchemaFLOWProfileSwitchByNameType(0);
  sub_246396FA8();
  result = sub_2463C05E8();
  qword_257574578 = result;
  return result;
}

void *sub_246396B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v39;
  uint64_t v40;

  v40 = a4;
  v7 = sub_2463C05B8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v39 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v39 - v15;
  v17 = (uint64_t)OUTLINED_FUNCTION_6_8(objc_allocWithZone(MEMORY[0x24BE94BF0]));
  if (!v17)
  {
    if (qword_25756EFB0 != -1)
      v17 = swift_once();
    OUTLINED_FUNCTION_2_7(v17, (uint64_t)qword_2575745C8);
    OUTLINED_FUNCTION_4_9((uint64_t)v11, v23, v24);
    v25 = sub_2463C05A0();
    v26 = sub_2463C0720();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v27 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v25, v26, "#FlowLogIdentityContextUtils returning with nil domainContext", v27);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return 0;
  }
  v18 = (void *)v17;
  v19 = (uint64_t)OUTLINED_FUNCTION_6_8(objc_allocWithZone(MEMORY[0x24BE94C48]));
  if (!v19)
  {
    if (qword_25756EFB0 != -1)
      v19 = swift_once();
    OUTLINED_FUNCTION_2_7(v19, (uint64_t)qword_2575745C8);
    OUTLINED_FUNCTION_4_9((uint64_t)v14, v28, v29);
    v30 = sub_2463C05A0();
    v31 = sub_2463C0720();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v32 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v30, v31, "#FlowLogIdentityContextUtils returning with nil identityDomainContext", v32);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
    return 0;
  }
  v20 = (void *)v19;
  v21 = OUTLINED_FUNCTION_6_8(objc_allocWithZone(MEMORY[0x24BE94C98]));
  if (!v21)
  {
    if (qword_25756EFB0 != -1)
      v21 = (id)swift_once();
    OUTLINED_FUNCTION_2_7((uint64_t)v21, (uint64_t)qword_2575745C8);
    OUTLINED_FUNCTION_4_9((uint64_t)v16, v33, v34);
    v35 = sub_2463C05A0();
    v36 = sub_2463C0720();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v37 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v35, v36, "#FlowLogIdentityContextUtils returning with nil profileSwitchContext", v37);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v16, v7);
    return 0;
  }
  v22 = v21;
  if (a1 != 4)
  {
    if (qword_25756EF58 != -1)
      v21 = (id)swift_once();
    if (*(_QWORD *)(qword_257574570 + 16))
      v21 = (id)sub_2463BC540(a1);
    v21 = OUTLINED_FUNCTION_5_8((uint64_t)v21, sel_setProfileSwitchMethod_);
  }
  if ((a3 & 0x100000000) == 0)
    v21 = objc_msgSend(v22, sel_setProfileSwitchOutcome_, a3);
  if ((v40 & 0x100000000) == 0)
    v21 = OUTLINED_FUNCTION_5_8((uint64_t)v21, sel_setProfileSwitchFailureReason_);
  if (a2 != 3)
  {
    if (qword_25756EF60 != -1)
      v21 = (id)swift_once();
    if (*(_QWORD *)(qword_257574578 + 16))
      v21 = (id)sub_2463BC540(a2);
    OUTLINED_FUNCTION_5_8((uint64_t)v21, sel_setProfileSwitchByNameType_);
  }
  objc_msgSend(v20, sel_setProfileSwitchContext_, v22);
  objc_msgSend(v18, sel_setIdentityContext_, v20);

  return v18;
}

unint64_t sub_246396F6C()
{
  unint64_t result;

  result = qword_25756FE40;
  if (!qword_25756FE40)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for UseCase, &type metadata for UseCase);
    atomic_store(result, (unint64_t *)&qword_25756FE40);
  }
  return result;
}

unint64_t sub_246396FA8()
{
  unint64_t result;

  result = qword_25756FE48;
  if (!qword_25756FE48)
  {
    result = MEMORY[0x249559D74](&unk_2463C1C64, &type metadata for SwitchByNameType);
    atomic_store(result, (unint64_t *)&qword_25756FE48);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_project_value_buffer(v2, a2);
}

uint64_t OUTLINED_FUNCTION_4_9@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

id OUTLINED_FUNCTION_5_8(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_6_8(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

const char *sub_24639701C()
{
  return "SiriIdentity";
}

const char *sub_246397030(char a1)
{
  if ((a1 & 1) != 0)
    return "cross_device_switch_profile";
  else
    return "switch_profile";
}

BOOL sub_24639705C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_24639706C()
{
  return sub_2463C0984();
}

uint64_t sub_246397090()
{
  sub_2463C0978();
  sub_2463C0984();
  return sub_2463C0990();
}

BOOL sub_2463970D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24639705C(*a1, *a2);
}

uint64_t sub_2463970E0()
{
  return sub_246397090();
}

uint64_t sub_2463970E8()
{
  return sub_24639706C();
}

const char *sub_2463970F0()
{
  return sub_24639701C();
}

const char *sub_2463970F8()
{
  char *v0;

  return sub_246397030(*v0);
}

Swift::Bool __swiftcall IdentityFeatureFlagsProvider.isSwitchProfileEnabled()()
{
  return sub_246397150(0);
}

unint64_t sub_24639710C()
{
  unint64_t result;

  result = qword_25756FE50;
  if (!qword_25756FE50)
  {
    result = MEMORY[0x249559D74](&unk_2463C1EEC, &type metadata for IdentityFeatures);
    atomic_store(result, (unint64_t *)&qword_25756FE50);
  }
  return result;
}

Swift::Bool __swiftcall IdentityFeatureFlagsProvider.isCrossDeviceSwitchProfileEnabled()()
{
  return sub_246397150(1);
}

uint64_t sub_246397150(char a1)
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v5 = &type metadata for IdentityFeatures;
  v6 = sub_24639710C();
  v4[0] = a1;
  v2 = sub_2463C006C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2 & 1;
}

ValueMetadata *type metadata accessor for IdentityFeatureFlagsProvider()
{
  return &type metadata for IdentityFeatureFlagsProvider;
}

uint64_t getEnumTagSinglePayload for IdentityFeatures(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IdentityFeatures(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246397290 + 4 * byte_2463C1DF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2463972C4 + 4 * byte_2463C1DF0[v4]))();
}

uint64_t sub_2463972C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463972CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463972D4);
  return result;
}

uint64_t sub_2463972E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463972E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2463972EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463972F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_246397300(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IdentityFeatures()
{
  return &type metadata for IdentityFeatures;
}

unint64_t sub_246397320()
{
  unint64_t result;

  result = qword_25756FE58;
  if (!qword_25756FE58)
  {
    result = MEMORY[0x249559D74](&unk_2463C1EC4, &type metadata for IdentityFeatures);
    atomic_store(result, (unint64_t *)&qword_25756FE58);
  }
  return result;
}

id SwitchProfileIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_24639737C(uint64_t a1, void *a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _BYTE v21[24];
  uint64_t v22;
  uint64_t v23;

  v5 = type metadata accessor for UserAccount();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    v20 = v2;
    v23 = MEMORY[0x24BEE4AF8];
    sub_2463C0828();
    v10 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v19 = a2;
    v11 = (uint64_t)a2 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess;
    v12 = *(_QWORD *)(v6 + 72);
    do
    {
      sub_24639B980(v10, (uint64_t)v8, (void (*)(_QWORD))type metadata accessor for UserAccount);
      sub_24638C500(v11, (uint64_t)v21);
      v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v21, v22);
      MEMORY[0x24BDAC7A8](v13);
      (*(void (**)(char *))(v15 + 16))((char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      sub_246393474();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
      sub_2463C0810();
      sub_2463C0834();
      sub_2463C0840();
      sub_2463C081C();
      v10 += v12;
      --v9;
    }
    while (v9);
    v16 = v23;

  }
  else
  {

    return MEMORY[0x24BEE4AF8];
  }
  return v16;
}

uint64_t sub_246397538(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_2463C0828();
    v9 = *(_QWORD *)(type metadata accessor for UserAccount() - 8);
    v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = *(_QWORD *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4)
        break;
      v4 = 0;
      sub_2463C0810();
      sub_2463C0834();
      sub_2463C0840();
      sub_2463C081C();
      v10 += v11;
      if (!--v6)
        return v13;
    }
    return swift_release();
  }
  return result;
}

id SwitchProfileIntentHandler.init()()
{
  uint64_t *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  id v7;
  uint64_t v9[5];
  _BYTE v10[24];
  uint64_t v11;

  if (qword_25756EF70 != -1)
    swift_once();
  sub_24638C500((uint64_t)qword_2575745A0, (uint64_t)v10);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09230]), sel_init);
  type metadata accessor for AssistantServicesProvider();
  v2 = OUTLINED_FUNCTION_34();
  *(_QWORD *)(v2 + 16) = v1;
  sub_2463BFB8C();
  v3 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  MEMORY[0x24BDAC7A8](v3);
  v5 = OUTLINED_FUNCTION_48_0(v4, v9[0]);
  v6(v5);
  v7 = sub_24639B718(*v0, v2, (uint64_t)v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

id static SwitchProfileIntentHandler.handlerForIntentExtension()()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler()), sel_init);
}

uint64_t SwitchProfileIntentHandler.resolveAccount(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[17] = a1;
  v2[18] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FE68);
  v2[19] = OUTLINED_FUNCTION_3_4();
  v3 = OUTLINED_FUNCTION_71();
  v2[20] = v3;
  v2[21] = *(_QWORD *)(v3 - 8);
  v2[22] = OUTLINED_FUNCTION_3_4();
  v4 = OUTLINED_FUNCTION_7_2();
  v2[23] = v4;
  v2[24] = *(_QWORD *)(v4 - 8);
  v2[25] = OUTLINED_FUNCTION_3_9();
  v2[26] = OUTLINED_FUNCTION_11_1();
  v2[27] = OUTLINED_FUNCTION_11_1();
  v2[28] = OUTLINED_FUNCTION_102();
  v2[29] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246397838()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v12;
  _WORD *v13;
  uint8_t *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _WORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(void);
  _QWORD *v32;

  OUTLINED_FUNCTION_36_2();
  if (qword_25756EF48 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 232);
  v4 = (id)qword_25756F958;
  OUTLINED_FUNCTION_61();
  sub_2463C0750();
  OUTLINED_FUNCTION_41_0();
  v5 = *(int *)(v3 + 20);
  *(_DWORD *)(v0 + 328) = v5;
  v6 = v2 + v5;
  *(_QWORD *)v6 = "SwitchProfileIntentResolve";
  *(_QWORD *)(v6 + 8) = 26;
  *(_WORD *)(v6 + 16) = v1;
  if (qword_25756EFC8 != -1)
    swift_once();
  v7 = *(NSObject **)(v0 + 216);
  v8 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  v10 = __swift_project_value_buffer(v8, (uint64_t)qword_257574610);
  *(_QWORD *)(v0 + 240) = v10;
  v11 = *(void (**)(NSObject *, uint64_t, uint64_t))(v9 + 16);
  *(_QWORD *)(v0 + 248) = v11;
  v11(v7, v10, v8);
  sub_2463C05A0();
  v12 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_3_3(v12))
  {
    v13 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_59_0(v13);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v7, (os_log_type_t)v8, "SwitchProfileIntentHandler.resolveAccount", (uint8_t *)v9);
    OUTLINED_FUNCTION_0();
  }
  v14 = *(uint8_t **)(v0 + 184);
  v15 = *(_QWORD *)(v0 + 192);
  v16 = *(void **)(v0 + 136);

  v17 = *(void (**)(uint64_t))(v15 + 8);
  *(_QWORD *)(v0 + 256) = v17;
  v18 = OUTLINED_FUNCTION_105();
  v17(v18);
  v19 = objc_msgSend(v16, sel_account);
  if (!v19)
    goto LABEL_13;
  v20 = v19;
  sub_24639B5E4(v19, (SEL *)&selRef_profileId);
  v22 = v21;
  swift_bridgeObjectRelease();
  if (!v22)
  {

LABEL_13:
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 144)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_assistantServices), *(_QWORD *)(*(_QWORD *)(v0 + 144)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_assistantServices+ 24));
    v32 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v32;
    *v32 = v0;
    v32[1] = sub_246397AFC;
    return sub_246383EF8();
  }
  v11(*(NSObject **)(v0 + 208), v10, *(_QWORD *)(v0 + 184));
  v23 = sub_2463C05A0();
  v24 = sub_2463C0714();
  if (OUTLINED_FUNCTION_22(v24))
  {
    v25 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_59_0(v25);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v23, (os_log_type_t)v10, "Intent has account with profileId, returning success", v14);
    OUTLINED_FUNCTION_0();
  }
  v26 = *(_QWORD *)(v0 + 208);
  v27 = *(_QWORD *)(v0 + 184);

  ((void (*)(uint64_t, uint64_t))v17)(v26, v27);
  OUTLINED_FUNCTION_17_3();
  static AccountResolutionResult.success(with:)();
  OUTLINED_FUNCTION_100();
  sub_2463C0744();
  sub_2463C057C();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_44_0(v28, (uint64_t (*)(_QWORD))type metadata accessor for Signpost.OpenSignpost);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  v29 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_6_9(v29, v30);
}

uint64_t sub_246397AFC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_32_3();
  *(_QWORD *)(v1 + 272) = v0;
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246397B38()
{
  uint64_t v0;
  uint8_t *v1;
  id v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  os_log_type_t v8;
  _WORD *v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v1 = *(uint8_t **)(v0 + 272);
  OUTLINED_FUNCTION_95(*(_QWORD *)(v0 + 144) + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess);
  sub_246391714();
  if (!*(_QWORD *)(*(_QWORD *)(v0 + 56) + 16))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 248))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 184));
    v7 = sub_2463C05A0();
    v8 = sub_2463C072C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (_WORD *)OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_60(v9);
      OUTLINED_FUNCTION_4_3(&dword_246381000, v7, v8, "No accounts found.", v1);
      OUTLINED_FUNCTION_0();
    }
    v10 = *(void (**)(uint64_t, uint64_t))(v0 + 256);
    v11 = *(_QWORD *)(v0 + 200);
    v13 = *(_QWORD *)(v0 + 176);
    v12 = *(_QWORD *)(v0 + 184);
    v14 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 144);
    v30 = *(_QWORD *)(v0 + 152);
    v28 = *(_QWORD *)(v0 + 160);
    v29 = *(id *)(v0 + 136);

    v10(v11, v12);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v15 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender), *(_QWORD *)(v15 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender + 24));
    OUTLINED_FUNCTION_72();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x24BE977E0], v28);
    v16 = objc_msgSend(v29, sel_typeName);
    sub_2463C0618();

    v17 = OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_29(v30, v18, v19, v17);
    sub_2463BFC28();
    sub_2463BFB98();
    swift_release();
    OUTLINED_FUNCTION_17_3();
    static SwitchProfileAccountResolutionResult.unsupported(forReason:)();
    sub_24639B87C(v0 + 16);
    sub_2463C0744();
    OUTLINED_FUNCTION_81();
    sub_2463C057C();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_44_0(v20, (uint64_t (*)(_QWORD))type metadata accessor for Signpost.OpenSignpost);
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_24_2();
    OUTLINED_FUNCTION_29_3();
    OUTLINED_FUNCTION_14_5();
    OUTLINED_FUNCTION_27_3();
    __asm { BR              X1 }
  }
  v2 = objc_msgSend(*(id *)(v0 + 136), sel_switchType);
  if (v2 == (id)2)
  {
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 296) = v22;
    OUTLINED_FUNCTION_63(v22, (uint64_t)sub_246397F34);
    OUTLINED_FUNCTION_27_3();
    return sub_246399E10(v23, v24);
  }
  else if (v2 == (id)1)
  {
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v25;
    OUTLINED_FUNCTION_63(v25, (uint64_t)sub_246397FE8);
    OUTLINED_FUNCTION_27_3();
    return sub_246398AD8(v26, v27);
  }
  else if (v2)
  {
    *(_QWORD *)(v0 + 128) = v2;
    OUTLINED_FUNCTION_27_3();
    return sub_2463C0924();
  }
  else
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v3;
    *v3 = v0;
    v3[1] = sub_246397E80;
    OUTLINED_FUNCTION_27_3();
    return sub_24639A8B0(v4, v5);
  }
}

uint64_t sub_246397E80()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_32_3();
  *(_QWORD *)(v1 + 288) = v0;
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246397EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_28_3();
  sub_2463C0744();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_44_0(v0, (uint64_t (*)(_QWORD))type metadata accessor for Signpost.OpenSignpost);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  v1 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_9_4(v1, v2);
}

uint64_t sub_246397F34()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_32_3();
  *(_QWORD *)(v1 + 304) = v0;
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246397F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_28_3();
  sub_2463C0744();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_44_0(v0, (uint64_t (*)(_QWORD))type metadata accessor for Signpost.OpenSignpost);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  v1 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_9_4(v1, v2);
}

uint64_t sub_246397FE8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_32_3();
  *(_QWORD *)(v1 + 320) = v0;
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246398024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_28_3();
  sub_2463C0744();
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_44_0(v0, (uint64_t (*)(_QWORD))type metadata accessor for Signpost.OpenSignpost);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  v1 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_9_4(v1, v2);
}

uint64_t sub_24639809C()
{
  sub_246396B14(4, 3, 2, 2);
  return sub_2463BFC1C();
}

uint64_t sub_246398100(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_24639817C;
  return SwitchProfileIntentHandler.resolveAccount(for:)((uint64_t)v6);
}

uint64_t sub_24639817C(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  const void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t);

  OUTLINED_FUNCTION_26();
  v4 = (const void *)v3[4];
  v6 = (void *)v3[2];
  v5 = (void *)v3[3];
  OUTLINED_FUNCTION_1_4();

  v7 = OUTLINED_FUNCTION_87();
  v8(v7);
  _Block_release(v4);

  return OUTLINED_FUNCTION_1_6(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t SwitchProfileIntentHandler.confirm(intent:)()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_7_2();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_3_4();
  v0[5] = OUTLINED_FUNCTION_102();
  v0[6] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246398230()
{
  _QWORD *v0;
  __int16 v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t (*v17)(void);

  if (qword_25756EF48 != -1)
    swift_once();
  v3 = v0[5];
  v2 = v0[6];
  v4 = (id)qword_25756F958;
  OUTLINED_FUNCTION_61();
  sub_2463C0750();
  v5 = OUTLINED_FUNCTION_41_0();
  v6 = v2 + *(int *)(v3 + 20);
  *(_QWORD *)v6 = "SwitchProfileIntentConfirm";
  *(_QWORD *)(v6 + 8) = 26;
  *(_WORD *)(v6 + 16) = v1;
  if (qword_25756EFC8 != -1)
    v5 = swift_once();
  v7 = (void *)v0[4];
  OUTLINED_FUNCTION_25_2(v5, (uint64_t)qword_257574610);
  sub_2463C05A0();
  v8 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v8))
  {
    v9 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_60(v9);
    OUTLINED_FUNCTION_10_5(&dword_246381000, v10, v11, "SwitchProfileIntentHandler.confirm");
    OUTLINED_FUNCTION_0();
  }
  v12 = v0[6];

  v13 = OUTLINED_FUNCTION_86();
  v14(v13);
  v15 = objc_allocWithZone((Class)OUTLINED_FUNCTION_70());
  OUTLINED_FUNCTION_64(1);
  sub_2463C0744();
  sub_2463C057C();
  sub_24639B9BC(v12, (uint64_t (*)(_QWORD))type metadata accessor for Signpost.OpenSignpost);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14_2();
  v16 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_15_3(v16, v17);
}

uint64_t sub_2463983C8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_24639C9F0;
  return SwitchProfileIntentHandler.confirm(intent:)();
}

uint64_t SwitchProfileIntentHandler.handle(intent:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[4] = a1;
  v2 = OUTLINED_FUNCTION_7_2();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = OUTLINED_FUNCTION_3_9();
  v1[8] = OUTLINED_FUNCTION_11_1();
  v1[9] = OUTLINED_FUNCTION_11_1();
  v1[10] = OUTLINED_FUNCTION_11_1();
  v1[11] = OUTLINED_FUNCTION_102();
  v1[12] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463984A8()
{
  uint64_t v0;
  void (*v1)(NSObject *, const char *, uint64_t);
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t *v9;
  os_log_type_t v10;
  _WORD *v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  NSObject *v40;
  uint64_t *v41;
  os_log_type_t v42;
  const char *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;

  if (qword_25756EF48 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = (id)qword_25756F958;
  OUTLINED_FUNCTION_61();
  sub_2463C0750();
  v5 = OUTLINED_FUNCTION_53();
  v6 = v2 + *(int *)(v3 + 20);
  *(_QWORD *)v6 = "SwitchProfileIntentHandle";
  *(_QWORD *)(v6 + 8) = 25;
  *(_WORD *)(v6 + 16) = 2;
  if (qword_25756EFC8 != -1)
    v5 = swift_once();
  v7 = *(NSObject **)(v0 + 80);
  v8 = *(_QWORD *)(v0 + 40);
  v9 = *(uint8_t **)(v0 + 48);
  OUTLINED_FUNCTION_43_0(v5, (uint64_t)qword_257574610);
  sub_2463C05A0();
  v10 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v10))
  {
    v11 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_59_0(v11);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v7, (os_log_type_t)v8, "SwitchProfileIntentHandler.handle()", v9);
    OUTLINED_FUNCTION_0();
  }
  v12 = (id *)(v0 + 32);
  v13 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD *)(v0 + 40);
  v15 = *(_QWORD *)(v0 + 48);

  v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  v17 = v16(v13, v14);
  v18 = OUTLINED_FUNCTION_94(v17, sel_account);
  if (!v18)
  {
LABEL_14:
    v39 = objc_msgSend(*v12, sel_switchType);
    if (v39)
    {
      if (v39 == (id)2)
      {
        v41 = (uint64_t *)(v0 + 56);
        v40 = *(NSObject **)(v0 + 56);
        OUTLINED_FUNCTION_62();
        sub_2463C05A0();
        v44 = OUTLINED_FUNCTION_14_1();
        if (OUTLINED_FUNCTION_74(v44))
        {
          v43 = "Name not matched";
LABEL_21:
          v45 = (uint8_t *)OUTLINED_FUNCTION_5();
          *(_WORD *)v45 = 0;
          OUTLINED_FUNCTION_4_3(&dword_246381000, v40, (os_log_type_t)v12, v43, v45);
          OUTLINED_FUNCTION_0();
        }
      }
      else
      {
        if (v39 != (id)1)
        {
          *(_QWORD *)(v0 + 16) = v39;
          return sub_2463C0924();
        }
        v41 = (uint64_t *)(v0 + 64);
        v40 = *(NSObject **)(v0 + 64);
        OUTLINED_FUNCTION_62();
        sub_2463C05A0();
        v42 = OUTLINED_FUNCTION_14_1();
        if (OUTLINED_FUNCTION_74(v42))
        {
          v43 = "ID not resolved";
          goto LABEL_21;
        }
      }
      v47 = *v41;
      v48 = *(_QWORD *)(v0 + 40);

      v16(v47, v48);
    }
    v49 = objc_allocWithZone((Class)OUTLINED_FUNCTION_70());
    OUTLINED_FUNCTION_64(100);
    goto LABEL_28;
  }
  v19 = v18;
  v20 = sub_24639B5E4(v18, (SEL *)&selRef_profileId);
  if (!v21)
  {

    goto LABEL_14;
  }
  v53 = (void (*)(uint64_t, uint64_t))v16;
  v22 = OUTLINED_FUNCTION_94(v20, sel_isActive);
  sub_24639B8B0();
  v23 = (void *)sub_2463C075C();
  v24 = v23;
  if (v22)
  {
    v25 = v22;
    v26 = sub_2463C0768();

    if ((v26 & 1) != 0)
    {
      v27 = *(NSObject **)(v0 + 72);
      v28 = *(_QWORD *)(v0 + 40);
      OUTLINED_FUNCTION_7_5();
      v1(v27, "SwitchProfileIntentHandle", v28);
      v29 = v19;
      sub_2463C05A0();
      v30 = OUTLINED_FUNCTION_16_0();
      v31 = os_log_type_enabled(v27, v30);
      v32 = *(_QWORD *)(v0 + 72);
      v33 = *(_QWORD *)(v0 + 40);
      if (v31)
      {
        v34 = (uint8_t *)OUTLINED_FUNCTION_5();
        v54 = OUTLINED_FUNCTION_5();
        *(_DWORD *)v34 = 136315138;
        v35 = objc_msgSend(v29, sel_displayString);
        v36 = sub_2463C0618();
        v38 = v37;

        *(_QWORD *)(v0 + 24) = sub_24639AE68(v36, v38, &v54);
        sub_2463C078C();
        swift_bridgeObjectRelease();

        OUTLINED_FUNCTION_13_2(&dword_246381000, v27, v30, "Account is already active for name[%s]", v34);
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_0();
      }

      v53(v32, v33);
      objc_allocWithZone((Class)OUTLINED_FUNCTION_70());
      OUTLINED_FUNCTION_64(101);
      OUTLINED_FUNCTION_100();
      goto LABEL_28;
    }
  }
  else
  {

  }
  OUTLINED_FUNCTION_7_5();
  objc_allocWithZone((Class)OUTLINED_FUNCTION_70());
  OUTLINED_FUNCTION_64(5);
  OUTLINED_FUNCTION_99();
LABEL_28:
  sub_2463C0744();
  v50 = sub_2463C057C();
  OUTLINED_FUNCTION_44_0(v50, (uint64_t (*)(_QWORD))type metadata accessor for Signpost.OpenSignpost);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  v51 = OUTLINED_FUNCTION_14_5();
  return v52(v51);
}

uint64_t sub_2463989F8(void *a1, int a2, void *a3, void *aBlock)
{
  void *v6;
  _QWORD *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v6 = _Block_copy(aBlock);
  v7 = (_QWORD *)OUTLINED_FUNCTION_34();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;
  v9 = a1;
  v10 = OUTLINED_FUNCTION_87();
  return sub_2463B6700(v10, v11);
}

uint64_t sub_246398A60(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_24639C9F0;
  return SwitchProfileIntentHandler.handle(intent:)((uint64_t)v6);
}

uint64_t sub_246398AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = OUTLINED_FUNCTION_7_2();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = OUTLINED_FUNCTION_3_9();
  v3[8] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246398B28()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  void *v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  NSObject *v33;
  os_log_type_t v34;
  _WORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;

  if (qword_25756EFC8 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_257574610);
  v5 = *(void (**)(NSObject *, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  sub_2463C05A0();
  v6 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_3_3(v6))
  {
    v7 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_59_0(v7);
    OUTLINED_FUNCTION_4_3(&dword_246381000, v1, (os_log_type_t)v2, "Switch by voice ID", (uint8_t *)v3);
    OUTLINED_FUNCTION_0();
  }
  v8 = *(_QWORD *)(v0 + 48);
  v9 = *(void **)(v0 + 16);

  v10 = *(void (**)(uint64_t))(v8 + 8);
  v11 = OUTLINED_FUNCTION_105();
  v10(v11);
  v12 = sub_24639B5E4(v9, (SEL *)&selRef_iCloudAltDSID);
  if (v13)
  {
    v14 = v12;
    v15 = v13;
    v16 = *(_QWORD *)(v0 + 24);
    v17 = objc_msgSend(*(id *)(v0 + 16), sel_typeName);
    v18 = sub_2463C0618();
    v20 = v19;

    sub_246398E90(v14, v15, v18, v20, v16);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_104();
    swift_task_dealloc();
    OUTLINED_FUNCTION_14_2();
    v21 = OUTLINED_FUNCTION_14_5();
    return OUTLINED_FUNCTION_15_3(v21, v22);
  }
  else
  {
    v24 = sub_24639B5E4(*(void **)(v0 + 16), (SEL *)&selRef_homeUserId);
    *(_QWORD *)(v0 + 72) = v25;
    if (v25)
    {
      v26 = v24;
      v27 = v25;
      v28 = objc_msgSend(*(id *)(v0 + 16), sel_typeName);
      v29 = sub_2463C0618();
      v31 = v30;

      *(_QWORD *)(v0 + 80) = v31;
      v32 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v32;
      *v32 = v0;
      v32[1] = sub_246398DE4;
      return sub_24639957C(v26, v27, v29, v31);
    }
    else
    {
      v33 = *(NSObject **)(v0 + 56);
      v5(v33, v4, *(_QWORD *)(v0 + 40));
      sub_2463C05A0();
      v34 = OUTLINED_FUNCTION_14_1();
      if (OUTLINED_FUNCTION_22(v34))
      {
        v35 = (_WORD *)OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_60(v35);
        OUTLINED_FUNCTION_10_5(&dword_246381000, v36, v37, "No UserID in switch by VoiceID");
        OUTLINED_FUNCTION_0();
      }

      v38 = OUTLINED_FUNCTION_18();
      v10(v38);
      v39 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 96) = v39;
      *v39 = v0;
      v39[1] = sub_246398E44;
      return sub_246399BC0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 0);
    }
  }
}

uint64_t sub_246398DE4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v4 = *v0;
  OUTLINED_FUNCTION_51_0(&v4);
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_10();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  v1 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_15_3(v1, v2);
}

uint64_t sub_246398E44()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  v4 = *v0;
  OUTLINED_FUNCTION_51_0(&v4);
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  v1 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_15_3(v1, v2);
}

id sub_246398E90(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
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
  char *v55;
  void (*v56)(char *);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61[3];
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
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
  unint64_t v77;
  unint64_t v78;
  _BYTE v79[40];
  uint64_t v80;
  uint64_t v81[4];

  v7 = v5;
  v74 = a5;
  v71 = a4;
  v70 = a3;
  v75 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FE68);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_47_0();
  v69 = v10;
  v67 = OUTLINED_FUNCTION_71();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_47_0();
  v68 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC0);
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_47_0();
  v73 = v13;
  v76 = OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_21_0();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v64 = (uint64_t)v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v65 = (uint64_t)v61 - v17;
  v18 = OUTLINED_FUNCTION_7_2();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v61 - v23;
  if (qword_25756EFC8 != -1)
    swift_once();
  v72 = v22;
  v25 = __swift_project_value_buffer(v18, (uint64_t)qword_257574610);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v62 = v25;
  v63 = v26;
  ((void (*)(char *))v26)(v24);
  OUTLINED_FUNCTION_46();
  v27 = sub_2463C05A0();
  v28 = sub_2463C0720();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = OUTLINED_FUNCTION_5();
    v61[2] = v7;
    v30 = (uint8_t *)v29;
    v31 = OUTLINED_FUNCTION_5();
    v61[1] = v18;
    v81[0] = v31;
    *(_DWORD *)v30 = 136315138;
    OUTLINED_FUNCTION_26_1();
    v32 = sub_24639AE68(v75, a2, v81);
    OUTLINED_FUNCTION_46_0(v32);
    OUTLINED_FUNCTION_89();
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_13_2(&dword_246381000, v27, v28, "Switch by iCloudAltDSID=%s", v30);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_67();
  v33 = v75;
  v34 = a2;
  v35 = v74;
  v36 = *(_QWORD *)(v74 + 64);
  v37 = sub_2463C0630();
  v38 = v73;
  sub_2463BABB0(v37, v39, v36, v73);
  OUTLINED_FUNCTION_3_6();
  if (__swift_getEnumTagSinglePayload(v38, 1, v76) == 1)
  {
    sub_24639B8EC(v38);
    v40 = v72;
    v63(v72, v62, v18);
    sub_24639B9F4(v35, (uint64_t)v81);
    OUTLINED_FUNCTION_46();
    v41 = v18;
    v42 = sub_2463C05A0();
    v43 = sub_2463C0720();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = OUTLINED_FUNCTION_5();
      v80 = OUTLINED_FUNCTION_5();
      *(_DWORD *)v44 = 136315394;
      OUTLINED_FUNCTION_59();
      v45 = sub_24639AE68(v33, v34, &v80);
      OUTLINED_FUNCTION_46_0(v45);
      sub_2463C078C();
      OUTLINED_FUNCTION_19_0();
      *(_WORD *)(v44 + 12) = 2080;
      sub_24639B9F4((uint64_t)v81, (uint64_t)v79);
      v77 = 0;
      v78 = 0xE000000000000000;
      sub_2463C07E0();
      swift_bridgeObjectRelease();
      v77 = 0xD000000000000014;
      v78 = 0x80000002463C46B0;
      v46 = OUTLINED_FUNCTION_59();
      MEMORY[0x2495596C0](v46, v76);
      sub_2463C0654();
      OUTLINED_FUNCTION_104();
      OUTLINED_FUNCTION_82();
      sub_2463C0654();
      v47 = v77;
      sub_24639B87C((uint64_t)v79);
      v49 = OUTLINED_FUNCTION_84(v47, v48, &v80);
      OUTLINED_FUNCTION_46_0(v49);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      sub_24639B87C((uint64_t)v81);
      _os_log_impl(&dword_246381000, v42, v43, "No account found for iCloudAltDSID=%s in %s", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_1_0();
    sub_24639B87C((uint64_t)v81);

    v6(v40, v41);
    OUTLINED_FUNCTION_103((_QWORD *)(v7
                                   + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender));
    OUTLINED_FUNCTION_72();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v66 + 104))(v68, *MEMORY[0x24BE977E0], v67);
    v57 = OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_29(v69, v58, v59, v57);
    OUTLINED_FUNCTION_49();
    sub_2463BFC28();
    OUTLINED_FUNCTION_96();
    swift_release();
    OUTLINED_FUNCTION_17_3();
    return OUTLINED_FUNCTION_101();
  }
  else
  {
    v50 = v38;
    v51 = v65;
    sub_246393724(v50, v65);
    v52 = OUTLINED_FUNCTION_17_3();
    sub_24639B980(v51, v64, (void (*)(_QWORD))type metadata accessor for UserAccount);
    sub_24638C500(v7 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess, (uint64_t)v81);
    v53 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v81, v81[3]);
    MEMORY[0x24BDAC7A8](v53);
    v55 = OUTLINED_FUNCTION_48_0(v54, v61[0]);
    v56(v55);
    OUTLINED_FUNCTION_75();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
    static AccountResolutionResult.success(with:)();
    OUTLINED_FUNCTION_100();
    sub_24639B9BC(v51, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
  }
  return (id)v52;
}

uint64_t sub_24639957C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[12] = a4;
  v5[13] = v4;
  v5[10] = a2;
  v5[11] = a3;
  v5[9] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FE68);
  v5[14] = OUTLINED_FUNCTION_3_4();
  v6 = OUTLINED_FUNCTION_71();
  v5[15] = v6;
  v5[16] = *(_QWORD *)(v6 - 8);
  v5[17] = OUTLINED_FUNCTION_3_4();
  v5[18] = OUTLINED_FUNCTION_9_3();
  v5[19] = OUTLINED_FUNCTION_3_9();
  v5[20] = OUTLINED_FUNCTION_11_1();
  type metadata accessor for PineBoardAccountLookupResult();
  v5[21] = OUTLINED_FUNCTION_3_9();
  v5[22] = OUTLINED_FUNCTION_11_1();
  v7 = OUTLINED_FUNCTION_7_2();
  v5[23] = v7;
  v5[24] = *(_QWORD *)(v7 - 8);
  v5[25] = OUTLINED_FUNCTION_3_9();
  v5[26] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246399638()
{
  _QWORD *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  if (qword_25756EFC8 != -1)
    swift_once();
  v1 = v0[26];
  v2 = v0[23];
  v3 = v0[24];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_257574610);
  v0[27] = v4;
  v5 = *(void (**)(NSObject *, uint64_t, uint64_t))(v3 + 16);
  v0[28] = v5;
  v5(v1, v4, v2);
  OUTLINED_FUNCTION_46();
  sub_2463C05A0();
  v6 = OUTLINED_FUNCTION_14_1();
  v7 = OUTLINED_FUNCTION_35_1(v6);
  v8 = v0[24];
  if (v7)
  {
    v9 = v0[9];
    v10 = (uint8_t *)OUTLINED_FUNCTION_5();
    v16 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v10 = 136315138;
    OUTLINED_FUNCTION_83();
    v0[8] = OUTLINED_FUNCTION_84(v9, v11, &v16);
    sub_2463C078C();
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_13_2(&dword_246381000, v1, (os_log_type_t)v3, "Switch by HomeUserID=%s", v10);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_1_0();

  v12 = *(void (**)(uint64_t))(v8 + 8);
  v13 = OUTLINED_FUNCTION_18();
  v12(v13);
  v0[29] = v12;
  v14 = (_QWORD *)swift_task_alloc();
  v0[30] = v14;
  *v14 = v0;
  v14[1] = sub_24639981C;
  return sub_24639AC58(v0[22]);
}

uint64_t sub_24639981C()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246399850()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v29;

  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 144);
  sub_24639B980(*(_QWORD *)(v0 + 176), v2, (void (*)(_QWORD))type metadata accessor for PineBoardAccountLookupResult);
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) == 1)
  {
    v4 = *(NSObject **)(v0 + 200);
    (*(void (**)(NSObject *, _QWORD, _QWORD))(v0 + 224))(v4, *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 184));
    OUTLINED_FUNCTION_46();
    sub_2463C05A0();
    v5 = OUTLINED_FUNCTION_16_0();
    v6 = OUTLINED_FUNCTION_35_1(v5);
    v7 = *(void (**)(uint64_t, uint64_t))(v0 + 232);
    v8 = *(_QWORD *)(v0 + 200);
    v9 = *(_QWORD *)(v0 + 184);
    if (v6)
    {
      v10 = *(_QWORD *)(v0 + 72);
      v11 = (uint8_t *)OUTLINED_FUNCTION_5();
      v29 = OUTLINED_FUNCTION_5();
      *(_DWORD *)v11 = 136315138;
      OUTLINED_FUNCTION_83();
      *(_QWORD *)(v0 + 56) = OUTLINED_FUNCTION_84(v10, v12, &v29);
      sub_2463C078C();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v4, v1, "No account for homeUserID=%s", v11);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_1_0();

    v7(v8, v9);
    v20 = *(_QWORD *)(v0 + 128);
    v19 = *(_QWORD *)(v0 + 136);
    v22 = *(_QWORD *)(v0 + 112);
    v21 = *(_QWORD *)(v0 + 120);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 104)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender), *(_QWORD *)(*(_QWORD *)(v0 + 104)+ OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender+ 24));
    OUTLINED_FUNCTION_72();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v20 + 104))(v19, *MEMORY[0x24BE977E0], v21);
    v23 = OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_29(v22, v24, v25, v23);
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_85();
    sub_2463BFB98();
    swift_release();
    OUTLINED_FUNCTION_17_3();
    OUTLINED_FUNCTION_101();
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 104);
    sub_246393724(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 160));
    OUTLINED_FUNCTION_17_3();
    v14 = OUTLINED_FUNCTION_86();
    sub_24639B980(v14, v15, (void (*)(_QWORD))type metadata accessor for UserAccount);
    OUTLINED_FUNCTION_95(v13 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess);
    OUTLINED_FUNCTION_65();
    v16 = OUTLINED_FUNCTION_4_10();
    OUTLINED_FUNCTION_58(v16);
    OUTLINED_FUNCTION_75();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_99();
    v17 = OUTLINED_FUNCTION_18();
    sub_24639B9BC(v17, v18);
  }
  sub_24639B9BC(*(_QWORD *)(v0 + 176), (uint64_t (*)(_QWORD))type metadata accessor for PineBoardAccountLookupResult);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_48();
  v26 = OUTLINED_FUNCTION_14_5();
  return v27(v26);
}

uint64_t sub_246399B6C()
{
  sub_246396B14(4, 3, 2, 4);
  return sub_2463BFC1C();
}

uint64_t sub_246399BC0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 64) = a3;
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  v4 = OUTLINED_FUNCTION_7_2();
  *(_QWORD *)(v3 + 40) = v4;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 56) = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246399C08(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 40) + 16) == 1)
  {
    if (qword_25756EFC8 != -1)
      a1 = swift_once();
    v2 = *(void **)(v1 + 56);
    OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_257574610);
    sub_2463C05A0();
    v3 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_22(v3))
    {
      v4 = (_WORD *)OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_60(v4);
      OUTLINED_FUNCTION_10_5(&dword_246381000, v5, v6, "Only one account, cannot switch.");
      OUTLINED_FUNCTION_0();
    }
    v7 = *(_QWORD *)(v1 + 48);

    v8 = OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    OUTLINED_FUNCTION_94(v8, sel_switchType);
    OUTLINED_FUNCTION_17_3();
    static SwitchProfileAccountResolutionResult.unsupported(forReason:)();
    goto LABEL_16;
  }
  v9 = swift_task_alloc();
  OUTLINED_FUNCTION_91(v9);
  v10 = OUTLINED_FUNCTION_77((void (*)(uint64_t *__return_ptr, uint64_t))sub_24639B92C, v9);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_50();
  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_9;
LABEL_15:
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_17_3();
    static AccountResolutionResult.disambiguation(with:)(v10);
    OUTLINED_FUNCTION_10();
LABEL_16:
    swift_task_dealloc();
    v16 = OUTLINED_FUNCTION_14_5();
    return v17(v16);
  }
  swift_bridgeObjectRetain();
  result = sub_2463C08B8();
  v11 = result;
  if (!result)
    goto LABEL_15;
LABEL_9:
  if (v11 >= 1)
  {
    for (i = 0; i != v11; ++i)
    {
      if ((v10 & 0xC000000000000001) != 0)
        v14 = (id)MEMORY[0x249559828](i, v10);
      else
        v14 = *(id *)(v10 + 8 * i + 32);
      v15 = v14;
      objc_msgSend(v14, sel_setNoNameMatched_, *(unsigned __int8 *)(v1 + 64));

    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_246399E10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  v3[15] = OUTLINED_FUNCTION_9_3();
  v3[16] = OUTLINED_FUNCTION_3_9();
  v3[17] = OUTLINED_FUNCTION_11_1();
  v3[18] = type metadata accessor for UserAccountManager.LookupResult();
  v3[19] = OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FE68);
  v3[20] = OUTLINED_FUNCTION_3_4();
  v4 = OUTLINED_FUNCTION_71();
  v3[21] = v4;
  v3[22] = *(_QWORD *)(v4 - 8);
  v3[23] = OUTLINED_FUNCTION_3_4();
  v5 = OUTLINED_FUNCTION_7_2();
  v3[24] = v5;
  v3[25] = *(_QWORD *)(v5 - 8);
  v3[26] = OUTLINED_FUNCTION_3_9();
  v3[27] = OUTLINED_FUNCTION_11_1();
  v3[28] = OUTLINED_FUNCTION_11_1();
  v3[29] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_246399ED4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  void *v13;
  os_log_type_t v14;
  _WORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t EnumCaseMultiPayload;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  NSObject *v38;
  uint64_t v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
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
  void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, _QWORD, uint64_t);
  void (*v72)(uint64_t, _QWORD, uint64_t);
  uint64_t v73;
  _QWORD *v74;
  void (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  void (*v77)(uint64_t);
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83[2];

  v1 = sub_24639B5E4(*(void **)(v0 + 96), (SEL *)&selRef_name);
  if (v2)
  {
    v3 = v2;
    v82 = v1;
    if (qword_25756EFC8 != -1)
      swift_once();
    v4 = *(NSObject **)(v0 + 232);
    v6 = *(_QWORD *)(v0 + 192);
    v5 = *(_QWORD *)(v0 + 200);
    v78 = __swift_project_value_buffer(v6, (uint64_t)qword_257574610);
    v79 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
    ((void (*))v79)(v4);
    OUTLINED_FUNCTION_46();
    sub_2463C05A0();
    v7 = OUTLINED_FUNCTION_14_1();
    v8 = OUTLINED_FUNCTION_3_3(v7);
    v9 = *(_QWORD *)(v0 + 232);
    v11 = *(_QWORD *)(v0 + 192);
    v10 = *(_QWORD *)(v0 + 200);
    if (v8)
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_5();
      v83[0] = OUTLINED_FUNCTION_5();
      *(_DWORD *)v12 = 136315138;
      OUTLINED_FUNCTION_49();
      *(_QWORD *)(v0 + 88) = sub_24639AE68(v82, v3, v83);
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v4, (os_log_type_t)v6, "Switch-by-name for %s", v12);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_1_0();

    v75 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v75(v9, v11);
    v23 = *(_QWORD *)(v0 + 176);
    v24 = *(_QWORD *)(v0 + 184);
    v25 = *(_QWORD *)(v0 + 160);
    v26 = *(_QWORD *)(v0 + 168);
    v27 = *(_QWORD *)(v0 + 112);
    v28 = *(void **)(v0 + 96);
    v80 = sub_246392930();
    v73 = v27 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v27 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender), *(_QWORD *)(v27 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender + 24));
    OUTLINED_FUNCTION_72();
    v71 = *(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104);
    v71(v24, *MEMORY[0x24BE97860], v26);
    v29 = objc_msgSend(v28, sel_typeName);
    sub_2463C0618();

    v69 = OUTLINED_FUNCTION_73();
    __swift_storeEnumTagSinglePayload(v25, 1, 1, v69);
    *(_BYTE *)(OUTLINED_FUNCTION_34() + 16) = v80;
    sub_2463BFC28();
    sub_2463BFB98();
    swift_release();
    sub_2463929CC();
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v37 = v3;
    if (!(_DWORD)EnumCaseMultiPayload)
    {
      v46 = *(_QWORD *)(v0 + 136);
      v47 = *(_QWORD *)(v0 + 112);
      OUTLINED_FUNCTION_7_5();
      v48 = OUTLINED_FUNCTION_18();
      sub_246393724(v48, v49);
      OUTLINED_FUNCTION_17_3();
      v50 = OUTLINED_FUNCTION_105();
      sub_24639B980(v50, v51, (void (*)(_QWORD))type metadata accessor for UserAccount);
      OUTLINED_FUNCTION_95(v47 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess);
      OUTLINED_FUNCTION_65();
      v52 = OUTLINED_FUNCTION_4_10();
      OUTLINED_FUNCTION_58(v52);
      OUTLINED_FUNCTION_75();
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      OUTLINED_FUNCTION_51();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_99();
      sub_24639B9BC(v46, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
LABEL_19:
      OUTLINED_FUNCTION_42_0();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_24_2();
      OUTLINED_FUNCTION_29_3();
      OUTLINED_FUNCTION_51();
      OUTLINED_FUNCTION_48();
      v59 = OUTLINED_FUNCTION_14_5();
      return v60(v59);
    }
    if ((_DWORD)EnumCaseMultiPayload == 1)
    {
      v38 = *(NSObject **)(v0 + 224);
      v39 = **(_QWORD **)(v0 + 152);
      OUTLINED_FUNCTION_107(EnumCaseMultiPayload, v31, *(_QWORD *)(v0 + 192), v32, v33, v34, v35, v36, v69, (uint64_t)v71, v73, (uint64_t)v75, v78, v79);
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_26_1();
      sub_2463C05A0();
      v40 = OUTLINED_FUNCTION_16_0();
      if (OUTLINED_FUNCTION_35_1(v40))
      {
        v81 = *(_QWORD *)(v0 + 120);
        v41 = OUTLINED_FUNCTION_5();
        v83[0] = OUTLINED_FUNCTION_5();
        *(_DWORD *)v41 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 72) = sub_24639AE68(v82, v3, v83);
        OUTLINED_FUNCTION_18();
        sub_2463C078C();
        OUTLINED_FUNCTION_19_0();
        *(_WORD *)(v41 + 12) = 2080;
        v42 = OUTLINED_FUNCTION_83();
        v43 = MEMORY[0x2495596C0](v42, v81);
        v45 = v44;
        OUTLINED_FUNCTION_82();
        *(_QWORD *)(v0 + 80) = sub_24639AE68(v43, v45, v83);
        sub_2463C078C();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_1_0();
        _os_log_impl(&dword_246381000, v38, (os_log_type_t)v3, "Multiple accounts found for name[%s]: %s", (uint8_t *)v41, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_1_0();

      v56 = OUTLINED_FUNCTION_18();
      v76(v56);
      v57 = *(void **)(v0 + 112);
      OUTLINED_FUNCTION_17_3();
      v58 = sub_24639737C(v39, v57);
      OUTLINED_FUNCTION_82();
      static AccountResolutionResult.disambiguation(with:)(v58);
      OUTLINED_FUNCTION_10();
      goto LABEL_19;
    }
    v53 = *(NSObject **)(v0 + 216);
    OUTLINED_FUNCTION_107(EnumCaseMultiPayload, v31, *(_QWORD *)(v0 + 192), v32, v33, v34, v35, v36, v69, (uint64_t)v71, v73, (uint64_t)v75, v78, v79);
    OUTLINED_FUNCTION_26_1();
    sub_2463C05A0();
    v54 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_3_3(v54))
    {
      v55 = (uint8_t *)OUTLINED_FUNCTION_5();
      v83[0] = OUTLINED_FUNCTION_5();
      *(_DWORD *)v55 = 136315138;
      OUTLINED_FUNCTION_26_1();
      *(_QWORD *)(v0 + 56) = sub_24639AE68(v82, v37, v83);
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v53, (os_log_type_t)v25, "No account found for name[%s]", v55);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_1_0();

    v62 = OUTLINED_FUNCTION_86();
    v77(v62);
    v63 = *(_QWORD *)(v0 + 184);
    v65 = *(_QWORD *)(v0 + 160);
    v64 = *(_QWORD *)(v0 + 168);
    v66 = *(void **)(v0 + 96);
    OUTLINED_FUNCTION_103(v74);
    v72(v63, *MEMORY[0x24BE977E0], v64);
    v67 = objc_msgSend(v66, sel_typeName);
    sub_2463C0618();

    __swift_storeEnumTagSinglePayload(v65, 1, 1, v70);
    OUTLINED_FUNCTION_85();
    OUTLINED_FUNCTION_96();
    swift_release();
    v68 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v68;
    v20 = OUTLINED_FUNCTION_79(v68, (uint64_t)sub_24639A710);
    v22 = 1;
  }
  else
  {
    if (qword_25756EFC8 != -1)
      v1 = swift_once();
    v13 = *(void **)(v0 + 208);
    OUTLINED_FUNCTION_25_2(v1, (uint64_t)qword_257574610);
    sub_2463C05A0();
    v14 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_22(v14))
    {
      v15 = (_WORD *)OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_60(v15);
      OUTLINED_FUNCTION_10_5(&dword_246381000, v16, v17, "No name in switch-by-name");
      OUTLINED_FUNCTION_0();
    }
    v18 = *(_QWORD *)(v0 + 200);

    OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v19;
    v20 = OUTLINED_FUNCTION_79(v19, (uint64_t)sub_24639A798);
    v22 = 0;
  }
  return sub_246399BC0(v20, v21, v22);
}

uint64_t sub_24639A710()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_33_2();
  OUTLINED_FUNCTION_32_3();
  *(_QWORD *)(v1 + 248) = v0;
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639A74C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_36_2();
  OUTLINED_FUNCTION_42_0();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_48();
  v0 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_6_9(v0, v1);
}

uint64_t sub_24639A798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _QWORD *a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(void);

  OUTLINED_FUNCTION_36_2();
  a19 = v21;
  a20 = v22;
  a18 = v20;
  a18 = (_QWORD *)*v20;
  OUTLINED_FUNCTION_51_0(&a18);
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_48();
  v23 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_6_9(v23, v24);
}

uint64_t sub_24639A810(uint64_t a1, uint64_t a2)
{
  sub_246396B14(4, a2, 0x100000000, 0x100000000);
  return sub_2463BFC1C();
}

uint64_t sub_24639A85C()
{
  sub_246396B14(4, 3, 2, 3);
  return sub_2463BFC1C();
}

uint64_t sub_24639A8B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[8] = a2;
  v3[9] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC0);
  v3[10] = OUTLINED_FUNCTION_3_4();
  v3[11] = OUTLINED_FUNCTION_9_3();
  v3[12] = OUTLINED_FUNCTION_3_9();
  v3[13] = OUTLINED_FUNCTION_11_1();
  v4 = OUTLINED_FUNCTION_7_2();
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = OUTLINED_FUNCTION_3_9();
  v3[17] = OUTLINED_FUNCTION_11_1();
  v3[18] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

#error "24639A9EC: call analysis failed (funcsize=189)"

uint64_t sub_24639AC58(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC0);
  *(_QWORD *)(v1 + 24) = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639AC9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int EnumTagSinglePayload;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = OUTLINED_FUNCTION_9_3();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v2);
  v4 = *(_QWORD *)(v0 + 24);
  if (EnumTagSinglePayload == 1)
  {
    sub_24639B8EC(v4);
    v5 = 1;
  }
  else
  {
    sub_246393724(v4, *(_QWORD *)(v0 + 16));
    v5 = 0;
  }
  __swift_storeEnumTagSinglePayload(*(_QWORD *)(v0 + 16), v5, 1, v2);
  OUTLINED_FUNCTION_14_2();
  return OUTLINED_FUNCTION_1_6(*(uint64_t (**)(void))(v0 + 8));
}

id SwitchProfileIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchProfileIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24639ADA8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_24639ADDC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24639ADFC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_24639AE68(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2463C078C();
  result = OUTLINED_FUNCTION_3_6();
  *a1 = v8;
  return result;
}

uint64_t sub_24639AE68(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_21();
  v9 = sub_24639AF30(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_24639BB70((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_24639BB70((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    OUTLINED_FUNCTION_59();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v10;
}

uint64_t sub_24639AF30(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_24639B084((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2463C0798();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_24639B148(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2463C0804();
    if (!v8)
    {
      result = sub_2463C0894();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_24639B084(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2463C08C4();
  __break(1u);
  return result;
}

uint64_t sub_24639B148(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24639B1DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_24639B3B0(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_24639B3B0((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24639B1DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2463C0660();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_24639B34C(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2463C07EC();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2463C08C4();
  __break(1u);
LABEL_14:
  result = sub_2463C0894();
  __break(1u);
  return result;
}

_QWORD *sub_24639B34C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_25756FF28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24639B3B0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_25756FF28);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_24639B548(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24639B484(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24639B484(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2463C08C4();
  __break(1u);
  return result;
}

char *sub_24639B548(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2463C08C4();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **sub_24639B5C8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_24639B5D8(void *a1)
{
  return sub_24639B5E4(a1, (SEL *)&selRef_profileId);
}

uint64_t sub_24639B5E4(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_2463C0618();

  }
  return OUTLINED_FUNCTION_87();
}

id sub_24639B63C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;
  objc_super v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v12[3] = type metadata accessor for AccountServicesNoOp();
  v12[4] = &off_251795760;
  v12[0] = a1;
  v11[3] = type metadata accessor for AssistantServicesProvider();
  v11[4] = &off_251794710;
  v11[0] = a2;
  sub_24638C500((uint64_t)v12, (uint64_t)a4 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_pbAccess);
  sub_24638C500((uint64_t)v11, (uint64_t)a4 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_assistantServices);
  sub_24638C500(a3, (uint64_t)a4 + OBJC_IVAR____TtC20SiriIdentityInternal26SwitchProfileIntentHandler_siriKitEventSender);
  v10.receiver = a4;
  v10.super_class = (Class)type metadata accessor for SwitchProfileIntentHandler();
  v8 = objc_msgSendSuper2(&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v8;
}

id sub_24639B718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  id v15;
  _QWORD v17[3];
  uint64_t v18;
  _UNKNOWN **v19;
  _QWORD v20[3];
  uint64_t v21;
  _UNKNOWN **v22;

  v21 = type metadata accessor for AccountServicesNoOp();
  v22 = &off_251795760;
  v20[0] = a1;
  v18 = type metadata accessor for AssistantServicesProvider();
  v19 = &off_251794710;
  v17[0] = a2;
  v6 = objc_allocWithZone((Class)type metadata accessor for SwitchProfileIntentHandler());
  v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_QWORD *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (_QWORD *)((char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  v15 = sub_24639B63C(*v9, *v13, a3, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v15;
}

uint64_t type metadata accessor for SwitchProfileIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_24639B87C(uint64_t a1)
{
  destroy for UserAccountManager(a1);
  return a1;
}

unint64_t sub_24639B8B0()
{
  unint64_t result;

  result = qword_25756FEB0;
  if (!qword_25756FEB0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25756FEB0);
  }
  return result;
}

uint64_t sub_24639B8EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24639B92C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_246391578(*(_QWORD *)(v1 + 16), a1);
}

uint64_t type metadata accessor for PineBoardAccountLookupResult()
{
  uint64_t result;

  result = qword_25756FFA0;
  if (!qword_25756FFA0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24639B980(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  void (*v4)(uint64_t);

  a3(0);
  v3 = OUTLINED_FUNCTION_87();
  v4(v3);
  OUTLINED_FUNCTION_25();
}

void sub_24639B9BC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_25();
}

uint64_t sub_24639B9F4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for UserAccountManager(a2, a1);
  return a2;
}

uint64_t sub_24639BA34()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_24639CA08);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t sub_24639BA7C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_24639CA08);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_24639BAF8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_24639BB3C);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t sub_24639BB3C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_1_4();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24639BB70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24639BBAC()
{
  return swift_deallocObject();
}

uint64_t sub_24639BBBC(uint64_t a1)
{
  uint64_t v1;

  return sub_24639A810(a1, *(unsigned __int8 *)(v1 + 16));
}

uint64_t *sub_24639BBC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = (int *)type metadata accessor for UserAccount();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v9 = sub_2463BF934();
      if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
      }
      v11 = v7[5];
      v12 = (uint64_t *)((char *)a1 + v11);
      v13 = (uint64_t *)((char *)a2 + v11);
      v14 = v13[1];
      *v12 = *v13;
      v12[1] = v14;
      v15 = v7[6];
      v16 = (uint64_t *)((char *)a1 + v15);
      v17 = (uint64_t *)((char *)a2 + v15);
      v28 = v17[1];
      *v16 = *v17;
      v16[1] = v28;
      v18 = v7[7];
      v19 = (uint64_t *)((char *)a1 + v18);
      v20 = (uint64_t *)((char *)a2 + v18);
      v21 = v20[1];
      *v19 = *v20;
      v19[1] = v21;
      v22 = v20[3];
      v19[2] = v20[2];
      v19[3] = v22;
      v23 = v20[5];
      v19[4] = v20[4];
      v19[5] = v23;
      v24 = v20[7];
      v19[6] = v20[6];
      v19[7] = v24;
      v25 = v20[9];
      v19[8] = v20[8];
      v19[9] = v25;
      v26 = v20[11];
      v19[10] = v20[10];
      v19[11] = v26;
      v19[12] = v20[12];
      *((_BYTE *)a1 + v7[8]) = *((_BYTE *)a2 + v7[8]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v7);
    }
  }
  return a1;
}

uint64_t sub_24639BDB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = type metadata accessor for UserAccount();
  result = __swift_getEnumTagSinglePayload(a1, 1, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_2463BF934();
    if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_24639BE98(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v6 = (int *)type metadata accessor for UserAccount();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_2463BF934();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v9 = v6[5];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = *((_QWORD *)v11 + 1);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *((_QWORD *)v10 + 1) = v12;
    v13 = v6[6];
    v14 = &a1[v13];
    v15 = &a2[v13];
    v26 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = *(_QWORD *)v15;
    *((_QWORD *)v14 + 1) = v26;
    v16 = v6[7];
    v17 = &a1[v16];
    v18 = &a2[v16];
    v19 = *((_QWORD *)v18 + 1);
    *(_QWORD *)v17 = *(_QWORD *)v18;
    *((_QWORD *)v17 + 1) = v19;
    v20 = *((_QWORD *)v18 + 3);
    *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
    *((_QWORD *)v17 + 3) = v20;
    v21 = *((_QWORD *)v18 + 5);
    *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
    *((_QWORD *)v17 + 5) = v21;
    v22 = *((_QWORD *)v18 + 7);
    *((_QWORD *)v17 + 6) = *((_QWORD *)v18 + 6);
    *((_QWORD *)v17 + 7) = v22;
    v23 = *((_QWORD *)v18 + 9);
    *((_QWORD *)v17 + 8) = *((_QWORD *)v18 + 8);
    *((_QWORD *)v17 + 9) = v23;
    v24 = *((_QWORD *)v18 + 11);
    *((_QWORD *)v17 + 10) = *((_QWORD *)v18 + 10);
    *((_QWORD *)v17 + 11) = v24;
    *((_QWORD *)v17 + 12) = *((_QWORD *)v18 + 12);
    a1[v6[8]] = a2[v6[8]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  }
  return a1;
}

_BYTE *sub_24639C064(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int *v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;

  v6 = (int *)type metadata accessor for UserAccount();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, (uint64_t)v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (v8)
    {
      sub_24639B9BC((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
      goto LABEL_7;
    }
    v11 = sub_2463BF934();
    v12 = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v11);
    v13 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11);
    if (v12)
    {
      if (!v13)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
LABEL_16:
        v25 = v6[5];
        v26 = &a1[v25];
        v27 = &a2[v25];
        *v26 = *v27;
        v26[1] = v27[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v28 = v6[6];
        v29 = &a1[v28];
        v30 = &a2[v28];
        *v29 = *v30;
        v29[1] = v30[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v31 = v6[7];
        v32 = &a1[v31];
        v33 = &a2[v31];
        *v32 = *(_QWORD *)&a2[v31];
        v32[1] = *(_QWORD *)&a2[v31 + 8];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[2] = v33[2];
        v32[3] = v33[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[4] = v33[4];
        v32[5] = v33[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[6] = v33[6];
        v32[7] = v33[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[8] = v33[8];
        v32[9] = v33[9];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[10] = v33[10];
        v32[11] = v33[11];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v32[12] = v33[12];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        a1[v6[8]] = a2[v6[8]];
        return a1;
      }
    }
    else
    {
      v23 = *(_QWORD *)(v11 - 8);
      if (!v13)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v23 + 24))(a1, a2, v11);
        goto LABEL_16;
      }
      (*(void (**)(_BYTE *, uint64_t))(v23 + 8))(a1, v11);
    }
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_16;
  }
  if (v8)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_2463BF934();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
  }
  v14 = v6[5];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *v15 = *v16;
  v15[1] = v16[1];
  v17 = v6[6];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *v18 = *v19;
  v18[1] = v19[1];
  v20 = v6[7];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *v21 = *v22;
  v21[1] = v22[1];
  v21[2] = v22[2];
  v21[3] = v22[3];
  v21[4] = v22[4];
  v21[5] = v22[5];
  v21[6] = v22[6];
  v21[7] = v22[7];
  v21[8] = v22[8];
  v21[9] = v22[9];
  v21[10] = v22[10];
  v21[11] = v22[11];
  v21[12] = v22[12];
  a1[v6[8]] = a2[v6[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  return a1;
}

char *sub_24639C4A0(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (int *)type metadata accessor for UserAccount();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_2463BF934();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    memcpy(&a1[v6[7]], &a2[v6[7]], 0x68uLL);
    a1[v6[8]] = a2[v6[8]];
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  }
  return a1;
}

_BYTE *sub_24639C5C4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int *v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = (int *)type metadata accessor for UserAccount();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, (uint64_t)v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, (uint64_t)v6);
  if (!EnumTagSinglePayload)
  {
    if (v8)
    {
      sub_24639B9BC((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
      goto LABEL_7;
    }
    v11 = sub_2463BF934();
    v12 = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v11);
    v13 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v11);
    if (v12)
    {
      if (!v13)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v11);
LABEL_16:
        v16 = v6[5];
        v17 = &a1[v16];
        v18 = (uint64_t *)&a2[v16];
        v20 = *v18;
        v19 = v18[1];
        *v17 = v20;
        v17[1] = v19;
        swift_bridgeObjectRelease();
        v21 = v6[6];
        v22 = &a1[v21];
        v23 = (uint64_t *)&a2[v21];
        v25 = *v23;
        v24 = v23[1];
        *v22 = v25;
        v22[1] = v24;
        swift_bridgeObjectRelease();
        v26 = v6[7];
        v27 = &a1[v26];
        v28 = &a2[v26];
        v29 = *(_QWORD *)&a2[v26 + 8];
        *v27 = *(_QWORD *)&a2[v26];
        v27[1] = v29;
        swift_bridgeObjectRelease();
        v30 = v28[3];
        v27[2] = v28[2];
        v27[3] = v30;
        swift_bridgeObjectRelease();
        v31 = v28[5];
        v27[4] = v28[4];
        v27[5] = v31;
        swift_bridgeObjectRelease();
        v32 = v28[7];
        v27[6] = v28[6];
        v27[7] = v32;
        swift_bridgeObjectRelease();
        v33 = v28[9];
        v27[8] = v28[8];
        v27[9] = v33;
        swift_bridgeObjectRelease();
        v34 = v28[11];
        v27[10] = v28[10];
        v27[11] = v34;
        swift_bridgeObjectRelease();
        v27[12] = v28[12];
        swift_bridgeObjectRelease();
        a1[v6[8]] = a2[v6[8]];
        return a1;
      }
    }
    else
    {
      v14 = *(_QWORD *)(v11 - 8);
      if (!v13)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v14 + 40))(a1, a2, v11);
        goto LABEL_16;
      }
      (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(a1, v11);
    }
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_16;
  }
  if (v8)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v9 = sub_2463BF934();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v9))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v9);
  }
  *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  memcpy(&a1[v6[7]], &a2[v6[7]], 0x68uLL);
  a1[v6[8]] = a2[v6[8]];
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, (uint64_t)v6);
  return a1;
}

uint64_t sub_24639C898()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24639C8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int EnumTagSinglePayload;

  v4 = OUTLINED_FUNCTION_9_3();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, a2, v4);
  if (EnumTagSinglePayload >= 2)
    return EnumTagSinglePayload - 1;
  else
    return 0;
}

uint64_t sub_24639C8E4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24639C8F0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = OUTLINED_FUNCTION_9_3();
  return __swift_storeEnumTagSinglePayload(a1, v5, a3, v6);
}

uint64_t sub_24639C934(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UserAccount();
  return __swift_getEnumTagSinglePayload(a1, 1, v2);
}

uint64_t sub_24639C964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserAccount();
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v4);
}

uint64_t sub_24639C99C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UserAccount();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_24639C9F4@<X0>(_QWORD *a1@<X8>)
{
  return sub_24639B92C(a1);
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_6_9(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_9_4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void OUTLINED_FUNCTION_10_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_15_3(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return type metadata accessor for SwitchProfileAccountResolutionResult();
}

uint64_t OUTLINED_FUNCTION_18_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_20_2@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_25_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

uint64_t OUTLINED_FUNCTION_28_3()
{
  uint64_t v0;

  return sub_24639B87C(v0 + 16);
}

uint64_t OUTLINED_FUNCTION_29_3()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_32_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

void OUTLINED_FUNCTION_33_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

BOOL OUTLINED_FUNCTION_35_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_2463C057C();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_43_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

void OUTLINED_FUNCTION_44_0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_24639B9BC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_46_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 240) = a1;
  return v1 - 240;
}

char *OUTLINED_FUNCTION_48_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_51_0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return sub_2463C057C();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, v2, v1);
}

_WORD *OUTLINED_FUNCTION_59_0(_WORD *result)
{
  *result = 0;
  return result;
}

_WORD *OUTLINED_FUNCTION_60(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_2463C0588();
}

uint64_t OUTLINED_FUNCTION_62()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_63@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 136);
}

char *OUTLINED_FUNCTION_64(uint64_t a1)
{
  return SwitchProfileIntentResponse.init(code:userActivity:)(a1, 0);
}

uint64_t OUTLINED_FUNCTION_65()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_mutable_project_boxed_opaque_existential_1(v0, *(_QWORD *)(v1 + 40));
}

uint64_t OUTLINED_FUNCTION_67()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_70()
{
  return type metadata accessor for SwitchProfileIntentResponse();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_2463BFCA0();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_2463BFC34();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return sub_2463BFBEC();
}

BOOL OUTLINED_FUNCTION_74(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_75()
{
  return sub_246393474();
}

uint64_t OUTLINED_FUNCTION_77(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2)
{
  uint64_t v2;

  return sub_246397538(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_79@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return *(_QWORD *)(v2 + 96);
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_24639AE68(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_85()
{
  return sub_2463BFC28();
}

uint64_t OUTLINED_FUNCTION_86()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_87()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_2463C078C();
}

uint64_t OUTLINED_FUNCTION_91(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_93()
{
  return static AccountResolutionResult.success(with:)();
}

id OUTLINED_FUNCTION_94(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_95(uint64_t a1)
{
  uint64_t v1;

  sub_24638C500(a1, v1);
}

uint64_t OUTLINED_FUNCTION_96()
{
  return sub_2463BFB98();
}

void OUTLINED_FUNCTION_99()
{
  void *v0;

}

void OUTLINED_FUNCTION_100()
{
  void *v0;

}

id OUTLINED_FUNCTION_101()
{
  return static SwitchProfileAccountResolutionResult.unsupported(forReason:)();
}

uint64_t OUTLINED_FUNCTION_102()
{
  return type metadata accessor for Signpost.OpenSignpost();
}

_QWORD *OUTLINED_FUNCTION_103(_QWORD *a1)
{
  return __swift_project_boxed_opaque_existential_1(a1, a1[3]);
}

uint64_t OUTLINED_FUNCTION_104()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_105()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_107(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t (*a14)(uint64_t, uint64_t))
{
  uint64_t v14;

  return a14(v14, a13);
}

uint64_t sub_24639CE08()
{
  if ((sub_2463C0414() & 1) != 0)
    return 1;
  else
    return sub_2463C0408();
}

uint64_t sub_24639CE2C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  NSObject *v22;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  _BYTE v27[32];
  _BYTE v28[32];
  uint64_t v29;

  v1 = sub_2463C05B8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - v5;
  v7 = objc_msgSend(v0, sel_disambiguationItems);
  v8 = sub_2463C0684();

  v9 = MEMORY[0x24BEE4AF8];
  v29 = MEMORY[0x24BEE4AF8];
  v10 = *(_QWORD *)(v8 + 16);
  if (v10)
  {
    v11 = v8 + 32;
    v24 = v8;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_24639BB70(v11, (uint64_t)v28);
      sub_24639BB70((uint64_t)v28, (uint64_t)v27);
      type metadata accessor for Account();
      if (swift_dynamicCast())
        goto LABEL_7;
      sub_24639BB70((uint64_t)v28, (uint64_t)v27);
      sub_2463A1B28(0, &qword_257570238);
      if (swift_dynamicCast())
      {
        v12 = v26;
        if ((id)INTypedObjectWithCustomObject())
        {

LABEL_7:
          v13 = __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
          MEMORY[0x24955969C](v13);
          if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_2463C06A8();
          sub_2463C06C0();
          sub_2463C069C();
          goto LABEL_22;
        }
        if (qword_25756EFB0 != -1)
          swift_once();
        v18 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745C8);
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v25, v18, v1);
        v19 = sub_2463C05A0();
        v20 = sub_2463C072C();
        if (os_log_type_enabled(v19, v20))
        {
          v21 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_246381000, v19, v20, "Could not convert disambiguation item to INObject", v21, 2u);
          MEMORY[0x249559E1C](v21, -1, -1);
          v22 = v12;
        }
        else
        {
          v22 = v19;
          v19 = v12;
        }

        (*(void (**)(char *, uint64_t))(v2 + 8))(v25, v1);
      }
      else
      {
        if (qword_25756EFB0 != -1)
          swift_once();
        v14 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745C8);
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v14, v1);
        v15 = sub_2463C05A0();
        v16 = sub_2463C072C();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_246381000, v15, v16, "Unexpected disambiguation item type", v17, 2u);
          MEMORY[0x249559E1C](v17, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v1);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
LABEL_22:
      v11 += 32;
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        v9 = v29;
        break;
      }
    }
  }
  swift_bridgeObjectRelease();
  return v9;
}

void *sub_24639D200(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  if (a1 >> 62)
    goto LABEL_20;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_2463C08B8())
  {
    v7 = 4;
    while (1)
    {
      v8 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x249559828](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = sub_24639B5D8(v8);
      if (v12)
      {
        if (v11 == a2 && v12 == a3)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v9;
        }
        v14 = sub_2463C0900();
        swift_bridgeObjectRelease();
        if ((v14 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          goto LABEL_18;
        }
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

void sub_24639D38C(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  char v27;
  uint64_t (**v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  unsigned __int8 (*v48)(uint64_t);
  int v49;
  uint8_t *v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  uint64_t v53;
  char v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  NSObject *v61;
  os_log_type_t v62;
  _WORD *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  _QWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t (**v80)(uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  _QWORD v89[4];

  v84 = a2;
  v81 = sub_2463BFFF4();
  v79 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  OUTLINED_FUNCTION_47_0();
  v78 = v3;
  v86 = OUTLINED_FUNCTION_7_2();
  v4 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  OUTLINED_FUNCTION_94_0();
  OUTLINED_FUNCTION_60_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_60_0();
  MEMORY[0x24BDAC7A8](v6);
  v80 = (uint64_t (**)(uint64_t, uint64_t))((char *)v73 - v7);
  v8 = sub_2463C0024();
  v9 = *(char **)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v73 - v13;
  v15 = sub_2463C0018();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_94_0();
  OUTLINED_FUNCTION_60_0();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v73 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v73 - v21;
  v83 = a1;
  sub_2463BFFE8();
  v26 = (*((unsigned int (**)(char *, uint64_t))v9 + 11))(v14, v8) == *MEMORY[0x24BE98E88];
  v77 = v8;
  if (!v26)
  {
    v28 = (uint64_t (**)(uint64_t, uint64_t))v9;
    v29 = (uint64_t)v12;
    v80 = v28;
    OUTLINED_FUNCTION_83_0((uint64_t)v14, v28[1]);
    v30 = v86;
LABEL_10:
    v31 = v83;
    v32 = v82;
    v33 = v81;
    v34 = v79;
    v35 = v78;
    if (qword_25756EFB8 != -1)
      swift_once();
    v36 = __swift_project_value_buffer(v30, (uint64_t)qword_2575745E0);
    v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v74 = v36;
    v76 = v37;
    ((void (*)(uint64_t))v37)(v32);
    (*(void (**)(uint64_t, void (*)(char *, uint64_t), uint64_t))(v34 + 16))(v35, v31, v33);
    v38 = v4;
    v39 = OUTLINED_FUNCTION_107_0();
    v40 = sub_2463C0720();
    if (os_log_type_enabled(v39, v40))
    {
      v85 = v38;
      v41 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_QWORD *)&v87 = OUTLINED_FUNCTION_5();
      *(_DWORD *)v41 = 136315138;
      v73[1] = v41 + 4;
      sub_2463BFFE8();
      v42 = sub_2463C0624();
      v44 = OUTLINED_FUNCTION_77_0(v42, v43);
      OUTLINED_FUNCTION_91_0(v44);
      sub_2463C078C();
      OUTLINED_FUNCTION_3_6();
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v81);
      OUTLINED_FUNCTION_13_2(&dword_246381000, v39, v40, "SwitchProfileDisambiguationStrategy.actionForInput() received parse: %s", v41);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_108(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));

    OUTLINED_FUNCTION_73_0();
    v45 = v77;
    sub_2463BFFE8();
    v46 = sub_2463A5CA0(v29, (uint64_t *)&v87);
    ((void (*)(uint64_t, uint64_t, double))v80[1])(v29, v45, v46);
    if (v88)
    {
      sub_246389878(&v87, (uint64_t)v89);
      OUTLINED_FUNCTION_54_1();
      v47 = OUTLINED_FUNCTION_18();
      v49 = v48(v47);
      v50 = (uint8_t *)v89[3];
      OUTLINED_FUNCTION_59_1(v89);
      if (v49 == 3)
      {
        v51 = OUTLINED_FUNCTION_68();
        v52(v51);
        OUTLINED_FUNCTION_79_0();
        sub_2463BFCF4();
      }
      else
      {
        v59 = OUTLINED_FUNCTION_68();
        if ((v60(v59) - 1) > 1u)
        {
          sub_2463BFD00();
        }
        else
        {
          v76(v75, v74, v30);
          v61 = OUTLINED_FUNCTION_107_0();
          v62 = sub_2463C0720();
          if (os_log_type_enabled(v61, v62))
          {
            v63 = (_WORD *)OUTLINED_FUNCTION_5();
            OUTLINED_FUNCTION_60(v63);
            OUTLINED_FUNCTION_4_3(&dword_246381000, v61, v62, "SwitchProfile disambiguation cancelled.", v50);
            OUTLINED_FUNCTION_0();
          }

          OUTLINED_FUNCTION_73_0();
          sub_2463BFCE8();
        }
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
    }
    else
    {
      sub_24638C6C8((uint64_t)&v87, (uint64_t *)&unk_257570290);
      sub_2463BFD00();
    }
    goto LABEL_39;
  }
  OUTLINED_FUNCTION_83_0((uint64_t)v14, *((uint64_t (**)(uint64_t, uint64_t))v9 + 12));
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v22, v14, v15);
  v23 = sub_2463C0000();
  v25 = v24;
  if (qword_25756EF50 != -1)
    swift_once();
  v26 = v23 == *(_QWORD *)(qword_257574568 + 96) && v25 == *(_QWORD *)(qword_257574568 + 104);
  v85 = v4;
  if (v26)
    v27 = 1;
  else
    v27 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_84_0((uint64_t)v20);
  if ((v27 & 1) != 0)
    goto LABEL_31;
  if (sub_2463C0000() == *(_QWORD *)(qword_257574568 + 112) && v53 == *(_QWORD *)(qword_257574568 + 120))
  {
    OUTLINED_FUNCTION_3_6();
LABEL_31:
    v58 = *(void (**)(char *, uint64_t))(v16 + 8);
    OUTLINED_FUNCTION_72_0((uint64_t)v20);
    v57 = v86;
    goto LABEL_32;
  }
  v55 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3_6();
  v56 = *(void (**)(char *, uint64_t))(v16 + 8);
  v56(v20, v15);
  if ((v55 & 1) == 0)
  {
    v80 = (uint64_t (**)(uint64_t, uint64_t))v9;
    v29 = (uint64_t)v12;
    v56(v22, v15);
    v4 = v85;
    v30 = v86;
    goto LABEL_10;
  }
  v57 = v86;
  v58 = v56;
LABEL_32:
  v64 = (char *)v80;
  v65 = (uint64_t)v76;
  if (qword_25756EFB8 != -1)
    swift_once();
  v66 = __swift_project_value_buffer(v57, (uint64_t)qword_2575745E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v64, v66, v57);
  OUTLINED_FUNCTION_84_0(v65);
  v67 = sub_2463C05A0();
  v68 = sub_2463C0720();
  if (os_log_type_enabled(v67, v68))
  {
    v69 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_QWORD *)&v87 = OUTLINED_FUNCTION_5();
    v83 = v58;
    *(_DWORD *)v69 = 136315138;
    v70 = sub_2463C0000();
    v72 = OUTLINED_FUNCTION_77_0(v70, v71);
    OUTLINED_FUNCTION_91_0(v72);
    sub_2463C078C();
    OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_72_0(v65);
    OUTLINED_FUNCTION_13_2(&dword_246381000, v67, v68, "SwitchProfileDisambiguationStrategy.actionForInput() handling direct invocation from %s", v69);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_72_0(v65);

  (*(void (**)(char *, uint64_t))(v85 + 8))(v64, v57);
  sub_2463BFCF4();
  OUTLINED_FUNCTION_72_0((uint64_t)v22);
LABEL_39:
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_24639DBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4[27] = a3;
  v4[28] = a4;
  v4[25] = a1;
  v4[26] = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570258);
  v4[29] = v5;
  v4[30] = *(_QWORD *)(v5 - 8);
  v4[31] = OUTLINED_FUNCTION_11_1();
  v4[32] = OUTLINED_FUNCTION_11_1();
  v6 = sub_2463BFFF4();
  v4[33] = v6;
  v4[34] = *(_QWORD *)(v6 - 8);
  v4[35] = OUTLINED_FUNCTION_3_4();
  v7 = sub_2463C0018();
  v4[36] = v7;
  v4[37] = *(_QWORD *)(v7 - 8);
  v4[38] = OUTLINED_FUNCTION_3_4();
  v8 = sub_2463C0084();
  v4[39] = v8;
  v4[40] = *(_QWORD *)(v8 - 8);
  v4[41] = OUTLINED_FUNCTION_3_4();
  v9 = sub_2463C0048();
  v4[42] = v9;
  v4[43] = *(_QWORD *)(v9 - 8);
  v4[44] = OUTLINED_FUNCTION_3_4();
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570260);
  v4[45] = v10;
  v4[46] = *(_QWORD *)(v10 - 8);
  v4[47] = OUTLINED_FUNCTION_11_1();
  v4[48] = OUTLINED_FUNCTION_11_1();
  v4[49] = type metadata accessor for IdentityNLv3Intent();
  v4[50] = OUTLINED_FUNCTION_3_4();
  v11 = sub_2463C0384();
  v4[51] = v11;
  v4[52] = *(_QWORD *)(v11 - 8);
  v4[53] = OUTLINED_FUNCTION_11_1();
  v4[54] = OUTLINED_FUNCTION_11_1();
  v4[55] = OUTLINED_FUNCTION_11_1();
  v12 = sub_2463C0024();
  v4[56] = v12;
  v4[57] = *(_QWORD *)(v12 - 8);
  v4[58] = OUTLINED_FUNCTION_11_1();
  v4[59] = OUTLINED_FUNCTION_11_1();
  v4[60] = OUTLINED_FUNCTION_11_1();
  v4[61] = OUTLINED_FUNCTION_11_1();
  v4[62] = OUTLINED_FUNCTION_11_1();
  v4[63] = OUTLINED_FUNCTION_11_1();
  v13 = OUTLINED_FUNCTION_7_2();
  v4[64] = v13;
  v4[65] = *(_QWORD *)(v13 - 8);
  v4[66] = OUTLINED_FUNCTION_11_1();
  v4[67] = OUTLINED_FUNCTION_11_1();
  v4[68] = OUTLINED_FUNCTION_11_1();
  v4[69] = OUTLINED_FUNCTION_11_1();
  v4[70] = OUTLINED_FUNCTION_11_1();
  v4[71] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639DDC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
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
  void (*v33)(uint64_t, uint64_t, uint64_t);
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t);
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint64_t v91;
  uint8_t *v92;
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
  void (*v103)(uint64_t);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  os_log_type_t v114;
  _BOOL4 v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint8_t *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unsigned __int8 v130;
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
  _QWORD *v143;
  NSObject *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  os_log_type_t v152;
  _WORD *v153;
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
  _QWORD *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  NSObject *v176;
  os_log_type_t v177;
  _WORD *v178;
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
  _QWORD *v191;
  uint64_t (*v192)(void);
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
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void (*v248)(uint64_t, uint64_t);
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
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
  uint64_t (*v281)(void);
  uint64_t (*v282)(void);
  uint64_t (*v283)(void);
  uint64_t (*v284)(void);
  uint64_t (*v285)(void);
  uint64_t (*v286)(uint64_t, uint64_t, uint64_t);
  __int128 v287;
  __int128 v288;

  if (qword_25756EFB8 != -1)
    swift_once();
  v267 = v0 + 192;
  v1 = *(_QWORD *)(v0 + 568);
  v2 = *(_QWORD *)(v0 + 520);
  v274 = __swift_project_value_buffer(*(_QWORD *)(v0 + 512), (uint64_t)qword_2575745E0);
  v286 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  ((void (*)(uint64_t))v286)(v1);
  v3 = sub_2463C05A0();
  v4 = sub_2463C0720();
  if (OUTLINED_FUNCTION_53_0(v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_60(v5);
    OUTLINED_FUNCTION_7_7(&dword_246381000, v3, v6, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult() called");
    OUTLINED_FUNCTION_0();
  }
  v7 = (_QWORD *)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 504);
  v9 = *(_QWORD *)(v0 + 448);
  v10 = *(_QWORD *)(v0 + 456);

  v11 = OUTLINED_FUNCTION_18();
  v280 = (uint64_t)v12;
  v12(v11);
  sub_2463BFFE8();
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 88))(v8, v9);
  if ((_DWORD)v13 == *MEMORY[0x24BE98E08])
  {
    v20 = *(_QWORD *)(v0 + 560);
    v21 = *(_QWORD *)(v0 + 496);
    v22 = *(_QWORD *)(v0 + 456);
    v24 = *(_QWORD *)(v0 + 432);
    v23 = *(_QWORD *)(v0 + 440);
    v25 = *(_QWORD *)(v0 + 408);
    v26 = *(_QWORD *)(v0 + 416);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v22 + 16))(v21, *(_QWORD *)(v0 + 504), *(_QWORD *)(v0 + 448));
    OUTLINED_FUNCTION_24_3(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 96));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v23, v21, v25);
    OUTLINED_FUNCTION_80_0(v20, v274, v27, v28, v29, v30, v31, v32, v194, v200, v206, v212, v218, v0 + 184, v230, v236, v242, (uint64_t)v248, v0 + 160,
      v0 + 144,
      v267,
      v274,
      v280,
      v286);
    v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    v33(v24, v23, v25);
    v34 = sub_2463C05A0();
    v35 = sub_2463C0720();
    v36 = OUTLINED_FUNCTION_48_1(v34);
    v37 = *(_QWORD *)(v0 + 560);
    v38 = *(_QWORD *)(v0 + 512);
    if (v36)
    {
      v39 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_QWORD *)&v287 = OUTLINED_FUNCTION_5();
      *(_DWORD *)v39 = 136315138;
      sub_2463A1B60(&qword_257570288, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3710], MEMORY[0x24BEA3720]);
      v40 = sub_2463C08F4();
      *(_QWORD *)(v0 + 192) = sub_24639AE68(v40, v41, (uint64_t *)&v287);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46_1();
      OUTLINED_FUNCTION_13_2(&dword_246381000, v34, v35, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult() matched NLv3Intent. intent: %s", v39);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_46_1();

    OUTLINED_FUNCTION_45(v37, v38, v48, v49, v50, v51, v52, v53, v195, v201, v207, v213, v219, v225, v231, v237, v243, v249, v255,
      v261,
      v268,
      v275,
      v281);
    v230 = *(_QWORD *)(v0 + 456);
    v54 = *(_QWORD *)(v0 + 440);
    v236 = *(_QWORD *)(v0 + 448);
    v242 = *(_QWORD *)(v0 + 504);
    v55 = *(_QWORD *)(v0 + 424);
    v56 = *(uint64_t **)(v0 + 400);
    v57 = *(_QWORD *)(v0 + 408);
    v58 = *(_QWORD *)(v0 + 392);
    v33(v55, v54, v57);
    sub_246387568(v55, v56);
    v59 = *(uint64_t *)((char *)v56 + *(int *)(v58 + 36));
    sub_2463A1B60(&qword_257570280, 255, (uint64_t (*)(uint64_t))type metadata accessor for IdentityNLv3Intent, (uint64_t)&protocol conformance descriptor for IdentityNLv3Intent);
    swift_retain();
    OUTLINED_FUNCTION_82_0();
    swift_release();
    v60 = *(_QWORD *)(v0 + 160);
    v61 = *(_QWORD *)(v0 + 168);
    swift_retain();
    OUTLINED_FUNCTION_82_0();
    swift_release();
    v62 = *(_QWORD *)(v0 + 152);
    sub_24638892C((uint64_t)v56);
    v248(v54, v57);
    v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v230 + 8))(v242, v236);
    if (v61)
    {
      OUTLINED_FUNCTION_104();
      v7 = (_QWORD *)v224;
LABEL_19:
      __swift_instantiateConcreteTypeFromMangledName(&qword_257570228);
      v70 = sub_2463BFF70();
      OUTLINED_FUNCTION_83();
      v71 = sub_24639D200(v70, v60, v61);
      v72 = OUTLINED_FUNCTION_10();
      if (v71)
      {
        v79 = v71;
        swift_bridgeObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
        v80 = (void *)sub_2463BFF7C();
        objc_msgSend(v80, sel_setAccount_, v79);

        v81 = (void *)OUTLINED_FUNCTION_105_0();
        objc_msgSend(v81, sel_setSwitchType_, 1);

        v82 = (void *)OUTLINED_FUNCTION_105_0();
        v83 = objc_msgSend(v82, sel_account);

        if (v83)
        {
          *((_QWORD *)&v288 + 1) = type metadata accessor for Account();
          *(_QWORD *)&v287 = v83;
        }
        else
        {
          v287 = 0u;
          v288 = 0u;
        }
        OUTLINED_FUNCTION_105_0();
        OUTLINED_FUNCTION_47();
        sub_2463BFEA4();
        sub_2463BFEEC();

LABEL_66:
        OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 240));
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        OUTLINED_FUNCTION_24();
        OUTLINED_FUNCTION_14_2();
        OUTLINED_FUNCTION_19();
        OUTLINED_FUNCTION_50();
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
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        v192 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
        return v192();
      }
      v89 = *(NSObject **)(v0 + 536);
      OUTLINED_FUNCTION_33_3(v72, v73, *(_QWORD *)(v0 + 512), v74, v75, v76, v77, v78, v194, v200, v206, v212, v218, v224, v230, v236, v242, (uint64_t)v248, v254,
        v260,
        v267,
        v274,
        v280,
        (uint64_t (*)(uint64_t, uint64_t))v286);
      OUTLINED_FUNCTION_83();
      sub_2463C05A0();
      v90 = OUTLINED_FUNCTION_16_0();
      if (OUTLINED_FUNCTION_61_0(v90))
      {
        v91 = v60;
        v92 = (uint8_t *)OUTLINED_FUNCTION_5();
        *(_QWORD *)&v287 = OUTLINED_FUNCTION_5();
        *(_DWORD *)v92 = 136315138;
        OUTLINED_FUNCTION_83();
        *v7 = sub_24639AE68(v91, v61, (uint64_t *)&v287);
        OUTLINED_FUNCTION_43_1();
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_13_2(&dword_246381000, v89, (os_log_type_t)v59, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult(): No matching account for the identifier '%s'", v92);
        OUTLINED_FUNCTION_17_4();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_1_0();

      v122 = OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_45(v122, v123, v124, v125, v126, v127, v128, v129, v196, v202, v208, v214, v220, v226, v232, v238, v244, v250, v256,
        v262,
        v269,
        v276,
        v282);
      OUTLINED_FUNCTION_41_1();
      OUTLINED_FUNCTION_8_2();
      v130 = 2;
      goto LABEL_62;
    }
    goto LABEL_56;
  }
  if ((_DWORD)v13 == *MEMORY[0x24BE98E88])
  {
    v42 = *(_QWORD *)(v0 + 296);
    OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 504), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 456) + 16));
    OUTLINED_FUNCTION_28_4();
    OUTLINED_FUNCTION_70_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 32));
    v43 = sub_2463C0000();
    v45 = v44;
    if (qword_25756EF50 != -1)
      swift_once();
    if (v43 == *(_QWORD *)(qword_257574568 + 112) && v45 == *(_QWORD *)(qword_257574568 + 120))
    {
      OUTLINED_FUNCTION_3_6();
    }
    else
    {
      v47 = OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_3_6();
      if ((v47 & 1) == 0)
      {
        v13 = OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 296));
LABEL_37:
        v111 = *(_QWORD *)(v0 + 272);
        v110 = *(_QWORD *)(v0 + 280);
        v112 = *(_QWORD *)(v0 + 208);
        OUTLINED_FUNCTION_33_3(v13, v14, *(_QWORD *)(v0 + 512), v15, v16, v17, v18, v19, v194, v200, v206, v212, v218, v224, v230, v236, v242, (uint64_t)v248, v254,
          v260,
          v267,
          v274,
          v280,
          (uint64_t (*)(uint64_t, uint64_t))v286);
        OUTLINED_FUNCTION_4_9(v110, v112, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v111 + 16));
        v113 = sub_2463C05A0();
        v114 = sub_2463C072C();
        v115 = OUTLINED_FUNCTION_48_1(v113);
        v116 = *(_QWORD *)(v0 + 544);
        v117 = *(_QWORD *)(v0 + 512);
        if (v115)
        {
          v118 = *(_QWORD *)(v0 + 280);
          v264 = *(_QWORD *)(v0 + 272);
          v271 = *(_QWORD *)(v0 + 264);
          v119 = (uint8_t *)OUTLINED_FUNCTION_5();
          *(_QWORD *)&v287 = OUTLINED_FUNCTION_5();
          *(_DWORD *)v119 = 136315138;
          sub_2463BFFE8();
          v120 = sub_2463C0624();
          *(_QWORD *)(v0 + 176) = sub_24639AE68(v120, v121, (uint64_t *)&v287);
          sub_2463C078C();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v264 + 8))(v118, v271);
          OUTLINED_FUNCTION_13_2(&dword_246381000, v113, v114, "Unsupported input parse type in parseDisambiguationResult %s", v119);
          OUTLINED_FUNCTION_17_4();
          OUTLINED_FUNCTION_0();
        }
        OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 272));

        OUTLINED_FUNCTION_45(v116, v117, v131, v132, v133, v134, v135, v136, v197, v203, v209, v215, v221, v227, v233, v239, v245, v251, v257,
          v263,
          v270,
          v277,
          v283);
        v137 = *(_QWORD *)(v0 + 504);
        v138 = *(_QWORD *)(v0 + 448);
        v139 = *(_QWORD *)(v0 + 456);
        OUTLINED_FUNCTION_41_1();
        OUTLINED_FUNCTION_8_2();
        OUTLINED_FUNCTION_6_3();
        OUTLINED_FUNCTION_86_0((unint64_t *)&qword_257570250, v140, v141, (uint64_t)"i*=\vhJ");
        v142 = OUTLINED_FUNCTION_21_2();
        OUTLINED_FUNCTION_34_2(v142, v143);
        v109 = *(void (**)(uint64_t, uint64_t))(v139 + 8);
LABEL_46:
        v107 = v137;
        v108 = v138;
        goto LABEL_47;
      }
    }
    v93 = sub_2463C000C();
    v59 = *(_QWORD *)(v0 + 296);
    v94 = *(_QWORD *)(v0 + 304);
    if (v93)
    {
      sub_2463BAB60(0x696669746E656469, 0xEA00000000007265, v93, (_OWORD *)(v0 + 96));
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_22_0(v94, *(uint64_t (**)(uint64_t, uint64_t))(v59 + 8));
      if (*(_QWORD *)(v0 + 120))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v60 = *(_QWORD *)(v0 + 128);
          v61 = *(_QWORD *)(v0 + 136);
          OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 456));
          goto LABEL_19;
        }
        goto LABEL_43;
      }
    }
    else
    {
      OUTLINED_FUNCTION_22_0(*(_QWORD *)(v0 + 304), *(uint64_t (**)(uint64_t, uint64_t))(v59 + 8));
      *(_OWORD *)(v0 + 96) = 0u;
      *(_OWORD *)(v0 + 112) = 0u;
    }
    sub_24638C6C8(v0 + 96, &qword_25756F730);
LABEL_43:
    v63 = OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 456));
LABEL_59:
    v176 = *(NSObject **)(v0 + 528);
    OUTLINED_FUNCTION_33_3(v63, v64, *(_QWORD *)(v0 + 512), v65, v66, v67, v68, v69, v194, v200, v206, v212, v218, v224, v230, v236, v242, (uint64_t)v248, v254,
      v260,
      v267,
      v274,
      v280,
      (uint64_t (*)(uint64_t, uint64_t))v286);
    sub_2463C05A0();
    v177 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_22(v177))
    {
      v178 = (_WORD *)OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_60(v178);
      OUTLINED_FUNCTION_7_7(&dword_246381000, v176, v179, "SwitchProfileDisambiguationStrategy.parseDisambiguationResult(): No ID or name found in disambiguation response");
      OUTLINED_FUNCTION_0();
    }

    v180 = OUTLINED_FUNCTION_18();
    OUTLINED_FUNCTION_45(v180, v181, v182, v183, v184, v185, v186, v187, v199, v205, v211, v217, v223, v229, v235, v241, v247, v253, v259,
      v266,
      v273,
      v279,
      v285);
    OUTLINED_FUNCTION_41_1();
    OUTLINED_FUNCTION_8_2();
    v130 = 1;
LABEL_62:
    sub_2463B0A74(v130);
    OUTLINED_FUNCTION_87_0((unint64_t *)&qword_257570250, v188, v189, (uint64_t)"i*=\vhJ");
    v190 = OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_34_2(v190, v191);
    goto LABEL_63;
  }
  if ((_DWORD)v13 != *MEMORY[0x24BE98E10])
  {
    if ((_DWORD)v13 != *MEMORY[0x24BE98E98])
      goto LABEL_37;
    v95 = *(_QWORD *)(v0 + 344);
    v96 = *(_QWORD *)(v0 + 328);
    v97 = *(_QWORD *)(v0 + 312);
    v98 = *(_QWORD *)(v0 + 320);
    OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 504), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 456) + 16));
    OUTLINED_FUNCTION_28_4();
    OUTLINED_FUNCTION_70_0(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v95 + 32));
    sub_2463C003C();
    v99 = sub_2463C0120();
    (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v96, v97);
    if (!v99)
    {
      if (qword_25756EFC0 != -1)
        swift_once();
      v144 = *(NSObject **)(v0 + 552);
      v145 = __swift_project_value_buffer(*(_QWORD *)(v0 + 512), (uint64_t)qword_2575745F8);
      OUTLINED_FUNCTION_80_0((uint64_t)v144, v145, v146, v147, v148, v149, v150, v151, v194, v200, v206, v212, v218, v224, v230, v236, v242, (uint64_t)v248, v254,
        v260,
        v267,
        v274,
        v280,
        v286);
      sub_2463C05A0();
      v152 = OUTLINED_FUNCTION_16_0();
      if (OUTLINED_FUNCTION_22(v152))
      {
        v153 = (_WORD *)OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_60(v153);
        OUTLINED_FUNCTION_7_7(&dword_246381000, v144, v154, "Unable to convert usoParse to legacy first dialog act");
        OUTLINED_FUNCTION_0();
      }
      v155 = *(_QWORD *)(v0 + 552);
      v137 = *(_QWORD *)(v0 + 504);
      v156 = *(_QWORD *)(v0 + 512);
      v138 = *(_QWORD *)(v0 + 448);
      v157 = *(_QWORD *)(v0 + 456);
      v159 = *(_QWORD *)(v0 + 344);
      v158 = *(_QWORD *)(v0 + 352);

      OUTLINED_FUNCTION_45(v155, v156, v160, v161, v162, v163, v164, v165, v198, v204, v210, v216, v222, v228, v234, v240, v246, v252, v258,
        v265,
        v272,
        v278,
        v284);
      OUTLINED_FUNCTION_41_1();
      OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_6_3();
      sub_2463A1B60((unint64_t *)&qword_257570250, 255, (uint64_t (*)(uint64_t))type metadata accessor for IdentityFlowError, (uint64_t)"i*=\vhJ");
      v166 = OUTLINED_FUNCTION_21_2();
      OUTLINED_FUNCTION_34_2(v166, v167);
      OUTLINED_FUNCTION_67_0(v158, *(uint64_t (**)(uint64_t, uint64_t))(v159 + 8));
      v109 = *(void (**)(uint64_t, uint64_t))(v157 + 8);
      goto LABEL_46;
    }
    v84 = v0 + 16;
    v101 = *(_QWORD *)(v0 + 368);
    v100 = *(_QWORD *)(v0 + 376);
    v102 = *(_QWORD *)(v0 + 360);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570270);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570278);
    OUTLINED_FUNCTION_75_0();
    v103 = (void (*)(uint64_t))sub_2463C03FC();
    OUTLINED_FUNCTION_22_0(v100, *(uint64_t (**)(uint64_t, uint64_t))(v101 + 8));
    v104 = OUTLINED_FUNCTION_92();
    v103(v104);
    if (v102)
    {
      v106 = *(_QWORD *)(v0 + 344);
      v105 = *(_QWORD *)(v0 + 352);
      OUTLINED_FUNCTION_62_0();
      OUTLINED_FUNCTION_67_0(v105, *(uint64_t (**)(uint64_t, uint64_t))(v106 + 8));
      swift_unknownObjectRelease();
      goto LABEL_36;
    }
    v169 = *(_QWORD *)(v0 + 344);
    v168 = *(_QWORD *)(v0 + 352);
    OUTLINED_FUNCTION_62_0();
    v62 = *(_QWORD *)(v0 + 40);
    v170 = *(_QWORD *)(v0 + 48);
    OUTLINED_FUNCTION_59_1((_QWORD *)(v0 + 16));
    (*(void (**)(uint64_t, uint64_t))(v170 + 32))(v62, v170);
    OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_67_0(v168, *(uint64_t (**)(uint64_t, uint64_t))(v169 + 8));
LABEL_55:
    __swift_destroy_boxed_opaque_existential_1(v84);
    v63 = OUTLINED_FUNCTION_31(*(_QWORD *)(v0 + 456));
LABEL_56:
    if (v62)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
      v171 = (void *)sub_2463BFF7C();
      sub_2463A17E8();

      v172 = (void *)OUTLINED_FUNCTION_88();
      objc_msgSend(v172, sel_setSwitchType_, 2);

      v173 = (void *)OUTLINED_FUNCTION_88();
      v174 = sub_2463A1738(v173);
      if (v175)
      {
        *((_QWORD *)&v288 + 1) = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v287 = v174;
        *((_QWORD *)&v287 + 1) = v175;
      }
      else
      {
        v287 = 0u;
        v288 = 0u;
      }
      OUTLINED_FUNCTION_88();
      OUTLINED_FUNCTION_47();
      sub_2463BFEA4();
      OUTLINED_FUNCTION_105();
      sub_2463BFEEC();
      goto LABEL_66;
    }
    goto LABEL_59;
  }
  v84 = v0 + 56;
  v85 = *(_QWORD *)(v0 + 384);
  v86 = *(_QWORD *)(v0 + 368);
  OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 504), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 456) + 16));
  OUTLINED_FUNCTION_28_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570270);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570278);
  OUTLINED_FUNCTION_75_0();
  v87 = (void (*)(uint64_t))sub_2463C03FC();
  OUTLINED_FUNCTION_67_0(v85, *(uint64_t (**)(uint64_t, uint64_t))(v86 + 8));
  v88 = OUTLINED_FUNCTION_92();
  v87(v88);
  if (!v85)
  {
    OUTLINED_FUNCTION_62_0();
    v62 = *(_QWORD *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    OUTLINED_FUNCTION_50_0();
    OUTLINED_FUNCTION_52_0();
    goto LABEL_55;
  }
  OUTLINED_FUNCTION_62_0();
  swift_unknownObjectRelease();
LABEL_36:
  v107 = OUTLINED_FUNCTION_18();
LABEL_47:
  v109(v107, v108);
LABEL_63:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
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
  v192 = *(uint64_t (**)(void))(v0 + 8);
  return v192();
}

uint64_t sub_24639EE18(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = sub_2463BFEBC();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = OUTLINED_FUNCTION_3_4();
  v3 = OUTLINED_FUNCTION_7_2();
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

void sub_24639EE78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v21;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[7];
  v2 = __swift_project_value_buffer(v0[6], (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_12(v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v3 = sub_2463C05A0();
  v4 = sub_2463C0720();
  if (OUTLINED_FUNCTION_53_0(v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_60(v5);
    OUTLINED_FUNCTION_7_7(&dword_246381000, v3, v6, "SwitchProfileDisambiguationStrategy.makeDisambiguationItemContainer() called");
    OUTLINED_FUNCTION_0();
  }
  v8 = v0[7];
  v7 = v0[8];
  v9 = v0[5];
  v10 = v0[4];

  OUTLINED_FUNCTION_22_0(v7, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
  sub_2463BFF94();
  v11 = sub_2463BFEB0();
  v13 = v12;
  OUTLINED_FUNCTION_83_0(v9, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  if (v11 == 0x746E756F636361 && v13 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = OUTLINED_FUNCTION_25_3();
    OUTLINED_FUNCTION_3_6();
    if ((v15 & 1) == 0)
    {
      OUTLINED_FUNCTION_41_1();
      OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_100_0();
      OUTLINED_FUNCTION_86_0((unint64_t *)&qword_257570250, v16, v17, (uint64_t)"i*=\vhJ");
      v18 = OUTLINED_FUNCTION_21_2();
      OUTLINED_FUNCTION_93_0(v18, v19);
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_55_0();
      __asm { BR              X0 }
    }
  }
  v21 = (void *)v0[2];
  sub_2463BFF88();
  OUTLINED_FUNCTION_99_0();

  __swift_instantiateConcreteTypeFromMangledName(qword_257570178);
  swift_allocObject();
  sub_2463BFFA0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_55_0();
  __asm { BR              X1 }
}

uint64_t sub_24639F094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v5 = sub_2463BFEBC();
  v4[11] = v5;
  v4[12] = *(_QWORD *)(v5 - 8);
  v4[13] = OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FE68);
  v4[14] = OUTLINED_FUNCTION_3_4();
  v6 = sub_2463BFCA0();
  v4[15] = v6;
  v4[16] = *(_QWORD *)(v6 - 8);
  v4[17] = OUTLINED_FUNCTION_3_4();
  v7 = OUTLINED_FUNCTION_7_2();
  v4[18] = v7;
  v4[19] = *(_QWORD *)(v7 - 8);
  v4[20] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639F12C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *ObjCClassFromMetadata;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t (*v43)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;

  OUTLINED_FUNCTION_58_0();
  if (qword_25756EFB8 != -1)
    swift_once();
  v17 = v16[19];
  v18 = v16[20];
  v19 = __swift_project_value_buffer(v16[18], (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_4_9((uint64_t)v18, v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
  sub_2463C05A0();
  v20 = OUTLINED_FUNCTION_14_1();
  if (os_log_type_enabled(v18, v20))
  {
    v21 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v21 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v18, v20, "SwitchProfileDisambiguationStrategy.makePromptForDisambiguation() called", v21);
    OUTLINED_FUNCTION_0();
  }
  v22 = v16[19];
  v23 = v16[17];
  v25 = v16[15];
  v24 = v16[16];

  OUTLINED_FUNCTION_24_3(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
  sub_2463BFB8C();
  v64 = v16[6];
  v63 = OUTLINED_FUNCTION_59_1(v16 + 2);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x24BE977D8], v25);
  OUTLINED_FUNCTION_47();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  result = sub_2463A1A74(ObjCClassFromMetadata);
  if (v28)
  {
    v30 = v16[13];
    v29 = v16[14];
    v61 = v16[12];
    v62 = v16[11];
    sub_2463BFC34();
    v31 = sub_2463BFBEC();
    OUTLINED_FUNCTION_29(v29, v32, v33, v31);
    sub_2463BFC28();
    sub_2463BFB98();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v16 + 2));
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
    sub_2463BFF94();
    v34 = sub_2463BFEB0();
    v36 = v35;
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v30, v62);
    if (v34 == 0x746E756F636361 && v36 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v38 = OUTLINED_FUNCTION_25_3();
      OUTLINED_FUNCTION_3_6();
      if ((v38 & 1) == 0)
      {
        OUTLINED_FUNCTION_41_1();
        OUTLINED_FUNCTION_8_2();
        OUTLINED_FUNCTION_100_0();
        OUTLINED_FUNCTION_87_0((unint64_t *)&qword_257570250, v39, v40, (uint64_t)"i*=\vhJ");
        v41 = OUTLINED_FUNCTION_9_1();
        OUTLINED_FUNCTION_93_0(v41, v42);
        swift_task_dealloc();
        OUTLINED_FUNCTION_24();
        OUTLINED_FUNCTION_19();
        OUTLINED_FUNCTION_50();
        OUTLINED_FUNCTION_63_0();
        return v43(v43, v44, v45, v46, v47, v48, v49, v50, v61, v62, v63, v64, a13, a14, a15, a16);
      }
    }
    v51 = *(void **)(v16[10] + 104);
    v16[21] = v51;
    if (v51)
    {
      v51;
      v52 = (_QWORD *)OUTLINED_FUNCTION_11_1();
      v16[22] = v52;
      *v52 = v16;
      v52[1] = sub_24639F460;
      OUTLINED_FUNCTION_63_0();
      return sub_24639F598(v53, v54, v55, v56);
    }
    else
    {
      v57 = (_QWORD *)swift_task_alloc();
      v16[24] = v57;
      *v57 = v16;
      v57[1] = sub_24639F4F8;
      OUTLINED_FUNCTION_63_0();
      return sub_24639F79C(v58, v59, v60);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24639F460()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639F4B0()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_31_3(v1);
}

uint64_t sub_24639F4F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  OUTLINED_FUNCTION_90(&v2);
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  return OUTLINED_FUNCTION_30_2((uint64_t (*)(void))v0[1]);
}

uint64_t sub_24639F54C()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  return OUTLINED_FUNCTION_30_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24639F598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = sub_2463BFE98();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639F5E8()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  char *v6;

  v1 = v0[6];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
  v0[10] = sub_2463BFF88();
  OUTLINED_FUNCTION_99_0();
  v2 = (void *)OUTLINED_FUNCTION_105();
  sub_24639FF78(v2, v3);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  v6 = (char *)&dword_257571530 + dword_257571530;
  v4 = (_QWORD *)swift_task_alloc();
  v0[11] = v4;
  *v4 = v0;
  v4[1] = sub_24639F6B4;
  return ((uint64_t (*)(_QWORD, unint64_t, unint64_t))v6)(v0[9], 0xD000000000000026, 0x80000002463C5090);
}

uint64_t sub_24639F6B4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 96) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639F704()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t (*v5)(void);

  v1 = *(void **)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = sub_2463C0060();
  v4 = OUTLINED_FUNCTION_104_0(v3, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_49_0((uint64_t)v4);

  OUTLINED_FUNCTION_24_3(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_19();
  v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_23_1(v5);
}

uint64_t sub_24639F76C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24639F79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = sub_2463BFE98();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639F7E8()
{
  uint64_t *v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  _QWORD *v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
  v0[9] = sub_2463BFF88();
  v1 = OUTLINED_FUNCTION_99_0();
  v2 = v1;
  if (v1 >> 62)
    goto LABEL_15;
  v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_2463C08B8())
  {
    v4 = 0;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x249559828](v4, v2) : *(id *)(v2 + 8 * v4 + 32);
      v6 = v5;
      v7 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      v8 = objc_msgSend(v5, sel_noNameMatched);

      ++v4;
      if (v8)
        v9 = v7 == v3;
      else
        v9 = 1;
      if (v9)
        goto LABEL_17;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  LOBYTE(v8) = 1;
LABEL_17:
  OUTLINED_FUNCTION_1_0();
  v10 = (_QWORD *)swift_task_alloc();
  v0[10] = (uint64_t)v10;
  *v10 = v0;
  v10[1] = sub_24639F928;
  return sub_246395000(v0[8], v8);
}

uint64_t sub_24639F928()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 88) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_24639F978()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t (*v5)(void);

  v1 = *(void **)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = sub_2463C0060();
  v4 = OUTLINED_FUNCTION_104_0(v3, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_49_0((uint64_t)v4);

  OUTLINED_FUNCTION_24_3(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_19();
  v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_23_1(v5);
}

uint64_t sub_24639F9DC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

void sub_24639FA0C(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  _QWORD v26[5];
  uint64_t v27;
  _OWORD v28[2];
  uint64_t v29;
  _BYTE v30[40];

  v26[3] = a2;
  v26[2] = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2463BFE80();
  OUTLINED_FUNCTION_85_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_47_0();
  v27 = v11;
  v12 = OUTLINED_FUNCTION_7_2();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v12, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v4, v14, v12);
  v15 = sub_2463C05A0();
  v16 = sub_2463C0720();
  if (OUTLINED_FUNCTION_48_1(v15))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_5();
    v26[1] = a3;
    *(_WORD *)v17 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v15, v16, "SwitchProfileDisambiguationStrategy.generateOutputsForDisambiguation() called", v17);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v4, v12);
  sub_24639CE2C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570228);
  v18 = sub_2463BFF64();
  v19 = v27;
  sub_2463B796C(v18);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_21();
  v20 = v26[4];
  sub_24639FCA0(v21, v22, v23);
  swift_bridgeObjectRelease();
  sub_24638C500(v20 + 192, (uint64_t)v30);
  v24 = OUTLINED_FUNCTION_105();
  v25(v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v3);
  v29 = 0;
  memset(v28, 0, sizeof(v28));
  sub_2463BFDCC();
  swift_bridgeObjectRelease();
  sub_24638C6C8((uint64_t)v28, &qword_257570230);
  sub_24638C6C8((uint64_t)v9, &qword_257570220);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v19, v3);
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_24639FCA0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __objc2_meth_list *v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v4 = a1;
  v25 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2463C08B8();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v6 = &OBJC_INSTANCE_METHODS_CaseTypeResolutionResult;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    v18 = MEMORY[0x24BEE4AF8];
LABEL_19:
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE818D8]), sel_init);
    sub_2463A1AD4(v18, (uint64_t)v19, &qword_257570210);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
    v20 = OUTLINED_FUNCTION_8_2();
    *(_OWORD *)(v20 + 16) = *(_OWORD *)&v6[498].entrysize;
    *(_QWORD *)(v20 + 32) = v19;
    OUTLINED_FUNCTION_101_0();
    return v24;
  }
  result = sub_2463A1B28(0, (unint64_t *)&unk_257570200);
  if (v5 >= 1)
  {
    v8 = 0;
    v22 = v4 & 0xC000000000000001;
    v9 = v4;
    do
    {
      if (v22)
        v10 = (id)MEMORY[0x249559828](v8, v4);
      else
        v10 = *(id *)(v4 + 8 * v8 + 32);
      v11 = v10;
      v12 = sub_2463A4AB0(v11);
      v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81938]), sel_init);
      objc_msgSend(v13, sel_setObject_, v12);
      if (*(_QWORD *)(v3 + 104) && a3)
      {
        v14 = sub_2463A0C08((uint64_t)v11, a2, a3);
        if (!v14)
          v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81858]), sel_init);
      }
      else
      {
        v14 = sub_2463A3FEC();
      }
      v15 = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
      v16 = OUTLINED_FUNCTION_8_2();
      *(_OWORD *)(v16 + 16) = xmmword_2463C1F90;
      *(_QWORD *)(v16 + 32) = v15;
      OUTLINED_FUNCTION_101_0();
      swift_unknownObjectRetain();
      sub_2463A1A10(v24, v13);
      v17 = v13;
      MEMORY[0x24955969C]();
      if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2463C06A8();
      ++v8;
      sub_2463C06C0();
      sub_2463C069C();

      swift_unknownObjectRelease();
      v4 = v9;
    }
    while (v5 != v8);
    swift_bridgeObjectRelease();
    v18 = v25;
    v6 = &OBJC_INSTANCE_METHODS_CaseTypeResolutionResult;
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_24639FF78(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575701B8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_33_0();
  v7 = sub_2463C0708();
  OUTLINED_FUNCTION_29(v3, v8, v9, v7);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = a2;
  v10[6] = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  v11 = a1;
  sub_2463A0AC4(v3, (uint64_t)&unk_2575701C8, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2463A0038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[18] = a5;
  v6[19] = a6;
  v6[17] = a4;
  v7 = sub_2463C05B8();
  v6[20] = v7;
  v6[21] = *(_QWORD *)(v7 - 8);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2463A00D0()
{
  _QWORD *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v5;
  _WORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[26];
  v2 = v0[21];
  v3 = __swift_project_value_buffer(v0[20], (uint64_t)qword_2575745E0);
  v0[27] = v3;
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[28] = v4;
  OUTLINED_FUNCTION_12(v3, v4);
  sub_2463C05A0();
  v5 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v5))
  {
    v6 = (_WORD *)OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_60(v6);
    OUTLINED_FUNCTION_7_7(&dword_246381000, v1, v7, "SwitchProfileDisambiguationStrategy.presentContentDisambiguationView() called");
    OUTLINED_FUNCTION_0();
  }
  v8 = v0[21];
  v9 = v0[17];

  v10 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
  v0[29] = v10;
  OUTLINED_FUNCTION_24_3(v10);
  sub_24638C500(v9 + 152, (uint64_t)(v0 + 2));
  v11 = (_QWORD *)OUTLINED_FUNCTION_18();
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v13 = (_QWORD *)swift_task_alloc();
  v0[30] = v13;
  *v13 = v0;
  v13[1] = sub_2463A0204;
  return sub_2463C0534();
}

uint64_t sub_2463A0204(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 248) = a1;
  *(_QWORD *)(v3 + 256) = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A0264()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(NSObject *, uint64_t, uint64_t);
  NSObject *v24;
  uint64_t v25;
  os_log_type_t v26;
  _WORD *v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + 248);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  if (v1 >> 62)
    goto LABEL_19;
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      v3 = *(_QWORD *)(v0 + 248);
      v4 = v1 & 0xC000000000000001;
      v5 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x249559828](0, v3) : *(id *)(v3 + 32);
      v6 = v5;
      sub_2463C04F8();
      sub_2463C0564();
      if (v1 == OUTLINED_FUNCTION_106())
        break;

      if (v2 != 1)
      {
        v18 = *(_QWORD *)(v0 + 248);
        v19 = 5;
        while (1)
        {
          v1 = v19 - 4;
          v20 = v4 ? (id)MEMORY[0x249559828](v19 - 4, *(_QWORD *)(v0 + 248)) : *(id *)(v18 + 8 * v19);
          v6 = v20;
          v21 = v19 - 3;
          if (__OFADD__(v1, 1))
            break;
          sub_2463C04F8();
          sub_2463C0564();
          if (v1 == OUTLINED_FUNCTION_106())
            goto LABEL_6;

          ++v19;
          if (v21 == v2)
            goto LABEL_15;
        }
        __break(1u);
LABEL_19:
        swift_bridgeObjectRetain();
        v2 = sub_2463C08B8();
        if (v2)
          continue;
      }
      goto LABEL_15;
    }
LABEL_6:
    *(_QWORD *)(v0 + 264) = v6;
    v7 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 136);
    OUTLINED_FUNCTION_1_0();
    v9 = v6;
    v10 = sub_2463C04E0();
    v12 = v11;

    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81858]), sel_init);
    *(_QWORD *)(v0 + 272) = v13;
    v14 = sub_24639FCA0(v7, v10, v12);
    swift_bridgeObjectRelease();
    sub_2463A1AD4(v14, (uint64_t)v13, &qword_2575701F8);
    sub_24638C500(v8 + 112, v0 + 56);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
    sub_2463C04E0();
    *(_QWORD *)(v0 + 280) = v15;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 288) = v16;
    sub_2463A1B28(0, &qword_2575701E8);
    *v16 = v0;
    v16[1] = sub_2463A0560;
    return sub_2463BFF34();
  }
  else
  {
LABEL_15:
    v22 = *(_QWORD *)(v0 + 216);
    v23 = *(void (**)(NSObject *, uint64_t, uint64_t))(v0 + 224);
    v24 = *(NSObject **)(v0 + 200);
    v25 = *(_QWORD *)(v0 + 160);
    OUTLINED_FUNCTION_1_0();
    v23(v24, v22, v25);
    sub_2463C05A0();
    v26 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_22(v26))
    {
      v27 = (_WORD *)OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_60(v27);
      OUTLINED_FUNCTION_7_7(&dword_246381000, v24, v28, "Unable to retrieve currentDeviceAssistantID to generate commands for content disambiguation on remote device. Aborting.");
      OUTLINED_FUNCTION_0();
    }
    v29 = *(void (**)(uint64_t))(v0 + 232);

    v30 = OUTLINED_FUNCTION_18();
    v29(v30);
    OUTLINED_FUNCTION_20_3();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_50();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2463A0560(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 296) = a1;
  *(_QWORD *)(v3 + 304) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  return swift_task_switch();
}

void sub_2463A05D0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(NSObject *, uint64_t, uint64_t);
  NSObject *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint8_t *v10;
  id v11;
  void *v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  _QWORD *v16;

  v1 = *(void **)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(void (**)(NSObject *, uint64_t, uint64_t))(v0 + 224);
  v4 = *(NSObject **)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v4;
  sub_2463C05A0();
  v8 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_48_1(v4))
  {
    v9 = *(void **)(v0 + 296);
    v10 = (uint8_t *)OUTLINED_FUNCTION_5();
    v16 = (_QWORD *)OUTLINED_FUNCTION_5();
    *(_DWORD *)v10 = 138412290;
    *(_QWORD *)(v0 + 128) = v9;
    v11 = v9;
    sub_2463C078C();
    *v16 = v9;

    OUTLINED_FUNCTION_13_2(&dword_246381000, v7, v8, "makePromptForDisambiguation submitToRemote completed with response: %@", v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575701F0);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }

  v12 = *(void **)(v0 + 296);
  v13 = *(void (**)(uint64_t))(v0 + 232);

  v14 = OUTLINED_FUNCTION_18();
  v13(v14);
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_55_0();
  __asm { BR              X0 }
}

uint64_t sub_2463A0770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void (*v29)(NSObject *, uint64_t, uint64_t);
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  os_log_type_t v34;
  void *v35;
  uint8_t *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(uint64_t);
  uint64_t v42;

  OUTLINED_FUNCTION_58_0();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  v27 = *(void **)(v24 + 256);
  v28 = *(_QWORD *)(v24 + 216);
  v29 = *(void (**)(NSObject *, uint64_t, uint64_t))(v24 + 224);
  v30 = *(NSObject **)(v24 + 184);
  v31 = *(_QWORD *)(v24 + 160);
  __swift_destroy_boxed_opaque_existential_1(v24 + 16);
  v29(v30, v28, v31);
  v32 = v27;
  v33 = v27;
  sub_2463C05A0();
  v34 = OUTLINED_FUNCTION_16_0();
  if (os_log_type_enabled(v30, v34))
  {
    v35 = *(void **)(v24 + 256);
    v36 = (uint8_t *)OUTLINED_FUNCTION_5();
    v37 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v36 = 136315138;
    a13 = v37;
    *(_QWORD *)(v24 + 104) = v35;
    v38 = v35;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756F180);
    v39 = OUTLINED_FUNCTION_74_0();
    *(_QWORD *)(v24 + 96) = sub_24639AE68(v39, v40, &a13);
    OUTLINED_FUNCTION_43_1();
    OUTLINED_FUNCTION_104();
    OUTLINED_FUNCTION_38_2();
    OUTLINED_FUNCTION_38_2();
    OUTLINED_FUNCTION_13_2(&dword_246381000, v30, v34, "Unable to get devicesWithProximity: %s", v36);
    OUTLINED_FUNCTION_17_4();
    OUTLINED_FUNCTION_0();
  }
  v41 = *(void (**)(uint64_t))(v24 + 232);
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();

  v42 = OUTLINED_FUNCTION_105();
  v41(v42);
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v24 + 8));
}

uint64_t sub_2463A090C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void (*v29)(NSObject *, uint64_t, uint64_t);
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  void *v36;
  uint8_t *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  void (*v43)(uint64_t);
  uint64_t v44;

  OUTLINED_FUNCTION_58_0();
  a23 = v25;
  a24 = v26;
  a22 = v24;
  v27 = *(void **)(v24 + 304);
  v28 = *(_QWORD *)(v24 + 216);
  v29 = *(void (**)(NSObject *, uint64_t, uint64_t))(v24 + 224);
  v30 = *(NSObject **)(v24 + 176);
  v31 = *(_QWORD *)(v24 + 160);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v24 + 56);
  v29(v30, v28, v31);
  v32 = v27;
  v33 = v27;
  v34 = v30;
  sub_2463C05A0();
  v35 = OUTLINED_FUNCTION_16_0();
  if (OUTLINED_FUNCTION_61_0(v35))
  {
    v36 = *(void **)(v24 + 304);
    v37 = (uint8_t *)OUTLINED_FUNCTION_5();
    v38 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v37 = 136315138;
    a13 = v38;
    *(_QWORD *)(v24 + 112) = v36;
    v39 = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756F180);
    v40 = OUTLINED_FUNCTION_74_0();
    *(_QWORD *)(v24 + 120) = sub_24639AE68(v40, v41, &a13);
    OUTLINED_FUNCTION_43_1();
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_38_2();
    OUTLINED_FUNCTION_38_2();
    OUTLINED_FUNCTION_13_2(&dword_246381000, v34, (os_log_type_t)v31, "makePromptForDisambiguation submitToRemote() failed with error: %s", v37);
    OUTLINED_FUNCTION_17_4();
    OUTLINED_FUNCTION_0();
  }
  v42 = *(void **)(v24 + 272);
  v43 = *(void (**)(uint64_t))(v24 + 232);

  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();

  v44 = OUTLINED_FUNCTION_105();
  v43(v44);
  OUTLINED_FUNCTION_20_3();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  return OUTLINED_FUNCTION_19_3(*(uint64_t (**)(void))(v24 + 8));
}

uint64_t sub_2463A0AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2463C0708();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_24638C6C8(a1, &qword_2575701B8);
  }
  else
  {
    sub_2463C06FC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2463C06D8();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

id sub_2463A0C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_85_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_5_2();
  v9 = sub_2463BF934();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  sub_2463A0E28();
  if (v11 >> 60 == 15)
  {
    if (qword_25756EFB0 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745C8);
    OUTLINED_FUNCTION_12(v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    v13 = sub_2463C05A0();
    v14 = sub_2463C072C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v15 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v13, v14, "Error while creating direct invocation command from item", v15);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v3);
    return 0;
  }
  else
  {
    v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81540]), sel_init);
    sub_2463A17A4(a2, a3, v17);
    v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81260]), sel_init);
    sub_2463BF928();
    sub_2463BF91C();
    OUTLINED_FUNCTION_108(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    sub_2463A17E8();

    objc_msgSend(v16, sel_setRemoteDevice_, v17);
    v18 = OUTLINED_FUNCTION_68();
    sub_2463A1824(v18, v19, v16);

    v20 = OUTLINED_FUNCTION_68();
    sub_2463A1868(v20, v21);
  }
  return v16;
}

uint64_t sub_2463A0E28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = OUTLINED_FUNCTION_7_2();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_33_0();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE817B8]), sel_init);
  v4 = sub_2463A3FEC();
  objc_msgSend(v3, sel_setStartLocalRequest_, v4);

  v5 = objc_msgSend(v3, sel_dictionary);
  if (v5)
  {
    v6 = v5;
    v15[0] = 0;
    v7 = objc_msgSend((id)objc_opt_self(), sel_dataWithPropertyList_format_options_error_, v5, 200, 0, v15);
    v8 = v15[0];
    if (v7)
    {
      sub_2463BF904();

    }
    else
    {
      v12 = v8;
      v13 = (void *)sub_2463BF8C8();

      swift_willThrow();
    }
  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745E0);
    OUTLINED_FUNCTION_4_9(v0, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    OUTLINED_FUNCTION_107_0();
    v10 = OUTLINED_FUNCTION_16_0();
    if (OUTLINED_FUNCTION_48_1(v4))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v11 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v4, v10, "Could not parse startUIRequest as Dictionary.", v11);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_22_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  }
  return OUTLINED_FUNCTION_68();
}

uint64_t sub_2463A1068()
{
  uint64_t v0;

  sub_24638C60C(v0 + 16);

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1(v0 + 192);
  return v0;
}

uint64_t sub_2463A10A4()
{
  sub_2463A1068();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SwitchProfileDisambiguationStrategy()
{
  return objc_opt_self();
}

void sub_2463A10E8()
{
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  JUMPOUT(0x249558A3CLL);
}

void sub_2463A1128(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
{
  sub_24639D38C(a1, a2);
}

uint64_t sub_2463A113C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_2463A118C;
  return sub_24639EE18(a2);
}

uint64_t sub_2463A118C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v4 = *v2;
  v6 = *v2;
  OUTLINED_FUNCTION_90(&v6);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return OUTLINED_FUNCTION_31_3((uint64_t (*)(void))v2[1]);
}

uint64_t sub_2463A11D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2463A1B9C;
  return sub_24639DBD0(a1, a2, a3, a4);
}

uint64_t sub_2463A1244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2463A12B0;
  return sub_24639F094(a1, a2, a3);
}

uint64_t sub_2463A12B0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_3();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463A12D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_2463A1B9C;
  return sub_2463BFA24();
}

uint64_t sub_2463A1358()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_2463A1B9C;
  return sub_2463BFA3C();
}

uint64_t sub_2463A13DC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_2463A1B9C;
  return sub_2463BFA30();
}

uint64_t sub_2463A1458()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_2463A1B9C;
  return sub_2463BFA54();
}

uint64_t sub_2463A14D4()
{
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  return sub_2463BFA48();
}

uint64_t sub_2463A150C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_2463A1B9C;
  return sub_2463BFFAC();
}

uint64_t sub_2463A15A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_2463A1B9C;
  return sub_2463BFFB8();
}

void sub_2463A163C(uint64_t a1, uint64_t a2)
{
  sub_2463A1B60(&qword_257570168, a2, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileDisambiguationStrategy, (uint64_t)&unk_2463C2014);
}

unint64_t sub_2463A166C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257570170;
  if (!qword_257570170)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_257570178);
    result = MEMORY[0x249559D74](MEMORY[0x24BE98C98], v1);
    atomic_store(result, (unint64_t *)&qword_257570170);
  }
  return result;
}

uint64_t sub_2463A16B0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2463A1714;
  return v6(a1);
}

uint64_t sub_2463A1714()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_2_3();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_3_7(v0);
}

uint64_t sub_2463A1738(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_name);

  if (!v2)
    return 0;
  v3 = sub_2463C0618();

  return v3;
}

void sub_2463A17A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463C060C();
  objc_msgSend(a3, sel_setAssistantId_, v4);

}

void sub_2463A17E8()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v9 = sub_2463C060C();
  v0 = OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_56_0(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_29_4(v10);
}

void sub_2463A1824(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463BF8F8();
  objc_msgSend(a3, sel_setSerializedCommand_, v4);

}

uint64_t sub_2463A1868(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2463A187C(a1, a2);
  return a1;
}

uint64_t sub_2463A187C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2463A18C0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2463A18FC(uint64_t a1)
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
  v9[1] = sub_24638966C;
  return sub_2463A0038(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2463A197C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2463A19A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463A12B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2575701D0 + dword_2575701D0))(a1, v4);
}

void sub_2463A1A10(uint64_t a1, void *a2)
{
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257570218);
  v3 = (id)sub_2463C0678();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v3);

}

uint64_t sub_2463A1A74(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_typeName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2463C0618();

  return v3;
}

void sub_2463A1AD4(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  sub_2463A1B28(0, a3);
  v12 = sub_2463C0678();
  v3 = OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_56_0(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
  OUTLINED_FUNCTION_29_4(v13);
}

uint64_t sub_2463A1B28(uint64_t a1, unint64_t *a2)
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

void sub_2463A1B60(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(MEMORY[0x249559D74](a4, v6), a1);
  }
  OUTLINED_FUNCTION_25();
}

void OUTLINED_FUNCTION_7_7(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  uint8_t *v5;

  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_19_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_23_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_24_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return sub_2463C0900();
}

uint64_t OUTLINED_FUNCTION_28_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v0);
}

void OUTLINED_FUNCTION_29_4(id a1)
{

}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_31_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_33_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t (*a24)(uint64_t, uint64_t))
{
  uint64_t v24;

  return a24(v24, a22);
}

uint64_t OUTLINED_FUNCTION_34_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  *a2 = v2;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_38_2()
{
  void *v0;

}

void OUTLINED_FUNCTION_39_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_41_1()
{
  return type metadata accessor for IdentityFlowError();
}

uint64_t OUTLINED_FUNCTION_43_1()
{
  return sub_2463C078C();
}

uint64_t OUTLINED_FUNCTION_45(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t (*a23)(void))
{
  return a23();
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

BOOL OUTLINED_FUNCTION_48_1(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

void OUTLINED_FUNCTION_49_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_24639FA0C(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_unknownObjectRelease();
}

BOOL OUTLINED_FUNCTION_53_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

_QWORD *OUTLINED_FUNCTION_54_1()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 128), *(_QWORD *)(v0 - 104));
}

id OUTLINED_FUNCTION_56_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  SEL *v10;
  void *v11;

  return objc_msgSend(v11, *v10, a10);
}

_QWORD *OUTLINED_FUNCTION_59_1(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

void OUTLINED_FUNCTION_60_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

BOOL OUTLINED_FUNCTION_61_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_67_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_68()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_70_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_72_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return sub_2463C0624();
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return sub_2463C03F0();
}

uint64_t OUTLINED_FUNCTION_77_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_24639AE68(a1, a2, (uint64_t *)(v2 - 232));
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_80_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t (*a24)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v24;

  return a24(a1, a2, v24);
}

uint64_t OUTLINED_FUNCTION_81_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t, uint64_t))
{
  return a12(a11, a10);
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  return sub_2463C0240();
}

uint64_t OUTLINED_FUNCTION_83_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_84_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

void OUTLINED_FUNCTION_86_0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t);

  sub_2463A1B60(a1, 255, v4, a4);
}

void OUTLINED_FUNCTION_87_0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t);

  sub_2463A1B60(a1, 255, v4, a4);
}

uint64_t OUTLINED_FUNCTION_88()
{
  return sub_2463BFF7C();
}

uint64_t OUTLINED_FUNCTION_90@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_91_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t OUTLINED_FUNCTION_92()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = v0;
  return v1 - 112;
}

uint64_t OUTLINED_FUNCTION_93_0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  *a2 = v2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_99_0()
{
  return sub_24639CE2C();
}

uint64_t OUTLINED_FUNCTION_100_0()
{
  return sub_2463B0A74(1u);
}

uint64_t OUTLINED_FUNCTION_101_0()
{
  return sub_2463C069C();
}

uint64_t *OUTLINED_FUNCTION_104_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  v2[3] = a1;
  v2[4] = a2;
  return __swift_allocate_boxed_opaque_existential_1Tm(v2);
}

uint64_t OUTLINED_FUNCTION_105_0()
{
  return sub_2463BFF7C();
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_2463C0564();
}

uint64_t OUTLINED_FUNCTION_107_0()
{
  return sub_2463C05A0();
}

uint64_t OUTLINED_FUNCTION_108@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void sub_2463A1F54(unint64_t a1, unint64_t a2)
{
  if (a1 >> 62)
  {
    if (a1 >> 62 != 1)
      __asm { BR              X10 }
    if (a2 >> 62 == 1)
    {
      sub_2463A3BA4();
      sub_2463A3888(a1);
      sub_2463A3888(a2);
LABEL_7:
      sub_2463C0768();
      OUTLINED_FUNCTION_15_4();
      sub_2463A38AC(a1);
    }
  }
  else if (!(a2 >> 62))
  {
    sub_2463A3BA4();
    sub_2463A3888(a1);
    sub_2463A3888(a2);
    OUTLINED_FUNCTION_17_5();
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_10_6();
}

void sub_2463A2070(unint64_t *a1, unint64_t *a2)
{
  sub_2463A1F54(*a1, *a2);
}

void sub_2463A207C()
{
  uint64_t v0;
  unint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
  if (v1 >> 62 == 1)
    v2 = (id)(v1 & 0x3FFFFFFFFFFFFFFFLL);
  OUTLINED_FUNCTION_25();
}

void sub_2463A20DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - v7;
  v9 = sub_2463BFFF4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  sub_24638C5C4((uint64_t)v8, (uint64_t)v6);
  swift_beginAccess();
  v10 = OUTLINED_FUNCTION_17_5();
  sub_24638C540(v10, v11);
  swift_endAccess();
  v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) = 0x8000000000000000;
  sub_2463A38AC(v12);
  OUTLINED_FUNCTION_10_6();
}

uint64_t sub_2463A21E8()
{
  type metadata accessor for ExecutionDeviceResolutionFlow();
  sub_2463A3EEC(&qword_25756F938, (void (*)(uint64_t))type metadata accessor for ExecutionDeviceResolutionFlow);
  OUTLINED_FUNCTION_17_5();
  return sub_2463BFB44();
}

uint64_t sub_2463A2258(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[9] = a1;
  v2[10] = v1;
  v3 = sub_2463C0024();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F940);
  v2[14] = OUTLINED_FUNCTION_3_4();
  v4 = sub_2463BFFF4();
  v2[15] = v4;
  v2[16] = *(_QWORD *)(v4 - 8);
  v2[17] = OUTLINED_FUNCTION_3_4();
  v5 = OUTLINED_FUNCTION_7_2();
  v2[18] = v5;
  v2[19] = *(_QWORD *)(v5 - 8);
  v2[20] = OUTLINED_FUNCTION_11_1();
  v2[21] = OUTLINED_FUNCTION_11_1();
  v2[22] = OUTLINED_FUNCTION_11_1();
  return swift_task_switch();
}

void sub_2463A2314()
{
  _QWORD *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[22];
  v3 = v0[18];
  v2 = v0[19];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  v0[23] = v4;
  v5 = *(void (**)(NSObject *, uint64_t, uint64_t))(v2 + 16);
  v0[24] = v5;
  v5(v1, v4, v3);
  swift_retain_n();
  sub_2463C05A0();
  v6 = OUTLINED_FUNCTION_14_1();
  v7 = os_log_type_enabled(v1, v6);
  v8 = v0[22];
  v9 = v0[19];
  v30 = v0[18];
  v10 = v0[10];
  if (v7)
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_5();
    v12 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v11 = 136315138;
    v31 = v12;
    v13 = *(_QWORD *)(v10 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
    v0[7] = v13;
    sub_2463A3888(v13);
    v14 = sub_2463C0624();
    v0[8] = sub_24639AE68(v14, v15, &v31);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_5();
    OUTLINED_FUNCTION_13_2(&dword_246381000, v1, v6, "ExecutionDeviceResolutionFlow.execute() %s", v11);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_9_5();

  v16 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v16(v8, v30);
  v0[25] = v16;
  v18 = v0[14];
  v17 = v0[15];
  v19 = v0[10] + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_input;
  swift_beginAccess();
  sub_24638C688(v19, v18, &qword_25756F940);
  if (__swift_getEnumTagSinglePayload(v18, 1, v17) == 1)
  {
    v20 = v0[21];
    v21 = v0[18];
    sub_24638C6C8(v0[14], &qword_25756F940);
    v5(v20, v4, v21);
    sub_2463C05A0();
    v22 = OUTLINED_FUNCTION_14_1();
    if (os_log_type_enabled(v20, v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v23 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v20, v22, "ExecutionDeviceResolutionFlow.execute() Input is nil. Error executing request", v23);
      OUTLINED_FUNCTION_0();
    }
    v24 = v0[21];
    v25 = v0[18];

    v16(v24, v25);
    OUTLINED_FUNCTION_13_5();
    OUTLINED_FUNCTION_12_5();
  }
  else
  {
    v26 = v0[10];
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[16] + 32))(v0[17], v0[14], v0[15]);
    if (*(_QWORD *)(v26 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state) != 0x8000000000000000)
    {
      sub_2463BFDFC();
      OUTLINED_FUNCTION_1_7();
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_50();
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_24_2();
      OUTLINED_FUNCTION_12_5();
      __asm { BR              X0 }
    }
    v27 = (_QWORD *)v0[10];
    __swift_project_boxed_opaque_existential_1(v27 + 2, v27[5]);
    __swift_project_boxed_opaque_existential_1(v27 + 7, v27[10]);
    v0[26] = sub_2463B1474();
    v28 = (_QWORD *)swift_task_alloc();
    v0[27] = v28;
    *v28 = v0;
    v28[1] = sub_2463A2720;
    OUTLINED_FUNCTION_12_5();
    sub_2463C0528();
  }
}

uint64_t sub_2463A2720(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 232) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_2463A279C()
{
  _QWORD *v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[10] + 56), *(_QWORD *)(v0[10] + 80));
  sub_2463BFFE8();
  v1 = (_QWORD *)swift_task_alloc();
  v0[30] = v1;
  *v1 = v0;
  v1[1] = sub_2463A281C;
  return sub_2463B14E0(v0[13], v0[29]);
}

uint64_t sub_2463A281C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v2;
  v5 = *(_QWORD *)(*v2 + 96);
  v4 = *(_QWORD *)(*v2 + 104);
  v6 = *(_QWORD *)(*v2 + 88);
  *(_QWORD *)(v3 + 248) = a1;
  *(_BYTE *)(v3 + 256) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  return swift_task_switch();
}

uint64_t sub_2463A28A4()
{
  uint64_t v0;
  void *v1;
  char v2;

  v1 = *(void **)(v0 + 248);
  v2 = *(_BYTE *)(v0 + 256);
  sub_2463A2B24((uint64_t)v1, v2, *(_QWORD *)(v0 + 72));
  sub_2463A3C04(v1, v2);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2463A291C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  v1 = *(void **)(v0 + 224);
  v2 = *(void (**)(uint64_t))(v0 + 192);
  swift_bridgeObjectRelease();
  v3 = OUTLINED_FUNCTION_17_5();
  v2(v3);
  v4 = v1;
  v5 = v1;
  v6 = sub_2463C05A0();
  v7 = sub_2463C072C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(void **)(v0 + 224);
    v9 = (uint8_t *)OUTLINED_FUNCTION_5();
    v10 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v9 = 136315138;
    v20 = v10;
    *(_QWORD *)(v0 + 40) = v8;
    v11 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756F180);
    v12 = sub_2463C0624();
    *(_QWORD *)(v0 + 48) = sub_24639AE68(v12, v13, &v20);
    sub_2463C078C();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_13_2(&dword_246381000, v6, v7, "Failure getting devicesMatching: %s", v9);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  v14 = *(void **)(v0 + 224);
  v15 = *(void (**)(uint64_t, uint64_t))(v0 + 200);
  v16 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 144);

  v15(v16, v17);
  v18 = *(void **)(v0 + 224);
  sub_2463BFDFC();

  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2463A2B24(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD v12[3];

  v12[0] = a1;
  v12[2] = a3;
  v4 = OUTLINED_FUNCTION_7_2();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v12 - v7;
  if (qword_25756EFB8 != -1)
    swift_once();
  __swift_project_value_buffer(v4, (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_24_4((uint64_t)v8);
  v9 = sub_2463C05A0();
  v10 = sub_2463C0720();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v11 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v9, v10, "ExecutionDeviceResolutionFlow.handleProcessDevicesResult()", v11);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  __asm { BR              X10 }
}

void sub_2463A2F64(NSObject *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(unint64_t, NSObject *, uint64_t);
  uint64_t v30;
  int v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void (*v56)(unint64_t, uint64_t);
  id v57;
  char *v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  NSObject *v72;
  unint64_t v73;
  void (*v74)(char *, uint64_t, uint64_t);
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;

  v72 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570400);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_94_0();
  v68 = v2;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)&v65 - v4;
  v69 = sub_2463BFFD0();
  v5 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570408);
  v8 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  OUTLINED_FUNCTION_94_0();
  v66 = v9;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (unint64_t)&v65 - v11;
  v13 = OUTLINED_FUNCTION_7_2();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_94_0();
  v77 = v15;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v16);
  v67 = (char *)&v65 - v17;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v65 - v19;
  if (qword_25756EFB8 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v13, (uint64_t)qword_2575745E0);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v78 = v13;
  v74 = v22;
  v22(v20, v21, v13);
  v23 = sub_2463C05A0();
  v24 = sub_2463C0720();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v25 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v23, v24, "ExecutionDeviceResolutionFlow.processConfirmationResult()", v25);
    OUTLINED_FUNCTION_0();
  }

  v26 = v78;
  v75 = *(void (**)(char *, uint64_t))(v14 + 8);
  v75(v20, v78);
  v27 = OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state;
  v28 = v71;
  v73 = *(_QWORD *)(v71 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state);
  if (v73 >> 62)
  {
    OUTLINED_FUNCTION_13_5();
    __break(1u);
    return;
  }
  v29 = *(void (**)(unint64_t, NSObject *, uint64_t))(v8 + 16);
  v30 = v76;
  v29(v12, v72, v76);
  v31 = (*(uint64_t (**)(unint64_t, uint64_t))(v8 + 88))(v12, v30);
  if (v31 == *MEMORY[0x24BE97938])
  {
    (*(void (**)(unint64_t, uint64_t))(v8 + 96))(v12, v30);
    v32 = v69;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 32))(v7, v12, v69);
    v33 = OUTLINED_FUNCTION_19_4();
    v34 = (uint64_t)v70;
    sub_2463BFFC4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v32);
    v35 = sub_2463BFEC8();
    if (__swift_getEnumTagSinglePayload(v34, 1, v35) != 1)
    {
      v41 = v68;
      sub_24638C688(v34, v68, &qword_257570400);
      v42 = *(_QWORD *)(v35 - 8);
      v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 88))(v41, v35);
      if (v43 == *MEMORY[0x24BE98400])
      {
        *(_QWORD *)(v28 + v27) = v12 | 0x4000000000000000;
        v44 = v33;
        goto LABEL_15;
      }
      if (v43 == *MEMORY[0x24BE983F8])
      {
        OUTLINED_FUNCTION_32_4();
        goto LABEL_9;
      }
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v35);
    }
    v36 = 0x8000000000000018;
LABEL_9:
    *(_QWORD *)(v28 + v27) = v36;
LABEL_15:
    OUTLINED_FUNCTION_15_4();
    sub_24638C6C8(v34, &qword_257570400);
    v39 = v77;
    v26 = v78;
    goto LABEL_16;
  }
  if (v31 == *MEMORY[0x24BE97930])
  {
    (*(void (**)(unint64_t, uint64_t))(v8 + 96))(v12, v76);
    v37 = *(void **)v12;
    OUTLINED_FUNCTION_19_4();
    v38 = v37;
    v26 = v78;

  }
  else
  {
    if (v31 == *MEMORY[0x24BE97940])
    {
      OUTLINED_FUNCTION_32_4();
      *(_QWORD *)(v28 + v27) = v53;
      OUTLINED_FUNCTION_19_4();
      v54 = v26;
      v26 = v78;
      sub_2463A38AC(v54);
      v39 = v77;
      goto LABEL_16;
    }
    if (v31 != *MEMORY[0x24BE97928])
    {
      v55 = v26;
      v56 = *(void (**)(unint64_t, uint64_t))(v28 + v27);
      *(_QWORD *)(v28 + v27) = 0x8000000000000018;
      v57 = (id)v73;
      OUTLINED_FUNCTION_15_4();
      v58 = v67;
      v74(v67, v21, v55);
      v59 = v76;
      v29(v66, v72, v76);
      v60 = sub_2463C05A0();
      v61 = sub_2463C072C();
      if (os_log_type_enabled(v60, v61))
      {
        v72 = v60;
        v62 = (uint8_t *)OUTLINED_FUNCTION_5();
        v70 = (char *)OUTLINED_FUNCTION_5();
        v80 = v70;
        *(_DWORD *)v62 = 136315138;
        v69 = (uint64_t)(v62 + 4);
        sub_2463A3EB8(&qword_257570410, &qword_257570408);
        v63 = sub_2463C08F4();
        v79 = sub_24639AE68(v63, v64, (uint64_t *)&v80);
        sub_2463C078C();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_18_4();
        OUTLINED_FUNCTION_13_2(&dword_246381000, v72, v61, "ExecutionDeviceResolutionFlow.processConfirmationResult() received unknown result: %s. Setting flow to .failure state.", v62);
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_18_4();

      v75(v58, v78);
      v56(v12, v59);
      v39 = v77;
      v26 = v78;
      v12 = v73;
      goto LABEL_16;
    }
    OUTLINED_FUNCTION_19_4();
  }
  v39 = v77;
  v40 = *(_QWORD *)(v28 + v27);
  *(_QWORD *)(v28 + v27) = 0x8000000000000018;
  sub_2463A38AC(v40);
LABEL_16:
  if (qword_25756EFB0 != -1)
    swift_once();
  v45 = __swift_project_value_buffer(v26, (uint64_t)qword_2575745C8);
  v74((char *)v39, v45, v26);
  swift_retain_n();
  sub_2463C05A0();
  v46 = v28;
  v47 = OUTLINED_FUNCTION_14_1();
  if (os_log_type_enabled(v39, v47))
  {
    v48 = (uint8_t *)OUTLINED_FUNCTION_5();
    v49 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v48 = 136315138;
    v80 = (char *)v49;
    v79 = *(_QWORD *)(v46 + v27);
    sub_2463A3888(v79);
    v50 = sub_2463C0624();
    v79 = sub_24639AE68(v50, v51, (uint64_t *)&v80);
    sub_2463C078C();
    OUTLINED_FUNCTION_9_5();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13_2(&dword_246381000, v39, v47, "ExecutionDeviceResolutionFlow.processConfirmationResult() state after processConfirmationResult: %s", v48);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  sub_2463A38AC(v12);

  OUTLINED_FUNCTION_9_5();
  v52 = OUTLINED_FUNCTION_17_5();
  ((void (*)(uint64_t))v75)(v52);
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_2463A3708()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  sub_24638C6C8(v0 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_input, &qword_25756F940);
  sub_2463A38AC(*(_QWORD *)(v0 + OBJC_IVAR____TtC20SiriIdentityInternal29ExecutionDeviceResolutionFlow_state));
  return v0;
}

uint64_t sub_2463A376C()
{
  sub_2463A3708();
  return swift_deallocClassInstance();
}

uint64_t sub_2463A3790()
{
  return type metadata accessor for ExecutionDeviceResolutionFlow();
}

uint64_t type metadata accessor for ExecutionDeviceResolutionFlow()
{
  uint64_t result;

  result = qword_2575702C8;
  if (!qword_2575702C8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2463A37D0()
{
  unint64_t v0;

  sub_24638B774();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

unint64_t *initializeBufferWithCopyOfBuffer for ExecutionDeviceResolutionFlow.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_2463A3888(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_2463A3888(unint64_t result)
{
  if (result >> 62)
  {
    if (result >> 62 != 1)
      return result;
    result &= 0x3FFFFFFFFFFFFFFFuLL;
  }
  return (unint64_t)(id)result;
}

void destroy for ExecutionDeviceResolutionFlow.State(unint64_t *a1)
{
  sub_2463A38AC(*a1);
}

void sub_2463A38AC(unint64_t a1)
{
  if (a1 >> 62)
  {
    if (a1 >> 62 != 1)
      return;
    a1 &= 0x3FFFFFFFFFFFFFFFuLL;
  }

}

unint64_t *assignWithCopy for ExecutionDeviceResolutionFlow.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_2463A3888(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_2463A38AC(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for ExecutionDeviceResolutionFlow.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_2463A38AC(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionDeviceResolutionFlow.State(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 125;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7D)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for ExecutionDeviceResolutionFlow.State(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2463A39E0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_2463A39FC(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2463A3A0C(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 2)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 2);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for ExecutionDeviceResolutionFlow.State()
{
  return &type metadata for ExecutionDeviceResolutionFlow.State;
}

uint64_t sub_2463A3A48(uint64_t a1)
{
  sub_2463A20DC(a1);
  return 1;
}

uint64_t sub_2463A3A6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2463A3AD4;
  return sub_2463BFB74();
}

uint64_t sub_2463A3AD4(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_2_3();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_2463A3B08()
{
  return sub_2463A21E8();
}

uint64_t sub_2463A3B28(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24638966C;
  return sub_2463A2258(a1);
}

void sub_2463A3B7C(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_2463A207C();
  *a1 = v2;
}

unint64_t sub_2463A3BA4()
{
  unint64_t result;

  result = qword_2575703F8;
  if (!qword_2575703F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575703F8);
  }
  return result;
}

id sub_2463A3BE0(id result, char a2)
{
  if (a2 == 2 || a2 == 1)
    return result;
  if (!a2)
    return (id)swift_bridgeObjectRetain();
  return result;
}

void sub_2463A3C04(void *a1, char a2)
{
  if (a2 == 2 || a2 == 1)
  {

  }
  else if (!a2)
  {
    swift_bridgeObjectRelease();
  }
}

_QWORD *sub_2463A3C28(__int128 *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12[2];
  _BYTE v13[40];
  _BYTE v14[40];
  _QWORD __src[11];
  _QWORD v16[5];

  v16[3] = type metadata accessor for BaseDialogProvider();
  v16[4] = &off_251795888;
  v16[0] = a2;
  a4[19] = 0xD00000000000002DLL;
  a4[20] = 0x80000002463C5180;
  sub_24638C500((uint64_t)a1, (uint64_t)(a4 + 2));
  sub_24638C500((uint64_t)v16, (uint64_t)v14);
  sub_24638C500((uint64_t)a1, (uint64_t)v13);
  sub_24638C500((uint64_t)v14, (uint64_t)__src);
  sub_24638C688((uint64_t)v13, (uint64_t)&v10, &qword_25756F950);
  if (v11)
  {
    sub_24638C6C8((uint64_t)v13, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    sub_246389878(&v10, (uint64_t)v12);
  }
  else
  {
    sub_2463C0030();
    sub_24638C6C8((uint64_t)v13, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    sub_24638C6C8((uint64_t)&v10, &qword_25756F950);
  }
  sub_246389878(v12, (uint64_t)&__src[5]);
  sub_24638C500((uint64_t)&__src[5], (uint64_t)v12);
  type metadata accessor for LocUtil();
  v7 = swift_allocObject();
  sub_246389878(v12, v7 + 16);
  swift_release();
  __src[10] = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  memcpy(a4 + 7, __src, 0x58uLL);
  v8 = swift_allocObject();
  sub_246389878(a1, v8 + 16);
  a4[18] = v8;
  return a4;
}

_QWORD *sub_2463A3DD4(__int128 *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v14[3];
  uint64_t v15;
  char **v16;

  v15 = type metadata accessor for BaseDialogProvider();
  v16 = &off_251795888;
  v14[0] = a2;
  type metadata accessor for DeviceConfirmationStrategy();
  v6 = (_QWORD *)swift_allocObject();
  v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_QWORD *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  v11 = sub_2463A3C28(a1, *v9, a3, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v11;
}

void sub_2463A3EB8(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_21_3();
  }
  OUTLINED_FUNCTION_25();
}

void sub_2463A3EEC(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_21_3();
  }
  OUTLINED_FUNCTION_25();
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[16] + 8))(v0[17], v0[15]);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return sub_2463C08A0();
}

void OUTLINED_FUNCTION_15_4()
{
  unint64_t v0;

  sub_2463A38AC(v0);
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

id OUTLINED_FUNCTION_19_4()
{
  uint64_t v0;

  return *(id *)(v0 - 144);
}

void OUTLINED_FUNCTION_21_3()
{
  JUMPOUT(0x249559D74);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_2463BFDFC();
}

uint64_t OUTLINED_FUNCTION_24_4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

id sub_2463A3FEC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[3];

  v1 = v0;
  v2 = sub_2463C05B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24639B5D8(v1);
  v7 = v6;
  swift_bridgeObjectRelease();
  if (!v7)
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v2, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    v9 = sub_2463C05A0();
    v10 = sub_2463C072C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_246381000, v9, v10, "ProfileId is nil for the account while creating disambiguation option direct invocation command", v11, 2u);
      MEMORY[0x249559E1C](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_2463A4364();
  if (qword_25756EF50 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v12 = sub_2463A42F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570438);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2463C1B70;
  v25[1] = 0x696669746E656469;
  v25[2] = 0xEA00000000007265;
  v14 = MEMORY[0x24BEE0D00];
  sub_2463C07BC();
  v15 = sub_24639B5D8(v1);
  *(_QWORD *)(inited + 96) = v14;
  if (v16)
    v17 = v15;
  else
    v17 = 0;
  v18 = 0xE000000000000000;
  if (v16)
    v18 = v16;
  *(_QWORD *)(inited + 72) = v17;
  *(_QWORD *)(inited + 80) = v18;
  v19 = sub_2463C05E8();
  sub_2463A43A0(v19, v12);
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE99160]), sel_init);
  objc_msgSend(v20, sel_setInputOrigin_, *MEMORY[0x24BE821C0]);
  objc_msgSend(v20, sel_setInteractionType_, *MEMORY[0x24BE82230]);
  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_runSiriKitExecutorCommandWithContext_payload_, v20, v12);
  v23 = objc_msgSend(v21, sel_wrapCommandInStartLocalRequest_, v22);

  return v23;
}

id sub_2463A42F4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2463C060C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

unint64_t sub_2463A4364()
{
  unint64_t result;

  result = qword_257570430;
  if (!qword_257570430)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257570430);
  }
  return result;
}

void sub_2463A43A0(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_2463C05C4();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);

}

void sub_2463A440C()
{
  qword_257570440 = 0x736C6562614CLL;
  *(_QWORD *)algn_257570448 = 0xE600000000000000;
}

uint64_t sub_2463A442C(uint64_t a1, uint64_t a2)
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
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjCClassFromMetadata;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v5 = sub_2463BF94C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 40));
  sub_2463BFC4C();
  v30 = sub_2463BF940();
  v31 = v9;
  v28 = 45;
  v29 = 0xE100000000000000;
  v26 = 95;
  v27 = 0xE100000000000000;
  sub_2463A46BC();
  v10 = sub_2463C07A4();
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!v13)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();
    return 0;
  }
  v14 = v13;
  v24 = v6;
  v25 = v5;
  v15 = a2;
  if (qword_25756EF68 != -1)
    swift_once();
  v16 = qword_257570440;
  v17 = *(_QWORD *)algn_257570448;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v19 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v20 = objc_msgSend(v19, sel_bundleForClass_, ObjCClassFromMetadata, v24, v25);
  v21 = sub_2463A46F8(a1, v15, v16, v17, (uint64_t)v20, v10, v12, v14);

  swift_bridgeObjectRelease();
  if (!v21)
  {
    OUTLINED_FUNCTION_0_3();
    return 0;
  }
  v22 = sub_2463C0618();

  OUTLINED_FUNCTION_0_3();
  return v22;
}

uint64_t sub_2463A4678()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LocUtil()
{
  return objc_opt_self();
}

unint64_t sub_2463A46BC()
{
  unint64_t result;

  result = qword_2575704F8;
  if (!qword_2575704F8)
  {
    result = MEMORY[0x249559D74](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2575704F8);
  }
  return result;
}

id sub_2463A46F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v10 = (void *)sub_2463C060C();
  v11 = (void *)sub_2463C060C();
  v12 = (void *)sub_2463C060C();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(a8, sel_localizedStringForKey_table_bundle_languageCode_, v10, v11, a5, v12);

  return v13;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 144) + 8))(v0, *(_QWORD *)(v1 - 136));
}

void (*sub_2463A47BC())(void)
{
  return sub_2463A4930(MEMORY[0x24BEA87E8], "SiriEnvironment.getCurrentDevice : Couldn't get forCurrentTask");
}

uint64_t static SiriEnvironment.getUserIdentity()()
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

  v0 = sub_2463C05B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2463C03E4();
  if (sub_2463C03CC())
  {
    sub_2463C03B4();
    OUTLINED_FUNCTION_2_8();
  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v4 = __swift_project_value_buffer(v0, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
    v5 = sub_2463C05A0();
    v6 = sub_2463C072C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_246381000, v5, v6, "SiriEnvironment.getUserIdentity : Couldn't get forCurrentTask", v7, 2u);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  return v0;
}

void (*sub_2463A491C())(void)
{
  return sub_2463A4930((void (*)(void))MEMORY[0x24BE92EC0], "SiriEnvironment.getCurrentRequest : Couldn't get forCurrentTask.");
}

void (*sub_2463A4930(void (*a1)(void), const char *a2))(void)
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

  v4 = sub_2463C05B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2463C03E4();
  if (!sub_2463C03CC())
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
    v9 = sub_2463C05A0();
    v10 = sub_2463C072C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_246381000, v9, v10, a2, v11, 2u);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sub_2463C03D8();
  }
  a1();
  OUTLINED_FUNCTION_2_8();
  return a1;
}

uint64_t sub_2463A4A94(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return swift_release();
}

id sub_2463A4AB0(void *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;

  v2 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v3 = objc_msgSend(a1, sel_displayString);
  v4 = sub_2463C0618();
  v6 = v5;

  sub_2463A4C14(v4, v6, v2);
  v7 = objc_msgSend(a1, sel_isActive);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_BOOLValue);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v2, sel_setActiveProfile_, v9);
  v10 = sub_24639B5D8(a1);
  if (v11)
  {
    v12 = (void *)sub_2463C060C();
    v10 = swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  OUTLINED_FUNCTION_0_4(v10, sel_setProfileIdentifier_);

  v13 = sub_2463A4C64(a1);
  if (v14 >> 60 == 15)
  {
    v15 = 0;
  }
  else
  {
    v16 = v13;
    v17 = v14;
    v15 = (void *)sub_2463BF8F8();
    v13 = sub_2463A1868(v16, v17);
  }
  OUTLINED_FUNCTION_0_4(v13, sel_setProfileImage_);

  return v2;
}

void sub_2463A4C14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463C060C();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setFullName_, v4);

}

uint64_t sub_2463A4C64(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_profileImage);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2463BF904();

  return v3;
}

id OUTLINED_FUNCTION_0_4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t _s24UserIdentityOntologyNodeCMa()
{
  uint64_t result;

  result = qword_257570520;
  if (!qword_257570520)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2463A4D08()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2463A4D58()
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
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  v2 = qword_257570500;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756EFE8);
  swift_allocObject();
  swift_retain();
  OUTLINED_FUNCTION_1_1();
  v4 = OUTLINED_FUNCTION_4_2();
  *(_QWORD *)(v0 + v2) = v4;
  v5 = qword_257570508;
  OUTLINED_FUNCTION_0_5();
  *(_QWORD *)(v0 + v5) = OUTLINED_FUNCTION_4_2();
  v6 = qword_257570510;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v0 + v6) = OUTLINED_FUNCTION_4_2();
  v7 = qword_257570518;
  OUTLINED_FUNCTION_0_5();
  v8 = OUTLINED_FUNCTION_4_2();
  *(_QWORD *)(v1 + v7) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F5E0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2463C2280;
  *(_QWORD *)(v9 + 56) = v3;
  v10 = sub_2463A4FEC();
  *(_QWORD *)(v9 + 32) = v4;
  v11 = *(_QWORD *)(v1 + v5);
  *(_QWORD *)(v9 + 96) = v3;
  *(_QWORD *)(v9 + 104) = v10;
  *(_QWORD *)(v9 + 64) = v10;
  *(_QWORD *)(v9 + 72) = v11;
  v12 = *(_QWORD *)(v1 + v6);
  *(_QWORD *)(v9 + 136) = v3;
  *(_QWORD *)(v9 + 144) = v10;
  *(_QWORD *)(v9 + 112) = v12;
  *(_QWORD *)(v9 + 176) = v3;
  *(_QWORD *)(v9 + 184) = v10;
  *(_QWORD *)(v9 + 152) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  return sub_2463C0138();
}

void sub_2463A4F04()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2463A4F30()
{
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_3_10();
  return swift_release();
}

uint64_t sub_2463A4F70()
{
  uint64_t v0;

  v0 = sub_2463C0144();
  swift_release();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_2_9();
  return v0;
}

uint64_t sub_2463A4FC8()
{
  sub_2463A4F70();
  return swift_deallocClassInstance();
}

uint64_t sub_2463A4FE4()
{
  return _s24UserIdentityOntologyNodeCMa();
}

unint64_t sub_2463A4FEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25756F5F8;
  if (!qword_25756F5F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25756EFE8);
    result = MEMORY[0x249559D74](MEMORY[0x24BE9EF30], v1);
    atomic_store(result, (unint64_t *)&qword_25756F5F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return swift_release();
}

uint64_t sub_2463A5050(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  v3[10] = OUTLINED_FUNCTION_3_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756FD10);
  v3[11] = OUTLINED_FUNCTION_3_4();
  v4 = sub_2463BFE98();
  v3[12] = v4;
  v3[13] = *(_QWORD *)(v4 - 8);
  v3[14] = OUTLINED_FUNCTION_11_1();
  v3[15] = OUTLINED_FUNCTION_11_1();
  v3[16] = OUTLINED_FUNCTION_11_1();
  v5 = sub_2463C05B8();
  v3[17] = v5;
  v3[18] = *(_QWORD *)(v5 - 8);
  v3[19] = OUTLINED_FUNCTION_3_4();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A5108()
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
  void *v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  char v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);

  if (qword_25756EFB8 != -1)
    swift_once();
  v2 = v0[18];
  v1 = v0[19];
  v3 = v0[17];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_2463C05A0();
  v6 = sub_2463C0720();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_246381000, v5, v6, "EstablishUserHandleIntentStrategy.makeIntentHandledResponse()", v7, 2u);
    MEMORY[0x249559E1C](v7, -1, -1);
  }
  v9 = v0[18];
  v8 = v0[19];
  v10 = v0[17];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570678);
  v11 = (void *)sub_2463BFF4C();
  v12 = objc_msgSend(v11, sel_identity);
  v0[20] = v12;

  if (v12
    && (v13 = objc_msgSend(v12, sel_isMultiUserContext)) != 0
    && (v14 = v13, v15 = objc_msgSend(v13, sel_BOOLValue), v14, v15))
  {
    v16 = objc_msgSend(v12, sel_isIdentifiedOrUnsure);
    if (v16)
    {
      v17 = v16;
      v18 = objc_msgSend(v16, sel_BOOLValue);

    }
    else
    {
      v18 = 0;
    }
    sub_2463A1738(v12);
    if (v21)
    {
      sub_2463C063C();
      swift_bridgeObjectRelease();
      v22 = 0;
    }
    else
    {
      v22 = 1;
    }
    v23 = v0[11];
    v24 = sub_2463C0450();
    __swift_storeEnumTagSinglePayload(v23, v22, 1, v24);
    v25 = (_QWORD *)swift_task_alloc();
    v0[21] = v25;
    *v25 = v0;
    v25[1] = sub_2463A53C4;
    return sub_246395B9C(v0[15], v0[11], v18);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[9] + 16), *(_QWORD *)(v0[9] + 40));
    v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_257571530 + dword_257571530);
    v19 = (_QWORD *)swift_task_alloc();
    v0[23] = v19;
    *v19 = v0;
    v19[1] = sub_2463A5548;
    return v26(v0[14], 0xD00000000000001CLL, 0x80000002463C5320);
  }
}

uint64_t sub_2463A53C4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 176) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A5418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;

  sub_2463857A0(*(_QWORD *)(v2 + 88), &qword_25756FD10);
  v8 = *(void **)(v2 + 160);
  v3 = *(_QWORD *)(v2 + 104);
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_15_5(v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 128));
  sub_2463BFC58();
  v5 = OUTLINED_FUNCTION_13_6();
  v6 = OUTLINED_FUNCTION_4_11(v5);
  *(_OWORD *)(v2 + 32) = 0u;
  *(_QWORD *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 16) = 0u;
  OUTLINED_FUNCTION_12_6(v6, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_7_8();

  sub_2463857A0(v2 + 16, &qword_257570230);
  sub_2463857A0(v0, &qword_257570220);
  OUTLINED_FUNCTION_14_6(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  return OUTLINED_FUNCTION_1_8(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_2463A5548()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 192) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A559C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;

  v3 = *(_QWORD *)(v2 + 104);
  v8 = *(void **)(v2 + 160);
  OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_15_5(v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32));
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 128));
  sub_2463BFC58();
  v5 = OUTLINED_FUNCTION_13_6();
  v6 = OUTLINED_FUNCTION_4_11(v5);
  *(_OWORD *)(v2 + 32) = 0u;
  *(_QWORD *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 16) = 0u;
  OUTLINED_FUNCTION_12_6(v6, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_7_8();

  sub_2463857A0(v2 + 16, &qword_257570230);
  sub_2463857A0(v0, &qword_257570220);
  OUTLINED_FUNCTION_14_6(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  return OUTLINED_FUNCTION_1_8(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_2463A56BC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_14_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_2();
  return OUTLINED_FUNCTION_9_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463A5714()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);

  sub_2463857A0(v1, &qword_25756FD10);
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_14_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_24_2();
  return OUTLINED_FUNCTION_9_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463A5780()
{
  uint64_t v0;

  sub_24638C60C(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  swift_release();
  return v0;
}

uint64_t sub_2463A57AC()
{
  sub_2463A5780();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EstablishUserHandleIntentStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2463A57F0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF9A0();
}

uint64_t sub_2463A586C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF9AC();
}

uint64_t sub_2463A58E8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF970();
}

uint64_t sub_2463A5964(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463A5BF4;
  return sub_2463A5050(a1, a2);
}

uint64_t sub_2463A59C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF994();
}

uint64_t sub_2463A5A44()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF988();
}

uint64_t sub_2463A5AC0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for EstablishUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5B3C;
  return sub_2463BF964();
}

uint64_t sub_2463A5B3C()
{
  uint64_t *v0;
  uint64_t v2;

  OUTLINED_FUNCTION_26();
  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2463A5B7C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_246389250();
  return sub_2463897E8(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

unint64_t sub_2463A5BB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257570638[0];
  if (!qword_257570638[0])
  {
    v1 = type metadata accessor for EstablishUserHandleIntentStrategy();
    result = MEMORY[0x249559D74]("m/=\v", v1);
    atomic_store(result, qword_257570638);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_4_11(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_2463C0060();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return sub_2463BFDB4();
}

uint64_t *OUTLINED_FUNCTION_12_6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  v2[3] = a1;
  v2[4] = a2;
  return __swift_allocate_boxed_opaque_existential_1Tm(v2);
}

uint64_t OUTLINED_FUNCTION_13_6()
{
  return sub_2463BFE80();
}

uint64_t OUTLINED_FUNCTION_14_6@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_15_5@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

double sub_2463A5CA0@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  int v34;
  void (*v35)(char *, uint64_t *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *boxed_opaque_existential_1Tm;
  double result;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(__int128 *__return_ptr, uint64_t *);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  __int128 v82;

  v80 = a2;
  v3 = sub_2463C0084();
  v70 = *(_QWORD *)(v3 - 8);
  v71 = v3;
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_47_0();
  v68 = v5;
  v6 = sub_2463C0048();
  v73 = *(_QWORD *)(v6 - 8);
  v74 = v6;
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_47_0();
  v72 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570260);
  v76 = *(_QWORD *)(v9 - 8);
  v77 = v9;
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2463C05B8();
  v78 = *(_QWORD *)(v13 - 8);
  v79 = v13;
  OUTLINED_FUNCTION_8_6();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v69 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v67 = (char *)&v67 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v75 = (char *)&v67 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v67 - v21;
  v23 = sub_2463C0024();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (uint64_t *)((char *)&v67 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v27 = sub_2463C0384();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v67 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v67 - v32;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v24 + 16))(v26, a1, v23);
  v34 = (*(uint64_t (**)(uint64_t *, uint64_t))(v24 + 88))(v26, v23);
  if (v34 == *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_0_6();
LABEL_5:
    v35 = *(void (**)(char *, uint64_t *, uint64_t))(v28 + 32);
    v35(v33, v26, v27);
    v36 = v78;
    if (qword_25756EFC0 != -1)
      swift_once();
    v37 = v79;
    v38 = __swift_project_value_buffer(v79, (uint64_t)qword_2575745F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v22, v38, v37);
    v39 = sub_2463C05A0();
    v40 = sub_2463C0720();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v41 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v39, v40, "IdentityNLIntentHelper building NLv3 intent", v41);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v37);
    v35(v31, (uint64_t *)v33, v27);
    v42 = type metadata accessor for IdentityNLv3Intent();
    v43 = v80;
    v80[3] = v42;
    v43[4] = (uint64_t)&off_251794828;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v43);
    sub_246387568((uint64_t)v31, boxed_opaque_existential_1Tm);
    return result;
  }
  if (v34 == *MEMORY[0x24BE98E90])
  {
    OUTLINED_FUNCTION_0_6();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570748);
    swift_release();
    goto LABEL_5;
  }
  if (v34 == *MEMORY[0x24BE98E10])
  {
    OUTLINED_FUNCTION_0_6();
    v46 = *v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570270);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570278);
    sub_2463C03F0();
    v47 = v77;
    v48 = (void (*)(__int128 *__return_ptr, uint64_t *))sub_2463C03FC();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v12, v47);
    v81 = v46;
    v48(&v82, &v81);
    swift_release();
    sub_2463897F8((uint64_t)&v82);
    OUTLINED_FUNCTION_12_7();
    OUTLINED_FUNCTION_14_7();
  }
  else if (v34 == *MEMORY[0x24BE98E98])
  {
    OUTLINED_FUNCTION_0_6();
    v50 = v72;
    v49 = v73;
    v51 = v74;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v73 + 32))(v72, v26, v74);
    v52 = v68;
    sub_2463C003C();
    v53 = sub_2463C0120();
    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v52, v71);
    if (v53)
    {
      OUTLINED_FUNCTION_12_7();
      OUTLINED_FUNCTION_14_7();
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v50, v51);
    }
    else
    {
      if (qword_25756EFC0 != -1)
        swift_once();
      v60 = v79;
      v61 = __swift_project_value_buffer(v79, (uint64_t)qword_2575745F8);
      v62 = v78;
      v63 = v67;
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v67, v61, v60);
      v64 = sub_2463C05A0();
      v65 = sub_2463C072C();
      if (OUTLINED_FUNCTION_4_12(v65))
      {
        v66 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)v66 = 0;
        OUTLINED_FUNCTION_4_3(&dword_246381000, v64, (os_log_type_t)v63, "Unable to convert usoParse to legacy first dialog act", v66);
        OUTLINED_FUNCTION_0();
      }

      (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v60);
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v50, v51);
      return OUTLINED_FUNCTION_11_4();
    }
  }
  else
  {
    if (qword_25756EFC0 != -1)
      swift_once();
    v54 = v79;
    v55 = __swift_project_value_buffer(v79, (uint64_t)qword_2575745F8);
    v56 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v78 + 16))(v69, v55, v54);
    v57 = sub_2463C05A0();
    v58 = sub_2463C0720();
    if (OUTLINED_FUNCTION_4_12(v58))
    {
      v59 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v59 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v57, (os_log_type_t)v56, "#IdentityNLIntentHelper unrecognized parse type, not building intent.", v59);
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(char *, uint64_t))(v78 + 8))(v56, v79);
    OUTLINED_FUNCTION_11_4();
    (*(void (**)(uint64_t *, uint64_t))(v24 + 8))(v26, v23);
  }
  return result;
}

BOOL static IntentCaseType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void IntentCaseType.hash(into:)()
{
  sub_2463C0984();
  OUTLINED_FUNCTION_25();
}

uint64_t IntentCaseType.hashValue.getter()
{
  sub_2463C0978();
  sub_2463C0984();
  return sub_2463C0990();
}

BOOL sub_2463A6444(char *a1, char *a2)
{
  return static IntentCaseType.__derived_enum_equals(_:_:)(*a1, *a2);
}

uint64_t sub_2463A6450()
{
  return IntentCaseType.hashValue.getter();
}

void sub_2463A6458()
{
  IntentCaseType.hash(into:)();
}

SiriIdentityInternal::IdentityVerb_optional __swiftcall IdentityVerb.init(rawValue:)(Swift::String rawValue)
{
  SiriIdentityInternal::IdentityVerb_optional result;

  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_25();
  return result;
}

void *static IdentityVerb.allCases.getter()
{
  return &unk_2517943C0;
}

void IdentityVerb.rawValue.getter()
{
  OUTLINED_FUNCTION_13_7();
}

void sub_2463A64C0()
{
  sub_2463B04DC();
}

void sub_2463A64CC()
{
  sub_2463B05F4();
}

uint64_t sub_2463A64D4()
{
  return sub_2463B06F0();
}

void sub_2463A64DC()
{
  sub_2463B0890();
}

SiriIdentityInternal::IdentityVerb_optional sub_2463A64E4@<W0>(Swift::String *a1@<X0>, SiriIdentityInternal::IdentityVerb_optional *a2@<X8>)
{
  SiriIdentityInternal::IdentityVerb_optional result;

  result.value = IdentityVerb.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void sub_2463A6510(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  IdentityVerb.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_25();
}

void sub_2463A6534(_QWORD *a1@<X8>)
{
  *a1 = &unk_2517943C0;
}

uint64_t sub_2463A6544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2463A6C9C(a1, a2, a3, (void (*)(void))sub_2463A6F58, (void (*)(void))sub_2463A6F94, (void (*)(void))sub_2463A6FD0);
}

SiriIdentityInternal::IdentityNoun_optional __swiftcall IdentityNoun.init(rawValue:)(Swift::String rawValue)
{
  SiriIdentityInternal::IdentityNoun_optional result;

  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_25();
  return result;
}

void *static IdentityNoun.allCases.getter()
{
  return &unk_251794468;
}

void IdentityNoun.rawValue.getter()
{
  OUTLINED_FUNCTION_13_7();
}

unint64_t sub_2463A65C4()
{
  unint64_t result;

  result = qword_257570680;
  if (!qword_257570680)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IntentCaseType, &type metadata for IntentCaseType);
    atomic_store(result, (unint64_t *)&qword_257570680);
  }
  return result;
}

unint64_t sub_2463A6604()
{
  unint64_t result;

  result = qword_257570688;
  if (!qword_257570688)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityVerb, &type metadata for IdentityVerb);
    atomic_store(result, (unint64_t *)&qword_257570688);
  }
  return result;
}

unint64_t sub_2463A6644()
{
  unint64_t result;

  result = qword_257570690;
  if (!qword_257570690)
  {
    result = MEMORY[0x249559D74]("i0=\vdR", &type metadata for IdentityVerb);
    atomic_store(result, (unint64_t *)&qword_257570690);
  }
  return result;
}

uint64_t sub_2463A6680()
{
  return sub_2463A6D30(&qword_257570698, &qword_2575706A0);
}

unint64_t sub_2463A66A8()
{
  unint64_t result;

  result = qword_2575706A8;
  if (!qword_2575706A8)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityVerb, &type metadata for IdentityVerb);
    atomic_store(result, (unint64_t *)&qword_2575706A8);
  }
  return result;
}

void sub_2463A66E4()
{
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_25();
}

void *sub_2463A671C()
{
  return &unk_2517944F8;
}

void sub_2463A6728()
{
  OUTLINED_FUNCTION_13_7();
}

void sub_2463A6744()
{
  sub_2463B0544();
}

unint64_t sub_2463A6754()
{
  unint64_t result;

  result = qword_2575706B0;
  if (!qword_2575706B0)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityNoun, &type metadata for IdentityNoun);
    atomic_store(result, (unint64_t *)&qword_2575706B0);
  }
  return result;
}

void sub_2463A6790()
{
  sub_2463B0628();
}

uint64_t sub_2463A6798()
{
  return sub_2463B072C();
}

void sub_2463A67A0()
{
  sub_2463B0868();
}

SiriIdentityInternal::IdentityNoun_optional sub_2463A67A8@<W0>(Swift::String *a1@<X0>, SiriIdentityInternal::IdentityNoun_optional *a2@<X8>)
{
  SiriIdentityInternal::IdentityNoun_optional result;

  result.value = IdentityNoun.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void sub_2463A67D4(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  IdentityNoun.rawValue.getter();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_25();
}

unint64_t sub_2463A67FC()
{
  unint64_t result;

  result = qword_2575706B8;
  if (!qword_2575706B8)
  {
    result = MEMORY[0x249559D74]("9/=\vPQ", &type metadata for IdentityNoun);
    atomic_store(result, (unint64_t *)&qword_2575706B8);
  }
  return result;
}

uint64_t sub_2463A6838()
{
  return sub_2463A6D30(&qword_2575706C0, &qword_2575706C8);
}

void sub_2463A685C(_QWORD *a1@<X8>)
{
  *a1 = &unk_251794468;
}

unint64_t sub_2463A6870()
{
  unint64_t result;

  result = qword_2575706D0;
  if (!qword_2575706D0)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityNoun, &type metadata for IdentityNoun);
    atomic_store(result, (unint64_t *)&qword_2575706D0);
  }
  return result;
}

uint64_t sub_2463A68AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2463A6C9C(a1, a2, a3, (void (*)(void))sub_2463A6EA4, (void (*)(void))sub_2463A6EE0, (void (*)(void))sub_2463A6F1C);
}

void type metadata accessor for IntentCaseType()
{
  OUTLINED_FUNCTION_6_10();
}

uint64_t storeEnumTagSinglePayload for IdentityVerb(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_2463A6928 + 4 * byte_2463C23F5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2463A695C + 4 * byte_2463C23F0[v4]))();
}

uint64_t sub_2463A695C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463A6964(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463A696CLL);
  return result;
}

uint64_t sub_2463A6978(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463A6980);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2463A6984(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463A698C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for IdentityVerb()
{
  OUTLINED_FUNCTION_6_10();
}

uint64_t getEnumTagSinglePayload for IdentityFlowErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s20SiriIdentityInternal14IntentCaseTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2463A6A78 + 4 * byte_2463C23FF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2463A6AAC + 4 * byte_2463C23FA[v4]))();
}

uint64_t sub_2463A6AAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463A6AB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463A6ABCLL);
  return result;
}

uint64_t sub_2463A6AC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463A6AD0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2463A6AD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463A6ADC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for IdentityNoun()
{
  OUTLINED_FUNCTION_6_10();
}

uint64_t sub_2463A6AF4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2463A6B40 + 4 * byte_2463C2409[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2463A6B74 + 4 * byte_2463C2404[v4]))();
}

uint64_t sub_2463A6B74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463A6B7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463A6B84);
  return result;
}

uint64_t sub_2463A6B90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463A6B98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2463A6B9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463A6BA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for IdentityConfirmationValue()
{
  OUTLINED_FUNCTION_6_10();
}

unint64_t sub_2463A6BC0()
{
  unint64_t result;

  result = qword_2575706D8;
  if (!qword_2575706D8)
  {
    result = MEMORY[0x249559D74](&unk_2463C2824, &unk_251795548);
    atomic_store(result, (unint64_t *)&qword_2575706D8);
  }
  return result;
}

void sub_2463A6BFC()
{
  sub_2463B059C();
}

void sub_2463A6C08()
{
  sub_2463B0650();
}

uint64_t sub_2463A6C10()
{
  return sub_2463B0764();
}

void sub_2463A6C18()
{
  sub_2463B081C();
}

void sub_2463A6C20(_BYTE *a1@<X8>)
{
  char v2;

  sub_2463A66E4();
  *a1 = v2;
}

void sub_2463A6C4C(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_2463A6728();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_25();
}

void sub_2463A6C70(_QWORD *a1@<X8>)
{
  *a1 = &unk_2517944F8;
}

uint64_t sub_2463A6C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2463A6C9C(a1, a2, a3, (void (*)(void))sub_2463A6DF0, (void (*)(void))sub_2463A6E2C, (void (*)(void))sub_2463A6E68);
}

uint64_t sub_2463A6C9C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), void (*a5)(void), void (*a6)(void))
{
  a4();
  a5();
  a6();
  return sub_2463C02F4();
}

uint64_t sub_2463A6D0C()
{
  return sub_2463A6D30(&qword_2575706E0, &qword_2575706E8);
}

uint64_t sub_2463A6D30(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249559D74](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2463A6D74()
{
  unint64_t result;

  result = qword_2575706F0;
  if (!qword_2575706F0)
  {
    result = MEMORY[0x249559D74](&unk_2463C275C, &unk_251795548);
    atomic_store(result, (unint64_t *)&qword_2575706F0);
  }
  return result;
}

unint64_t sub_2463A6DB4()
{
  unint64_t result;

  result = qword_2575706F8;
  if (!qword_2575706F8)
  {
    result = MEMORY[0x249559D74](&unk_2463C2864, &unk_251795548);
    atomic_store(result, (unint64_t *)&qword_2575706F8);
  }
  return result;
}

unint64_t sub_2463A6DF0()
{
  unint64_t result;

  result = qword_257570700;
  if (!qword_257570700)
  {
    result = MEMORY[0x249559D74](&unk_2463C27C4, &unk_251795548);
    atomic_store(result, (unint64_t *)&qword_257570700);
  }
  return result;
}

unint64_t sub_2463A6E2C()
{
  unint64_t result;

  result = qword_257570708;
  if (!qword_257570708)
  {
    result = MEMORY[0x249559D74](&unk_2463C278C, &unk_251795548);
    atomic_store(result, (unint64_t *)&qword_257570708);
  }
  return result;
}

unint64_t sub_2463A6E68()
{
  unint64_t result;

  result = qword_257570710;
  if (!qword_257570710)
  {
    result = MEMORY[0x249559D74](&unk_2463C27EC, &unk_251795548);
    atomic_store(result, (unint64_t *)&qword_257570710);
  }
  return result;
}

unint64_t sub_2463A6EA4()
{
  unint64_t result;

  result = qword_257570718;
  if (!qword_257570718)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityNoun, &type metadata for IdentityNoun);
    atomic_store(result, (unint64_t *)&qword_257570718);
  }
  return result;
}

unint64_t sub_2463A6EE0()
{
  unint64_t result;

  result = qword_257570720;
  if (!qword_257570720)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityNoun, &type metadata for IdentityNoun);
    atomic_store(result, (unint64_t *)&qword_257570720);
  }
  return result;
}

unint64_t sub_2463A6F1C()
{
  unint64_t result;

  result = qword_257570728;
  if (!qword_257570728)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityNoun, &type metadata for IdentityNoun);
    atomic_store(result, (unint64_t *)&qword_257570728);
  }
  return result;
}

unint64_t sub_2463A6F58()
{
  unint64_t result;

  result = qword_257570730;
  if (!qword_257570730)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityVerb, &type metadata for IdentityVerb);
    atomic_store(result, (unint64_t *)&qword_257570730);
  }
  return result;
}

unint64_t sub_2463A6F94()
{
  unint64_t result;

  result = qword_257570738;
  if (!qword_257570738)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityVerb, &type metadata for IdentityVerb);
    atomic_store(result, (unint64_t *)&qword_257570738);
  }
  return result;
}

unint64_t sub_2463A6FD0()
{
  unint64_t result;

  result = qword_257570740;
  if (!qword_257570740)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for IdentityVerb, &type metadata for IdentityVerb);
    atomic_store(result, (unint64_t *)&qword_257570740);
  }
  return result;
}

uint64_t sub_2463A700C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(__int128 *__return_ptr, uint64_t *);
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22[2];

  v19 = a2;
  v3 = sub_2463C05B8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570260);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570270);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570278);
  sub_2463C03F0();
  v12 = (void (*)(__int128 *__return_ptr, uint64_t *))sub_2463C03FC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v20 = a1;
  v12(&v21, &v20);
  swift_release();
  sub_246389878(&v21, (uint64_t)v22);
  if (qword_25756EFC0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v13, v3);
  v14 = sub_2463C05A0();
  v15 = sub_2463C0720();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_246381000, v14, v15, "IdentityNLIntentHelper building NLv4 intent", v16, 2u);
    MEMORY[0x249559E1C](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return sub_246389878(v22, v19);
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 96))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return swift_bridgeObjectRelease();
}

BOOL OUTLINED_FUNCTION_4_12(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return sub_2463C08D0();
}

double OUTLINED_FUNCTION_11_4()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = *(_QWORD *)(v0 - 152);
  *(_QWORD *)(v1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2463A700C(v0, *(_QWORD *)(v1 - 152));
}

uint64_t OUTLINED_FUNCTION_14_7()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_2463A73C8()
{
  uint64_t v0;
  void *v2;
  uint64_t v3;

  if (!*(_QWORD *)(v0 + 16))
    return 0;
  v2 = *(void **)(v0 + 16);
  sub_2463A7414(&v2, &v3);
  return v3;
}

uint64_t sub_2463A7414@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t result;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v3 = *a1;
  v4 = (void *)sub_2463C060C();
  v5 = objc_msgSend(v3, sel_objectForKey_, v4);

  if (v5)
  {
    sub_2463C07B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_2463A7520((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    result = sub_246389E40((uint64_t)v8);
    goto LABEL_8;
  }
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_8:
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

uint64_t type metadata accessor for UserDefaultsProvider()
{
  return objc_opt_self();
}

uint64_t sub_2463A7520(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F730);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2463A7568()
{
  uint64_t v0;
  id v1;

  v1 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  *(_QWORD *)(v0 + 16) = sub_2463A75B8(0xD000000000000017, 0x80000002463C45E0);
  return v0;
}

id sub_2463A75B8(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_2463C060C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t *sub_2463A7618(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2463BF934();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v10 = a3[5];
    v11 = a3[6];
    v12 = (uint64_t *)((char *)a1 + v10);
    v13 = (uint64_t *)((char *)a2 + v10);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    v15 = (uint64_t *)((char *)a1 + v11);
    v16 = (uint64_t *)((char *)a2 + v11);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = a3[7];
    v19 = a3[8];
    v20 = (uint64_t *)((char *)a1 + v18);
    v21 = (uint64_t *)((char *)a2 + v18);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = v21[3];
    v20[2] = v21[2];
    v20[3] = v23;
    v24 = v21[5];
    v20[4] = v21[4];
    v20[5] = v24;
    v25 = v21[7];
    v20[6] = v21[6];
    v20[7] = v25;
    v26 = v21[9];
    v20[8] = v21[8];
    v20[9] = v26;
    v27 = v21[11];
    v20[10] = v21[10];
    v20[11] = v27;
    v20[12] = v21[12];
    *((_BYTE *)a1 + v19) = *((_BYTE *)a2 + v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2463A77B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2463BF934();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v2))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *sub_2463A7868(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_2463BF934();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *((_QWORD *)v11 + 1);
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *((_QWORD *)v10 + 1) = v12;
  v13 = &a1[v9];
  v14 = &a2[v9];
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  v16 = a3[7];
  v17 = a3[8];
  v18 = &a1[v16];
  v19 = &a2[v16];
  v20 = *((_QWORD *)v19 + 1);
  *(_QWORD *)v18 = *(_QWORD *)v19;
  *((_QWORD *)v18 + 1) = v20;
  v21 = *((_QWORD *)v19 + 3);
  *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
  *((_QWORD *)v18 + 3) = v21;
  v22 = *((_QWORD *)v19 + 5);
  *((_QWORD *)v18 + 4) = *((_QWORD *)v19 + 4);
  *((_QWORD *)v18 + 5) = v22;
  v23 = *((_QWORD *)v19 + 7);
  *((_QWORD *)v18 + 6) = *((_QWORD *)v19 + 6);
  *((_QWORD *)v18 + 7) = v23;
  v24 = *((_QWORD *)v19 + 9);
  *((_QWORD *)v18 + 8) = *((_QWORD *)v19 + 8);
  *((_QWORD *)v18 + 9) = v24;
  v25 = *((_QWORD *)v19 + 11);
  *((_QWORD *)v18 + 10) = *((_QWORD *)v19 + 10);
  *((_QWORD *)v18 + 11) = v25;
  *((_QWORD *)v18 + 12) = *((_QWORD *)v19 + 12);
  a1[v17] = a2[v17];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_2463A79D4(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;

  v6 = sub_2463BF934();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[6];
  v15 = &a1[v14];
  v16 = &a2[v14];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_QWORD *)v18 = *(_QWORD *)&a2[v17];
  *((_QWORD *)v18 + 1) = *(_QWORD *)&a2[v17 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
  *((_QWORD *)v18 + 3) = *((_QWORD *)v19 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 4) = *((_QWORD *)v19 + 4);
  *((_QWORD *)v18 + 5) = *((_QWORD *)v19 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 6) = *((_QWORD *)v19 + 6);
  *((_QWORD *)v18 + 7) = *((_QWORD *)v19 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 8) = *((_QWORD *)v19 + 8);
  *((_QWORD *)v18 + 9) = *((_QWORD *)v19 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 10) = *((_QWORD *)v19 + 10);
  *((_QWORD *)v18 + 11) = *((_QWORD *)v19 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v18 + 12) = *((_QWORD *)v19 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[8]] = a2[a3[8]];
  return a1;
}

char *sub_2463A7C0C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2463BF934();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  memcpy(&a1[a3[7]], &a2[a3[7]], 0x68uLL);
  a1[a3[8]] = a2[a3[8]];
  return a1;
}

char *sub_2463A7CE0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_2463BF934();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (!EnumTagSinglePayload)
  {
    v9 = *(_QWORD *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
LABEL_7:
  v11 = a3[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v15 = *(_QWORD *)v13;
  v14 = *((_QWORD *)v13 + 1);
  *(_QWORD *)v12 = v15;
  *((_QWORD *)v12 + 1) = v14;
  swift_bridgeObjectRelease();
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v20 = *(_QWORD *)v18;
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = v20;
  *((_QWORD *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  v21 = a3[7];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = *(_QWORD *)&a2[v21 + 8];
  *(_QWORD *)v22 = *(_QWORD *)&a2[v21];
  *((_QWORD *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  v25 = *((_QWORD *)v23 + 3);
  *((_QWORD *)v22 + 2) = *((_QWORD *)v23 + 2);
  *((_QWORD *)v22 + 3) = v25;
  swift_bridgeObjectRelease();
  v26 = *((_QWORD *)v23 + 5);
  *((_QWORD *)v22 + 4) = *((_QWORD *)v23 + 4);
  *((_QWORD *)v22 + 5) = v26;
  swift_bridgeObjectRelease();
  v27 = *((_QWORD *)v23 + 7);
  *((_QWORD *)v22 + 6) = *((_QWORD *)v23 + 6);
  *((_QWORD *)v22 + 7) = v27;
  swift_bridgeObjectRelease();
  v28 = *((_QWORD *)v23 + 9);
  *((_QWORD *)v22 + 8) = *((_QWORD *)v23 + 8);
  *((_QWORD *)v22 + 9) = v28;
  swift_bridgeObjectRelease();
  v29 = *((_QWORD *)v23 + 11);
  *((_QWORD *)v22 + 10) = *((_QWORD *)v23 + 10);
  *((_QWORD *)v22 + 11) = v29;
  swift_bridgeObjectRelease();
  *((_QWORD *)v22 + 12) = *((_QWORD *)v23 + 12);
  swift_bridgeObjectRelease();
  a1[a3[8]] = a2[a3[8]];
  return a1;
}

uint64_t sub_2463A7E90()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2463A7E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_2463A7F1C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2463A7F28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for UserAccount()
{
  uint64_t result;

  result = qword_257570858;
  if (!qword_257570858)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2463A7FDC()
{
  unint64_t v0;

  sub_2463A806C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2463A806C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257570868[0])
  {
    sub_2463BF934();
    v0 = sub_2463C0780();
    if (!v1)
      atomic_store(v0, qword_257570868);
  }
}

uint64_t sub_2463A80C0()
{
  sub_2463C07E0();
  sub_2463C0654();
  type metadata accessor for UserAccount();
  swift_bridgeObjectRetain();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25756F518);
  sub_2463C0624();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  return 0;
}

uint64_t sub_2463A8248(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  char v22;
  char v24;
  void (*v25)(char *, uint64_t);
  int *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  BOOL v38;
  char v39;
  _QWORD __dst[13];
  _QWORD v42[14];

  v4 = sub_2463BF934();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&__dst[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575708A8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&__dst[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FBA8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&__dst[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&__dst[-1] - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&__dst[-1] - v18;
  sub_2463936DC(a1, (uint64_t)&__dst[-1] - v18);
  sub_2463936DC(a2, (uint64_t)v17);
  v20 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_2463936DC((uint64_t)v19, (uint64_t)v10);
  sub_2463936DC((uint64_t)v17, v20);
  OUTLINED_FUNCTION_1_9((uint64_t)v10);
  if (v21)
  {
    OUTLINED_FUNCTION_0_7((uint64_t)v17);
    OUTLINED_FUNCTION_0_7((uint64_t)v19);
    OUTLINED_FUNCTION_1_9(v20);
    if (v21)
    {
      sub_2463857A0((uint64_t)v10, &qword_25756FBA8);
      goto LABEL_13;
    }
LABEL_9:
    sub_2463857A0((uint64_t)v10, &qword_2575708A8);
    goto LABEL_10;
  }
  sub_2463936DC((uint64_t)v10, (uint64_t)v14);
  OUTLINED_FUNCTION_1_9(v20);
  if (v21)
  {
    sub_2463857A0((uint64_t)v17, &qword_25756FBA8);
    sub_2463857A0((uint64_t)v19, &qword_25756FBA8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    goto LABEL_9;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v20, v4);
  sub_2463A85A4();
  v24 = sub_2463C0600();
  v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v7, v4);
  OUTLINED_FUNCTION_0_7((uint64_t)v17);
  OUTLINED_FUNCTION_0_7((uint64_t)v19);
  v25(v14, v4);
  OUTLINED_FUNCTION_0_7((uint64_t)v10);
  if ((v24 & 1) == 0)
    goto LABEL_10;
LABEL_13:
  v26 = (int *)type metadata accessor for UserAccount();
  v27 = v26[5];
  v28 = (_QWORD *)(a1 + v27);
  v29 = *(_QWORD *)(a1 + v27 + 8);
  v30 = (_QWORD *)(a2 + v27);
  v31 = v30[1];
  if (v29)
  {
    if (v31)
    {
      if (*v28 != *v30 || v29 != v31)
      {
        v33 = sub_2463C0900();
        v22 = 0;
        if ((v33 & 1) == 0)
          return v22 & 1;
      }
      goto LABEL_22;
    }
LABEL_10:
    v22 = 0;
    return v22 & 1;
  }
  if (v31)
    goto LABEL_10;
LABEL_22:
  v34 = v26[6];
  v35 = *(_QWORD *)(a1 + v34);
  v36 = *(_QWORD *)(a1 + v34 + 8);
  v37 = (_QWORD *)(a2 + v34);
  v38 = v35 == *v37 && v36 == v37[1];
  if (v38 || (v39 = sub_2463C0900(), v22 = 0, (v39 & 1) != 0))
  {
    memcpy(__dst, (const void *)(a1 + v26[7]), sizeof(__dst));
    memcpy(v42, (const void *)(a2 + v26[7]), 0x68uLL);
    if ((sub_24638FF74(__dst, v42) & 1) != 0)
    {
      v22 = *(_BYTE *)(a1 + v26[8]) ^ *(_BYTE *)(a2 + v26[8]) ^ 1;
      return v22 & 1;
    }
    goto LABEL_10;
  }
  return v22 & 1;
}

unint64_t sub_2463A85A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575708B0;
  if (!qword_2575708B0)
  {
    v1 = sub_2463BF934();
    result = MEMORY[0x249559D74](MEMORY[0x24BDCEA98], v1);
    atomic_store(result, (unint64_t *)&qword_2575708B0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1)
{
  uint64_t *v1;

  return sub_2463857A0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_1_9(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

_QWORD *initializeBufferWithCopyOfBuffer for ExecutionDeviceResolutionResult(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for ExecutionDeviceResolutionResult(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for ExecutionDeviceResolutionResult(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  v5 = v4;

  return a1;
}

void **assignWithTake for ExecutionDeviceResolutionResult(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ExecutionDeviceResolutionResult(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ExecutionDeviceResolutionResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 2;
  }
  return result;
}

uint64_t sub_2463A87E4(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2463A87FC(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for ExecutionDeviceResolutionResult()
{
  return &type metadata for ExecutionDeviceResolutionResult;
}

BOOL sub_2463A882C(void *a1, void *a2)
{
  char v5;

  if (!a1)
    return !a2;
  if (a1 == (void *)1)
    return a2 == (void *)1;
  if (a1 == (void *)2)
    return a2 == (void *)2;
  if ((unint64_t)a2 < 3)
    return 0;
  sub_2463A3BA4();
  sub_2463A88E8(a1);
  sub_2463A88E8(a2);
  v5 = sub_2463C0768();
  sub_2463A88F8(a2);
  sub_2463A88F8(a1);
  return v5 & 1;
}

BOOL sub_2463A88DC(void **a1, void **a2)
{
  return sub_2463A882C(*a1, *a2);
}

id sub_2463A88E8(id result)
{
  if ((unint64_t)result >= 3)
    return result;
  return result;
}

void sub_2463A88F8(id a1)
{
  if ((unint64_t)a1 >= 3)

}

id IdentifyUserIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t IdentifyUserIntentHandler.resolveIdentity(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[15] = v0;
  v2 = OUTLINED_FUNCTION_7_2();
  v1[16] = v2;
  v1[17] = *(_QWORD *)(v2 - 8);
  v1[18] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A8970(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v14;
  _QWORD *v15;

  if (qword_25756EFB8 != -1)
    a1 = swift_once();
  v2 = (void *)v1[18];
  OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_2575745E0);
  sub_2463C05A0();
  v3 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_60(v4);
    OUTLINED_FUNCTION_10_5(&dword_246381000, v5, v6, "IdentifyUserIntentHandler.resolveIdentity");
    OUTLINED_FUNCTION_3_12();
  }
  v7 = v1[17];

  OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  sub_2463C03E4();
  sub_2463C03D8();
  sub_2463C03C0();
  OUTLINED_FUNCTION_62_0();
  v8 = sub_2463C04BC();
  swift_release();
  if ((v8 & 1) != 0)
  {
    v14 = (_QWORD *)swift_task_alloc();
    v1[19] = v14;
    OUTLINED_FUNCTION_31_4(v14, (uint64_t)sub_2463A8B3C);
    return sub_2463A915C();
  }
  else
  {
    sub_2463A9B3C();
    v9 = sub_246384FA4();
    v1[20] = v9;
    if (v9)
    {
      v10 = v9;
      v1[7] = v1 + 24;
      v1[2] = v1;
      v1[3] = sub_2463A8B88;
      v11 = swift_continuation_init();
      v1[10] = MEMORY[0x24BDAC760];
      v12 = v1 + 10;
      v12[1] = 0x40000000;
      v12[2] = sub_2463A8CC4;
      v12[3] = &block_descriptor_0;
      v12[4] = v11;
      objc_msgSend(v10, sel_isRecognizeMyVoiceAvailable_, v12);
      return swift_continuation_await();
    }
    else
    {
      v1[21] = 0;
      v15 = (_QWORD *)swift_task_alloc();
      v1[22] = v15;
      OUTLINED_FUNCTION_31_4(v15, (uint64_t)sub_2463A8C38);
      return OUTLINED_FUNCTION_21_4();
    }
  }
}

uint64_t sub_2463A8B3C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  swift_task_dealloc();
  swift_task_dealloc();
  v0 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_15_3(v0, v1);
}

uint64_t sub_2463A8B88()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A8BC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  _QWORD *v4;

  if ((*(_BYTE *)(v0 + 192) & 1) != 0)
  {
    OUTLINED_FUNCTION_14_8();
    static UserIdentifyIdentityResolutionResult.unsupported(forReason:)();
    OUTLINED_FUNCTION_29_5();
    swift_task_dealloc();
    v1 = OUTLINED_FUNCTION_14_5();
    return OUTLINED_FUNCTION_15_3(v1, v2);
  }
  else
  {
    *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 160);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v4;
    OUTLINED_FUNCTION_31_4(v4, (uint64_t)sub_2463A8C38);
    return OUTLINED_FUNCTION_21_4();
  }
}

uint64_t sub_2463A8C38(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A8C88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  swift_task_dealloc();
  v1 = OUTLINED_FUNCTION_14_5();
  return v2(v1);
}

uint64_t sub_2463A8CC4(uint64_t a1, char a2)
{
  return sub_2463A8CCC(*(_QWORD *)(a1 + 32), a2);
}

uint64_t sub_2463A8CCC(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_2463A8CF0(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_2463A8D64;
  return IdentifyUserIntentHandler.resolveIdentity(for:)();
}

uint64_t sub_2463A8D64(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;

  OUTLINED_FUNCTION_26();
  v4 = (void (**)(_QWORD, _QWORD))v3[4];
  v6 = (void *)v3[2];
  v5 = (void *)v3[3];
  OUTLINED_FUNCTION_1_4();

  ((void (**)(_QWORD, void *))v4)[2](v4, a1);
  _Block_release(v4);

  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t IdentifyUserIntentHandler.confirm(intent:)()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_7_2();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A8E0C(uint64_t a1)
{
  uint64_t v1;
  os_log_type_t v2;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  if (qword_25756EFC8 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_257574610);
  sub_2463C05A0();
  v2 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v2))
  {
    v3 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_60(v3);
    OUTLINED_FUNCTION_10_5(&dword_246381000, v4, v5, "IdentifyUserIntentHandler.confirm");
    OUTLINED_FUNCTION_3_12();
  }
  v6 = *(_QWORD *)(v1 + 24);
  OUTLINED_FUNCTION_32_5();
  OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  v7 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(1, 0);
  OUTLINED_FUNCTION_14_2();
  v8 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_15_3(v8, v9);
}

uint64_t sub_2463A8EEC(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2463A9CAC;
  return IdentifyUserIntentHandler.confirm(intent:)();
}

uint64_t IdentifyUserIntentHandler.handle(intent:)()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_7_2();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A8F9C(uint64_t a1)
{
  uint64_t v1;
  os_log_type_t v2;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  if (qword_25756EFB8 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_2575745E0);
  sub_2463C05A0();
  v2 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v2))
  {
    v3 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_60(v3);
    OUTLINED_FUNCTION_10_5(&dword_246381000, v4, v5, "IdentifyUserIntentHandler.handle");
    OUTLINED_FUNCTION_3_12();
  }
  v6 = *(_QWORD *)(v1 + 24);
  OUTLINED_FUNCTION_32_5();
  OUTLINED_FUNCTION_22_1(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  v7 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(4, 0);
  OUTLINED_FUNCTION_14_2();
  v8 = OUTLINED_FUNCTION_14_5();
  return OUTLINED_FUNCTION_15_3(v8, v9);
}

uint64_t sub_2463A907C(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6)
{
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;

  v9 = _Block_copy(aBlock);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  v11 = a3;
  v12 = a1;
  return sub_2463B6700(a6, (uint64_t)v10);
}

uint64_t sub_2463A90EC(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2463A9CAC;
  return IdentifyUserIntentHandler.handle(intent:)();
}

uint64_t sub_2463A915C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2463C04D4();
  v0[2] = OUTLINED_FUNCTION_3_4();
  v1 = sub_2463BFD60();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = OUTLINED_FUNCTION_11_1();
  v0[6] = OUTLINED_FUNCTION_11_1();
  v2 = sub_2463BFD84();
  v0[7] = v2;
  v0[8] = *(_QWORD *)(v2 - 8);
  v0[9] = OUTLINED_FUNCTION_3_4();
  v3 = OUTLINED_FUNCTION_7_2();
  v0[10] = v3;
  v0[11] = *(_QWORD *)(v3 - 8);
  v0[12] = OUTLINED_FUNCTION_11_1();
  v0[13] = OUTLINED_FUNCTION_11_1();
  v0[14] = OUTLINED_FUNCTION_11_1();
  v0[15] = OUTLINED_FUNCTION_11_1();
  v0[16] = OUTLINED_FUNCTION_11_1();
  v0[17] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A9230()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  char v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  void (*v33)(uint64_t, uint64_t);
  os_log_type_t v34;
  _WORD *v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  _WORD *v39;
  uint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  _WORD *v43;
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  _WORD *v47;
  uint64_t v48;
  uint64_t v49;
  id v51;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2575745E0);
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  sub_2463C05A0();
  v5 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_3_3(v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v1, (os_log_type_t)v2, "IdentifyUserIntentHandler.resolveDeviceHasMultiUserEnabled", v6);
    OUTLINED_FUNCTION_0();
  }
  v7 = *(_QWORD *)(v0 + 136);
  v8 = *(_QWORD *)(v0 + 80);
  v9 = *(_QWORD *)(v0 + 88);

  v10 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v10(v7, v8);
  sub_2463C03E4();
  sub_2463C03D8();
  sub_2463C03B4();
  OUTLINED_FUNCTION_62_0();
  sub_2463BFF10();
  swift_release();
  sub_2463AE644();
  if ((v11 & 1) == 0)
  {
    v29 = *(_QWORD *)(v0 + 40);
    v28 = *(_QWORD *)(v0 + 48);
    v30 = *(_QWORD *)(v0 + 24);
    v31 = *(_QWORD *)(v0 + 32);
    sub_2463BFD6C();
    sub_2463BFD48();
    v32 = sub_2463BFD24();
    v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v33(v29, v30);
    v33(v28, v30);
    if ((v32 & 1) != 0)
    {
      OUTLINED_FUNCTION_15_6();
      sub_2463C05A0();
      v34 = OUTLINED_FUNCTION_14_1();
      if (OUTLINED_FUNCTION_22(v34))
      {
        v35 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_60(v35);
        OUTLINED_FUNCTION_10_5(&dword_246381000, v36, v37, "User Ambiguous");
        OUTLINED_FUNCTION_3_12();
      }
    }
    else
    {
      OUTLINED_FUNCTION_15_6();
      sub_2463C05A0();
      v38 = OUTLINED_FUNCTION_14_1();
      if (OUTLINED_FUNCTION_22(v38))
      {
        v39 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_60(v39);
        OUTLINED_FUNCTION_10_5(&dword_246381000, v40, v41, "User Unrecognized");
        OUTLINED_FUNCTION_3_12();
      }
    }
    goto LABEL_25;
  }
  OUTLINED_FUNCTION_15_6();
  v12 = sub_2463C05A0();
  v13 = sub_2463C0720();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v12, v13, "User Identified", v14);
    OUTLINED_FUNCTION_0();
  }
  v15 = *(_QWORD *)(v0 + 128);
  v16 = *(_QWORD *)(v0 + 80);

  v10(v15, v16);
  v17 = (void *)sub_2463BFD78();

  v18 = sub_2463BFD78();
  if (!v18)
  {
    if (v17)
    {
LABEL_20:
      OUTLINED_FUNCTION_15_6();
      sub_2463C05A0();
      v42 = OUTLINED_FUNCTION_14_1();
      if (OUTLINED_FUNCTION_22(v42))
      {
        v43 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_60(v43);
        OUTLINED_FUNCTION_10_5(&dword_246381000, v44, v45, "Partial MeCard");
        OUTLINED_FUNCTION_3_12();
      }
LABEL_25:
      OUTLINED_FUNCTION_27_4();
      OUTLINED_FUNCTION_18_5();
      OUTLINED_FUNCTION_14_8();
      v51 = static UserIdentifyIdentityResolutionResult.unsupported(forReason:)();
      goto LABEL_26;
    }
LABEL_23:
    OUTLINED_FUNCTION_15_6();
    sub_2463C05A0();
    v46 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_22(v46))
    {
      v47 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_60(v47);
      OUTLINED_FUNCTION_10_5(&dword_246381000, v48, v49, "Missing MeCard");
      OUTLINED_FUNCTION_3_12();
    }
    goto LABEL_25;
  }
  v19 = (void *)v18;
  v20 = sub_2463B9C80();

  if (!v17)
    goto LABEL_23;
  if ((v20 & 1) != 0)
    goto LABEL_20;
  v22 = *(_QWORD *)(v0 + 40);
  v21 = *(_QWORD *)(v0 + 48);
  v24 = *(_QWORD *)(v0 + 24);
  v23 = *(_QWORD *)(v0 + 32);
  v25 = *(_QWORD *)(v0 + 16);
  sub_2463C03D8();
  sub_2463C03B4();
  OUTLINED_FUNCTION_62_0();
  sub_2463BFF28();
  swift_release();
  sub_2463BFD6C();
  sub_2463BFD54();
  sub_2463BFD24();
  v26 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
  v26(v22, v24);
  v26(v21, v24);
  type metadata accessor for Identity();
  sub_2463C03D8();
  sub_2463C03C0();
  OUTLINED_FUNCTION_62_0();
  sub_2463C04B0();
  swift_release();
  sub_2463C04C8();
  sub_2463A9C70(v25);
  v27 = sub_246385114();
  OUTLINED_FUNCTION_14_8();
  v51 = static IdentityResolutionResult.success(with:)();

LABEL_26:
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  OUTLINED_FUNCTION_14_2();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v51);
}

uint64_t sub_2463A9748()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_7_2();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_11_1();
  v0[5] = OUTLINED_FUNCTION_11_1();
  v0[6] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A97A4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void *, uint64_t, uint64_t);
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  _QWORD *v12;
  uint64_t (*v14)(void);

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = (void *)v0[6];
  v2 = v0[2];
  v3 = v0[3];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2575745E0);
  v0[7] = v4;
  v5 = *(void (**)(void *, uint64_t, uint64_t))(v3 + 16);
  v0[8] = v5;
  v5(v1, v4, v2);
  sub_2463C05A0();
  v6 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v6))
  {
    v7 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_60(v7);
    OUTLINED_FUNCTION_10_5(&dword_246381000, v8, v9, "IdentifyUserIntentHandler.resolveDeviceNotSupportingMultiUser");
    OUTLINED_FUNCTION_3_12();
  }
  v10 = v0[3];

  v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
  v0[9] = v11;
  OUTLINED_FUNCTION_22_1(v11);
  sub_2463BFC40();
  sub_2463BFEE0();
  swift_allocObject();
  v0[10] = sub_2463BFED4();
  v14 = (uint64_t (*)(void))((int)*MEMORY[0x24BE98430] + MEMORY[0x24BE98430]);
  v12 = (_QWORD *)swift_task_alloc();
  v0[11] = v12;
  OUTLINED_FUNCTION_31_4(v12, (uint64_t)sub_2463A98DC);
  return v14();
}

uint64_t sub_2463A98DC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463A9930()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);

  if (*(_QWORD *)(v1 + 96))
  {
    if ((sub_2463B9C80() & 1) != 0)
    {
      v2 = *(NSObject **)(v1 + 40);
      OUTLINED_FUNCTION_33_4(*(_QWORD *)(v1 + 56), *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 64));
      sub_2463C05A0();
      v3 = OUTLINED_FUNCTION_14_1();
      if (OUTLINED_FUNCTION_3_3(v3))
      {
        v4 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)v4 = 0;
        OUTLINED_FUNCTION_4_3(&dword_246381000, v2, (os_log_type_t)v0, "Partial MeCard", v4);
        OUTLINED_FUNCTION_0();
      }
      v5 = *(void (**)(uint64_t, uint64_t))(v1 + 72);
      v6 = *(_QWORD *)(v1 + 40);
      v7 = *(_QWORD *)(v1 + 16);

      v5(v6, v7);
      OUTLINED_FUNCTION_14_8();
      static UserIdentifyIdentityResolutionResult.unsupported(forReason:)();
      OUTLINED_FUNCTION_29_5();
    }
    else
    {
      type metadata accessor for Identity();
      v14 = sub_246385114();
      OUTLINED_FUNCTION_14_8();
      static IdentityResolutionResult.success(with:)();
      OUTLINED_FUNCTION_29_5();

    }
  }
  else
  {
    OUTLINED_FUNCTION_33_4(*(_QWORD *)(v1 + 56), *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 64));
    sub_2463C05A0();
    v8 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_22(v8))
    {
      v9 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_60(v9);
      OUTLINED_FUNCTION_10_5(&dword_246381000, v10, v11, "User Unknown");
      OUTLINED_FUNCTION_3_12();
    }
    v12 = *(void (**)(uint64_t, uint64_t))(v1 + 72);
    v13 = *(_QWORD *)(v1 + 32);
    OUTLINED_FUNCTION_32_5();
    v12(v13, v0);
    OUTLINED_FUNCTION_14_8();
    static UserIdentifyIdentityResolutionResult.unsupported(forReason:)();
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  swift_task_dealloc();
  v15 = OUTLINED_FUNCTION_14_5();
  return v16(v15);
}

id IdentifyUserIntentHandler.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifyUserIntentHandler();
  return objc_msgSendSuper2(&v2, sel_init);
}

id IdentifyUserIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentifyUserIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2463A9B3C()
{
  unint64_t result;

  result = qword_2575708C0;
  if (!qword_2575708C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2575708C0);
  }
  return result;
}

uint64_t type metadata accessor for IdentifyUserIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_2463A9B9C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_24639CA08);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t sub_2463A9BE4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_24639CA08);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t sub_2463A9C2C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_24639BB3C);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t sub_2463A9C70(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2463C04D4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_3_12()
{
  JUMPOUT(0x249559E1CLL);
}

uint64_t OUTLINED_FUNCTION_14_8()
{
  return type metadata accessor for UserIdentifyIdentityResolutionResult();
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  return sub_2463A9748();
}

void OUTLINED_FUNCTION_27_4()
{
  void *v0;

}

void OUTLINED_FUNCTION_29_5()
{
  void *v0;

}

_QWORD *OUTLINED_FUNCTION_31_4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

void OUTLINED_FUNCTION_32_5()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_33_4@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, *(_QWORD *)(v3 + 16));
}

uint64_t sub_2463A9D18()
{
  return sub_2463A9D24(qword_2575745A0);
}

uint64_t sub_2463A9D24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for Signpost.OpenSignpost();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25756EF48 != -1)
    swift_once();
  v5 = (id)qword_25756F958;
  sub_2463C0588();
  sub_2463C0750();
  sub_2463C0570();
  v6 = &v4[*(int *)(v2 + 20)];
  *(_QWORD *)v6 = "AccountServicesInstanceCreation";
  *((_QWORD *)v6 + 1) = 31;
  *((_WORD *)v6 + 8) = 258;
  v7 = type metadata accessor for AccountServicesNoOp();
  v8 = swift_allocObject();
  a1[3] = v7;
  a1[4] = (uint64_t)&off_251795760;
  *a1 = v8;
  sub_2463C0744();
  sub_2463C057C();
  return sub_246384DA8((uint64_t)v4);
}

uint64_t type metadata accessor for AccountServicesNoOp()
{
  return objc_opt_self();
}

BOOL static Proximity.< infix(_:_:)()
{
  uint64_t v0;

  v0 = sub_2463C0564();
  return sub_2463C0564() < v0;
}

unint64_t sub_2463A9EEC()
{
  unint64_t result;

  result = qword_257570A00;
  if (!qword_257570A00)
  {
    result = MEMORY[0x249559D74](MEMORY[0x24BEA9310], MEMORY[0x24BEA9308]);
    atomic_store(result, (unint64_t *)&qword_257570A00);
  }
  return result;
}

BOOL sub_2463A9F28()
{
  return static Proximity.< infix(_:_:)();
}

BOOL sub_2463A9F34()
{
  return sub_2463A9F40();
}

BOOL sub_2463A9F40()
{
  uint64_t v0;

  v0 = sub_2463C0564();
  return sub_2463C0564() >= v0;
}

BOOL sub_2463A9F78()
{
  return sub_2463A9F84();
}

BOOL sub_2463A9F84()
{
  uint64_t v0;

  v0 = sub_2463C0564();
  return sub_2463C0564() >= v0;
}

BOOL sub_2463A9FB8()
{
  return sub_2463A9FC4();
}

BOOL sub_2463A9FC4()
{
  uint64_t v0;

  v0 = sub_2463C0564();
  return sub_2463C0564() < v0;
}

uint64_t sub_2463AA000(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v19[2];

  v5 = sub_2463BFBB0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_7_2();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v9, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v2, v11, v9);
  v12 = sub_2463C05A0();
  v13 = sub_2463C0720();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    v19[1] = a1;
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v12, v13, "IdentifyUserIntentExecutionBehaviorStrategy.makeIntentExecutionBehavior", v14);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v2, v9);
  sub_2463BFC10();
  v15 = objc_allocWithZone((Class)type metadata accessor for IdentifyUserIntentHandler());
  swift_retain();
  objc_msgSend(v15, sel_init);
  type metadata accessor for UserIdentifyIntent();
  v16 = a2;
  sub_2463BFBA4();
  v17 = sub_2463BFC04();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v17;
}

uint64_t sub_2463AA1F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t);

  v1 = OUTLINED_FUNCTION_7_2();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v3, v1);
  v4 = sub_2463C05A0();
  v5 = sub_2463C0720();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v4, v5, "IdentifyUserFlowStrategy.actionForInput() called", v6);
    OUTLINED_FUNCTION_0();
  }

  v7 = OUTLINED_FUNCTION_10_2();
  v8(v7);
  return sub_2463BFCF4();
}

uint64_t sub_2463AA30C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[13] = a1;
  v2 = sub_2463C0024();
  v1[14] = v2;
  v1[15] = *(_QWORD *)(v2 - 8);
  v1[16] = OUTLINED_FUNCTION_11_1();
  v1[17] = OUTLINED_FUNCTION_11_1();
  v3 = OUTLINED_FUNCTION_7_2();
  v1[18] = v3;
  v1[19] = *(_QWORD *)(v3 - 8);
  v1[20] = OUTLINED_FUNCTION_11_1();
  v1[21] = OUTLINED_FUNCTION_11_1();
  v1[22] = OUTLINED_FUNCTION_11_1();
  v1[23] = OUTLINED_FUNCTION_11_1();
  return swift_task_switch();
}

uint64_t sub_2463AA3B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t, uint64_t);
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 152);
  v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 144), (uint64_t)qword_2575745E0);
  v3 = *(void (**)(uint64_t))(v1 + 16);
  v4 = OUTLINED_FUNCTION_10_2();
  v3(v4);
  v5 = sub_2463C05A0();
  v6 = sub_2463C0720();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v5, v6, "IdentifyUserFlowStrategy.makeIntentFromParse() called", v7);
    OUTLINED_FUNCTION_0();
  }
  v8 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 184);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(_QWORD *)(v0 + 152);

  v12 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v12(v9, v10);
  sub_2463A5CA0(v8, (uint64_t *)(v0 + 56));
  v13 = *(_QWORD *)(v0 + 144);
  if (*(_QWORD *)(v0 + 80))
  {
    v14 = *(_QWORD *)(v0 + 176);
    sub_246389878((__int128 *)(v0 + 56), v0 + 16);
    type metadata accessor for UserIdentifyIntent();
    sub_2463961A8((_QWORD *)(v0 + 16));
    v16 = v15;
    ((void (*)(uint64_t, uint64_t, uint64_t))v3)(v14, v2, v13);
    v17 = sub_2463C05A0();
    v18 = sub_2463C0720();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v19 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v17, v18, "Finished creating intent from parse", v19);
      OUTLINED_FUNCTION_0();
    }
    v20 = *(_QWORD *)(v0 + 176);
    v21 = *(_QWORD *)(v0 + 144);

    v12(v20, v21);
    if (objc_msgSend(v16, sel_caseType) != (id)4)
    {
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void *))(v0 + 8))(v16);
    }
    v22 = OUTLINED_FUNCTION_10_2();
    v3(v22);
    v23 = sub_2463C05A0();
    v24 = sub_2463C072C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v25 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v23, v24, "Unsupported Intent Case Type", v25);
      OUTLINED_FUNCTION_0();
    }
    v26 = *(_QWORD *)(v0 + 168);
    v27 = *(_QWORD *)(v0 + 144);

    v12(v26, v27);
    type metadata accessor for IdentityFlowError();
    OUTLINED_FUNCTION_8_2();
    v28 = OUTLINED_FUNCTION_6_3();
    sub_246389838((unint64_t *)&qword_257570250, 255, (uint64_t (*)(uint64_t))type metadata accessor for IdentityFlowError, (uint64_t)"i*=\vhJ");
    OUTLINED_FUNCTION_9_1();
    *v29 = v28;
    swift_willThrow();

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  }
  else
  {
    v50 = v12;
    v51 = *(_QWORD *)(v0 + 136);
    v31 = *(_QWORD *)(v0 + 112);
    v30 = *(_QWORD *)(v0 + 120);
    v32 = *(_QWORD *)(v0 + 104);
    sub_2463897F8(v0 + 56);
    v33 = OUTLINED_FUNCTION_10_2();
    v3(v33);
    v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
    v34(v51, v32, v31);
    v35 = sub_2463C05A0();
    v36 = sub_2463C072C();
    v37 = os_log_type_enabled(v35, v36);
    v38 = *(_QWORD *)(v0 + 160);
    v40 = *(_QWORD *)(v0 + 136);
    v39 = *(_QWORD *)(v0 + 144);
    if (v37)
    {
      v41 = *(_QWORD *)(v0 + 128);
      v49 = *(_QWORD *)(v0 + 120);
      v42 = *(_QWORD *)(v0 + 112);
      v43 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      *(_DWORD *)v43 = 136315138;
      v34(v41, v40, v42);
      v44 = sub_2463C0624();
      *(_QWORD *)(v0 + 96) = sub_24639AE68(v44, v45, &v52);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v40, v42);
      _os_log_impl(&dword_246381000, v35, v36, "Unable to make intent from parse %s", v43, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112));

    v50(v38, v39);
    type metadata accessor for IdentityFlowError();
    OUTLINED_FUNCTION_8_2();
    v47 = OUTLINED_FUNCTION_6_3();
    sub_246389838((unint64_t *)&qword_257570250, 255, (uint64_t (*)(uint64_t))type metadata accessor for IdentityFlowError, (uint64_t)"i*=\vhJ");
    OUTLINED_FUNCTION_9_1();
    *v48 = v47;
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for IdentifyUserFlowStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2463AA940()
{
  return sub_2463AA1F8();
}

uint64_t sub_2463AA954(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246389164;
  return sub_2463AA30C(a1);
}

uint64_t sub_2463AA9A0()
{
  type metadata accessor for IdentifyUserFlowStrategy();
  return sub_2463BFF04();
}

uint64_t sub_2463AA9D8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9F4();
}

uint64_t sub_2463AAA5C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9E8();
}

uint64_t sub_2463AAAE0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BF9DC();
}

uint64_t sub_2463AAB64()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_24638966C;
  return sub_2463BF9D0();
}

uint64_t sub_2463AABF8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BFA84();
}

uint64_t sub_2463AAC8C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = sub_2463AA000(a1, a2);
  return sub_2463897E8(*(uint64_t (**)(uint64_t))(v2 + 8), v2, v3);
}

uint64_t sub_2463AACC4(uint64_t a1, uint64_t a2)
{
  return sub_246389838(&qword_257570AC8, a2, (uint64_t (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy, (uint64_t)&unk_2463C2CDC);
}

uint64_t sub_2463AACF0(uint64_t a1, uint64_t a2)
{
  return sub_246389838(qword_257570AD0, a2, (uint64_t (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy, (uint64_t)&unk_2463C2D0C);
}

uint64_t sub_2463AAD1C(uint64_t a1, uint64_t a2)
{
  return sub_246389838(qword_257570AF8, a2, (uint64_t (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy, (uint64_t)&unk_2463C2D44);
}

id sub_2463AAD48()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for BaseDialogProvider();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_257570B10 = (uint64_t)result;
  return result;
}

uint64_t sub_2463AAD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v6 = *v4;
  v5[8] = a4;
  v5[9] = v6;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  v7 = sub_2463C05B8();
  v5[10] = v7;
  v5[11] = *(_QWORD *)(v7 - 8);
  v5[12] = swift_task_alloc();
  v5[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2463AAE14()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD *v20;
  uint64_t v22;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[13];
  v2 = v0[10];
  v3 = v0[11];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2575745E0);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v5(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  v6 = sub_2463C05A0();
  v7 = sub_2463C0720();
  v8 = os_log_type_enabled(v6, v7);
  v9 = v0[13];
  v11 = v0[10];
  v10 = v0[11];
  v12 = v0[7];
  if (v8)
  {
    v13 = v0[6];
    v14 = (uint8_t *)OUTLINED_FUNCTION_1_10();
    v22 = OUTLINED_FUNCTION_4_13();
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v0[4] = sub_24639AE68(v13, v12, &v22);
    OUTLINED_FUNCTION_3_13();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_246381000, v6, v7, "SiriIdentity CAT: %s", v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  swift_bridgeObjectRelease_n();
  v15 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v15(v9, v11);
  v0[15] = v15;
  v16 = v0[9];
  v17 = v0[6];
  v18 = swift_task_alloc();
  v0[16] = v18;
  v19 = *(_OWORD *)(v0 + 7);
  *(_QWORD *)(v18 + 16) = v17;
  *(_OWORD *)(v18 + 24) = v19;
  *(_QWORD *)(v18 + 40) = v16;
  v20 = (_QWORD *)swift_task_alloc();
  v0[17] = v20;
  sub_2463BFE98();
  *v20 = v0;
  v20[1] = sub_2463AB06C;
  return sub_2463C0918();
}

uint64_t sub_2463AB06C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2463AB0F8()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;

  swift_task_dealloc();
  if (qword_25756EFB0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 144);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2575745C8);
  v2(v3, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_2463C05A0();
  v9 = sub_2463C072C();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 144);
  v12 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v13 = *(_QWORD *)(v0 + 96);
  v14 = *(_QWORD *)(v0 + 80);
  if (v10)
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_1_10();
    v20 = OUTLINED_FUNCTION_4_13();
    *(_DWORD *)v15 = 136315138;
    *(_QWORD *)(v0 + 16) = v11;
    v16 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25756F180);
    v17 = sub_2463C0624();
    *(_QWORD *)(v0 + 24) = sub_24639AE68(v17, v18, &v20);
    OUTLINED_FUNCTION_3_13();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_10();
    OUTLINED_FUNCTION_2_10();
    _os_log_impl(&dword_246381000, v8, v9, "Error while executing dialog: %s", v15, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_2_10();

  v12(v13, v14);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2463AB308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;

  v19 = a3;
  v20 = a4;
  v17 = a1;
  v18 = a2;
  v4 = sub_2463C0468();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570BC0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = sub_2463C0444();
  if (qword_25756EF78 != -1)
    swift_once();
  sub_2463C042C();
  v12 = (void *)sub_2463C0420();
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, v11, v8);
  sub_2463C045C();
  sub_2463C0438();
  swift_release();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_2463AB6BC((uint64_t)v21);
}

uint64_t sub_2463AB4C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v10[2];

  v2 = sub_2463BFE98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570BD0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_QWORD *)((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2463AB6FC(a1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10[1] = *v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570BC0);
    return sub_2463C06E4();
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v3 + 32))(v5, v8, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570BC0);
    return sub_2463C06F0();
  }
}

uint64_t type metadata accessor for BaseDialogProvider()
{
  return objc_opt_self();
}

uint64_t sub_2463AB60C(uint64_t a1)
{
  uint64_t *v1;

  return sub_2463AB308(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2463AB618()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570BC0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2463AB67C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570BC0);
  return sub_2463AB4C8(a1);
}

uint64_t sub_2463AB6BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570BC8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2463AB6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570BD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_2_10()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_3_13()
{
  return sub_2463C078C();
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return swift_slowAlloc();
}

uint64_t sub_2463AB774(uint64_t a1, void (*a2)(void))
{
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[40];

  type metadata accessor for BaseDialogProvider();
  v4 = swift_allocObject();
  sub_2463AC788(a1, (uint64_t)v7);
  v5 = sub_2463AC9A8(v4, (uint64_t)v7, a2);
  sub_2463857A0(a1, &qword_25756F950);
  return v5;
}

uint64_t sub_2463AB7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_2463BFE98();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = OUTLINED_FUNCTION_11_1();
  v3[8] = OUTLINED_FUNCTION_11_1();
  v3[9] = OUTLINED_FUNCTION_11_1();
  v3[10] = OUTLINED_FUNCTION_11_1();
  v3[11] = OUTLINED_FUNCTION_11_1();
  v3[12] = OUTLINED_FUNCTION_11_1();
  v3[13] = OUTLINED_FUNCTION_11_1();
  v5 = sub_2463C05B8();
  v3[14] = v5;
  v3[15] = *(_QWORD *)(v5 - 8);
  v3[16] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463AB894(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD *v20;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  if (qword_25756EFB8 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_2575745E0);
  v2 = (void *)sub_2463C05A0();
  v3 = sub_2463C0720();
  if (OUTLINED_FUNCTION_28_5(v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
    OUTLINED_FUNCTION_27_5(&dword_246381000, v4, v5, "IdentifyUserUnsupportedValueFlowStrategy.makeUnsupportedValueOutput");
    OUTLINED_FUNCTION_3_12();
  }

  OUTLINED_FUNCTION_30_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570CC8);
  v6 = (void *)sub_2463BFF88();
  v7 = objc_msgSend(v6, sel_unsupportedReason);

  v8 = UserIdentifyIdentityUnsupportedReason.init(rawValue:)((uint64_t)v7);
  if ((v9 & 1) == 0)
  {
    switch(v8)
    {
      case 2:
        OUTLINED_FUNCTION_11_5();
        v10 = (_QWORD *)OUTLINED_FUNCTION_12_4();
        v1[27] = v10;
        *v10 = v1;
        v10[1] = sub_2463AC09C;
        goto LABEL_13;
      case 3:
        OUTLINED_FUNCTION_11_5();
        v14 = (_QWORD *)OUTLINED_FUNCTION_12_4();
        v1[29] = v14;
        *v14 = v1;
        v14[1] = sub_2463AC1A8;
        goto LABEL_13;
      case 4:
        OUTLINED_FUNCTION_11_5();
        v15 = (_QWORD *)OUTLINED_FUNCTION_12_4();
        v1[23] = v15;
        *v15 = v1;
        v15[1] = sub_2463ABEA0;
        goto LABEL_13;
      case 5:
        v16 = (_QWORD *)swift_task_alloc();
        v1[19] = v16;
        *v16 = v1;
        v16[1] = sub_2463ABD34;
        OUTLINED_FUNCTION_27();
        return sub_246395924(v17, v18);
      case 6:
        OUTLINED_FUNCTION_11_5();
        v20 = (_QWORD *)OUTLINED_FUNCTION_12_4();
        v1[25] = v20;
        *v20 = v1;
        v20[1] = sub_2463ABFAC;
        goto LABEL_13;
      case 7:
        v22 = (_QWORD *)swift_task_alloc();
        v1[21] = v22;
        *v22 = v1;
        v22[1] = sub_2463ABDF8;
        OUTLINED_FUNCTION_27();
        return sub_246395814(v23, v24);
      case 8:
        OUTLINED_FUNCTION_11_5();
        v25 = (_QWORD *)OUTLINED_FUNCTION_12_4();
        v1[17] = v25;
        *v25 = v1;
        v25[1] = sub_2463ABC44;
LABEL_13:
        OUTLINED_FUNCTION_27();
        __asm { BR              X3 }
        return result;
      default:
        break;
    }
  }
  type metadata accessor for IdentityFlowError();
  swift_allocObject();
  v11 = sub_2463B0A74(3u);
  sub_2463AC748();
  swift_allocError();
  *v12 = v11;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_27();
  __asm { BR              X0 }
  return result;
}

uint64_t sub_2463ABC44()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)(v1 + 144) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463ABC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_13_8();
  sub_2463AC474(v2);
  OUTLINED_FUNCTION_24_5(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_20_4();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_0_8(v3);
}

uint64_t sub_2463ABCEC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_1_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463ABD34()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)(v1 + 160) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463ABD80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_10();
  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 48);
  sub_2463AC474(*(uint64_t **)(v0 + 16));
  OUTLINED_FUNCTION_24_5(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_20_4();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_0_8(v3);
}

uint64_t sub_2463ABDF8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)(v1 + 176) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463ABE44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_13_8();
  sub_2463AC474(v2);
  OUTLINED_FUNCTION_24_5(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_20_4();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_0_8(v3);
}

uint64_t sub_2463ABEA0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)(v1 + 192) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463ABEEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_10();
  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 48);
  sub_2463AC474(*(uint64_t **)(v0 + 16));
  OUTLINED_FUNCTION_24_5(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_20_4();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_0_8(v3);
}

uint64_t sub_2463ABF64()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_1_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463ABFAC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)(v1 + 208) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463ABFF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_13_8();
  sub_2463AC474(v2);
  OUTLINED_FUNCTION_24_5(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_20_4();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_0_8(v3);
}

uint64_t sub_2463AC054()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_1_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463AC09C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)(v1 + 224) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463AC0E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_10();
  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 48);
  sub_2463AC474(*(uint64_t **)(v0 + 16));
  OUTLINED_FUNCTION_24_5(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_20_4();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_0_8(v3);
}

uint64_t sub_2463AC160()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_1_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463AC1A8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_23_2();
  *(_QWORD *)(v1 + 240) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463AC1F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_5_10();
  v1 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  sub_2463AC474(*(uint64_t **)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_21_5();
  OUTLINED_FUNCTION_20_4();
  swift_task_dealloc();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_31_2();
  return OUTLINED_FUNCTION_0_8(v4);
}

uint64_t sub_2463AC278()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_1_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463AC2C0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_1_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463AC308()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_7();
  OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24_2();
  OUTLINED_FUNCTION_29_3();
  OUTLINED_FUNCTION_51();
  return OUTLINED_FUNCTION_1_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463AC350(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  v2 = sub_2463C05B8();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463AC398(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (qword_25756EFB8 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_2575745E0);
  v2 = (void *)sub_2463C05A0();
  v3 = sub_2463C0720();
  if (OUTLINED_FUNCTION_28_5(v3))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
    OUTLINED_FUNCTION_27_5(&dword_246381000, v4, v5, "IdentifyUserUnsupportedValueFlowStrategy.makeUpdatedIntentForUnsupportedValue");
    OUTLINED_FUNCTION_3_12();
  }

  OUTLINED_FUNCTION_30_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570CC8);
  v6 = sub_2463BFF7C();
  OUTLINED_FUNCTION_14_2();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v6);
}

uint64_t sub_2463AC474@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 136));
  sub_2463BFC58();
  v6 = sub_2463BFE80();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v7 = sub_2463C0060();
  memset(v10, 0, sizeof(v10));
  v11 = 0;
  v8 = MEMORY[0x24BE99088];
  a1[3] = v7;
  a1[4] = v8;
  __swift_allocate_boxed_opaque_existential_1Tm(a1);
  sub_2463BFDB4();
  sub_2463857A0((uint64_t)v10, &qword_257570230);
  return sub_2463857A0((uint64_t)v5, &qword_257570220);
}

uint64_t sub_2463AC5B0()
{
  uint64_t v0;

  sub_24638C60C(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  return v0;
}

uint64_t sub_2463AC5DC()
{
  sub_2463AC5B0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2463AC61C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24638966C;
  return sub_2463AB7F0(a1, a2);
}

uint64_t sub_2463AC680(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246389164;
  return sub_2463AC350(a1);
}

uint64_t sub_2463AC6CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BFA00();
}

unint64_t sub_2463AC748()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257570250;
  if (!qword_257570250)
  {
    v1 = type metadata accessor for IdentityFlowError();
    result = MEMORY[0x249559D74]("i*=\vhJ", v1);
    atomic_store(result, (unint64_t *)&qword_257570250);
  }
  return result;
}

uint64_t sub_2463AC788(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2463AC7D0(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  __int128 v12[2];
  _BYTE v13[40];
  __int128 v14;
  uint64_t v15;
  _BYTE __src[88];
  _QWORD v17[5];

  v17[3] = type metadata accessor for BaseDialogProvider();
  v17[4] = &off_251795888;
  v17[0] = a1;
  sub_24638F8D0((uint64_t)v17, (uint64_t)&v14);
  sub_2463AC788(a2, (uint64_t)v13);
  sub_24638F8D0((uint64_t)&v14, (uint64_t)__src);
  sub_2463AC788((uint64_t)v13, (uint64_t)&v10);
  if (v11)
  {
    sub_2463857A0((uint64_t)v13, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
    sub_246389878(&v10, (uint64_t)v12);
  }
  else
  {
    sub_2463C0030();
    sub_2463857A0((uint64_t)v13, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
    sub_2463857A0((uint64_t)&v10, &qword_25756F950);
  }
  sub_246389878(v12, (uint64_t)&__src[40]);
  sub_24638F8D0((uint64_t)&__src[40], (uint64_t)v12);
  type metadata accessor for LocUtil();
  v8 = swift_allocObject();
  sub_246389878(v12, v8 + 16);
  *(_QWORD *)&__src[80] = v8;
  memcpy((void *)(a4 + 16), __src, 0x58uLL);
  if (!a3)
  {
    sub_2463C03E4();
    a3 = sub_2463A47BC();
  }
  *(_QWORD *)(a4 + 104) = a3;
  sub_2463AC788(a2, (uint64_t)&v14);
  if (v15)
  {
    sub_2463857A0(a2, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    sub_246389878(&v14, (uint64_t)__src);
  }
  else
  {
    sub_2463C0030();
    sub_2463857A0(a2, &qword_25756F950);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
    sub_2463857A0((uint64_t)&v14, &qword_25756F950);
  }
  sub_246389878((__int128 *)__src, a4 + 112);
  return a4;
}

uint64_t sub_2463AC9A8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v14[3];
  uint64_t v15;
  char **v16;

  v15 = type metadata accessor for BaseDialogProvider();
  v16 = &off_251795888;
  v14[0] = a1;
  type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy();
  v6 = swift_allocObject();
  v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_QWORD *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  v11 = sub_2463AC7D0(*v9, a2, a3, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v11;
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_1_11(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_3_14()
{
  return swift_task_dealloc();
}

_QWORD *OUTLINED_FUNCTION_11_5()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 32) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 32) + 40));
}

uint64_t OUTLINED_FUNCTION_20_4()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_23_2()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
}

uint64_t OUTLINED_FUNCTION_24_5@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_27_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *v6;

  _os_log_impl(a1, v6, v4, a4, v5, 2u);
}

BOOL OUTLINED_FUNCTION_28_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_2463ACBA0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(uint64_t *);
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD v32[5];
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570CD0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v34 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2463C05B8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v33 = (char *)v32 - v11;
  v12 = sub_2463C021C();
  if (v1)
  {
    if (qword_25756EFC0 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v6, (uint64_t)qword_2575745F8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v13, v6);
    OUTLINED_FUNCTION_3_15();
    OUTLINED_FUNCTION_3_15();
    v14 = sub_2463C05A0();
    v15 = sub_2463C072C();
    if (os_log_type_enabled(v14, v15))
    {
      v32[4] = a1;
      v16 = OUTLINED_FUNCTION_5();
      v32[2] = v4;
      v17 = (uint8_t *)v16;
      v18 = OUTLINED_FUNCTION_5();
      v32[3] = v3;
      v36 = v18;
      v32[1] = v7;
      *(_DWORD *)v17 = 136315138;
      v32[0] = v17 + 4;
      v35 = v1;
      OUTLINED_FUNCTION_3_15();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25756F180);
      v19 = sub_2463C0624();
      v35 = sub_24639AE68(v19, v20, &v36);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_9();
      OUTLINED_FUNCTION_0_9();
      _os_log_impl(&dword_246381000, v14, v15, "failed generating verb -- User Dialog Act to tasks: %s", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_0_9();
    OUTLINED_FUNCTION_0_9();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v21 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v21 = v12;
  }
  if (v21 >> 62)
  {
    swift_bridgeObjectRetain();
    v26 = sub_2463C08B8();
    OUTLINED_FUNCTION_13();
    if (v26)
      goto LABEL_10;
  }
  else if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_10:
    sub_2463B1E10(0, (v21 & 0xC000000000000001) == 0, v21);
    if ((v21 & 0xC000000000000001) != 0)
    {
      v22 = MEMORY[0x249559828](0, v21);
    }
    else
    {
      v22 = *(_QWORD *)(v21 + 32);
      swift_retain();
    }
    v23 = v34;
    OUTLINED_FUNCTION_13();
    sub_2463C0378();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570278);
    sub_2463C03F0();
    v24 = (void (*)(uint64_t *))sub_2463C03FC();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v23, v3);
    v36 = v22;
    v24(&v36);
    swift_release();
    return swift_release();
  }
  OUTLINED_FUNCTION_13();
  if (qword_25756EFC0 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v6, (uint64_t)qword_2575745F8);
  v28 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v33, v27, v6);
  v29 = sub_2463C05A0();
  v30 = sub_2463C072C();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_246381000, v29, v30, "did not get USOTask. Bailing", v31, 2u);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v28, v6);
  a1[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
  a1[4] = (uint64_t)&off_251795A70;
  result = swift_allocObject();
  *a1 = result;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0;
  *(_WORD *)(result + 32) = 3;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_BYTE *)(result + 72) = 3;
  return result;
}

uint64_t sub_2463AD058@<X0>(uint64_t *a1@<X8>)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  unsigned int *v49;
  unsigned int *v50;
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
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char v79;
  void (*v80)(char *, uint64_t);
  uint64_t *v81;
  uint64_t v82;
  char v83;
  uint64_t *v84;
  uint64_t result;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  NSObject *v121;
  os_log_type_t v122;
  uint8_t *v123;
  uint64_t *v124;
  uint64_t v125;
  char *v126;
  void (*v127)(char *, uint64_t);
  uint64_t *v128;
  uint64_t v129;
  __int16 v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t *v150;
  char *v151;
  char *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  _BYTE v174[32];
  _BYTE v175[24];
  uint64_t v176;
  uint64_t v177;

  v172 = a1;
  v2 = sub_2463C05B8();
  v170 = *(_QWORD *)(v2 - 8);
  v171 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v151 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v152 = (char *)&v151 - v6;
  v7 = sub_2463C0234();
  v163 = *(_QWORD *)(v7 - 8);
  v164 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v162 = (char *)&v151 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570CD8);
  MEMORY[0x24BDAC7A8](v9);
  v154 = (uint64_t)&v151 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2463C01BC();
  v166 = *(_QWORD *)(v11 - 8);
  v167 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v165 = (char *)&v151 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v151 = (char *)&v151 - v14;
  v161 = sub_2463C0264();
  v168 = *(_QWORD *)(v161 - 8);
  MEMORY[0x24BDAC7A8](v161);
  v157 = (char *)&v151 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570CE0);
  v16 = MEMORY[0x24BDAC7A8](v160);
  v155 = (uint64_t)&v151 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v151 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570CE8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v153 = (char *)&v151 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v151 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v156 = (uint64_t)&v151 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v151 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v151 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v151 - v34;
  v159 = sub_2463C0288();
  v158 = *(_QWORD *)(v159 - 8);
  MEMORY[0x24BDAC7A8](v159);
  v37 = (char *)&v151 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2463C0294();
  if (!v176)
    goto LABEL_35;
  v169 = v1;
  sub_2463AE504((uint64_t)v175, (uint64_t)v174, &qword_25756F730);
  sub_2463C0318();
  if (swift_dynamicCast())
  {
    swift_retain();
    sub_2463C0150();
    swift_release();
    if (v173)
    {
      v38 = sub_2463C0270();
      v40 = v39;
      swift_release();
      if (v40)
      {
        v170 = v40;
        v171 = v38;
        swift_retain();
        sub_2463C0150();
        swift_release();
        v168 = v173;
        if (v173)
        {
          swift_retain();
          sub_2463C0180();
          swift_release();
          v41 = sub_2463C03A8();
          swift_release();
          v42 = sub_2463BABAC(1701667182, 0xE400000000000000, v41);
          swift_bridgeObjectRelease();
          if (v42)
          {
            if (v42 >> 62)
            {
              swift_bridgeObjectRetain();
              v43 = sub_2463C08B8();
              swift_bridgeObjectRelease();
              if ((v43 & 0x8000000000000000) != 0)
              {
                __break(1u);
                goto LABEL_104;
              }
            }
            else
            {
              v43 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            if (v43 > 1)
            {
              sub_2463B1E10(1, (v42 & 0xC000000000000001) == 0, v42);
              if ((v42 & 0xC000000000000001) == 0)
              {
                swift_retain();
                goto LABEL_12;
              }
LABEL_104:
              MEMORY[0x249559828](1, v42);
LABEL_12:
              swift_bridgeObjectRelease();
              v44 = sub_2463C039C();
              swift_release();
              if (v44)
              {
                swift_retain();
                v45 = sub_2463C0198();
                v47 = v46;
                swift_release();
              }
              else
              {
                v45 = 0;
                v47 = 0;
              }
LABEL_45:
              v86 = v158;
              v87 = v159;
              (*(void (**)(char *, _QWORD, uint64_t))(v158 + 104))(v37, *MEMORY[0x24BEA0530], v159);
              v88 = sub_2463C027C();
              v90 = v89;
              (*(void (**)(char *, uint64_t))(v86 + 8))(v37, v87);
              if (v47)
              {
                if (v45 == v88 && v47 == v90)
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (!v44)
                    goto LABEL_57;
                }
                else
                {
                  v92 = sub_2463C0900();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  v93 = 0;
                  v94 = 0;
                  if ((v92 & 1) == 0 || !v44)
                    goto LABEL_58;
                }
                swift_retain();
                v95 = sub_2463C018C();
                swift_release();
                if (v95)
                {
                  v93 = sub_2463C0390();
                  v94 = v96;
                  swift_release();
LABEL_58:
                  v97 = v172;
                  v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
                  v97[4] = (uint64_t)&off_251795A70;
                  v98 = swift_allocObject();
                  *v97 = v98;
                  swift_release();
                  swift_release();
                  swift_release();
                  *(_QWORD *)(v98 + 16) = 0;
                  *(_QWORD *)(v98 + 24) = 0;
                  *(_WORD *)(v98 + 32) = 3;
                  v99 = v170;
                  *(_QWORD *)(v98 + 40) = v171;
                  *(_QWORD *)(v98 + 48) = v99;
                  *(_QWORD *)(v98 + 56) = v93;
                  *(_QWORD *)(v98 + 64) = v94;
                  *(_BYTE *)(v98 + 72) = 0;
                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
                  return sub_2463857A0((uint64_t)v175, &qword_25756F730);
                }
              }
              else
              {
                swift_bridgeObjectRelease();
              }
LABEL_57:
              v93 = 0;
              v94 = 0;
              goto LABEL_58;
            }
            swift_bridgeObjectRelease();
          }
        }
        v45 = 0;
        v47 = 0;
        v44 = 0;
        goto LABEL_45;
      }
    }
LABEL_42:
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
    sub_2463857A0((uint64_t)v175, &qword_25756F730);
    v84 = v172;
    v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v84[4] = (uint64_t)&off_251795A70;
    result = swift_allocObject();
    *v84 = result;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 3;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_BYTE *)(result + 72) = 3;
    return result;
  }
  sub_2463C0354();
  v48 = swift_dynamicCast();
  v49 = (unsigned int *)MEMORY[0x24BEA0470];
  if (v48)
  {
    v50 = (unsigned int *)MEMORY[0x24BEA0470];
    swift_retain();
    sub_2463C0150();
    swift_release();
    if (v173)
    {
      sub_2463C0258();
      swift_release();
      v51 = v161;
    }
    else
    {
      v51 = v161;
      __swift_storeEnumTagSinglePayload((uint64_t)v35, 1, 1, v161);
    }
    v67 = v160;
    (*(void (**)(char *, _QWORD, uint64_t))(v168 + 104))(v33, *v50, v51);
    __swift_storeEnumTagSinglePayload((uint64_t)v33, 0, 1, v51);
    v68 = (uint64_t)&v19[*(int *)(v67 + 48)];
    sub_2463AE504((uint64_t)v35, (uint64_t)v19, &qword_257570CE8);
    sub_2463AE504((uint64_t)v33, v68, &qword_257570CE8);
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v51) == 1)
    {
      sub_2463857A0((uint64_t)v33, &qword_257570CE8);
      sub_2463857A0((uint64_t)v35, &qword_257570CE8);
      if (__swift_getEnumTagSinglePayload(v68, 1, v51) == 1)
      {
        sub_2463857A0((uint64_t)v19, &qword_257570CE8);
LABEL_41:
        v81 = v172;
        v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
        v81[4] = (uint64_t)&off_251795A70;
        v82 = swift_allocObject();
        *v81 = v82;
        swift_release();
        *(_QWORD *)(v82 + 16) = 0;
        *(_QWORD *)(v82 + 24) = 0;
        *(_WORD *)(v82 + 32) = 3;
        *(_OWORD *)(v82 + 40) = 0u;
        *(_OWORD *)(v82 + 56) = 0u;
        v83 = 1;
LABEL_81:
        *(_BYTE *)(v82 + 72) = v83;
        goto LABEL_100;
      }
    }
    else
    {
      sub_2463AE504((uint64_t)v19, (uint64_t)v30, &qword_257570CE8);
      if (__swift_getEnumTagSinglePayload(v68, 1, v51) != 1)
      {
        v77 = v168;
        v78 = v157;
        (*(void (**)(char *, uint64_t, uint64_t))(v168 + 32))(v157, v68, v51);
        sub_2463AE548();
        v79 = sub_2463C0600();
        v80 = *(void (**)(char *, uint64_t))(v77 + 8);
        v80(v78, v51);
        sub_2463857A0((uint64_t)v33, &qword_257570CE8);
        sub_2463857A0((uint64_t)v35, &qword_257570CE8);
        v80(v30, v51);
        sub_2463857A0((uint64_t)v19, &qword_257570CE8);
        if ((v79 & 1) == 0)
          goto LABEL_42;
        goto LABEL_41;
      }
      sub_2463857A0((uint64_t)v33, &qword_257570CE8);
      sub_2463857A0((uint64_t)v35, &qword_257570CE8);
      (*(void (**)(char *, uint64_t))(v168 + 8))(v30, v51);
    }
    sub_2463857A0((uint64_t)v19, &qword_257570CE0);
    goto LABEL_42;
  }
  sub_2463C030C();
  if (!swift_dynamicCast())
  {
    sub_2463C02C4();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_2463C0150();
      swift_release();
      v61 = v170;
      v60 = v171;
      if (v173)
      {
        v62 = sub_2463C0270();
        v64 = v63;
        v65 = v172;
        v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
        v65[4] = (uint64_t)&off_251795A70;
        v66 = swift_allocObject();
        *v65 = v66;
        swift_release();
        swift_release();
        *(_QWORD *)(v66 + 16) = 0;
        *(_QWORD *)(v66 + 24) = 0;
        *(_WORD *)(v66 + 32) = 3;
        *(_QWORD *)(v66 + 40) = v62;
        *(_QWORD *)(v66 + 48) = v64;
        *(_QWORD *)(v66 + 56) = 0;
        *(_QWORD *)(v66 + 64) = 0;
        *(_BYTE *)(v66 + 72) = 2;
        goto LABEL_100;
      }
      if (qword_25756EFC0 != -1)
        swift_once();
      v119 = __swift_project_value_buffer(v60, (uint64_t)qword_2575745F8);
      v120 = v152;
      (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v152, v119, v60);
      v121 = sub_2463C05A0();
      v122 = sub_2463C0714();
      if (os_log_type_enabled(v121, v122))
      {
        v123 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v123 = 0;
        _os_log_impl(&dword_246381000, v121, v122, "#Transformer found a noVerb task with no entity. Returning Empty Intent", v123, 2u);
        MEMORY[0x249559E1C](v123, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v61 + 8))(v120, v60);
      v124 = v172;
      v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
      v124[4] = (uint64_t)&off_251795A70;
      v82 = swift_allocObject();
      *v124 = v82;
      swift_release();
      *(_QWORD *)(v82 + 16) = 0;
      *(_QWORD *)(v82 + 24) = 0;
      v83 = 3;
      *(_WORD *)(v82 + 32) = 3;
      *(_OWORD *)(v82 + 40) = 0u;
      *(_OWORD *)(v82 + 56) = 0u;
      goto LABEL_81;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
LABEL_35:
    if (qword_25756EFC0 != -1)
      swift_once();
    v69 = v171;
    v70 = __swift_project_value_buffer(v171, (uint64_t)qword_2575745F8);
    v71 = v170;
    (*(void (**)(char *, uint64_t, uint64_t))(v170 + 16))(v5, v70, v69);
    v72 = sub_2463C05A0();
    v73 = sub_2463C0714();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_246381000, v72, v73, "#Transformer did not have a valid task. Returning Empty Intent", v74, 2u);
      MEMORY[0x249559E1C](v74, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v71 + 8))(v5, v69);
    v75 = v172;
    v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v75[4] = (uint64_t)&off_251795A70;
    v76 = swift_allocObject();
    *v75 = v76;
    *(_QWORD *)(v76 + 16) = 0;
    *(_QWORD *)(v76 + 24) = 0;
    *(_WORD *)(v76 + 32) = 3;
    *(_OWORD *)(v76 + 40) = 0u;
    *(_OWORD *)(v76 + 56) = 0u;
    *(_BYTE *)(v76 + 72) = 3;
    return sub_2463857A0((uint64_t)v175, &qword_25756F730);
  }
  v52 = v177;
  swift_retain();
  sub_2463C0150();
  swift_release();
  v53 = v173;
  if (!v173)
    goto LABEL_98;
  v54 = sub_2463C02B8();
  if (!v54)
    goto LABEL_63;
  v55 = v156;
  v171 = v54;
  sub_2463C0258();
  v56 = *v49;
  v57 = v161;
  (*(void (**)(char *, uint64_t, uint64_t))(v168 + 104))(v25, v56, v161);
  __swift_storeEnumTagSinglePayload((uint64_t)v25, 0, 1, v57);
  v58 = v155;
  v59 = v155 + *(int *)(v160 + 48);
  sub_2463AE504(v55, v155, &qword_257570CE8);
  sub_2463AE504((uint64_t)v25, v59, &qword_257570CE8);
  if (__swift_getEnumTagSinglePayload(v58, 1, v57) == 1)
  {
    sub_2463857A0((uint64_t)v25, &qword_257570CE8);
    sub_2463857A0(v55, &qword_257570CE8);
    if (__swift_getEnumTagSinglePayload(v59, 1, v57) == 1)
    {
      sub_2463857A0(v58, &qword_257570CE8);
LABEL_86:
      v128 = v172;
      v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
      v128[4] = (uint64_t)&off_251795A70;
      v129 = swift_allocObject();
      *v128 = v129;
      swift_release();
      swift_release();
      swift_release();
      *(_QWORD *)(v129 + 16) = 0;
      *(_QWORD *)(v129 + 24) = 0;
      v130 = 259;
      goto LABEL_99;
    }
  }
  else
  {
    v100 = (uint64_t)v153;
    sub_2463AE504(v58, (uint64_t)v153, &qword_257570CE8);
    if (__swift_getEnumTagSinglePayload(v59, 1, v57) != 1)
    {
      v125 = v168;
      v126 = v157;
      (*(void (**)(char *, uint64_t, uint64_t))(v168 + 32))(v157, v59, v57);
      sub_2463AE548();
      LODWORD(v170) = sub_2463C0600();
      v127 = *(void (**)(char *, uint64_t))(v125 + 8);
      v127(v126, v57);
      sub_2463857A0((uint64_t)v25, &qword_257570CE8);
      sub_2463857A0(v156, &qword_257570CE8);
      v127(v153, v57);
      sub_2463857A0(v155, &qword_257570CE8);
      if ((v170 & 1) != 0)
        goto LABEL_86;
      goto LABEL_62;
    }
    sub_2463857A0((uint64_t)v25, &qword_257570CE8);
    sub_2463857A0(v156, &qword_257570CE8);
    (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v100, v57);
  }
  sub_2463857A0(v58, &qword_257570CE0);
LABEL_62:
  swift_release();
LABEL_63:
  v101 = sub_2463C01F8();
  if (!v101)
  {
    v118 = v154;
    __swift_storeEnumTagSinglePayload(v154, 1, 1, v167);
    goto LABEL_90;
  }
  v159 = v53;
  v102 = *(_QWORD *)(v101 + 16);
  v103 = v167;
  if (!v102)
  {
    v117 = 1;
    v118 = v154;
    goto LABEL_89;
  }
  v161 = v52;
  v104 = v101 + ((*(unsigned __int8 *)(v166 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v166 + 80));
  LODWORD(v171) = *MEMORY[0x24BEA0080];
  v168 = *(_QWORD *)(v166 + 72);
  v170 = *(_QWORD *)(v166 + 16);
  v160 = v101;
  swift_bridgeObjectRetain();
  v106 = v164;
  v105 = v165;
  v107 = v163;
  while (1)
  {
    ((void (*)(char *, unint64_t, uint64_t))v170)(v105, v104, v103);
    v108 = sub_2463C01B0();
    v110 = v109;
    v111 = v162;
    (*(void (**)(char *, _QWORD, uint64_t))(v107 + 104))(v162, v171, v106);
    v112 = sub_2463C0228();
    v114 = v113;
    (*(void (**)(char *, uint64_t))(v107 + 8))(v111, v106);
    if (!v110)
    {
      swift_bridgeObjectRelease();
      goto LABEL_74;
    }
    if (v108 == v112 && v110 == v114)
      break;
    v116 = sub_2463C0900();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v116 & 1) != 0)
      goto LABEL_88;
LABEL_74:
    v105 = v165;
    v103 = v167;
    (*(void (**)(char *, uint64_t))(v166 + 8))(v165, v167);
    v104 += v168;
    if (!--v102)
    {
      swift_bridgeObjectRelease();
      v117 = 1;
      v118 = v154;
      goto LABEL_89;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_88:
  swift_bridgeObjectRelease();
  v103 = v167;
  v118 = v154;
  (*(void (**)(uint64_t, char *, uint64_t))(v166 + 32))(v154, v165, v167);
  v117 = 0;
LABEL_89:
  __swift_storeEnumTagSinglePayload(v118, v117, 1, v103);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v118, 1, v103) != 1)
  {
    v137 = v166;
    v138 = v151;
    (*(void (**)(char *, uint64_t, uint64_t))(v166 + 32))(v151, v118, v103);
    v139 = sub_2463C01A4();
    v141 = v140;
    v142 = v172;
    v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v142[4] = (uint64_t)&off_251795A70;
    v143 = swift_allocObject();
    *v142 = v143;
    swift_release();
    swift_release();
    *(_QWORD *)(v143 + 16) = 0;
    *(_QWORD *)(v143 + 24) = 0;
    *(_WORD *)(v143 + 32) = 3;
    *(_QWORD *)(v143 + 40) = v139;
    *(_QWORD *)(v143 + 48) = v141;
    *(_QWORD *)(v143 + 56) = 0;
    *(_QWORD *)(v143 + 64) = 0;
    *(_BYTE *)(v143 + 72) = 2;
    (*(void (**)(char *, uint64_t))(v137 + 8))(v138, v103);
    goto LABEL_100;
  }
LABEL_90:
  sub_2463857A0(v118, &qword_257570CD8);
  v131 = sub_2463C02AC();
  if (v132)
  {
    v133 = v131;
    v134 = v132;
    v135 = v172;
    v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
    v135[4] = (uint64_t)&off_251795A70;
    v136 = swift_allocObject();
    *v135 = v136;
    swift_release();
    swift_release();
    *(_QWORD *)(v136 + 16) = 0;
    *(_QWORD *)(v136 + 24) = 0;
    *(_WORD *)(v136 + 32) = 3;
    *(_QWORD *)(v136 + 40) = v133;
    *(_QWORD *)(v136 + 48) = v134;
    *(_QWORD *)(v136 + 56) = 0;
    *(_QWORD *)(v136 + 64) = 0;
    *(_BYTE *)(v136 + 72) = 2;
    goto LABEL_100;
  }
  if (sub_2463C02B8())
  {
    v144 = sub_2463C0270();
    if (v145)
    {
      v146 = v144;
      v147 = v145;
      v148 = v172;
      v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
      v148[4] = (uint64_t)&off_251795A70;
      v149 = swift_allocObject();
      *v148 = v149;
      swift_release();
      swift_release();
      swift_release();
      *(_QWORD *)(v149 + 16) = 0;
      *(_QWORD *)(v149 + 24) = 0;
      *(_WORD *)(v149 + 32) = 3;
      *(_QWORD *)(v149 + 40) = v146;
      *(_QWORD *)(v149 + 48) = v147;
      *(_QWORD *)(v149 + 56) = 0;
      *(_QWORD *)(v149 + 64) = 0;
      *(_BYTE *)(v149 + 72) = 2;
      goto LABEL_100;
    }
    swift_release();
  }
  swift_release();
LABEL_98:
  v150 = v172;
  v172[3] = (uint64_t)&type metadata for IdentityNLv4Intent;
  v150[4] = (uint64_t)&off_251795A70;
  v129 = swift_allocObject();
  *v150 = v129;
  swift_release();
  *(_QWORD *)(v129 + 16) = 0;
  *(_QWORD *)(v129 + 24) = 0;
  v130 = 3;
LABEL_99:
  *(_WORD *)(v129 + 32) = v130;
  *(_OWORD *)(v129 + 40) = 0u;
  *(_OWORD *)(v129 + 56) = 0u;
  *(_BYTE *)(v129 + 72) = 2;
LABEL_100:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v174);
  return sub_2463857A0((uint64_t)v175, &qword_25756F730);
}

unsigned __int8 *sub_2463AE4AC@<X0>(unsigned __int8 *result@<X0>, uint64_t *a2@<X8>)
{
  int v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v2 = *result;
  v3 = 3;
  if (v2 != 1)
    v3 = 4;
  v4 = v2 == 0;
  v5 = 2;
  if (!v4)
    v5 = v3;
  *a2 = v5;
  return result;
}

uint64_t sub_2463AE4D0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2463AE504(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_2463AE548()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257570CF0;
  if (!qword_257570CF0)
  {
    v1 = sub_2463C0264();
    result = MEMORY[0x249559D74](MEMORY[0x24BEA0488], v1);
    atomic_store(result, (unint64_t *)&qword_257570CF0);
  }
  return result;
}

void OUTLINED_FUNCTION_0_9()
{
  void *v0;

}

id OUTLINED_FUNCTION_3_15()
{
  void *v0;

  return v0;
}

uint64_t InProcessHandlingStrategy.makeSiriKitIntentHandler(app:intent:)@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  void (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v10;

  v8 = *(void (**)(uint64_t, uint64_t))(a3 + 24);
  swift_retain();
  v8(a2, a3);
  swift_getAssociatedTypeWitness();
  v9 = a1;
  sub_2463BFBA4();
  v10 = sub_2463BFBB0();
  return __swift_storeEnumTagSinglePayload(a4, 0, 1, v10);
}

void sub_2463AE644()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v13;
  char v14;
  void (*v15)(char *, uint64_t, uint64_t);
  char v16;
  uint64_t v17[2];

  v1 = v0;
  v2 = sub_2463BFD84();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_11(v4, v17[0]);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v17 - v6;
  v8 = sub_2463BFD60();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v17 - v12;
  sub_2463BFD6C();
  sub_2463BFD54();
  v14 = OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_3_16((uint64_t)v11);
  OUTLINED_FUNCTION_3_16((uint64_t)v13);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v17[1] = v1;
  v15(v7, v1, v2);
  if ((v14 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_7();
    OUTLINED_FUNCTION_10_8();
  }
  else
  {
    sub_2463BFD6C();
    sub_2463BFD30();
    v16 = OUTLINED_FUNCTION_5_11();
    OUTLINED_FUNCTION_3_16((uint64_t)v11);
    OUTLINED_FUNCTION_3_16((uint64_t)v13);
    OUTLINED_FUNCTION_9_7();
    OUTLINED_FUNCTION_10_8();
    if ((v16 & 1) == 0)
    {
      sub_2463BFD6C();
      sub_2463BFD3C();
      OUTLINED_FUNCTION_5_11();
      OUTLINED_FUNCTION_3_16((uint64_t)v11);
      OUTLINED_FUNCTION_3_16((uint64_t)v13);
    }
  }
  ((void (*)(uint64_t, uint64_t))v3)(v1, v2);
  OUTLINED_FUNCTION_5_3();
}

void sub_2463AE7D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = sub_2463BFD84();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_11(v3, v20);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v21 = (uint64_t)&v20 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - v7;
  v9 = sub_2463BFD60();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v20 - v13;
  sub_2463BFD6C();
  sub_2463BFD54();
  v15 = OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_10((uint64_t)v12);
  OUTLINED_FUNCTION_0_10((uint64_t)v14);
  OUTLINED_FUNCTION_6_11((uint64_t)v8);
  if ((v15 & 1) != 0)
  {
    OUTLINED_FUNCTION_8_7((uint64_t)v8);
    v16 = v21;
    OUTLINED_FUNCTION_6_11(v21);
    v17 = v16;
LABEL_5:
    OUTLINED_FUNCTION_8_7(v17);
    OUTLINED_FUNCTION_7_9();
    goto LABEL_6;
  }
  sub_2463BFD6C();
  sub_2463BFD30();
  v18 = OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_10((uint64_t)v12);
  OUTLINED_FUNCTION_0_10((uint64_t)v14);
  OUTLINED_FUNCTION_8_7((uint64_t)v8);
  OUTLINED_FUNCTION_6_11(v21);
  if ((v18 & 1) != 0)
  {
    v17 = v21;
    goto LABEL_5;
  }
  v1 = v21;
  sub_2463BFD6C();
  sub_2463BFD3C();
  v19 = OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_0_10((uint64_t)v12);
  OUTLINED_FUNCTION_0_10((uint64_t)v14);
  OUTLINED_FUNCTION_8_7(v1);
  OUTLINED_FUNCTION_7_9();
  if ((v19 & 1) == 0)
  {
    sub_2463BFD6C();
    sub_2463BFD48();
    OUTLINED_FUNCTION_1_12();
    OUTLINED_FUNCTION_0_10((uint64_t)v12);
    OUTLINED_FUNCTION_0_10((uint64_t)v14);
  }
LABEL_6:
  OUTLINED_FUNCTION_8_7(v1);
  OUTLINED_FUNCTION_5_3();
}

uint64_t OUTLINED_FUNCTION_0_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return sub_2463BFD24();
}

void OUTLINED_FUNCTION_2_11(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_3_16(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  return sub_2463BFD24();
}

uint64_t OUTLINED_FUNCTION_6_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(*(_QWORD *)(v3 - 96), v2, v0);
}

uint64_t OUTLINED_FUNCTION_8_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, _QWORD, uint64_t);
  uint64_t v2;

  return v1(*(_QWORD *)(v2 - 96), *(_QWORD *)(v2 - 88), v0);
}

double IdentityFlowProvider.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  sub_2463C0030();
  sub_2463BFB8C();
  *(_QWORD *)(a1 + 104) = &type metadata for IdentityFlowFactoryImpl;
  *(_QWORD *)(a1 + 112) = &off_251795D20;
  result = 0.0;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 145) = 0u;
  return result;
}

uint64_t IdentityFlowProvider.makeFlow(for:)(uint8_t *a1)
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
  char *v14;
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
  char *v31;
  uint64_t v32;
  void (*v33)(_QWORD);
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint8_t *, uint64_t);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  void (*v78)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  void (*v98)(uint64_t, uint64_t, uint64_t);
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t);
  uint64_t v105;
  void (*v106)(_QWORD);
  uint8_t *v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD v113[3];
  uint64_t v114;
  uint64_t v115;

  v107 = a1;
  v1 = sub_2463C0018();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_8_8();
  v5 = v3 - v4;
  MEMORY[0x24BDAC7A8](v6);
  v96 = (char *)v90 - v7;
  v8 = sub_2463C0024();
  v108 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_8();
  v102 = v9 - v10;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_15_1();
  v100 = v12;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_15_1();
  v99 = v14;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v15);
  v101 = (char *)v90 - v16;
  v17 = sub_2463C05B8();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_8_8();
  v21 = v19 - v20;
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_15_1();
  v95 = v23;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_15_1();
  v91 = v25;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_15_1();
  v28 = v27;
  OUTLINED_FUNCTION_10_3();
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)v90 - v30;
  if (qword_25756EFB0 != -1)
    swift_once();
  v92 = v21;
  v93 = v5;
  v94 = v2;
  v97 = v1;
  v32 = __swift_project_value_buffer(v17, (uint64_t)qword_2575745C8);
  v33 = *(void (**)(_QWORD))(v18 + 16);
  v105 = v32;
  v106 = v33;
  v33(v31);
  v34 = sub_2463C05A0();
  v35 = sub_2463C0738();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_246381000, v34, v35, "Making flow from parse", v36, 2u);
    OUTLINED_FUNCTION_0();
  }

  v104 = *(void (**)(char *, uint64_t))(v18 + 8);
  v104(v31, v17);
  v37 = v28;
  OUTLINED_FUNCTION_3_17(v28);
  v38 = (uint64_t)v107;
  v39 = *(void (**)(char *, uint8_t *, uint64_t))(v108 + 16);
  v40 = (uint64_t)v101;
  v39(v101, v107, v8);
  v41 = sub_2463C05A0();
  v42 = sub_2463C0720();
  v43 = os_log_type_enabled(v41, v42);
  v98 = (void (*)(uint64_t, uint64_t, uint64_t))v39;
  if (v43)
  {
    v44 = OUTLINED_FUNCTION_5();
    v90[1] = v17;
    v45 = (uint8_t *)v44;
    v113[0] = OUTLINED_FUNCTION_5();
    *(_DWORD *)v45 = 136315138;
    v90[0] = v45 + 4;
    v39(v99, (uint8_t *)v40, v8);
    v46 = sub_2463C0624();
    v48 = OUTLINED_FUNCTION_14_9(v46, v47);
    OUTLINED_FUNCTION_4_14(v48);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_12(v40);
    OUTLINED_FUNCTION_13_2(&dword_246381000, v41, v42, "Received parse: %s", v45);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_6_12(v40);

  OUTLINED_FUNCTION_1_13(v37);
  v49 = v102;
  v50 = v103;
  sub_2463A5CA0(v38, (uint64_t *)&v110);
  if (v111)
  {
    sub_246389878(&v110, (uint64_t)v113);
    v51 = v114;
    v52 = v115;
    __swift_project_boxed_opaque_existential_1(v113, v114);
    LODWORD(v51) = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v52 + 48))(v51, v52);
    sub_24638F8D0((uint64_t)v113, (uint64_t)&v110);
    if ((_DWORD)v51)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v110);
LABEL_10:
      sub_2463AF420(v113);
      v54 = v53;
      if (*(_BYTE *)(v50 + 160) == 1 && v53)
      {
        v109 = v53;
        sub_2463AFD48();
        v55 = sub_2463BFB38();
        swift_release();
        OUTLINED_FUNCTION_12_8();
        return v55;
      }
      else
      {
        OUTLINED_FUNCTION_12_8();
      }
      return v54;
    }
    v72 = v111;
    v73 = v112;
    __swift_project_boxed_opaque_existential_1(&v110, v111);
    (*(void (**)(uint64_t, uint64_t))(v73 + 40))(v72, v73);
    v75 = v74;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v110);
    if (!v75)
      goto LABEL_10;
    sub_2463C03E4();
    if (static SiriEnvironment.getUserIdentity()() && (sub_2463BFF1C() & 1) != 0)
    {
      OUTLINED_FUNCTION_13_9();
      goto LABEL_10;
    }
    v84 = v91;
    OUTLINED_FUNCTION_3_17(v91);
    v85 = sub_2463C05A0();
    v86 = sub_2463C0720();
    if (os_log_type_enabled(v85, v86))
    {
      v87 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v87 = 0;
      _os_log_impl(&dword_246381000, v85, v86, "Contacts Reformation flow. Will fall back to server.", v87, 2u);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_13_9();
    OUTLINED_FUNCTION_1_13(v84);
    OUTLINED_FUNCTION_12_8();
    return 0;
  }
  sub_2463897F8((uint64_t)&v110);
  v56 = v100;
  v57 = v98;
  v98(v100, v38, v8);
  v58 = v108;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v108 + 88))(v56, v8) != *MEMORY[0x24BE98E88])
  {
    v76 = v92;
    OUTLINED_FUNCTION_3_17(v92);
    v57(v49, v38, v8);
    v77 = sub_2463C05A0();
    v78 = v57;
    v79 = sub_2463C072C();
    if (os_log_type_enabled(v77, v79))
    {
      v80 = (uint8_t *)OUTLINED_FUNCTION_5();
      v108 = OUTLINED_FUNCTION_5();
      v113[0] = v108;
      *(_DWORD *)v80 = 136315138;
      v107 = v80 + 4;
      v78((uint64_t)v99, v49, v8);
      v81 = sub_2463C0624();
      v83 = OUTLINED_FUNCTION_14_9(v81, v82);
      OUTLINED_FUNCTION_4_14(v83);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_6_12(v102);
      OUTLINED_FUNCTION_13_2(&dword_246381000, v77, v79, "Received unsupported parse: %s", v80);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_6_12(v49);

    v104((char *)v76, v17);
    OUTLINED_FUNCTION_6_12(v100);
    return 0;
  }
  v59 = *(void (**)(uint64_t, uint64_t))(v58 + 96);
  v60 = v100;
  v59(v100, v8);
  v61 = v94;
  v62 = v96;
  v63 = v97;
  (*(void (**)(char *, uint64_t, uint64_t))(v94 + 32))(v96, v60, v97);
  v64 = v95;
  OUTLINED_FUNCTION_3_17(v95);
  v65 = v93;
  (*(void (**)(uint64_t, char *, uint64_t))(v61 + 16))(v93, v62, v63);
  v66 = sub_2463C05A0();
  v67 = sub_2463C0738();
  if (os_log_type_enabled(v66, v67))
  {
    v68 = (uint8_t *)OUTLINED_FUNCTION_5();
    v113[0] = OUTLINED_FUNCTION_5();
    *(_DWORD *)v68 = 136315138;
    v69 = sub_2463C0000();
    v71 = OUTLINED_FUNCTION_14_9(v69, v70);
    OUTLINED_FUNCTION_4_14(v71);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v65, v97);
    OUTLINED_FUNCTION_13_2(&dword_246381000, v66, v67, "Received direct invocation with identifier %s", v68);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v65, v63);

  OUTLINED_FUNCTION_1_13(v64);
  type metadata accessor for SwitchProfileWrapperFlow();
  v113[0] = sub_246389F78();
  sub_2463AFD08();
  v88 = sub_2463BFB38();
  swift_release();
  if (*(_BYTE *)(v103 + 160) == 1)
  {
    v113[0] = v88;
    sub_2463AFD48();
    v54 = sub_2463BFB38();
    OUTLINED_FUNCTION_13_9();
    OUTLINED_FUNCTION_9_8();
  }
  else
  {
    OUTLINED_FUNCTION_9_8();
    return v88;
  }
  return v54;
}

void sub_2463AF420(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v11[3];

  v2 = sub_2463C05B8();
  v11[1] = *(_QWORD *)(v2 - 8);
  v11[2] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for Signpost.OpenSignpost();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25756EF48 != -1)
    swift_once();
  v6 = (id)qword_25756F958;
  sub_2463C0588();
  sub_2463C0750();
  sub_2463C057C();
  v7 = &v5[*(int *)(v3 + 20)];
  *(_QWORD *)v7 = "MakeFlow";
  *((_QWORD *)v7 + 1) = 8;
  *((_WORD *)v7 + 8) = 2;
  v8 = a1[3];
  v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  v10 = (char *)&loc_2463AF564
      + 4 * byte_2463C2F60[(*(unsigned __int8 (**)(uint64_t, uint64_t))(v9 + 48))(v8, v9)];
  __asm { BR              X10 }
}

uint64_t sub_2463AF83C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD v35[5];
  uint64_t v36[5];
  _QWORD v37[5];
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 v41;

  v32 = sub_2463C05B8();
  v31 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v33 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756FE68);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2463BFCA0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24638F8D0(a1, (uint64_t)v37);
  sub_2463B00AC(v1 + 120, (uint64_t)v36);
  sub_24638F8D0(v1, (uint64_t)v35);
  sub_2463B5F44((uint64_t)v37, (uint64_t)v36, v35, &v38);
  v11 = v41;
  sub_2463B00F4((uint64_t)&v38);
  type metadata accessor for SwitchProfileIntent();
  v30 = a1;
  sub_2463964A0();
  v13 = v12;
  sub_24638F8D0(v1 + 40, (uint64_t)&v38);
  v34 = v40;
  __swift_project_boxed_opaque_existential_1(&v38, v39);
  sub_2463BFC34();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE97798], v7);
  v14 = objc_msgSend(v13, sel_typeName);
  sub_2463C0618();

  v15 = sub_2463BFBEC();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v15);
  *(_BYTE *)(swift_allocObject() + 16) = v11;
  sub_2463BFC28();
  sub_2463BFB98();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
  if (v11 == 3)
  {
    v16 = v13;
    if (qword_25756EFB0 != -1)
      swift_once();
    v17 = v32;
    v18 = __swift_project_value_buffer(v32, (uint64_t)qword_2575745C8);
    v19 = v31;
    v20 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v33, v18, v17);
    sub_24638F8D0(v30, (uint64_t)&v38);
    v21 = sub_2463C05A0();
    v22 = sub_2463C072C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v36[0] = v24;
      *(_DWORD *)v23 = 136315138;
      sub_24638F8D0((uint64_t)&v38, (uint64_t)v37);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257570278);
      v25 = sub_2463C0624();
      v37[0] = sub_24639AE68(v25, v26, v36);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
      _os_log_impl(&dword_246381000, v21, v22, "makeFlow unsupported for %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249559E1C](v24, -1, -1);
      MEMORY[0x249559E1C](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v19 + 8))(v33, v17);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v38);
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v17);
    }
    return 0;
  }
  else
  {
    type metadata accessor for SwitchProfileWrapperFlow();
    *(_QWORD *)&v38 = sub_246389F78();
    sub_2463AFD08();
    v27 = sub_2463BFB38();

    swift_release();
  }
  return v27;
}

uint64_t sub_2463AFCB8(uint64_t a1, uint64_t a2)
{
  sub_246396B14(a2, 3, 0x100000000, 0x100000000);
  return sub_2463BFC1C();
}

unint64_t sub_2463AFD08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25756F948;
  if (!qword_25756F948)
  {
    v1 = type metadata accessor for SwitchProfileWrapperFlow();
    result = MEMORY[0x249559D74](&unk_2463C1870, v1);
    atomic_store(result, (unint64_t *)&qword_25756F948);
  }
  return result;
}

unint64_t sub_2463AFD48()
{
  unint64_t result;

  result = qword_257570CF8;
  if (!qword_257570CF8)
  {
    result = MEMORY[0x249559D74](&unk_2463C37F4, &type metadata for GuardedFlow);
    atomic_store(result, (unint64_t *)&qword_257570CF8);
  }
  return result;
}

uint64_t destroy for IdentityFlowProvider(uint64_t a1)
{
  uint64_t result;

  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  result = __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  if (*(_QWORD *)(a1 + 144))
    return __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  return result;
}

uint64_t initializeWithCopy for IdentityFlowProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  v7 = (_OWORD *)(a1 + 120);
  v8 = (_OWORD *)(a2 + 120);
  v9 = *(_QWORD *)(a2 + 144);
  if (v9)
  {
    v10 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = v9;
    *(_QWORD *)(a1 + 152) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 136);
    *v7 = *v8;
    *(_OWORD *)(a1 + 136) = v11;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  }
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  return a1;
}

uint64_t assignWithCopy for IdentityFlowProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
  v4 = *(_QWORD *)(a2 + 144);
  if (!*(_QWORD *)(a1 + 144))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 144) = v4;
      *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 120, a2 + 120);
      goto LABEL_8;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 120);
    v6 = *(_OWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 120) = v5;
    *(_OWORD *)(a1 + 136) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
LABEL_8:
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  return a1;
}

void *__swift_memcpy161_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA1uLL);
}

uint64_t assignWithTake for IdentityFlowProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

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
  if (*(_QWORD *)(a1 + 144))
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  v6 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v6;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityFlowProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 161))
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

uint64_t storeEnumTagSinglePayload for IdentityFlowProvider(uint64_t result, int a2, int a3)
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
    *(_BYTE *)(result + 160) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 161) = 1;
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
    *(_BYTE *)(result + 161) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityFlowProvider()
{
  return &type metadata for IdentityFlowProvider;
}

uint64_t sub_2463B00AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2463B00F4(uint64_t a1)
{
  destroy for SwitchProfileUseCases();
  return a1;
}

uint64_t sub_2463B0128()
{
  return swift_deallocObject();
}

uint64_t sub_2463B0138(uint64_t a1)
{
  uint64_t v1;

  return sub_2463AFCB8(a1, *(unsigned __int8 *)(v1 + 16));
}

uint64_t OUTLINED_FUNCTION_1_13(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 216))(a1, v1);
}

uint64_t OUTLINED_FUNCTION_3_17(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 - 200))(a1, *(_QWORD *)(v2 - 208), v1);
}

uint64_t OUTLINED_FUNCTION_4_14(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 168) = a1;
  return v1 - 168;
}

uint64_t OUTLINED_FUNCTION_6_12(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_9_8()
{
  uint64_t (*v0)(_QWORD, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(*(_QWORD *)(v2 - 280), v1);
}

uint64_t OUTLINED_FUNCTION_12_8()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_13_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_14_9(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_24639AE68(a1, a2, (uint64_t *)(v2 - 128));
}

uint64_t destroy for IdentityNLv4Intent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IdentityNLv4Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IdentityNLv4Intent(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for IdentityNLv4Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityNLv4Intent(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 57))
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

uint64_t storeEnumTagSinglePayload for IdentityNLv4Intent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 57) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityNLv4Intent()
{
  return &type metadata for IdentityNLv4Intent;
}

uint64_t sub_2463B0434()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2463B0460()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2463B0468()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_2463B0470()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2463B049C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2463B04C8()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

BOOL sub_2463B04D0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_2463B04DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  IdentityVerb.rawValue.getter();
  v1 = v0;
  v3 = v2;
  IdentityVerb.rawValue.getter();
  if (v1 != v5 || v3 != v4)
    OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_1();
}

void sub_2463B0544()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_11_6();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_1();
}

void sub_2463B059C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_11_6();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_5_12();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_0_1();
}

void sub_2463B05F4()
{
  OUTLINED_FUNCTION_9_9();
  IdentityVerb.rawValue.getter();
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_31_1();
}

void sub_2463B0628()
{
  OUTLINED_FUNCTION_9_9();
  OUTLINED_FUNCTION_14_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_31_1();
}

void sub_2463B0650()
{
  sub_2463B081C();
}

uint64_t sub_2463B065C()
{
  sub_2463C0978();
  sub_2463C0984();
  return sub_2463C0990();
}

void sub_2463B06B0()
{
  OUTLINED_FUNCTION_9_9();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_31_1();
}

void sub_2463B06D8()
{
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_25();
}

uint64_t sub_2463B06F0()
{
  IdentityVerb.rawValue.getter();
  sub_2463C0648();
  return OUTLINED_FUNCTION_2_12();
}

uint64_t sub_2463B072C()
{
  OUTLINED_FUNCTION_8_9();
  return OUTLINED_FUNCTION_2_12();
}

uint64_t sub_2463B0764()
{
  OUTLINED_FUNCTION_8_9();
  return OUTLINED_FUNCTION_2_12();
}

uint64_t sub_2463B079C()
{
  return sub_2463C0984();
}

uint64_t sub_2463B07D0()
{
  sub_2463C0978();
  sub_2463C0984();
  return sub_2463C0990();
}

void sub_2463B081C()
{
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_8_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_31_1();
}

void sub_2463B0868()
{
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_14_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_31_1();
}

void sub_2463B0890()
{
  OUTLINED_FUNCTION_12_9();
  IdentityVerb.rawValue.getter();
  OUTLINED_FUNCTION_7_10();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_31_1();
}

void sub_2463B08C4()
{
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_4_15();
  OUTLINED_FUNCTION_31_1();
}

uint64_t sub_2463B08EC(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;

  if (a1 == 30)
    v1 = 2;
  else
    v1 = 4;
  if (a1 == 40)
    v2 = 3;
  else
    v2 = v1;
  if (a1 == 20)
    v3 = 1;
  else
    v3 = v2;
  if (a1 == 10)
    return 0;
  else
    return v3;
}

uint64_t sub_2463B0920(unsigned __int8 a1)
{
  return 10 * a1 + 10;
}

uint64_t sub_2463B0934()
{
  return sub_2463B065C();
}

uint64_t sub_2463B093C()
{
  return sub_2463B079C();
}

uint64_t sub_2463B0944()
{
  return sub_2463B07D0();
}

uint64_t sub_2463B094C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_2463B08EC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_2463B0974@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = sub_2463B0920(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_2463B099C()
{
  uint64_t v0;
  __int128 v2;

  BYTE8(v2) = 0;
  sub_2463C07E0();
  sub_2463C0654();
  *(_QWORD *)&v2 = *(unsigned __int8 *)(v0 + 16);
  sub_2463C084C();
  sub_2463C0654();
  swift_bridgeObjectRetain();
  sub_2463C0654();
  OUTLINED_FUNCTION_10();
  sub_2463C0654();
  return *(_QWORD *)((char *)&v2 + 1);
}

uint64_t sub_2463B0A74(unsigned __int8 a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = a1;
  return ((uint64_t (*)(void))((char *)&loc_2463B0AAC + 4 * byte_2463C3000[a1]))();
}

uint64_t sub_2463B0B00()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IdentityFlowError()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for IdentityFlowErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2463B0B90 + 4 * byte_2463C3009[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2463B0BC4 + 4 * byte_2463C3004[v4]))();
}

uint64_t sub_2463B0BC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463B0BCC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463B0BD4);
  return result;
}

uint64_t sub_2463B0BE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463B0BE8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2463B0BEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463B0BF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IdentityFlowErrorCode()
{
  return &type metadata for IdentityFlowErrorCode;
}

unint64_t sub_2463B0C14()
{
  unint64_t result;

  result = qword_257570DB8;
  if (!qword_257570DB8)
  {
    result = MEMORY[0x249559D74](&unk_2463C30F0, &type metadata for IdentityFlowErrorCode);
    atomic_store(result, (unint64_t *)&qword_257570DB8);
  }
  return result;
}

uint64_t sub_2463B0C60()
{
  return sub_2463B099C();
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return sub_2463C0984();
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_15()
{
  return sub_2463C0990();
}

uint64_t OUTLINED_FUNCTION_5_12()
{
  return sub_2463C0900();
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return sub_2463C0648();
}

uint64_t OUTLINED_FUNCTION_8_9()
{
  return sub_2463C0648();
}

uint64_t OUTLINED_FUNCTION_9_9()
{
  return sub_2463C0978();
}

uint64_t OUTLINED_FUNCTION_12_9()
{
  return sub_2463C0978();
}

uint64_t OUTLINED_FUNCTION_13_10()
{
  return sub_2463C0984();
}

uint64_t OUTLINED_FUNCTION_14_10()
{
  return sub_2463B072C();
}

uint64_t sub_2463B0D10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570DC0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2463C1F90;
  *(_QWORD *)(v4 + 32) = v0;
  v9 = v4;
  sub_2463C069C();
  v5 = v9;
  swift_retain();
  sub_2463C0204();
  v6 = sub_2463C0210();
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 0, 1, v6);
  MEMORY[0x24955921C](v5, v3);
  swift_bridgeObjectRelease();
  sub_2463B1228((uint64_t)v3);
  sub_2463C012C();
  return swift_release();
}

uint64_t sub_2463B0E84@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  _QWORD v30[2];
  uint64_t v31;
  char *v32;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v4 = sub_2463C0114();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v32 = (char *)v30 - v9;
  v10 = sub_2463C00A8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_94_0();
  v40 = v12;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v30 - v14;
  v16 = sub_2463C0078();
  MEMORY[0x24BDAC7A8](v16);
  v36 = (char *)v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2463C00CC();
  v38 = *(_QWORD *)(v18 - 8);
  v39 = v18;
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_94_0();
  v35 = v19;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v30 - v21;
  v37 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    a1 = v37;
    result = sub_2463C08B8();
    v23 = result;
  }
  else
  {
    v23 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v33 = v8;
  if (!v23)
  {
    swift_bridgeObjectRelease();
LABEL_16:
    v29 = v32;
    sub_2463C0108();
    sub_2463C00FC();
    sub_2463C00E4();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v33, v29, v4);
    sub_2463C00D8();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v29, v4);
  }
  if (v23 >= 1)
  {
    v30[0] = v5;
    v30[1] = a2;
    v31 = v4;
    v25 = 0;
    v34 = a1 & 0xC000000000000001;
    v26 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v34)
        MEMORY[0x249559828](v25, a1);
      else
        swift_retain();
      sub_2463C00C0();
      sub_2463B0D10();
      sub_2463C00B4();
      sub_2463C009C();
      (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v35, v22, v39);
      sub_2463C0090();
      (*(void (**)(uint64_t, char *, uint64_t))(v11 + 16))(v40, v15, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v26 = OUTLINED_FUNCTION_1_15(0, *(_QWORD *)(v26 + 16) + 1);
      v28 = *(_QWORD *)(v26 + 16);
      v27 = *(_QWORD *)(v26 + 24);
      if (v28 >= v27 >> 1)
        v26 = OUTLINED_FUNCTION_1_15(v27 > 1, v28 + 1);
      ++v25;
      *(_QWORD *)(v26 + 16) = v28 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v11 + 32))(v26+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v28, v40, v10);
      swift_release();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v39);
      a1 = v37;
    }
    while (v23 != v25);
    swift_bridgeObjectRelease();
    v4 = v31;
    v5 = v30[0];
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_2463B1228(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570DC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_15(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_2463B94F8(a1, a2, 1, v2);
}

uint64_t sub_2463B1274(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_3_18();
    v12 = OUTLINED_FUNCTION_10_9();
    OUTLINED_FUNCTION_10();
    if (v12)
    {
      swift_bridgeObjectRetain();
      v2 = OUTLINED_FUNCTION_10_9();
      OUTLINED_FUNCTION_10();
      goto LABEL_4;
    }
    return 23899;
  }
  if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    return 23899;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_4:
  if (!v2)
  {
LABEL_13:
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570E88);
    sub_2463B279C(&qword_257570E90, &qword_257570E88, MEMORY[0x24BEE12B0]);
    sub_2463C05F4();
    swift_bridgeObjectRelease();
    sub_2463C0654();
    swift_bridgeObjectRelease();
    sub_2463C0654();
    return 592475;
  }
  v13 = MEMORY[0x24BEE4AF8];
  result = (uint64_t)sub_2463B1FDC(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        MEMORY[0x249559828](v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      sub_2463C0504();
      v6 = sub_2463C0624();
      v8 = v7;
      v10 = *(_QWORD *)(v13 + 16);
      v9 = *(_QWORD *)(v13 + 24);
      if (v10 >= v9 >> 1)
        sub_2463B1FDC((char *)(v9 > 1), v10 + 1, 1);
      ++v4;
      *(_QWORD *)(v13 + 16) = v10 + 1;
      v11 = v13 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v6;
      *(_QWORD *)(v11 + 40) = v8;
    }
    while (v2 != v4);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_2463B1474()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
  v0 = OUTLINED_FUNCTION_34();
  *(_OWORD *)(v0 + 16) = xmmword_2463C1F90;
  sub_2463C054C();
  *(_QWORD *)(v0 + 32) = sub_2463C0540();
  sub_2463C069C();
  return v0;
}

uint64_t sub_2463B14E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[11] = a2;
  v3[12] = v2;
  v4 = sub_2463C05B8();
  v3[13] = v4;
  v3[14] = *(_QWORD *)(v4 - 8);
  v3[15] = swift_task_alloc();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B1538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD *v22;
  uint64_t v24;

  if (qword_25756EFB8 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_2463C05A0();
  v6 = sub_2463C0720();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 120);
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 88);
  if (v7)
  {
    v12 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    *(_DWORD *)v12 = 134218242;
    *(_QWORD *)(v0 + 72) = sub_2463B1900(v11);
    sub_2463C078C();
    *(_WORD *)(v12 + 12) = 2080;
    v13 = swift_bridgeObjectRetain();
    v14 = sub_2463B1EFC(v13);
    swift_bridgeObjectRelease();
    v15 = sub_2463B1274(v14);
    v17 = v16;
    swift_release();
    *(_QWORD *)(v0 + 80) = sub_24639AE68(v15, v17, &v24);
    sub_2463C078C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_10();
    _os_log_impl(&dword_246381000, v5, v6, "SwitchProfileDeviceResolutionStrategy.processDevices() Found %ld capable remote devices: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_8_10();

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v18 = *(_QWORD *)(v0 + 96);
  v19 = *(_OWORD *)(v18 + 72);
  v20 = *(_OWORD *)(v18 + 88);
  v21 = *(_OWORD *)(v18 + 56);
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v18 + 104);
  *(_OWORD *)(v0 + 32) = v19;
  *(_OWORD *)(v0 + 48) = v20;
  *(_OWORD *)(v0 + 16) = v21;
  v22 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v22;
  *v22 = v0;
  v22[1] = sub_2463B17B8;
  return sub_246385D9C(v0 + 16, *(_QWORD *)(v0 + 88));
}

uint64_t sub_2463B17B8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = a1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1();
}

void sub_2463B180C()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 136);
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    v2 = 0;
    v4 = 3;
LABEL_11:
    swift_task_dealloc();
    (*(void (**)(id, uint64_t))(v0 + 8))(v2, v4);
    return;
  }
  swift_bridgeObjectRetain();
  v5 = sub_2463C08B8();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_10;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x249559828](0, *(_QWORD *)(v0 + 136));
LABEL_6:
    OUTLINED_FUNCTION_10();
    sub_2463C04F8();
    v3 = sub_2463C0564();
    if (sub_2463C0564() >= v3)
      v4 = 1;
    else
      v4 = 2;
    goto LABEL_11;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(id *)(*(_QWORD *)(v0 + 136) + 32);
    goto LABEL_6;
  }
  __break(1u);
}

uint64_t sub_2463B1900(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_2463C087C();
  else
    return *(_QWORD *)(a1 + 16);
}

uint64_t sub_2463B1920()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
  return v0;
}

uint64_t sub_2463B1954()
{
  sub_2463B1920();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SwitchProfileDeviceResolutionStrategy()
{
  return objc_opt_self();
}

char *sub_2463B1994(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_11();
    __src = (char *)OUTLINED_FUNCTION_2_13();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_2463B19F8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2463C08C4();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_2463B1A7C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2463B1AA0(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for UserAccount);
}

uint64_t sub_2463B1A88(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2463B1AA0(a1, a2, a3, (void (*)(_QWORD))MEMORY[0x24BE97730]);
}

uint64_t sub_2463B1A94(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2463B1AA0(a1, a2, a3, (void (*)(_QWORD))MEMORY[0x24BE9C828]);
}

uint64_t sub_2463B1AA0(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_11();
    result = OUTLINED_FUNCTION_2_13();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_7_11();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_7_11();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_2463B1B68(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_2463C08C4();
    __break(1u);
  }
  else
  {
    sub_2463C0504();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2463B1C50(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_2463C08C4();
  __break(1u);
  return result;
}

uint64_t sub_2463B1D1C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2463B1D34(a1, a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for UserAccount);
}

uint64_t sub_2463B1D28(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_2463B1D34(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BE97730]);
}

uint64_t sub_2463B1D34(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a4(0) - 8) + 72) * a2;
    v7 = a3 + v6;
    v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
      return swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_0_11();
  result = sub_2463C08C4();
  __break(1u);
  return result;
}

unint64_t sub_2463B1E14(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

_QWORD *sub_2463B1E38(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_8;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
      v3 = (_QWORD *)OUTLINED_FUNCTION_34();
      _swift_stdlib_malloc_size(v3);
      OUTLINED_FUNCTION_5_13();
      v3[2] = v2;
      v3[3] = v4;
    }
    swift_bridgeObjectRetain();
    sub_2463B223C((uint64_t)(v3 + 4), v2, v1);
    v1 = v5;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_8:
    OUTLINED_FUNCTION_3_18();
    v2 = OUTLINED_FUNCTION_10_9();
    OUTLINED_FUNCTION_10();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_2463B1EFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_2463C087C();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (uint64_t *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
    v3 = (uint64_t *)OUTLINED_FUNCTION_34();
    _swift_stdlib_malloc_size(v3);
    OUTLINED_FUNCTION_5_13();
    v3[2] = v2;
    v3[3] = v4;
  }
  swift_bridgeObjectRetain();
  v5 = sub_2463B24B8(&v7, v3 + 4, v2, a1);
  result = sub_2463B275C();
  if (v5 == v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

char *sub_2463B1FDC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2463B2014(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_2463B1FF8(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2463B20F4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2463B2014(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257570E98);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2463B19F8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2463B1C50((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_2463B20F4(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570EB0);
  v10 = *(_QWORD *)(sub_2463BFC94() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_2463BFC94() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_2463B1AA0(v18, v8, v17, (void (*)(_QWORD))MEMORY[0x24BE97730]);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2463B1D34(v18, v8, v17, (uint64_t (*)(_QWORD))MEMORY[0x24BE97730]);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_2463B223C(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *, _QWORD);
  void (*v11)(_QWORD *, _QWORD);
  id *v12;
  id v13;
  _QWORD v14[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2463C08B8();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_2463C08B8();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2463B279C(&qword_257570EA8, &qword_257570EA0, MEMORY[0x24BEE12E0]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_257570EA0);
            sub_2463B23D4(v14, i, a3);
            v11 = v10;
            v13 = *v12;
            v11(v14, 0);
            *(_QWORD *)(v5 + 8 * i) = v13;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_2463B1B68((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_2463B23D4(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  sub_2463B244C(v6, a2, a3);
  v6[4] = v7;
  OUTLINED_FUNCTION_0_1();
}

void sub_2463B2420(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_2463B244C(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_2463B1E14(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x249559828](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  OUTLINED_FUNCTION_0_1();
}

void sub_2463B24B0(id *a1)
{

}

uint64_t sub_2463B24B8(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  _QWORD v24[5];

  if ((a4 & 0xC000000000000001) != 0)
  {
    result = sub_2463C0870();
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = result | 0x8000000000000000;
    if (a2)
      goto LABEL_3;
LABEL_34:
    v13 = 0;
LABEL_43:
    *a1 = v12;
    a1[1] = v8;
    a1[2] = v9;
    a1[3] = v10;
    a1[4] = v11;
    return v13;
  }
  result = sub_2463B2764(a4, v24);
  v12 = v24[0];
  v8 = v24[1];
  v9 = v24[2];
  v10 = v24[3];
  v11 = v24[4];
  if (!a2)
    goto LABEL_34;
LABEL_3:
  if (!a3)
  {
    v13 = 0;
    goto LABEL_43;
  }
  if (a3 < 0)
    goto LABEL_45;
  v21 = v9;
  v13 = 0;
  v22 = (v9 + 64) >> 6;
  while (1)
  {
    if ((v12 & 0x8000000000000000) != 0)
    {
      if (!sub_2463C0888())
        goto LABEL_42;
      sub_2463C0504();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v16 = v23;
      result = swift_unknownObjectRelease();
      if (!v23)
        goto LABEL_42;
      goto LABEL_23;
    }
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v10 << 6);
      goto LABEL_22;
    }
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v17 >= v22)
    {
      v11 = 0;
      goto LABEL_42;
    }
    v18 = *(_QWORD *)(v8 + 8 * v17);
    if (v18)
      goto LABEL_21;
    v19 = v10 + 2;
    if (v10 + 2 >= v22)
    {
      v11 = 0;
      ++v10;
      goto LABEL_42;
    }
    v18 = *(_QWORD *)(v8 + 8 * v19);
    if (!v18)
    {
      if (v10 + 3 >= v22)
        goto LABEL_39;
      v18 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v18)
      {
        v17 = v10 + 3;
        goto LABEL_21;
      }
      v19 = v10 + 4;
      if (v10 + 4 >= v22)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_42;
      }
      v18 = *(_QWORD *)(v8 + 8 * v19);
      if (!v18)
      {
        v17 = v10 + 5;
        if (v10 + 5 >= v22)
        {
LABEL_39:
          v11 = 0;
          v10 = v19;
          goto LABEL_42;
        }
        v18 = *(_QWORD *)(v8 + 8 * v17);
        if (!v18)
        {
          v20 = v10 + 6;
          while (v20 < v22)
          {
            v18 = *(_QWORD *)(v8 + 8 * v20++);
            if (v18)
            {
              v17 = v20 - 1;
              goto LABEL_21;
            }
          }
          v11 = 0;
          v10 = v22 - 1;
          goto LABEL_42;
        }
        goto LABEL_21;
      }
    }
    v17 = v19;
LABEL_21:
    v11 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v17 << 6);
    v10 = v17;
LABEL_22:
    result = (uint64_t)*(id *)(*(_QWORD *)(v12 + 48) + 8 * v15);
    v16 = result;
    if (!result)
      goto LABEL_42;
LABEL_23:
    ++v13;
    *a2++ = v16;
    if (v13 == a3)
    {
      v13 = a3;
LABEL_42:
      v9 = v21;
      goto LABEL_43;
    }
  }
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_2463B275C()
{
  return swift_release();
}

uint64_t sub_2463B2764@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_2463B279C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249559D74](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return sub_2463C08C4();
}

uint64_t OUTLINED_FUNCTION_3_18()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_10()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_10_9()
{
  return sub_2463C08B8();
}

uint64_t sub_2463B285C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  v3[10] = OUTLINED_FUNCTION_3_4();
  v4 = sub_2463BFE98();
  v3[11] = v4;
  v3[12] = *(_QWORD *)(v4 - 8);
  v3[13] = OUTLINED_FUNCTION_11_1();
  v3[14] = OUTLINED_FUNCTION_11_1();
  v3[15] = OUTLINED_FUNCTION_11_1();
  v5 = sub_2463C05B8();
  v3[16] = v5;
  v3[17] = *(_QWORD *)(v5 - 8);
  v3[18] = OUTLINED_FUNCTION_3_4();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B28FC()
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
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  id v22;
  char v23;
  _QWORD *v24;

  if (qword_25756EFB8 != -1)
    swift_once();
  v2 = v0[17];
  v1 = v0[18];
  v3 = v0[16];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_2463C05A0();
  v6 = sub_2463C0720();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v5, v6, "IdentifyUserIdentityHandleIntentStrategy.makeIntentHandledResponse()", v7);
    OUTLINED_FUNCTION_0();
  }
  v9 = v0[17];
  v8 = v0[18];

  OUTLINED_FUNCTION_22_0(v8, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570678);
  v10 = (void *)sub_2463BFF4C();
  v11 = objc_msgSend(v10, sel_identity);
  v0[19] = v11;

  if (v11
    && (v13 = OUTLINED_FUNCTION_17_6(v12, sel_isMultiUserContext)) != 0
    && (v14 = v13, v15 = objc_msgSend(v13, sel_BOOLValue), v14, (_DWORD)v15))
  {
    v17 = OUTLINED_FUNCTION_17_6(v16, sel_fullConfidence);
    if (v17)
    {
      v18 = OUTLINED_FUNCTION_21_6(v17);

    }
    else
    {
      v18 = 0;
    }
    v22 = OUTLINED_FUNCTION_17_6((uint64_t)v17, sel_setupInProgress);
    if (v22)
    {
      v23 = OUTLINED_FUNCTION_21_6(v22);

    }
    else
    {
      v23 = 0;
    }
    v24 = (_QWORD *)swift_task_alloc();
    v0[20] = v24;
    *v24 = v0;
    v24[1] = sub_2463B2B40;
    return sub_2463959F0(v0[14], v18, v23);
  }
  else
  {
    v19 = *(_QWORD *)(v0[9] + 144);
    v20 = (_QWORD *)swift_task_alloc();
    v0[22] = v20;
    *v20 = v0;
    v20[1] = sub_2463B2CA8;
    return sub_2463956CC(v0[13], v19);
  }
}

uint64_t sub_2463B2B40()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 168) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B2B94()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 152);
  v16 = *(_QWORD *)(v0 + 88);
  v17 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  OUTLINED_FUNCTION_13_11(v17);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 104), *(_QWORD *)(v2 + 128));
  sub_2463BFC58();
  sub_2463B2EB0((uint64_t)v1);
  v3 = OUTLINED_FUNCTION_13_6();
  v4 = OUTLINED_FUNCTION_4_11(v3);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  OUTLINED_FUNCTION_104_0(v4, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_3_19();
  swift_bridgeObjectRelease();

  v5 = sub_2463857A0(v0 + 16, &qword_257570230);
  v6 = OUTLINED_FUNCTION_19_5(v5, &qword_257570220);
  OUTLINED_FUNCTION_10_10(v6, v7, v8, v9, v10, v11, v12, v13, v0 + 16, v15, v16, v17);
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  return OUTLINED_FUNCTION_1_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463B2CA8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 184) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B2CFC()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 152);
  v16 = *(_QWORD *)(v0 + 88);
  v17 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  OUTLINED_FUNCTION_13_11(v17);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 104), *(_QWORD *)(v2 + 128));
  sub_2463BFC58();
  sub_2463B2EB0((uint64_t)v1);
  v3 = OUTLINED_FUNCTION_13_6();
  v4 = OUTLINED_FUNCTION_4_11(v3);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  OUTLINED_FUNCTION_104_0(v4, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_3_19();
  swift_bridgeObjectRelease();

  v5 = sub_2463857A0(v0 + 16, &qword_257570230);
  v6 = OUTLINED_FUNCTION_19_5(v5, &qword_257570220);
  OUTLINED_FUNCTION_10_10(v6, v7, v8, v9, v10, v11, v12, v13, v0 + 16, v15, v16, v17);
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  return OUTLINED_FUNCTION_1_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463B2E10()
{
  uint64_t v0;

  OUTLINED_FUNCTION_5_14();
  OUTLINED_FUNCTION_14_2();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_2_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463B2E60()
{
  uint64_t v0;

  OUTLINED_FUNCTION_5_14();
  OUTLINED_FUNCTION_14_2();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_2_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463B2EB0(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD v30[2];
  uint64_t v31;
  _BYTE v32[40];

  v31 = sub_2463C04A4();
  v2 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2463C05B8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v30 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F510);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2463C03E4();
  if (sub_2463C03CC())
  {
    sub_2463C03B4();
    swift_release();
    sub_2463BFF10();
    swift_release();
    v15 = sub_2463BFD84();
    v16 = 0;
  }
  else
  {
    v15 = sub_2463BFD84();
    v16 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v14, v16, 1, v15);
  if (a1 && (sub_2463851FC((uint64_t)v14), v17))
  {
    v18 = v17;
    if (qword_25756EFB8 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v5, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v11, v19, v5);
    v20 = sub_2463C05A0();
    v21 = sub_2463C0720();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v22 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v20, v21, "Building views for user", v22);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_22_0((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_24638F8D0(v30[1] + 104, (uint64_t)v32);
    sub_2463C0498();
    v23 = sub_2463C048C();

    v24 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v31);
  }
  else
  {
    if (qword_25756EFB8 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v5, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v25, v5);
    v26 = sub_2463C05A0();
    v27 = sub_2463C072C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v28 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v26, v27, "Not building views: Couldn't convert identity to contact", v28);
      OUTLINED_FUNCTION_0();
    }

    v24 = OUTLINED_FUNCTION_22_0((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    v23 = MEMORY[0x24BEE4AF8];
  }
  OUTLINED_FUNCTION_19_5(v24, &qword_25756F510);
  return v23;
}

uint64_t type metadata accessor for IdentifyUserHandleIntentStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2463B3228()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF9A0();
}

uint64_t sub_2463B32A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF9AC();
}

uint64_t sub_2463B3320()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF970();
}

uint64_t sub_2463B339C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463A5BF4;
  return sub_2463B285C(a1, a2);
}

uint64_t sub_2463B3400()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF994();
}

uint64_t sub_2463B347C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5BF4;
  return sub_2463BF988();
}

uint64_t sub_2463B34F8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463A5B3C;
  return sub_2463BF964();
}

uint64_t sub_2463B3574()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2463A9FFC();
  return sub_2463897E8(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

unint64_t sub_2463B35B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257570F88[0];
  if (!qword_257570F88[0])
  {
    v1 = type metadata accessor for IdentifyUserHandleIntentStrategy();
    result = MEMORY[0x249559D74](&unk_2463C3374, v1);
    atomic_store(result, qword_257570F88);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_3_19()
{
  return sub_2463BFDB4();
}

uint64_t OUTLINED_FUNCTION_5_14()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_10_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a12 + 8))(v12, a11);
}

uint64_t OUTLINED_FUNCTION_13_11@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 32))(v1);
}

id OUTLINED_FUNCTION_17_6(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_19_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_2463857A0(v2, a2);
}

id OUTLINED_FUNCTION_21_6(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 1864));
}

uint64_t sub_2463B3670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[40];

  type metadata accessor for BaseDialogProvider();
  v4 = swift_allocObject();
  sub_2463AC788(a2, (uint64_t)v7);
  v5 = sub_2463B4474(v4, a1, (uint64_t)v7);
  sub_2463B4634(a2);
  return v5;
}

uint64_t sub_2463B36E4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[3] = a1;
  v2[4] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575710F0);
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = OUTLINED_FUNCTION_3_4();
  v4 = sub_2463C05B8();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = OUTLINED_FUNCTION_3_4();
  return OUTLINED_FUNCTION_1();
}

void sub_2463B3750()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_25756EFB8 != -1)
    swift_once();
  v2 = v0[9];
  v1 = v0[10];
  v4 = v0[7];
  v3 = v0[8];
  v5 = v0[5];
  v6 = v0[6];
  v7 = v0[4];
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
  v9 = sub_2463C05A0();
  v10 = sub_2463C0720();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_DWORD *)v11 = 134217984;
    v12 = (void *)sub_2463BFF4C();
    v13 = objc_msgSend(v12, sel_switchType);

    OUTLINED_FUNCTION_7_12();
    v0[2] = v13;
    sub_2463C078C();
    _os_log_impl(&dword_246381000, v9, v10, "SwitchProfileHandleIntentStrategy.makeIntentHandledResponse() called for %ld", v11, 0xCu);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_7_12();

  v14 = (uint64_t *)v0[3];
  (*(void (**)(_QWORD, _QWORD))(v0[9] + 8))(v0[10], v0[8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2463C1F90;
  *(_QWORD *)(v15 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81890]), sel_init);
  sub_2463C069C();
  v16 = sub_2463C0060();
  v17 = MEMORY[0x24BE99088];
  v14[3] = v16;
  v14[4] = v17;
  __swift_allocate_boxed_opaque_existential_1Tm(v14);
  sub_2463C0054();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_27_3();
  __asm { BR              X0 }
}

uint64_t sub_2463B3974(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575710F0);
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = OUTLINED_FUNCTION_11_1();
  v3[12] = OUTLINED_FUNCTION_11_1();
  v5 = sub_2463C05B8();
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = OUTLINED_FUNCTION_11_1();
  v3[16] = OUTLINED_FUNCTION_11_1();
  v3[17] = OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B3A14()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  id v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = v0[17];
  v3 = v0[13];
  v2 = v0[14];
  v4 = v0[12];
  v6 = v0[9];
  v5 = v0[10];
  v7 = v0[7];
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v46(v4, v7, v6);
  v9 = sub_2463C05A0();
  v10 = sub_2463C0720();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_DWORD *)v11 = 134217984;
    v12 = (void *)sub_2463BFF4C();
    v13 = objc_msgSend(v12, sel_switchType);

    OUTLINED_FUNCTION_5_15();
    v0[5] = v13;
    sub_2463C078C();
    _os_log_impl(&dword_246381000, v9, v10, "SwitchProfileHandleIntentStrategy.makeFailureHandlingIntentResponse() called for %ld", v11, 0xCu);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_5_15();

  (*(void (**)(_QWORD, _QWORD))(v0[14] + 8))(v0[17], v0[13]);
  v14 = (char *)sub_2463BFF40();
  v15 = &v14[OBJC_IVAR___SwitchProfileIntentResponse_code];
  swift_beginAccess();
  v16 = *(_QWORD *)v15;

  if (v16 == 101)
  {
    v17 = v0[11];
    v18 = v0[9];
    v19 = v0[7];
    v20 = (void *)sub_2463BFF4C();
    sub_2463B440C(v20, (SEL *)&selRef_homeUserId);
    v22 = v21;
    swift_bridgeObjectRelease();
    v46(v17, v19, v18);
    if (v22)
    {
      OUTLINED_FUNCTION_14_11();
    }
    else
    {
      v30 = (void *)sub_2463BFF4C();
      sub_2463B440C(v30, (SEL *)&selRef_iCloudAltDSID);
      v32 = v31;
      OUTLINED_FUNCTION_14_11();
      swift_bridgeObjectRelease();
      if (!v32)
      {
        v38 = (void *)sub_2463BFF4C();
        v39 = objc_msgSend(v38, sel_account);

        if (v39)
        {
          v40 = objc_msgSend(v39, sel_displayString);

          sub_2463C0618();
          v33 = v41;

          goto LABEL_13;
        }
        OUTLINED_FUNCTION_11_7();
        v42 = (void *)sub_2463C05A0();
        v43 = sub_2463C072C();
        if (OUTLINED_FUNCTION_22(v43))
        {
          *(_WORD *)OUTLINED_FUNCTION_5() = 0;
          OUTLINED_FUNCTION_10_5(&dword_246381000, v44, v45, "Missing name in resolved Account.");
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_15_8();
      }
    }
    v33 = 0;
LABEL_13:
    v0[18] = v33;
    v34 = (_QWORD *)swift_task_alloc();
    v0[19] = v34;
    *v34 = v0;
    v34[1] = sub_2463B3E24;
    OUTLINED_FUNCTION_27_3();
    return sub_246395184(v35, v36, v37);
  }
  OUTLINED_FUNCTION_11_7();
  v23 = (void *)sub_2463C05A0();
  v24 = sub_2463C072C();
  if (OUTLINED_FUNCTION_22(v24))
  {
    *(_WORD *)OUTLINED_FUNCTION_5() = 0;
    OUTLINED_FUNCTION_10_5(&dword_246381000, v25, v26, "Hit an error case.");
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_15_8();
  v27 = (_QWORD *)swift_task_alloc();
  v0[21] = v27;
  *v27 = v0;
  v27[1] = sub_2463B3ECC;
  OUTLINED_FUNCTION_27_3();
  return sub_246394B08(v28);
}

uint64_t sub_2463B3E24()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2463B3ECC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_14(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_2463B3F34()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_50();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463B3F8C()
{
  uint64_t v0;

  sub_24638C60C(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SwitchProfileHandleIntentStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2463B3FD8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463B4674;
  return sub_2463BF9A0();
}

uint64_t sub_2463B4054()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463B4674;
  return sub_2463BF9AC();
}

uint64_t sub_2463B40D0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463B4674;
  return sub_2463BF970();
}

uint64_t sub_2463B414C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463B4674;
  return sub_2463B36E4(a1, a2);
}

uint64_t sub_2463B41A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463B4674;
  return sub_2463BF994();
}

uint64_t sub_2463B4220()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  *v1 = v0;
  v1[1] = sub_2463B4674;
  return sub_2463BF988();
}

uint64_t sub_2463B429C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463B4300;
  return sub_2463B3974(a1, a2);
}

uint64_t sub_2463B4300()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2463B4348()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_24638F08C();
  return sub_2463897E8(*(uint64_t (**)(uint64_t))(v0 + 8), v0, v1);
}

unint64_t sub_2463B4384()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575710B0[0];
  if (!qword_2575710B0[0])
  {
    v1 = type metadata accessor for SwitchProfileHandleIntentStrategy();
    result = MEMORY[0x249559D74]("%(=\vtH", v1);
    atomic_store(result, qword_2575710B0);
  }
  return result;
}

uint64_t sub_2463B43C0()
{
  return sub_2463C078C();
}

uint64_t sub_2463B43E4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2463B440C(void *a1, SEL *a2)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(a1, *a2);

  if (!v3)
    return 0;
  v4 = sub_2463C0618();

  return v4;
}

uint64_t sub_2463B4474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18[2];
  _BYTE v19[40];
  _BYTE v20[40];
  _QWORD v21[11];
  _QWORD v22[5];
  _QWORD v23[5];

  v6 = type metadata accessor for BaseDialogProvider();
  v23[3] = v6;
  v23[4] = &off_251795888;
  v23[0] = a1;
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  v7 = swift_allocObject();
  v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v6);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  v12 = *v10;
  v22[3] = v6;
  v22[4] = &off_251795888;
  v22[0] = v12;
  sub_24638F8D0((uint64_t)v22, (uint64_t)v20);
  sub_2463AC788(a3, (uint64_t)v19);
  sub_24638F8D0((uint64_t)v20, (uint64_t)v21);
  sub_2463AC788((uint64_t)v19, (uint64_t)&v16);
  if (v17)
  {
    sub_2463B4634((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    sub_246389878(&v16, (uint64_t)v18);
  }
  else
  {
    sub_2463C0030();
    sub_2463B4634((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
    sub_2463B4634((uint64_t)&v16);
  }
  sub_246389878(v18, (uint64_t)&v21[5]);
  sub_24638F8D0((uint64_t)&v21[5], (uint64_t)v18);
  type metadata accessor for LocUtil();
  v13 = swift_allocObject();
  sub_246389878(v18, v13 + 16);
  v21[10] = v13;
  sub_2463B4634(a3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  memcpy((void *)(v7 + 16), v21, 0x58uLL);
  *(_QWORD *)(v7 + 104) = a2;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  return v7;
}

uint64_t sub_2463B4634(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25756F950);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_11_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);
  uint64_t v3;

  return v2(v0, v3, *(_QWORD *)(v1 + 104));
}

uint64_t OUTLINED_FUNCTION_14_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_15_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

ValueMetadata *type metadata accessor for IdentityFlowFactoryImpl()
{
  return &type metadata for IdentityFlowFactoryImpl;
}

uint64_t sub_2463B46D0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  BOOL v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[40];
  _BYTE v41[40];
  _QWORD v42[5];
  uint64_t v43[6];

  v36 = a5;
  v35 = a4;
  v34 = a1;
  v39 = a6;
  v8 = sub_2463C05B8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25756EFB0 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2575745C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a2;
  v14 = sub_2463C05A0();
  v15 = sub_2463C0738();
  v16 = os_log_type_enabled(v14, v15);
  v38 = a3;
  v37 = a2;
  if (v16)
  {
    v33 = v13;
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v43[0] = v18;
    *(_DWORD *)v17 = 136315138;
    if (a2 && (v19 = sub_2463C04EC(), v20))
    {
      v21 = v20;
    }
    else
    {
      swift_bridgeObjectRelease();
      v21 = 0xE500000000000000;
      v19 = 0x3E6C696E3CLL;
    }
    v42[0] = sub_24639AE68(v19, v21, v43);
    sub_2463C078C();
    v13 = v33;

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246381000, v14, v15, "IdentityFlowProducers.switchProfileFlowProducers() remoteDevice: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249559E1C](v18, -1, -1);
    MEMORY[0x249559E1C](v17, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  type metadata accessor for SwitchProfileIntent();
  type metadata accessor for SwitchProfileIntentResponse();
  sub_2463BFB20();
  if (qword_25756EF50 != -1)
    swift_once();
  sub_2463C0480();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_2463C0474();
  sub_2463BFACC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571100);
  sub_2463BFAFC();
  type metadata accessor for SwitchProfileHandleIntentStrategy();
  v22 = v38;
  sub_2463AC788(v38, (uint64_t)v43);
  v23 = v13;
  v24 = v37;
  v43[0] = sub_2463B3670((uint64_t)v37, (uint64_t)v43);
  sub_24638C588(&qword_257571128, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileHandleIntentStrategy, (uint64_t)&unk_2463C34C4);
  sub_2463BFAC0();
  swift_release();
  sub_2463BFAF0();
  sub_24638C500(v34, (uint64_t)v43);
  sub_2463AC788(v22, (uint64_t)v42);
  sub_24638C500(v35, (uint64_t)v41);
  sub_24638C500(v36, (uint64_t)v40);
  v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v43, v43[3]);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (uint64_t *)((char *)&v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v28 + 16))(v27);
  v29 = *v27;
  v30 = v23;
  v31 = sub_2463B5A18(v29, v24, (uint64_t)v42, (uint64_t)v41, (uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  v43[0] = v31;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  sub_24638C588(&qword_257571130, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileDisambiguationStrategy, (uint64_t)&unk_2463C204C);
  sub_2463BFAD8();
  swift_release();
  sub_2463BFB14();
  type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy();
  sub_2463AC788(v22, (uint64_t)v43);
  v43[0] = sub_2463B9EC0((uint64_t)v43);
  sub_24638C588(&qword_257571138, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy, (uint64_t)&unk_2463C375C);
  sub_2463BFAE4();
  swift_release();
  sub_2463BFB08();
  return swift_release();
}

uint64_t sub_2463B4C48(void (*a1)(void), uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void (*v12)(void);
  uint64_t v13;
  _QWORD v16[5];

  v4 = sub_2463C05B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25756EFB0 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2575745C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_2463C05A0();
  v10 = sub_2463C0738();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_246381000, v9, v10, "IdentityFlowProducers.identifyUserProducers()", v11, 2u);
    MEMORY[0x249559E1C](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (a1)
  {
    v12 = a1;
  }
  else
  {
    sub_2463C03E4();
    v12 = sub_2463A47BC();
  }
  type metadata accessor for UserIdentifyIntent();
  type metadata accessor for UserIdentifyIntentResponse();
  swift_retain();
  sub_2463BFB20();
  if (qword_25756EF50 != -1)
    swift_once();
  sub_2463C0480();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_2463C0474();
  sub_2463BFACC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571148);
  sub_2463BFAFC();
  sub_2463AC788(a2, (uint64_t)v16);
  type metadata accessor for BaseDialogProvider();
  v13 = swift_allocObject();
  v16[0] = sub_2463B5CCC(v13, (uint64_t)v16, (void (*)(_QWORD))type metadata accessor for IdentifyUserHandleIntentStrategy);
  type metadata accessor for IdentifyUserHandleIntentStrategy();
  sub_24638C588(&qword_257571170, (uint64_t (*)(uint64_t))type metadata accessor for IdentifyUserHandleIntentStrategy, (uint64_t)&unk_2463C33B4);
  sub_2463BFAC0();
  swift_release();
  sub_2463BFAF0();
  type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy();
  sub_2463AC788(a2, (uint64_t)v16);
  swift_retain();
  v16[0] = sub_2463AB774((uint64_t)v16, v12);
  sub_24638C588(&qword_257571178, (uint64_t (*)(uint64_t))type metadata accessor for IdentifyUserUnsupportedValueFlowStrategy, (uint64_t)&unk_2463C2EBC);
  sub_2463BFAE4();
  swift_release();
  sub_2463BFB08();
  swift_release();
  return swift_release();
}

uint64_t sub_2463B4FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  _QWORD v14[5];

  v3 = sub_2463C05B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25756EFB0 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745C8);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_2463C05A0();
  v9 = sub_2463C0738();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_246381000, v8, v9, "IdentityFlowProducers.establishUserProducers()", v10, 2u);
    MEMORY[0x249559E1C](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  type metadata accessor for UserIdentifyIntent();
  type metadata accessor for UserIdentifyIntentResponse();
  sub_2463BFB20();
  if (qword_25756EF50 != -1)
    swift_once();
  sub_2463C0480();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_2463C0474();
  sub_2463BFACC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571148);
  sub_2463BFAFC();
  sub_2463AC788(a2, (uint64_t)v14);
  type metadata accessor for BaseDialogProvider();
  v11 = swift_allocObject();
  v14[0] = sub_2463B5CCC(v11, (uint64_t)v14, (void (*)(_QWORD))type metadata accessor for EstablishUserHandleIntentStrategy);
  type metadata accessor for EstablishUserHandleIntentStrategy();
  sub_24638C588(&qword_257571190, (uint64_t (*)(uint64_t))type metadata accessor for EstablishUserHandleIntentStrategy, (uint64_t)&unk_2463C2374);
  sub_2463BFAC0();
  swift_release();
  sub_2463BFAF0();
  return swift_release();
}

void sub_2463B5284(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  _BYTE v22[40];
  _QWORD v23[5];
  _OWORD v24[2];
  uint64_t v25;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575710F8);
  v20 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4_16();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257571100);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21[-1] - v13;
  v25 = 0;
  memset(v24, 0, sizeof(v24));
  v15 = OUTLINED_FUNCTION_19_6();
  v16 = OUTLINED_FUNCTION_34();
  v23[3] = v15;
  v23[4] = &off_251795888;
  v23[0] = v16;
  sub_2463BFC40();
  v17 = sub_2463C051C();
  v18 = sub_2463C0510();
  v21[3] = v17;
  v21[4] = MEMORY[0x24BEA9118];
  v21[0] = v18;
  sub_2463B46D0((uint64_t)v23, a4, (uint64_t)v24, (uint64_t)v22, (uint64_t)v21, (uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  OUTLINED_FUNCTION_24_6();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571108);
  OUTLINED_FUNCTION_8();
  sub_2463BFB2C();
  *(_QWORD *)&v24[0] = a1;
  type metadata accessor for SwitchProfileFlowStrategy();
  sub_24638C588(&qword_257571110, (uint64_t (*)(uint64_t))type metadata accessor for SwitchProfileFlowStrategy, (uint64_t)"!1=\v$W");
  swift_retain();
  OUTLINED_FUNCTION_21_7();
  sub_2463BFD9C();
  if (qword_25756EF50 != -1)
    swift_once();
  OUTLINED_FUNCTION_20_5();
  OUTLINED_FUNCTION_8();
  swift_bridgeObjectRetain();
  sub_2463C0474();
  v19 = sub_2463BFD90();
  OUTLINED_FUNCTION_28_6();
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v4, v7);
  *(_QWORD *)&v24[0] = v19;
  OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_26_3(&qword_257571120);
  sub_2463BFB38();
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_22_3();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  OUTLINED_FUNCTION_5_3();
}

void sub_2463B5544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257571140);
  v1 = OUTLINED_FUNCTION_12_10(v0);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_4_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571148);
  OUTLINED_FUNCTION_16_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_11_8();
  MEMORY[0x24BDAC7A8](v3);
  v4 = (void (*)(void))OUTLINED_FUNCTION_3_20();
  sub_2463B4C48(v4, v5);
  OUTLINED_FUNCTION_24_6();
  type metadata accessor for IdentifyUserFlowStrategy();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571150);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15_9();
  sub_24638C588(&qword_257571158, (uint64_t (*)(uint64_t))type metadata accessor for IdentifyUserFlowStrategy, (uint64_t)&unk_2463C2DA4);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_21_7();
  OUTLINED_FUNCTION_6_13();
  if (qword_25756EF50 != -1)
    swift_once();
  OUTLINED_FUNCTION_20_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_17_7();
  OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_26_3(&qword_257571168);
  OUTLINED_FUNCTION_14_12();
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_13_12();
  OUTLINED_FUNCTION_5_3();
}

void sub_2463B56B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257571180);
  v1 = OUTLINED_FUNCTION_12_10(v0);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_4_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571148);
  OUTLINED_FUNCTION_16_3();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_11_8();
  MEMORY[0x24BDAC7A8](v3);
  v4 = OUTLINED_FUNCTION_3_20();
  sub_2463B4FC8(v4, v5);
  OUTLINED_FUNCTION_24_6();
  type metadata accessor for EstablishUserFlowStrategy();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_5_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257571150);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15_9();
  sub_24638C588(&qword_257571188, (uint64_t (*)(uint64_t))type metadata accessor for EstablishUserFlowStrategy, (uint64_t)&unk_2463C1684);
  OUTLINED_FUNCTION_18_6();
  OUTLINED_FUNCTION_21_7();
  OUTLINED_FUNCTION_6_13();
  if (qword_25756EF50 != -1)
    swift_once();
  OUTLINED_FUNCTION_20_5();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_10_11();
  OUTLINED_FUNCTION_17_7();
  OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_27_6();
  OUTLINED_FUNCTION_26_3(&qword_257571168);
  OUTLINED_FUNCTION_14_12();
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_28_6();
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_13_12();
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_2463B5824(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  uint64_t v17;
  __int128 v18[2];
  _BYTE v19[40];
  __int128 v20;
  uint64_t v21;
  _BYTE __src[88];
  _QWORD v23[5];

  v23[3] = type metadata accessor for BaseDialogProvider();
  v23[4] = &off_251795888;
  v23[0] = a1;
  *(_QWORD *)(a6 + 104) = 0;
  sub_24638C500((uint64_t)v23, (uint64_t)&v20);
  sub_2463AC788(a3, (uint64_t)v19);
  sub_24638C500((uint64_t)&v20, (uint64_t)__src);
  sub_2463AC788((uint64_t)v19, (uint64_t)&v16);
  if (v17)
  {
    sub_2463B4634((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
    sub_246389878(&v16, (uint64_t)v18);
  }
  else
  {
    sub_2463C0030();
    sub_2463B4634((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
    sub_2463B4634((uint64_t)&v16);
  }
  sub_246389878(v18, (uint64_t)&__src[40]);
  sub_24638C500((uint64_t)&__src[40], (uint64_t)v18);
  type metadata accessor for LocUtil();
  v12 = swift_allocObject();
  sub_246389878(v18, v12 + 16);
  *(_QWORD *)&__src[80] = v12;
  memcpy((void *)(a6 + 16), __src, 0x58uLL);
  v13 = *(void **)(a6 + 104);
  *(_QWORD *)(a6 + 104) = a2;
  v14 = a2;

  sub_24638C500(a4, a6 + 112);
  sub_24638C500(a5, a6 + 152);
  sub_2463AC788(a3, (uint64_t)&v20);
  if (v21)
  {

    __swift_destroy_boxed_opaque_existential_1(a5);
    __swift_destroy_boxed_opaque_existential_1(a4);
    sub_2463B4634(a3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_246389878(&v20, (uint64_t)__src);
  }
  else
  {
    sub_2463C0030();

    __swift_destroy_boxed_opaque_existential_1(a5);
    __swift_destroy_boxed_opaque_existential_1(a4);
    sub_2463B4634(a3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_2463B4634((uint64_t)&v20);
  }
  sub_246389878((__int128 *)__src, a6 + 192);
  return a6;
}

uint64_t sub_2463B5A18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v18[3];
  uint64_t v19;
  char **v20;

  v19 = type metadata accessor for BaseDialogProvider();
  v20 = &off_251795888;
  v18[0] = a1;
  type metadata accessor for SwitchProfileDisambiguationStrategy();
  v10 = swift_allocObject();
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v19);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (_QWORD *)((char *)&v18[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  v15 = sub_2463B5824(*v13, a2, a3, a4, a5, v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  return v15;
}

void sub_2463B5B10(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x249559D74](MEMORY[0x24BE96B80], v3), a1);
  }
  OUTLINED_FUNCTION_25();
}

uint64_t sub_2463B5B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(void);
  __int128 v9;
  uint64_t v10;
  __int128 v11[2];
  _BYTE v12[40];
  __int128 v13;
  uint64_t v14;
  _BYTE __src[88];
  _QWORD v16[5];

  v16[3] = OUTLINED_FUNCTION_19_6();
  v16[4] = &off_251795888;
  v16[0] = a1;
  sub_24638C500((uint64_t)v16, (uint64_t)&v13);
  sub_2463AC788(a2, (uint64_t)v12);
  sub_24638C500((uint64_t)&v13, (uint64_t)__src);
  sub_2463AC788((uint64_t)v12, (uint64_t)&v9);
  if (v10)
  {
    sub_2463B4634((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    sub_246389878(&v9, (uint64_t)v11);
  }
  else
  {
    sub_2463C0030();
    sub_2463B4634((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
    sub_2463B4634((uint64_t)&v9);
  }
  sub_246389878(v11, (uint64_t)&__src[40]);
  sub_24638C500((uint64_t)&__src[40], (uint64_t)v11);
  type metadata accessor for LocUtil();
  v6 = OUTLINED_FUNCTION_34();
  sub_246389878(v11, v6 + 16);
  *(_QWORD *)&__src[80] = v6;
  memcpy((void *)(a3 + 16), __src, 0x58uLL);
  sub_2463AC788(a2, (uint64_t)&v13);
  if (v14)
  {
    sub_246389878(&v13, (uint64_t)__src);
  }
  else
  {
    sub_2463C0030();
    sub_2463B4634((uint64_t)&v13);
  }
  sub_246389878((__int128 *)__src, a3 + 104);
  sub_2463C03E4();
  v7 = sub_2463A47BC();
  sub_2463B4634(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  *(_QWORD *)(a3 + 144) = v7;
  return a3;
}

uint64_t sub_2463B5CCC(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v14[3];
  uint64_t v15;
  char **v16;

  v15 = OUTLINED_FUNCTION_19_6();
  v16 = &off_251795888;
  v14[0] = a1;
  a3(0);
  v6 = OUTLINED_FUNCTION_34();
  v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_QWORD *)((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  v11 = sub_2463B5B4C(*v9, a2, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v11;
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  return sub_2463C0474();
}

uint64_t OUTLINED_FUNCTION_3_20()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return 0;
}

uint64_t OUTLINED_FUNCTION_5_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t);

  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16);
  *(_QWORD *)(v4 - 136) = v3;
  return v5(v1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_6_13()
{
  return sub_2463BFD9C();
}

uint64_t OUTLINED_FUNCTION_8_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_10()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_10_11()
{
  return sub_2463BFD90();
}

uint64_t OUTLINED_FUNCTION_12_10(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_13_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_14_12()
{
  return sub_2463BFB38();
}

uint64_t OUTLINED_FUNCTION_15_9()
{
  return sub_2463BFB2C();
}

uint64_t OUTLINED_FUNCTION_17_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_18_6()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_19_6()
{
  return type metadata accessor for BaseDialogProvider();
}

uint64_t OUTLINED_FUNCTION_20_5()
{
  return sub_2463C0480();
}

uint64_t OUTLINED_FUNCTION_21_7()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_23_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_24_6()
{
  uint64_t v0;

  return sub_2463B4634(v0 - 128);
}

void OUTLINED_FUNCTION_26_3(unint64_t *a1)
{
  uint64_t *v1;

  sub_2463B5B10(a1, v1);
}

uint64_t OUTLINED_FUNCTION_27_6()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_28_6()
{
  return swift_release();
}

uint64_t sub_2463B5F44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _DWORD *v22;
  _DWORD *v23;
  _DWORD *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  _QWORD *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  ValueMetadata *v34;
  _UNKNOWN **v35;
  __int128 v36;
  _BYTE v37[25];

  v8 = sub_2463C05B8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[24] = 3;
  sub_2463B00AC(a2, (uint64_t)&v31);
  if (v32)
  {
    sub_246389878(&v31, (uint64_t)&v33);
  }
  else
  {
    v34 = &type metadata for IdentityFeatureFlagsProvider;
    v35 = &protocol witness table for IdentityFeatureFlagsProvider;
    sub_2463B6648((uint64_t)&v31);
  }
  sub_246389878(&v33, (uint64_t)&v36);
  v13 = *(_QWORD *)&v37[16];
  v12 = *(_QWORD *)&v37[8];
  __swift_project_boxed_opaque_existential_1(&v36, *(uint64_t *)&v37[8]);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
  v15 = sub_2463B6544(a3);
  v16 = v15;
  if ((v14 & 1) != 0 && (v15 & 1) != 0)
  {
    OUTLINED_FUNCTION_0_12();
    if (OUTLINED_FUNCTION_2_16(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 48)) == 2)
    {
      OUTLINED_FUNCTION_0_12();
      (*(void (**)(_QWORD *, uint64_t))(v8 + 32))(a3, v8);
      v18 = v17;
      swift_bridgeObjectRelease();
      if (v18)
      {
        OUTLINED_FUNCTION_1_16();
        v37[24] = 0;
      }
      else
      {
        OUTLINED_FUNCTION_0_12();
        v25 = OUTLINED_FUNCTION_2_16(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24));
        OUTLINED_FUNCTION_1_16();
        if ((v25 & 1) != 0)
          v26 = 1;
        else
          v26 = 2;
        v37[24] = v26;
      }
    }
    else
    {
      OUTLINED_FUNCTION_1_16();
    }
  }
  else
  {
    v30 = a2;
    if (qword_25756EFB8 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v8, (uint64_t)qword_2575745E0);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v19, v8);
    v20 = sub_2463C05A0();
    v21 = sub_2463C0720();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (_DWORD *)swift_slowAlloc();
      v29 = a3;
      v23 = v22;
      *v22 = 67109376;
      LODWORD(v33) = v14 & 1;
      OUTLINED_FUNCTION_4_17();
      *((_WORD *)v23 + 4) = 1024;
      LODWORD(v33) = v16 & 1;
      OUTLINED_FUNCTION_4_17();
      _os_log_impl(&dword_246381000, v20, v21, "Switch Profile feature not supported. feature enabled=%{BOOL}d isAllowedDevice=%{BOOL}d", (uint8_t *)v23, 0xEu);
      v24 = v23;
      a3 = v29;
      MEMORY[0x249559E1C](v24, -1, -1);
    }

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
    sub_2463B6648(v30);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v27 = *(_OWORD *)v37;
  *a4 = v36;
  a4[1] = v27;
  *(_OWORD *)((char *)a4 + 25) = *(_OWORD *)&v37[9];
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

BOOL static UseCase.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t UseCase.hash(into:)()
{
  return sub_2463C0984();
}

void UseCase.hashValue.getter()
{
  sub_2463C0978();
  sub_2463C0984();
  sub_2463C0990();
  OUTLINED_FUNCTION_31_1();
}

BOOL sub_2463B6294(char *a1, char *a2)
{
  return static UseCase.__derived_enum_equals(_:_:)(*a1, *a2);
}

void sub_2463B62A0()
{
  UseCase.hashValue.getter();
}

uint64_t sub_2463B62A8()
{
  return UseCase.hash(into:)();
}

uint64_t SwitchProfileUseCases.useCase.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t SwitchProfileUseCases.useCase.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 40) = result;
  return result;
}

uint64_t (*SwitchProfileUseCases.useCase.modify())()
{
  return nullsub_1;
}

unint64_t sub_2463B62D4()
{
  unint64_t result;

  result = qword_257571198;
  if (!qword_257571198)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for UseCase, &type metadata for UseCase);
    atomic_store(result, (unint64_t *)&qword_257571198);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for UseCase(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2463B635C + 4 * byte_2463C35B5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2463B6390 + 4 * byte_2463C35B0[v4]))();
}

uint64_t sub_2463B6390(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463B6398(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2463B63A0);
  return result;
}

uint64_t sub_2463B63AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2463B63B4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2463B63B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2463B63C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UseCase()
{
  return &type metadata for UseCase;
}

uint64_t initializeWithCopy for SwitchProfileUseCases(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t assignWithCopy for SwitchProfileUseCases(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SwitchProfileUseCases(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SwitchProfileUseCases(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 41))
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

uint64_t storeEnumTagSinglePayload for SwitchProfileUseCases(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SwitchProfileUseCases()
{
  return &type metadata for SwitchProfileUseCases;
}

uint64_t sub_2463B6544(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[48];
  _QWORD v14[4];

  v2 = v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v4 = sub_2463BFC64();
  sub_24638F8D0((uint64_t)a1, (uint64_t)v14);
  sub_2463B6688(v2, (uint64_t)v13);
  if ((v4 & 1) != 0)
  {
    sub_2463B00F4((uint64_t)v13);
    v5 = 1;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    v6 = sub_2463BFC70();
    sub_2463B6688((uint64_t)v13, (uint64_t)v10);
    if ((v6 & 1) != 0)
    {
      v7 = v11;
      v8 = v12;
      __swift_project_boxed_opaque_existential_1(v10, v11);
      v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v7, v8);
    }
    else
    {
      v5 = 0;
    }
    sub_2463B00F4((uint64_t)v13);
    sub_2463B00F4((uint64_t)v10);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return v5 & 1;
}

uint64_t sub_2463B6648(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257570D00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2463B6688(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SwitchProfileUseCases(a2, a1);
  return a2;
}

_QWORD *OUTLINED_FUNCTION_0_12()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  uint64_t v0;
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v0);
  return sub_2463B6648(v1);
}

uint64_t OUTLINED_FUNCTION_2_16@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_4_17()
{
  return sub_2463C078C();
}

uint64_t sub_2463B6700(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575701B8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2463C0708();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = (_QWORD *)OUTLINED_FUNCTION_34();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  v9 = (_QWORD *)OUTLINED_FUNCTION_34();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_257571210;
  v9[5] = v8;
  sub_2463B7448((uint64_t)v6, (uint64_t)&unk_257571220, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_2463B67D4()
{
  void *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t result;
  objc_super v6;

  sub_2463C03E4();
  v1 = v0;
  v2 = static SiriEnvironment.getUserIdentity()();
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)&v1[OBJC_IVAR____TtC20SiriIdentityInternal26EstablishUserIntentHandler_currentRequest] = sub_2463A491C();
    *(_QWORD *)&v1[OBJC_IVAR____TtC20SiriIdentityInternal26EstablishUserIntentHandler_currentDevice] = sub_2463A47BC();
    *(_QWORD *)&v1[OBJC_IVAR____TtC20SiriIdentityInternal26EstablishUserIntentHandler_userIdentity] = v3;
    swift_retain();

    v6.receiver = v1;
    v6.super_class = (Class)type metadata accessor for EstablishUserIntentHandler();
    v4 = objc_msgSendSuper2(&v6, sel_init);
    swift_release();
    return (uint64_t)v4;
  }
  else
  {
    result = sub_2463C08A0();
    __break(1u);
  }
  return result;
}

uint64_t EstablishUserIntentHandler.resolveIdentity(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[3] = a1;
  v2[4] = v1;
  sub_2463C04D4();
  v2[5] = OUTLINED_FUNCTION_3_4();
  v3 = sub_2463BFD60();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = OUTLINED_FUNCTION_3_9();
  v2[9] = OUTLINED_FUNCTION_11_1();
  v4 = sub_2463BFD84();
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 - 8);
  v2[12] = OUTLINED_FUNCTION_3_4();
  v5 = OUTLINED_FUNCTION_7_2();
  v2[13] = v5;
  v2[14] = *(_QWORD *)(v5 - 8);
  v2[15] = OUTLINED_FUNCTION_3_9();
  v2[16] = OUTLINED_FUNCTION_11_1();
  v2[17] = OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B6998()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(NSObject *, uint64_t, uint64_t);
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  void (*v49)(NSObject *, uint64_t, uint64_t);
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  v5 = *(void (**)(NSObject *, uint64_t, uint64_t))(v2 + 16);
  v5(v1, v4, v3);
  sub_2463C05A0();
  v6 = OUTLINED_FUNCTION_14_1();
  if (os_log_type_enabled(v1, v6))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
    OUTLINED_FUNCTION_21_8(&dword_246381000, v1, v6, "EstablishUserIntentHandler.resolveIdentity");
    OUTLINED_FUNCTION_0();
  }
  v7 = *(void **)(v0 + 24);
  v8 = *(_QWORD *)(v0 + 136);
  v10 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 112);

  v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v11(v8, v10);
  v12 = objc_msgSend(v7, sel_identity);
  if (v12)
  {
    v13 = v12;
    v49 = v5;
    v50 = v11;
    v47 = v4;
    v48 = *(NSObject **)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 88);
    v14 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD *)(v0 + 72);
    v18 = *(_QWORD *)(v0 + 56);
    v17 = *(_QWORD *)(v0 + 64);
    v20 = *(_QWORD *)(v0 + 40);
    v19 = *(_QWORD *)(v0 + 48);
    v46 = *(_QWORD *)(v0 + 104);
    v45 = *(_QWORD *)(v0 + 80);
    sub_2463BFF10();
    sub_2463BFD6C();
    sub_2463BFD54();
    sub_2463BFD24();
    v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v21(v17, v19);
    v21(v16, v19);
    v22 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v22(v14, v45);
    v23 = (void *)OUTLINED_FUNCTION_18_7();
    OUTLINED_FUNCTION_6_7((uint64_t)v23, sel_setFullConfidence_);

    sub_2463BFF28();
    v24 = (void *)sub_2463C06CC();
    OUTLINED_FUNCTION_6_7((uint64_t)v24, sel_setSetupInProgress_);

    sub_2463C04B0();
    sub_2463C04C8();
    sub_2463A9C70(v20);
    v25 = (void *)OUTLINED_FUNCTION_18_7();
    OUTLINED_FUNCTION_6_7((uint64_t)v25, sel_setIsMultiUserContext_);

    sub_2463BFF10();
    sub_2463AE7D8();
    v22(v14, v45);
    v26 = (void *)OUTLINED_FUNCTION_18_7();
    OUTLINED_FUNCTION_6_7((uint64_t)v26, sel_setIsIdentifiedOrUnsure_);

    v49(v48, v47, v46);
    sub_2463C05A0();
    v27 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_22(v27))
    {
      *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
      OUTLINED_FUNCTION_21_8(&dword_246381000, v48, (os_log_type_t)v22, "EstablishUserIntentHandler.resolveIdentity returning success");
      OUTLINED_FUNCTION_0();
    }
    v28 = *(_QWORD *)(v0 + 128);
    v29 = *(_QWORD *)(v0 + 104);

    v50(v28, v29);
    type metadata accessor for UserIdentifyIdentityResolutionResult();
    v30 = static IdentityResolutionResult.success(with:)();

  }
  else
  {
    v31 = *(NSObject **)(v0 + 120);
    v32 = *(void **)(v0 + 24);
    v5(v31, v4, *(_QWORD *)(v0 + 104));
    v33 = v32;
    sub_2463C05A0();
    v34 = OUTLINED_FUNCTION_14_1();
    v35 = os_log_type_enabled(v31, v34);
    v36 = *(_QWORD *)(v0 + 120);
    v37 = *(_QWORD *)(v0 + 104);
    v38 = *(void **)(v0 + 24);
    if (v35)
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v51 = swift_slowAlloc();
      *(_DWORD *)v39 = 136315138;
      v40 = objc_msgSend(v38, sel_description);
      v41 = sub_2463C0618();
      v43 = v42;

      *(_QWORD *)(v0 + 16) = sub_24639AE68(v41, v43, &v51);
      sub_2463C078C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_246381000, v31, v34, "EstablishUserIntentHandler.resolveIdentity returning failure since Intent does not have Identity %s", v39, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    v11(v36, v37);
    type metadata accessor for UserIdentifyIdentityResolutionResult();
    v30 = static UserIdentifyIdentityResolutionResult.unsupported(forReason:)();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(id))(v0 + 8))(v30);
}

uint64_t sub_2463B6E9C(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_2463B6F18;
  return EstablishUserIntentHandler.resolveIdentity(for:)((uint64_t)v6);
}

uint64_t sub_2463B6F18(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t EstablishUserIntentHandler.confirm(intent:)()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_7_2();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_3_4();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B6FD8()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (qword_25756EFC8 != -1)
    swift_once();
  v1 = __swift_project_value_buffer(*(_QWORD *)(v0 + 16), (uint64_t)qword_257574610);
  OUTLINED_FUNCTION_11_9(v1);
  sub_2463C05A0();
  v2 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v2))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
    OUTLINED_FUNCTION_10_5(&dword_246381000, v3, v4, "EstablishUserIntentHandler.confirm");
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_22_4();
  OUTLINED_FUNCTION_17_8();
  v5 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(1, 0);
  OUTLINED_FUNCTION_20_6();
  return OUTLINED_FUNCTION_8_12((uint64_t)v5, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463B70B8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2463B7908;
  return EstablishUserIntentHandler.confirm(intent:)();
}

uint64_t EstablishUserIntentHandler.handle(intent:)()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_7_2();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_3_4();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463B716C()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = __swift_project_value_buffer(*(_QWORD *)(v0 + 16), (uint64_t)qword_2575745E0);
  OUTLINED_FUNCTION_11_9(v1);
  sub_2463C05A0();
  v2 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v2))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
    OUTLINED_FUNCTION_10_5(&dword_246381000, v3, v4, "EstablishUserIntentHandler.handle");
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_22_4();
  OUTLINED_FUNCTION_17_8();
  v5 = objc_allocWithZone((Class)type metadata accessor for UserIdentifyIntentResponse());
  UserIdentifyIntentResponse.init(code:userActivity:)(4, 0);
  OUTLINED_FUNCTION_20_6();
  return OUTLINED_FUNCTION_8_12((uint64_t)v5, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463B724C(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6)
{
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;

  v9 = _Block_copy(aBlock);
  v10 = (_QWORD *)OUTLINED_FUNCTION_34();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = a1;
  v11 = a3;
  v12 = a1;
  return sub_2463B6700(a6, (uint64_t)v10);
}

uint64_t sub_2463B72B8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2463B7908;
  return EstablishUserIntentHandler.handle(intent:)();
}

id EstablishUserIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EstablishUserIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2463B73A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2463898B0;
  return v6();
}

uint64_t sub_2463B73F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2463898B0;
  return v7();
}

uint64_t sub_2463B7448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2463C0708();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2463B77A8(a1);
  }
  else
  {
    sub_2463C06FC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2463C06D8();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2463B7584(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2463B75E8;
  return v6(a1);
}

uint64_t sub_2463B75E8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_3();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t type metadata accessor for EstablishUserIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_2463B7634()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_2463898B0);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t sub_2463B767C()
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
  v5[1] = sub_2463898B0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_257571208 + dword_257571208))(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2463B7724(uint64_t a1)
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
  v7[1] = sub_2463898B0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_257571218 + dword_257571218))(a1, v4, v5, v6);
}

uint64_t sub_2463B77A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575701B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2463B77E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2463B780C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463A12B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257571228 + dword_257571228))(a1, v4);
}

uint64_t sub_2463B787C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_2463898B0);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t sub_2463B78C4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_80();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_20_2(v1, (uint64_t)sub_24638966C);
  return OUTLINED_FUNCTION_18_3(v2, v3, v4, v5);
}

uint64_t OUTLINED_FUNCTION_8_12(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_11_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, a1, v1);
}

uint64_t OUTLINED_FUNCTION_17_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_18_7()
{
  return sub_2463C06CC();
}

uint64_t OUTLINED_FUNCTION_20_6()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_21_8(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

void OUTLINED_FUNCTION_22_4()
{
  void *v0;

}

void sub_2463B796C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  size_t v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
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
  uint64_t *v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(uint64_t, size_t, uint8_t *);
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  int isUniquelyReferenced_nonNull_native;
  int64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  size_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  size_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  unint64_t v79;
  void (*v80)(uint64_t, size_t, uint8_t *);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint8_t *v86;
  uint64_t v87;
  unint64_t v88[4];

  v70 = OUTLINED_FUNCTION_13_13();
  v77 = *(_QWORD *)(v70 - 8);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12_0();
  v9 = v8 - v7;
  v10 = sub_2463C00F0();
  v75 = *(_QWORD *)(v10 - 8);
  v76 = v10;
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_12_0();
  v74 = v13 - v12;
  v72 = sub_2463BFE80();
  v71 = *(_QWORD *)(v72 - 8);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_94_0();
  v67 = v15;
  MEMORY[0x24BDAC7A8](v16);
  v78 = (char *)&v67 - v17;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575712B0);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_94_0();
  v82 = v19;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (uint64_t *)((char *)&v67 - v21);
  v84 = a1;
  v23 = sub_2463B8490(a1);
  v24 = *(_QWORD *)(v23 + 16);
  v73 = v23;
  swift_bridgeObjectRetain_n();
  v25 = MEMORY[0x24BEE4AF8];
  v68 = v1;
  if (v24)
  {
    v26 = sub_2463BFC94();
    v2 = 0;
    v27 = *(_QWORD *)(v26 - 8);
    v28 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
    v85 = *(_QWORD *)(v27 + 72);
    v86 = (uint8_t *)v26;
    v3 = v73 + v28;
    v81 = v27;
    v29 = *(void (**)(uint64_t, size_t, uint8_t *))(v27 + 16);
    v79 = v28;
    v80 = v29;
    while (1)
    {
      v30 = v9;
      v31 = v83;
      v32 = v24;
      v33 = v82 + *(int *)(v83 + 48);
      v34 = v86;
      v80(v33, v3, v86);
      v35 = (uint64_t)v22 + *(int *)(v31 + 48);
      *v22 = v2;
      (*(void (**)(uint64_t, uint64_t, uint8_t *))(v81 + 32))(v35, v33, v34);
      v24 = v32;
      v36 = sub_2463B8B38(v2, v35, v32);
      sub_2463857A0((uint64_t)v22, &qword_2575712B0);
      v4 = *(_QWORD *)(v36 + 16);
      v37 = *(_QWORD *)(v25 + 16);
      v9 = v37 + v4;
      if (__OFADD__(v37, v4))
        break;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v25 + 24) >> 1)
      {
        if (v37 <= v9)
          v39 = v37 + v4;
        else
          v39 = v37;
        v25 = sub_2463B9334(isUniquelyReferenced_nonNull_native, v39, 1, v25, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
      }
      v9 = v30;
      if (*(_QWORD *)(v36 + 16))
      {
        v40 = *(_QWORD *)(v25 + 16);
        if ((*(_QWORD *)(v25 + 24) >> 1) - v40 < v4)
          goto LABEL_42;
        v41 = v25 + v79 + v40 * v85;
        if (v36 + v79 < v41 + v4 * v85 && v41 < v36 + v79 + v4 * v85)
          goto LABEL_46;
        swift_arrayInitWithCopy();
        if (v4)
        {
          v43 = *(_QWORD *)(v25 + 16);
          v44 = __OFADD__(v43, v4);
          v45 = v43 + v4;
          if (v44)
            goto LABEL_43;
          *(_QWORD *)(v25 + 16) = v45;
        }
      }
      else if (v4)
      {
        goto LABEL_41;
      }
      ++v2;
      OUTLINED_FUNCTION_3_6();
      v3 += v85;
      if (v24 == v2)
        goto LABEL_22;
    }
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
  }
  else
  {
LABEL_22:
    v46 = v73;
    swift_bridgeObjectRelease_n();
    v88[0] = v46;
    sub_2463B9628(v25, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88, (void (*)(uint64_t, uint64_t, uint64_t))sub_2463B1D28);
    sub_2463B863C();
    OUTLINED_FUNCTION_10();
    v88[0] = MEMORY[0x24BEE4AF8];
    v36 = v84;
    if (!(v84 >> 62))
    {
      v47 = *(_QWORD *)((v84 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRetain();
  v47 = sub_2463C08B8();
LABEL_24:
  OUTLINED_FUNCTION_3_21();
  v48 = v77;
  v69 = v9;
  if (!v47)
  {
    OUTLINED_FUNCTION_3_6();
    v55 = MEMORY[0x24BEE4AF8];
LABEL_35:
    v56 = v74;
    sub_2463B0E84(v55, v74);
    OUTLINED_FUNCTION_10();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575712B8);
    v57 = v75;
    v58 = (*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80);
    v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_2463C1B70;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v57 + 16))(v59 + v58, v56, v76);
    sub_2463BFE20();
    if (qword_25756EFB8 != -1)
      swift_once();
    v60 = __swift_project_value_buffer(v4, (uint64_t)qword_2575745E0);
    (*(void (**)(int64_t, uint64_t, int64_t))(v48 + 16))(v9, v60, v4);
    v61 = sub_2463C05A0();
    v62 = sub_2463C0720();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)OUTLINED_FUNCTION_5();
      v88[0] = OUTLINED_FUNCTION_5();
      *(_DWORD *)v63 = 136315138;
      v86 = v63 + 4;
      OUTLINED_FUNCTION_9_11();
      OUTLINED_FUNCTION_15_10(v67, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
      v64 = sub_2463C0624();
      v87 = sub_24639AE68(v64, v65, (uint64_t *)v88);
      sub_2463C078C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_246381000, v61, v62, "NLContextUpdate for disambiguation: %s", v63, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    (*(void (**)(int64_t, int64_t))(v48 + 8))(v9, v4);
    OUTLINED_FUNCTION_7_13();
    v66 = v78;
    OUTLINED_FUNCTION_9_11();
    OUTLINED_FUNCTION_15_10(v68, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    (*(void (**)(char *, size_t))(v2 + 8))(v66, v3);
    OUTLINED_FUNCTION_5_3();
    return;
  }
  if (v47 >= 1)
  {
    v49 = 0;
    v4 = v36 & 0xC000000000000001;
    do
    {
      if (v4)
        v50 = (id)MEMORY[0x249559828](v49, v36);
      else
        v50 = *(id *)(v36 + 8 * v49 + 32);
      v51 = v50;
      sub_2463C0348();
      OUTLINED_FUNCTION_8();
      sub_2463C033C();
      sub_2463C02E8();
      OUTLINED_FUNCTION_8();
      sub_2463C02DC();
      v52 = objc_msgSend(v51, sel_displayString, v67, v68);
      sub_2463C0618();
      v3 = v53;

      sub_2463C02D0();
      swift_bridgeObjectRelease();
      swift_retain();
      sub_2463C0330();
      swift_release();
      sub_2463C036C();
      OUTLINED_FUNCTION_8();
      v2 = sub_2463C0360();
      sub_2463C0324();

      swift_release();
      v54 = swift_release();
      MEMORY[0x24955969C](v54);
      if (*(_QWORD *)((v88[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v88[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2463C06A8();
      ++v49;
      sub_2463C06C0();
      sub_2463C069C();
      v36 = v84;
    }
    while (v47 != v49);
    OUTLINED_FUNCTION_3_6();
    v55 = v88[0];
    OUTLINED_FUNCTION_3_21();
    v48 = v77;
    v9 = v69;
    goto LABEL_35;
  }
  __break(1u);
LABEL_46:
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_14_13();
  __break(1u);
}

void sub_2463B8124()
{
  qword_257571258 = 0x797469746E656469;
  unk_257571260 = 0xEA00000000006449;
}

void sub_2463B814C()
{
  strcpy((char *)&qword_257571268, "identityName");
  unk_257571275 = 0;
  unk_257571276 = -5120;
}

uint64_t sub_2463B8178()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257570E98);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_2463C36B0;
  *(_QWORD *)(result + 32) = 0x7473726966;
  *(_QWORD *)(result + 40) = 0xE500000000000000;
  *(_QWORD *)(result + 48) = 0x646E6F636573;
  *(_QWORD *)(result + 56) = 0xE600000000000000;
  *(_QWORD *)(result + 64) = 0x6472696874;
  *(_QWORD *)(result + 72) = 0xE500000000000000;
  *(_QWORD *)(result + 80) = 0x687472756F66;
  *(_QWORD *)(result + 88) = 0xE600000000000000;
  *(_QWORD *)(result + 96) = 0x6874666966;
  *(_QWORD *)(result + 104) = 0xE500000000000000;
  *(_QWORD *)(result + 112) = 0x6874786973;
  *(_QWORD *)(result + 120) = 0xE500000000000000;
  *(_QWORD *)(result + 128) = 0x68746E65766573;
  *(_QWORD *)(result + 136) = 0xE700000000000000;
  *(_QWORD *)(result + 144) = 0x687468676965;
  *(_QWORD *)(result + 152) = 0xE600000000000000;
  *(_QWORD *)(result + 160) = 0x68746E696ELL;
  *(_QWORD *)(result + 168) = 0xE500000000000000;
  *(_QWORD *)(result + 176) = 0x68746E6574;
  *(_QWORD *)(result + 184) = 0xE500000000000000;
  *(_QWORD *)(result + 192) = 0x68746E6576656C65;
  *(_QWORD *)(result + 200) = 0xE800000000000000;
  *(_QWORD *)(result + 208) = 0x6874666C657774;
  *(_QWORD *)(result + 216) = 0xE700000000000000;
  *(_QWORD *)(result + 224) = 0x6E65657472696874;
  *(_QWORD *)(result + 232) = 0xEA00000000006874;
  *(_QWORD *)(result + 240) = 0x6E65657472756F66;
  *(_QWORD *)(result + 248) = 0xEA00000000006874;
  *(_QWORD *)(result + 256) = 0x746E656574666966;
  *(_QWORD *)(result + 264) = 0xE900000000000068;
  *(_QWORD *)(result + 272) = 0x746E656574786973;
  *(_QWORD *)(result + 280) = 0xE900000000000068;
  *(_QWORD *)(result + 288) = 0x6565746E65766573;
  *(_QWORD *)(result + 296) = 0xEB0000000068746ELL;
  *(_QWORD *)(result + 304) = 0x6E65657468676965;
  *(_QWORD *)(result + 312) = 0xEA00000000006874;
  *(_QWORD *)(result + 320) = 0x6E656574656E696ELL;
  *(_QWORD *)(result + 328) = 0xEA00000000006874;
  *(_QWORD *)(result + 336) = 0x746569746E657774;
  *(_QWORD *)(result + 344) = 0xE900000000000068;
  strcpy((char *)(result + 352), "twenty first");
  *(_BYTE *)(result + 365) = 0;
  *(_WORD *)(result + 366) = -5120;
  strcpy((char *)(result + 368), "twenty second");
  *(_WORD *)(result + 382) = -4864;
  strcpy((char *)(result + 384), "twenty third");
  *(_BYTE *)(result + 397) = 0;
  *(_WORD *)(result + 398) = -5120;
  strcpy((char *)(result + 400), "twenty fourth");
  *(_WORD *)(result + 414) = -4864;
  strcpy((char *)(result + 416), "twenty fifth");
  *(_BYTE *)(result + 429) = 0;
  *(_WORD *)(result + 430) = -5120;
  off_257571278 = (_UNKNOWN *)result;
  return result;
}

void sub_2463B83CC()
{
  qword_257571280 = 1953718636;
  *(_QWORD *)algn_257571288 = 0xE400000000000000;
}

void sub_2463B83E8()
{
  strcpy((char *)&qword_257571290, "secondToLast");
  algn_257571298[5] = 0;
  *(_WORD *)&algn_257571298[6] = -5120;
}

void sub_2463B8414()
{
  qword_2575712A0 = 0x4C6F546472696874;
  *(_QWORD *)algn_2575712A8 = 0xEB00000000747361;
}

uint64_t sub_2463B8440()
{
  sub_2463BFE74();
  OUTLINED_FUNCTION_11_10();
  sub_2463BFE50();
  sub_2463BFE5C();
  sub_2463BFE68();
  return sub_2463BFE38();
}

size_t sub_2463B8490(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  size_t result;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v13 = sub_2463BFC94();
  v2 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v6 = MEMORY[0x24BEE4AF8];
    if (!v5)
      return v6;
    v15 = MEMORY[0x24BEE4AF8];
    result = sub_2463B1FF8(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
      break;
    v8 = 0;
    v6 = v15;
    while (v5 != v8)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x249559828](v8, a1);
      else
        v9 = *(id *)(a1 + 8 * v8 + 32);
      v10 = v9;
      v14 = v9;
      sub_2463B8884(&v14, (uint64_t)v4);

      v15 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      v11 = *(_QWORD *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_2463B1FF8(v11 > 1, v12 + 1, 1);
        v6 = v15;
      }
      ++v8;
      *(_QWORD *)(v6 + 16) = v12 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v6+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v12, v4, v13);
      if (v5 == v8)
        return v6;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v5 = sub_2463C08B8();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_2463B863C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v0 = OUTLINED_FUNCTION_13_13();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_12_0();
  v4 = v3 - v2;
  if (qword_25756EFB8 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  swift_bridgeObjectRetain_n();
  v6 = sub_2463C05A0();
  v7 = sub_2463C0720();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_5();
    v14 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v8 = 136315138;
    v9 = sub_2463BFC94();
    v10 = swift_bridgeObjectRetain();
    v11 = MEMORY[0x2495596C0](v10, v9);
    v13 = v12;
    swift_bridgeObjectRelease();
    sub_24639AE68(v11, v13, &v14);
    sub_2463C078C();
    OUTLINED_FUNCTION_12_11();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246381000, v6, v7, "displayHints for makeDisambiguationUpdate: %s", v8, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_12_11();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  sub_2463BFE74();
  OUTLINED_FUNCTION_11_10();
  sub_2463BFE50();
  sub_2463BFE38();
  sub_2463BFE2C();
  sub_2463BFE44();
  sub_2463BFE68();
  sub_2463BFE5C();
  swift_bridgeObjectRetain();
  sub_2463BFE14();
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_2463B8884@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  _QWORD v23[2];

  v23[1] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575712C8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2463BFCDC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v23 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v23 - v14;
  v16 = *a1;
  sub_2463BFCD0();
  sub_2463BFCD0();
  sub_24639B5D8(v16);
  v18 = v17;
  swift_bridgeObjectRelease();
  if (v18)
  {
    if (qword_25756EF80 != -1)
      swift_once();
    swift_bridgeObjectRetain();
    sub_2463BFCAC();
    sub_24639B5D8(v16);
    sub_2463BFCB8();
    sub_2463BFCC4();
    if (qword_25756EF88 != -1)
      swift_once();
    swift_bridgeObjectRetain();
    sub_2463BFCAC();
    v19 = objc_msgSend(v16, sel_displayString);
    sub_2463C0618();

    sub_2463BFCB8();
    sub_2463BFCC4();
  }
  v20 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v20(v5, v15, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  v20(v10, v13, v6);
  sub_2463BFC7C();
  v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v13, v6);
  return ((uint64_t (*)(char *, uint64_t))v21)(v15, v6);
}

uint64_t sub_2463B8B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t result;
  char *v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;

  v36 = a3;
  v5 = sub_2463BFC94();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v34 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v34 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v34 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v34 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575712C8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_2463BFCDC();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2463BFC88();
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19) == 1)
  {
    sub_2463857A0((uint64_t)v18, &qword_2575712C8);
    result = sub_2463C08A0();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v18, v19);
    if (qword_25756EF90 != -1)
      swift_once();
    v23 = (unint64_t)off_257571278;
    v24 = *((_QWORD *)off_257571278 + 2);
    v37 = v20;
    if (v24 <= a1)
    {
      a2 = MEMORY[0x24BEE4AF8];
      v15 = (char *)v5;
      goto LABEL_9;
    }
    if (a1 < 0)
      goto LABEL_36;
    swift_bridgeObjectRetain();
    sub_2463B9190((uint64_t)v22);
    swift_bridgeObjectRelease();
    a2 = sub_2463B9334(0, 1, 1, MEMORY[0x24BEE4AF8], &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
    v20 = *(_QWORD *)(a2 + 16);
    v23 = *(_QWORD *)(a2 + 24);
    v18 = (char *)(v20 + 1);
    if (v20 >= v23 >> 1)
      goto LABEL_37;
    while (1)
    {
      *(_QWORD *)(a2 + 16) = v18;
      v25 = v15;
      v15 = (char *)v5;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v20, v25, v5);
      v20 = v37;
LABEL_9:
      v5 = v36;
      v23 = v36 - 3;
      if (!__OFSUB__(v36, 3))
        break;
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      a2 = sub_2463B9334(v23 > 1, (int64_t)v18, 1, a2, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
    }
    if (v23 == a1)
    {
      if (qword_25756EFA8 != -1)
        swift_once();
      sub_2463B9190((uint64_t)v22);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        a2 = sub_2463B9334(0, *(_QWORD *)(a2 + 16) + 1, 1, a2, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
      v27 = *(_QWORD *)(a2 + 16);
      v26 = *(_QWORD *)(a2 + 24);
      if (v27 >= v26 >> 1)
        a2 = sub_2463B9334(v26 > 1, v27 + 1, 1, a2, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
      *(_QWORD *)(a2 + 16) = v27 + 1;
      (*(void (**)(unint64_t, char *, char *))(v6 + 32))(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v27, v13, v15);
      v20 = v37;
    }
    if (v5 - 2 == a1)
    {
      if (qword_25756EFA0 != -1)
        swift_once();
      sub_2463B9190((uint64_t)v22);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        a2 = sub_2463B9334(0, *(_QWORD *)(a2 + 16) + 1, 1, a2, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
      v29 = *(_QWORD *)(a2 + 16);
      v28 = *(_QWORD *)(a2 + 24);
      if (v29 >= v28 >> 1)
        a2 = sub_2463B9334(v28 > 1, v29 + 1, 1, a2, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
      *(_QWORD *)(a2 + 16) = v29 + 1;
      (*(void (**)(unint64_t, char *, char *))(v6 + 32))(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v29, v35, v15);
      v20 = v37;
    }
    if (v5 - 1 == a1)
    {
      if (qword_25756EF98 != -1)
        swift_once();
      v30 = v34;
      sub_2463B9190((uint64_t)v22);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        a2 = sub_2463B9334(0, *(_QWORD *)(a2 + 16) + 1, 1, a2, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
      v32 = *(_QWORD *)(a2 + 16);
      v31 = *(_QWORD *)(a2 + 24);
      if (v32 >= v31 >> 1)
        a2 = sub_2463B9334(v31 > 1, v32 + 1, 1, a2, &qword_257570EB0, (void (*)(_QWORD))MEMORY[0x24BE97730], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A88);
      *(_QWORD *)(a2 + 16) = v32 + 1;
      (*(void (**)(unint64_t, char *, char *))(v6 + 32))(a2+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v32, v30, v15);
      v20 = v37;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    return a2;
  }
  return result;
}

uint64_t sub_2463B9190(uint64_t a1)
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
  void (*v12)(char *, uint64_t, uint64_t);
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575712C8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2463BFCDC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v14 - v10;
  sub_2463BFCD0();
  sub_2463BFCAC();
  swift_bridgeObjectRetain();
  sub_2463BFCB8();
  sub_2463BFCC4();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v4, a1, v5);
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v5);
  v12(v9, (uint64_t)v11, v5);
  sub_2463BFC7C();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t sub_2463B9318(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_2463B9334(a1, a2, a3, a4, qword_25756FBE8, (void (*)(_QWORD))type metadata accessor for UserAccount, (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A7C);
}

uint64_t sub_2463B9334(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD), void (*a7)(uint64_t, uint64_t, unint64_t))
{
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  size_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (!v14)
  {
    v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v15 = *(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8);
  v16 = *(_QWORD *)(v15 + 72);
  v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v18 = (_QWORD *)swift_allocObject();
  v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (v20 = v16 == -1) : (v20 = 0), v20))
  {
LABEL_24:
    OUTLINED_FUNCTION_0_11();
    result = sub_2463C0894();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  v21 = *(unsigned __int8 *)(*(_QWORD *)(((uint64_t (*)(_QWORD))a6)(0) - 8) + 80);
  v22 = (v21 + 32) & ~v21;
  v23 = (unint64_t)v18 + v22;
  if ((a1 & 1) != 0)
  {
    a7(a4 + v22, v13, v23);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_10();
  }
  else
  {
    sub_2463B9514(0, v13, v23, a4, a6);
  }
  return (uint64_t)v18;
}

uint64_t sub_2463B94F8(char a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_2463B9334(a1, a2, a3, a4, &qword_2575712C0, (void (*)(_QWORD))MEMORY[0x24BE9C828], (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A94);
}

uint64_t sub_2463B9514(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    a5(0);
    OUTLINED_FUNCTION_10_12();
    v11 = *(_QWORD *)(v10 + 72);
    v12 = a4 + v9 + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      OUTLINED_FUNCTION_10();
      return v14;
    }
  }
  OUTLINED_FUNCTION_0_11();
  result = OUTLINED_FUNCTION_14_13();
  __break(1u);
  return result;
}

void sub_2463B9604(uint64_t a1)
{
  sub_2463B9628(a1, qword_25756FBE8, (void (*)(_QWORD))type metadata accessor for UserAccount, (void (*)(uint64_t, uint64_t, unint64_t))sub_2463B1A7C, (void (*)(uint64_t, uint64_t, uint64_t))sub_2463B1D1C);
}

void sub_2463B9628(uint64_t a1, uint64_t *a2, void (*a3)(_QWORD), void (*a4)(uint64_t, uint64_t, unint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = *v5;
  v8 = *(_QWORD *)(*v5 + 16);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v7 + 24) >> 1)
  {
    if (v8 <= v9)
      v16 = v8 + v6;
    else
      v16 = v8;
    v7 = sub_2463B9334(isUniquelyReferenced_nonNull_native, v16, 1, v7, a2, a3, a4);
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v6)
      goto LABEL_14;
    goto LABEL_16;
  }
  v17 = *(_QWORD *)(v7 + 16);
  v18 = (*(_QWORD *)(v7 + 24) >> 1) - v17;
  a3(0);
  if (v18 < v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_10_12();
  a5(a1 + v20, v6, v7 + v20 + *(_QWORD *)(v19 + 72) * v17);
  if (!v6)
  {
LABEL_14:
    OUTLINED_FUNCTION_10();
    *v5 = v7;
    OUTLINED_FUNCTION_5_3();
    return;
  }
  v21 = *(_QWORD *)(v7 + 16);
  v22 = __OFADD__(v21, v6);
  v23 = v21 + v6;
  if (!v22)
  {
    *(_QWORD *)(v7 + 16) = v23;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_7_13()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 240) + 8))(*(_QWORD *)(v0 - 248), *(_QWORD *)(v0 - 232));
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  return swift_beginAccess();
}

unint64_t OUTLINED_FUNCTION_11_10()
{
  return 0xD00000000000001ALL;
}

uint64_t OUTLINED_FUNCTION_12_11()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  return sub_2463C05B8();
}

uint64_t OUTLINED_FUNCTION_14_13()
{
  return sub_2463C08C4();
}

uint64_t OUTLINED_FUNCTION_15_10@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_2463B97B8(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;

  sub_246395EA8();
  swift_bridgeObjectRetain();
  v4 = sub_2463B987C(a1, a2, 0xD000000000000024, 0x80000002463C5B30);
  if (!v4)
    return MEMORY[0x24BEE4AF8];
  v5 = v4;
  sub_2463BFBE0();
  sub_2463BFBBC();
  sub_2463BFBD4();
  swift_release();
  v6 = sub_2463BFBC8();

  swift_release();
  return v6;
}

id sub_2463B987C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
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
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v30;
  uint64_t v31;

  v7 = sub_2463C05B8();
  v30 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_12_0();
  v10 = v9 - v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575712D8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_12_0();
  v14 = v13 - v12;
  v15 = sub_2463BF8EC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_12_0();
  v19 = v18 - v17;
  sub_2463BF8E0();
  if (__swift_getEnumTagSinglePayload(v14, 1, v15) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2463B9BF0(v14);
    if (qword_25756EFB8 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v7, (uint64_t)qword_2575745E0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v10, v20, v7);
    swift_bridgeObjectRetain();
    v21 = sub_2463C05A0();
    v22 = sub_2463C072C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      sub_24639AE68(a3, a4, &v31);
      sub_2463C078C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246381000, v21, v22, "URL construction failed for %s", v23, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v10, v7);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v19, v14, v15);
    v24 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    sub_2463B9C30(a1, a2, v24);
    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
    v26 = (void *)sub_2463BF8D4();
    objc_msgSend(v25, sel_setPunchOutUri_, v26);

    __swift_instantiateConcreteTypeFromMangledName(&qword_2575712E0);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_2463C1F90;
    *(_QWORD *)(v27 + 32) = v25;
    v31 = v27;
    sub_2463C069C();
    sub_2463A1A10(v31, v24);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v15);
  }
  return v24;
}

uint64_t sub_2463B9BF0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575712D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2463B9C30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2463C060C();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setText_, v4);

}

uint64_t sub_2463B9C80()
{
  unint64_t v0;
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_24638571C(v1);
  OUTLINED_FUNCTION_79_0();
  if (v0)
  {
    result = sub_24638571C(v1);
    if (!v3)
    {
      __break(1u);
LABEL_14:
      __break(1u);
      return result;
    }
    v4 = result;
    OUTLINED_FUNCTION_79_0();
    v5 = HIBYTE(v0) & 0xF;
    if ((v0 & 0x2000000000000000) == 0)
      v5 = v4 & 0xFFFFFFFFFFFFLL;
    if (v5)
      return 0;
  }
  sub_246385728(v1);
  OUTLINED_FUNCTION_79_0();
  if (!v0)
    return 1;
  result = sub_246385728(v1);
  if (!v6)
    goto LABEL_14;
  v7 = result;
  OUTLINED_FUNCTION_79_0();
  v8 = HIBYTE(v0) & 0xF;
  if ((v0 & 0x2000000000000000) == 0)
    v8 = v7 & 0xFFFFFFFFFFFFLL;
  return v8 == 0;
}

id sub_2463B9D2C(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  DeviceUnit.description.getter();

  v2 = (void *)sub_2463C060C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DeviceUnit.description.getter()
{
  sub_2463C07E0();
  sub_2463C0654();
  sub_2463C04EC();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  sub_2463C04E0();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  sub_2463C04F8();
  sub_2463C0558();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  sub_2463C0654();
  return 0;
}

uint64_t sub_2463B9EC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[40];

  type metadata accessor for BaseDialogProvider();
  v2 = swift_allocObject();
  sub_2463AC788(a1, (uint64_t)v5);
  v3 = sub_2463BA574(v2, (uint64_t)v5);
  sub_2463B4634(a1);
  return v3;
}

uint64_t sub_2463B9F24(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2463B9F3C()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
  v1 = sub_2463BFF7C();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2463B9F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_2463C05B8();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2463B9FE0()
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
  void *v11;
  id v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;

  if (qword_25756EFB8 != -1)
    swift_once();
  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[5];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_2463C05A0();
  v6 = sub_2463C0720();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_246381000, v5, v6, "SwitchProfileUnsupportedValueFlowStrategy.makeUnsupportedValueOutput() called", v7, 2u);
    MEMORY[0x249559E1C](v7, -1, -1);
  }
  v9 = v0[6];
  v8 = v0[7];
  v10 = v0[5];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257570240);
  v11 = (void *)sub_2463BFF88();
  v12 = objc_msgSend(v11, sel_unsupportedReason);

  v13 = SwitchProfileAccountUnsupportedReason.init(rawValue:)((uint64_t)v12);
  if ((v14 & 1) != 0)
  {
LABEL_10:
    OUTLINED_FUNCTION_6_14();
    v18 = (_QWORD *)swift_task_alloc();
    v0[11] = v18;
    v19 = OUTLINED_FUNCTION_4_18(v18);
    return sub_246394B08(v19);
  }
  switch(v13)
  {
    case 5:
      OUTLINED_FUNCTION_6_14();
      v20 = (_QWORD *)swift_task_alloc();
      v0[9] = v20;
      v21 = OUTLINED_FUNCTION_4_18(v20);
      return sub_24639539C(v21);
    case 4:
      OUTLINED_FUNCTION_6_14();
      v22 = (_QWORD *)swift_task_alloc();
      v0[10] = v22;
      v23 = OUTLINED_FUNCTION_4_18(v22);
      return sub_246395420(v23);
    case 3:
      OUTLINED_FUNCTION_6_14();
      v15 = (_QWORD *)swift_task_alloc();
      v0[8] = v15;
      v16 = OUTLINED_FUNCTION_4_18(v15);
      return sub_246394C48(v16);
    default:
      goto LABEL_10;
  }
}

uint64_t sub_2463BA214()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_90(v1);
  OUTLINED_FUNCTION_5_17();
  return OUTLINED_FUNCTION_0_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463BA244()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_90(v1);
  OUTLINED_FUNCTION_5_17();
  return OUTLINED_FUNCTION_0_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463BA274()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_90(v1);
  OUTLINED_FUNCTION_5_17();
  return OUTLINED_FUNCTION_0_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463BA2A4()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_90(v1);
  OUTLINED_FUNCTION_5_17();
  return OUTLINED_FUNCTION_0_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463BA2D4()
{
  uint64_t v0;

  sub_24638C60C(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2463BA318(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24638966C;
  return sub_2463B9F7C(a1, a2);
}

uint64_t sub_2463BA37C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246389164;
  return sub_2463B9F24(a1);
}

uint64_t sub_2463BA3C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2463898B0;
  return sub_2463BFA00();
}

uint64_t sub_2463BA444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v8;
  uint64_t v9;
  __int128 v10[2];
  _BYTE v11[40];
  _BYTE v12[40];
  _QWORD __src[11];
  _QWORD v14[5];

  v14[3] = type metadata accessor for BaseDialogProvider();
  v14[4] = &off_251795888;
  v14[0] = a1;
  sub_24638F8D0((uint64_t)v14, (uint64_t)v12);
  sub_2463AC788(a2, (uint64_t)v11);
  sub_24638F8D0((uint64_t)v12, (uint64_t)__src);
  sub_2463AC788((uint64_t)v11, (uint64_t)&v8);
  if (v9)
  {
    sub_2463B4634((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    sub_246389878(&v8, (uint64_t)v10);
  }
  else
  {
    sub_2463C0030();
    sub_2463B4634((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    sub_2463B4634((uint64_t)&v8);
  }
  sub_246389878(v10, (uint64_t)&__src[5]);
  sub_24638F8D0((uint64_t)&__src[5], (uint64_t)v10);
  type metadata accessor for LocUtil();
  v6 = swift_allocObject();
  sub_246389878(v10, v6 + 16);
  __src[10] = v6;
  sub_2463B4634(a2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  memcpy((void *)(a3 + 16), __src, 0x58uLL);
  return a3;
}

uint64_t sub_2463BA574(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v12[3];
  uint64_t v13;
  char **v14;

  v13 = type metadata accessor for BaseDialogProvider();
  v14 = &off_251795888;
  v12[0] = a1;
  type metadata accessor for SwitchProfileUnsupportedValueFlowStrategy();
  v4 = swift_allocObject();
  v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v12, v13);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (_QWORD *)((char *)&v12[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  v9 = sub_2463BA444(*v7, a2, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v9;
}

uint64_t OUTLINED_FUNCTION_0_13(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_4_18(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 16);
}

uint64_t OUTLINED_FUNCTION_5_17()
{
  return swift_task_dealloc();
}

uint64_t SwitchType.description.getter()
{
  sub_2463C08F4();
  sub_2463C0654();
  swift_bridgeObjectRelease();
  return 0x3D65707974;
}

uint64_t sub_2463BA6D8()
{
  return SwitchType.description.getter();
}

ValueMetadata *type metadata accessor for GuardedFlow()
{
  return &type metadata for GuardedFlow;
}

uint64_t sub_2463BA6F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = sub_2463C05B8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v1, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v3, v1);
  v4 = sub_2463C05A0();
  v5 = sub_2463C0720();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_246381000, v4, v5, "GuardedFlow on | returning true", v6, 2u);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return 1;
}

uint64_t sub_2463BA800(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v18[3];
  uint64_t v19;

  v18[1] = a2;
  v6 = sub_2463BFE08();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2463C05B8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_2();
  if (qword_25756EFB8 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v10, (uint64_t)qword_2575745E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v3, v12, v10);
  v13 = sub_2463C05A0();
  v14 = sub_2463C0720();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    v18[0] = v9;
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_246381000, v13, v14, "GuardedFlow executing | executing flow with guards", v15, 2u);
    OUTLINED_FUNCTION_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v3, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575713D0);
  sub_2463BFAB4();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2463C1B70;
  sub_2463BFAA8();
  v16 = sub_2463BF958();
  swift_bridgeObjectRelease();
  v18[2] = v16;
  v19 = a3;
  sub_2463BFA90();
  sub_2463BFA9C();
  v19 = sub_2463BFB68();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575713D8);
  sub_2463BAB1C();
  sub_2463BFDE4();
  swift_release();
  a1(v9);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_2463BAA8C()
{
  sub_2463BA6F0();
  return 1;
}

uint64_t sub_2463BAAA4(void (*a1)(char *), uint64_t a2)
{
  uint64_t *v2;

  return sub_2463BA800(a1, a2, *v2);
}

uint64_t sub_2463BAAAC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24638966C;
  return sub_2463BFB5C();
}

unint64_t sub_2463BAB1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575713E0;
  if (!qword_2575713E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575713D8);
    result = MEMORY[0x249559D74](MEMORY[0x24BE95F90], v1);
    atomic_store(result, (unint64_t *)&qword_2575713E0);
  }
  return result;
}

double sub_2463BAB60@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_44_1(a1, a2), (v7 & 1) != 0))
  {
    sub_24639BB70(*(_QWORD *)(v4 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_2463BABB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_QWORD *)(a3 + 16) && (v6 = OUTLINED_FUNCTION_44_1(a1, a2), (v7 & 1) != 0))
  {
    v8 = v6;
    v9 = *(_QWORD *)(v4 + 56);
    v10 = type metadata accessor for UserAccount();
    sub_2463BC720(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v8, a4);
    v11 = a4;
    v12 = 0;
    v13 = 1;
    v14 = v10;
  }
  else
  {
    type metadata accessor for UserAccount();
    v11 = OUTLINED_FUNCTION_36_3();
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, v13, v14);
}

uint64_t sub_2463BAC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (OUTLINED_FUNCTION_44_1(a1, a2), (v3 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t sub_2463BAC68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_2463BAC7C()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_2463C05E8();
  v0[6] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_2463BAD00;
  return sub_2463AAD98(v0[2], v0[3], v0[4], v1);
}

uint64_t sub_2463BAD00()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    OUTLINED_FUNCTION_21();
    return OUTLINED_FUNCTION_2_6();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_0_13(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_2463BAD60()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463BAD8C()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_2463C08D0();
  OUTLINED_FUNCTION_10();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_2463BADD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  double v23;
  void (*v24)(char *, uint64_t, double);
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  _QWORD v60[3];
  uint64_t v61;
  uint64_t v62;

  v55 = a2;
  v56 = a1;
  v49 = sub_2463C0018();
  v51 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v53 = (uint64_t)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_2463C0024();
  v3 = *(_QWORD *)(v57 - 8);
  v4 = MEMORY[0x24BDAC7A8](v57);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)&v47 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v47 - v9;
  v11 = OUTLINED_FUNCTION_7_2();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v47 = (uint64_t)&v47 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v47 - v17;
  if (qword_25756EFB8 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v11, (uint64_t)qword_2575745E0);
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v52(v18, v19, v11);
  v20 = sub_2463C05A0();
  v21 = sub_2463C0720();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v22 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v20, v21, "DeviceConfirmationStrategy.actionForInput() called", v22);
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_30_4((uint64_t)v18);
  sub_2463BFFE8();
  v23 = sub_2463A5CA0((uint64_t)v10, (uint64_t *)&v58);
  v24 = *(void (**)(char *, uint64_t, double))(v3 + 8);
  v25 = v10;
  v26 = v57;
  v24(v25, v57, v23);
  if (!v59)
  {
    sub_2463857A0((uint64_t)&v58, (uint64_t *)&unk_257570290);
    v30 = v54;
    sub_2463BFFE8();
    if ((*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v30, v26) == *MEMORY[0x24BE98E88])
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v30, v26);
      (*(void (**)(char *, uint64_t))(v3 + 96))(v6, v26);
      v31 = v51;
      OUTLINED_FUNCTION_4_9(v53, (uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 32));
      if (sub_2463C0000() == *(_QWORD *)(v48 + 152) && v32 == *(_QWORD *)(v48 + 160))
      {
        OUTLINED_FUNCTION_10();
      }
      else
      {
        v34 = OUTLINED_FUNCTION_0_2();
        OUTLINED_FUNCTION_10();
        if ((v34 & 1) == 0)
        {
          OUTLINED_FUNCTION_22_0(v53, *(uint64_t (**)(uint64_t, uint64_t))(v31 + 8));
          goto LABEL_15;
        }
      }
      v42 = v19;
      v43 = v47;
      OUTLINED_FUNCTION_37_1(v47, v42);
      v44 = sub_2463C05A0();
      v45 = sub_2463C0720();
      if (OUTLINED_FUNCTION_4_12(v45))
      {
        v46 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)v46 = 0;
        OUTLINED_FUNCTION_4_3(&dword_246381000, v44, (os_log_type_t)v43, "DeviceConfirmationStrategy.actionForInput() called for directInvocation", v46);
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_30_4(v43);
      sub_2463BFCF4();
      OUTLINED_FUNCTION_22_0(v53, *(uint64_t (**)(uint64_t, uint64_t))(v31 + 8));
      return ((uint64_t (*)(char *, uint64_t))v24)(v30, v26);
    }
LABEL_15:
    v35 = (uint64_t)v50;
    v36 = OUTLINED_FUNCTION_32_6();
    OUTLINED_FUNCTION_37_1(v36, v37);
    v38 = sub_2463C05A0();
    v39 = sub_2463C0720();
    if (OUTLINED_FUNCTION_4_12(v39))
    {
      v40 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v40 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v38, (os_log_type_t)v35, "DeviceConfirmationStrategy.actionForInput() called for default", v40);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_30_4(v35);
    sub_2463BFD00();
    return ((uint64_t (*)(char *, uint64_t))v24)(v30, v26);
  }
  sub_246389878(&v58, (uint64_t)v60);
  v27 = v61;
  v28 = v62;
  __swift_project_boxed_opaque_existential_1(v60, v61);
  v29 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v28 + 16))(v27, v28);
  if (v29 >= 2)
  {
    if (v29 == 2)
      sub_2463BFCE8();
    else
      sub_2463BFD00();
  }
  else
  {
    sub_2463BFCF4();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
}

uint64_t sub_2463BB25C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570400);
  v3[21] = OUTLINED_FUNCTION_3_4();
  v4 = sub_2463C0018();
  v3[22] = v4;
  v3[23] = *(_QWORD *)(v4 - 8);
  v3[24] = OUTLINED_FUNCTION_3_4();
  v5 = sub_2463C0024();
  v3[25] = v5;
  v3[26] = *(_QWORD *)(v5 - 8);
  v3[27] = OUTLINED_FUNCTION_3_9();
  v3[28] = OUTLINED_FUNCTION_11_1();
  v3[29] = OUTLINED_FUNCTION_11_1();
  v6 = sub_2463BFEC8();
  v3[30] = v6;
  v3[31] = *(_QWORD *)(v6 - 8);
  v3[32] = OUTLINED_FUNCTION_3_9();
  v3[33] = OUTLINED_FUNCTION_11_1();
  v7 = OUTLINED_FUNCTION_7_2();
  v3[34] = v7;
  v3[35] = *(_QWORD *)(v7 - 8);
  v3[36] = OUTLINED_FUNCTION_3_9();
  v3[37] = OUTLINED_FUNCTION_11_1();
  v3[38] = OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463BB338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  double v12;
  void (*v13)(uint64_t, uint64_t, double);
  NSObject *v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  void *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(void);
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t);

  if (qword_25756EFB8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 280);
  v61 = __swift_project_value_buffer(*(_QWORD *)(v0 + 272), (uint64_t)qword_2575745E0);
  v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  OUTLINED_FUNCTION_4_9(v1, v61, v62);
  v3 = sub_2463C05A0();
  v4 = sub_2463C0720();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v5 = 0;
    OUTLINED_FUNCTION_4_3(&dword_246381000, v3, v4, "DeviceConfirmationStrategy.parseConfirmationResponse() called", v5);
    OUTLINED_FUNCTION_0();
  }
  v6 = *(_QWORD *)(v0 + 280);
  v7 = *(_QWORD *)(v0 + 232);
  v9 = *(_QWORD *)(v0 + 200);
  v8 = *(_QWORD *)(v0 + 208);

  v10 = *(void (**)(uint64_t))(v6 + 8);
  v11 = OUTLINED_FUNCTION_32_6();
  v10(v11);
  sub_2463BFFE8();
  v12 = sub_2463A5CA0(v7, (uint64_t *)(v0 + 56));
  v13 = *(void (**)(uint64_t, uint64_t, double))(v8 + 8);
  v13(v7, v9, v12);
  if (*(_QWORD *)(v0 + 80))
  {
    v14 = *(NSObject **)(v0 + 296);
    v15 = *(_QWORD *)(v0 + 272);
    sub_246389878((__int128 *)(v0 + 56), v0 + 16);
    v62((uint64_t)v14, v61, v15);
    sub_2463C05A0();
    v16 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_22(v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v17 = 0;
      OUTLINED_FUNCTION_4_3(&dword_246381000, v14, (os_log_type_t)v8, "DeviceConfirmationStrategy.actionForInput() called for NLv3IntentOnly", v17);
      OUTLINED_FUNCTION_0();
    }
    v18 = *(_QWORD *)(v0 + 296);

    OUTLINED_FUNCTION_30_4(v18);
    v19 = *(_QWORD *)(v0 + 40);
    v20 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v19);
    v21 = (char *)&loc_2463BB50C
        + 4 * byte_2463C3850[(*(unsigned __int8 (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20)];
    __asm { BR              X10 }
  }
  sub_2463857A0(v0 + 56, (uint64_t *)&unk_257570290);
  sub_2463BFFE8();
  v22 = OUTLINED_FUNCTION_32_6();
  if (v23(v22) != *MEMORY[0x24BE98E88])
    goto LABEL_16;
  v24 = *(_QWORD *)(v0 + 216);
  v25 = *(_QWORD *)(v0 + 208);
  v27 = *(_QWORD *)(v0 + 184);
  v26 = *(_QWORD *)(v0 + 192);
  v28 = *(_QWORD *)(v0 + 176);
  v29 = *(_QWORD *)(v0 + 160);
  OUTLINED_FUNCTION_4_9(v24, *(_QWORD *)(v0 + 224), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 16));
  OUTLINED_FUNCTION_22_0(v24, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 96));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v26, v24, v28);
  if (sub_2463C0000() == *(_QWORD *)(v29 + 152) && v30 == *(_QWORD *)(v29 + 160))
  {
    OUTLINED_FUNCTION_3_6();
  }
  else
  {
    v32 = OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_3_6();
    if ((v32 & 1) == 0)
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 176));
LABEL_16:
      v62(*(_QWORD *)(v0 + 288), v61, *(_QWORD *)(v0 + 272));
      v33 = (void *)sub_2463C05A0();
      v34 = sub_2463C072C();
      if (OUTLINED_FUNCTION_22(v34))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
        OUTLINED_FUNCTION_10_5(&dword_246381000, v35, v36, "Unsupported parse type");
        OUTLINED_FUNCTION_0();
      }
      v37 = *(_QWORD *)(v0 + 288);
      v38 = *(_QWORD *)(v0 + 272);

      ((void (*)(uint64_t, uint64_t))v10)(v37, v38);
      OUTLINED_FUNCTION_41_1();
      OUTLINED_FUNCTION_8_2();
      v39 = OUTLINED_FUNCTION_19_7();
      sub_2463AC748();
      OUTLINED_FUNCTION_9_1();
      *v40 = v39;
      OUTLINED_FUNCTION_43_2();
      goto LABEL_30;
    }
  }
  v46 = sub_2463C000C();
  if (!v46)
  {
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
    goto LABEL_28;
  }
  sub_2463BAB60(0xD000000000000011, 0x80000002463C5CA0, v46, (_OWORD *)(v0 + 96));
  v46 = OUTLINED_FUNCTION_3_6();
  if (!*(_QWORD *)(v0 + 120))
  {
LABEL_28:
    OUTLINED_FUNCTION_19_5(v46, &qword_25756F730);
LABEL_29:
    v56 = *(_QWORD *)(v0 + 184);
    v55 = *(_QWORD *)(v0 + 192);
    v57 = *(_QWORD *)(v0 + 176);
    OUTLINED_FUNCTION_41_1();
    OUTLINED_FUNCTION_8_2();
    v58 = OUTLINED_FUNCTION_19_7();
    sub_2463AC748();
    OUTLINED_FUNCTION_9_1();
    *v59 = v58;
    OUTLINED_FUNCTION_43_2();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
LABEL_30:
    ((void (*)(_QWORD, _QWORD))v13)(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 200));
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_19();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_24();
    swift_task_dealloc();
    v45 = *(uint64_t (**)(void))(v0 + 8);
    return v45();
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_29;
  v47 = sub_2463BAD8C();
  if (v47 == 2)
    goto LABEL_29;
  v48 = v47;
  v49 = *(_QWORD *)(v0 + 264);
  v50 = *(_QWORD *)(v0 + 240);
  v51 = *(_QWORD *)(v0 + 248);
  v52 = *(_QWORD *)(v0 + 224);
  v53 = *(_QWORD *)(v0 + 200);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 176));
  v54 = (unsigned int *)MEMORY[0x24BE98400];
  if (v48)
    v54 = (unsigned int *)MEMORY[0x24BE983F8];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v51 + 104))(v49, *v54, v50);
  ((void (*)(uint64_t, uint64_t))v13)(v52, v53);
  v41 = *(_QWORD *)(v0 + 264);
  v43 = *(_QWORD *)(v0 + 240);
  v42 = *(_QWORD *)(v0 + 248);
  v44 = *(_QWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v44, v41, v43);
  __swift_storeEnumTagSinglePayload(v44, 0, 1, v43);
  sub_2463BFFDC();
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  v45 = *(uint64_t (**)(void))(v0 + 8);
  return v45();
}

uint64_t sub_2463BB9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  v3[10] = OUTLINED_FUNCTION_3_4();
  v4 = OUTLINED_FUNCTION_41_2();
  v3[11] = v4;
  v3[12] = *(_QWORD *)(v4 - 8);
  v3[13] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463BBA10()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  sub_2463C04F8();
  v1 = sub_2463C0564();
  if (v1 == sub_2463C0564() || (sub_2463C04F8(), v2 = sub_2463C0564(), v3 = 0, v4 = 0, v2 == sub_2463C0564()))
  {
    v3 = sub_2463C04EC();
    v4 = v5;
  }
  v0[14] = v4;
  v6 = (_QWORD *)swift_task_alloc();
  v0[15] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_2463BBAD0;
  return sub_24639554C(v0[13], v3, v4);
}

uint64_t sub_2463BBAD0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_2_6();
}

uint64_t sub_2463BBB2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD **)(v0 + 72);
  v6 = v5[6];
  __swift_project_boxed_opaque_existential_1(v5 + 2, v5[5]);
  sub_2463BFC58();
  sub_2463BFE8C();
  sub_2463B8440();
  v7 = sub_2463BFE80();
  __swift_storeEnumTagSinglePayload(v3, 0, 1, v7);
  sub_2463C0060();
  OUTLINED_FUNCTION_29_6();
  OUTLINED_FUNCTION_104_0(v8, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_32_6();
  sub_2463BFDC0();
  v9 = sub_2463857A0(v6, &qword_257570230);
  OUTLINED_FUNCTION_19_5(v9, &qword_257570220);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2463BBC5C()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463BBC90(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[7] = a1;
  v2[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  v2[9] = OUTLINED_FUNCTION_3_4();
  v3 = OUTLINED_FUNCTION_41_2();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = OUTLINED_FUNCTION_3_4();
  v4 = OUTLINED_FUNCTION_7_2();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463BBD04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  if (qword_25756EFB8 != -1)
    a1 = swift_once();
  v4 = *(_QWORD *)(v1 + 104);
  OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_2575745E0);
  sub_2463C05A0();
  v5 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v5))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
    OUTLINED_FUNCTION_10_5(&dword_246381000, v6, v7, "DeviceConfirmationStrategy.makeConfirmationRejectedResponse() called");
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_28_7();
  OUTLINED_FUNCTION_22_0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 80));
  v8 = (_QWORD *)OUTLINED_FUNCTION_12_4();
  *(_QWORD *)(v1 + 128) = v8;
  *v8 = v1;
  v8[1] = sub_2463BBDEC;
  OUTLINED_FUNCTION_18_8();
  return OUTLINED_FUNCTION_9_12(v9, v10, v11, v12);
}

uint64_t sub_2463BBDEC()
{
  OUTLINED_FUNCTION_11_11();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463BBE28()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_2();
  return OUTLINED_FUNCTION_0_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2463BBE64()
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
  void (*v10)(uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v1 + 40);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), v2);
  sub_2463BFC58();
  sub_2463BFE80();
  v3 = OUTLINED_FUNCTION_36_3();
  __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
  sub_2463C0060();
  OUTLINED_FUNCTION_29_6();
  OUTLINED_FUNCTION_104_0(v7, MEMORY[0x24BE99088]);
  sub_2463BFDA8();
  v8 = sub_2463857A0(v2, &qword_257570230);
  OUTLINED_FUNCTION_19_5(v8, &qword_257570220);
  v9 = OUTLINED_FUNCTION_32_6();
  v10(v9);
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_14_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2463BBF7C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[7] = a1;
  v2[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257570220);
  v2[9] = OUTLINED_FUNCTION_3_4();
  v3 = OUTLINED_FUNCTION_41_2();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = OUTLINED_FUNCTION_3_4();
  v4 = OUTLINED_FUNCTION_7_2();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463BBFF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  if (qword_25756EFB8 != -1)
    a1 = swift_once();
  v4 = *(_QWORD *)(v1 + 104);
  OUTLINED_FUNCTION_25_2(a1, (uint64_t)qword_2575745E0);
  sub_2463C05A0();
  v5 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_22(v5))
  {
    *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
    OUTLINED_FUNCTION_10_5(&dword_246381000, v6, v7, "DeviceConfirmationStrategy.makeFlowCancelledResponse() called");
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_28_7();
  OUTLINED_FUNCTION_22_0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 80));
  v8 = (_QWORD *)OUTLINED_FUNCTION_12_4();
  *(_QWORD *)(v1 + 128) = v8;
  *v8 = v1;
  v8[1] = sub_2463BC0D8;
  OUTLINED_FUNCTION_18_8();
  return OUTLINED_FUNCTION_9_12(v9, v10, v11, v12);
}

uint64_t sub_2463BC0D8()
{
  OUTLINED_FUNCTION_11_11();
  OUTLINED_FUNCTION_21();
  return OUTLINED_FUNCTION_1();
}

uint64_t sub_2463BC114()
{
  return OUTLINED_FUNCTION_5_6();
}

uint64_t sub_2463BC120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  OUTLINED_FUNCTION_41_1();
  OUTLINED_FUNCTION_8_2();
  v1 = OUTLINED_FUNCTION_19_7();
  sub_2463AC748();
  OUTLINED_FUNCTION_9_1();
  *v2 = v1;
  OUTLINED_FUNCTION_43_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2463BC184()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_24638C60C(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2463BC1B8()
{
  sub_2463BC184();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceConfirmationStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2463BC1F8()
{
  return MEMORY[0x24BE98D10];
}

uint64_t sub_2463BC208(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463BC768;
  return sub_2463BB25C(a1, a2);
}

uint64_t sub_2463BC268(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2463BC768;
  return sub_2463BB9B0(a1, v4);
}

uint64_t sub_2463BC2C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for DeviceConfirmationStrategy();
  *v1 = v0;
  v1[1] = sub_2463BC768;
  return sub_2463BFA60();
}

uint64_t sub_2463BC344()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for DeviceConfirmationStrategy();
  *v1 = v0;
  v1[1] = sub_2463BC768;
  return sub_2463BFA6C();
}

uint64_t sub_2463BC3C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2463BC410;
  return sub_2463BBC90(a1);
}

uint64_t sub_2463BC410()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_3_7(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_2463BC450(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2463BC768;
  return sub_2463BBF7C(a1);
}

uint64_t sub_2463BC4A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2463BC768;
  return sub_2463BC114();
}

unint64_t sub_2463BC4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_38_3();
  sub_2463C0648();
  v4 = sub_2463C0990();
  return sub_2463BC5A0(a1, a2, v4);
}

unint64_t sub_2463BC544(unsigned __int8 a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_38_3();
  sub_2463C0984();
  v2 = sub_2463C0990();
  return sub_2463BC680(a1, v2);
}

unint64_t sub_2463BC5A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2463C0900() & 1) == 0)
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
      while (!v14 && (sub_2463C0900() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2463BC680(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_2463BC720(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserAccount();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_9_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_11_11()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 136) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_19_7()
{
  return sub_2463B0A74(3u);
}

void OUTLINED_FUNCTION_28_7()
{
  void *v0;

}

double OUTLINED_FUNCTION_29_6()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_30_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_37_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 216))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_38_3()
{
  return sub_2463C0978();
}

uint64_t OUTLINED_FUNCTION_41_2()
{
  return sub_2463BFE98();
}

uint64_t OUTLINED_FUNCTION_43_2()
{
  return swift_willThrow();
}

unint64_t OUTLINED_FUNCTION_44_1(uint64_t a1, uint64_t a2)
{
  return sub_2463BC4E4(a1, a2);
}

uint64_t sub_2463BC84C(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_14(a1, qword_2575745C8);
}

uint64_t sub_2463BC858(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_14(a1, qword_2575745E0);
}

uint64_t sub_2463BC864(uint64_t a1)
{
  return sub_2463BC8F4(a1, qword_2575745F8);
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

uint64_t sub_2463BC8C8(uint64_t a1)
{
  return sub_2463BC8F4(a1, qword_257574610);
}

uint64_t sub_2463BC8F4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2463C05B8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2463C05AC();
}

void sub_2463BC968()
{
  strcpy((char *)&qword_257574628, "SiriIdentity");
  unk_257574635 = 0;
  unk_257574636 = -5120;
}

uint64_t OUTLINED_FUNCTION_0_14(uint64_t a1, uint64_t *a2)
{
  return sub_2463BC8F4(a1, a2);
}

id UserIdentifyIntent.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_init);
}

void UserIdentifyIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_3_22();
  UserIdentifyIntentResponse.init(code:userActivity:)(a1, a2);
  OUTLINED_FUNCTION_0_1();
}

uint64_t UserIdentifyIdentityUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 9) < 0xFFFFFFFFFFFFFFF8)
    return 0;
  return result;
}

id UserIdentifyIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t UserIdentifyIntent.__allocating_init(coder:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_7_14(v1, sel_initWithCoder_);
  OUTLINED_FUNCTION_29_5();
  return v0;
}

void UserIdentifyIntent.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  OUTLINED_FUNCTION_4_19((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_6_15();
}

void UserIdentifyIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2463C060C();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  OUTLINED_FUNCTION_0_1();
}

void UserIdentifyIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  objc_super v6;

  if (a2)
  {
    v5 = (void *)sub_2463C060C();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  objc_msgSendSuper2(&v6, sel_initWithIdentifier_backingStore_, v5, a3);

  OUTLINED_FUNCTION_2_17();
}

uint64_t UserIdentifyIntent.__allocating_init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_13_14();
  OUTLINED_FUNCTION_14_14();
  if (v3)
  {
    v4 = (void *)sub_2463C05C4();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

void *UserIdentifyIntent.init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_13_14();
  OUTLINED_FUNCTION_14_14();
  if (v3)
  {
    v4 = (void *)sub_2463C05C4();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v4 = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for UserIdentifyIntent();
  objc_msgSendSuper2(&v6, sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

id UserIdentifyIntent.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for UserIdentifyIntent);
}

unint64_t UserIdentifyIntentResponseCode.init(rawValue:)(unint64_t result)
{
  unint64_t v1;

  if (result - 100 >= 4)
    v1 = 0;
  else
    v1 = result;
  if (result >= 7)
    return v1;
  return result;
}

BOOL sub_2463BCE30(uint64_t *a1, uint64_t *a2)
{
  return sub_2463B04D0(*a1, *a2);
}

uint64_t sub_2463BCE3C()
{
  _QWORD *v0;

  return sub_2463B06AC(*v0);
}

void sub_2463BCE44()
{
  sub_2463B06D8();
}

uint64_t sub_2463BCE4C(uint64_t a1)
{
  _QWORD *v1;

  return sub_2463B07CC(a1, *v1);
}

unint64_t sub_2463BCE54@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = UserIdentifyIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t UserIdentifyIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___UserIdentifyIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2463BCF0C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___UserIdentifyIntentResponse_code);
  result = OUTLINED_FUNCTION_0_0();
  *v3 = a1;
  return result;
}

char *UserIdentifyIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___UserIdentifyIntentResponse_code];
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for UserIdentifyIntent()
{
  return objc_opt_self();
}

id UserIdentifyIntentResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_11_12(OBJC_IVAR___UserIdentifyIntentResponse_code);
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for UserIdentifyIntentResponse()
{
  return objc_opt_self();
}

void UserIdentifyIntentResponse.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)OUTLINED_FUNCTION_11_12(OBJC_IVAR___UserIdentifyIntentResponse_code);
  OUTLINED_FUNCTION_4_19((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_6_15();
}

uint64_t UserIdentifyIntentResponse.__allocating_init(backingStore:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_7_14(v1, sel_initWithBackingStore_);
  OUTLINED_FUNCTION_29_5();
  return v0;
}

void UserIdentifyIntentResponse.init(backingStore:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)OUTLINED_FUNCTION_11_12(OBJC_IVAR___UserIdentifyIntentResponse_code);
  OUTLINED_FUNCTION_4_19((uint64_t)v7.super_class, sel_initWithBackingStore_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_6_15();
}

void UserIdentifyIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v1;

  if (a1)
  {
    sub_2463C05C4();
    OUTLINED_FUNCTION_104();
  }
  v1 = OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_7_14(v1, sel_initWithPropertiesByName_);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_0_1();
}

void UserIdentifyIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR___UserIdentifyIntentResponse_code] = 0;
  if (a1)
  {
    sub_2463C05C4();
    OUTLINED_FUNCTION_104();
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for UserIdentifyIntentResponse();
  v8 = OUTLINED_FUNCTION_4_19((uint64_t)v9.super_class, sel_initWithPropertiesByName_, v2, v3, v4, v5, v6, v7, v9);
  OUTLINED_FUNCTION_29_5();
  if (v1)

  OUTLINED_FUNCTION_2_17();
}

id UserIdentifyIntentResponse.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for UserIdentifyIntentResponse);
}

uint64_t sub_2463BD308@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = UserIdentifyIdentityUnsupportedReason.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2463BD338(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

id static UserIdentifyIdentityResolutionResult.unsupported(forReason:)()
{
  void *ObjCClassFromMetadata;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  return OUTLINED_FUNCTION_7_14(ObjCClassFromMetadata, sel_unsupportedWithReason_);
}

void UserIdentifyIdentityResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = OUTLINED_FUNCTION_3_22();
  v4 = (void *)sub_2463C05C4();
  OUTLINED_FUNCTION_104();
  objc_msgSend(v3, sel_initWithJSONDictionary_forIntent_, v4, a2);

  OUTLINED_FUNCTION_0_1();
}

void UserIdentifyIdentityResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  objc_super v6;

  v4 = (void *)sub_2463C05C4();
  OUTLINED_FUNCTION_104();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for UserIdentifyIdentityResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v4, a2);
  OUTLINED_FUNCTION_29_5();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_2_17();
}

uint64_t type metadata accessor for UserIdentifyIdentityResolutionResult()
{
  return objc_opt_self();
}

id UserIdentifyIdentityResolutionResult.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for UserIdentifyIdentityResolutionResult);
}

id sub_2463BD538(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2463BD56C()
{
  unint64_t result;

  result = qword_257571540;
  if (!qword_257571540)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for UserIdentifyIntentResponseCode, &type metadata for UserIdentifyIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_257571540);
  }
  return result;
}

unint64_t sub_2463BD5AC()
{
  unint64_t result;

  result = qword_257571548;
  if (!qword_257571548)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for UserIdentifyIdentityUnsupportedReason, &type metadata for UserIdentifyIdentityUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_257571548);
  }
  return result;
}

uint64_t sub_2463BD5E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = UserIdentifyIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2463BD610(uint64_t *a1)
{
  return sub_2463BCF0C(*a1);
}

ValueMetadata *type metadata accessor for UserIdentifyIntentResponseCode()
{
  return &type metadata for UserIdentifyIntentResponseCode;
}

ValueMetadata *type metadata accessor for UserIdentifyIdentityUnsupportedReason()
{
  return &type metadata for UserIdentifyIdentityUnsupportedReason;
}

id OUTLINED_FUNCTION_3_22()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

id OUTLINED_FUNCTION_4_19(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v9;

  return objc_msgSendSuper2(&a9, a2, v9);
}

uint64_t OUTLINED_FUNCTION_5_18()
{
  return sub_2463C060C();
}

id OUTLINED_FUNCTION_7_14(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_11_12@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return type metadata accessor for UserIdentifyIntentResponse();
}

uint64_t OUTLINED_FUNCTION_12_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_14()
{
  return sub_2463C060C();
}

uint64_t OUTLINED_FUNCTION_14_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t CaseType.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFDLL)
    return 0;
  return result;
}

uint64_t sub_2463BD6F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = CaseType.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static CaseTypeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2463BD764(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static CaseTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2463BD764(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_2463BD764(uint64_t a1, SEL *a2)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);
}

id CaseTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  void *v3;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v6 = objc_msgSend(v5, sel_initWithJSONDictionary_forIntent_, v3, a2);

  return v6;
}

id CaseTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  objc_super v8;

  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for CaseTypeResolutionResult();
  v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v3, a2);

  v6 = v5;
  if (v6)

  return v6;
}

uint64_t type metadata accessor for CaseTypeResolutionResult()
{
  return objc_opt_self();
}

id CaseTypeResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CaseTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2463BD9A0()
{
  unint64_t result;

  result = qword_2575715C8;
  if (!qword_2575715C8)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for CaseType, &type metadata for CaseType);
    atomic_store(result, (unint64_t *)&qword_2575715C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CaseType()
{
  return &type metadata for CaseType;
}

uint64_t OUTLINED_FUNCTION_0_15()
{
  return swift_bridgeObjectRelease();
}

id static IdentityResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_13();
  v8.super_class = (Class)&OBJC_METACLASS___IdentityResolutionResult;
  v6 = OUTLINED_FUNCTION_4_19((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_17(v6);
}

void static IdentityResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_15();
    swift_bridgeObjectRetain();
    sub_2463C08AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2463C090C();
    OUTLINED_FUNCTION_14_15();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_15();
  v2 = (void *)sub_2463C0678();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___IdentityResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_2_17();
}

unint64_t sub_2463BDB0C()
{
  unint64_t result;

  result = qword_257571620;
  if (!qword_257571620)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257571620);
  }
  return result;
}

id static IdentityResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_13();
  v8.super_class = (Class)&OBJC_METACLASS___IdentityResolutionResult;
  v6 = OUTLINED_FUNCTION_4_19((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_17(v6);
}

uint64_t static Identity.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t Identity.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_15();
  if (v5)
  {
    sub_2463C060C();
    OUTLINED_FUNCTION_8_13();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_10_13();
  if (v3)
  {
    OUTLINED_FUNCTION_13_15();
    OUTLINED_FUNCTION_11_13();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

void *Identity.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_15();
  if (v5)
  {
    sub_2463C060C();
    OUTLINED_FUNCTION_8_13();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_10_13();
  if (v3)
  {
    OUTLINED_FUNCTION_13_15();
    OUTLINED_FUNCTION_11_13();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for Identity();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

uint64_t type metadata accessor for Identity()
{
  return objc_opt_self();
}

uint64_t Identity.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_29_5();
  return v1;
}

void *Identity.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for Identity();
  OUTLINED_FUNCTION_4_19((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_29_5();
  return v0;
}

id Identity.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for Identity);
}

void static IdentityResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_16();
  __break(1u);
}

void static IdentityResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_16();
  __break(1u);
}

void static IdentityResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_16();
  __break(1u);
}

id IdentityResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_3_22();
  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void IdentityResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for IdentityResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_29_5();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_2_17();
}

uint64_t type metadata accessor for IdentityResolutionResult()
{
  return objc_opt_self();
}

id IdentityResolutionResult.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for IdentityResolutionResult);
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return sub_2463C08A0();
}

id OUTLINED_FUNCTION_1_17(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_8_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_13()
{
  return swift_getObjCClassFromMetadata();
}

uint64_t OUTLINED_FUNCTION_10_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_13()
{
  return sub_2463C060C();
}

uint64_t OUTLINED_FUNCTION_13_15()
{
  return sub_2463C060C();
}

unint64_t OUTLINED_FUNCTION_14_15()
{
  return sub_2463BDB0C();
}

id SwitchProfileIntent.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_init);
}

void SwitchProfileIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_3_22();
  SwitchProfileIntentResponse.init(code:userActivity:)(a1, a2);
  OUTLINED_FUNCTION_0_1();
}

uint64_t SwitchProfileAccountUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 6) < 0xFFFFFFFFFFFFFFFBLL)
    return 0;
  return result;
}

id SwitchProfileIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t SwitchProfileIntent.__allocating_init(coder:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_7_14(v1, sel_initWithCoder_);
  OUTLINED_FUNCTION_29_5();
  return v0;
}

void SwitchProfileIntent.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  OUTLINED_FUNCTION_4_19((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_6_15();
}

void SwitchProfileIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2463C060C();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  OUTLINED_FUNCTION_0_1();
}

void SwitchProfileIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  objc_super v6;

  if (a2)
  {
    v5 = (void *)sub_2463C060C();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  objc_msgSendSuper2(&v6, sel_initWithIdentifier_backingStore_, v5, a3);

  OUTLINED_FUNCTION_2_17();
}

uint64_t SwitchProfileIntent.__allocating_init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_13_14();
  OUTLINED_FUNCTION_14_14();
  if (v3)
  {
    v4 = (void *)sub_2463C05C4();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

void *SwitchProfileIntent.init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  OUTLINED_FUNCTION_5_18();
  OUTLINED_FUNCTION_12_12();
  OUTLINED_FUNCTION_13_14();
  OUTLINED_FUNCTION_14_14();
  if (v3)
  {
    v4 = (void *)sub_2463C05C4();
    OUTLINED_FUNCTION_3_5();
  }
  else
  {
    v4 = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SwitchProfileIntent();
  objc_msgSendSuper2(&v6, sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

id SwitchProfileIntent.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for SwitchProfileIntent);
}

unint64_t SwitchProfileIntentResponseCode.init(rawValue:)(unint64_t result)
{
  unint64_t v1;

  if (result - 100 >= 2)
    v1 = 0;
  else
    v1 = result;
  if (result >= 7)
    return v1;
  return result;
}

unint64_t sub_2463BE680@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = SwitchProfileIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t SwitchProfileIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SwitchProfileIntentResponse_code;
  OUTLINED_FUNCTION_11_14();
  return *(_QWORD *)v1;
}

uint64_t sub_2463BE734(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___SwitchProfileIntentResponse_code);
  result = OUTLINED_FUNCTION_11_14();
  *v3 = a1;
  return result;
}

char *SwitchProfileIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SwitchProfileIntentResponse_code];
  OUTLINED_FUNCTION_11_14();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for SwitchProfileIntent()
{
  return objc_opt_self();
}

id SwitchProfileIntentResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_10_14(OBJC_IVAR___SwitchProfileIntentResponse_code);
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SwitchProfileIntentResponse()
{
  return objc_opt_self();
}

void SwitchProfileIntentResponse.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)OUTLINED_FUNCTION_10_14(OBJC_IVAR___SwitchProfileIntentResponse_code);
  OUTLINED_FUNCTION_4_19((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_6_15();
}

uint64_t SwitchProfileIntentResponse.__allocating_init(backingStore:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_7_14(v1, sel_initWithBackingStore_);
  OUTLINED_FUNCTION_29_5();
  return v0;
}

void SwitchProfileIntentResponse.init(backingStore:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)OUTLINED_FUNCTION_10_14(OBJC_IVAR___SwitchProfileIntentResponse_code);
  OUTLINED_FUNCTION_4_19((uint64_t)v7.super_class, sel_initWithBackingStore_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_6_15();
}

void SwitchProfileIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v1;

  if (a1)
  {
    sub_2463C05C4();
    OUTLINED_FUNCTION_104();
  }
  v1 = OUTLINED_FUNCTION_3_22();
  OUTLINED_FUNCTION_7_14(v1, sel_initWithPropertiesByName_);
  OUTLINED_FUNCTION_29_5();
  OUTLINED_FUNCTION_0_1();
}

void SwitchProfileIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR___SwitchProfileIntentResponse_code] = 0;
  if (a1)
  {
    sub_2463C05C4();
    OUTLINED_FUNCTION_104();
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for SwitchProfileIntentResponse();
  v8 = OUTLINED_FUNCTION_4_19((uint64_t)v9.super_class, sel_initWithPropertiesByName_, v2, v3, v4, v5, v6, v7, v9);
  OUTLINED_FUNCTION_29_5();
  if (v1)

  OUTLINED_FUNCTION_2_17();
}

id SwitchProfileIntentResponse.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for SwitchProfileIntentResponse);
}

uint64_t sub_2463BEB38@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = SwitchProfileAccountUnsupportedReason.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static SwitchProfileAccountResolutionResult.unsupported(forReason:)()
{
  void *ObjCClassFromMetadata;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  return OUTLINED_FUNCTION_7_14(ObjCClassFromMetadata, sel_unsupportedWithReason_);
}

void SwitchProfileAccountResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = OUTLINED_FUNCTION_3_22();
  v4 = (void *)sub_2463C05C4();
  OUTLINED_FUNCTION_104();
  objc_msgSend(v3, sel_initWithJSONDictionary_forIntent_, v4, a2);

  OUTLINED_FUNCTION_0_1();
}

void SwitchProfileAccountResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  objc_super v6;

  v4 = (void *)sub_2463C05C4();
  OUTLINED_FUNCTION_104();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SwitchProfileAccountResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v4, a2);
  OUTLINED_FUNCTION_29_5();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_2_17();
}

uint64_t type metadata accessor for SwitchProfileAccountResolutionResult()
{
  return objc_opt_self();
}

id SwitchProfileAccountResolutionResult.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for SwitchProfileAccountResolutionResult);
}

unint64_t sub_2463BED60()
{
  unint64_t result;

  result = qword_257571658;
  if (!qword_257571658)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for SwitchProfileIntentResponseCode, &type metadata for SwitchProfileIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_257571658);
  }
  return result;
}

unint64_t sub_2463BEDA0()
{
  unint64_t result;

  result = qword_257571660;
  if (!qword_257571660)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for SwitchProfileAccountUnsupportedReason, &type metadata for SwitchProfileAccountUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_257571660);
  }
  return result;
}

uint64_t sub_2463BEDDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = SwitchProfileIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2463BEE04(uint64_t *a1)
{
  return sub_2463BE734(*a1);
}

ValueMetadata *type metadata accessor for SwitchProfileIntentResponseCode()
{
  return &type metadata for SwitchProfileIntentResponseCode;
}

ValueMetadata *type metadata accessor for SwitchProfileAccountUnsupportedReason()
{
  return &type metadata for SwitchProfileAccountUnsupportedReason;
}

uint64_t OUTLINED_FUNCTION_10_14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return type metadata accessor for SwitchProfileIntentResponse();
}

uint64_t OUTLINED_FUNCTION_11_14()
{
  return swift_beginAccess();
}

unint64_t SwitchType.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

unint64_t sub_2463BEE74@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = SwitchType.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static SwitchTypeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2463BD764(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static SwitchTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2463BD764(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id SwitchTypeResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  void *v3;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v6 = objc_msgSend(v5, sel_initWithJSONDictionary_forIntent_, v3, a2);

  return v6;
}

id SwitchTypeResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  objc_super v8;

  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for SwitchTypeResolutionResult();
  v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v3, a2);

  v6 = v5;
  if (v6)

  return v6;
}

uint64_t type metadata accessor for SwitchTypeResolutionResult()
{
  return objc_opt_self();
}

id SwitchTypeResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SwitchTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2463BF0E4()
{
  unint64_t result;

  result = qword_2575716E0;
  if (!qword_2575716E0)
  {
    result = MEMORY[0x249559D74](&protocol conformance descriptor for SwitchType, &type metadata for SwitchType);
    atomic_store(result, (unint64_t *)&qword_2575716E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SwitchType()
{
  return &type metadata for SwitchType;
}

id static AccountResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_13();
  v8.super_class = (Class)&OBJC_METACLASS___AccountResolutionResult;
  v6 = OUTLINED_FUNCTION_4_19((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_17(v6);
}

void static AccountResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_15();
    swift_bridgeObjectRetain();
    sub_2463C08AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2463C090C();
    OUTLINED_FUNCTION_14_15();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_15();
  v2 = (void *)sub_2463C0678();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___AccountResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_2_17();
}

id static AccountResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_13();
  v8.super_class = (Class)&OBJC_METACLASS___AccountResolutionResult;
  v6 = OUTLINED_FUNCTION_4_19((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_17(v6);
}

uint64_t static Account.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t Account.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_15();
  if (v5)
  {
    sub_2463C060C();
    OUTLINED_FUNCTION_8_13();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_10_13();
  if (v3)
  {
    OUTLINED_FUNCTION_13_15();
    OUTLINED_FUNCTION_11_13();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

void *Account.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_15();
  if (v5)
  {
    sub_2463C060C();
    OUTLINED_FUNCTION_8_13();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_13();
  OUTLINED_FUNCTION_10_13();
  if (v3)
  {
    OUTLINED_FUNCTION_13_15();
    OUTLINED_FUNCTION_11_13();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for Account();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_29_5();

  return v1;
}

uint64_t type metadata accessor for Account()
{
  return objc_opt_self();
}

uint64_t Account.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_3_22(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_29_5();
  return v1;
}

void *Account.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for Account();
  OUTLINED_FUNCTION_4_19((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_29_5();
  return v0;
}

id Account.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for Account);
}

void static AccountResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_17();
  __break(1u);
}

void static AccountResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_17();
  __break(1u);
}

void static AccountResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_17();
  __break(1u);
}

id AccountResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_3_22();
  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void AccountResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_2463C05C4();
  OUTLINED_FUNCTION_0_15();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for AccountResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_29_5();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_2_17();
}

uint64_t type metadata accessor for AccountResolutionResult()
{
  return objc_opt_self();
}

id AccountResolutionResult.__deallocating_deinit()
{
  return sub_2463BD538(type metadata accessor for AccountResolutionResult);
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return sub_2463C08A0();
}

uint64_t sub_2463BF880()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t sub_2463BF88C()
{
  return MEMORY[0x24BDCCB30]();
}

uint64_t sub_2463BF898()
{
  return MEMORY[0x24BDCCB40]();
}

uint64_t sub_2463BF8A4()
{
  return MEMORY[0x24BDCCBD8]();
}

uint64_t sub_2463BF8B0()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_2463BF8BC()
{
  return MEMORY[0x24BDCCC40]();
}

uint64_t sub_2463BF8C8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2463BF8D4()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2463BF8E0()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2463BF8EC()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2463BF8F8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2463BF904()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2463BF910()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2463BF91C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2463BF928()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2463BF934()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2463BF940()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2463BF94C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2463BF958()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_2463BF964()
{
  return MEMORY[0x24BE95FD0]();
}

uint64_t sub_2463BF970()
{
  return MEMORY[0x24BE95FF0]();
}

uint64_t sub_2463BF97C()
{
  return MEMORY[0x24BE96000]();
}

uint64_t sub_2463BF988()
{
  return MEMORY[0x24BE96008]();
}

uint64_t sub_2463BF994()
{
  return MEMORY[0x24BE96018]();
}

uint64_t sub_2463BF9A0()
{
  return MEMORY[0x24BE96028]();
}

uint64_t sub_2463BF9AC()
{
  return MEMORY[0x24BE96038]();
}

uint64_t sub_2463BF9B8()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_2463BF9C4()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_2463BF9D0()
{
  return MEMORY[0x24BE96200]();
}

uint64_t sub_2463BF9DC()
{
  return MEMORY[0x24BE96210]();
}

uint64_t sub_2463BF9E8()
{
  return MEMORY[0x24BE96220]();
}

uint64_t sub_2463BF9F4()
{
  return MEMORY[0x24BE96230]();
}

uint64_t sub_2463BFA00()
{
  return MEMORY[0x24BE96290]();
}

uint64_t sub_2463BFA0C()
{
  return MEMORY[0x24BE96490]();
}

uint64_t sub_2463BFA18()
{
  return MEMORY[0x24BE96498]();
}

uint64_t sub_2463BFA24()
{
  return MEMORY[0x24BE964A0]();
}

uint64_t sub_2463BFA30()
{
  return MEMORY[0x24BE964B0]();
}

uint64_t sub_2463BFA3C()
{
  return MEMORY[0x24BE964C0]();
}

uint64_t sub_2463BFA48()
{
  return MEMORY[0x24BE964D0]();
}

uint64_t sub_2463BFA54()
{
  return MEMORY[0x24BE964D8]();
}

uint64_t sub_2463BFA60()
{
  return MEMORY[0x24BE96610]();
}

uint64_t sub_2463BFA6C()
{
  return MEMORY[0x24BE96620]();
}

uint64_t sub_2463BFA78()
{
  return MEMORY[0x24BE96630]();
}

uint64_t sub_2463BFA84()
{
  return MEMORY[0x24BE96738]();
}

uint64_t sub_2463BFA90()
{
  return MEMORY[0x24BE968E0]();
}

uint64_t sub_2463BFA9C()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_2463BFAA8()
{
  return MEMORY[0x24BE96A68]();
}

uint64_t sub_2463BFAB4()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_2463BFAC0()
{
  return MEMORY[0x24BE96BA8]();
}

uint64_t sub_2463BFACC()
{
  return MEMORY[0x24BE96BB8]();
}

uint64_t sub_2463BFAD8()
{
  return MEMORY[0x24BE96C00]();
}

uint64_t sub_2463BFAE4()
{
  return MEMORY[0x24BE96C30]();
}

uint64_t sub_2463BFAF0()
{
  return MEMORY[0x24BE96C70]();
}

uint64_t sub_2463BFAFC()
{
  return MEMORY[0x24BE96C78]();
}

uint64_t sub_2463BFB08()
{
  return MEMORY[0x24BE96C90]();
}

uint64_t sub_2463BFB14()
{
  return MEMORY[0x24BE96CA0]();
}

uint64_t sub_2463BFB20()
{
  return MEMORY[0x24BE96CB8]();
}

uint64_t sub_2463BFB2C()
{
  return MEMORY[0x24BE96CD0]();
}

uint64_t sub_2463BFB38()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_2463BFB44()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_2463BFB50()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_2463BFB5C()
{
  return MEMORY[0x24BE96EA8]();
}

uint64_t sub_2463BFB68()
{
  return MEMORY[0x24BE96EB8]();
}

uint64_t sub_2463BFB74()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_2463BFB80()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_2463BFB8C()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_2463BFB98()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_2463BFBA4()
{
  return MEMORY[0x24BE97000]();
}

uint64_t sub_2463BFBB0()
{
  return MEMORY[0x24BE97008]();
}

uint64_t sub_2463BFBBC()
{
  return MEMORY[0x24BE97010]();
}

uint64_t sub_2463BFBC8()
{
  return MEMORY[0x24BE97038]();
}

uint64_t sub_2463BFBD4()
{
  return MEMORY[0x24BE97048]();
}

uint64_t sub_2463BFBE0()
{
  return MEMORY[0x24BE97058]();
}

uint64_t sub_2463BFBEC()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_2463BFBF8()
{
  return MEMORY[0x24BE97238]();
}

uint64_t sub_2463BFC04()
{
  return MEMORY[0x24BE97240]();
}

uint64_t sub_2463BFC10()
{
  return MEMORY[0x24BE97250]();
}

uint64_t sub_2463BFC1C()
{
  return MEMORY[0x24BE97330]();
}

uint64_t sub_2463BFC28()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_2463BFC34()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_2463BFC40()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_2463BFC4C()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_2463BFC58()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_2463BFC64()
{
  return MEMORY[0x24BE975F8]();
}

uint64_t sub_2463BFC70()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_2463BFC7C()
{
  return MEMORY[0x24BE97720]();
}

uint64_t sub_2463BFC88()
{
  return MEMORY[0x24BE97728]();
}

uint64_t sub_2463BFC94()
{
  return MEMORY[0x24BE97730]();
}

uint64_t sub_2463BFCA0()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_2463BFCAC()
{
  return MEMORY[0x24BE97A58]();
}

uint64_t sub_2463BFCB8()
{
  return MEMORY[0x24BE97A78]();
}

uint64_t sub_2463BFCC4()
{
  return MEMORY[0x24BE97A88]();
}

uint64_t sub_2463BFCD0()
{
  return MEMORY[0x24BE97A90]();
}

uint64_t sub_2463BFCDC()
{
  return MEMORY[0x24BE97A98]();
}

uint64_t sub_2463BFCE8()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_2463BFCF4()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_2463BFD00()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_2463BFD0C()
{
  return MEMORY[0x24BE97B30]();
}

uint64_t sub_2463BFD18()
{
  return MEMORY[0x24BE97B40]();
}

uint64_t sub_2463BFD24()
{
  return MEMORY[0x24BE97B48]();
}

uint64_t sub_2463BFD30()
{
  return MEMORY[0x24BE97B50]();
}

uint64_t sub_2463BFD3C()
{
  return MEMORY[0x24BE97B60]();
}

uint64_t sub_2463BFD48()
{
  return MEMORY[0x24BE97B68]();
}

uint64_t sub_2463BFD54()
{
  return MEMORY[0x24BE97B70]();
}

uint64_t sub_2463BFD60()
{
  return MEMORY[0x24BE97B78]();
}

uint64_t sub_2463BFD6C()
{
  return MEMORY[0x24BE97B98]();
}

uint64_t sub_2463BFD78()
{
  return MEMORY[0x24BE97BA0]();
}

uint64_t sub_2463BFD84()
{
  return MEMORY[0x24BE97BA8]();
}

uint64_t sub_2463BFD90()
{
  return MEMORY[0x24BE97C18]();
}

uint64_t sub_2463BFD9C()
{
  return MEMORY[0x24BE97C20]();
}

uint64_t sub_2463BFDA8()
{
  return MEMORY[0x24BE97C88]();
}

uint64_t sub_2463BFDB4()
{
  return MEMORY[0x24BE97CA0]();
}

uint64_t sub_2463BFDC0()
{
  return MEMORY[0x24BE97CB0]();
}

uint64_t sub_2463BFDCC()
{
  return MEMORY[0x24BE97CB8]();
}

uint64_t sub_2463BFDD8()
{
  return MEMORY[0x24BE97D08]();
}

uint64_t sub_2463BFDE4()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_2463BFDF0()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t sub_2463BFDFC()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_2463BFE08()
{
  return MEMORY[0x24BE97D78]();
}

uint64_t sub_2463BFE14()
{
  return MEMORY[0x24BE97DA8]();
}

uint64_t sub_2463BFE20()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_2463BFE2C()
{
  return MEMORY[0x24BE97DD0]();
}

uint64_t sub_2463BFE38()
{
  return MEMORY[0x24BE97DE0]();
}

uint64_t sub_2463BFE44()
{
  return MEMORY[0x24BE97DF0]();
}

uint64_t sub_2463BFE50()
{
  return MEMORY[0x24BE97E08]();
}

uint64_t sub_2463BFE5C()
{
  return MEMORY[0x24BE97E20]();
}

uint64_t sub_2463BFE68()
{
  return MEMORY[0x24BE97E30]();
}

uint64_t sub_2463BFE74()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_2463BFE80()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_2463BFE8C()
{
  return MEMORY[0x24BE97FC0]();
}

uint64_t sub_2463BFE98()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_2463BFEA4()
{
  return MEMORY[0x24BE981B8]();
}

uint64_t sub_2463BFEB0()
{
  return MEMORY[0x24BE983D0]();
}

uint64_t sub_2463BFEBC()
{
  return MEMORY[0x24BE983D8]();
}

uint64_t sub_2463BFEC8()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_2463BFED4()
{
  return MEMORY[0x24BE98428]();
}

uint64_t sub_2463BFEE0()
{
  return MEMORY[0x24BE98440]();
}

uint64_t sub_2463BFEEC()
{
  return MEMORY[0x24BE984A0]();
}

uint64_t sub_2463BFEF8()
{
  return MEMORY[0x24BE984F0]();
}

uint64_t sub_2463BFF04()
{
  return MEMORY[0x24BE98500]();
}

uint64_t sub_2463BFF10()
{
  return MEMORY[0x24BE98508]();
}

uint64_t sub_2463BFF1C()
{
  return MEMORY[0x24BE98510]();
}

uint64_t sub_2463BFF28()
{
  return MEMORY[0x24BE98518]();
}

uint64_t sub_2463BFF34()
{
  return MEMORY[0x24BE98610]();
}

uint64_t sub_2463BFF40()
{
  return MEMORY[0x24BE98698]();
}

uint64_t sub_2463BFF4C()
{
  return MEMORY[0x24BE986B0]();
}

uint64_t sub_2463BFF58()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_2463BFF64()
{
  return MEMORY[0x24BE986D8]();
}

uint64_t sub_2463BFF70()
{
  return MEMORY[0x24BE986E8]();
}

uint64_t sub_2463BFF7C()
{
  return MEMORY[0x24BE98950]();
}

uint64_t sub_2463BFF88()
{
  return MEMORY[0x24BE98958]();
}

uint64_t sub_2463BFF94()
{
  return MEMORY[0x24BE98960]();
}

uint64_t sub_2463BFFA0()
{
  return MEMORY[0x24BE98C90]();
}

uint64_t sub_2463BFFAC()
{
  return MEMORY[0x24BE98CA8]();
}

uint64_t sub_2463BFFB8()
{
  return MEMORY[0x24BE98CB8]();
}

uint64_t sub_2463BFFC4()
{
  return MEMORY[0x24BE98D08]();
}

uint64_t sub_2463BFFD0()
{
  return MEMORY[0x24BE98D18]();
}

uint64_t sub_2463BFFDC()
{
  return MEMORY[0x24BE98D28]();
}

uint64_t sub_2463BFFE8()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_2463BFFF4()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_2463C0000()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_2463C000C()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_2463C0018()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_2463C0024()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_2463C0030()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_2463C003C()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_2463C0048()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_2463C0054()
{
  return MEMORY[0x24BE99078]();
}

uint64_t sub_2463C0060()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_2463C006C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2463C0078()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_2463C0084()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_2463C0090()
{
  return MEMORY[0x24BE9C770]();
}

uint64_t sub_2463C009C()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_2463C00A8()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_2463C00B4()
{
  return MEMORY[0x24BE9CB18]();
}

uint64_t sub_2463C00C0()
{
  return MEMORY[0x24BE9CB20]();
}

uint64_t sub_2463C00CC()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_2463C00D8()
{
  return MEMORY[0x24BE9CCD0]();
}

uint64_t sub_2463C00E4()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_2463C00F0()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_2463C00FC()
{
  return MEMORY[0x24BE9CF00]();
}

uint64_t sub_2463C0108()
{
  return MEMORY[0x24BE9CF08]();
}

uint64_t sub_2463C0114()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_2463C0120()
{
  return MEMORY[0x24BE9E010]();
}

uint64_t sub_2463C012C()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_2463C0138()
{
  return MEMORY[0x24BE9EAF8]();
}

uint64_t sub_2463C0144()
{
  return MEMORY[0x24BE9EB20]();
}

uint64_t sub_2463C0150()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_2463C015C()
{
  return MEMORY[0x24BE9EE58]();
}

uint64_t sub_2463C0168()
{
  return MEMORY[0x24BE9EE60]();
}

uint64_t sub_2463C0174()
{
  return MEMORY[0x24BE9EF18]();
}

uint64_t sub_2463C0180()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_2463C018C()
{
  return MEMORY[0x24BE9F8D0]();
}

uint64_t sub_2463C0198()
{
  return MEMORY[0x24BE9F8D8]();
}

uint64_t sub_2463C01A4()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_2463C01B0()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_2463C01BC()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_2463C01C8()
{
  return MEMORY[0x24BE9FAB0]();
}

uint64_t sub_2463C01D4()
{
  return MEMORY[0x24BE9FAB8]();
}

uint64_t sub_2463C01E0()
{
  return MEMORY[0x24BE9FAC0]();
}

uint64_t sub_2463C01EC()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t sub_2463C01F8()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_2463C0204()
{
  return MEMORY[0x24BE9FF70]();
}

uint64_t sub_2463C0210()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_2463C021C()
{
  return MEMORY[0x24BE9FFD0]();
}

uint64_t sub_2463C0228()
{
  return MEMORY[0x24BEA00A8]();
}

uint64_t sub_2463C0234()
{
  return MEMORY[0x24BEA00B8]();
}

uint64_t sub_2463C0240()
{
  return MEMORY[0x24BEA0168]();
}

uint64_t sub_2463C024C()
{
  return MEMORY[0x24BEA0170]();
}

uint64_t sub_2463C0258()
{
  return MEMORY[0x24BEA0460]();
}

uint64_t sub_2463C0264()
{
  return MEMORY[0x24BEA0478]();
}

uint64_t sub_2463C0270()
{
  return MEMORY[0x24BEA04D8]();
}

uint64_t sub_2463C027C()
{
  return MEMORY[0x24BEA0528]();
}

uint64_t sub_2463C0288()
{
  return MEMORY[0x24BEA0538]();
}

uint64_t sub_2463C0294()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_2463C02A0()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_2463C02AC()
{
  return MEMORY[0x24BEA0EF0]();
}

uint64_t sub_2463C02B8()
{
  return MEMORY[0x24BEA0EF8]();
}

uint64_t sub_2463C02C4()
{
  return MEMORY[0x24BEA0F38]();
}

uint64_t sub_2463C02D0()
{
  return MEMORY[0x24BEA14E0]();
}

uint64_t sub_2463C02DC()
{
  return MEMORY[0x24BEA1508]();
}

uint64_t sub_2463C02E8()
{
  return MEMORY[0x24BEA1510]();
}

uint64_t sub_2463C02F4()
{
  return MEMORY[0x24BEA1CD8]();
}

uint64_t sub_2463C0300()
{
  return MEMORY[0x24BEA2060]();
}

uint64_t sub_2463C030C()
{
  return MEMORY[0x24BEA2268]();
}

uint64_t sub_2463C0318()
{
  return MEMORY[0x24BEA22C8]();
}

uint64_t sub_2463C0324()
{
  return MEMORY[0x24BEA22F8]();
}

uint64_t sub_2463C0330()
{
  return MEMORY[0x24BEA2628]();
}

uint64_t sub_2463C033C()
{
  return MEMORY[0x24BEA2630]();
}

uint64_t sub_2463C0348()
{
  return MEMORY[0x24BEA2638]();
}

uint64_t sub_2463C0354()
{
  return MEMORY[0x24BEA26F8]();
}

uint64_t sub_2463C0360()
{
  return MEMORY[0x24BEA3058]();
}

uint64_t sub_2463C036C()
{
  return MEMORY[0x24BEA3060]();
}

uint64_t sub_2463C0378()
{
  return MEMORY[0x24BEA3650]();
}

uint64_t sub_2463C0384()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_2463C0390()
{
  return MEMORY[0x24BEA3728]();
}

uint64_t sub_2463C039C()
{
  return MEMORY[0x24BEA3750]();
}

uint64_t sub_2463C03A8()
{
  return MEMORY[0x24BEA3800]();
}

uint64_t sub_2463C03B4()
{
  return MEMORY[0x24BE990C0]();
}

uint64_t sub_2463C03C0()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_2463C03CC()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_2463C03D8()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_2463C03E4()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_2463C03F0()
{
  return MEMORY[0x24BEA8A80]();
}

uint64_t sub_2463C03FC()
{
  return MEMORY[0x24BEA8A88]();
}

uint64_t sub_2463C0408()
{
  return MEMORY[0x24BEA8BA8]();
}

uint64_t sub_2463C0414()
{
  return MEMORY[0x24BEA8BB8]();
}

uint64_t sub_2463C0420()
{
  return MEMORY[0x24BE92840]();
}

uint64_t sub_2463C042C()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_2463C0438()
{
  return MEMORY[0x24BE92920]();
}

uint64_t sub_2463C0444()
{
  return MEMORY[0x24BE92938]();
}

uint64_t sub_2463C0450()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_2463C045C()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_2463C0468()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_2463C0474()
{
  return MEMORY[0x24BE90B80]();
}

uint64_t sub_2463C0480()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_2463C048C()
{
  return MEMORY[0x24BE92060]();
}

uint64_t sub_2463C0498()
{
  return MEMORY[0x24BE92068]();
}

uint64_t sub_2463C04A4()
{
  return MEMORY[0x24BE92070]();
}

uint64_t sub_2463C04B0()
{
  return MEMORY[0x24BE92F28]();
}

uint64_t sub_2463C04BC()
{
  return MEMORY[0x24BE92F80]();
}

uint64_t sub_2463C04C8()
{
  return MEMORY[0x24BE92FB8]();
}

uint64_t sub_2463C04D4()
{
  return MEMORY[0x24BE92FC0]();
}

uint64_t sub_2463C04E0()
{
  return MEMORY[0x24BEA90B8]();
}

uint64_t sub_2463C04EC()
{
  return MEMORY[0x24BEA90C8]();
}

uint64_t sub_2463C04F8()
{
  return MEMORY[0x24BEA90D8]();
}

uint64_t sub_2463C0504()
{
  return MEMORY[0x24BEA90E0]();
}

uint64_t sub_2463C0510()
{
  return MEMORY[0x24BEA9108]();
}

uint64_t sub_2463C051C()
{
  return MEMORY[0x24BEA9120]();
}

uint64_t sub_2463C0528()
{
  return MEMORY[0x24BEA9160]();
}

uint64_t sub_2463C0534()
{
  return MEMORY[0x24BEA9170]();
}

uint64_t sub_2463C0540()
{
  return MEMORY[0x24BEA92D0]();
}

uint64_t sub_2463C054C()
{
  return MEMORY[0x24BEA92D8]();
}

uint64_t sub_2463C0558()
{
  return MEMORY[0x24BEA92F0]();
}

uint64_t sub_2463C0564()
{
  return MEMORY[0x24BEA92F8]();
}

uint64_t sub_2463C0570()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_2463C057C()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_2463C0588()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_2463C0594()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2463C05A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2463C05AC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2463C05B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2463C05C4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2463C05D0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2463C05DC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2463C05E8()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2463C05F4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2463C0600()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2463C060C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2463C0618()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2463C0624()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2463C0630()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2463C063C()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_2463C0648()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2463C0654()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2463C0660()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2463C066C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2463C0678()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2463C0684()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2463C0690()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2463C069C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2463C06A8()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2463C06B4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2463C06C0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2463C06CC()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2463C06D8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2463C06E4()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2463C06F0()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2463C06FC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2463C0708()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2463C0714()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2463C0720()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2463C072C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2463C0738()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2463C0744()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2463C0750()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2463C075C()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2463C0768()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2463C0774()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2463C0780()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2463C078C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2463C0798()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2463C07A4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2463C07B0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2463C07BC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2463C07C8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2463C07D4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2463C07E0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2463C07EC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2463C07F8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2463C0804()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2463C0810()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2463C081C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2463C0828()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2463C0834()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2463C0840()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2463C084C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2463C0858()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2463C0864()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2463C0870()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_2463C087C()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_2463C0888()
{
  return MEMORY[0x24BEE2F20]();
}

uint64_t sub_2463C0894()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2463C08A0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2463C08AC()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_2463C08B8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2463C08C4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2463C08D0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2463C08DC()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_2463C08E8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2463C08F4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2463C0900()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2463C090C()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_2463C0918()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2463C0924()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_2463C0930()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2463C093C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2463C0948()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2463C0954()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2463C0960()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2463C096C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2463C0978()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2463C0984()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2463C0990()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t INTypedObjectWithCustomObject()
{
  return MEMORY[0x24BDD9B00]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


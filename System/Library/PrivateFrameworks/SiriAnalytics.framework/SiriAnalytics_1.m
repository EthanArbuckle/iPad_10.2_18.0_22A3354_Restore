uint64_t sub_1A02D90BC()
{
  _QWORD *v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)v0[17];
  sub_1A0307CAC();
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  OUTLINED_FUNCTION_11();
  sub_1A0307838();
  v0[4] = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED07DB80);
  sub_1A0307D54();
  v2 = v0[3];
  OUTLINED_FUNCTION_8_0();
  sub_1A02B9810(v3, v2, v4, v5, 0x2928747365676E69, 0xE800000000000000);

  swift_bridgeObjectRelease();
  v6 = MEMORY[0x1E0DEE9E0];
  v0[19] = 0;
  v0[20] = v6;
  v0[21] = *(_QWORD *)(v0[7] + 112);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E500);
  sub_1A02DAE18(&qword_1EE58E3D8, &qword_1EE58E500);
  OUTLINED_FUNCTION_29_9();
  return swift_task_switch();
}

void sub_1A02D921C(uint64_t a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  _BYTE *v39;
  _QWORD v40[2];
  _BYTE *v41;
  char *v42;
  _QWORD *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;

  v43 = a4;
  v46 = a2;
  v6 = sub_1A03076D0();
  v49 = *(_QWORD *)(v6 - 8);
  v50 = v6;
  MEMORY[0x1E0C80A78](v6);
  v45 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_1A0307724();
  v48 = *(_QWORD *)(v51 - 8);
  v8 = MEMORY[0x1E0C80A78](v51);
  v44 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v47 = (char *)v40 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07DBE0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07AFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for StagedMessage();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  v20 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)v40 - v22;
  sub_1A02D993C(a1, a3, (uint64_t)v16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) != 1)
  {
    sub_1A02CB6F8((uint64_t)v16, (uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);
    v24 = swift_allocObject();
    *(_BYTE *)(v24 + 16) = 0;
    v41 = (_BYTE *)(v24 + 16);
    v25 = dispatch_group_create();
    dispatch_group_enter(v25);
    v26 = sub_1A030794C();
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v26);
    v42 = v23;
    sub_1A02CB318((uint64_t)v23, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);
    v27 = (*(unsigned __int8 *)(v18 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v28 = v44;
    v29 = v45;
    v30 = (v19 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
    v31 = (_QWORD *)swift_allocObject();
    v31[2] = 0;
    v31[3] = 0;
    v32 = v46;
    v31[4] = v24;
    v31[5] = v32;
    sub_1A02CB6F8((uint64_t)v21, (uint64_t)v31 + v27, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);
    *(_QWORD *)((char *)v31 + v30) = v25;
    v40[1] = v24;
    swift_retain();
    swift_retain();
    v33 = v25;
    sub_1A0282DA8((uint64_t)v13, (uint64_t)&unk_1EE58FD08, (uint64_t)v31);
    swift_release();
    sub_1A026F378((uint64_t)v13, &qword_1ED07DBE0);
    sub_1A030770C();
    *v29 = 50;
    v35 = v49;
    v34 = v50;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v49 + 104))(v29, *MEMORY[0x1E0DEF490], v50);
    v36 = v47;
    sub_1A0307718();
    (*(void (**)(_QWORD *, uint64_t))(v35 + 8))(v29, v34);
    v37 = *(void (**)(char *, uint64_t))(v48 + 8);
    v38 = v51;
    v37(v28, v51);
    sub_1A0307A3C();
    v37(v36, v38);
    v39 = v41;
    swift_beginAccess();
    if (*v39 == 1 && (sub_1A03076DC() & 1) == 0)
    {
      sub_1A0267EFC((uint64_t)v42, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);

      if (__OFADD__(*v43, 1))
      {
        __break(1u);
        return;
      }
      ++*v43;
    }
    else
    {
      if (qword_1ED07ADE8 != -1)
        swift_once();
      sub_1A02B97F8(0xD000000000000037, 0x80000001A0310700, 0xD00000000000006BLL, 0x80000001A0310490, 0x2928747365676E69, 0xE800000000000000);

      sub_1A0267EFC((uint64_t)v42, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);
    }
    swift_release();
    return;
  }
  sub_1A026F378((uint64_t)v16, &qword_1ED07AFF0);
  if (qword_1ED07ADE8 != -1)
    swift_once();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_1A0307CAC();
  sub_1A0307838();
  type metadata accessor for StagingPoolEntry();
  sub_1A0307D54();
  sub_1A02B97F8(v52, v53, 0xD00000000000006BLL, 0x80000001A0310490, 0x2928747365676E69, 0xE800000000000000);
  swift_bridgeObjectRelease();
}

uint64_t sub_1A02D97A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  type metadata accessor for StagedMessage();
  v7[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A02D97FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[9];
  v2 = v0[7];
  v0[10] = *(_QWORD *)(v0[6] + 120);
  sub_1A02CB318(v2, v1, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);
  type metadata accessor for MessageStaging();
  sub_1A02DAFF0(&qword_1EE58E658, (void (*)(uint64_t))type metadata accessor for MessageStaging);
  sub_1A0307904();
  return swift_task_switch();
}

uint64_t sub_1A02D9888()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  *(_BYTE *)(v0 + 88) = sub_1A02DB024(v1, *(_QWORD *)(v0 + 80)) & 1;
  sub_1A0267EFC(v1, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1A02D98D8()
{
  uint64_t v0;
  char v1;
  NSObject *v2;
  uint64_t v3;

  v1 = *(_BYTE *)(v0 + 88);
  v2 = *(NSObject **)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  swift_beginAccess();
  *(_BYTE *)(v3 + 16) = v1;
  dispatch_group_leave(v2);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A02D993C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;

  v76 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58F4D0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_6();
  v8 = v7 - v6;
  v9 = type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_6();
  v13 = v12 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_6();
  v17 = v16 - v15;
  v18 = sub_1A0307334();
  v74 = *(_QWORD *)(v18 - 8);
  v75 = v18;
  v19 = MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v19);
  v24 = (char *)&v74 - v23;
  MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v74 - v25;
  v27 = *(id *)(a1 + *(int *)(type metadata accessor for StagingPoolEntry() + 20));
  if (objc_msgSend(v27, sel_anyEventType) != 6)
  {
    sub_1A02AA774(a1, v8);
    if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
    {
      sub_1A026F378(v8, &qword_1EE58F4D0);
      v35 = 0;
    }
    else
    {
      sub_1A02CB6F8(v8, v13, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
      if (a2 && (swift_bridgeObjectRetain(), v36 = sub_1A02DA0CC(v13, a2), OUTLINED_FUNCTION_1_7(), v36))
      {
        sub_1A0274D08(0, (unint64_t *)&qword_1ED07B260);
        v37 = *(_QWORD *)(v13 + *(int *)(v9 + 20));
        OUTLINED_FUNCTION_19_11((uint64_t)v21, v36 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_clockIdentifier, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 16));
        v35 = sub_1A02DBC04(v37);
        if (qword_1ED07ADE8 != -1)
          swift_once();
        v78 = 0;
        v79 = 0xE000000000000000;
        sub_1A0307CAC();
        swift_bridgeObjectRelease();
        v78 = 0x2064656E67696C41;
        v79 = 0xE800000000000000;
        v77 = v37;
        sub_1A0307E20();
        OUTLINED_FUNCTION_30_6();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_19_12();
        sub_1A02DAFF0(&qword_1ED07AF30, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
        OUTLINED_FUNCTION_21_10();
        OUTLINED_FUNCTION_12_15();
        OUTLINED_FUNCTION_4();
        sub_1A0307838();
        OUTLINED_FUNCTION_21_10();
        OUTLINED_FUNCTION_30_6();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_8_0();
        OUTLINED_FUNCTION_15_13();
        sub_1A02B9810(v38, v39, v40, v41, v42, v43);
        swift_release();
      }
      else
      {
        if (qword_1ED07ADE8 != -1)
          swift_once();
        v78 = 0;
        v79 = 0xE000000000000000;
        sub_1A0307CAC();
        swift_bridgeObjectRelease();
        v78 = 0xD000000000000023;
        v79 = 0x80000001A0310460;
        v77 = *(_QWORD *)(v13 + *(int *)(v9 + 20));
        sub_1A0307E20();
        OUTLINED_FUNCTION_12_15();
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_19_12();
        sub_1A02DAFF0(&qword_1ED07AF30, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
        sub_1A0307E20();
        OUTLINED_FUNCTION_12_15();
        OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_8_0();
        OUTLINED_FUNCTION_15_13();
        sub_1A02B9810(v44, v45, v46, v47, v48, v49);
        v35 = 0;
      }
      OUTLINED_FUNCTION_4();
      sub_1A0267EFC(v13, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
    }
    v50 = v76;
    sub_1A0307328();
    v51 = OUTLINED_FUNCTION_4_28();
    *(_QWORD *)(v50 + *(int *)(v51 + 20)) = v35;
    *(_QWORD *)(v50 + *(int *)(v51 + 24)) = v27;
    v52 = v50;
    goto LABEL_20;
  }
  v28 = objc_msgSend(v27, sel_unwrap);
  if (v28)
  {
    v29 = v28;
    objc_opt_self();
    v30 = (void *)swift_dynamicCastObjCClass();
    if (v30)
    {
      v31 = v30;
      v32 = objc_msgSend(v30, sel_metadata);
      if (v32
        && (v33 = v32, v34 = objc_msgSend(v32, sel_eventId), v33, v34))
      {
        sub_1A0307A24();

        if (__swift_getEnumTagSinglePayload(v17, 1, v75) != 1)
        {
          OUTLINED_FUNCTION_19_11((uint64_t)v26, v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 32));
LABEL_24:
          v55 = objc_msgSend(v31, sel_event, v74);
          if (!v55)
          {
            v69 = v74;
            if (qword_1ED07ADE8 != -1)
              swift_once();
            OUTLINED_FUNCTION_11();
            OUTLINED_FUNCTION_8_0();
            OUTLINED_FUNCTION_9_14(v70, v71, v72, v73, (uint64_t)"prepareForStaging(_:allClocks:)");

            OUTLINED_FUNCTION_11_16(*(uint64_t (**)(uint64_t, uint64_t))(v69 + 8));
            v51 = OUTLINED_FUNCTION_4_28();
            v52 = v76;
            v53 = 1;
            return __swift_storeEnumTagSinglePayload(v52, v53, 1, v51);
          }
          v56 = v55;
          v57 = v74;
          OUTLINED_FUNCTION_19_11((uint64_t)v24, (uint64_t)v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 16));
          v58 = objc_msgSend(v31, sel_metadata);
          if (v58
            && (v59 = v58,
                v60 = objc_msgSend(v58, sel_timestamp),
                v59,
                v60))
          {
            sub_1A02DBA84();
            v62 = v61;

            OUTLINED_FUNCTION_11_16(*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8));
          }
          else
          {
            OUTLINED_FUNCTION_11_16(*(uint64_t (**)(uint64_t, uint64_t))(v57 + 8));

            v62 = 0;
          }
          v68 = v76;
          OUTLINED_FUNCTION_19_11(v76, (uint64_t)v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v57 + 32));
          v51 = OUTLINED_FUNCTION_4_28();
          *(_QWORD *)(v68 + *(int *)(v51 + 20)) = v62;
          *(_QWORD *)(v68 + *(int *)(v51 + 24)) = v56;
          v52 = v68;
LABEL_20:
          v53 = 0;
          return __swift_storeEnumTagSinglePayload(v52, v53, 1, v51);
        }
      }
      else
      {
        __swift_storeEnumTagSinglePayload(v17, 1, 1, v75);
      }
      sub_1A0307328();
      sub_1A026F378(v17, &qword_1ED07BC80);
      goto LABEL_24;
    }

  }
  if (qword_1ED07ADE8 != -1)
    swift_once();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_14(v63, v64, v65, v66, (uint64_t)"prepareForStaging(_:allClocks:)");

  v67 = OUTLINED_FUNCTION_4_28();
  return __swift_storeEnumTagSinglePayload(v76, 1, 1, v67);
}

uint64_t sub_1A02DA0CC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
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
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;

  v4 = sub_1A0307334();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for MonotonicTimestamp();
  if ((*(_BYTE *)(a1 + *(int *)(v8 + 24)) & 1) != 0)
  {
    if (qword_1ED07ADE8 != -1)
      swift_once();
    sub_1A02B9810(0xD000000000000036, 0x80000001A0310590, 0xD00000000000006BLL, 0x80000001A0310490, 0x2874694674736562, 0xED0000293A726F66);
    return 0;
  }
  else
  {
    v58 = v8;
    MEMORY[0x1E0C80A78](v8);
    v60 = a1;
    *(&v44 - 2) = a1;
    *((_BYTE *)&v44 - 8) = 1;
    swift_bridgeObjectRetain();
    v61 = a2;
    v10 = sub_1A02D883C((uint64_t (*)(uint64_t *))sub_1A02DAB3C, (uint64_t)(&v44 - 4), a2);
    v56 = 0;
    v62 = v10;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FCC8);
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FCD0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(_QWORD *)(v13 + 72);
    v15 = *(unsigned __int8 *)(v13 + 80);
    v16 = (v15 + 32) & ~v15;
    v55 = v11;
    v52 = v15 | 7;
    v53 = v16 + v14;
    v17 = swift_allocObject();
    v50 = xmmword_1A0314FD0;
    *(_OWORD *)(v17 + 16) = xmmword_1A0314FD0;
    v54 = v16;
    swift_getKeyPath();
    sub_1A0307154();
    v64 = v17;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FCD8);
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FCE0);
    sub_1A02DAE18(&qword_1EE58FCE8, &qword_1EE58FCD8);
    v21 = v20;
    sub_1A02DAE18(&qword_1EE58FCF0, &qword_1EE58FCE0);
    v23 = v22;
    sub_1A02DAE18(&qword_1EE58FCF8, &qword_1EE58FCD0);
    v51 = v18;
    v48 = v21;
    v49 = v19;
    v57 = v12;
    v47 = v24;
    v25 = sub_1A0307874();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26 = v25 >> 62;
    if (v25 >> 62)
    {
      swift_bridgeObjectRetain();
      v27 = sub_1A0307DC0();
      swift_bridgeObjectRelease();
    }
    else
    {
      v27 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v28 = v61;
    if (v27 <= 1)
      goto LABEL_17;
    v45 = v25 >> 62;
    v59 = v25;
    v46 = v23;
    if (qword_1EE58EF80 != -1)
      goto LABEL_35;
    while (1)
    {
      v44 = qword_1EE590398;
      v62 = 0;
      v63 = 0xE000000000000000;
      sub_1A0307CAC();
      swift_bridgeObjectRelease();
      v62 = 0xD000000000000018;
      v63 = 0x80000001A03105D0;
      v64 = MEMORY[0x1E0DEE9D8];
      sub_1A02E315C(0, v27, 0);
      v29 = 0;
      v30 = v64;
      v31 = v59;
      v32 = v59 & 0xC000000000000001;
      do
      {
        if (v32)
        {
          v33 = MEMORY[0x1A1AF70BC](v29, v31);
          (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v33 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_clockIdentifier, v4);
          swift_unknownObjectRelease();
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v31 + 8 * v29 + 32) + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_clockIdentifier, v4);
        }
        v64 = v30;
        v35 = *(_QWORD *)(v30 + 16);
        v34 = *(_QWORD *)(v30 + 24);
        if (v35 >= v34 >> 1)
        {
          sub_1A02E315C(v34 > 1, v35 + 1, 1);
          v31 = v59;
          v30 = v64;
        }
        ++v29;
        *(_QWORD *)(v30 + 16) = v35 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v30+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v35, v7, v4);
      }
      while (v27 != v29);
      MEMORY[0x1A1AF6CC0](v30, v4);
      sub_1A0307838();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1A0307838();
      v64 = *(_QWORD *)(v60 + *(int *)(v58 + 20));
      sub_1A0307E20();
      sub_1A0307838();
      swift_bridgeObjectRelease();
      sub_1A02B97F8(v62, v63, 0xD00000000000006BLL, 0x80000001A0310490, 0x2874694674736562, 0xED0000293A726F66);
      v25 = v59;
      swift_bridgeObjectRelease();
      v28 = v61;
      v26 = v45;
LABEL_17:
      if (v26)
      {
        swift_bridgeObjectRetain();
        v36 = sub_1A0307DC0();
        swift_bridgeObjectRelease();
      }
      else
      {
        v36 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v27 = v60;
      if (!v36)
        break;
      if ((v25 & 0xC000000000000001) != 0)
      {
        v43 = MEMORY[0x1A1AF70BC](0, v25);
        goto LABEL_40;
      }
      if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v9 = *(_QWORD *)(v25 + 32);
LABEL_29:
        swift_retain();
        goto LABEL_30;
      }
      __break(1u);
LABEL_35:
      swift_once();
    }
    v37 = swift_bridgeObjectRelease();
    MEMORY[0x1E0C80A78](v37);
    *(&v44 - 2) = v27;
    *((_BYTE *)&v44 - 8) = 0;
    swift_bridgeObjectRetain();
    v62 = sub_1A02D883C((uint64_t (*)(uint64_t *))sub_1A02DAB3C, (uint64_t)(&v44 - 4), v28);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = v50;
    swift_getKeyPath();
    sub_1A0307154();
    v64 = v38;
    v39 = sub_1A0307874();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v39 >> 62)
    {
      swift_bridgeObjectRetain();
      v9 = sub_1A0307DC0();
      swift_bridgeObjectRelease();
      if (!v9)
        goto LABEL_30;
    }
    else
    {
      v9 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v9)
        goto LABEL_30;
    }
    v40 = __OFSUB__(v9, 1);
    v41 = v9 - 1;
    if (v40)
    {
      __break(1u);
    }
    else
    {
      sub_1A02DAB58(v41, (v39 & 0xC000000000000001) == 0, v39);
      if ((v39 & 0xC000000000000001) == 0)
      {
        v9 = *(_QWORD *)(v39 + 8 * v41 + 32);
        goto LABEL_29;
      }
    }
    v43 = MEMORY[0x1A1AF70BC](v41, v39);
LABEL_40:
    v9 = v43;
LABEL_30:
    swift_bridgeObjectRelease();
  }
  return v9;
}

void sub_1A02DA84C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  v0 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_25(v0);
  swift_defaultActor_destroy();
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A02DA890()
{
  sub_1A02DA84C();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1A02DA8A8()
{
  return type metadata accessor for ExternalDataIngestion();
}

uint64_t type metadata accessor for ExternalDataIngestion()
{
  uint64_t result;

  result = qword_1EE58E340;
  if (!qword_1EE58E340)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A02DA8E8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A030725C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

BOOL sub_1A02DA970(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;
  unsigned __int8 v18;

  v4 = type metadata accessor for MonotonicTimestamp();
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_6();
  v8 = v7 - v6;
  if ((sub_1A0307310() & 1) == 0)
    return 0;
  if ((a2 & 1) != 0)
  {
    sub_1A02DAA98((uint64_t)&v16);
    v9 = v16;
    v10 = v17;
    v11 = v18;
    sub_1A02CB318(a1, v8, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
    if (v11)
    {
      sub_1A0267EFC(v8, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
      return 0;
    }
    v14 = *(_QWORD *)(v8 + *(int *)(v4 + 20));
    sub_1A0267EFC(v8, (uint64_t (*)(_QWORD))type metadata accessor for MonotonicTimestamp);
    return v14 >= v9 && v10 >= v14;
  }
  sub_1A02DAAE0((uint64_t)&v16);
  v13 = *(_QWORD *)(a1 + *(int *)(v4 + 20));
  if (!v18)
    return v13 >= v16 && v17 >= v13;
  if (v18 == 1)
    return v13 >= v16;
  else
    return v16 >= v13;
}

uint64_t sub_1A02DAA98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  char v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_startedOn);
  result = sub_1A02C81CC();
  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = result;
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  return result;
}

uint64_t sub_1A02DAAE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  char v4;
  unint64_t v5;

  result = sub_1A02C81CC();
  if ((v4 & 1) == 0)
  {
    v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_startedOn);
LABEL_4:
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = result;
    *(_BYTE *)(a1 + 16) = 0;
    return result;
  }
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13SiriAnalytics18LogicalClockRecord_startedOn);
  result = v5 + 300000000000;
  if (v5 < 0xFFFFFFBA269B4800)
    goto LABEL_4;
  __break(1u);
  return result;
}

BOOL sub_1A02DAB3C()
{
  return sub_1A02DAB7C();
}

unint64_t sub_1A02DAB58(unint64_t result, char a2, uint64_t a3)
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

BOOL sub_1A02DAB7C()
{
  uint64_t v0;

  return sub_1A02DA970(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_1A02DABB4(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[6];

  swift_defaultActor_initialize();
  *(_QWORD *)(a2 + 112) = 0;
  if (qword_1EE58E3F0 != -1)
    swift_once();
  sub_1A02B9810(0x292874696E69, 0xE600000000000000, 0xD00000000000007ELL, 0x80000001A030CDC0, 0x736F682874696E69, 0xEB00000000293A74);
  sub_1A0274D08(0, (unint64_t *)&unk_1EE58E448);
  v4 = sub_1A02D8440();
  v5 = *(void **)(a2 + 112);
  *(_QWORD *)(a2 + 112) = v4;
  v6 = v4;

  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_1EE59FF30);
  sub_1A0288C94((uint64_t)v8);
  objc_msgSend(v6, sel_setRemoteObjectInterface_, v8);
  v9 = objc_msgSend(v7, sel_interfaceWithProtocol_, &unk_1EE599720);
  objc_msgSend(v6, sel_setExportedInterface_, v9);

  objc_msgSend(v6, sel_setExportedObject_, a1);
  v10 = swift_allocObject();
  swift_weakInit();
  v13[4] = sub_1A02DB43C;
  v13[5] = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1A02A255C;
  v13[3] = &block_descriptor_13;
  v11 = _Block_copy(v13);
  swift_release();
  objc_msgSend(v6, sel_setInvalidationHandler_, v11);
  _Block_release(v11);
  objc_msgSend(v6, sel_resume);

  return a2;
}

void sub_1A02DAE18(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_28_10();
  }
  OUTLINED_FUNCTION_7();
}

void sub_1A02DAE4C(uint64_t a1)
{
  uint64_t v1;

  sub_1A02D921C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD **)(v1 + 32));
}

uint64_t sub_1A02DAE58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1A02AACD0(a1, a2, a3, a4, *(uint64_t (**)(uint64_t))(v4 + 16));
}

uint64_t sub_1A02DAE70()
{
  return swift_deallocObject();
}

uint64_t sub_1A02DAE80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_4_28();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v5 = v0 + v3;
  v6 = sub_1A0307334();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  return swift_deallocObject();
}

uint64_t sub_1A02DAF3C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(OUTLINED_FUNCTION_4_28() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = v1[5];
  v10 = (uint64_t)v1 + v5;
  v11 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_1A0276CBC;
  return sub_1A02D97A0(a1, v6, v7, v8, v9, v10, v11);
}

void sub_1A02DAFF0(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_28_10();
  }
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A02DB024(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = sub_1A02DB180(a1);
  objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC13SiriAnalytics14MessageStaging_internalTelemetry), sel_trackMessageStagedWithSuccess_, v3 & 1);
  if ((v3 & 1) == 0)
  {
    if (qword_1ED07B1A0 != -1)
      swift_once();
    sub_1A0307CAC();
    swift_bridgeObjectRelease();
    sub_1A0307838();
    swift_bridgeObjectRelease();
    sub_1A02B97F8(0xD000000000000027, 0x80000001A030E510, 0xD000000000000066, 0x80000001A030AEE0, 0xD000000000000010, 0x80000001A030E540);
    swift_bridgeObjectRelease();
  }
  return v3 & 1;
}

uint64_t sub_1A02DB180(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  char v17;
  char v18;
  uint64_t v19;
  _QWORD v21[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED07B0A0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for StagedMessagesTable.Record(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for StagedMessage();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A02CB318(a1, (uint64_t)v10, v11);
  sub_1A0266380(0);
  if (!v12)
    goto LABEL_9;
  sub_1A02DBE90((uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    swift_release();
    sub_1A026F378((uint64_t)v4, (uint64_t *)&unk_1ED07B0A0);
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  sub_1A02CB6F8((uint64_t)v4, (uint64_t)v7, type metadata accessor for StagedMessagesTable.Record);
  v13 = sub_1A02BD6A8();
  v21[1] = 0x6D5F646567617473;
  v21[2] = 0xEF73656761737365;
  v21[4] = 0;
  v21[5] = 0;
  v21[3] = v13;
  v14 = sub_1A02E9364();
  sub_1A02E78A0(v14, v15, v16);
  v18 = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    if (qword_1ED07B1A0 != -1)
      swift_once();
    sub_1A02B97F8(0xD000000000000018, 0x80000001A030E560, 0xD000000000000066, 0x80000001A030AEE0, 0xD000000000000011, 0x80000001A030E580);
    swift_release();
    sub_1A0267EFC((uint64_t)v7, type metadata accessor for StagedMessagesTable.Record);
    goto LABEL_9;
  }
  sub_1A0267EFC((uint64_t)v7, type metadata accessor for StagedMessagesTable.Record);
  swift_release();
  v19 = 1;
LABEL_10:
  sub_1A0267EFC((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for StagedMessage);
  return v19;
}

uint64_t sub_1A02DB418()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A02DB43C()
{
  return sub_1A0288E6C();
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

uint64_t sub_1A02DB45C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58ED68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_4_28()
{
  return type metadata accessor for StagedMessage();
}

void OUTLINED_FUNCTION_8_14()
{
  sub_1A02E3128();
}

void OUTLINED_FUNCTION_9_14(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_1A02B97F8(a1, a2, a3, a4, 0xD00000000000001FLL, (a5 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_11_16@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_12_15()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_19_12()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_21_10()
{
  return sub_1A0307E20();
}

uint64_t OUTLINED_FUNCTION_24_11()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_28_10()
{
  JUMPOUT(0x1A1AF7D34);
}

uint64_t OUTLINED_FUNCTION_29_9()
{
  return sub_1A0307904();
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  return sub_1A0307838();
}

void sub_1A02DB570(uint64_t a1@<X8>)
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_6();
  v6 = v5 - v4;
  v7 = OUTLINED_FUNCTION_9();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v34 - v12;
  v14 = OUTLINED_FUNCTION_48_2();
  if (*(_QWORD *)(v1 + *(int *)(v14 + 32)) != 1)
  {
    if (qword_1ED07B1A0 != -1)
      swift_once();
    OUTLINED_FUNCTION_13_18();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_0_38(v23, v24, 0xD00000000000006DLL, 0x80000001A0310790);
    v25 = OUTLINED_FUNCTION_4_28();
    v26 = a1;
    goto LABEL_13;
  }
  v15 = v14;
  v35 = a1;
  v16 = (uint64_t *)(v1 + *(int *)(v14 + 28));
  v17 = *v16;
  v18 = v16[1];
  objc_allocWithZone(MEMORY[0x1E0D9A3C8]);
  sub_1A02652C0(v17, v18);
  v19 = sub_1A026D47C(v17, v18);
  if (!v19)
  {
    if (qword_1ED07B1A0 != -1)
      swift_once();
    OUTLINED_FUNCTION_13_18();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_0_38(v27, v28, 0xD00000000000006DLL, 0x80000001A0310790);
    v25 = OUTLINED_FUNCTION_4_28();
    v26 = v35;
LABEL_13:
    OUTLINED_FUNCTION_2_35(v26, 1, 1, v25);
    return;
  }
  v20 = v19;
  v21 = v2 + *(int *)(v15 + 24);
  if ((*(_BYTE *)(v21 + 8) & 1) == 0)
  {
    v22 = *(_QWORD *)v21;
    sub_1A027AFF0(v2, v6);
    if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
    {
      sub_1A02C6A2C(v6, &qword_1ED07BC80);
    }
    else
    {
      OUTLINED_FUNCTION_71_3((uint64_t)v13, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
      sub_1A02DC0D0();
      OUTLINED_FUNCTION_71_3((uint64_t)v11, (uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
      sub_1A02DBC04(v22);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
  }
  v29 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v30 = v35;
  OUTLINED_FUNCTION_71_3(v35, v2 + *(int *)(v15 + 20), v29);
  v31 = OUTLINED_FUNCTION_4_28();
  OUTLINED_FUNCTION_17_10(v31);
  *(_QWORD *)(v30 + v32) = v20;
  __swift_storeEnumTagSinglePayload(v30, 0, 1, v33);
  OUTLINED_FUNCTION_18();
}

void sub_1A02DB83C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v2);
  v3 = OUTLINED_FUNCTION_2_24();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_6();
  v5 = OUTLINED_FUNCTION_4_28();
  v6 = *(void **)(v0 + *(int *)(v5 + 20));
  if (v6)
  {
    v7 = *(void **)(v0 + *(int *)(v5 + 24));
    v8 = v6;
    if (objc_msgSend(v7, sel_unwrap))
    {
      v9 = objc_msgSend(v8, sel_clockIdentifier);
      sub_1A030731C();

      objc_msgSend(v8, sel_nanoSecondsSinceBoot);
      v10 = objc_allocWithZone((Class)sub_1A03074D8());
      sub_1A03074C0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v0, v3);
      __swift_storeEnumTagSinglePayload(v1, 0, 1, v3);
      v11 = objc_allocWithZone((Class)sub_1A030749C());
      sub_1A0307454();

    }
    else
    {
      if (qword_1ED07B1A0 != -1)
        swift_once();
      OUTLINED_FUNCTION_13_18();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_0_38(v14, v15, 0xD00000000000006DLL, 0x80000001A0310790);

    }
  }
  else
  {
    if (qword_1ED07B1A0 != -1)
      swift_once();
    OUTLINED_FUNCTION_13_18();
    OUTLINED_FUNCTION_11();
    sub_1A02B9804(v12, v13, 0xD00000000000006DLL, 0x80000001A0310790, 0x292870616DLL, 0xE500000000000000);
  }
  OUTLINED_FUNCTION_56_3();
}

void sub_1A02DBA84()
{
  void *v0;
  void *v1;
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
  char *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OUTLINED_FUNCTION_9();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v16 - v11;
  v13 = OUTLINED_FUNCTION_109(v10, sel_clockIdentifier);
  if (!v13)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
    goto LABEL_5;
  }
  v14 = v13;
  sub_1A0307A24();

  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
LABEL_5:
    sub_1A02C6A2C((uint64_t)v4, &qword_1ED07BC80);
    goto LABEL_6;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v12, v4, v5);
  sub_1A02DC0D0();
  v15 = objc_msgSend(v1, sel_timestampInNanoseconds);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, v5);
  sub_1A02DBC04((uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
LABEL_6:
  OUTLINED_FUNCTION_56_3();
}

id sub_1A02DBC04(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_1A0307304();
  v4 = objc_msgSend(v2, sel_initWithNanosecondsSinceBoot_clockIdentifier_, a1, v3);

  v5 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_25(v5);
  return v4;
}

uint64_t sub_1A02DBC74@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07AFF0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OUTLINED_FUNCTION_4_28();
  OUTLINED_FUNCTION_5();
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A02DBD64(v7, (uint64_t)v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_1A02C6A2C((uint64_t)v4, &qword_1ED07AFF0);
    v10 = OUTLINED_FUNCTION_48_2();
    return OUTLINED_FUNCTION_48_0(a1, v11, v12, v10);
  }
  else
  {
    sub_1A0267E04((uint64_t)v4, (uint64_t)v9);
    sub_1A02DBE90(a1);
    return sub_1A02DC10C((uint64_t)v9);
  }
}

uint64_t sub_1A02DBD64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v3 = OUTLINED_FUNCTION_109(a1, sel_underlyingMessage);
  v4 = objc_msgSend(v3, sel_wrapAsAnyEvent);

  if (v4)
  {
    v6 = OUTLINED_FUNCTION_109(v5, sel_messageUUID);
    sub_1A030731C();

    v8 = OUTLINED_FUNCTION_109(v7, sel_logicalTimestamp);
    v9 = OUTLINED_FUNCTION_4_28();
    OUTLINED_FUNCTION_17_10(v9);
    *(_QWORD *)(a2 + v11) = v4;
    v12 = a2;
    v13 = 0;
  }
  else
  {
    if (qword_1ED07B1A0 != -1)
      swift_once();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_0_38(0xD000000000000020, v14, v15, 0x80000001A0310790);
    v10 = OUTLINED_FUNCTION_4_28();
    v12 = a2;
    v13 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v12, v13, 1, v10);
}

void sub_1A02DBE90(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07AF20);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_6();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v8);
  v9 = OUTLINED_FUNCTION_2_24();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = OUTLINED_FUNCTION_4_28();
  v14 = objc_msgSend(*(id *)(v1 + *(int *)(v13 + 24)), sel_data);
  if (v14)
  {
    v15 = v14;
    v28 = a1;
    sub_1A030728C();

    v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v1, v9);
    if (*(_QWORD *)(v1 + *(int *)(v13 + 20)))
    {
      v17 = OUTLINED_FUNCTION_109(v16, sel_clockIdentifier);
      sub_1A030731C();

      v18 = OUTLINED_FUNCTION_13_14(v2, 0);
      OUTLINED_FUNCTION_109(v18, sel_nanoSecondsSinceBoot);
    }
    else
    {
      OUTLINED_FUNCTION_13_14(v2, 1);
    }
    v22 = sub_1A03072D4();
    OUTLINED_FUNCTION_48_0(v7, v23, v24, v22);
    v25 = v28;
    sub_1A02BCD68();
    v26 = OUTLINED_FUNCTION_48_2();
    __swift_storeEnumTagSinglePayload(v25, 0, 1, v26);
    OUTLINED_FUNCTION_18();
  }
  else
  {
    if (qword_1ED07B1A0 != -1)
      swift_once();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_0_38(0xD00000000000001CLL, v19, v20, 0x80000001A0310790);
    v21 = OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_2_35(a1, 1, 1, v21);
  }
}

unint64_t sub_1A02DC0D0()
{
  unint64_t result;

  result = qword_1ED07B260;
  if (!qword_1ED07B260)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED07B260);
  }
  return result;
}

uint64_t sub_1A02DC10C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StagedMessage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_0_38(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A02B97F8(a1, a2, a3, a4, 0x292870616DLL, 0xE500000000000000);
}

uint64_t OUTLINED_FUNCTION_2_35(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_17_10(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + *(int *)(result + 20)) = v2;
  return result;
}

uint64_t sub_1A02DC194(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  return sub_1A02DF7F4(0xD000000000000024, 0x80000001A0310900, a1, (uint64_t)sub_1A02DC528, (uint64_t)v6);
}

uint64_t sub_1A02DC214(int a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 aBlock;
  uint64_t (*v25)(uint64_t);
  ValueMetadata *v26;
  uint64_t (*v27)();
  uint64_t v28;
  __int128 v29[2];
  _BYTE v30[40];
  _BYTE v31[32];
  uint64_t v32;

  v21 = a4;
  v22 = a3;
  v8 = sub_1A03076E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A0307700();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = 0;
  memset(v31, 0, sizeof(v31));
  if ((a2 & 1) != 0)
  {
    v16 = MKBGetDeviceLockState();
    v26 = &type metadata for EmbeddedDeviceLockState;
    v27 = (uint64_t (*)())&off_1E4352228;
    LODWORD(aBlock) = v16;
  }
  else
  {
    v26 = &type metadata for EmbeddedDeviceLockState;
    v27 = (uint64_t (*)())&off_1E4352228;
    LODWORD(aBlock) = a1;
  }
  sub_1A02DC538((uint64_t)v31);
  sub_1A02DC578((uint64_t)&aBlock, (uint64_t)v31);
  sub_1A02DC5C0((uint64_t)v31, (uint64_t)&aBlock);
  if (v26)
  {
    sub_1A027106C(&aBlock, (uint64_t)v30);
    sub_1A027621C((uint64_t)v30, (uint64_t)v29);
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v21;
    *(_QWORD *)(v17 + 24) = a5;
    sub_1A027106C(v29, v17 + 32);
    v27 = sub_1A02DC634;
    v28 = v17;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v25 = sub_1A02A255C;
    v26 = (ValueMetadata *)&block_descriptor_14;
    v18 = _Block_copy(&aBlock);
    swift_retain();
    sub_1A03076F4();
    v23 = MEMORY[0x1E0DEE9D8];
    sub_1A02B10F4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07D490);
    sub_1A02A2B90();
    sub_1A0307BF8();
    MEMORY[0x1A1AF6E70](0, v15, v11, v18);
    _Block_release(v18);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
    sub_1A02DC538((uint64_t)v31);
    return swift_release();
  }
  else
  {
    sub_1A02DC538((uint64_t)v31);
    return sub_1A02DC538((uint64_t)&aBlock);
  }
}

uint64_t sub_1A02DC4C0()
{
  sub_1A02DFAA8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceLockStateNotificationObserver()
{
  return objc_opt_self();
}

uint64_t sub_1A02DC4FC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A02DC528(int a1, char a2)
{
  uint64_t *v2;

  return sub_1A02DC214(a1, a2 & 1, v2[2], v2[3], v2[4]);
}

uint64_t sub_1A02DC538(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FD10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A02DC578(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FD10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A02DC5C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FD10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A02DC608()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_1A02DC634()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(v0 + 16))(v0 + 32);
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

void sub_1A02DC674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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
  char *v20;
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
  char *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int EnumTagSinglePayload;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  void (*v66)(uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  char v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
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
  char *v95;
  uint64_t v96;
  __int128 v97[2];
  uint64_t v98;
  _QWORD v99[5];
  _QWORD v100[16];
  uint64_t v101;
  uint64_t v102;

  OUTLINED_FUNCTION_4_3();
  v101 = v1;
  v102 = v2;
  v87 = v3;
  v5 = v4;
  v86 = v6;
  v8 = v7;
  v89 = sub_1A03072D4();
  v91 = *(_QWORD *)(v89 - 8);
  MEMORY[0x1E0C80A78](v89);
  OUTLINED_FUNCTION_17_1();
  v92 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07AF20);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_5_2();
  v88 = v11;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v80 - v13;
  v94 = type metadata accessor for TagsTable.Record(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_17_1();
  v90 = v16;
  v17 = OUTLINED_FUNCTION_9();
  v96 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v18);
  v23 = (char *)&v80 - v22;
  MEMORY[0x1E0C80A78](v21);
  v95 = (char *)&v80 - v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_5_2();
  v93 = v26;
  v28 = MEMORY[0x1E0C80A78](v27);
  v30 = (char *)&v80 - v29;
  MEMORY[0x1E0C80A78](v28);
  v32 = (char *)&v80 - v31;
  if ((sub_1A0283924(0) & 1) == 0 || (v33 = *(_QWORD *)(v0 + OBJC_IVAR___SiriAnalyticsMetastore_db)) == 0)
  {
    __swift_storeEnumTagSinglePayload(v8, 1, 1, v17);
    return;
  }
  swift_retain();
  sub_1A02DE9BC();
  sub_1A027621C((uint64_t)v5, (uint64_t)v100);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE58E690);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58EDF8);
  if (!swift_dynamicCast())
  {
    v98 = 0;
    memset(v97, 0, sizeof(v97));
    swift_release();
    sub_1A026F378((uint64_t)v32, &qword_1ED07BC80);
    sub_1A026F378((uint64_t)v97, &qword_1EE58EE00);
    v36 = v8;
    goto LABEL_8;
  }
  v82 = v33;
  v84 = v32;
  v85 = v17;
  v83 = v8;
  sub_1A027106C(v97, (uint64_t)v99);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  swift_getDynamicType();
  OUTLINED_FUNCTION_11_17();
  v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D82B98]), sel_init);
  if (v34)
  {
    v35 = v34;
    __swift_project_boxed_opaque_existential_1(v99, v99[3]);
    sub_1A0307658();
    v40 = sub_1A02EF288(v35);
    v17 = v85;
    if (v41 >> 60 != 15)
    {
      v42 = v40;
      v43 = v41;

      if ((sub_1A0295FDC(v42, v43) & 1) == 0)
      {
        v81 = v43;
        sub_1A02812F0(v86, (uint64_t)v30, &qword_1ED07BC80);
        EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v30, 1, v17);
        v80 = v42;
        v50 = (uint64_t)v95;
        if (EnumTagSinglePayload == 1)
        {
          sub_1A0307328();
          sub_1A026F378((uint64_t)v30, &qword_1ED07BC80);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v95, v30, v17);
        }
        OUTLINED_FUNCTION_23_10((uint64_t)v23, v87);
        __swift_project_boxed_opaque_existential_1(v5, v5[3]);
        swift_getDynamicType();
        OUTLINED_FUNCTION_11_17();
        v51 = LOBYTE(v100[0]);
        OUTLINED_FUNCTION_23_10((uint64_t)v20, v50);
        v52 = OUTLINED_FUNCTION_8_15();
        v53 = v89;
        __swift_storeEnumTagSinglePayload(v52, v54, v55, v89);
        sub_1A02812F0((uint64_t)v84, v93, &qword_1ED07BC80);
        v56 = v90;
        OUTLINED_FUNCTION_23_10(v90, (uint64_t)v23);
        v57 = v94;
        *(_DWORD *)(v56 + *(int *)(v94 + 20)) = v51;
        OUTLINED_FUNCTION_23_10(v56 + *(int *)(v57 + 24), (uint64_t)v20);
        v58 = (_QWORD *)(v56 + *(int *)(v57 + 28));
        v59 = v80;
        v60 = v81;
        *v58 = v80;
        v58[1] = v60;
        v61 = v88;
        sub_1A02812F0((uint64_t)v14, v88, &qword_1ED07AF20);
        v62 = __swift_getEnumTagSinglePayload(v61, 1, v53);
        sub_1A02D5430(v59, v60);
        v63 = v96;
        if (v62 == 1)
        {
          v64 = v92;
          sub_1A03072C8();
          sub_1A026F378((uint64_t)v14, &qword_1ED07AF20);
          v65 = *(void (**)(char *, uint64_t))(v63 + 8);
          OUTLINED_FUNCTION_18_10((uint64_t)v20);
          OUTLINED_FUNCTION_18_10((uint64_t)v23);
          sub_1A026F378(v61, &qword_1ED07AF20);
          v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 32);
        }
        else
        {
          sub_1A026F378((uint64_t)v14, &qword_1ED07AF20);
          v65 = *(void (**)(char *, uint64_t))(v63 + 8);
          OUTLINED_FUNCTION_18_10((uint64_t)v20);
          OUTLINED_FUNCTION_18_10((uint64_t)v23);
          v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 32);
          v64 = v92;
          v66(v92, v61, v53);
        }
        v67 = v94;
        v66(v56 + *(int *)(v94 + 32), v64, v53);
        sub_1A02812C4(v93, v56 + *(int *)(v67 + 36), &qword_1ED07BC80);
        v68 = sub_1A02D3CB4();
        v69 = v81;
        if (qword_1ED07B1F8 != -1)
          swift_once();
        v70 = qword_1ED07DFA8;
        v71 = swift_bridgeObjectRetain();
        v72 = ((uint64_t (*)(uint64_t))sub_1A02B1964)(v71);
        v100[0] = 1936154996;
        v100[1] = 0xE400000000000000;
        v100[2] = v68;
        v100[3] = v70;
        v100[4] = v72;
        v73 = sub_1A02E9364();
        sub_1A02E78A0(v73, v74, v75);
        v77 = v76;
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1A026CF1C(v80, v69);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_2_8();
        OUTLINED_FUNCTION_3_0();
        sub_1A0267EFC(v56, type metadata accessor for TagsTable.Record);
        v78 = OUTLINED_FUNCTION_28_11();
        OUTLINED_FUNCTION_35_7(v78, &qword_1ED07BC80);
        if ((v77 & 1) != 0)
        {
          (*(void (**)(uint64_t, char *, uint64_t))(v96 + 32))(v83, v95, v85);
          v36 = OUTLINED_FUNCTION_31_9();
        }
        else
        {
          v79 = v85;
          v65(v95, v85);
          v36 = OUTLINED_FUNCTION_34_9();
          v39 = v79;
        }
        goto LABEL_9;
      }
      v44 = v42;
      v45 = (uint64_t)v84;
      if (qword_1ED07B1B8 != -1)
        swift_once();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_8_0();
      sub_1A02B97F8(0xD00000000000001DLL, v46, v47, v48, 0xD00000000000001DLL, 0x80000001A03109C0);
      OUTLINED_FUNCTION_36_9();
      sub_1A026CF1C(v44, v43);
      OUTLINED_FUNCTION_28_11();
      sub_1A026F378(v45, &qword_1ED07BC80);
      v36 = v83;
LABEL_8:
      v37 = 1;
      v38 = 1;
      v39 = v17;
LABEL_9:
      __swift_storeEnumTagSinglePayload(v36, v37, v38, v39);
      OUTLINED_FUNCTION_18();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1A02DCF38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  OUTLINED_FUNCTION_4_3();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v27);
  OUTLINED_FUNCTION_14_16();
  MEMORY[0x1E0C80A78](v28);
  v30 = (char *)&a9 - v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B210);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_54_4();
  v32 = *v24;
  v33 = v32 == 2;
  v34 = OUTLINED_FUNCTION_9();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v30, v26, v34);
  OUTLINED_FUNCTION_90_1((uint64_t)v30, 0);
  v35 = OUTLINED_FUNCTION_8_15();
  __swift_storeEnumTagSinglePayload(v35, v36, v37, v34);
  v38 = v32 & 1;
  v39 = OUTLINED_FUNCTION_22_8();
  v40 = v20 + *(int *)(v39 + 40);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07ACE0);
  __swift_storeEnumTagSinglePayload(v40, 1, 1, v41);
  OUTLINED_FUNCTION_90_1(v20 + *(int *)(v39 + 44), 1);
  sub_1A02812C4((uint64_t)v30, v20, &qword_1ED07BC80);
  v42 = OUTLINED_FUNCTION_25_11();
  sub_1A02812C4(v42, v43, &qword_1ED07BC80);
  OUTLINED_FUNCTION_40_7();
  *(_DWORD *)v44 = v38;
  *(_BYTE *)(v44 + 4) = v33;
  OUTLINED_FUNCTION_17_11();
  v45 = sub_1A02DF278();
  sub_1A026F378(v20, &qword_1ED07B210);
  if (v45)
  {
    sub_1A02DE744(v45);
    OUTLINED_FUNCTION_1_7();
  }
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1A02DD0A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  unint64_t v19;
  uint64_t result;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t);
  char *v31;
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
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char v53;
  unint64_t v54;
  BOOL v55;
  uint64_t v56;
  _QWORD v57[3];
  char *v58;
  uint64_t v59;
  uint64_t v60;
  int64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
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
  unint64_t v81;
  uint64_t v82;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B030);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for IdentifiableTag();
  v74 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x1E0C80A78](v5);
  v76 = (uint64_t)v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v73 = (uint64_t)v57 - v8;
  v9 = type metadata accessor for TagsTable.Record(0);
  v59 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FD18);
  v12 = MEMORY[0x1E0C80A78](v63);
  v14 = (char *)v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v71 = (uint64_t)v57 - v16;
  MEMORY[0x1E0C80A78](v15);
  v62 = (char *)v57 - v17;
  v18 = MEMORY[0x1E0DEE9E0];
  v82 = MEMORY[0x1E0DEE9E0];
  sub_1A02CFAC4(a1);
  v64 = v77;
  v60 = v78;
  v66 = v80;
  v19 = v81;
  v57[1] = v79;
  v61 = (unint64_t)(v79 + 64) >> 6;
  result = swift_bridgeObjectRetain();
  v75 = v5;
  v58 = v14;
  if (!v19)
    goto LABEL_3;
LABEL_2:
  v68 = (v19 - 1) & v19;
  v21 = __clz(__rbit64(v19)) | (v66 << 6);
  while (1)
  {
    v26 = v64;
    v27 = *(_QWORD *)(v64 + 48);
    v28 = sub_1A0307334();
    v29 = *(_QWORD *)(v28 - 8);
    v67 = *(_QWORD *)(v29 + 72);
    v70 = v29;
    v30 = *(void (**)(char *, unint64_t))(v29 + 16);
    v31 = v62;
    v72 = v28;
    v30(v62, v27 + v67 * v21);
    v32 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v21);
    v33 = v63;
    *(_QWORD *)&v31[*(int *)(v63 + 48)] = v32;
    v34 = (uint64_t)v31;
    v35 = v71;
    sub_1A02812C4(v34, v71, &qword_1EE58FD18);
    v69 = *(int *)(v33 + 48);
    v36 = *(_QWORD *)(v35 + v69);
    v37 = *(_QWORD *)(v36 + 16);
    if (v37)
    {
      v38 = v59;
      v39 = v36 + ((*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80));
      swift_bridgeObjectRetain();
      v65 = v36;
      swift_bridgeObjectRetain();
      v40 = *(_QWORD *)(v38 + 72);
      v41 = MEMORY[0x1E0DEE9D8];
      do
      {
        sub_1A02CB318(v39, (uint64_t)v11, type metadata accessor for TagsTable.Record);
        sub_1A02DDF54((uint64_t)v4);
        sub_1A0267EFC((uint64_t)v11, type metadata accessor for TagsTable.Record);
        if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
        {
          sub_1A026F378((uint64_t)v4, &qword_1ED07B030);
        }
        else
        {
          v42 = v73;
          sub_1A02CB6F8((uint64_t)v4, v73, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
          sub_1A02CB6F8(v42, v76, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1A029B0C0();
            v41 = v44;
          }
          v43 = *(_QWORD *)(v41 + 16);
          if (v43 >= *(_QWORD *)(v41 + 24) >> 1)
          {
            sub_1A029B0C0();
            v41 = v45;
          }
          *(_QWORD *)(v41 + 16) = v43 + 1;
          sub_1A02CB6F8(v76, v41+ ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80))+ *(_QWORD *)(v74 + 72) * v43, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
          v5 = v75;
        }
        v39 += v40;
        --v37;
      }
      while (v37);
      swift_bridgeObjectRelease();
      v14 = v58;
    }
    else
    {
      swift_bridgeObjectRetain();
      v41 = MEMORY[0x1E0DEE9D8];
    }
    v46 = v71;
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v70 + 32);
    v47(v14, v71, v72);
    v70 = *(_QWORD *)(v46 + v69);
    v18 = v82;
    if (*(_QWORD *)(v82 + 24) <= *(_QWORD *)(v82 + 16))
    {
      sub_1A02B62DC();
      v18 = v82;
    }
    sub_1A02CCD60();
    result = sub_1A030776C();
    v48 = v18 + 64;
    v49 = -1 << *(_BYTE *)(v18 + 32);
    v50 = result & ~v49;
    v51 = v50 >> 6;
    if (((-1 << v50) & ~*(_QWORD *)(v18 + 64 + 8 * (v50 >> 6))) == 0)
      break;
    v52 = __clz(__rbit64((-1 << v50) & ~*(_QWORD *)(v18 + 64 + 8 * (v50 >> 6)))) | v50 & 0x7FFFFFFFFFFFFFC0;
LABEL_42:
    *(_QWORD *)(v48 + ((v52 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v52;
    v47((char *)(*(_QWORD *)(v18 + 48) + v52 * v67), (uint64_t)v14, v72);
    *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v52) = v41;
    ++*(_QWORD *)(v18 + 16);
    result = swift_bridgeObjectRelease();
    v19 = v68;
    if (v68)
      goto LABEL_2;
LABEL_3:
    v22 = v66 + 1;
    if (__OFADD__(v66, 1))
      goto LABEL_46;
    if (v22 >= v61)
      goto LABEL_44;
    v23 = *(_QWORD *)(v60 + 8 * v22);
    v24 = v66 + 1;
    if (!v23)
    {
      v24 = v66 + 2;
      if (v66 + 2 >= v61)
        goto LABEL_44;
      v23 = *(_QWORD *)(v60 + 8 * v24);
      if (!v23)
      {
        v24 = v66 + 3;
        if (v66 + 3 >= v61)
          goto LABEL_44;
        v23 = *(_QWORD *)(v60 + 8 * v24);
        if (!v23)
        {
          v24 = v66 + 4;
          if (v66 + 4 >= v61)
            goto LABEL_44;
          v23 = *(_QWORD *)(v60 + 8 * v24);
          if (!v23)
          {
            v24 = v66 + 5;
            if (v66 + 5 >= v61)
              goto LABEL_44;
            v23 = *(_QWORD *)(v60 + 8 * v24);
            if (!v23)
            {
              v25 = v66 + 6;
              while (v25 < v61)
              {
                v23 = *(_QWORD *)(v60 + 8 * v25++);
                if (v23)
                {
                  v24 = v25 - 1;
                  goto LABEL_18;
                }
              }
LABEL_44:
              sub_1A02B724C();
              return v18;
            }
          }
        }
      }
    }
LABEL_18:
    v68 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v24 << 6);
    v66 = v24;
  }
  v53 = 0;
  v54 = (unint64_t)(63 - v49) >> 6;
  while (++v51 != v54 || (v53 & 1) == 0)
  {
    v55 = v51 == v54;
    if (v51 == v54)
      v51 = 0;
    v53 |= v55;
    v56 = *(_QWORD *)(v48 + 8 * v51);
    if (v56 != -1)
    {
      v52 = __clz(__rbit64(~v56)) + (v51 << 6);
      goto LABEL_42;
    }
  }
  __break(1u);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_1A02DD738(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  int64_t v39;
  _QWORD v40[2];
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v2 = v1;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07ACF8);
  v4 = MEMORY[0x1E0C80A78](v45);
  v47 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v50 = (uint64_t)v40 - v7;
  MEMORY[0x1E0C80A78](v6);
  v44 = (char *)v40 - v8;
  v55 = MEMORY[0x1E0DEE9E0];
  sub_1A02CFAC4(a1);
  v46 = v51[1];
  v9 = v53;
  v10 = v54;
  v40[1] = v52;
  v41 = (unint64_t)(v52 + 64) >> 6;
  v42 = v51[2];
  result = swift_bridgeObjectRetain();
  while (1)
  {
    v43 = v9;
    if (v10)
    {
      v12 = v2;
      v48 = (v10 - 1) & v10;
      v49 = v9;
      v13 = __clz(__rbit64(v10)) | (v9 << 6);
    }
    else
    {
      v14 = v9 + 1;
      if (__OFADD__(v9, 1))
        goto LABEL_40;
      if (v14 >= v41)
        goto LABEL_38;
      v15 = *(_QWORD *)(v42 + 8 * v14);
      if (!v15)
      {
        v16 = v9 + 2;
        if (v9 + 2 >= v41)
          goto LABEL_38;
        v15 = *(_QWORD *)(v42 + 8 * v16);
        if (v15)
          goto LABEL_13;
        v16 = v9 + 3;
        if (v9 + 3 >= v41)
          goto LABEL_38;
        v15 = *(_QWORD *)(v42 + 8 * v16);
        if (v15)
          goto LABEL_13;
        v16 = v9 + 4;
        if (v9 + 4 >= v41)
          goto LABEL_38;
        v15 = *(_QWORD *)(v42 + 8 * v16);
        if (v15)
        {
LABEL_13:
          v14 = v16;
        }
        else
        {
          v14 = v9 + 5;
          if (v9 + 5 >= v41)
            goto LABEL_38;
          v15 = *(_QWORD *)(v42 + 8 * v14);
          if (!v15)
          {
            v39 = v9 + 6;
            while (v39 < v41)
            {
              v15 = *(_QWORD *)(v42 + 8 * v39++);
              if (v15)
              {
                v14 = v39 - 1;
                goto LABEL_14;
              }
            }
LABEL_38:
            sub_1A02B724C();
            return v55;
          }
        }
      }
LABEL_14:
      v12 = v2;
      v48 = (v15 - 1) & v15;
      v49 = v14;
      v13 = __clz(__rbit64(v15)) + (v14 << 6);
    }
    v17 = v46;
    v18 = *(_QWORD *)(v46 + 48);
    v19 = sub_1A0307334();
    v20 = *(_QWORD *)(v19 - 8);
    v21 = *(_QWORD *)(v20 + 72);
    v22 = (uint64_t)v44;
    (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))(v44, v18 + v21 * v13, v19);
    v23 = v45;
    *(_QWORD *)(v22 + *(int *)(v45 + 48)) = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v13);
    v24 = v50;
    sub_1A02812C4(v22, v50, &qword_1ED07ACF8);
    v25 = v24 + *(int *)(v23 + 48);
    swift_bridgeObjectRetain();
    sub_1A02DF334(v25, v51);
    v2 = v12;
    if (v12)
    {
      sub_1A026F378(v50, &qword_1ED07ACF8);
      swift_release();
      return sub_1A02B724C();
    }
    v26 = v51[0];
    if (!v51[0])
    {
      sub_1A026F378(v50, &qword_1ED07ACF8);
      goto LABEL_30;
    }
    v27 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 32);
    v27(v47, v50, v19);
    v28 = v55;
    if (*(_QWORD *)(v55 + 24) <= *(_QWORD *)(v55 + 16))
    {
      sub_1A02B62DC();
      v28 = v55;
    }
    sub_1A02CCD60();
    result = sub_1A030776C();
    v29 = v28 + 64;
    v30 = -1 << *(_BYTE *)(v28 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v28 + 64 + 8 * (v31 >> 6))) == 0)
      break;
    v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v28 + 64 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    v34 = v47;
LABEL_29:
    *(_QWORD *)(v29 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v27((char *)(*(_QWORD *)(v28 + 48) + v33 * v21), (uint64_t)v34, v19);
    *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v33) = v26;
    ++*(_QWORD *)(v28 + 16);
LABEL_30:
    result = swift_bridgeObjectRelease();
    v10 = v48;
    v9 = v49;
  }
  v35 = 0;
  v36 = (unint64_t)(63 - v30) >> 6;
  v34 = v47;
  while (++v32 != v36 || (v35 & 1) == 0)
  {
    v37 = v32 == v36;
    if (v32 == v36)
      v32 = 0;
    v35 |= v37;
    v38 = *(_QWORD *)(v29 + 8 * v32);
    if (v38 != -1)
    {
      v33 = __clz(__rbit64(~v38)) + (v32 << 6);
      goto LABEL_29;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

void sub_1A02DDB80()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
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

  OUTLINED_FUNCTION_4_3();
  v25 = v0;
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14_16();
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v24 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B210);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_54_4();
  v11 = *v3;
  v12 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_22_6((uint64_t)v9, 1);
  v13 = OUTLINED_FUNCTION_8_15();
  __swift_storeEnumTagSinglePayload(v13, v14, v15, v12);
  v16 = OUTLINED_FUNCTION_22_8();
  v17 = v1 + *(int *)(v16 + 40);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07ACE0);
  __swift_storeEnumTagSinglePayload(v17, 1, 1, v18);
  v19 = v1 + *(int *)(v16 + 44);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v19, v5, v12);
  OUTLINED_FUNCTION_22_6(v19, 0);
  sub_1A02812C4((uint64_t)v9, v1, &qword_1ED07BC80);
  v20 = OUTLINED_FUNCTION_25_11();
  sub_1A02812C4(v20, v21, &qword_1ED07BC80);
  OUTLINED_FUNCTION_40_7();
  *(_DWORD *)v22 = v11 & 1;
  *(_BYTE *)(v22 + 4) = v11 == 2;
  OUTLINED_FUNCTION_17_11();
  v23 = sub_1A02DF278();
  sub_1A026F378(v1, &qword_1ED07B210);
  if (v23)
  {
    sub_1A02DE744(v23);
    OUTLINED_FUNCTION_1_7();
  }
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1A02DDD00(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B210);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_6();
  v5 = v4 - v3;
  v6 = *a1;
  if (v6 == 2)
  {
    OUTLINED_FUNCTION_22_8();
    v7 = OUTLINED_FUNCTION_9_15();
  }
  else
  {
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_27_4(v5);
    v11 = (int *)OUTLINED_FUNCTION_22_8();
    OUTLINED_FUNCTION_27_4(v5 + v11[6]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07ACE0);
    v12 = OUTLINED_FUNCTION_8_15();
    __swift_storeEnumTagSinglePayload(v12, v13, v14, v15);
    OUTLINED_FUNCTION_27_4(v5 + v11[11]);
    *(_QWORD *)(v5 + v11[5]) = 0;
    *(_QWORD *)(v5 + v11[7]) = 0;
    v16 = v5 + v11[8];
    *(_DWORD *)v16 = v6 & 1;
    *(_BYTE *)(v16 + 4) = 0;
    *(_QWORD *)(v5 + v11[9]) = 0;
    v7 = v5;
    v8 = 0;
    v9 = 1;
    v10 = (uint64_t)v11;
  }
  __swift_storeEnumTagSinglePayload(v7, v8, v9, v10);
  v17 = sub_1A02DF278();
  v18 = v17;
  if (v17)
  {
    v19 = sub_1A02DE2F0(v17);
    OUTLINED_FUNCTION_1_7();
    v18 = sub_1A02DD0A8(v19);
    OUTLINED_FUNCTION_2_8();
  }
  sub_1A026F378(v5, &qword_1ED07B210);
  return v18;
}

uint64_t sub_1A02DDE4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v3 = 0;
  if ((sub_1A0283924(0) & 1) != 0)
  {
    if (*(_QWORD *)(v1 + OBJC_IVAR___SiriAnalyticsMetastore_db) && *(_QWORD *)(a1 + 16))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      v4 = sub_1A02D4EA8(0);
      v3 = sub_1A02E7984(v4, v5, v6);
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_2_8();
      swift_bridgeObjectRelease();
      if (v3)
      {
        v7 = sub_1A02E6A34(v3);
        swift_bridgeObjectRelease();
        v3 = sub_1A02DD738(v7);
        swift_release();
        OUTLINED_FUNCTION_3_0();
      }
      else
      {
        swift_release();
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_1A02DDF54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  __int128 v38;
  ValueMetadata *v39;
  _UNKNOWN **v40;

  v2 = v1;
  v4 = type metadata accessor for TagsTable.Record(0);
  v5 = v4;
  v6 = *(_DWORD *)(v1 + *(int *)(v4 + 20));
  if (v6)
  {
    if (v6 != 1)
    {
      if (qword_1ED07B1B8 != -1)
        swift_once();
      sub_1A0307CAC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v38 = 0xD000000000000013;
      *((_QWORD *)&v38 + 1) = 0x80000001A0310940;
      sub_1A0307E20();
      sub_1A0307838();
      OUTLINED_FUNCTION_2_8();
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_1_41();
      sub_1A02B97F8(v13, v14, v15, v16, v17, v18);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_37_9();
      v19 = OUTLINED_FUNCTION_9_15();
      return __swift_storeEnumTagSinglePayload(v19, v20, v21, v22);
    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  v8 = (uint64_t *)(v1 + *(int *)(v4 + 28));
  v9 = *v8;
  v10 = v8[1];
  objc_allocWithZone(MEMORY[0x1E0D82B90]);
  sub_1A02652C0(v9, v10);
  v11 = sub_1A026D47C(v9, v10);
  if (v11)
  {
    v12 = v11;
    if ((v7 & 1) != 0)
    {
      v39 = &type metadata for DataClassificationTag;
      v40 = &protocol witness table for DataClassificationTag;
      *(_QWORD *)&v38 = swift_allocObject();
      static DataClassificationTag.read(from:)(v38 + 16);
    }
    else
    {
      v39 = &type metadata for SensitiveConditionTag;
      v40 = &protocol witness table for SensitiveConditionTag;
      static SensitiveConditionTag.read(from:)();
    }

    v34 = v2 + *(int *)(v5 + 24);
    v35 = OUTLINED_FUNCTION_9();
    v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 16);
    v36(a1, v34, v35);
    v37 = OUTLINED_FUNCTION_37_9();
    v36(a1 + *(int *)(v37 + 20), v2, v35);
    sub_1A027106C(&v38, a1 + *(int *)(v37 + 24));
    v19 = OUTLINED_FUNCTION_31_9();
    return __swift_storeEnumTagSinglePayload(v19, v20, v21, v22);
  }
  if (qword_1ED07B1B8 != -1)
    swift_once();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_41();
  sub_1A02B97F8(v23, v24, v25, v26, v27, v28);
  OUTLINED_FUNCTION_37_9();
  v29 = OUTLINED_FUNCTION_9_15();
  return __swift_storeEnumTagSinglePayload(v29, v30, v31, v32);
}

uint64_t sub_1A02DE2F0(uint64_t a1)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  unint64_t v27;
  char *v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t result;
  _QWORD v45[2];
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1A0307334();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v45 - v10;
  v12 = type metadata accessor for TagsTable.Record(0);
  v13 = MEMORY[0x1E0C80A78](v12);
  v52 = (uint64_t)v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v53 = (uint64_t)v45 - v16;
  v17 = *(_QWORD *)(a1 + 16);
  if (!v17)
    return MEMORY[0x1E0DEE9E0];
  v18 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v50 = v9;
  v51 = v18;
  v19 = a1 + v18;
  v54 = *(_QWORD *)(v15 + 72);
  v45[1] = a1;
  swift_bridgeObjectRetain();
  v20 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v47 = v4;
  v48 = v5;
  v49 = v6;
  v21 = v53;
  v46 = v11;
  while (1)
  {
    sub_1A02CB318(v19, v21, type metadata accessor for TagsTable.Record);
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v22(v4, v21, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v5);
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    {
      sub_1A0267EFC(v21, type metadata accessor for TagsTable.Record);
      sub_1A026F378((uint64_t)v4, &qword_1ED07BC80);
      goto LABEL_22;
    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    if (v20[2])
    {
      sub_1A02A27FC();
      v24 = MEMORY[0x1E0DEE9D8];
      v25 = v50;
      if ((v26 & 1) != 0)
      {
        v24 = *(_QWORD *)(v20[7] + 8 * v23);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      v24 = MEMORY[0x1E0DEE9D8];
      v25 = v50;
    }
    sub_1A02CB318(v53, v52, type metadata accessor for TagsTable.Record);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1A029B0A4();
      v24 = v42;
    }
    v27 = *(_QWORD *)(v24 + 16);
    if (v27 >= *(_QWORD *)(v24 + 24) >> 1)
    {
      sub_1A029B0A4();
      v24 = v43;
    }
    *(_QWORD *)(v24 + 16) = v27 + 1;
    sub_1A02CB6F8(v52, v24 + v51 + v27 * v54, type metadata accessor for TagsTable.Record);
    v22(v25, (uint64_t)v11, v5);
    swift_isUniquelyReferenced_nonNull_native();
    v55 = v20;
    v28 = v25;
    sub_1A02A27FC();
    if (__OFADD__(v20[2], (v30 & 1) == 0))
      break;
    v31 = v29;
    v32 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FD20);
    if ((sub_1A0307D60() & 1) != 0)
    {
      sub_1A02A27FC();
      if ((v32 & 1) != (v34 & 1))
        goto LABEL_28;
      v31 = v33;
    }
    v20 = v55;
    if ((v32 & 1) != 0)
    {
      v35 = v55[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v35 + 8 * v31) = v24;
      v36 = v28;
      v5 = v48;
      v6 = v49;
    }
    else
    {
      v55[(v31 >> 6) + 8] |= 1 << v31;
      v6 = v49;
      v36 = v28;
      v37 = v28;
      v5 = v48;
      v22((char *)(v20[6] + *(_QWORD *)(v49 + 72) * v31), (uint64_t)v37, v48);
      *(_QWORD *)(v20[7] + 8 * v31) = v24;
      v38 = v20[2];
      v39 = __OFADD__(v38, 1);
      v40 = v38 + 1;
      if (v39)
        goto LABEL_27;
      v20[2] = v40;
    }
    swift_bridgeObjectRelease();
    v41 = *(void (**)(char *, uint64_t))(v6 + 8);
    v41(v36, v5);
    v11 = v46;
    v41(v46, v5);
    v21 = v53;
    sub_1A0267EFC(v53, type metadata accessor for TagsTable.Record);
    v4 = v47;
LABEL_22:
    v19 += v54;
    if (!--v17)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v20;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  result = sub_1A0307E74();
  __break(1u);
  return result;
}

uint64_t sub_1A02DE744(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B030);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for IdentifiableTag();
  v24 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x1E0C80A78](v5);
  v25 = (uint64_t)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v22 - v8;
  v10 = type metadata accessor for TagsTable.Record(0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
    return MEMORY[0x1E0DEE9D8];
  v15 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v16 = *(_QWORD *)(v11 + 72);
  v22 = a1;
  swift_bridgeObjectRetain();
  v17 = MEMORY[0x1E0DEE9D8];
  v23 = v5;
  do
  {
    sub_1A02CB318(v15, (uint64_t)v13, type metadata accessor for TagsTable.Record);
    sub_1A02DDF54((uint64_t)v4);
    sub_1A0267EFC((uint64_t)v13, type metadata accessor for TagsTable.Record);
    if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
    {
      sub_1A026F378((uint64_t)v4, &qword_1ED07B030);
    }
    else
    {
      sub_1A02CB6F8((uint64_t)v4, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
      sub_1A02CB6F8((uint64_t)v9, v25, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A029B0C0();
        v17 = v19;
      }
      v18 = *(_QWORD *)(v17 + 16);
      if (v18 >= *(_QWORD *)(v17 + 24) >> 1)
      {
        sub_1A029B0C0();
        v17 = v20;
      }
      *(_QWORD *)(v17 + 16) = v18 + 1;
      sub_1A02CB6F8(v25, v17+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(_QWORD *)(v24 + 72) * v18, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
      v5 = v23;
    }
    v15 += v16;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v17;
}

void sub_1A02DE9BC()
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
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  _BYTE v21[16];
  unint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_4_3();
  v2 = v1;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_9();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_6();
  v9 = v8 - v7;
  v10 = type metadata accessor for ComponentId(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_54_4();
  type metadata accessor for MessageGroupIdentifier(0);
  OUTLINED_FUNCTION_5();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = &v21[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v13);
  v17 = &v21[-v16];
  sub_1A027621C(v2, (uint64_t)&v23);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE58E690);
  if (!swift_dynamicCast())
    goto LABEL_5;
  v18 = v22;
  if (v22 >> 61 != 1)
  {
    OUTLINED_FUNCTION_27_10();
LABEL_5:
    OUTLINED_FUNCTION_16_6(v4, 1);
    goto LABEL_6;
  }
  v19 = swift_projectBox();
  sub_1A02CB318(v19, (uint64_t)v17, type metadata accessor for MessageGroupIdentifier);
  sub_1A02CB318((uint64_t)v17, (uint64_t)v15, type metadata accessor for MessageGroupIdentifier);
  sub_1A02CB6F8((uint64_t)v15, v0, type metadata accessor for ComponentId);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v9, v0 + *(int *)(v10 + 20), v5);
  objc_allocWithZone((Class)sub_1A0307508());
  sub_1A027B840(v18);
  v20 = (void *)sub_1A03074F0();
  sub_1A03074FC();

  OUTLINED_FUNCTION_27_10();
  sub_1A0267EFC(v0, type metadata accessor for ComponentId);
  sub_1A0267EFC((uint64_t)v17, type metadata accessor for MessageGroupIdentifier);
  OUTLINED_FUNCTION_16_6(v4, 0);
  OUTLINED_FUNCTION_27_10();
LABEL_6:
  OUTLINED_FUNCTION_18();
}

void Metastore.createTag(shim:onClock:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_6();
  v3 = v2 - v1;
  v4 = OUTLINED_FUNCTION_9();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  sub_1A02DC674();
  sub_1A026F378(v3, &qword_1ED07BC80);
}

uint64_t *sub_1A02DED74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  __int128 v10;
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
    v7 = sub_1A0307334();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    v9 = *(int *)(a3 + 24);
    v10 = *(_OWORD *)((char *)a2 + v9 + 24);
    *(_OWORD *)((char *)a1 + v9 + 24) = v10;
    (**(void (***)(void))(v10 - 8))();
  }
  return a1;
}

uint64_t sub_1A02DEE34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_1A0307334();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + *(int *)(a2 + 20), v4);
  return __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 24));
}

uint64_t sub_1A02DEE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  __int128 v9;

  v6 = sub_1A0307334();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = *(_OWORD *)(a2 + v8 + 24);
  *(_OWORD *)(a1 + v8 + 24) = v9;
  (**(void (***)(void))(v9 - 8))();
  return a1;
}

uint64_t sub_1A02DEF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1A0307334();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 24)), (uint64_t *)(a2 + *(int *)(a3 + 24)));
  return a1;
}

uint64_t sub_1A02DEFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v6 = sub_1A0307334();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  return a1;
}

uint64_t sub_1A02DF034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v6 = sub_1A0307334();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v8;
  v10 = a2 + v8;
  __swift_destroy_boxed_opaque_existential_1(a1 + v8);
  v11 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v11;
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  return a1;
}

uint64_t sub_1A02DF0C8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A02DF0D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 24);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_1A02DF14C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A02DF158(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for IdentifiableTag()
{
  uint64_t result;

  result = qword_1ED07AD28;
  if (!qword_1ED07AD28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A02DF204()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A0307334();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1A02DF278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v1 = 0;
  if ((sub_1A0283924(0) & 1) != 0)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___SiriAnalyticsMetastore_db);
    if (v2)
    {
      swift_retain();
      sub_1A02C6FF0();
      v3 = (void *)MEMORY[0x1A1AF74A0]();
      sub_1A02CB0E4(v2, v6);
      v1 = v4;
      objc_autoreleasePoolPop(v3);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t sub_1A02DF334@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED07B1E0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = type metadata accessor for TagsTable.Record(0);
  MEMORY[0x1E0C80A78](v29);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B030);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for IdentifiableTag();
  v26 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x1E0C80A78](v13);
  v28 = (uint64_t)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v14);
  v25 = (uint64_t)v24 - v17;
  v27 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v27)
  {
    v24[0] = a2;
    v24[1] = v2;
    swift_bridgeObjectRetain();
    v18 = 0;
    v19 = MEMORY[0x1E0DEE9D8];
    do
    {
      swift_bridgeObjectRetain_n();
      sub_1A02D3458();
      if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v29) == 1)
      {
        sub_1A026F378((uint64_t)v7, (uint64_t *)&unk_1ED07B1E0);
        __swift_storeEnumTagSinglePayload((uint64_t)v12, 1, 1, v13);
      }
      else
      {
        sub_1A02CB6F8((uint64_t)v7, (uint64_t)v9, type metadata accessor for TagsTable.Record);
        sub_1A02DDF54((uint64_t)v12);
        sub_1A0267EFC((uint64_t)v9, type metadata accessor for TagsTable.Record);
      }
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
      {
        sub_1A026F378((uint64_t)v12, &qword_1ED07B030);
      }
      else
      {
        v20 = v25;
        sub_1A02CB6F8((uint64_t)v12, v25, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
        sub_1A02CB6F8(v20, v28, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A029B0C0();
          v19 = v22;
        }
        v21 = *(_QWORD *)(v19 + 16);
        if (v21 >= *(_QWORD *)(v19 + 24) >> 1)
        {
          sub_1A029B0C0();
          v19 = v23;
        }
        *(_QWORD *)(v19 + 16) = v21 + 1;
        sub_1A02CB6F8(v28, v19+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(_QWORD *)(v26 + 72) * v21, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
      }
      ++v18;
    }
    while (v27 != v18);
    result = swift_bridgeObjectRelease();
    a2 = (_QWORD *)v24[0];
  }
  else
  {
    v19 = MEMORY[0x1E0DEE9D8];
  }
  *a2 = v19;
  return result;
}

uint64_t sub_1A02DF65C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A027B870(*(_QWORD *)(v0 + 56));
  return swift_deallocObject();
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x1A1AF7E24);
  return result;
}

uint64_t OUTLINED_FUNCTION_8_15()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9_15()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11_17()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 32) + 8))();
}

uint64_t OUTLINED_FUNCTION_17_11()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + *(int *)(v1 + 36)) = 0;
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_10(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_22_8()
{
  return type metadata accessor for TagsTable.Predicate(0);
}

uint64_t OUTLINED_FUNCTION_23_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_25_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + *(int *)(v2 + 20)) = 0;
  return v1;
}

unint64_t OUTLINED_FUNCTION_27_10()
{
  unint64_t v0;

  return sub_1A027B870(v0);
}

uint64_t OUTLINED_FUNCTION_28_11()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 168);
}

uint64_t OUTLINED_FUNCTION_31_9()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_34_9()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 328);
}

void OUTLINED_FUNCTION_35_7(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1A026F378(*(_QWORD *)(v2 - 320), a2);
}

uint64_t OUTLINED_FUNCTION_36_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_37_9()
{
  return type metadata accessor for IdentifiableTag();
}

void OUTLINED_FUNCTION_40_7()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + *(int *)(v1 + 28)) = 0;
}

uint64_t sub_1A02DF7F4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  _QWORD *v21;
  void *v22;
  const char *v23;
  uint32_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD aBlock[6];

  v6 = v5;
  *(_DWORD *)(v6 + 48) = -1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E408);
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = 0;
  *(_QWORD *)(v6 + 56) = v12;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a4;
  *(_QWORD *)(v6 + 40) = a5;
  v13 = qword_1EE58E6A8;
  swift_bridgeObjectRetain();
  swift_retain();
  if (v13 != -1)
    swift_once();
  OUTLINED_FUNCTION_37();
  sub_1A0307CAC();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0_39();
  OUTLINED_FUNCTION_3_32();
  sub_1A02B9810(v14, v15, v16, v17, v18, v19);
  swift_bridgeObjectRelease();
  swift_unownedRetainStrong();
  swift_unownedRetain();
  swift_bridgeObjectRetain();
  swift_unownedRetain();
  v20 = a3;
  swift_unownedRelease();
  swift_unownedRelease();
  swift_unownedRetain();
  swift_release();
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = a1;
  v21[3] = a2;
  v21[4] = v6;
  aBlock[4] = sub_1A02DFFF8;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A02DFF50;
  aBlock[3] = &block_descriptor_15;
  v22 = _Block_copy(aBlock);
  swift_release();
  v23 = (const char *)(sub_1A0307814() + 32);
  OUTLINED_FUNCTION_0_8();
  v24 = notify_register_dispatch(v23, (int *)(v6 + 48), v20, v22);
  swift_endAccess();
  OUTLINED_FUNCTION_6_10();
  _Block_release(v22);

  if (v24)
  {
    OUTLINED_FUNCTION_37();
    sub_1A0307CAC();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_0_39();
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_3_32();
    sub_1A02B97F8(v25, v26, v27, v28, v29, v30);
    swift_release();
    OUTLINED_FUNCTION_2_8();

    swift_release();
    return 0;
  }
  else
  {
    OUTLINED_FUNCTION_2_8();

    swift_release();
  }
  return v6;
}

uint64_t sub_1A02DFAA8()
{
  uint64_t v0;

  sub_1A02DFAD8();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1A02DFAD8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_1_42();
  atomic_store(1u, (unsigned __int8 *)v1(v2));
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_0_8();
  return notify_cancel(*(_DWORD *)(v0 + 48));
}

uint64_t sub_1A02DFB2C()
{
  uint64_t v0;
  uint64_t state64[5];

  state64[4] = *MEMORY[0x1E0C80C00];
  state64[0] = 0;
  OUTLINED_FUNCTION_0_8();
  if (!notify_get_state(*(_DWORD *)(v0 + 48), state64))
    return state64[0];
  if (qword_1EE58E6A8 != -1)
    swift_once();
  sub_1A0307CAC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  sub_1A02B97F8(0xD000000000000020, 0x80000001A0310B50, 0xD00000000000006ALL, 0x80000001A0310A50, 0x53746E6572727563, 0xEC00000065746174);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1A02DFCA0()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  unsigned __int8 v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v2 = OUTLINED_FUNCTION_1_42();
  v3 = atomic_load((unsigned __int8 *)v1(v2));
  result = OUTLINED_FUNCTION_6_10();
  if ((v3 & 1) == 0)
  {
    v5 = sub_1A02DFB2C();
    v7 = v6 & 1;
    if (qword_1EE58E6A8 != -1)
      swift_once();
    OUTLINED_FUNCTION_37();
    sub_1A0307CAC();
    OUTLINED_FUNCTION_27();
    swift_bridgeObjectRetain();
    sub_1A0307838();
    swift_bridgeObjectRelease();
    sub_1A0307838();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07AEC0);
    sub_1A0307808();
    sub_1A0307838();
    swift_bridgeObjectRelease();
    sub_1A02B9810(0x6E69796669746F4ELL, 0xEF3A656D616E2067, 0xD00000000000006ALL, 0x80000001A0310A50, 0xD000000000000014, 0x80000001A0310B30);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v5, v7);
  }
  return result;
}

uint64_t sub_1A02DFE44()
{
  if (qword_1EE58E6A8 != -1)
    swift_once();
  sub_1A0307CAC();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  sub_1A02B9810(0xD00000000000001ALL, 0x80000001A0310B10, 0xD00000000000006ALL, 0x80000001A0310A50, 0xD00000000000001ALL, 0x80000001A0310AC0);
  swift_bridgeObjectRelease();
  swift_unownedRetainStrong();
  sub_1A02DFCA0();
  return swift_release();
}

uint64_t sub_1A02DFF50(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_1A02DFF8C()
{
  sub_1A02DFAA8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DarwinNotificationObserver()
{
  return objc_opt_self();
}

uint64_t sub_1A02DFFCC()
{
  swift_bridgeObjectRelease();
  swift_unownedRelease();
  return swift_deallocObject();
}

uint64_t sub_1A02DFFF8()
{
  return sub_1A02DFE44();
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

uint64_t OUTLINED_FUNCTION_0_39()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_1_42()
{
  return swift_retain();
}

uint64_t sub_1A02E0068(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1A02E0070(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Timestamp()
{
  return &type metadata for Timestamp;
}

BOOL sub_1A02E008C(unint64_t a1, char a2, unint64_t a3, char a4)
{
  unint64_t Nanoseconds;

  Nanoseconds = a1;
  if ((a2 & 1) == 0)
    Nanoseconds = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a1);
  if ((a4 & 1) == 0)
    a3 = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(a3);
  return Nanoseconds < a3;
}

uint64_t sub_1A02E00E0(uint64_t a1, int a2, uint64_t a3, char a4)
{
  return (((a4 & 1) == 0) ^ a2) & (a1 == a3);
}

BOOL sub_1A02E00FC(uint64_t a1, uint64_t a2)
{
  return sub_1A02E008C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

void sub_1A02E0118(uint64_t a1, uint64_t a2)
{
  sub_1A02D32AC(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

void sub_1A02E0134(uint64_t a1, uint64_t a2)
{
  sub_1A02D331C(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

void sub_1A02E0150(uint64_t a1, uint64_t a2)
{
  sub_1A02D33D0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

uint64_t sub_1A02E016C(uint64_t a1, uint64_t a2)
{
  return sub_1A02E00E0(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *(_QWORD *)a2, *(_BYTE *)(a2 + 8));
}

unint64_t sub_1A02E018C()
{
  unint64_t result;

  result = qword_1EE58FD28;
  if (!qword_1EE58FD28)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A0318A18, &type metadata for Timestamp);
    atomic_store(result, (unint64_t *)&qword_1EE58FD28);
  }
  return result;
}

void sub_1A02E01C8(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_1A02E0224(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;

  v7 = v3;
  if (v3)
  {
    v26 = v3;
    v25 = v2;
    *(_QWORD *)(v6 - 104) = v5;
    v8 = v3 & ~(v3 >> 63);
    sub_1A02E3008();
    v5 = *(_QWORD *)(v6 - 104);
    if ((_DWORD)v4)
    {
      if ((_DWORD)v4 == 1)
        v9 = (int)a1;
      else
        v9 = *(_QWORD *)(a1 + 16);
      if (v7 < 0)
        goto LABEL_40;
    }
    else
    {
      if (v7 < 0)
      {
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
      }
      v9 = 0;
    }
    *(_QWORD *)(v6 - 136) = a2 & 0x3FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(v6 - 128) = v4;
    while (v8)
    {
      if ((_DWORD)v4)
      {
        if ((_DWORD)v4 == 1)
        {
          if (v9 < (int)a1 || v9 >= a1 >> 32)
            goto LABEL_34;
          v11 = sub_1A0307124();
          if (!v11)
            goto LABEL_42;
          v12 = v11;
          v13 = sub_1A030713C();
          v14 = v9 - v13;
          if (__OFSUB__(v9, v13))
            goto LABEL_37;
        }
        else
        {
          if (v9 < *(_QWORD *)(a1 + 16))
            goto LABEL_36;
          if (v9 >= *(_QWORD *)(a1 + 24))
            goto LABEL_38;
          v16 = sub_1A0307124();
          if (!v16)
            goto LABEL_43;
          v12 = v16;
          v17 = sub_1A030713C();
          v14 = v9 - v17;
          if (__OFSUB__(v9, v17))
            goto LABEL_39;
        }
        v15 = *(_BYTE *)(v12 + v14);
      }
      else
      {
        if (v9 >= v26)
          goto LABEL_35;
        *(_DWORD *)(v6 - 118) = a1;
        *(_BYTE *)(v6 - 114) = v25;
        *(_WORD *)(v6 - 113) = *(_WORD *)((char *)&a1 + 5);
        *(_BYTE *)(v6 - 111) = HIBYTE(a1);
        *(_DWORD *)(v6 - 110) = a2;
        *(_WORD *)(v6 - 106) = WORD2(a2);
        v15 = *(_BYTE *)(v6 - 118 + v9);
      }
      __swift_instantiateConcreteTypeFromMangledName(qword_1EE58FD38);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_1A0314FD0;
      *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEDE70];
      *(_QWORD *)(v18 + 64) = MEMORY[0x1E0DEDEC8];
      *(_BYTE *)(v18 + 32) = v15;
      v19 = sub_1A03077C0();
      v21 = v20;
      *(_QWORD *)(v6 - 104) = v5;
      v22 = *(_QWORD *)(v5 + 16);
      if (v22 >= *(_QWORD *)(v5 + 24) >> 1)
      {
        sub_1A02E3008();
        v5 = *(_QWORD *)(v6 - 104);
      }
      *(_QWORD *)(v5 + 16) = v22 + 1;
      v23 = v5 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v19;
      *(_QWORD *)(v23 + 40) = v21;
      ++v9;
      --v8;
      --v7;
      v4 = *(_QWORD *)(v6 - 128);
      if (!v7)
        return v5;
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
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    JUMPOUT(0x1A02E0528);
  }
  return v5;
}

void sub_1A02E0550()
{
  void *v0;
  id v1;
  int v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;

  sub_1A02E0AF8();
  v0 = (void *)sub_1A0307478();
  if (v0)
  {
    v8 = v0;
    v1 = objc_msgSend(v0, sel_whichEvent_Type);
    switch((unint64_t)v1)
    {
      case 'e':
        v2 = OUTLINED_FUNCTION_3_33();
        sub_1A02E0CC0(v2, v3);
        goto LABEL_11;
      case 'f':
        v4 = OUTLINED_FUNCTION_3_33();
        sub_1A02E0DB4(v4, v5);
        goto LABEL_11;
      case 'g':
        v6 = OUTLINED_FUNCTION_3_33();
        sub_1A02E0B34(v6, v7);
        goto LABEL_11;
      case 'h':
        goto LABEL_11;
      default:
        if (v1)
        {
          if (qword_1EE58EF90 != -1)
            swift_once();
          OUTLINED_FUNCTION_37();
          sub_1A0307CAC();
          sub_1A0307838();
          objc_msgSend(v8, sel_whichEvent_Type);
          type metadata accessor for SUTSchemaTestExecutionEvent_WhichEvent_Type(0);
          sub_1A0307D54();
          sub_1A02B97F8(v9, v10, 0xD000000000000062, 0x80000001A0310BC0, 0x28737365636F7270, 0xEB00000000293A5FLL);
          swift_bridgeObjectRelease();

        }
        else
        {
LABEL_11:

        }
        break;
    }
  }
}

uint64_t sub_1A02E06F4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t v22[2];
  char v23;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1A0307334();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v22[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_1A0307460();
  if (result)
  {
    v8 = (void *)result;
    sub_1A03074B4();

    v9 = *v1;
    if (*(_QWORD *)(*v1 + 16))
    {
      sub_1A02A27FC();
      if ((v11 & 1) != 0)
      {
        v12 = *(_QWORD *)(v9 + 56) + 24 * v10;
        v13 = *(_QWORD *)(v12 + 8);
        v14 = *(_QWORD *)(v12 + 16);
        goto LABEL_10;
      }
    }
    result = sub_1A0307460();
    if (result)
    {
      v15 = (void *)result;
      v16 = sub_1A03074CC();

      sub_1A02E14DC((uint64_t)v22, v16, v16, v1[3]);
      if ((v23 & 1) != 0)
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      v17 = v1[2];
      if (!*(_QWORD *)(v17 + 16))
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      v18 = sub_1A02A29C8(v22[0], v22[1]);
      if ((v19 & 1) == 0)
        return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      v20 = (uint64_t *)(*(_QWORD *)(v17 + 56) + 16 * v18);
      v13 = *v20;
      v14 = v20[1];
LABEL_10:
      sub_1A02652C0(v13, v14);
      sub_1A0307274();
      sub_1A0307448();
      sub_1A02653E8(v13, v14);
      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1A02E0898(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v5 = result;
  v6 = result == a3;
  if (result < a3)
  {
    a2 = a3 - 1;
    v6 = a3 - 1 == result;
    if (a3 - 1 >= result)
      return result;
    __break(1u);
  }
  v7 = a2;
  if (v6)
  {
    if (qword_1EE58EF90 != -1)
      swift_once();
    OUTLINED_FUNCTION_37();
    sub_1A0307CAC();
    OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_6_29();
    OUTLINED_FUNCTION_1_43();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_0_40();
    OUTLINED_FUNCTION_6_29();
    OUTLINED_FUNCTION_1_43();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_29();
    sub_1A02B97F8(v8, v9, v10, v11, v12, v13);
    result = swift_bridgeObjectRelease();
    if (v7 == a4)
    {
      OUTLINED_FUNCTION_37();
      sub_1A0307CAC();
      OUTLINED_FUNCTION_1_43();
      OUTLINED_FUNCTION_5_21();
      OUTLINED_FUNCTION_1_43();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_40();
      OUTLINED_FUNCTION_5_21();
      OUTLINED_FUNCTION_1_43();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_29();
      sub_1A02B97F8(v14, v15, v16, v17, v18, v19);
      swift_bridgeObjectRelease();
      return v5;
    }
    if (v7 < a4)
      return v5;
    if (a4 != -1)
    {
      if (a4 + 1 <= v7)
        return v5;
      goto LABEL_22;
    }
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    return result;
  }
  if (!result)
  {
    __break(1u);
    goto LABEL_20;
  }
  if (result - 1 < a3)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return a3;
}

unint64_t sub_1A02E0AF8()
{
  unint64_t result;

  result = qword_1EE58EF68;
  if (!qword_1EE58EF68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE58EF68);
  }
  return result;
}

void sub_1A02E0B34(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v3 = v2;
  v5 = sub_1A0307334();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a2, sel_metadata);
  if (!v9)
    return;
  v10 = v9;
  v11 = objc_msgSend(v9, sel_fingerprint);

  if (!v11)
    return;
  v12 = sub_1A02E177C(v11);
  if (v13 >> 60 == 15)
    return;
  v14 = v12;
  v15 = v13;
  v16 = sub_1A0307460();
  if (!v16)
  {
    __break(1u);
    goto LABEL_13;
  }
  v17 = (void *)v16;
  sub_1A03074B4();

  v18 = sub_1A0307460();
  if (!v18)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v19 = (void *)v18;
  v20 = sub_1A03074CC();

  v21 = *v3;
  if (*(_QWORD *)(*v3 + 16) && (sub_1A02A27FC(), (v23 & 1) != 0) && *(_QWORD *)(*(_QWORD *)(v21 + 56) + 24 * v22) < v20)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_1A026CF1C(v14, v15);
  }
  else
  {
    sub_1A0297624();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_1A02E0CC0(int a1, id a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v2 = objc_msgSend(a2, sel_metadata);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_fingerprint);

    if (v4)
    {
      v5 = sub_1A02E177C(v4);
      if (v6 >> 60 != 15)
      {
        v7 = v5;
        v8 = v6;
        v9 = sub_1A0307460();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = sub_1A03074CC();

          sub_1A02652C0(v7, v8);
          sub_1A0297654(v11, v7, v8);
          sub_1A026CF1C(v7, v8);
          sub_1A026CF1C(v7, v8);
        }
        else
        {
          __break(1u);
        }
      }
    }
  }
}

void sub_1A02E0DB4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t *v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  __int128 v37;
  _BYTE v38[56];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a2, sel_metadata);
  if (!v8)
    return;
  v9 = v8;
  v10 = objc_msgSend(v8, sel_fingerprint);

  if (!v10)
    return;
  v11 = sub_1A02E177C(v10);
  if (v12 >> 60 == 15)
    return;
  v13 = v11;
  v14 = v12;
  v15 = sub_1A0307460();
  if (!v15)
  {
    __break(1u);
    return;
  }
  v16 = (void *)v15;
  v17 = sub_1A03074CC();

  v18 = *(_QWORD *)(v3 + 8);
  sub_1A02652C0(v13, v14);
  v19 = sub_1A0295CE0(v13, v14, v18);
  v21 = v20;
  sub_1A026CF1C(v13, v14);
  if ((v21 & 1) != 0)
  {
    sub_1A0307274();
    v22 = sub_1A0307334();
    if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v22) != 1)
    {
      sub_1A03072EC();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v7, v22);
      if (qword_1EE58EF90 != -1)
        swift_once();
      v39 = 0;
      v40 = 0xE000000000000000;
      sub_1A0307CAC();
      swift_bridgeObjectRelease();
      v39 = 0xD00000000000002CLL;
      v40 = 0x80000001A0310D40;
      sub_1A0307838();
      swift_bridgeObjectRelease();
      v24 = v39;
      v25 = v40;
      goto LABEL_15;
    }
    sub_1A0264214((uint64_t)v7);
    sub_1A02E01C8(v13, v14);
    v39 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B220);
    sub_1A0265304();
    v19 = 0xE000000000000000;
    sub_1A0307784();
    swift_bridgeObjectRelease();
    if (qword_1EE58EF90 == -1)
    {
LABEL_11:
      v39 = 0;
      v40 = v19;
      sub_1A0307CAC();
      sub_1A0307838();
      sub_1A0307838();
      swift_bridgeObjectRelease();
      v24 = v39;
      v25 = v40;
LABEL_15:
      sub_1A02B97F8(v24, v25, 0xD000000000000062, 0x80000001A0310BC0, 0xD00000000000001ALL, 0x80000001A0310D20);
      sub_1A026CF1C(v13, v14);
      swift_bridgeObjectRelease();
      return;
    }
LABEL_24:
    swift_once();
    goto LABEL_11;
  }
  sub_1A02C627C(v13, v14);
  if (v17 < v19)
  {
    __break(1u);
    goto LABEL_24;
  }
  sub_1A02E1360(v19, v17, (uint64_t)v38);
  sub_1A02E17E8((uint64_t)v38, (uint64_t)&v39);
  if ((v43 & 1) != 0)
  {
    sub_1A0297694();
  }
  else
  {
    v26 = v39;
    v27 = v40;
    v28 = *(_QWORD *)(v3 + 16);
    if (*(_QWORD *)(v28 + 16) && (v29 = v41, v30 = v42, v31 = sub_1A02A29C8(v39, v40), (v32 & 1) != 0))
    {
      v36[1] = v30;
      v36[2] = v29;
      v33 = (uint64_t *)(*(_QWORD *)(v28 + 56) + 16 * v31);
      v35 = *v33;
      v34 = v33[1];
      sub_1A02652C0(*v33, v34);
      sub_1A02C635C(v26, v27, &v37);
      sub_1A026CF1C(v37, *((unint64_t *)&v37 + 1));
      sub_1A02652C0(v35, v34);
      sub_1A0297694();
      sub_1A0297694();
      sub_1A02653E8(v35, v34);
    }
    else
    {
      if (qword_1EE58EF90 != -1)
        swift_once();
      *(_QWORD *)&v37 = 0;
      *((_QWORD *)&v37 + 1) = 0xE000000000000000;
      sub_1A0307CAC();
      sub_1A0307838();
      sub_1A02E1830();
      sub_1A0307838();
      swift_bridgeObjectRelease();
      sub_1A0307838();
      sub_1A02B97F8(v37, *((unint64_t *)&v37 + 1), 0xD000000000000062, 0x80000001A0310BC0, 0xD00000000000001ALL, 0x80000001A0310D20);
      swift_bridgeObjectRelease();
      sub_1A026CF1C(v13, v14);
    }
  }
}

void sub_1A02E1360(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  void (*v8)(uint64_t *, uint64_t *, _QWORD *, _QWORD *);
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v27[2];

  v4 = v3;
  v27[0] = a1;
  v27[1] = a2;
  v9 = *v4;
  v8 = (void (*)(uint64_t *, uint64_t *, _QWORD *, _QWORD *))v4[1];
  v10 = sub_1A02E14DC((uint64_t)&v24, a1, a2, *v4);
  v11 = v10;
  v18 = v26;
  if ((v26 & 1) != 0)
  {
    if (*(_QWORD *)(v9 + 16) < v10)
    {
      __break(1u);
    }
    else if ((v10 & 0x8000000000000000) == 0)
    {
      sub_1A02E1668(v10, v10, a1, a2);
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
LABEL_9:
      *(_QWORD *)a3 = v12;
      *(_QWORD *)(a3 + 8) = v13;
      *(_QWORD *)(a3 + 16) = v14;
      *(_QWORD *)(a3 + 24) = v15;
      *(_QWORD *)(a3 + 32) = v16;
      *(_QWORD *)(a3 + 40) = v17;
      *(_BYTE *)(a3 + 48) = v18;
      return;
    }
    __break(1u);
    goto LABEL_12;
  }
  v12 = v24;
  v13 = v25;
  v23[0] = v24;
  v23[1] = v25;
  v8(&v21, &v19, v23, v27);
  sub_1A02E15E0(v11);
  if (*(_QWORD *)(*v4 + 16) < (int64_t)v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((v11 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v16 = v19;
  v17 = v20;
  sub_1A02E1668(v11, v11, v19, v20);
  if (*(_QWORD *)(*v4 + 16) >= v11)
  {
    v14 = v21;
    v15 = v22;
    sub_1A02E1668(v11, v11, v21, v22);
    goto LABEL_9;
  }
LABEL_14:
  __break(1u);
}

uint64_t sub_1A02E14DC(uint64_t result, unint64_t a2, unint64_t a3, uint64_t a4)
{
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v13;
  __int128 v14;

  v4 = *(_QWORD *)(a4 + 16);
  if ((unint64_t)v4 >= 2)
  {
    v5 = 0;
    v6 = v4 - 1;
    v7 = a4 + 32;
    v8 = v4 - 1;
    do
    {
      v9 = v6 / 2;
      if (v6 < -1 || v9 >= v4)
      {
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v11 = *(_OWORD *)(v7 + 16 * v9);
      if ((unint64_t)v11 <= a3 && *((_QWORD *)&v11 + 1) >= a2)
      {
        *(_OWORD *)result = *(_OWORD *)(v7 + 16 * v9);
        *(_BYTE *)(result + 16) = 0;
        return v9;
      }
      if ((unint64_t)v11 <= a3)
        v13 = v8;
      else
        v13 = v9 - 1;
      if (*((_QWORD *)&v11 + 1) >= a2)
        v8 = v13;
      else
        v5 = v9 + 1;
      v6 = v5 + v8;
      if (__OFADD__(v5, v8))
        goto LABEL_35;
    }
    while (v5 < v8);
    if (v5 < v4)
      goto LABEL_23;
    goto LABEL_30;
  }
  v5 = 0;
  if (v4 != 1)
  {
LABEL_30:
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 1;
    return v5;
  }
LABEL_23:
  if (v5 < v4)
  {
    v14 = *(_OWORD *)(a4 + 16 * v5 + 32);
    if ((unint64_t)v14 <= a3 && *((_QWORD *)&v14 + 1) >= a2)
    {
      *(_OWORD *)result = *(_OWORD *)(a4 + 16 * v5 + 32);
      *(_BYTE *)(result + 16) = 0;
      return v5;
    }
    if (*((_QWORD *)&v14 + 1) < a2)
    {
      v9 = v5 + 1;
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 1;
      return v9;
    }
    goto LABEL_30;
  }
LABEL_36:
  __break(1u);
  return result;
}

void sub_1A02E15E0(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1A02E1768();
    v3 = v6;
  }
  v4 = *(_QWORD *)(v3 + 16);
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    sub_1A02E2248((char *)(v3 + 16 * a1 + 48), v4 - 1 - a1, (char *)(v3 + 16 * a1 + 32));
    *(_QWORD *)(v3 + 16) = v5;
    *v1 = v3;
  }
}

void sub_1A02E1668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v7, v10))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v7 + v10 > *(_QWORD *)(v6 + 24) >> 1)
  {
    sub_1A029ACB8();
    v6 = v13;
  }
  v14 = v6 + 32 + 16 * a1;
  if (!v10)
    goto LABEL_13;
  v15 = *(_QWORD *)(v6 + 16);
  if (__OFSUB__(v15, a2))
    goto LABEL_19;
  sub_1A02E2248((char *)(v6 + 32 + 16 * a2), v15 - a2, (char *)(v14 + 16));
  v16 = *(_QWORD *)(v6 + 16);
  v17 = __OFADD__(v16, v10);
  v18 = v16 + v10;
  if (!v17)
  {
    *(_QWORD *)(v6 + 16) = v18;
LABEL_13:
    *(_QWORD *)v14 = a3;
    *(_QWORD *)(v14 + 8) = a4;
    *v4 = v6;
    return;
  }
LABEL_20:
  __break(1u);
}

void sub_1A02E1768()
{
  sub_1A029ACB8();
}

uint64_t sub_1A02E177C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_value);

  if (!v2)
    return 0;
  v3 = sub_1A030728C();

  return v3;
}

uint64_t sub_1A02E17E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FD30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A02E1830()
{
  sub_1A0307D54();
  sub_1A0307838();
  sub_1A0307D54();
  return 0;
}

uint64_t destroy for SUTProcessor()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SUTProcessor(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SUTProcessor(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for SUTProcessor(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SUTProcessor(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 48))
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

uint64_t storeEnumTagSinglePayload for SUTProcessor(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SUTProcessor()
{
  return &type metadata for SUTProcessor;
}

uint64_t destroy for SUTProcessor.EventMetadata(uint64_t a1)
{
  return sub_1A02653E8(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

_QWORD *_s13SiriAnalytics12SUTProcessorV13EventMetadataVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  v4 = a2[2];
  sub_1A02652C0(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

_QWORD *assignWithCopy for SUTProcessor.EventMetadata(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a2[2];
  sub_1A02652C0(v3, v4);
  v5 = a1[1];
  v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_1A02653E8(v5, v6);
  return a1;
}

uint64_t assignWithTake for SUTProcessor.EventMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  sub_1A02653E8(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for SUTProcessor.EventMetadata(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      v2 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for SUTProcessor.EventMetadata(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SUTProcessor.EventMetadata()
{
  return &type metadata for SUTProcessor.EventMetadata;
}

uint64_t sub_1A02E1CB4()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_1A02E1CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_1A02E1D1C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A02E1D78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  return a1;
}

uint64_t type metadata accessor for ClosedRangeSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ClosedRangeSet);
}

uint64_t OUTLINED_FUNCTION_0_40()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_1_43()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_3_33()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_21()
{
  return sub_1A0307E20();
}

uint64_t OUTLINED_FUNCTION_6_29()
{
  return sub_1A0307E20();
}

uint64_t sub_1A02E1E30@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  if (!a2)
  {
    sub_1A0307838();
    sub_1A0307838();
    v12 = *(_QWORD *)(a5 + 16);
    if (v12)
    {
      v19 = a3;
      v20 = a4;
      v21 = a6;
      v22 = MEMORY[0x1E0DEE9D8];
      sub_1A02E3008();
      v13 = (uint64_t *)(a5 + 40);
      do
      {
        v14 = *(v13 - 1);
        v15 = *v13;
        v17 = *(_QWORD *)(v22 + 16);
        v16 = *(_QWORD *)(v22 + 24);
        swift_bridgeObjectRetain();
        if (v17 >= v16 >> 1)
          sub_1A02E3008();
        v13 += 3;
        *(_QWORD *)(v22 + 16) = v17 + 1;
        v18 = v22 + 16 * v17;
        *(_QWORD *)(v18 + 32) = v14;
        *(_QWORD *)(v18 + 40) = v15;
        --v12;
      }
      while (v12);
      a6 = v21;
      a3 = v19;
      a4 = v20;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B220);
    sub_1A0265304();
    sub_1A0307784();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A0307838();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 1601725545;
    a2 = 0xE400000000000000;
  }
  *(_QWORD *)a7 = result;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  *(_QWORD *)(a7 + 32) = a5;
  *(_BYTE *)(a7 + 40) = a6 & 1;
  return result;
}

uint64_t sub_1A02E1FF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 32);
  v11 = v1;
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v10 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1A02E3008();
    v3 = (uint64_t *)(v1 + 40);
    do
    {
      v5 = *(v3 - 1);
      v4 = *v3;
      v7 = *(_QWORD *)(v10 + 16);
      v6 = *(_QWORD *)(v10 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v6 >> 1)
        sub_1A02E3008();
      v3 += 3;
      *(_QWORD *)(v10 + 16) = v7 + 1;
      v8 = v10 + 16 * v7;
      *(_QWORD *)(v8 + 32) = v5;
      *(_QWORD *)(v8 + 40) = v4;
      --v2;
    }
    while (v2);
    sub_1A02E303C((uint64_t)&v11);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B220);
  sub_1A0265304();
  sub_1A0307784();
  swift_bridgeObjectRelease();
  sub_1A0307CAC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21_11();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_21_11();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  swift_bridgeObjectRetain();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  return 0x20455441455243;
}

uint64_t sub_1A02E2230()
{
  return sub_1A02E1FF4();
}

char *sub_1A02E2248(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

void sub_1A02E22A4(uint64_t a1, uint64_t a2)
{
  sub_1A02E259C(a1, a2);
}

char *sub_1A02E22B8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A0307DF0();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

char *sub_1A02E2340(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

char *sub_1A02E239C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[64 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

void sub_1A02E23F4(uint64_t a1, uint64_t a2)
{
  sub_1A02E259C(a1, a2);
}

char *sub_1A02E2400(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

char *sub_1A02E245C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

char *sub_1A02E24B4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[4 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

char *sub_1A02E250C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

void sub_1A02E256C(uint64_t a1, uint64_t a2)
{
  sub_1A02E263C(a1, a2);
}

void sub_1A02E2578(uint64_t a1, uint64_t a2)
{
  sub_1A02E263C(a1, a2);
}

void sub_1A02E2584(uint64_t a1, uint64_t a2)
{
  sub_1A02E263C(a1, a2);
}

void sub_1A02E2590(uint64_t a1, uint64_t a2)
{
  sub_1A02E263C(a1, a2);
}

void sub_1A02E259C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  char v6;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_24_12();
    if (v5 && (__swift_instantiateConcreteTypeFromMangledName(v4), OUTLINED_FUNCTION_27_11(), !v6 & v5))
    {
      if (v3 == v2)
      {
        OUTLINED_FUNCTION_75_1();
      }
      else
      {
        OUTLINED_FUNCTION_7_23();
        OUTLINED_FUNCTION_10_17();
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(v4);
      OUTLINED_FUNCTION_7_23();
      OUTLINED_FUNCTION_11_18();
    }
  }
}

void sub_1A02E2624(uint64_t a1, uint64_t a2)
{
  sub_1A02E263C(a1, a2);
}

void sub_1A02E2630(uint64_t a1, uint64_t a2)
{
  sub_1A02E263C(a1, a2);
}

void sub_1A02E263C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD);
  char v5;
  char v6;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_24_12();
    if (v5 && (v4(0), OUTLINED_FUNCTION_27_11(), !v6 & v5))
    {
      if (v3 == v2)
      {
        OUTLINED_FUNCTION_75_1();
      }
      else
      {
        OUTLINED_FUNCTION_7_23();
        OUTLINED_FUNCTION_10_17();
      }
    }
    else
    {
      v4(0);
      OUTLINED_FUNCTION_7_23();
      OUTLINED_FUNCTION_11_18();
    }
  }
}

char *sub_1A02E26C4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    result = (char *)OUTLINED_FUNCTION_1_44();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_2_36(a3, result);
  }
  return result;
}

char *sub_1A02E2724(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A0307DF0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_1A02E27A8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  char v3;
  char v4;
  BOOL v5;
  uint64_t result;

  OUTLINED_FUNCTION_16_12();
  if (v0 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    OUTLINED_FUNCTION_14_17();
    if (!v4 & v3)
      v5 = v2 > v1;
    else
      v5 = 0;
    if (!v5)
      return OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2830()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  OUTLINED_FUNCTION_16_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    if (v2 + 40 * v1 <= v0 || v0 + 40 * v1 <= v2)
      return OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E28C8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  char v3;
  char v4;
  BOOL v5;
  uint64_t result;

  OUTLINED_FUNCTION_16_12();
  if (v0 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    OUTLINED_FUNCTION_14_17();
    if (!v4 & v3)
      v5 = v2 > v1;
    else
      v5 = 0;
    if (!v5)
      return OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2950(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 48 * a2 <= a1 || a1 + 48 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_1A0307DF0();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2A20()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  OUTLINED_FUNCTION_16_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    if (v2 + 24 * v1 <= v0 || v0 + 24 * v1 <= v2)
      return OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2AB0()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  OUTLINED_FUNCTION_16_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    if (v2 + 8 * v1 <= v0 || v0 + 8 * v1 <= v2)
      return OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2B44(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  BOOL v4;
  BOOL v5;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    v3 = a1 + 8 * a2;
    if (a3 + 8 * a2 > a1)
    {
      v4 = v3 >= a3;
      v5 = v3 == a3;
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    if (v5 || !v4)
    {
      sub_1A0307508();
      OUTLINED_FUNCTION_28_12();
      return OUTLINED_FUNCTION_12_16();
    }
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

void *sub_1A02E2BE4(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    if (&__dst[4 * a2] <= __src || &__src[4 * a2] <= __dst)
      return memcpy(__dst, __src, 4 * a2);
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = (void *)OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2C7C()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;

  OUTLINED_FUNCTION_16_12();
  if (v3 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    if (v2 + 48 * v1 <= v0 || v0 + 48 * v1 <= v2)
      return OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2D14()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  char v3;
  char v4;
  BOOL v5;
  uint64_t result;

  OUTLINED_FUNCTION_16_12();
  if (v0 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    OUTLINED_FUNCTION_14_17();
    if (!v4 & v3)
      v5 = v2 > v1;
    else
      v5 = 0;
    if (!v5)
      return OUTLINED_FUNCTION_4_30();
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2D9C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE58F6D0) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_1A0307DF0();
  __break(1u);
  return result;
}

uint64_t sub_1A02E2E94(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_33_5();
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a4(0) - 8) + 72) * a2;
    v7 = a3 + v6;
    v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
    {
      OUTLINED_FUNCTION_28_12();
      return OUTLINED_FUNCTION_12_16();
    }
    OUTLINED_FUNCTION_0_18();
    OUTLINED_FUNCTION_32_5();
  }
  result = OUTLINED_FUNCTION_26_4();
  __break(1u);
  return result;
}

void *sub_1A02E2F40(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst))
    return memcpy(__dst, __src, 8 * a2);
  result = (void *)sub_1A0307DF0();
  __break(1u);
  return result;
}

void sub_1A02E3008()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1A02E382C();
  *v0 = v1;
}

uint64_t sub_1A02E303C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A02E3064(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1A02E3298(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

void sub_1A02E3080()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1A02E3518();
  *v0 = v1;
}

void sub_1A02E30B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1A02E3378(a1, a2, a3, *v3, &qword_1ED07AE78);
  *v3 = v4;
}

void sub_1A02E30E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1A02E3378(a1, a2, a3, *v3, &qword_1ED07AE88);
  *v3 = v4;
}

char *sub_1A02E310C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1A02E3438(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_1A02E3128()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1A02E3518();
  *v0 = v1;
}

void sub_1A02E315C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1A02E3714(a1, a2, a3, *v3, &qword_1ED07B288, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998]);
  *v3 = v4;
}

size_t sub_1A02E3188(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_1A02E35C0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

void sub_1A02E31A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1A02E3714(a1, a2, a3, *v3, &qword_1EE58E490, type metadata accessor for ComponentIdentifiersTable.Record);
  *v3 = v4;
}

void sub_1A02E31D0()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1A02E38D0();
  *v0 = v1;
}

void sub_1A02E3204()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1A02E382C();
  *v0 = v1;
}

void sub_1A02E3238()
{
  _QWORD *v0;
  uint64_t v1;

  sub_1A02E38D0();
  *v0 = v1;
}

void sub_1A02E326C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1A02E3714(a1, a2, a3, *v3, &qword_1EE58EEF8, (uint64_t (*)(_QWORD))type metadata accessor for IdentifiableTag);
  *v3 = v4;
}

uint64_t sub_1A02E3298(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  v5 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58F700);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    sub_1A02E2248((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A02E28C8();
  }
  swift_release();
  return v10;
}

void sub_1A02E3378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  char v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;

  v6 = a1;
  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_3_15();
    if (v8 != v9)
    {
      OUTLINED_FUNCTION_15_6();
      if (v8)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_16();
    }
  }
  else
  {
    v7 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v7 <= v10)
    v11 = *(_QWORD *)(a4 + 16);
  else
    v11 = v7;
  if (v11)
  {
    OUTLINED_FUNCTION_21_4(a1, a2, a3, a4, a5);
    v12 = OUTLINED_FUNCTION_12_2();
    v13 = _swift_stdlib_malloc_size((const void *)v12);
    *(_QWORD *)(v12 + 16) = v10;
    *(_QWORD *)(v12 + 24) = 2 * ((uint64_t)(v13 - 32) / 24);
  }
  else
  {
    v12 = MEMORY[0x1E0DEE9D8];
  }
  if ((v6 & 1) != 0)
  {
    sub_1A02E2340((char *)(a4 + 32), v10, (char *)(v12 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A02E2A20();
  }
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2_5();
}

char *sub_1A02E3438(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E6F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1A02E24B4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A02E2BE4(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_1A02E3518()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  void (*v2)(uint64_t);
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_15_14();
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_3_15();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_15_6();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_16();
    }
  }
  OUTLINED_FUNCTION_35_4();
  if (v5)
  {
    OUTLINED_FUNCTION_21_4(v9, v10, v11, v12, v13);
    v14 = (_QWORD *)OUTLINED_FUNCTION_12_2();
    v15 = _swift_stdlib_malloc_size(v14);
    v14[2] = v4;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 48);
  }
  v16 = OUTLINED_FUNCTION_22_9();
  if ((v3 & 1) != 0)
  {
    v2(v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v16);
  }
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_56_3();
}

size_t sub_1A02E35C0(size_t result, int64_t a2, char a3, uint64_t a4)
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FDC8);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE58F6D0) - 8);
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
  v15 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE58F6D0) - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_1A02E259C(v17, v8);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A02E2D9C(v17, v8, (unint64_t)v13 + v16);
  }
  swift_release();
  return (size_t)v13;
}

void sub_1A02E3714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  size_t v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v8 = a1;
  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_3_15();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_15_6();
      if (v10)
      {
LABEL_24:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_16();
    }
  }
  else
  {
    v9 = a2;
  }
  v12 = *(_QWORD *)(a4 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(a4 + 16);
  else
    v13 = v9;
  if (!v13)
  {
    v17 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_21_4(a1, a2, a3, a4, a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v17 = (_QWORD *)swift_allocObject();
  v18 = _swift_stdlib_malloc_size(v17);
  if (!v15)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v18 - v16 == 0x8000000000000000 && v15 == -1)
    goto LABEL_23;
  v17[2] = v12;
  v17[3] = 2 * ((uint64_t)(v18 - v16) / v15);
LABEL_18:
  v20 = *(unsigned __int8 *)(*(_QWORD *)(a6(0) - 8) + 80);
  v21 = (v20 + 32) & ~v20;
  v22 = a4 + v21;
  if ((v8 & 1) != 0)
  {
    sub_1A02E263C(v22, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A02E2E94(v22, v12, (unint64_t)v17 + v21, a6);
  }
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_56_3();
}

void sub_1A02E382C()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  void (*v2)(uint64_t);
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_15_14();
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_3_15();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_15_6();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_16();
    }
  }
  OUTLINED_FUNCTION_35_4();
  if (v5)
  {
    OUTLINED_FUNCTION_21_4(v9, v10, v11, v12, v13);
    v14 = (_QWORD *)OUTLINED_FUNCTION_12_2();
    v15 = _swift_stdlib_malloc_size(v14);
    v14[2] = v4;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 16);
  }
  v16 = OUTLINED_FUNCTION_22_9();
  if ((v3 & 1) != 0)
  {
    v2(v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v16);
  }
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2_5();
}

void sub_1A02E38D0()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  void (*v2)(uint64_t);
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  size_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_15_14();
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_3_15();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_15_6();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_2_16();
    }
  }
  OUTLINED_FUNCTION_35_4();
  if (v5)
  {
    OUTLINED_FUNCTION_21_4(v9, v10, v11, v12, v13);
    v14 = (_QWORD *)OUTLINED_FUNCTION_12_2();
    v15 = _swift_stdlib_malloc_size(v14);
    v14[2] = v4;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 8);
  }
  v16 = OUTLINED_FUNCTION_22_9();
  if ((v3 & 1) != 0)
  {
    v2(v16);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    v1(v16);
  }
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2_5();
}

uint64_t destroy for SQLCreateIndex()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLCreateIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SQLCreateIndex(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for SQLCreateIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLCreateIndex(uint64_t a1, int a2)
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
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for SQLCreateIndex(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLCreateIndex()
{
  return &type metadata for SQLCreateIndex;
}

uint64_t OUTLINED_FUNCTION_1_44()
{
  return sub_1A0307DF0();
}

void *OUTLINED_FUNCTION_2_36@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_4_30()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_7_23()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_17()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t OUTLINED_FUNCTION_11_18()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t OUTLINED_FUNCTION_12_16()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_21_11()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_22_9()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_28_12()
{
  uint64_t v0;

  return v0;
}

unint64_t static UnifiedMessageStreamHelper.identifier()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v7;

  type metadata accessor for ResourceType(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A030725C();
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_6_27();
  type metadata accessor for PersistentStorage();
  OUTLINED_FUNCTION_19_1();
  sub_1A02D8278();
  v5 = sub_1A02AD2A4(v0);
  sub_1A02AD394((uint64_t)v3);

  sub_1A0274BB4((uint64_t)v3);
  return 0xD000000000000014;
}

uint64_t static UnifiedMessageStreamHelper.ensureDirectoryExists(at:)()
{
  uint64_t result;

  type metadata accessor for PersistentStorage();
  result = sub_1A02D7C94();
  if ((result & 1) == 0)
  {
    if (qword_1ED07D488 != -1)
      swift_once();
    sub_1A0307CAC();
    swift_bridgeObjectRelease();
    sub_1A03071D8();
    sub_1A0307838();
    swift_bridgeObjectRelease();
    sub_1A0307838();
    sub_1A02B97F8(0x726F746365726944, 0xEA00000000002079, 0xD000000000000079, 0x80000001A0310DF0, 0xD00000000000001ALL, 0x80000001A0310E70);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t static UnifiedMessageStreamHelper.fileURL()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;

  type metadata accessor for ResourceType(0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_6_27();
  sub_1A030725C();
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PersistentStorage();
  OUTLINED_FUNCTION_19_1();
  sub_1A02D8278();
  v7 = sub_1A02AD2A4((uint64_t)v6);
  sub_1A02AD394(v1);

  sub_1A02A9960(a1);
  return sub_1A0274BB4(v1);
}

id UnifiedMessageStreamHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UnifiedMessageStreamHelper.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnifiedMessageStreamHelper();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for UnifiedMessageStreamHelper()
{
  return objc_opt_self();
}

id UnifiedMessageStreamHelper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UnifiedMessageStreamHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1A02E4158(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = a1;
    v31 = MEMORY[0x1E0DEE9D8];
    sub_1A02E3008();
    v4 = v31;
    v5 = sub_1A02904BC(v3);
    if ((v5 & 0x8000000000000000) == 0)
    {
      v7 = v5;
      if (v5 < 1 << *(_BYTE *)(v3 + 32))
      {
        v8 = v3 + 64;
        v23 = v3 + 64;
        v24 = v3;
        while ((*(_QWORD *)(v8 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
        {
          if (v6 != *(_DWORD *)(v3 + 36))
            goto LABEL_21;
          v26 = v2;
          v27 = v6;
          v9 = *(_QWORD *)(v3 + 48) + 24 * v7;
          v10 = *(_QWORD *)(v9 + 8);
          v28 = *(_QWORD *)v9;
          v30 = v4;
          v11 = *(unsigned __int8 *)(v9 + 16);
          v12 = *(unsigned __int8 *)(v9 + 17);
          v13 = *(_QWORD *)(v3 + 56) + 24 * v7;
          v15 = *(_QWORD *)v13;
          v14 = *(_QWORD *)(v13 + 8);
          v16 = *(unsigned __int8 *)(v13 + 16);
          swift_bridgeObjectRetain();
          sub_1A02652A0(v15, v14, v16);
          swift_bridgeObjectRetain();
          sub_1A02652A0(v15, v14, v16);
          swift_bridgeObjectRelease();
          sub_1A02653C8(v15, v14, v16);
          if (v12)
            v17 = 256;
          else
            v17 = 0;
          v4 = v30;
          v29 = a2(v28, v10, v17 | v11, v15, v14, v16);
          v19 = v18;
          swift_bridgeObjectRelease();
          sub_1A02653C8(v15, v14, v16);
          v20 = *(_QWORD *)(v30 + 16);
          if (v20 >= *(_QWORD *)(v30 + 24) >> 1)
          {
            sub_1A02E3008();
            v4 = v30;
          }
          *(_QWORD *)(v4 + 16) = v20 + 1;
          v21 = v4 + 16 * v20;
          *(_QWORD *)(v21 + 32) = v29;
          *(_QWORD *)(v21 + 40) = v19;
          v3 = v24;
          if ((uint64_t)v7 >= -(-1 << *(_BYTE *)(v24 + 32)))
            goto LABEL_22;
          v8 = v23;
          if ((*(_QWORD *)(v23 + 8 * (v7 >> 6)) & (1 << v7)) == 0)
            goto LABEL_23;
          if (v27 != *(_DWORD *)(v24 + 36))
            goto LABEL_24;
          v22 = sub_1A0307C10();
          v2 = v26 - 1;
          if (v26 == 1)
            return;
          v7 = v22;
          if ((v22 & 0x8000000000000000) == 0)
          {
            v6 = *(_DWORD *)(v24 + 36);
            if (v22 < 1 << *(_BYTE *)(v24 + 32))
              continue;
          }
          goto LABEL_25;
        }
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
    }
LABEL_25:
    __break(1u);
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1A02E43C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  sub_1A02E4158(a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, unint64_t, uint64_t))sub_1A02E46A8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_1A02E445C()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B220);
  sub_1A0265304();
  sub_1A0307784();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return 542393683;
}

uint64_t sub_1A02E451C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  if (a6 == 4 && (a5 | a4) == 0)
  {
    v18 = a1;
    swift_bridgeObjectRetain();
    sub_1A0307838();
  }
  else
  {
    sub_1A0307838();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A0307838();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A02652A0(a4, a5, a6);
    sub_1A029A504();
    v14 = *(_QWORD *)(*(_QWORD *)(a9 + 24) + 16);
    sub_1A029A6B4(v14);
    v15 = *(_QWORD *)(a9 + 24);
    *(_QWORD *)(v15 + 16) = v14 + 1;
    v16 = v15 + 40 * v14;
    *(_QWORD *)(v16 + 32) = 64;
    *(_QWORD *)(v16 + 40) = 0xE100000000000000;
    *(_QWORD *)(v16 + 48) = a4;
    *(_QWORD *)(v16 + 56) = a5;
    *(_BYTE *)(v16 + 64) = a6;
    v18 = a1;
    swift_bridgeObjectRetain();
    sub_1A0307838();
    sub_1A0307838();
    swift_bridgeObjectRelease();
  }
  return v18;
}

uint64_t sub_1A02E46A8(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t *v6;

  return sub_1A02E451C(a1, a2, a3 & 0x1FF, a4, a5, a6, v6[2], v6[3], v6[4]);
}

uint64_t sub_1A02E46D4()
{
  return sub_1A02E445C();
}

uint64_t destroy for SQLSetValue(uint64_t result)
{
  if ((*(_BYTE *)(result + 32) & 0x78) == 0)
    return sub_1A02AEDE0(*(_QWORD *)result, *(_QWORD *)(result + 8), *(_QWORD *)(result + 16), *(_QWORD *)(result + 24), *(_BYTE *)(result + 32));
  return result;
}

uint64_t initializeWithCopy for SQLSetValue(uint64_t a1, uint64_t *a2)
{
  char v3;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *((_BYTE *)a2 + 32);
  if ((v3 & 0x78) != 0)
  {
    v4 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  }
  else
  {
    v5 = *a2;
    v6 = a2[1];
    v7 = a2[2];
    v8 = a2[3];
    sub_1A02AED80(*a2, v6, v7, v8, v3);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v8;
    *(_BYTE *)(a1 + 32) = v3;
  }
  return a1;
}

uint64_t assignWithCopy for SQLSetValue(uint64_t a1, __int128 *a2)
{
  char v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;

  v4 = *((_BYTE *)a2 + 32);
  if ((*(_BYTE *)(a1 + 32) & 0x78) == 0)
  {
    if ((v4 & 0x78) == 0)
    {
      v12 = *(_QWORD *)a2;
      v13 = *((_QWORD *)a2 + 1);
      v15 = *((_QWORD *)a2 + 2);
      v14 = *((_QWORD *)a2 + 3);
      sub_1A02AED80(*(_QWORD *)a2, v13, v15, v14, v4);
      v16 = *(_QWORD *)a1;
      v17 = *(_QWORD *)(a1 + 8);
      v18 = *(_QWORD *)(a1 + 16);
      v19 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)a1 = v12;
      *(_QWORD *)(a1 + 8) = v13;
      *(_QWORD *)(a1 + 16) = v15;
      *(_QWORD *)(a1 + 24) = v14;
      v20 = *(_BYTE *)(a1 + 32);
      *(_BYTE *)(a1 + 32) = v4;
      sub_1A02AEDE0(v16, v17, v18, v19, v20);
      return a1;
    }
    sub_1A02AEDE0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
    goto LABEL_6;
  }
  if ((v4 & 0x78) != 0)
  {
LABEL_6:
    v9 = *a2;
    v10 = a2[1];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_OWORD *)a1 = v9;
    *(_OWORD *)(a1 + 16) = v10;
    return a1;
  }
  v5 = *(_QWORD *)a2;
  v6 = *((_QWORD *)a2 + 1);
  v8 = *((_QWORD *)a2 + 2);
  v7 = *((_QWORD *)a2 + 3);
  sub_1A02AED80(*(_QWORD *)a2, v6, v8, v7, v4);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v4;
  return a1;
}

uint64_t assignWithTake for SQLSetValue(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;
  __int128 v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;

  v4 = *(_BYTE *)(a1 + 32);
  if ((v4 & 0x78) == 0)
  {
    v5 = *(_BYTE *)(a2 + 32);
    if ((v5 & 0x78) == 0)
    {
      v8 = *(_QWORD *)a1;
      v9 = *(_QWORD *)(a1 + 8);
      v10 = *(_QWORD *)(a1 + 16);
      v11 = *(_QWORD *)(a1 + 24);
      v12 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v12;
      *(_BYTE *)(a1 + 32) = v5;
      sub_1A02AEDE0(v8, v9, v10, v11, v4);
      return a1;
    }
    sub_1A02AEDE0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v4);
  }
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLSetValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x1E && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 30);
  v3 = ((*(unsigned __int8 *)(a1 + 32) >> 2) & 0x1E | (*(unsigned __int8 *)(a1 + 32) >> 7)) ^ 0x1F;
  if (v3 >= 0x1E)
    v3 = -1;
  if (v3 + 1 >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SQLSetValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1D)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 30;
    if (a3 >= 0x1E)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x1E)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
    {
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_BYTE *)(result + 32) = (4 * (a2 ^ 0x1F)) & 0xF8 | ((a2 ^ 0x1F) << 7);
    }
  }
  return result;
}

uint64_t sub_1A02E497C(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 32);
  if (((v1 >> 2) & 0x1E) != 0)
    return 32 - ((v1 >> 2) & 0x1E | (v1 >> 7));
  else
    return 0;
}

uint64_t sub_1A02E49A0(uint64_t result, unsigned int a2)
{
  if (a2 > 0x1E)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 31;
    *(_QWORD *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_BYTE *)(result + 32) = 8 * (((-a2 >> 1) & 0xF) - 16 * a2);
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLSetValue()
{
  return &type metadata for SQLSetValue;
}

uint64_t destroy for SQLSetters()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SQLSetters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SQLSetters(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for SQLSetters(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLSetters(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for SQLSetters(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLSetters()
{
  return &type metadata for SQLSetters;
}

#error "1A02E4BF8: call analysis failed (funcsize=21)"

uint64_t MonotonicTimestamp.MonotonicClockType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

SiriAnalytics::MonotonicTimestamp::MonotonicClockType_optional __swiftcall MonotonicTimestamp.MonotonicClockType.init(rawValue:)(SiriAnalytics::MonotonicTimestamp::MonotonicClockType_optional rawValue)
{
  char *v1;
  char v2;

  if (rawValue.value == SiriAnalytics_MonotonicTimestamp_MonotonicClockType_continuous)
    v2 = 1;
  else
    v2 = 2;
  if (rawValue.value == SiriAnalytics_MonotonicTimestamp_MonotonicClockType_suspending)
    v2 = 0;
  *v1 = v2;
  return rawValue;
}

void MonotonicTimestamp.init(bootSessionUUID:nanoSecondsSinceBoot:clockType:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_1_20();
  v8 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_9_16();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_31_5();
  sub_1A027AFF0(a1, v2);
  OUTLINED_FUNCTION_20_8(v2);
  if (v10)
  {
    if (qword_1EE58E640 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v8, (uint64_t)qword_1EE590358);
    OUTLINED_FUNCTION_29_4(v3, v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
    sub_1A0264214(a1);
    OUTLINED_FUNCTION_16_13();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(a2, v3, v8);
  }
  else
  {
    sub_1A0264214(a1);
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
    v12(v3, v2, v8);
    v12(a2, v3, v8);
  }
  v13 = OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_18_11(v13);
  OUTLINED_FUNCTION_56_3();
}

uint64_t type metadata accessor for MonotonicTimestamp()
{
  uint64_t result;

  result = qword_1ED07C0F8;
  if (!qword_1ED07C0F8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1A02E4DA8(unint64_t result)
{
  unint64_t v1;

  v1 = result;
  if (result == -1)
    return v1;
  if (qword_1EE58EFE0 != -1)
    result = swift_once();
  if ((_DWORD)qword_1EE58FDD0 == HIDWORD(qword_1EE58FDD0))
    return v1;
  if (!is_mul_ok(v1, qword_1EE58FDD0))
    return -1;
  if (HIDWORD(qword_1EE58FDD0))
    return v1 * qword_1EE58FDD0 / HIDWORD(qword_1EE58FDD0);
  __break(1u);
  return result;
}

void sub_1A02E4E30()
{
  sub_1A0263F3C();
}

void sub_1A02E4E38()
{
  sub_1A0298458();
}

void sub_1A02E4E40()
{
  sub_1A0298658();
}

SiriAnalytics::MonotonicTimestamp::MonotonicClockType_optional sub_1A02E4E48(Swift::UInt8 *a1)
{
  return MonotonicTimestamp.MonotonicClockType.init(rawValue:)(*a1);
}

uint64_t sub_1A02E4E50@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = MonotonicTimestamp.MonotonicClockType.rawValue.getter();
  *a1 = result;
  return result;
}

void MonotonicTimestamp.init(cpuTicks:clockType:)()
{
  char *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
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
  char *v17;
  uint64_t v18;
  char *v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_4_3();
  v3 = v2;
  v5 = v4;
  v26 = v6;
  v7 = OUTLINED_FUNCTION_9();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_19_5();
  v9 = OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_1_20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v25 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v25 - v18;
  v20 = *v3;
  __swift_storeEnumTagSinglePayload((uint64_t)&v25 - v18, 1, 1, v7);
  v21 = sub_1A02E4DA8(v5);
  sub_1A027AFF0((uint64_t)v19, (uint64_t)v17);
  sub_1A027AFF0((uint64_t)v17, (uint64_t)v14);
  OUTLINED_FUNCTION_15_15((uint64_t)v14);
  if (v22)
  {
    if (qword_1EE58E640 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v7, (uint64_t)qword_1EE590358);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v0, v23, v7);
    sub_1A0264214((uint64_t)v17);
    sub_1A0264214((uint64_t)v14);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v1, v0, v7);
  }
  else
  {
    sub_1A0264214((uint64_t)v17);
    v24 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v24(v0, v14, v7);
    v24((char *)v1, v0, v7);
  }
  *(_QWORD *)(v1 + *(int *)(v9 + 20)) = v21;
  *(_BYTE *)(v1 + *(int *)(v9 + 24)) = v20;
  sub_1A0291970(v1, v26);
  OUTLINED_FUNCTION_6_30();
  OUTLINED_FUNCTION_18();
}

void MonotonicTimestamp.init(bootSessionUUID:cpuTicks:clockType:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
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
  char *v16;
  uint64_t v17;
  char *v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  void (*v23)(uint64_t, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_4_3();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v25 = v8;
  v9 = OUTLINED_FUNCTION_9();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_54_4();
  v11 = OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_31_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v24 - v17;
  v19 = *v3;
  v20 = sub_1A02E4DA8(v5);
  sub_1A027AFF0(v7, (uint64_t)v18);
  sub_1A027AFF0((uint64_t)v18, (uint64_t)v16);
  OUTLINED_FUNCTION_20_8((uint64_t)v16);
  if (v21)
  {
    if (qword_1EE58E640 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v9, (uint64_t)qword_1EE590358);
    OUTLINED_FUNCTION_29_4(v0, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    sub_1A0264214((uint64_t)v18);
    sub_1A0264214((uint64_t)v16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v1, v0, v9);
  }
  else
  {
    sub_1A0264214((uint64_t)v18);
    v23 = *(void (**)(uint64_t, char *, uint64_t))(v10 + 32);
    v23(v0, v16, v9);
    v23(v1, (char *)v0, v9);
  }
  *(_QWORD *)(v1 + *(int *)(v11 + 20)) = v20;
  *(_BYTE *)(v1 + *(int *)(v11 + 24)) = v19;
  sub_1A0291970(v1, v25);
  sub_1A0264214(v7);
  OUTLINED_FUNCTION_18();
}

void MonotonicTimestamp.init(nanoSecondsSinceBoot:clockType:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v5 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_9_16();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_54_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_14_16();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - v9;
  __swift_storeEnumTagSinglePayload((uint64_t)&v15 - v9, 1, 1, v5);
  sub_1A027AFF0((uint64_t)v10, v2);
  OUTLINED_FUNCTION_20_8(v2);
  if (v11)
  {
    if (qword_1EE58E640 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v5, (uint64_t)qword_1EE590358);
    OUTLINED_FUNCTION_29_4(v1, v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
    OUTLINED_FUNCTION_6_30();
    OUTLINED_FUNCTION_16_13();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, v1, v5);
  }
  else
  {
    OUTLINED_FUNCTION_6_30();
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
    v13(v1, v2, v5);
    v13(a1, v1, v5);
  }
  v14 = OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_18_11(v14);
  OUTLINED_FUNCTION_56_3();
}

double sub_1A02E5320()
{
  double result;
  mach_timebase_info v1[2];

  v1[1] = *(mach_timebase_info *)MEMORY[0x1E0C80C00];
  v1[0] = (mach_timebase_info)0x100000001;
  mach_timebase_info(v1);
  result = *(double *)v1;
  qword_1EE58FDD0 = (uint64_t)v1[0];
  return result;
}

void static MonotonicTimestamp.now(forClock:)(_BYTE *a1)
{
  if ((*a1 & 1) != 0)
    mach_continuous_time();
  else
    mach_absolute_time();
  MonotonicTimestamp.init(cpuTicks:clockType:)();
}

void static MonotonicTimestamp.+ infix(_:_:)()
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

  OUTLINED_FUNCTION_4_3();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_9_16();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_19_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14_16();
  MEMORY[0x1E0C80A78](v7);
  if (__CFADD__(*(_QWORD *)(v3 + *(int *)(OUTLINED_FUNCTION_8_16() + 20)), v1))
  {
    __break(1u);
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_7_24();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_15_15(v0);
  if (v8)
  {
    if (qword_1EE58E640 == -1)
    {
LABEL_5:
      v9 = __swift_project_value_buffer(v4, (uint64_t)qword_1EE590358);
      OUTLINED_FUNCTION_13_19(v9);
      OUTLINED_FUNCTION_6_30();
      OUTLINED_FUNCTION_16_13();
      goto LABEL_6;
    }
LABEL_8:
    swift_once();
    goto LABEL_5;
  }
  OUTLINED_FUNCTION_6_30();
  OUTLINED_FUNCTION_12_17();
LABEL_6:
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_23_11();
  OUTLINED_FUNCTION_18();
}

void static MonotonicTimestamp.- infix(_:_:)()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  OUTLINED_FUNCTION_4_3();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_9_16();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_19_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14_16();
  MEMORY[0x1E0C80A78](v7);
  if (*(_QWORD *)(v3 + *(int *)(OUTLINED_FUNCTION_8_16() + 20)) < v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_7_24();
  OUTLINED_FUNCTION_5_22();
  OUTLINED_FUNCTION_15_15(v0);
  if (v8)
  {
    if (qword_1EE58E640 == -1)
    {
LABEL_6:
      v9 = __swift_project_value_buffer(v4, (uint64_t)qword_1EE590358);
      OUTLINED_FUNCTION_13_19(v9);
      OUTLINED_FUNCTION_6_30();
      OUTLINED_FUNCTION_16_13();
      goto LABEL_7;
    }
LABEL_8:
    swift_once();
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_6_30();
  OUTLINED_FUNCTION_12_17();
LABEL_7:
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_23_11();
  OUTLINED_FUNCTION_18();
}

uint64_t MonotonicInterval.init(seconds:minutes:hours:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v4 = 1000000000 * result;
  if ((result & 0x100000000) != 0)
    v4 = 0;
  if ((a2 & 0x100000000) == 0)
  {
    if (is_mul_ok(60 * a2, 0x3B9ACA00uLL))
    {
      v5 = __CFADD__(v4, 60000000000 * a2);
      v4 += 60000000000 * a2;
      if (!v5)
        goto LABEL_6;
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
LABEL_6:
  if ((a3 & 0x100) != 0
    || (v6 = 3600000000000 * a3, v5 = __CFADD__(v4, v6), v4 += v6, !v5))
  {
    *a4 = v4;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1A02E5640()
{
  unint64_t result;

  result = qword_1EE58FDD8;
  if (!qword_1EE58FDD8)
  {
    result = MEMORY[0x1A1AF7D34](&protocol conformance descriptor for MonotonicTimestamp.MonotonicClockType, &type metadata for MonotonicTimestamp.MonotonicClockType);
    atomic_store(result, (unint64_t *)&qword_1EE58FDD8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for MonotonicTimestamp(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1A0307334();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
  }
  return a1;
}

uint64_t initializeWithCopy for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1A0307334();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithCopy for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1A0307334();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1A0307334();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for MonotonicTimestamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1A0307334();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for MonotonicTimestamp()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A02E58AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v8 >= 2)
    return v8 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MonotonicTimestamp()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A02E5928(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_9();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_1A02E5998()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A0307334();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MonotonicTimestamp.MonotonicClockType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A02E5A64 + 4 * byte_1A0318B85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A02E5A98 + 4 * byte_1A0318B80[v4]))();
}

uint64_t sub_1A02E5A98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A02E5AA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A02E5AA8);
  return result;
}

uint64_t sub_1A02E5AB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A02E5ABCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A02E5AC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A02E5AC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MonotonicTimestamp.MonotonicClockType()
{
  return &type metadata for MonotonicTimestamp.MonotonicClockType;
}

ValueMetadata *type metadata accessor for MonotonicInterval()
{
  return &type metadata for MonotonicInterval;
}

uint64_t OUTLINED_FUNCTION_5_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(v2, 0, 1, v0);
  return sub_1A027AFF0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_6_30()
{
  uint64_t v0;

  return sub_1A0264214(v0);
}

uint64_t OUTLINED_FUNCTION_7_24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_8_16()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t OUTLINED_FUNCTION_10_18()
{
  return type metadata accessor for MonotonicTimestamp();
}

uint64_t OUTLINED_FUNCTION_12_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_13_19(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, a1, v1);
}

uint64_t OUTLINED_FUNCTION_15_15(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_16_13()
{
  uint64_t v0;

  return sub_1A0264214(v0);
}

uint64_t OUTLINED_FUNCTION_18_11(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  *(_QWORD *)(v1 + *(int *)(result + 20)) = v2;
  *(_BYTE *)(v1 + *(int *)(result + 24)) = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v2, v1);
}

void OUTLINED_FUNCTION_23_11()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  *(_QWORD *)(v0 + *(int *)(v1 + 20)) = v3;
  *(_BYTE *)(v0 + *(int *)(v1 + 24)) = v2;
}

_QWORD *sub_1A02E5C00(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PersistentIdentifiersDataCollectionPolicy(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for PersistentIdentifiersDataCollectionPolicy(_OWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PersistentIdentifiersDataCollectionPolicy()
{
  return &type metadata for PersistentIdentifiersDataCollectionPolicy;
}

id sub_1A02E5CDC(void *a1)
{
  uint64_t v3;

  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_removePersistentIdentifiers) & 1) != 0)
    return objc_msgSend(a1, sel_removePersistentIdentifiers);
  if (qword_1EE58E400 != -1)
    swift_once();
  v3 = sub_1A02B9764();
  sub_1A02B9C04(0xD000000000000083, 0x80000001A0310EC0, 0xD00000000000001BLL, 0x80000001A0310FD0, v3);
  swift_release();
  return 0;
}

uint64_t sub_1A02E5DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1A02E5DBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  if ((sub_1A02E5CDC(*(void **)(v0 + 24)) & 1) != 0)
  {
    if (qword_1EE58E400 != -1)
      swift_once();
    v1 = *(_QWORD *)(v0 + 16);
    sub_1A02B9764();
    v2 = OUTLINED_FUNCTION_0_30();
    *(_QWORD *)(v2 + 16) = v1;
    sub_1A02B9C4C(0xD000000000000083, 0x80000001A0310EC0, 0xD000000000000026, 0x80000001A030F0A0, sub_1A02E61E8, v2);
    swift_release();
    swift_task_dealloc();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E500);
    sub_1A02902C8();
    sub_1A0307904();
    return swift_task_switch();
  }
  else
  {
    if (qword_1EE58E400 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 16);
    sub_1A02B9764();
    v5 = OUTLINED_FUNCTION_0_30();
    *(_QWORD *)(v5 + 16) = v4;
    sub_1A02B9C4C(0xD000000000000083, 0x80000001A0310EC0, 0xD000000000000026, 0x80000001A030F0A0, sub_1A02E61B4, v5);
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1A02E5F74()
{
  uint64_t v0;

  sub_1A02E5FB0(*(_QWORD *)(v0 + 32) + 24, 8, 0xA000000000000008);
  return OUTLINED_FUNCTION_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1A02E5FB0(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  int v14;
  unint64_t v15;
  ValueMetadata *v16;
  _UNKNOWN **v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v13 - v9;
  v11 = sub_1A0307334();
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v11);
  v16 = &type metadata for SensitiveConditionTag;
  v17 = &protocol witness table for SensitiveConditionTag;
  v14 = a2;
  v15 = a3;
  sub_1A027B840(a3);
  sub_1A02DC674();
  sub_1A0264214((uint64_t)v8);
  sub_1A0264214((uint64_t)v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
}

uint64_t sub_1A02E60BC()
{
  sub_1A0307CAC();
  sub_1A0307838();
  sub_1A0307334();
  sub_1A02BAFE4();
  sub_1A0307E20();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1A02E6154(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1A0277CBC;
  return sub_1A02E5DA0(a1, v5, v4);
}

uint64_t sub_1A02E61B4()
{
  return sub_1A02E60BC();
}

uint64_t sub_1A02E61E8()
{
  return sub_1A02E60BC();
}

_QWORD *sub_1A02E621C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = MEMORY[0x1E0DEE9D8];
  v1[3] = 0;
  v1[4] = v2;
  v1[2] = a1;
  return v1;
}

uint64_t sub_1A02E6234()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  if (*(_QWORD *)(v0 + 24))
    return 1;
  v1 = v0;
  v2 = *(void **)(v0 + 16);
  v3 = OUTLINED_FUNCTION_12_2();
  swift_weakInit();
  type metadata accessor for DarwinNotificationObserver();
  OUTLINED_FUNCTION_12_2();
  *(_QWORD *)(v1 + 24) = sub_1A02DF7F4(0xD000000000000029, 0x80000001A0311060, v2, (uint64_t)sub_1A02E6A28, v3);
  swift_release();
  if (*(_QWORD *)(v1 + 24))
    return 1;
  if (qword_1EE58E400 != -1)
    swift_once();
  sub_1A02B97F8(0xD000000000000035, 0x80000001A0311090, 0xD00000000000007CLL, 0x80000001A03110D0, 0xD000000000000010, 0x80000001A0311150);
  return 0;
}

uint64_t sub_1A02E6370()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A02E64D0();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A02E63C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = sub_1A02E6234();
  if ((v5 & 1) != 0)
  {
    v6 = OUTLINED_FUNCTION_12_2();
    *(_QWORD *)(v6 + 16) = a1;
    *(_QWORD *)(v6 + 24) = a2;
    OUTLINED_FUNCTION_0_8();
    swift_retain();
    sub_1A029A644();
    v7 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 16);
    sub_1A029A7C0();
    v8 = *(_QWORD *)(v2 + 32);
    *(_QWORD *)(v8 + 16) = v7 + 1;
    v9 = v8 + 16 * v7;
    *(_QWORD *)(v9 + 32) = &unk_1EE58FE10;
    *(_QWORD *)(v9 + 40) = v6;
    swift_endAccess();
  }
  return v5 & 1;
}

uint64_t sub_1A02E647C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_1A028362C;
  return v5();
}

uint64_t sub_1A02E64D0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07DBE0);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1A030794C();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 1, 1, v3);
  v4 = OUTLINED_FUNCTION_12_2();
  swift_weakInit();
  v5 = (_QWORD *)OUTLINED_FUNCTION_12_2();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v4;
  sub_1A0282E8C((uint64_t)v2, (uint64_t)aK, (uint64_t)v5);
  swift_release();
  return sub_1A0276D14((uint64_t)v2);
}

uint64_t sub_1A02E65A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 40) = a1;
  *(_QWORD *)(v4 + 48) = a4;
  return swift_task_switch();
}

uint64_t sub_1A02E65B8()
{
  uint64_t v0;
  uint64_t Strong;
  _QWORD *v2;

  OUTLINED_FUNCTION_0_8();
  Strong = swift_weakLoadStrong();
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_1A02E6640;
    return sub_1A02E6690();
  }
  else
  {
    **(_BYTE **)(v0 + 40) = 1;
    return OUTLINED_FUNCTION_16(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1A02E6640()
{
  OUTLINED_FUNCTION_1_15();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1A02E6690()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[5] = v0;
  type metadata accessor for UserHistoryDeletionRequestObserver();
  sub_1A02BB8E8();
  v1[6] = sub_1A0307904();
  v1[7] = v2;
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1A02E66E0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v1 = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_0_8();
  v2 = *(_QWORD **)(v1 + 32);
  *(_QWORD *)(v0 + 64) = v2;
  v3 = v2[2];
  *(_QWORD *)(v0 + 72) = v3;
  if (!v3)
    return OUTLINED_FUNCTION_6_17(*(uint64_t (**)(void))(v0 + 8));
  *(_QWORD *)(v0 + 80) = 0;
  v4 = (int *)v2[4];
  *(_QWORD *)(v0 + 88) = v2[5];
  v7 = (uint64_t (*)(void))((char *)v4 + *v4);
  swift_retain();
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v5;
  *v5 = v0;
  v5[1] = sub_1A02E678C;
  return OUTLINED_FUNCTION_6_17(v7);
}

uint64_t sub_1A02E678C()
{
  swift_task_dealloc();
  swift_release();
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1A02E67D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v1 = *(_QWORD *)(v0 + 80) + 1;
  if (v1 == *(_QWORD *)(v0 + 72))
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_6_17(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    *(_QWORD *)(v0 + 80) = v1;
    v2 = *(_QWORD *)(v0 + 64) + 16 * v1;
    v3 = *(int **)(v2 + 32);
    *(_QWORD *)(v0 + 88) = *(_QWORD *)(v2 + 40);
    v6 = (uint64_t (*)(void))((char *)v3 + *v3);
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v4;
    *v4 = v0;
    v4[1] = sub_1A02E678C;
    return OUTLINED_FUNCTION_6_17(v6);
  }
}

uint64_t sub_1A02E686C()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A02E6898()
{
  sub_1A02E686C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UserHistoryDeletionRequestObserver()
{
  return objc_opt_self();
}

uint64_t sub_1A02E68D8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A02E68FC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A02E6928(uint64_t a1)
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
  v7[1] = sub_1A0282D74;
  return sub_1A02E65A0(a1, v4, v5, v6);
}

uint64_t sub_1A02E6994()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A02E69B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A028362C;
  return ((uint64_t (*)(uint64_t, int *))&aTf[*(int *)aTf])(a1, v4);
}

uint64_t sub_1A02E6A28()
{
  return sub_1A02E6370();
}

uint64_t sub_1A02E6A34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  int v24;
  int EnumTagSinglePayload;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  char v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  char v37;
  char *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v49 - v6;
  v8 = sub_1A0307334();
  v56 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v55 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v53 = (char *)&v49 - v11;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
    return MEMORY[0x1E0DEE9E0];
  v51 = v5;
  swift_bridgeObjectRetain();
  v13 = 0;
  v52 = v2;
  v14 = MEMORY[0x1E0DEE9E0];
  v57 = 0x80000001A030A980;
  v50 = a1;
  v54 = v12;
  while (1)
  {
    v15 = *(_QWORD *)(a1 + 8 * v13 + 32);
    v16 = *(_QWORD *)(v15 + 16);
    swift_bridgeObjectRetain();
    if (!v16 || (v17 = sub_1A02A26F8(0xD000000000000011, v57), (v18 & 1) == 0))
    {
LABEL_12:
      OUTLINED_FUNCTION_4_9((uint64_t)v7);
LABEL_13:
      OUTLINED_FUNCTION_4();
      sub_1A0264214((uint64_t)v7);
      goto LABEL_14;
    }
    v19 = *(_QWORD *)(v15 + 56) + 24 * v17;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(unsigned __int8 *)(v19 + 16);
    if (*(_BYTE *)(v19 + 16))
    {
      if (v22 == 3)
      {
        sub_1A02652C0(*(_QWORD *)v19, *(_QWORD *)(v19 + 8));
        OUTLINED_FUNCTION_47_8();
        sub_1A0307274();
      }
      else
      {
        if (v22 == 4 && (v21 | v20) == 0)
          goto LABEL_12;
        OUTLINED_FUNCTION_4_9((uint64_t)v51);
        sub_1A02652A0(v20, v21, v22);
      }
    }
    else
    {
      OUTLINED_FUNCTION_43_8();
      OUTLINED_FUNCTION_47_8();
      sub_1A03072E0();
    }
    v24 = swift_dynamicCast();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, v24 ^ 1u, 1, v8);
    sub_1A02653C8(v20, v21, v22);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8);
    v12 = v54;
    if (EnumTagSinglePayload == 1)
      goto LABEL_13;
    v26 = v53;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v53, v7, v8);
    if (*(_QWORD *)(v14 + 16))
    {
      sub_1A02A27FC();
      v28 = MEMORY[0x1E0DEE9D8];
      if ((v29 & 1) != 0)
      {
        v28 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v27);
        OUTLINED_FUNCTION_43_8();
      }
    }
    else
    {
      v28 = MEMORY[0x1E0DEE9D8];
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_28_8();
      sub_1A029A838();
      v28 = v46;
    }
    v30 = *(_QWORD *)(v28 + 16);
    if (v30 >= *(_QWORD *)(v28 + 24) >> 1)
    {
      sub_1A029A838();
      v28 = v47;
    }
    *(_QWORD *)(v28 + 16) = v30 + 1;
    *(_QWORD *)(v28 + 8 * v30 + 32) = v15;
    v31 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
    v31(v55, v26, v8);
    OUTLINED_FUNCTION_49_8();
    v58 = v14;
    sub_1A02A27FC();
    OUTLINED_FUNCTION_38_8();
    if (v34)
      break;
    v35 = v32;
    v36 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FE18);
    v37 = sub_1A0307D60();
    v38 = v53;
    if ((v37 & 1) != 0)
    {
      sub_1A02A27FC();
      if ((v36 & 1) != (v40 & 1))
        goto LABEL_40;
      v35 = v39;
    }
    v14 = v58;
    if ((v36 & 1) != 0)
    {
      v41 = *(_QWORD *)(v58 + 56);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v41 + 8 * v35) = v28;
    }
    else
    {
      OUTLINED_FUNCTION_8_17();
      v31((char *)(v42 + *(_QWORD *)(v56 + 72) * v35), v55, v8);
      *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v35) = v28;
      v43 = *(_QWORD *)(v14 + 16);
      v34 = __OFADD__(v43, 1);
      v44 = v43 + 1;
      if (v34)
        goto LABEL_39;
      *(_QWORD *)(v14 + 16) = v44;
    }
    OUTLINED_FUNCTION_39_8();
    v45 = *(void (**)(char *, uint64_t))(v56 + 8);
    v45(v55, v8);
    v45(v38, v8);
    a1 = v50;
    v12 = v54;
LABEL_14:
    if (v12 == ++v13)
    {
      swift_bridgeObjectRelease();
      return v14;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  result = sub_1A0307E74();
  __break(1u);
  return result;
}

void sub_1A02E6E70()
{
  qword_1ED07DEF8 = -1;
}

uint64_t sub_1A02E6E80(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = v4;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle) = 0;
  type metadata accessor for PersistentStorage();
  v11 = sub_1A02D7B48();
  if (v5)
  {
    v12 = OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_15_16(v12);
    type metadata accessor for DbStorage();
    OUTLINED_FUNCTION_4_27();
  }
  else if ((v11 & 1) != 0)
  {
    v13 = v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storagePath;
    v14 = OUTLINED_FUNCTION_34();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v13, a1, v14);
    *(_BYTE *)(v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storageProtectionClass) = a2;
    v15 = v4 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_pageSize;
    *(_QWORD *)v15 = a3;
    *(_BYTE *)(v15 + 8) = a4 & 1;
  }
  else
  {
    v16 = OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_15_16(v16);
    type metadata accessor for DbStorage();
    OUTLINED_FUNCTION_4_27();
    return 0;
  }
  return v6;
}

const char *sub_1A02E6F80(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  uint64_t v8;
  sqlite3 **v12;
  int v13;
  const char *result;
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
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;

  if (a1)
    v6 = a1 == 100;
  else
    v6 = 1;
  v7 = v6 || a1 == 101;
  v8 = v7;
  if (v7)
    return (const char *)v8;
  v12 = (sqlite3 **)(v5 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  OUTLINED_FUNCTION_79_0();
  v13 = sqlite3_extended_errcode(*v12);
  result = sqlite3_errstr(a1);
  if (result)
  {
    sub_1A030779C();
    if (v15)
    {
      if (qword_1ED07B1B0 != -1)
        swift_once();
      v39 = qword_1EE590328;
      sub_1A0307CAC();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_17();
      OUTLINED_FUNCTION_25_12();
      OUTLINED_FUNCTION_26_7();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_31();
      HIDWORD(v43) = v13;
      OUTLINED_FUNCTION_25_12();
      OUTLINED_FUNCTION_26_7();
      swift_bridgeObjectRelease();
      sub_1A0307838();
      sub_1A0307838();
      v16 = swift_bridgeObjectRelease();
      v24 = OUTLINED_FUNCTION_50_7(v16, v17, v18, v19, v20, v21, v22, v23, v39, a4, a5, a3, v43, 0);
      v29 = v41;
    }
    else
    {
      if (qword_1ED07B1B0 != -1)
        swift_once();
      sub_1A0307CAC();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_17();
      OUTLINED_FUNCTION_24_13();
      OUTLINED_FUNCTION_26_7();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_31();
      HIDWORD(v43) = v13;
      OUTLINED_FUNCTION_24_13();
      OUTLINED_FUNCTION_26_7();
      v30 = swift_bridgeObjectRelease();
      v24 = OUTLINED_FUNCTION_50_7(v30, v31, v32, v33, v34, v35, v36, v37, v38, v40, a5, a3, v43, 0);
      v29 = a4;
    }
    sub_1A02B97F8(v24, v25, v26, v27, v29, v28);
    swift_bridgeObjectRelease();
    sub_1A02E8B4C();
    return (const char *)v8;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A02E71E0()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  sqlite3 **v4;
  int v5;
  char v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v1 = v0;
  sub_1A0307244();
  v2 = (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storageProtectionClass) << 20) + 1048582;
  v3 = sub_1A0307814();
  OUTLINED_FUNCTION_1_7();
  v4 = (sqlite3 **)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  swift_beginAccess();
  v5 = sqlite3_open_v2((const char *)(v3 + 32), v4, v2, 0);
  swift_endAccess();
  swift_release();
  if ((sub_1A02E6F80(v5, 0xD00000000000005CLL, 0x80000001A03111D0, 0x7243724F6E65706FLL, 0xEE00292865746165) & 1) != 0)
  {
    if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_pageSize + 8) & 1) == 0)
    {
      OUTLINED_FUNCTION_11_19();
      sub_1A0307CAC();
      OUTLINED_FUNCTION_31_10();
      OUTLINED_FUNCTION_36_10();
      sub_1A0307E20();
      OUTLINED_FUNCTION_32_8();
      OUTLINED_FUNCTION_4();
      sub_1A02E7814();
      v7 = v6;
      OUTLINED_FUNCTION_4();
      if ((v7 & 1) == 0)
      {
        if (qword_1ED07B1B0 != -1)
          swift_once();
        OUTLINED_FUNCTION_11_19();
        sub_1A0307CAC();
        OUTLINED_FUNCTION_31_10();
        OUTLINED_FUNCTION_36_10();
        sub_1A0307E20();
        OUTLINED_FUNCTION_32_8();
        OUTLINED_FUNCTION_2_8();
        OUTLINED_FUNCTION_3_34();
        sub_1A02B97F8(v8, v9, v10, v11, v12, v13);
        OUTLINED_FUNCTION_2_8();
      }
    }
    sub_1A02E7814();
  }
  else
  {
    if (qword_1ED07B1B0 != -1)
      swift_once();
    OUTLINED_FUNCTION_11_19();
    sub_1A0307CAC();
    OUTLINED_FUNCTION_31_10();
    OUTLINED_FUNCTION_34();
    sub_1A0274CC8();
    sub_1A0307E20();
    OUTLINED_FUNCTION_32_8();
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_3_34();
    sub_1A02B9810(v15, v16, v17, v18, v19, v20);
    OUTLINED_FUNCTION_4();
    v14 = 0;
  }
  return v14 & 1;
}

uint64_t sub_1A02E74C0()
{
  uint64_t v0;
  _QWORD *v1;
  char v2;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  OUTLINED_FUNCTION_79_0();
  if (*v1)
    v2 = 1;
  else
    v2 = sub_1A02E71E0();
  return v2 & 1;
}

uint64_t sub_1A02E7510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  char v10;
  _QWORD v11[2];
  char v12;

  v0 = sub_1A02E7984(0xD000000000000010, 0x80000001A0311260, 0);
  if (!v0)
    goto LABEL_9;
  if (!*(_QWORD *)(v0 + 16))
  {
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_7();
  result = sub_1A02E8CBC(v1);
  if ((v4 & 1) == 0)
  {
    if (*(_DWORD *)(v1 + 36) == v3)
    {
      if (result != 1 << *(_BYTE *)(v1 + 32))
      {
        sub_1A02E8D40(result, v3, v1, (uint64_t)v11);
        swift_bridgeObjectRelease();
        v5 = v11[0];
        v6 = v11[1];
        v7 = v12;
        v8 = sub_1A02C7698();
        v10 = v9;
        sub_1A02653C8(v5, v6, v7);
        if ((v10 & 1) == 0)
          return v8;
LABEL_9:
        if (qword_1ED07B1B0 != -1)
          swift_once();
        sub_1A02B97F8(0xD000000000000021, 0x80000001A0311280, 0xD00000000000005CLL, 0x80000001A03111D0, 0xD000000000000011, 0x80000001A03112B0);
        return 0;
      }
      goto LABEL_8;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A02E7690()
{
  uint64_t v0;
  sqlite3 **v1;
  int v2;
  unsigned __int8 v3;

  if ((sub_1A02E74C0() & 1) != 0)
  {
    if (qword_1ED07B1B0 != -1)
      swift_once();
    OUTLINED_FUNCTION_11_19();
    sub_1A0307CAC();
    OUTLINED_FUNCTION_31_10();
    OUTLINED_FUNCTION_34();
    sub_1A0274CC8();
    sub_1A0307E20();
    OUTLINED_FUNCTION_32_8();
    OUTLINED_FUNCTION_2_8();
    sub_1A02B9810(0xD000000000000014, 0x80000001A0311350, 0xD00000000000005CLL, 0x80000001A03111D0, 0x696F706B63656863, 0xEC0000002928746ELL);
    OUTLINED_FUNCTION_2_8();
    v1 = (sqlite3 **)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
    OUTLINED_FUNCTION_79_0();
    v2 = sqlite3_wal_checkpoint_v2(*v1, 0, 1, 0, 0);
    v3 = sub_1A02E6F80(v2, 0xD00000000000005CLL, 0x80000001A03111D0, 0x696F706B63656863, 0xEC0000002928746ELL);
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

void sub_1A02E7814()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  if ((OUTLINED_FUNCTION_48_3() & 1) != 0)
  {
    OUTLINED_FUNCTION_79_0();
    v1 = OUTLINED_FUNCTION_34_10();
    OUTLINED_FUNCTION_7_25(v1);
    OUTLINED_FUNCTION_46_6();
    OUTLINED_FUNCTION_37_10();
    sub_1A02E6F80(v0, 0xD00000000000005CLL, v2, 0x2865747563657865, 0xEB00000000293A5FLL);
  }
  OUTLINED_FUNCTION_75_1();
}

void sub_1A02E78A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((OUTLINED_FUNCTION_48_3() & 1) != 0)
  {
    if (a3)
    {
      v6 = sub_1A02E7FA8(v4, v3, a3);
      if (v6)
      {
        v7 = v6;
        sqlite3_step(v6);
        sqlite3_finalize(v7);
        OUTLINED_FUNCTION_37_10();
        v8 = OUTLINED_FUNCTION_22_10();
        sub_1A02E6F80(v8, v9, v10, v11, v12);
        return;
      }
    }
    else
    {
      OUTLINED_FUNCTION_79_0();
      v13 = OUTLINED_FUNCTION_34_10();
      OUTLINED_FUNCTION_7_25(v13);
      OUTLINED_FUNCTION_46_6();
      OUTLINED_FUNCTION_37_10();
      v14 = OUTLINED_FUNCTION_22_10();
      sub_1A02E6F80(v14, v15, v16, v17, v18);
    }
  }
  OUTLINED_FUNCTION_75_1();
}

uint64_t sub_1A02E7984(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sqlite3_stmt *v6;
  sqlite3_stmt *v7;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  sqlite3_stmt *v25;
  int v26;
  int v27;
  double v28;
  unint64_t v29;
  char v30;
  char v31;
  sqlite3_stmt *v32;
  int v33;
  sqlite3_stmt *v34;
  int v35;
  const void *v36;
  const void *v37;
  sqlite3_stmt *v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  sqlite3_stmt *v44;
  int v45;
  sqlite3_stmt *v46;
  int v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char v63;
  BOOL v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  sqlite3_stmt *v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  char v88;
  _BYTE __dst[14];
  unsigned __int8 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if ((sub_1A02E74C0() & 1) != 0)
  {
    v6 = sub_1A02E7FA8(a1, a2, a3);
    if (v6)
    {
      v7 = v6;
      v8 = sqlite3_column_count(v6);
      if (v8)
      {
        v9 = v8;
        if (v8 < 0)
          goto LABEL_64;
        v10 = 0;
        v87 = (_QWORD *)MEMORY[0x1E0DEE9D8];
        v84 = v7;
        do
        {
          if (v9 == v10)
            goto LABEL_63;
          if (!sqlite3_column_name(v7, v10))
            goto LABEL_65;
          v11 = sub_1A0307844();
          v13 = v12;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            OUTLINED_FUNCTION_28_8();
            sub_1A029A800();
            v87 = v17;
          }
          v15 = v87[2];
          v14 = v87[3];
          if (v15 >= v14 >> 1)
          {
            OUTLINED_FUNCTION_51_6(v14);
            sub_1A029A800();
            v87 = v18;
          }
          ++v10;
          v87[2] = v15 + 1;
          v16 = &v87[2 * v15];
          v16[4] = v11;
          v16[5] = v13;
          v7 = v84;
        }
        while (v9 != v10);
        if (sqlite3_step(v84) != 100)
        {
          v19 = MEMORY[0x1E0DEE9D8];
          goto LABEL_58;
        }
        v85 = v9;
        v19 = MEMORY[0x1E0DEE9D8];
        while (1)
        {
          v83 = v19;
          v21 = 0;
          v22 = v87 + 5;
          v23 = MEMORY[0x1E0DEE9E0];
          v24 = v85;
          do
          {
            if (v24 == v21)
            {
              __break(1u);
LABEL_60:
              __break(1u);
LABEL_61:
              __break(1u);
LABEL_62:
              __break(1u);
LABEL_63:
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
            }
            v25 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_14();
            v27 = sqlite3_column_type(v25, v26) - 1;
            v28 = 0.0;
            v29 = 0;
            v30 = 0;
            v31 = 4;
            switch(v27)
            {
              case 0:
                v32 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_14();
                v28 = COERCE_DOUBLE(sqlite3_column_int64(v32, v33));
                v29 = 0;
                v30 = 0;
                v31 = 1;
                break;
              case 1:
                v44 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_14();
                v29 = 0;
                v30 = 0;
                v28 = sqlite3_column_double(v44, v45);
                v31 = 2;
                break;
              case 2:
                v46 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_14();
                if (!sqlite3_column_text(v46, v47))
                  goto LABEL_30;
                v28 = COERCE_DOUBLE(sub_1A0307850());
                v29 = v48;
                v30 = 0;
                v31 = 0;
                break;
              case 3:
                v34 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_14();
                v36 = sqlite3_column_blob(v34, v35);
                if (!v36)
                  goto LABEL_30;
                v37 = v36;
                v38 = (sqlite3_stmt *)OUTLINED_FUNCTION_19_14();
                v40 = sqlite3_column_bytes(v38, v39);
                if (v40)
                {
                  v41 = v40;
                  if (v40 < 15)
                  {
                    memset(__dst, 0, sizeof(__dst));
                    v90 = v40;
                    memcpy(__dst, v37, v40);
                    v30 = 0;
                    v28 = *(double *)__dst;
                    v29 = *(unsigned int *)&__dst[8] | ((unint64_t)__dst[12] << 32) | ((unint64_t)__dst[13] << 40) | ((unint64_t)v90 << 48);
                  }
                  else
                  {
                    sub_1A0307148();
                    swift_allocObject();
                    if ((_DWORD)v41 == 0x7FFFFFFF)
                    {
                      v42 = sub_1A0307118();
                      sub_1A0307268();
                      v43 = swift_allocObject();
                      v30 = 0;
                      *(_OWORD *)(v43 + 16) = xmmword_1A0318D60;
                      v29 = v42 | 0x8000000000000000;
                      v28 = *(double *)&v43;
                    }
                    else
                    {
                      v30 = 0;
                      *(_QWORD *)&v28 = v41 << 32;
                      v29 = sub_1A0307118() | 0x4000000000000000;
                    }
                  }
                  v31 = 3;
                }
                else
                {
                  v28 = 0.0;
                  v30 = 0;
                  v31 = 3;
                  v29 = 0xC000000000000000;
                }
                break;
              case 4:
                break;
              default:
LABEL_30:
                v28 = 0.0;
                v29 = 0;
                v31 = -1;
                v30 = 1;
                break;
            }
            if (v87[2] <= v21)
              goto LABEL_60;
            v88 = v31;
            v50 = *(v22 - 1);
            v49 = *v22;
            OUTLINED_FUNCTION_50_4();
            if ((v30 & 1) != 0)
            {
              swift_bridgeObjectRetain();
              v51 = OUTLINED_FUNCTION_28_13();
              v53 = v52;
              swift_bridgeObjectRelease();
              if ((v53 & 1) != 0)
              {
                OUTLINED_FUNCTION_49_8();
                *(_QWORD *)__dst = v23;
                __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07AE70);
                sub_1A0307D60();
                v23 = *(_QWORD *)__dst;
                swift_bridgeObjectRelease();
                v54 = *(_QWORD *)(v23 + 56) + 24 * v51;
                v55 = *(_QWORD *)v54;
                v56 = *(_QWORD *)(v54 + 8);
                v57 = *(_BYTE *)(v54 + 16);
                sub_1A0307D6C();
                OUTLINED_FUNCTION_2_8();
                OUTLINED_FUNCTION_39_8();
                v58 = v56;
                v24 = v85;
                sub_1A02653C8(v55, v58, v57);
              }
              else
              {
                OUTLINED_FUNCTION_2_8();
              }
            }
            else
            {
              v86 = v22;
              v59 = v29;
              v60 = *(_QWORD *)&v28;
              v61 = v59;
              sub_1A026538C(*(uint64_t *)&v28, v59, v88);
              OUTLINED_FUNCTION_49_8();
              *(_QWORD *)__dst = v23;
              OUTLINED_FUNCTION_28_13();
              OUTLINED_FUNCTION_38_8();
              if (v64)
                goto LABEL_61;
              v65 = v62;
              v66 = v63;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07AE70);
              v7 = v84;
              if ((sub_1A0307D60() & 1) != 0)
              {
                v67 = OUTLINED_FUNCTION_2_37();
                v69 = sub_1A02A26F8(v67, v68);
                if ((v66 & 1) != (v70 & 1))
                {
                  sub_1A0307E74();
                  __break(1u);
                  JUMPOUT(0x1A02E7F94);
                }
                v65 = v69;
              }
              v23 = *(_QWORD *)__dst;
              if ((v66 & 1) != 0)
              {
                v71 = *(_QWORD *)(*(_QWORD *)__dst + 56) + 24 * v65;
                sub_1A02653C8(*(_QWORD *)v71, *(_QWORD *)(v71 + 8), *(_BYTE *)(v71 + 16));
                *(_QWORD *)v71 = v60;
                *(_QWORD *)(v71 + 8) = v61;
                v72 = v88;
                *(_BYTE *)(v71 + 16) = v88;
              }
              else
              {
                OUTLINED_FUNCTION_8_17();
                v74 = (_QWORD *)(v73 + 16 * v65);
                *v74 = v50;
                v74[1] = v49;
                v75 = *(_QWORD *)(v23 + 56) + 24 * v65;
                *(_QWORD *)v75 = v60;
                *(_QWORD *)(v75 + 8) = v61;
                v72 = v88;
                *(_BYTE *)(v75 + 16) = v88;
                v76 = *(_QWORD *)(v23 + 16);
                v64 = __OFADD__(v76, 1);
                v77 = v76 + 1;
                if (v64)
                  goto LABEL_62;
                *(_QWORD *)(v23 + 16) = v77;
                OUTLINED_FUNCTION_50_4();
              }
              OUTLINED_FUNCTION_2_8();
              OUTLINED_FUNCTION_39_8();
              sub_1A02653B4(v60, v61, v72);
              v24 = v85;
              v22 = v86;
            }
            ++v21;
            v22 += 2;
          }
          while (v24 != v21);
          v19 = v83;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            OUTLINED_FUNCTION_28_8();
            sub_1A029A838();
            v19 = v81;
          }
          v80 = *(_QWORD *)(v19 + 16);
          v79 = *(_QWORD *)(v19 + 24);
          if (v80 >= v79 >> 1)
          {
            OUTLINED_FUNCTION_51_6(v79);
            sub_1A029A838();
            v19 = v82;
          }
          *(_QWORD *)(v19 + 16) = v80 + 1;
          *(_QWORD *)(v19 + 8 * v80 + 32) = v23;
          if (sqlite3_step(v7) != 100)
          {
LABEL_58:
            sqlite3_finalize(v7);
            swift_bridgeObjectRelease();
            return v19;
          }
        }
      }
    }
  }
  return 0;
}

sqlite3_stmt *sub_1A02E7FA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  sqlite3_stmt *v5;
  sqlite3 **v6;
  sqlite3 *v7;
  void *v8;
  const char *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  sqlite3_stmt *ppStmt[2];

  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x1E0C80C00];
  ppStmt[0] = 0;
  v5 = 0;
  if ((sub_1A02E74C0() & 1) != 0)
  {
    v6 = (sqlite3 **)(v3 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
    OUTLINED_FUNCTION_79_0();
    v7 = *v6;
    v8 = (void *)OUTLINED_FUNCTION_16_14();
    v9 = (const char *)objc_msgSend(v8, sel_UTF8String);
    v10 = v8;
    sqlite3_prepare_v2(v7, v9, 0x80000000, ppStmt, 0);
    OUTLINED_FUNCTION_37_10();
    v5 = 0;
    if ((sub_1A02E6F80(v11, v12, v13, 0xD000000000000021, 0x80000001A0311230) & 1) != 0)
    {
      v5 = ppStmt[0];
      if (ppStmt[0])
      {
        if (a3 && (sub_1A02E80DC(a3, ppStmt[0]) & 1) == 0)
        {
          sqlite3_finalize(v5);
          return 0;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_1A02E80DC(uint64_t *a1, sqlite3_stmt *a2)
{
  sqlite3_stmt *v2;
  int v4;
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
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
  sqlite3_stmt *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD v55[3];

  v2 = a2;
  v55[2] = *MEMORY[0x1E0C80C00];
  v4 = sqlite3_bind_parameter_count(a2);
  v5 = a1[2];
  if (v5 > v4)
    return 0;
  if (v5)
  {
    v47 = a1[2];
    v48 = (uint64_t)v2;
    v50 = (uint64_t)(a1 + 4);
    v7 = a1 + 4;
    v8 = a1[6];
    v9 = v7[3];
    v10 = *((_BYTE *)v7 + 32);
    if (v10 < 0)
      __asm { BR              X9 }
    OUTLINED_FUNCTION_50_4();
    v53 = v9;
    v54 = v8;
    sub_1A02652A0(v8, v9, v10);
    OUTLINED_FUNCTION_2_8();
    v11 = *((char *)v7 + 32);
    if (v11 < 0)
      goto LABEL_21;
    v12 = OUTLINED_FUNCTION_2_37();
    v51 = v13;
    v52 = v14;
    sub_1A02AED80(v12, v15, v13, v14, v11);
    v16 = qword_1ED07B160;
    OUTLINED_FUNCTION_50_4();
    if (v16 != -1)
      swift_once();
    v7 = (_QWORD *)qword_1ED07DF40;
    v17 = *(_QWORD *)(qword_1ED07DF40 + 16);
    if (v17)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_43_8();
      v18 = OUTLINED_FUNCTION_52_7();
      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
      {
        v19 = OUTLINED_FUNCTION_1_7();
        OUTLINED_FUNCTION_5_23(v19, v20, v21, v22, v23, v24, v25, v26, v47, (uint64_t)v2, v50, v51, v52);
LABEL_21:
        objc_msgSend((id)OUTLINED_FUNCTION_16_14(), sel_UTF8String);
        OUTLINED_FUNCTION_17_12();
        if (sqlite3_bind_parameter_index(v2, (const char *)v7))
          __asm { BR              X8 }
        sub_1A02653C8(v54, v53, v10);
        OUTLINED_FUNCTION_2_8();
        return 0;
      }
      if (v17 != 1)
      {
        v27 = v7 + 7;
        v28 = 1;
        while (1)
        {
          v29 = v28 + 1;
          if (__OFADD__(v28, 1))
          {
            __break(1u);
            __break(1u);
            JUMPOUT(0x1A02E8AC8);
          }
          swift_bridgeObjectRetain();
          v30 = OUTLINED_FUNCTION_52_7();
          OUTLINED_FUNCTION_4();
          if ((v30 & 1) != 0)
            break;
          ++v28;
          v27 += 2;
          if (v29 == v17)
            goto LABEL_18;
        }
        v39 = OUTLINED_FUNCTION_1_7();
        OUTLINED_FUNCTION_5_23(v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v50, v51, v52);
        v2 = v49;
        goto LABEL_21;
      }
LABEL_18:
      OUTLINED_FUNCTION_1_7();
      v2 = (sqlite3_stmt *)v48;
    }
    v55[0] = 64;
    v55[1] = 0xE100000000000000;
    v7 = v55;
    OUTLINED_FUNCTION_2_37();
    sub_1A0307838();
    v31 = OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_5_23(v31, v32, v33, v34, v35, v36, v37, v38, v47, v48, v50, v51, v52);
    goto LABEL_21;
  }
  return 1;
}

sqlite3 *sub_1A02E8B4C()
{
  uint64_t v0;
  sqlite3 **v1;
  sqlite3 *result;

  v1 = (sqlite3 **)(v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_handle);
  swift_beginAccess();
  result = *v1;
  if (*v1)
  {
    result = (sqlite3 *)sqlite3_close_v2(result);
    *v1 = 0;
  }
  return result;
}

uint64_t sub_1A02E8B9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1A02E8B4C();
  v1 = v0 + OBJC_IVAR____TtC13SiriAnalytics9DbStorage_storagePath;
  v2 = OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1A02E8BEC()
{
  return type metadata accessor for DbStorage();
}

uint64_t type metadata accessor for DbStorage()
{
  uint64_t result;

  result = qword_1ED07B1C0;
  if (!qword_1ED07B1C0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1A02E8C2C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A030725C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1A02E8CBC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
LABEL_3:
    v3 = __clz(__rbit64(v1)) + v2;
    return OUTLINED_FUNCTION_35_8(v3);
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return OUTLINED_FUNCTION_35_8(v3);
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    goto LABEL_3;
  }
  v2 = 64;
  v7 = 10;
  while (v7 - 8 < (unint64_t)(v3 + 63) >> 6)
  {
    v1 = *(_QWORD *)(a1 + 8 * v7);
    v2 += 64;
    ++v7;
    if (v1)
      goto LABEL_3;
  }
  return OUTLINED_FUNCTION_35_8(v3);
}

uint64_t sub_1A02E8D30(uint64_t a1)
{
  return OUTLINED_FUNCTION_35_8(1 << *(_BYTE *)(a1 + 32));
}

uint64_t sub_1A02E8D40@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (result < 0 || 1 << *(_BYTE *)(a3 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a3 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a3 + 36) == a2)
  {
    v4 = *(_QWORD *)(a3 + 56) + 24 * result;
    v5 = *(_QWORD *)v4;
    v6 = *(_QWORD *)(v4 + 8);
    *(_QWORD *)a4 = *(_QWORD *)v4;
    *(_QWORD *)(a4 + 8) = v6;
    v7 = *(_BYTE *)(v4 + 16);
    *(_BYTE *)(a4 + 16) = v7;
    return sub_1A02652A0(v5, v6, v7);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1A02E8DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  char v7;
  char v8;

  v4 = OUTLINED_FUNCTION_13_20(a1, a2, a3, a4);
  sub_1A02E78A0(v4, v5, v6);
  v8 = v7;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_8();
  return v8 & 1;
}

uint64_t sub_1A02E8DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_13_20(a1, a2, a3, a4);
  v7 = sub_1A02E7984(v4, v5, v6);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_8();
  return v7;
}

uint64_t OUTLINED_FUNCTION_2_37()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_31()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_5_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t a13)
{
  unint64_t v13;
  uint64_t v14;
  char v15;

  return sub_1A02AEDE0(v14, v13, a12, a13, v15);
}

uint64_t OUTLINED_FUNCTION_7_25(uint64_t a1)
{
  sqlite3 *v1;

  return sqlite3_exec(v1, (const char *)(a1 + 32), 0, 0, 0);
}

void OUTLINED_FUNCTION_8_17()
{
  unint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 8 * (v0 >> 6) + 64) |= 1 << v0;
}

uint64_t OUTLINED_FUNCTION_12_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;

  return sub_1A02AEDE0(v19, v18, v17, v20, a17);
}

uint64_t OUTLINED_FUNCTION_13_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
}

uint64_t OUTLINED_FUNCTION_14_18()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_15_16(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_16_14()
{
  return sub_1A03077A8();
}

id OUTLINED_FUNCTION_17_12()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_19_14()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_22_10()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23_12()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_24_13()
{
  return sub_1A0307E20();
}

uint64_t OUTLINED_FUNCTION_25_12()
{
  return sub_1A0307E20();
}

uint64_t OUTLINED_FUNCTION_26_7()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_28_13()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1A02A26F8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_29_10(sqlite3_stmt *a1, int a2)
{
  const char *v2;

  return sqlite3_bind_text(a1, a2, v2, -1, 0);
}

uint64_t OUTLINED_FUNCTION_31_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_32_8()
{
  return sub_1A0307838();
}

uint64_t OUTLINED_FUNCTION_34_10()
{
  return sub_1A0307814();
}

uint64_t OUTLINED_FUNCTION_35_8@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_39_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_43_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_44_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_45_6()
{
  uint64_t v0;
  unint64_t v1;

  sub_1A02653C8(v0, v1, 3);
  return v0;
}

uint64_t OUTLINED_FUNCTION_46_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_47_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_48_3()
{
  return sub_1A02E74C0();
}

uint64_t OUTLINED_FUNCTION_49_8()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_50_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return a14;
}

BOOL OUTLINED_FUNCTION_51_6@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_52_7()
{
  return sub_1A0307868();
}

uint64_t sub_1A02E9114(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    sub_1A02E3008();
    v2 = v11;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1)
        sub_1A02E3008();
      v4 += 8;
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v6;
      *(_QWORD *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1A02E91E8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, _QWORD, _QWORD *))
{
  uint64_t v3;
  uint64_t result;
  _BYTE *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  char v24;
  uint64_t v25;

  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v25 = MEMORY[0x1E0DEE9D8];
    sub_1A02E3008();
    result = v25;
    v5 = (_BYTE *)(a1 + 88);
    do
    {
      v6 = *((_QWORD *)v5 - 6);
      v20 = *((_QWORD *)v5 - 7);
      v22 = result;
      v19 = *(v5 - 40);
      v7 = *(v5 - 39);
      v9 = *((_QWORD *)v5 - 3);
      v10 = *((_QWORD *)v5 - 2);
      v11 = *((_QWORD *)v5 - 1);
      v23[0] = *((_QWORD *)v5 - 4);
      v8 = v23[0];
      v23[1] = v9;
      v23[2] = v10;
      v23[3] = v11;
      v24 = *v5;
      v12 = v24;
      swift_bridgeObjectRetain();
      sub_1A02E9AAC(v8, v9, v10, v11, v12);
      if (v7)
        v13 = 256;
      else
        v13 = 0;
      v14 = a2(v20, v6, v13 | v19, v23);
      v21 = v15;
      swift_bridgeObjectRelease();
      sub_1A02E9AC0(v8, v9, v10, v11, v12);
      result = v22;
      v25 = v22;
      v16 = *(_QWORD *)(v22 + 16);
      if (v16 >= *(_QWORD *)(v22 + 24) >> 1)
      {
        sub_1A02E3008();
        result = v25;
      }
      v5 += 64;
      *(_QWORD *)(result + 16) = v16 + 1;
      v17 = result + 16 * v16;
      *(_QWORD *)(v17 + 32) = v14;
      *(_QWORD *)(v17 + 40) = v21;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_1A02E9364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];
  uint64_t v6;
  _BYTE v7[16];
  uint64_t v8[2];

  v2 = OUTLINED_FUNCTION_3_35();
  sub_1A02E9114(v2);
  OUTLINED_FUNCTION_1_45();
  v8[0] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B220);
  sub_1A0265304();
  OUTLINED_FUNCTION_0_41();
  OUTLINED_FUNCTION_25_0();
  v6 = MEMORY[0x1E0DEE9D8];
  v3 = OUTLINED_FUNCTION_3_35();
  sub_1A02E91E8(v3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD *))sub_1A02E976C);
  OUTLINED_FUNCTION_1_45();
  v8[0] = v1;
  OUTLINED_FUNCTION_0_41();
  OUTLINED_FUNCTION_25_0();
  sub_1A02E9778(v0 + 24, (uint64_t)v7);
  sub_1A02E9778((uint64_t)v7, (uint64_t)v8);
  if (v8[0])
    sub_1A02E97C0(v8[0], v8[1]);
  sub_1A0307CAC();
  swift_bridgeObjectRelease();
  strcpy((char *)v5, "INSERT INTO ");
  BYTE5(v5[1]) = 0;
  HIWORD(v5[1]) = -5120;
  swift_bridgeObjectRetain();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  sub_1A0307838();
  OUTLINED_FUNCTION_2_8();
  sub_1A0307838();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  sub_1A0307838();
  OUTLINED_FUNCTION_25_0();
  sub_1A0307838();
  if (!*(_QWORD *)(v6 + 16))
    swift_bridgeObjectRelease();
  return v5[0];
}

uint64_t sub_1A02E9588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD v20[4];
  char v21;
  _BYTE v22[40];
  _BYTE v23[40];

  sub_1A02E9AD4(a4, (uint64_t)v20);
  v8 = v20[0];
  v7 = v20[1];
  v9 = v20[2];
  v10 = v20[3];
  v11 = v21;
  sub_1A02E9AD4(a4, (uint64_t)v22);
  if (v22[32] > 0xF7u)
    return 1280070990;
  sub_1A02E9B10((uint64_t)v22, (uint64_t)v23);
  sub_1A02AED80(v8, v7, v9, v10, v11);
  sub_1A029A504();
  v12 = *(_QWORD *)(*a5 + 16);
  sub_1A029A6B4(v12);
  v13 = *a5;
  *(_QWORD *)(v13 + 16) = v12 + 1;
  sub_1A02E9B10((uint64_t)v23, v13 + 40 * v12 + 32);
  if (v11 < 0)
    return 63;
  sub_1A02E9B4C(a4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A02E9AAC);
  v14 = qword_1ED07B160;
  swift_bridgeObjectRetain();
  if (v14 != -1)
    swift_once();
  v15 = qword_1ED07DF40;
  v16 = *(_QWORD *)(qword_1ED07DF40 + 16);
  if (v16)
  {
    swift_bridgeObjectRetain();
    v17 = v15 + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      v18 = sub_1A0307868();
      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
        break;
      v17 += 16;
      if (!--v16)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    sub_1A02E9B4C(a4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A02E9AC0);
  }
  else
  {
LABEL_11:
    sub_1A0307838();
    swift_bridgeObjectRelease();
    sub_1A02E9B4C(a4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A02E9AC0);
    return 64;
  }
  return v8;
}

uint64_t sub_1A02E976C(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1A02E9588(a1, a2, a3 & 0x1FF, a4, *(uint64_t **)(v4 + 16));
}

uint64_t sub_1A02E9778(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07ADC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A02E97C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD v20[2];
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(a2 + 16);
  if (!v3)
    return 0;
  v20[0] = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_1A02E3008();
  v5 = v20[0];
  v6 = (uint64_t *)(a1 + 40);
  do
  {
    v8 = *(v6 - 1);
    v7 = *v6;
    v20[0] = v5;
    v9 = *(_QWORD *)(v5 + 16);
    v10 = *(_QWORD *)(v5 + 24);
    OUTLINED_FUNCTION_3_35();
    if (v9 >= v10 >> 1)
    {
      sub_1A02E3008();
      v5 = v20[0];
    }
    v6 += 3;
    *(_QWORD *)(v5 + 16) = v9 + 1;
    v11 = v5 + 16 * v9;
    *(_QWORD *)(v11 + 32) = v8;
    *(_QWORD *)(v11 + 40) = v7;
    --v2;
  }
  while (v2);
  OUTLINED_FUNCTION_2_8();
  v20[0] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07B220);
  sub_1A0265304();
  sub_1A0307784();
  swift_bridgeObjectRelease();
  v21 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_1A02E3008();
  v13 = v21;
  v14 = (uint64_t *)(a2 + 40);
  do
  {
    v15 = *(v14 - 1);
    v16 = *v14;
    OUTLINED_FUNCTION_2_38();
    sub_1A0307CAC();
    OUTLINED_FUNCTION_2_38();
    swift_bridgeObjectRelease();
    v20[0] = v15;
    v20[1] = v16;
    sub_1A0307838();
    OUTLINED_FUNCTION_2_38();
    sub_1A0307838();
    swift_bridgeObjectRelease_n();
    v21 = v13;
    v17 = *(_QWORD *)(v13 + 16);
    if (v17 >= *(_QWORD *)(v13 + 24) >> 1)
    {
      sub_1A02E3008();
      v13 = v21;
    }
    v14 += 3;
    *(_QWORD *)(v13 + 16) = v17 + 1;
    v18 = v13 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v15;
    *(_QWORD *)(v18 + 40) = v16;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  sub_1A0307784();
  swift_bridgeObjectRelease();
  sub_1A0307CAC();
  swift_bridgeObjectRelease();
  strcpy((char *)v20, "ON CONFLICT(");
  sub_1A0307838();
  OUTLINED_FUNCTION_2_8();
  sub_1A0307838();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  return v20[0];
}

uint64_t sub_1A02E9AAC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  if (a5 <= 0xF7u)
    return sub_1A02AED80(a1, a2, a3, a4, a5);
  return a1;
}

uint64_t sub_1A02E9AC0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  if (a5 <= 0xF7u)
    return sub_1A02AEDE0(a1, a2, a3, a4, a5);
  return a1;
}

uint64_t sub_1A02E9AD4(uint64_t a1, uint64_t a2)
{
  __swift_memcpy33_8(a2, a1);
  return a2;
}

uint64_t sub_1A02E9B10(uint64_t a1, uint64_t a2)
{
  __swift_memcpy33_8(a2, a1);
  return a2;
}

uint64_t sub_1A02E9B4C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

_QWORD *sub_1A02E9B88(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SQLInsertConflictClause(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SQLInsertConflictClause()
{
  return &type metadata for SQLInsertConflictClause;
}

uint64_t OUTLINED_FUNCTION_0_41()
{
  return sub_1A0307784();
}

uint64_t OUTLINED_FUNCTION_1_45()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_38()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_35()
{
  return swift_bridgeObjectRetain();
}

void sub_1A02E9C5C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id FBFStorageShim.__allocating_init(applicationIdentifier:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR___SiriAnalyticsFBFStorage_underlying];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  *((_QWORD *)v8 + 3) = &type metadata for FBFStorageConcrete;
  *((_QWORD *)v8 + 4) = &off_1E4351A48;
  *((_QWORD *)v8 + 2) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id FBFStorageShim.init(applicationIdentifier:telemetry:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_super v6;

  v4 = &v3[OBJC_IVAR___SiriAnalyticsFBFStorage_underlying];
  *(_QWORD *)v4 = a1;
  *((_QWORD *)v4 + 1) = a2;
  *((_QWORD *)v4 + 3) = &type metadata for FBFStorageConcrete;
  *((_QWORD *)v4 + 4) = &off_1E4351A48;
  *((_QWORD *)v4 + 2) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for FBFStorageShim();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for FBFStorageShim()
{
  return objc_opt_self();
}

void sub_1A02E9DEC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void (**a5)(_QWORD, _QWORD))
{
  uint64_t v10;
  Swift::String v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a5;
  _Block_copy(a5);
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = a2;
  v11._object = a3;
  OffDeviceTopic.init(rawValue:)(v11);
  if (v18 == 4)
  {
    sub_1A02EA00C();
    v12 = (void *)swift_allocError();
    v13 = (void *)sub_1A03071B4();
    ((void (**)(_QWORD, void *))a5)[2](a5, v13);

  }
  else
  {
    v14 = (_QWORD *)(a4 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying);
    v15 = *(_QWORD *)(a4 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying + 24);
    v16 = v14[4];
    __swift_project_boxed_opaque_existential_1(v14, v15);
    v17 = v18;
    (*(void (**)(uint64_t, char *, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v16 + 8))(a1, &v17, sub_1A02EB2A0, v10, v15, v16);
  }
  swift_release();
  _Block_release(a5);
}

void sub_1A02E9F14(uint64_t a1, uint64_t a2, void *a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v5;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;

  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = a2;
  v11._object = a3;
  OffDeviceTopic.init(rawValue:)(v11);
  if (v16 == 4)
  {
    sub_1A02EA00C();
    v12 = (void *)swift_allocError();
    a4();

  }
  else
  {
    v13 = *(_QWORD *)(v5 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying + 24);
    v14 = *(_QWORD *)(v5 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + OBJC_IVAR___SiriAnalyticsFBFStorage_underlying), v13);
    v15 = v16;
    (*(void (**)(uint64_t, char *, void (*)(void), uint64_t, uint64_t, uint64_t))(v14 + 8))(a1, &v15, a4, a5, v13, v14);
  }
}

unint64_t sub_1A02EA00C()
{
  unint64_t result;

  result = qword_1EE58FE28;
  if (!qword_1EE58FE28)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A0318EDC, &type metadata for FBFStorageError);
    atomic_store(result, (unint64_t *)&qword_1EE58FE28);
  }
  return result;
}

void sub_1A02EA0DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1A03071B4();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

id FBFStorageShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FBFStorageShim.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FBFStorageShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FBFStorageShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t dispatch thunk of FBFStorage.store(_:topic:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of FBFStorage.store(_:topic:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1A02A5EB8;
  return v11(a1, a2, a3, a4);
}

uint64_t method lookup function for FBFStorageShim()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FBFStorageShim.__allocating_init(applicationIdentifier:telemetry:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of FBFStorageShim.store(_:topic:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t storeEnumTagSinglePayload for FBFStorageError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A02EA2BC + 4 * byte_1A0318DE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A02EA2DC + 4 * byte_1A0318DE5[v4]))();
}

_BYTE *sub_1A02EA2BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A02EA2DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A02EA2E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A02EA2EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A02EA2F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A02EA2FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FBFStorageError()
{
  return &type metadata for FBFStorageError;
}

void destroy for FBFStorageConcrete(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s13SiriAnalytics18FBFStorageConcreteVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for FBFStorageConcrete(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

  return a1;
}

uint64_t assignWithTake for FBFStorageConcrete(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for FBFStorageConcrete(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for FBFStorageConcrete(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FBFStorageConcrete()
{
  return &type metadata for FBFStorageConcrete;
}

unint64_t sub_1A02EA4B4()
{
  unint64_t result;

  result = qword_1EE58FE38;
  if (!qword_1EE58FE38)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A0318EB4, &type metadata for FBFStorageError);
    atomic_store(result, (unint64_t *)&qword_1EE58FE38);
  }
  return result;
}

void sub_1A02EA4F0(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  id v3;

  v2 = *a2;
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedLogger);
  __asm { BR              X9 }
}

void sub_1A02EA580()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[18];

  v7 = (void *)sub_1A03077A8();
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v6;
  v8[3] = v0;
  v8[4] = v3;
  v8[5] = v4;
  v8[6] = v5;
  v8[7] = v1;
  v12[4] = sub_1A02EB26C;
  v12[5] = v8;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1A02E9C5C;
  v12[3] = &block_descriptor_11;
  v9 = _Block_copy(v12);
  v10 = v3;
  v11 = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v2, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v11, v7, v9);
  _Block_release(v9);

}

uint64_t sub_1A02EA6B0(id a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t (*a6)(id))
{
  id v11;

  if (a1)
  {
    v11 = a1;
    if (qword_1ED07D488 != -1)
      swift_once();
    sub_1A0307CAC();
    sub_1A0307838();
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED07DB80);
    sub_1A0307D54();
    sub_1A02B97F8(0, 0xE000000000000000, 0xD000000000000064, 0x80000001A0311400, 0xD00000000000001ALL, 0x80000001A0311470);
    swift_bridgeObjectRelease();
    sub_1A02EA828((uint64_t)a1, a5, a2, a3, a4);

  }
  return a6(a1);
}

void sub_1A02EA828(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;
  unsigned __int8 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;

  if (a5)
  {
    v6 = a5;
    v7 = (id)sub_1A03071B4();
    v8 = sub_1A02EAE48(v7);
    v9 = sub_1A02EB190(a2);
    if (v10 >> 60 == 15)
    {
      v13 = 0;
      objc_msgSend(v6, sel_trackFBFError_forEventData_, v8, 0);
    }
    else
    {
      v11 = v9;
      v12 = v10;
      v13 = (id)sub_1A0307280();
      sub_1A026CF1C(v11, v12);
      objc_msgSend(v6, sel_trackFBFError_forEventData_, v8, v13);
    }

  }
}

uint64_t sub_1A02EA8E4(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = a5;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a3;
  *(_BYTE *)(v5 + 72) = *a2;
  return swift_task_switch();
}

uint64_t sub_1A02EA908()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  __int128 v7;

  v1 = *(_BYTE *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 40);
  v7 = *(_OWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = v1;
  *(_OWORD *)(v4 + 32) = v7;
  *(_QWORD *)(v4 + 48) = v2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v5;
  *v5 = v0;
  v5[1] = sub_1A02EA9D8;
  return sub_1A0307E50();
}

uint64_t sub_1A02EA9D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A02EAA44()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A02EAA50()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_16(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1A02EAA7C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;
  id v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E438);
  MEMORY[0x1E0C80A78](v4);
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedLogger);
  __asm { BR              X10 }
}

void sub_1A02EAB44()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v7 = (void *)sub_1A03077A8();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v4, *(_QWORD *)(v6 - 152), v3);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = (char *)swift_allocObject();
  v10 = *(_QWORD *)(v6 - 136);
  *((_QWORD *)v9 + 2) = *(_QWORD *)(v6 - 144);
  *((_QWORD *)v9 + 3) = v10;
  *((_QWORD *)v9 + 4) = v0;
  *((_QWORD *)v9 + 5) = v1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(&v9[v8], v4, v3);
  *(_QWORD *)(v6 - 96) = sub_1A02EB130;
  *(_QWORD *)(v6 - 88) = v9;
  *(_QWORD *)(v6 - 128) = MEMORY[0x1E0C809B0];
  *(_QWORD *)(v6 - 120) = 1107296256;
  *(_QWORD *)(v6 - 112) = sub_1A02E9C5C;
  *(_QWORD *)(v6 - 104) = &block_descriptor_16;
  v11 = _Block_copy((const void *)(v6 - 128));
  v12 = v0;
  v13 = v1;
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v2, sel_reportSiriInstrumentationEvent_forBundleID_completion_, v13, v7, v11);
  _Block_release(v11);

}

uint64_t sub_1A02EACA4(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v10;

  if (a1)
  {
    v10 = a1;
    if (qword_1ED07D488 != -1)
      swift_once();
    sub_1A0307CAC();
    sub_1A0307838();
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED07DB80);
    sub_1A0307D54();
    sub_1A02B97F8(0, 0xE000000000000000, 0xD000000000000064, 0x80000001A0311400, 0x3A5F2865726F7473, 0xEF293A6369706F74);
    swift_bridgeObjectRelease();
    sub_1A02EA828((uint64_t)a1, a5, a2, a3, a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E438);
    return sub_1A0307910();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E438);
    return sub_1A030791C();
  }
}

uint64_t sub_1A02EAE48(void *a1)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for FLError(0);
  sub_1A02EB1F0();
  sub_1A0307190();

  result = 1;
  switch(v3)
  {
    case -9:
      result = 39;
      break;
    case -8:
      result = 38;
      break;
    case -7:
      result = 7;
      break;
    case -6:
      result = 6;
      break;
    case -5:
      result = 5;
      break;
    case -4:
      result = 4;
      break;
    case -3:
      result = 3;
      break;
    case -2:
      result = 2;
      break;
    case -1:
      return result;
    case 0:
      goto LABEL_6;
    case 1:
      result = 8;
      break;
    case 2:
      result = 9;
      break;
    case 3:
      result = 10;
      break;
    case 4:
      result = 11;
      break;
    case 5:
      result = 12;
      break;
    case 6:
      result = 13;
      break;
    case 7:
      result = 14;
      break;
    case 8:
      result = 15;
      break;
    case 9:
      result = 16;
      break;
    case 10:
      result = 17;
      break;
    case 11:
      result = 18;
      break;
    case 12:
      result = 19;
      break;
    case 13:
      result = 20;
      break;
    case 14:
      result = 21;
      break;
    case 15:
      result = 22;
      break;
    case 16:
      result = 23;
      break;
    case 17:
      result = 24;
      break;
    case 18:
      result = 25;
      break;
    case 19:
      result = 26;
      break;
    case 20:
      result = 27;
      break;
    case 21:
      result = 28;
      break;
    case 22:
      result = 29;
      break;
    case 23:
      result = 30;
      break;
    case 24:
      result = 31;
      break;
    case 25:
      result = 32;
      break;
    case 26:
      result = 33;
      break;
    case 27:
      result = 34;
      break;
    case 28:
      result = 35;
      break;
    default:
      if (v3 == 100)
      {
        result = 36;
      }
      else if (v3 == 101)
      {
        result = 37;
      }
      else
      {
LABEL_6:
        result = 0;
      }
      break;
  }
  return result;
}

void sub_1A02EB010(uint64_t a1, unsigned __int8 *a2)
{
  sub_1A02EA4F0(a1, a2);
}

uint64_t sub_1A02EB01C(uint64_t a1, _BYTE *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *v2;
  v7 = v2[1];
  v8 = v2[2];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_1A02A5EB8;
  return sub_1A02EA8E4(a1, a2, v6, v7, v8);
}

void sub_1A02EB094(uint64_t a1)
{
  uint64_t v1;

  sub_1A02EAA7C(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24));
}

uint64_t sub_1A02EB0A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E438);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1A02EB130(void *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E438);
  return sub_1A02EACA4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
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

uint64_t sub_1A02EB190(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1A030728C();

  return v3;
}

unint64_t sub_1A02EB1F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE58F130;
  if (!qword_1EE58F130)
  {
    type metadata accessor for FLError(255);
    result = MEMORY[0x1A1AF7D34](&unk_1A0314CC8, v1);
    atomic_store(result, (unint64_t *)&qword_1EE58F130);
  }
  return result;
}

uint64_t sub_1A02EB230()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A02EB26C(void *a1)
{
  uint64_t v1;

  return sub_1A02EA6B0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40), *(uint64_t (**)(id))(v1 + 48));
}

uint64_t sub_1A02EB27C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1A02EB2A0(uint64_t a1)
{
  uint64_t v1;

  sub_1A02EA0DC(a1, *(_QWORD *)(v1 + 16));
}

void sub_1A02EB2B0(uint64_t a1, void (*a2)(uint64_t *, char *), uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t *, char *);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  uint64_t v33;

  v27 = a2;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58ED28);
  v7 = MEMORY[0x1E0C80A78](v26);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v23 - v10;
  v33 = a1;
  sub_1A02CFAC4(a4);
  v12 = v28;
  v13 = v31;
  v14 = v32;
  v24 = v29;
  v25 = (unint64_t)(v30 + 64) >> 6;
  swift_bridgeObjectRetain();
  if (!v14)
    goto LABEL_3;
LABEL_2:
  v15 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  v16 = v15 | (v13 << 6);
  while (1)
  {
    v20 = *(_QWORD *)(v12 + 48);
    v21 = type metadata accessor for PreprocessorCounterKey(0);
    sub_1A026F308(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v16, (uint64_t)v11, type metadata accessor for PreprocessorCounterKey);
    *(_QWORD *)&v11[*(int *)(v26 + 48)] = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v16);
    sub_1A026F340((uint64_t)v11, (uint64_t)v9, &qword_1EE58ED28);
    v27(&v33, v9);
    if (v4)
    {
      swift_bridgeObjectRelease();
      sub_1A0278A7C((uint64_t)v9, &qword_1EE58ED28);
      swift_release();
      return;
    }
    sub_1A0278A7C((uint64_t)v9, &qword_1EE58ED28);
    if (v14)
      goto LABEL_2;
LABEL_3:
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v17 >= v25)
      goto LABEL_24;
    v18 = *(_QWORD *)(v24 + 8 * v17);
    if (!v18)
    {
      v19 = v13 + 2;
      if (v13 + 2 >= v25)
        goto LABEL_24;
      v18 = *(_QWORD *)(v24 + 8 * v19);
      if (v18)
        goto LABEL_12;
      v19 = v13 + 3;
      if (v13 + 3 >= v25)
        goto LABEL_24;
      v18 = *(_QWORD *)(v24 + 8 * v19);
      if (v18)
        goto LABEL_12;
      v19 = v13 + 4;
      if (v13 + 4 >= v25)
        goto LABEL_24;
      v18 = *(_QWORD *)(v24 + 8 * v19);
      if (v18)
      {
LABEL_12:
        v17 = v19;
      }
      else
      {
        v17 = v13 + 5;
        if (v13 + 5 >= v25)
          goto LABEL_24;
        v18 = *(_QWORD *)(v24 + 8 * v17);
        if (!v18)
        {
          v22 = v13 + 6;
          while (v22 < v25)
          {
            v18 = *(_QWORD *)(v24 + 8 * v22++);
            if (v18)
            {
              v17 = v22 - 1;
              goto LABEL_13;
            }
          }
LABEL_24:
          swift_release();
          return;
        }
      }
    }
LABEL_13:
    v14 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v13 = v17;
  }
  __break(1u);
}

uint64_t sub_1A02EB538(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
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
  int v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(_QWORD);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD *v68;

  v58 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58ED48);
  v8 = MEMORY[0x1E0C80A78](v7);
  v54 = (uint64_t)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v61 = (uint64_t)&v50 - v11;
  MEMORY[0x1E0C80A78](v10);
  v57 = (uint64_t)&v50 - v12;
  sub_1A02CFAC4(a2);
  v59 = v63;
  v60 = v66;
  v13 = v67;
  v55 = v64;
  v56 = (unint64_t)(v65 + 64) >> 6;
  swift_bridgeObjectRetain();
  v52 = a3;
  v53 = a4;
  v51 = v7;
  if (!v13)
    goto LABEL_3;
LABEL_2:
  v62 = (v13 - 1) & v13;
  v14 = __clz(__rbit64(v13)) | (v60 << 6);
  while (1)
  {
    v19 = v59;
    v20 = *(_QWORD *)(v59 + 48);
    v21 = type metadata accessor for PreprocessorResultCounterKey(0);
    v22 = v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v14;
    v23 = v57;
    sub_1A026F308(v22, v57, type metadata accessor for PreprocessorResultCounterKey);
    *(_QWORD *)(v23 + *(int *)(v7 + 48)) = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v14);
    v24 = v61;
    sub_1A026F340(v23, v61, &qword_1EE58ED48);
    if ((a3(v24) & 1) == 0)
      goto LABEL_33;
    v25 = *(int *)(v7 + 48);
    v26 = v54;
    sub_1A026F308(v24, v54, type metadata accessor for PreprocessorResultCounterKey);
    *(_QWORD *)(v26 + v25) = *(_QWORD *)(v24 + v25);
    v27 = v26 + *(int *)(v21 + 20);
    v28 = v24;
    v29 = *(_DWORD *)v27;
    v30 = *(_QWORD *)(v27 + 8);
    sub_1A02ED43C(v26);
    v31 = *(_QWORD *)(v28 + v25);
    v32 = v58;
    swift_isUniquelyReferenced_nonNull_native();
    v68 = v32;
    v33 = sub_1A02A286C(v29, v30);
    if (__OFADD__(v32[2], (v34 & 1) == 0))
      break;
    v35 = v33;
    v36 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58EED0);
    v37 = sub_1A0307D60();
    v38 = v68;
    if ((v37 & 1) != 0)
    {
      v39 = sub_1A02A286C(v29, v30);
      if ((v36 & 1) != (v40 & 1))
        goto LABEL_40;
      v35 = v39;
    }
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      v38[(v35 >> 6) + 8] |= 1 << v35;
      v41 = v38[6] + 16 * v35;
      *(_DWORD *)v41 = v29;
      *(_QWORD *)(v41 + 8) = v30;
      *(_QWORD *)(v38[7] + 8 * v35) = 0;
      v42 = v38[2];
      v43 = v42 + 1;
      v44 = __OFADD__(v42, 1);
      swift_bridgeObjectRetain();
      if (v44)
        goto LABEL_39;
      v38[2] = v43;
    }
    v45 = v38[7];
    swift_bridgeObjectRelease();
    v46 = *(_QWORD *)(v45 + 8 * v35);
    v47 = __CFADD__(v46, v31);
    v48 = v46 + v31;
    v24 = v61;
    if (v47)
      goto LABEL_37;
    v58 = v38;
    *(_QWORD *)(v45 + 8 * v35) = v48;
    a3 = v52;
    v7 = v51;
LABEL_33:
    sub_1A0278A7C(v24, &qword_1EE58ED48);
    v13 = v62;
    if (v62)
      goto LABEL_2;
LABEL_3:
    v15 = v60 + 1;
    if (__OFADD__(v60, 1))
      goto LABEL_38;
    if (v15 >= v56)
      goto LABEL_35;
    v16 = *(_QWORD *)(v55 + 8 * v15);
    v17 = v60 + 1;
    if (!v16)
    {
      v17 = v60 + 2;
      if (v60 + 2 >= v56)
        goto LABEL_35;
      v16 = *(_QWORD *)(v55 + 8 * v17);
      if (!v16)
      {
        v17 = v60 + 3;
        if (v60 + 3 >= v56)
          goto LABEL_35;
        v16 = *(_QWORD *)(v55 + 8 * v17);
        if (!v16)
        {
          v17 = v60 + 4;
          if (v60 + 4 >= v56)
            goto LABEL_35;
          v16 = *(_QWORD *)(v55 + 8 * v17);
          if (!v16)
          {
            v17 = v60 + 5;
            if (v60 + 5 >= v56)
              goto LABEL_35;
            v16 = *(_QWORD *)(v55 + 8 * v17);
            if (!v16)
            {
              v18 = v60 + 6;
              while (v18 < v56)
              {
                v16 = *(_QWORD *)(v55 + 8 * v18++);
                if (v16)
                {
                  v17 = v18 - 1;
                  goto LABEL_18;
                }
              }
LABEL_35:
              swift_release();
              return (uint64_t)v58;
            }
          }
        }
      }
    }
LABEL_18:
    v62 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
    v60 = v17;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  result = sub_1A0307E74();
  __break(1u);
  return result;
}

uint64_t sub_1A02EB960()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_4_16();
}

uint64_t sub_1A02EB970()
{
  _QWORD *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = sub_1A02EC6E8();
  v0[3] = v1;
  v2 = sub_1A02EC890();
  v0[4] = v2;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A0B0]), sel_init);
  objc_msgSend(v2, sel_setStartedOrChanged_, v3);

  v4 = objc_msgSend(v2, sel_startedOrChanged);
  if (v4)
  {
    v5 = v4;
    v6 = v0[2];
    v7 = OUTLINED_FUNCTION_85_0();
    objc_msgSend(v5, sel_setReason_, sub_1A0264B2C(*(_QWORD *)(v6 + *(int *)(v7 + 20))));

  }
  OUTLINED_FUNCTION_37_2(v1, sel_setPreprocessorExecutionContext_);
  v8 = (_QWORD *)swift_task_alloc();
  v0[5] = v8;
  *v8 = v0;
  v8[1] = sub_1A02EBA68;
  v9 = OUTLINED_FUNCTION_12_19();
  return OUTLINED_FUNCTION_11_20(v9);
}

uint64_t sub_1A02EBA68()
{
  OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1A02EBA9C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);

  return OUTLINED_FUNCTION_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1A02EBAC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[11] = a1;
  v2[12] = v1;
  v3 = OUTLINED_FUNCTION_9();
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

void sub_1A02EBB18()
{
  _QWORD *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  int64_t v35;

  v0[16] = sub_1A02EC6E8();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A0B8]), sel_init);
  v0[17] = v1;
  if (v1)
  {
    v2 = v1;
    v4 = v0[14];
    v3 = v0[15];
    v6 = v0[12];
    v5 = v0[13];
    v33 = v0;
    v7 = v0[11];
    OUTLINED_FUNCTION_2_12((uint64_t)v1, (unint64_t *)&qword_1EE58E5D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
    sub_1A02C5344();
    v9 = v8;
    OUTLINED_FUNCTION_37_2(v2, sel_setContextId_);

    v34 = v7 + 64;
    v10 = -1;
    v11 = -1 << *(_BYTE *)(v7 + 32);
    if (-v11 < 64)
      v10 = ~(-1 << -(char)v11);
    v12 = v10 & *(_QWORD *)(v7 + 64);
    v35 = (unint64_t)(63 - v11) >> 6;
    swift_bridgeObjectRetain();
    v13 = 0;
    if (!v12)
      goto LABEL_6;
LABEL_5:
    v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      v19 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * i);
      v20 = *v19;
      v21 = v19[1];
      v22 = *(void **)(*(_QWORD *)(v7 + 56) + 8 * i);
      v23 = objc_allocWithZone(MEMORY[0x1E0D9A070]);
      swift_bridgeObjectRetain();
      v24 = v22;
      v25 = objc_msgSend(v23, sel_init);
      if (!v25)
        break;
      v26 = v25;
      sub_1A02ED2BC(v20, v21, v25);
      v27 = OUTLINED_FUNCTION_79_0();
      OUTLINED_FUNCTION_16_15(v27, sel_setMessageCount_);
      v28 = OUTLINED_FUNCTION_79_0();
      OUTLINED_FUNCTION_16_15(v28, sel_setMissingTimestampCount_);
      v29 = OUTLINED_FUNCTION_79_0();
      OUTLINED_FUNCTION_16_15(v29, sel_setResult_);
      swift_bridgeObjectRelease();
      objc_msgSend(v2, sel_addOrchestratorStatistics_, v26);

      if (v12)
        goto LABEL_5;
LABEL_6:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
      {
        __break(1u);
LABEL_25:
        __break(1u);
        break;
      }
      if (v16 >= v35)
        goto LABEL_23;
      v17 = *(_QWORD *)(v34 + 8 * v16);
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v35)
          goto LABEL_23;
        v17 = *(_QWORD *)(v34 + 8 * v13);
        if (!v17)
        {
          v13 = v16 + 2;
          if (v16 + 2 >= v35)
            goto LABEL_23;
          v17 = *(_QWORD *)(v34 + 8 * v13);
          if (!v17)
          {
            v18 = v16 + 3;
            if (v18 >= v35)
            {
LABEL_23:
              v30 = swift_release();
              OUTLINED_FUNCTION_0_0(v30, sel_setOrchestratorResultsStatsReported_);
              v31 = (_QWORD *)swift_task_alloc();
              v33[18] = v31;
              *v31 = v33;
              v31[1] = sub_1A02EBE70;
              v32 = OUTLINED_FUNCTION_12_19();
              sub_1A02ECA68(v32);
              return;
            }
            v17 = *(_QWORD *)(v34 + 8 * v18);
            if (!v17)
            {
              while (1)
              {
                v13 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_25;
                if (v13 >= v35)
                  goto LABEL_23;
                v17 = *(_QWORD *)(v34 + 8 * v13);
                ++v18;
                if (v17)
                  goto LABEL_19;
              }
            }
            v13 = v18;
          }
        }
      }
LABEL_19:
      v12 = (v17 - 1) & v17;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1A02EBE70()
{
  OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1A02EBEA4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);

  OUTLINED_FUNCTION_7_1();
  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1A02EBED8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = OUTLINED_FUNCTION_9();
  v2[6] = OUTLINED_FUNCTION_8_18(v3);
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

id sub_1A02EBF10()
{
  _QWORD *v0;
  id v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;

  v1 = sub_1A02EC6E8();
  v0[7] = v1;
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A0C8]), sel_init);
  v0[8] = result;
  if (result)
  {
    v3 = result;
    v5 = v0[5];
    v4 = v0[6];
    v6 = v0[3];
    v7 = v0[4];
    v8 = v0[2];
    OUTLINED_FUNCTION_2_12((uint64_t)result, (unint64_t *)&qword_1EE58E5D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8, v7);
    sub_1A02C5344();
    v10 = v9;
    OUTLINED_FUNCTION_37_2(v3, sel_setClockIdentifier_);

    sub_1A026E1CC();
    v12 = sub_1A0295CA0(v8, v11);
    v14 = v13;
    OUTLINED_FUNCTION_1_7();
    if ((v14 & 1) != 0)
      v15 = 0;
    else
      v15 = v12;
    objc_msgSend(v3, sel_setMessageCount_, v15);
    v16 = *(_QWORD *)(v6 + *(int *)(OUTLINED_FUNCTION_85_0() + 32));
    v17 = OUTLINED_FUNCTION_20_12();
    *(_QWORD *)(v17 + 16) = v8;
    swift_bridgeObjectRetain();
    sub_1A02EB2B0(MEMORY[0x1E0DEE9E0], (void (*)(uint64_t *, char *))sub_1A02ED33C, v17, v16);
    v19 = v18;
    OUTLINED_FUNCTION_1_7();
    swift_task_dealloc();
    v20 = sub_1A02ECE40(v19);
    OUTLINED_FUNCTION_4();
    sub_1A02ED3C0(v20, v3, &qword_1EE58EE58, 0x1E0D9A060, (SEL *)&selRef_setAnyEventTypeStatistics_);
    objc_msgSend(v1, sel_setPreprocessorSessionStartStatsReported_, v3);
    v21 = (_QWORD *)swift_task_alloc();
    v0[9] = v21;
    *v21 = v0;
    v21[1] = sub_1A02EC0DC;
    v22 = OUTLINED_FUNCTION_12_19();
    return (id)sub_1A02ECA68(v22);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A02EC0DC()
{
  OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1A02EC110()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 56);

  OUTLINED_FUNCTION_7_1();
  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1A02EC144()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = v0;
  return OUTLINED_FUNCTION_4_16();
}

uint64_t sub_1A02EC154()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 104) = sub_1A02EC6E8();
  v2 = sub_1A02EC890();
  *(_QWORD *)(v0 + 112) = v2;
  sub_1A02EC96C();
  v4 = v3;
  *(_QWORD *)(v0 + 120) = v3;
  v5 = OUTLINED_FUNCTION_85_0();
  sub_1A02EC6A0(*(_QWORD *)(v1 + *(int *)(v5 + 40)), v0 + 56);
  sub_1A026F340(v0 + 56, v0 + 16, &qword_1EE58EC08);
  if (*(_BYTE *)(v0 + 32) == 0xFF)
  {
    v6 = 5;
  }
  else
  {
    v6 = *(unsigned __int8 *)(v0 + 16);
    if (v6 == 4)
    {
      v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A098]), sel_init);
      OUTLINED_FUNCTION_37_2(v2, sel_setEnded_);

      v8 = objc_msgSend(v2, sel_ended);
      goto LABEL_11;
    }
  }
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A0A0]), sel_init);
  OUTLINED_FUNCTION_37_2(v2, sel_setFailed_);

  v10 = OUTLINED_FUNCTION_24_14();
  if (v10)
  {
    v11 = v10;
    if (v6 == 5 || (v12 = sub_1A0264B7C(v6), (v12 & 0x100000000) != 0))
      v12 = 0;
    objc_msgSend(v11, sel_setFailedAtStep_, v12);

  }
  v8 = OUTLINED_FUNCTION_24_14();
LABEL_11:
  v13 = v8;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, sel_setPreprocessorExecutionMetrics_, v4);

  }
  OUTLINED_FUNCTION_0_0((uint64_t)v13, sel_setPreprocessorExecutionContext_);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v15;
  *v15 = v0;
  v15[1] = sub_1A02EC31C;
  v16 = OUTLINED_FUNCTION_12_19();
  return OUTLINED_FUNCTION_11_20(v16);
}

uint64_t sub_1A02EC31C()
{
  OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1A02EC350()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 112);
  v2 = *(void **)(v0 + 104);

  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1A02EC384(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = OUTLINED_FUNCTION_9();
  v2[6] = OUTLINED_FUNCTION_8_18(v3);
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

id sub_1A02EC3BC()
{
  _QWORD *v0;
  id v1;
  id result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
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
  _QWORD *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;

  v1 = sub_1A02EC6E8();
  v0[7] = v1;
  result = OUTLINED_FUNCTION_19_15(objc_allocWithZone(MEMORY[0x1E0D9A0C0]));
  v0[8] = result;
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v34 = result;
  v36 = v1;
  result = OUTLINED_FUNCTION_19_15(objc_allocWithZone(MEMORY[0x1E0D9A0D0]));
  v0[9] = result;
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v3 = result;
  v4 = v0[5];
  v5 = v0[6];
  v7 = v0[3];
  v6 = v0[4];
  v8 = v0[2];
  OUTLINED_FUNCTION_2_12((uint64_t)result, (unint64_t *)&qword_1EE58E5D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v8, v6);
  sub_1A02C5344();
  v10 = v9;
  OUTLINED_FUNCTION_37_2(v3, sel_setClockIdentifier_);

  sub_1A026E8D8();
  v12 = sub_1A0295CA0(v8, v11);
  v14 = v13;
  OUTLINED_FUNCTION_1_7();
  if ((v14 & 1) != 0)
    v15 = 0;
  else
    v15 = v12;
  objc_msgSend(v3, sel_setMessageCount_, v15, v34);
  v16 = OUTLINED_FUNCTION_20_12();
  *(_QWORD *)(v16 + 16) = v8;
  v17 = *(int *)(OUTLINED_FUNCTION_85_0() + 36);
  v18 = *(_QWORD *)(v7 + v17);
  swift_bridgeObjectRetain();
  v19 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v20 = sub_1A02EB538(MEMORY[0x1E0DEE9E0], v18, (uint64_t (*)(_QWORD))sub_1A02ED42C, v16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_1();
  v21 = sub_1A02ECE40(v20);
  swift_bridgeObjectRelease();
  v22 = OUTLINED_FUNCTION_20_12();
  *(_QWORD *)(v22 + 16) = v8;
  v23 = *(_QWORD *)(v7 + v17);
  swift_bridgeObjectRetain();
  v24 = sub_1A02EB538(v19, v23, (uint64_t (*)(_QWORD))sub_1A02ED434, v22);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v25 = sub_1A02ECE40(v24);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_15_17(v21, v26, v27, v28, (SEL *)&selRef_setPublishedEventStatistics_);
  OUTLINED_FUNCTION_15_17(v25, v29, v30, v31, (SEL *)&selRef_setRedactedEventStatistics_);
  objc_msgSend(v35, sel_setOffDeviceClockStatistics_, v3);
  OUTLINED_FUNCTION_37_2(v36, sel_setPreprocessorSessionEndStatsReported_);
  v32 = (_QWORD *)swift_task_alloc();
  v0[10] = v32;
  *v32 = v0;
  v32[1] = sub_1A02EC624;
  v33 = OUTLINED_FUNCTION_12_19();
  return (id)sub_1A02ECA68(v33);
}

uint64_t sub_1A02EC624()
{
  OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_1_15();
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1A02EC658()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 64);
  v2 = *(void **)(v0 + 56);

  OUTLINED_FUNCTION_7_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A02EC6A0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = (uint64_t *)(result + 40 * v2);
    v2 = *((unsigned __int8 *)v3 - 8);
    v4 = *v3;
    v5 = *((unsigned __int8 *)v3 + 8);
    v6 = v3[2];
    v7 = *((_BYTE *)v3 + 24);
  }
  else
  {
    v4 = 0;
    v6 = 0;
    v7 = 0;
    v5 = 255;
  }
  *(_QWORD *)a2 = v2;
  *(_QWORD *)(a2 + 8) = v4;
  *(_QWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 24) = v6;
  *(_BYTE *)(a2 + 32) = v7;
  return result;
}

id sub_1A02EC6E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id result;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v0 = sub_1A03072D4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = OUTLINED_FUNCTION_19_15(objc_allocWithZone(MEMORY[0x1E0D9A078]));
  if (!result)
    goto LABEL_13;
  v5 = result;
  v6 = OUTLINED_FUNCTION_19_15(objc_allocWithZone(MEMORY[0x1E0D9A088]));
  OUTLINED_FUNCTION_37_2(v5, sel_setEventMetadata_);

  v7 = OUTLINED_FUNCTION_29_11();
  if (v7)
  {
    v8 = v7;
    OUTLINED_FUNCTION_2_12((uint64_t)v7, &qword_1EE58EE48);
    v9 = static PFAPFADeviceDimensions.current()();
    OUTLINED_FUNCTION_37_2(v8, sel_setDeviceDimensions_);

  }
  v10 = OUTLINED_FUNCTION_29_11();
  if (!v10)
    return v5;
  v11 = v10;
  sub_1A03072BC();
  sub_1A03072B0();
  v13 = v12;
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v14 = v13 * 1000.0;
  if ((~COERCE__INT64(v13 * 1000.0) & 0x7FF0000000000000) != 0)
  {
    if (v14 > -9.22337204e18)
    {
      if (v14 < 9.22337204e18)
      {
        objc_msgSend(v11, sel_setEventTimestampInMsSince1970_, (uint64_t)v14);

        return v5;
      }
      goto LABEL_12;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

id sub_1A02EC890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id result;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v1 = OUTLINED_FUNCTION_9();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A090]), sel_init);
  if (result)
  {
    v6 = result;
    OUTLINED_FUNCTION_2_12((uint64_t)result, (unint64_t *)&qword_1EE58E5D0);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0, v1);
    sub_1A02C5344();
    v8 = v7;
    objc_msgSend(v6, sel_setContextId_, v7);

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A02EC96C()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  unint64_t v7;
  unint64_t Nanoseconds;
  _BYTE v9[40];
  _BYTE v10[8];
  unint64_t v11;
  unsigned __int8 v12;
  unint64_t v13;
  char v14;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A0A8]), sel_init);
  if (!v1)
    goto LABEL_11;
  v2 = v1;
  sub_1A026DFF4();
  objc_msgSend(v2, sel_setStagedMessageCount_, v3);
  sub_1A026E588();
  objc_msgSend(v2, sel_setProcessedMessageCount_, v4);
  v5 = OUTLINED_FUNCTION_85_0();
  sub_1A02EC6A0(*(_QWORD *)(v0 + *(int *)(v5 + 40)), (uint64_t)v9);
  sub_1A026F340((uint64_t)v9, (uint64_t)v10, &qword_1EE58EC08);
  v6 = v12;
  if (v12 == 255)
    return;
  v7 = v11;
  Nanoseconds = v13;
  if ((v14 & 1) == 0)
    Nanoseconds = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(v13);
  if ((v6 & 1) == 0)
    v7 = SiriAnalyticsMachAbsoluteTimeGetNanoseconds(v7);
  if (__OFSUB__(Nanoseconds, v7))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return;
  }
  objc_msgSend(v2, sel_setExecutionTimeInNs_, Nanoseconds - v7);
}

uint64_t sub_1A02ECA68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return OUTLINED_FUNCTION_4_16();
}

uint64_t sub_1A02ECA78()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v7;
  uint64_t (*v8)(uint64_t);

  v1 = objc_msgSend(*(id *)(v0 + 40), sel_wrapAsAnyEvent);
  *(_QWORD *)(v0 + 56) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 48);
    v3 = (_QWORD *)(v2 + *(int *)(OUTLINED_FUNCTION_85_0() + 28));
    v8 = (uint64_t (*)(uint64_t))(*(int *)*v3 + *v3);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v4;
    *v4 = v0;
    v4[1] = sub_1A02ECCA4;
    v5 = OUTLINED_FUNCTION_12_19();
    return v8(v5);
  }
  else
  {
    if (qword_1ED07ADE8 != -1)
      swift_once();
    sub_1A02B97F8(0xD000000000000026, 0x80000001A0311490, 0xD000000000000077, 0x80000001A03114C0, 0x293A5F2874696D65, 0xE800000000000000);
    sub_1A02ED300();
    v7 = (void *)swift_allocError();
    swift_willThrow();
    if (qword_1ED07ADE8 != -1)
      swift_once();
    sub_1A0307CAC();
    *(_QWORD *)(v0 + 16) = 0;
    *(_QWORD *)(v0 + 24) = 0xE000000000000000;
    sub_1A0307838();
    *(_QWORD *)(v0 + 32) = v7;
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED07DB80);
    sub_1A0307D54();
    OUTLINED_FUNCTION_7_26(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 0xD000000000000077, 0x80000001A03114C0);
    swift_bridgeObjectRelease();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1A02ECCA4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_10_4();
  *v2 = *v1;
  *(_QWORD *)(v3 + 72) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13_5();
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1A02ECCF4()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_16(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1A02ECD1C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 72);
  if (qword_1ED07ADE8 != -1)
    swift_once();
  sub_1A0307CAC();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_1A0307838();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED07DB80);
  sub_1A0307D54();
  OUTLINED_FUNCTION_7_26(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), 0xD000000000000077, 0x80000001A03114C0);
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1A02ECE40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  unsigned int *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  int64_t v39;
  uint64_t v41;

  v38 = a1 + 64;
  v1 = 1 << *(_BYTE *)(a1 + 32);
  v2 = -1;
  if (v1 < 64)
    v2 = ~(-1 << v1);
  v3 = v2 & *(_QWORD *)(a1 + 64);
  v39 = (unint64_t)(v1 + 63) >> 6;
  swift_bridgeObjectRetain();
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  while (1)
  {
    if (v3)
    {
      v6 = __clz(__rbit64(v3));
      v3 &= v3 - 1;
      v7 = v6 | (v4 << 6);
    }
    else
    {
      v8 = v4 + 1;
      if (__OFADD__(v4, 1))
        goto LABEL_45;
      if (v8 >= v39)
      {
LABEL_41:
        swift_release();
        swift_bridgeObjectRetain();
        sub_1A02CED9C();
        v36 = v35;
        swift_bridgeObjectRelease_n();
        return v36;
      }
      v9 = *(_QWORD *)(v38 + 8 * v8);
      ++v4;
      if (!v9)
      {
        v4 = v8 + 1;
        if (v8 + 1 >= v39)
          goto LABEL_41;
        v9 = *(_QWORD *)(v38 + 8 * v4);
        if (!v9)
        {
          v4 = v8 + 2;
          if (v8 + 2 >= v39)
            goto LABEL_41;
          v9 = *(_QWORD *)(v38 + 8 * v4);
          if (!v9)
          {
            v10 = v8 + 3;
            if (v10 >= v39)
              goto LABEL_41;
            v9 = *(_QWORD *)(v38 + 8 * v10);
            if (!v9)
            {
              while (1)
              {
                v4 = v10 + 1;
                if (__OFADD__(v10, 1))
                  goto LABEL_46;
                if (v4 >= v39)
                  goto LABEL_41;
                v9 = *(_QWORD *)(v38 + 8 * v4);
                ++v10;
                if (v9)
                  goto LABEL_19;
              }
            }
            v4 = v10;
          }
        }
      }
LABEL_19:
      v3 = (v9 - 1) & v9;
      v7 = __clz(__rbit64(v9)) + (v4 << 6);
    }
    v11 = (unsigned int *)(*(_QWORD *)(a1 + 48) + 16 * v7);
    v12 = *v11;
    v13 = *((_QWORD *)v11 + 1);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v7);
    if (v5[2] && (v15 = OUTLINED_FUNCTION_28_14(), (v16 & 1) != 0))
    {
      v17 = *(id *)(v5[7] + 8 * v15);
    }
    else
    {
      v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A060]), sel_init);
      if (!v17)
        goto LABEL_48;
    }
    objc_msgSend(v17, sel_setAnyEventType_, v12);
    v18 = objc_msgSend(v17, sel_messageCount);
    if (__CFADD__((_DWORD)v18, (_DWORD)v14))
      break;
    OUTLINED_FUNCTION_16_15((uint64_t)v18, sel_setMessageCount_);
    v19 = sub_1A02ED354(v17);
    v20 = MEMORY[0x1E0DEE9D8];
    if (v19)
      v20 = v19;
    v41 = v20;
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A068]), sel_init);
    if (!v21)
      goto LABEL_47;
    if ((v13 & 0x8000000000000000) != 0 || HIDWORD(v13))
      goto LABEL_49;
    v22 = v21;
    objc_msgSend(v21, sel_setOrdinal_, v13);
    objc_msgSend(v22, sel_setMessageCount_, v14);
    v23 = v22;
    MEMORY[0x1A1AF6C9C]();
    if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1A03078E0();
    sub_1A03078F8();
    sub_1A03078D4();
    sub_1A02ED3C0(v41, v17, &qword_1EE58EE38, 0x1E0D9A068, (SEL *)&selRef_setEventStatistics_);
    v24 = v17;
    swift_isUniquelyReferenced_nonNull_native();
    v25 = OUTLINED_FUNCTION_28_14();
    if (__OFADD__(v5[2], (v26 & 1) == 0))
      goto LABEL_43;
    v27 = v25;
    v28 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E740);
    if ((sub_1A0307D60() & 1) != 0)
    {
      v29 = sub_1A02A2944(v12);
      if ((v28 & 1) != (v30 & 1))
        goto LABEL_50;
      v27 = v29;
    }
    if ((v28 & 1) != 0)
    {
      v31 = v5[7];

      *(_QWORD *)(v31 + 8 * v27) = v24;
    }
    else
    {
      v5[(v27 >> 6) + 8] |= 1 << v27;
      *(_DWORD *)(v5[6] + 4 * v27) = v12;
      *(_QWORD *)(v5[7] + 8 * v27) = v24;
      v32 = v5[2];
      v33 = __OFADD__(v32, 1);
      v34 = v32 + 1;
      if (v33)
        goto LABEL_44;
      v5[2] = v34;
    }

    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  OUTLINED_FUNCTION_0_18();
  sub_1A0307DA8();
  __break(1u);
LABEL_50:
  type metadata accessor for SISchemaAnyEventType(0);
  result = sub_1A0307E74();
  __break(1u);
  return result;
}

void sub_1A02ED2BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1A03077A8();
  objc_msgSend(a3, sel_setBundleId_, v4);

}

unint64_t sub_1A02ED300()
{
  unint64_t result;

  result = qword_1EE58FE60;
  if (!qword_1EE58FE60)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A0318FD4, &type metadata for PreprocessorTelemetryError);
    atomic_store(result, &qword_1EE58FE60);
  }
  return result;
}

uint64_t sub_1A02ED33C(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A026EE34(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1A02ED354(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_eventStatistics);
  if (!v1)
    return 0;
  v2 = v1;
  sub_1A0274D08(0, &qword_1EE58EE38);
  v3 = sub_1A03078BC();

  return v3;
}

void sub_1A02ED3C0(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  id v7;

  sub_1A0274D08(0, a3);
  v7 = (id)sub_1A03078B0();
  OUTLINED_FUNCTION_4();
  objc_msgSend(a2, *a5, v7);

}

void sub_1A02ED42C()
{
  sub_1A026F0A4();
}

void sub_1A02ED434()
{
  sub_1A026F1A0();
}

uint64_t sub_1A02ED43C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreprocessorResultCounterKey(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t storeEnumTagSinglePayload for PreprocessorTelemetryError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A02ED4B8 + 4 * byte_1A0318F40[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A02ED4D8 + 4 * byte_1A0318F45[v4]))();
}

_BYTE *sub_1A02ED4B8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A02ED4D8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A02ED4E0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A02ED4E8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A02ED4F0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A02ED4F8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PreprocessorTelemetryError()
{
  return &type metadata for PreprocessorTelemetryError;
}

unint64_t sub_1A02ED518()
{
  unint64_t result;

  result = qword_1EE58FE88;
  if (!qword_1EE58FE88)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A0318FAC, &type metadata for PreprocessorTelemetryError);
    atomic_store(result, (unint64_t *)&qword_1EE58FE88);
  }
  return result;
}

void OUTLINED_FUNCTION_7_26(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A02B97F8(a1, a2, a3, a4, 0x293A5F2874696D65, 0xE800000000000000);
}

uint64_t OUTLINED_FUNCTION_8_18(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(a1 - 8);
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_11_20(uint64_t a1)
{
  return sub_1A02ECA68(a1);
}

uint64_t OUTLINED_FUNCTION_12_19()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_15_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  unint64_t *v5;
  void *v6;
  uint64_t v7;

  sub_1A02ED3C0(a1, v6, v5, v7, a5);
}

id OUTLINED_FUNCTION_16_15(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_19_15(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_20_12()
{
  return swift_task_alloc();
}

id OUTLINED_FUNCTION_24_14()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 1085));
}

uint64_t OUTLINED_FUNCTION_28_14()
{
  uint64_t v0;

  return sub_1A02A2944(v0);
}

id OUTLINED_FUNCTION_29_11()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 239));
}

ValueMetadata *type metadata accessor for EmbeddedDeviceLockState()
{
  return &type metadata for EmbeddedDeviceLockState;
}

BOOL sub_1A02ED5FC(int a1)
{
  return a1 == 0;
}

BOOL sub_1A02ED608()
{
  int *v0;

  return sub_1A02ED5FC(*v0);
}

uint64_t sub_1A02ED610(uint64_t a1)
{
  uint64_t result;

  result = 0x7078456B636F6C63;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x61727473746F6F62;
      break;
    case 2:
      result = 0xD000000000000011;
      break;
    case 3:
      result = 0x75526C61756E616DLL;
      break;
    default:
      result = OUTLINED_FUNCTION_0_42();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_1A02ED6D4(unint64_t a1)
{
  uint64_t result;

  if (a1 < 4)
    return dword_1A0314DF0[a1];
  result = OUTLINED_FUNCTION_0_42();
  __break(1u);
  return result;
}

unint64_t ProcessingReason.init(rawValue:)(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

unint64_t sub_1A02ED734()
{
  unint64_t result;

  result = qword_1EE58FE90;
  if (!qword_1EE58FE90)
  {
    result = MEMORY[0x1A1AF7D34](&protocol conformance descriptor for ProcessingReason, &type metadata for ProcessingReason);
    atomic_store(result, (unint64_t *)&qword_1EE58FE90);
  }
  return result;
}

void sub_1A02ED770()
{
  sub_1A0263F6C();
}

void sub_1A02ED778()
{
  sub_1A0298478();
}

void sub_1A02ED780()
{
  sub_1A0298628();
}

unint64_t sub_1A02ED788@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = ProcessingReason.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1A02ED7B8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for ProcessingReason()
{
  return &type metadata for ProcessingReason;
}

uint64_t OUTLINED_FUNCTION_0_42()
{
  return sub_1A0307E5C();
}

uint64_t ComponentId.init(identifierType:uuid:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  char *v4;
  uint64_t v5;

  *a3 = a1;
  v4 = (char *)a3 + *(int *)(type metadata accessor for ComponentId(0) + 20);
  v5 = OUTLINED_FUNCTION_9();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, a2, v5);
}

uint64_t type metadata accessor for ComponentId(uint64_t a1)
{
  return sub_1A026F2D8(a1, qword_1ED07AF38);
}

void static TagPredicate.== infix(_:_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  type metadata accessor for MessageGroupIdentifier(0);
  OUTLINED_FUNCTION_5();
  v3 = MEMORY[0x1E0C80A78](v2);
  MEMORY[0x1E0C80A78](v3);
  __asm { BR              X10 }
}

void sub_1A02ED8D0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1A027B840(v0);
  sub_1A027B840(v1);
  OUTLINED_FUNCTION_0_43();
  OUTLINED_FUNCTION_56_3();
}

uint64_t TagPredicate.init(requestIdentifier:clustered:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58E718);
  v7 = swift_allocBox();
  v9 = v8;
  v10 = *(int *)(v6 + 48);
  *v8 = 1;
  v11 = (char *)v8 + *(int *)(type metadata accessor for ComponentId(0) + 20);
  v12 = OUTLINED_FUNCTION_9();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a1, v12);
  *((_BYTE *)v9 + v10) = a2;
  *a3 = v7 | 0x2000000000000000;
  return result;
}

uint64_t type metadata accessor for MessageGroupIdentifier(uint64_t a1)
{
  return sub_1A026F2D8(a1, qword_1EE58E660);
}

void static MessageGroupIdentifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  type metadata accessor for ComponentId(0);
  OUTLINED_FUNCTION_5();
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (_DWORD *)((char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v9 = (_DWORD *)((char *)&v15 - v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58FE98);
  OUTLINED_FUNCTION_5();
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_1A027A35C(a1, (uint64_t)v13);
  sub_1A027A35C(a2, v14);
  sub_1A02A8300((uint64_t)v13, (uint64_t)v9);
  sub_1A02A8300(v14, (uint64_t)v7);
  if (*v9 == *v7)
    sub_1A0307310();
  sub_1A02A9E8C((uint64_t)v7, type metadata accessor for ComponentId);
  sub_1A02A9E8C((uint64_t)v9, type metadata accessor for ComponentId);
  OUTLINED_FUNCTION_56_3();
}

uint64_t sub_1A02EDCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v9 = 1;
    }
    else
    {
      v3 = (uint64_t *)(a1 + 32);
      v4 = (uint64_t *)(a2 + 32);
      v5 = v2 - 1;
      do
      {
        v7 = *v3++;
        v6 = v7;
        v8 = *v4++;
        v13 = v8;
        v14 = v6;
        v9 = static TagPredicate.== infix(_:_:)(&v14, &v13);
        v11 = v5-- != 0;
      }
      while ((v9 & 1) != 0 && v11);
    }
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

uint64_t static ComponentId.== infix(_:_:)(_DWORD *a1, _DWORD *a2)
{
  if (*a1 != *a2)
    return 0;
  type metadata accessor for ComponentId(0);
  return sub_1A0307310();
}

unint64_t *initializeBufferWithCopyOfBuffer for TagPredicate(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_1A027B840(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for TagPredicate(unint64_t *a1)
{
  return sub_1A027B870(*a1);
}

unint64_t *assignWithCopy for TagPredicate(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_1A027B840(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_1A027B870(v4);
  return a1;
}

unint64_t *assignWithTake for TagPredicate(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_1A027B870(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for TagPredicate(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7B && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 122;
    }
    else
    {
      v2 = (((*(_QWORD *)a1 >> 57) >> 4) | (8 * ((*(_QWORD *)a1 >> 57) & 8 | *(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x7A)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TagPredicate(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7A)
  {
    *(_QWORD *)result = a2 - 123;
    if (a3 >= 0x7B)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7B)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1A02EDED4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 61;
  if (v1 <= 4)
    return v1;
  else
    return (*a1 >> 3) + 5;
}

_QWORD *sub_1A02EDEF0(_QWORD *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_1A02EDF00(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 5)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 61;
  }
  else
  {
    v2 = 8 * (a2 - 5);
    v3 = 0xA000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for TagPredicate()
{
  return &type metadata for TagPredicate;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageGroupIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v6 = *(int *)(type metadata accessor for ComponentId(0) + 20);
    v7 = (char *)v4 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_1A0307334();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return v4;
}

uint64_t destroy for MessageGroupIdentifier(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1 + *(int *)(type metadata accessor for ComponentId(0) + 20);
  v2 = sub_1A0307334();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

_DWORD *initializeWithCopy for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_DWORD *initializeWithTake for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithTake for MessageGroupIdentifier(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(type metadata accessor for ComponentId(0) + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageGroupIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58EBF8);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MessageGroupIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58EBF8);
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v6);
}

uint64_t sub_1A02EE234(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for ComponentId(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ComponentId(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1A0307334();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for ComponentId(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1A0307334();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_DWORD *initializeWithCopy for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithCopy for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_DWORD *initializeWithTake for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_DWORD *assignWithTake for ComponentId(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1A0307334();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentId()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A02EE4CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = OUTLINED_FUNCTION_9();
  return __swift_getEnumTagSinglePayload(v4, a2, v5);
}

uint64_t storeEnumTagSinglePayload for ComponentId()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A02EE50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = OUTLINED_FUNCTION_9();
  return __swift_storeEnumTagSinglePayload(v5, a2, a2, v6);
}

uint64_t sub_1A02EE544()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A0307334();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t OUTLINED_FUNCTION_0_43()
{
  unint64_t v0;
  unint64_t v1;

  sub_1A027B870(v1);
  return sub_1A027B870(v0);
}

unint64_t OUTLINED_FUNCTION_1_46()
{
  unint64_t v0;
  unint64_t v1;

  sub_1A027B840(v0);
  return sub_1A027B840(v1);
}

void TagShim.__allocating_init(identifier:underlying:)(uint64_t a1, uint64_t a2)
{
  sub_1A02EE688(a1, a2, sub_1A02EF2E8);
}

SiriAnalytics::TagSpace_optional __swiftcall TagSpace.init(rawValue:)(Swift::UInt32 rawValue)
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
  return (SiriAnalytics::TagSpace_optional)rawValue;
}

uint64_t TagSpace.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_1A02EE620(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1A02A0178(a1, *v1);
}

SiriAnalytics::TagSpace_optional sub_1A02EE628(Swift::UInt32 *a1)
{
  return TagSpace.init(rawValue:)(*a1);
}

uint64_t sub_1A02EE630@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;

  result = TagSpace.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t TagShim.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A027AFF0(v1 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, a1);
}

uint64_t TagShim.underlying.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A027621C(v1 + OBJC_IVAR___SiriAnalyticsTagShim_underlying, a1);
}

void TagShim.init(identifier:underlying:)(uint64_t a1, uint64_t a2)
{
  sub_1A02EE688(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1A02EF388);
}

void sub_1A02EE688(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_QWORD *)(a2 + 32);
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a2, v7);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_6();
  v12 = v11 - v10;
  (*(void (**)(uint64_t))(v13 + 16))(v11 - v10);
  a3(a1, v12, v3, v7, v8);
  __swift_destroy_boxed_opaque_existential_1(a2);
  OUTLINED_FUNCTION_56_3();
}

uint64_t static TagShim.supportsSecureCoding.getter()
{
  OUTLINED_FUNCTION_0_8();
  return byte_1EE58FEA0;
}

uint64_t static TagShim.supportsSecureCoding.setter(char a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_0_8();
  byte_1EE58FEA0 = a1;
  return result;
}

uint64_t (*static TagShim.supportsSecureCoding.modify())()
{
  OUTLINED_FUNCTION_0_8();
  return j__swift_endAccess;
}

void sub_1A02EE810(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  __int128 *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v30[2];
  uint64_t v31;
  _BYTE v32[32];
  uint64_t v33;
  _QWORD v34[4];

  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_6();
  v8 = v7 - v6;
  v9 = sub_1A0307334();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_1_20();
  OUTLINED_FUNCTION_12_20(v11, (uint64_t)v32);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE58E690);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58EDF8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v31 = 0;
    memset(v30, 0, sizeof(v30));
    v16 = &qword_1EE58EE00;
    v17 = v30;
LABEL_5:
    sub_1A0278A7C((uint64_t)v17, v16);
    return;
  }
  sub_1A027106C(v30, (uint64_t)v34);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D82B98]), sel_init);
  if (v12)
  {
    v28 = v10;
    v29 = a1;
    v13 = v12;
    OUTLINED_FUNCTION_12_20((uint64_t)v12, (uint64_t)v32);
    v14 = OUTLINED_FUNCTION_2_39();
    v15 = v33;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v15 + 8))(v30, v14, v15);
    __swift_project_boxed_opaque_existential_1(v34, v34[3]);
    sub_1A0307658();
    v18 = sub_1A02EF288(v13);
    v20 = v19;
    OUTLINED_FUNCTION_12_20(v18, (uint64_t)v32);
    v21 = OUTLINED_FUNCTION_2_39();
    v22 = v33;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v22 + 8))(v30, v21, v22);
    v23 = LOBYTE(v30[0]);
    v24 = (void *)OUTLINED_FUNCTION_5_24();
    objc_msgSend(v29, sel_encodeInt32_forKey_, v23, v24);

    if (v20 >> 60 != 15)
    {
      sub_1A02652C0(v18, v20);
      sub_1A0307280();
      OUTLINED_FUNCTION_52_3();
    }
    v25 = (void *)OUTLINED_FUNCTION_1_25();
    OUTLINED_FUNCTION_9_18((uint64_t)v25, sel_encodeObject_forKey_);
    swift_unknownObjectRelease();

    sub_1A027AFF0(v3 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, v8);
    if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
    {
      OUTLINED_FUNCTION_76_4();
      OUTLINED_FUNCTION_52_3();

      v16 = &qword_1ED07BC80;
      v17 = (__int128 *)v8;
      goto LABEL_5;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v2, v8, v9);
    v26 = (void *)sub_1A0307304();
    v27 = (void *)OUTLINED_FUNCTION_0_44();
    OUTLINED_FUNCTION_9_18((uint64_t)v27, sel_encodeObject_forKey_);

    OUTLINED_FUNCTION_52_3();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v2, v9);
  }
  OUTLINED_FUNCTION_76_4();
}

void TagShim.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  TagShim.init(coder:)(a1);
  OUTLINED_FUNCTION_7();
}

uint64_t TagShim.init(coder:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  unsigned int v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t result;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  objc_class *v30;
  objc_super v31;
  __int128 v32;
  ValueMetadata *v33;
  _UNKNOWN **v34;
  uint64_t v35;
  unint64_t v36;
  _OWORD v37[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v31 - v7;
  v9 = v1;
  v10 = (void *)OUTLINED_FUNCTION_5_24();
  v11 = objc_msgSend(a1, sel_decodeInt32ForKey_, v10);

  if ((v11 & 0x80000000) != 0)
    goto LABEL_28;
  if (v11)
  {
    if (v11 != 1)
      goto LABEL_15;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)OUTLINED_FUNCTION_1_25();
  v14 = objc_msgSend(a1, sel_decodeObjectForKey_, v13);

  if (v14)
  {
    sub_1A0307BE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v37, 0, sizeof(v37));
  }
  sub_1A02EF47C((uint64_t)v37, (uint64_t)&v32, &qword_1EE58EF58);
  if (!v33)
  {

    sub_1A0278A7C((uint64_t)&v32, &qword_1EE58EF58);
    goto LABEL_17;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:

LABEL_17:
    OUTLINED_FUNCTION_9_6();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v15 = v35;
  v16 = v36;
  v17 = (void *)OUTLINED_FUNCTION_0_44();
  v18 = objc_msgSend(a1, sel_containsValueForKey_, v17);

  if (v18 && (sub_1A02EF4E8(), (v19 = sub_1A0307B5C()) != 0))
  {
    v20 = (void *)v19;
    v21 = sub_1A0307334();
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v21);
    sub_1A02EF524();
    sub_1A0307DFC();

    if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v21) == 1)
    {
      v22 = (uint64_t)v8;
      v23 = 1;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v8, v6, v21);
      v22 = (uint64_t)v8;
      v23 = 0;
    }
    v26 = v21;
  }
  else
  {
    v26 = sub_1A0307334();
    v22 = (uint64_t)v8;
    v23 = 1;
  }
  __swift_storeEnumTagSinglePayload(v22, v23, 1, v26);
  sub_1A02EF47C((uint64_t)v8, (uint64_t)v9 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, &qword_1ED07BC80);
  v27 = objc_allocWithZone(MEMORY[0x1E0D82B90]);
  sub_1A02652C0(v15, v16);
  v28 = sub_1A026D47C(v15, v16);
  if (v28)
  {
    v29 = v28;
    if ((v12 & 1) != 0)
    {
      v33 = &type metadata for DataClassificationTag;
      v34 = &protocol witness table for DataClassificationTag;
      *(_QWORD *)&v32 = swift_allocObject();
      static DataClassificationTag.read(from:)(v32 + 16);
    }
    else
    {
      v33 = &type metadata for SensitiveConditionTag;
      v34 = &protocol witness table for SensitiveConditionTag;
      static SensitiveConditionTag.read(from:)();
    }
    OUTLINED_FUNCTION_14_19();

    sub_1A027106C(&v32, (uint64_t)v9 + OBJC_IVAR___SiriAnalyticsTagShim_underlying);
    v30 = (objc_class *)OUTLINED_FUNCTION_9_6();
    v31.receiver = v9;
    v31.super_class = v30;
    v24 = objc_msgSendSuper2(&v31, sel_init);

    return (uint64_t)v24;
  }
  __break(1u);
LABEL_28:
  result = sub_1A0307DA8();
  __break(1u);
  return result;
}

uint64_t sub_1A02EF064()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED07BC80);
  OUTLINED_FUNCTION_5();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_6();
  v4 = v3 - v2;
  sub_1A0307CAC();
  sub_1A0307838();
  swift_getObjectType();
  sub_1A0307F64();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  sub_1A027AFF0(v0 + OBJC_IVAR___SiriAnalyticsTagShim_identifier, v4);
  sub_1A0307808();
  sub_1A0307838();
  swift_bridgeObjectRelease();
  sub_1A0307838();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE58E690);
  sub_1A0307D54();
  sub_1A0307838();
  return 0;
}

id TagShim.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TagShim.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TagShim.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_9_6();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A02EF288(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_immutableData);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1A030728C();

  return v3;
}

void sub_1A02EF2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  id v11;

  v10 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_1_20();
  v11 = objc_allocWithZone((Class)OUTLINED_FUNCTION_9_6());
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v5, a2, a4);
  sub_1A02EF388(a1, v5, v11, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, a4);
  OUTLINED_FUNCTION_56_3();
}

id sub_1A02EF388(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  id v10;
  objc_super v12;
  uint64_t v13[5];

  v13[3] = a4;
  v13[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  sub_1A027AFF0(a1, (uint64_t)a3 + OBJC_IVAR___SiriAnalyticsTagShim_identifier);
  sub_1A027621C((uint64_t)v13, (uint64_t)a3 + OBJC_IVAR___SiriAnalyticsTagShim_underlying);
  v12.receiver = a3;
  v12.super_class = (Class)type metadata accessor for TagShim();
  v10 = objc_msgSendSuper2(&v12, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  sub_1A0278A7C(a1, &qword_1ED07BC80);
  return v10;
}

uint64_t type metadata accessor for TagShim()
{
  uint64_t result;

  result = qword_1ED07DDF0;
  if (!qword_1ED07DDF0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1A02EF47C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A02EF4BC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A027B870(*(_QWORD *)(v0 + 56));
  return swift_deallocObject();
}

unint64_t sub_1A02EF4E8()
{
  unint64_t result;

  result = qword_1ED07AEF0;
  if (!qword_1ED07AEF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED07AEF0);
  }
  return result;
}

unint64_t sub_1A02EF524()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED07AEC8;
  if (!qword_1ED07AEC8)
  {
    v1 = sub_1A0307334();
    result = MEMORY[0x1A1AF7D34](MEMORY[0x1E0CB09E8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED07AEC8);
  }
  return result;
}

unint64_t sub_1A02EF568()
{
  unint64_t result;

  result = qword_1EE58FEB0;
  if (!qword_1EE58FEB0)
  {
    result = MEMORY[0x1A1AF7D34](&protocol conformance descriptor for TagSpace, &type metadata for TagSpace);
    atomic_store(result, (unint64_t *)&qword_1EE58FEB0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TagSpace(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A02EF5F0 + 4 * byte_1A0319222[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A02EF624 + 4 * asc_1A031921D[v4]))();
}

uint64_t sub_1A02EF624(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A02EF62C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A02EF634);
  return result;
}

uint64_t sub_1A02EF640(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A02EF648);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A02EF64C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A02EF654(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TagSpace()
{
  return &type metadata for TagSpace;
}

uint64_t dispatch thunk of static Tag.space.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1A02EF678()
{
  unint64_t v0;

  sub_1A027E5A8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for TagShim()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TagShim.__allocating_init(identifier:underlying:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of TagShim.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TagShim.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t OUTLINED_FUNCTION_0_44()
{
  return sub_1A03077A8();
}

uint64_t OUTLINED_FUNCTION_2_39()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 168), *(_QWORD *)(v0 - 144));
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_5_24()
{
  return sub_1A03077A8();
}

id OUTLINED_FUNCTION_9_18(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  return objc_msgSend(v4, a2, v2, v3);
}

uint64_t OUTLINED_FUNCTION_12_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A027621C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_14_19()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1A02653E8(v0, v1);
}

void sub_1A02EF79C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7[2];
  _BYTE v8[80];

  sub_1A02EF89C();
  if (!v1)
  {
    sub_1A02EF9D4((uint64_t)&v5);
    if (v6)
    {
      sub_1A0278A7C((uint64_t)v8, &qword_1EE58ECD0);
      sub_1A027106C(&v5, (uint64_t)v7);
      sub_1A027106C(v7, a1);
    }
    else
    {
      sub_1A0278A7C((uint64_t)&v5, &qword_1EE58EE00);
      v3 = sub_1A03076C4();
      sub_1A0271F64();
      swift_allocError();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v4, *MEMORY[0x1E0D1D028], v3);
      swift_willThrow();
      sub_1A0278A7C((uint64_t)v8, &qword_1EE58ECD0);
    }
  }
}

uint64_t sub_1A02EF89C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1A02F03CC();
  sub_1A03079DC();
  if (!v0)
  {
    v1 = sub_1A03076C4();
    sub_1A0271F64();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v1 - 8) + 104))(v2, *MEMORY[0x1E0D1D028], v1);
    swift_willThrow();
  }
  return sub_1A026CF1C(0, 0xF000000000000000);
}

void sub_1A02EF9D4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;

  v4 = v1 + 40;
  sub_1A02812F0(v1 + 40, (uint64_t)&v14, &qword_1EE58EE00);
  if (*((_QWORD *)&v15 + 1))
  {
    sub_1A027106C(&v14, a1);
  }
  else
  {
    v13 = a1;
    sub_1A0278A7C((uint64_t)&v14, &qword_1EE58EE00);
    v5 = *(_QWORD *)(v1 + 24);
    v6 = *(_QWORD *)(v1 + 32);
    v7 = sub_1A0307BB0();
    v17 = &v12;
    v8 = *(_QWORD *)(v7 - 8);
    MEMORY[0x1E0C80A78](v7);
    v10 = (char *)&v12 - v9;
    sub_1A03076B8();
    if (!v2)
    {
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v5) == 1)
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        v16 = 0;
        v14 = 0u;
        v15 = 0u;
      }
      else
      {
        *((_QWORD *)&v15 + 1) = v5;
        v16 = v6;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
        (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(boxed_opaque_existential_1, v10, v5);
      }
      sub_1A02F049C((uint64_t)&v14, v4, &qword_1EE58EE00);
      sub_1A02812F0(v4, v13, &qword_1EE58EE00);
    }
  }
}

uint64_t sub_1A02EFB6C(char a1, _BYTE *a2, ValueMetadata **a3, uint64_t *a4, void *a5)
{
  char v9;
  ValueMetadata *v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v9 = a1 & 1;
  if ((a1 & 1) != 0)
  {
    v10 = &type metadata for InternalPlatformClassifications;
    v11 = sub_1A02AF6B8();
  }
  else
  {
    v10 = &type metadata for SearchRequestDataClassification;
    v11 = sub_1A02B07AC();
  }
  *a2 = v9;
  *a3 = v10;
  a3[1] = (ValueMetadata *)v11;
  v12 = objc_msgSend(a5, sel_readData);
  if (v12)
  {
    v13 = v12;
    v14 = sub_1A030728C();
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0xF000000000000000;
  }
  v17 = *a4;
  v18 = a4[1];
  *a4 = v14;
  a4[1] = v16;
  return sub_1A026CF1C(v17, v18);
}

void static DataClassificationTag.read(from:)(uint64_t a1@<X8>)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8[2];
  _OWORD v9[2];
  uint64_t v10;
  unint64_t v11;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v11 = 0xF000000000000007;
  sub_1A02F0040();
  sub_1A03079DC();
  if (!v1)
  {
    sub_1A02812F0((uint64_t)v9, (uint64_t)&v6, &qword_1EE58ECE0);
    if (v7)
    {
      sub_1A027106C(&v6, (uint64_t)v8);
      v3 = v11;
      if ((~v11 & 0xF000000000000007) != 0)
      {
        sub_1A027106C(v8, a1);
        *(_QWORD *)(a1 + 40) = v3;
        goto LABEL_8;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    }
    else
    {
      sub_1A0278A7C((uint64_t)&v6, &qword_1EE58ECE0);
    }
    v4 = sub_1A03076C4();
    sub_1A0271F64();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v5, *MEMORY[0x1E0D1D028], v4);
    swift_willThrow();
  }
  sub_1A027BD9C(v11);
LABEL_8:
  sub_1A0278A7C((uint64_t)v9, &qword_1EE58ECE0);
}

uint64_t sub_1A02EFD7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v3 + 16))(v5);
  if ((OUTLINED_FUNCTION_1_47() & 1) != 0)
  {
    v6 = 0;
  }
  else if (OUTLINED_FUNCTION_1_47())
  {
    v6 = 1;
  }
  else
  {
    v6 = 2;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
  return v6;
}

ValueMetadata *sub_1A02EFE30(char a1)
{
  ValueMetadata *v1;

  if ((a1 & 1) != 0)
  {
    v1 = &type metadata for InternalPlatformClassifications;
    sub_1A02AF6B8();
  }
  else
  {
    v1 = &type metadata for SearchRequestDataClassification;
    sub_1A02B07AC();
  }
  return v1;
}

uint64_t sub_1A02EFE70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A02EFD7C(a1, a2);
  *a3 = result;
  return result;
}

ValueMetadata *sub_1A02EFE94()
{
  char *v0;

  return sub_1A02EFE30(*v0);
}

uint64_t DataClassificationTag.write(to:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *boxed_opaque_existential_1;
  unint64_t v6;
  _QWORD v8[3];
  ValueMetadata *v9;
  unint64_t v10;
  uint64_t v11[5];

  v2 = v0[3];
  v3 = v0[4];
  v4 = __swift_project_boxed_opaque_existential_1(v0, v2);
  v11[3] = v2;
  v11[4] = *(_QWORD *)(v3 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_1, v4, v2);
  v9 = (ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE58EBF0);
  v10 = sub_1A02F007C();
  v8[0] = swift_allocObject();
  sub_1A02812F0((uint64_t)v11, v8[0] + 16, &qword_1EE58EBF0);
  sub_1A0307A0C();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    v6 = v0[5];
    v9 = &type metadata for TagPredicate;
    v10 = sub_1A027C3B4();
    v8[0] = v6;
    sub_1A027B840(v6);
    sub_1A0307A0C();
  }
  sub_1A0278A7C((uint64_t)v11, &qword_1EE58EBF0);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_1A02EFFCC()
{
  return sub_1A03079E8();
}

uint64_t sub_1A02F0024()
{
  return sub_1A02EFFCC();
}

unint64_t sub_1A02F0040()
{
  unint64_t result;

  result = qword_1EE58ECE8;
  if (!qword_1EE58ECE8)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A03194E4, &_s6FieldsON_3);
    atomic_store(result, (unint64_t *)&qword_1EE58ECE8);
  }
  return result;
}

unint64_t sub_1A02F007C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE58EBE8;
  if (!qword_1EE58EBE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE58EBF0);
    result = MEMORY[0x1A1AF7D34](&unk_1A0315848, v1);
    atomic_store(result, (unint64_t *)&qword_1EE58EBE8);
  }
  return result;
}

uint64_t sub_1A02F00C0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

unint64_t sub_1A02F00E8()
{
  unint64_t result;

  result = qword_1EE58ECF0;
  if (!qword_1EE58ECF0)
  {
    result = MEMORY[0x1A1AF7D34](&protocol conformance descriptor for DataClassificationTag, &type metadata for DataClassificationTag);
    atomic_store(result, (unint64_t *)&qword_1EE58ECF0);
  }
  return result;
}

void sub_1A02F0124(uint64_t a1)
{
  uint64_t v1;
  _OWORD v3[2];
  uint64_t v4;
  _BYTE v5[40];
  __int128 v6[2];

  sub_1A02EF79C((uint64_t)v6);
  if (!v1)
  {
    sub_1A027106C(v6, (uint64_t)v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58EDF8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE58ECD8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v4 = 0;
      memset(v3, 0, sizeof(v3));
    }
    sub_1A02F049C((uint64_t)v3, a1, &qword_1EE58ECE0);
  }
}

uint64_t sub_1A02F01CC()
{
  return DataClassificationTag.write(to:)();
}

void sub_1A02F01E0(uint64_t a1@<X8>)
{
  static DataClassificationTag.read(from:)(a1);
}

uint64_t sub_1A02F01F4()
{
  sub_1A02F0448();
  return sub_1A0307670();
}

uint64_t sub_1A02F0228()
{
  sub_1A02F0448();
  return sub_1A0307664();
}

ValueMetadata *type metadata accessor for DataClassificationTagProtoUnionDomain()
{
  return &type metadata for DataClassificationTagProtoUnionDomain;
}

uint64_t _s13SiriAnalytics37DataClassificationTagProtoUnionDomainOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A02F02E8 + 4 * byte_1A031931F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A02F031C + 4 * byte_1A031931A[v4]))();
}

uint64_t sub_1A02F031C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A02F0324(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A02F032CLL);
  return result;
}

uint64_t sub_1A02F0338(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A02F0340);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A02F0344(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A02F034C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s6FieldsOMa_4()
{
  return &_s6FieldsON_3;
}

unint64_t sub_1A02F036C()
{
  unint64_t result;

  result = qword_1EE58FF20;
  if (!qword_1EE58FF20)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A0319400, &_s6FieldsON_3);
    atomic_store(result, (unint64_t *)&qword_1EE58FF20);
  }
  return result;
}

unint64_t sub_1A02F03A8(uint64_t a1)
{
  unint64_t result;

  result = sub_1A02F03CC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A02F03CC()
{
  unint64_t result;

  result = qword_1EE58EDB0;
  if (!qword_1EE58EDB0)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A0319444, &type metadata for DataClassificationTagProtoUnionDomain);
    atomic_store(result, (unint64_t *)&qword_1EE58EDB0);
  }
  return result;
}

unint64_t sub_1A02F040C()
{
  unint64_t result;

  result = qword_1EE58FF28;
  if (!qword_1EE58FF28)
  {
    result = MEMORY[0x1A1AF7D34](&unk_1A03194BC, &type metadata for DataClassificationTagProtoUnionDomain);
    atomic_store(result, (unint64_t *)&qword_1EE58FF28);
  }
  return result;
}

unint64_t sub_1A02F0448()
{
  unint64_t result;

  result = qword_1EE58FF30[0];
  if (!qword_1EE58FF30[0])
  {
    result = MEMORY[0x1A1AF7D34](&protocol conformance descriptor for DataClassificationTag, &type metadata for DataClassificationTag);
    atomic_store(result, qword_1EE58FF30);
  }
  return result;
}

void sub_1A02F0484()
{
  uint64_t v0;

  sub_1A02F0124(*(_QWORD *)(v0 + 16));
}

void sub_1A02F049C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_62_0(a1, a2, a3);
  OUTLINED_FUNCTION_60(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  OUTLINED_FUNCTION_7();
}

uint64_t sub_1A02F04C8(char *a1, _BYTE *a2, ValueMetadata **a3, uint64_t *a4, void *a5)
{
  return sub_1A02EFB6C(*a1, a2, a3, a4, a5);
}

uint64_t sub_1A02F04E0(char *a1)
{
  uint64_t v1;

  return sub_1A02F04C8(a1, *(_BYTE **)(v1 + 16), *(ValueMetadata ***)(v1 + 24), *(uint64_t **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t OUTLINED_FUNCTION_1_47()
{
  return swift_dynamicCast();
}

uint64_t sub_1A02F051C()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for CounterDigest()
{
  JUMPOUT(0x1A1AF7CD4);
}

void sub_1A02F3DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A02F73A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A02F76C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1A02F79EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_1A02F7C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A02F7F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A02F820C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A02F852C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A02F8F50(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A02F9244(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_1A02FFF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A030024C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void SiriAnalyticsLoggingInit()
{
  if (SiriAnalyticsLoggingInit_once != -1)
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
}

void sub_1A03017B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  id *v19;
  id *v20;
  uint64_t v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Block_object_dispose((const void *)(v21 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A03019AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SiriAnalyticsIsInternalInstall()
{
  if (SiriAnalyticsIsInternalInstall_onceToken != -1)
    dispatch_once(&SiriAnalyticsIsInternalInstall_onceToken, &__block_literal_global_874);
  return SiriAnalyticsIsInternalInstall_isInternal;
}

NSObject *SiriAnalyticsCreateFireOnceTimer(NSObject *a1, void *a2, double a3)
{
  id v5;
  NSObject *v6;
  dispatch_time_t v7;

  v5 = a2;
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, a1);
  v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v6, v5);

  return v6;
}

uint64_t SiriAnalyticsAbsoluteToContinuousTimestamp(uint64_t a1)
{
  uint64_t v2;

  v2 = mach_continuous_time();
  return v2 + a1 - mach_absolute_time();
}

uint64_t sub_1A0307118()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1A0307124()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1A0307130()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1A030713C()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1A0307148()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1A0307154()
{
  return MEMORY[0x1E0CAF310]();
}

uint64_t sub_1A0307160()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1A030716C()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1A0307178()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1A0307184()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1A0307190()
{
  return MEMORY[0x1E0CAF910]();
}

uint64_t sub_1A030719C()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1A03071A8()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1A03071B4()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A03071C0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A03071CC()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1A03071D8()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1A03071E4()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1A03071F0()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1A03071FC()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1A0307208()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1A0307214()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1A0307220()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1A030722C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1A0307238()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1A0307244()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1A0307250()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t sub_1A030725C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A0307268()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1A0307274()
{
  return MEMORY[0x1E0D98F38]();
}

uint64_t sub_1A0307280()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1A030728C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1A0307298()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1A03072A4()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1A03072B0()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1A03072BC()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1A03072C8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1A03072D4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A03072E0()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1A03072EC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1A03072F8()
{
  return MEMORY[0x1E0D98F40]();
}

uint64_t sub_1A0307304()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1A0307310()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1A030731C()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1A0307328()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A0307334()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A0307340()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1A030734C()
{
  return MEMORY[0x1E0CAA3F8]();
}

uint64_t sub_1A0307358()
{
  return MEMORY[0x1E0CAA400]();
}

uint64_t sub_1A0307364()
{
  return MEMORY[0x1E0CAA418]();
}

uint64_t sub_1A0307370()
{
  return MEMORY[0x1E0CAA428]();
}

uint64_t sub_1A030737C()
{
  return MEMORY[0x1E0CAA430]();
}

uint64_t sub_1A0307388()
{
  return MEMORY[0x1E0CAA438]();
}

uint64_t sub_1A0307394()
{
  return MEMORY[0x1E0CAA448]();
}

uint64_t sub_1A03073A0()
{
  return MEMORY[0x1E0CAA480]();
}

uint64_t sub_1A03073AC()
{
  return MEMORY[0x1E0CAA498]();
}

uint64_t sub_1A03073B8()
{
  return MEMORY[0x1E0CAA4A8]();
}

uint64_t sub_1A03073C4()
{
  return MEMORY[0x1E0CAA4B8]();
}

uint64_t sub_1A03073D0()
{
  return MEMORY[0x1E0CAA4D8]();
}

uint64_t sub_1A03073DC()
{
  return MEMORY[0x1E0CAA508]();
}

uint64_t sub_1A03073E8()
{
  return MEMORY[0x1E0D98F48]();
}

uint64_t sub_1A03073F4()
{
  return MEMORY[0x1E0D98F50]();
}

uint64_t sub_1A0307400()
{
  return MEMORY[0x1E0D98F58]();
}

uint64_t sub_1A030740C()
{
  return MEMORY[0x1E0D98F60]();
}

uint64_t sub_1A0307418()
{
  return MEMORY[0x1E0D98F68]();
}

uint64_t sub_1A0307424()
{
  return MEMORY[0x1E0D98F70]();
}

uint64_t sub_1A0307430()
{
  return MEMORY[0x1E0D98F78]();
}

uint64_t sub_1A030743C()
{
  return MEMORY[0x1E0D98F80]();
}

uint64_t sub_1A0307448()
{
  return MEMORY[0x1E0D98F88]();
}

uint64_t sub_1A0307454()
{
  return MEMORY[0x1E0D98F90]();
}

uint64_t sub_1A0307460()
{
  return MEMORY[0x1E0D98F98]();
}

uint64_t sub_1A030746C()
{
  return MEMORY[0x1E0D98FA0]();
}

uint64_t sub_1A0307478()
{
  return MEMORY[0x1E0D98FA8]();
}

uint64_t sub_1A0307484()
{
  return MEMORY[0x1E0D98FB0]();
}

uint64_t sub_1A0307490()
{
  return MEMORY[0x1E0D98FB8]();
}

uint64_t sub_1A030749C()
{
  return MEMORY[0x1E0D98FC0]();
}

uint64_t sub_1A03074A8()
{
  return MEMORY[0x1E0D98FD0]();
}

uint64_t sub_1A03074B4()
{
  return MEMORY[0x1E0D98FD8]();
}

uint64_t sub_1A03074C0()
{
  return MEMORY[0x1E0D98FE0]();
}

uint64_t sub_1A03074CC()
{
  return MEMORY[0x1E0D98FE8]();
}

uint64_t sub_1A03074D8()
{
  return MEMORY[0x1E0D98FF0]();
}

uint64_t sub_1A03074E4()
{
  return MEMORY[0x1E0D98FF8]();
}

uint64_t sub_1A03074F0()
{
  return MEMORY[0x1E0D99000]();
}

uint64_t sub_1A03074FC()
{
  return MEMORY[0x1E0D99008]();
}

uint64_t sub_1A0307508()
{
  return MEMORY[0x1E0D99010]();
}

uint64_t sub_1A0307514()
{
  return MEMORY[0x1E0D99020]();
}

uint64_t sub_1A0307520()
{
  return MEMORY[0x1E0D99028]();
}

uint64_t sub_1A030752C()
{
  return MEMORY[0x1E0D99030]();
}

uint64_t sub_1A0307538()
{
  return MEMORY[0x1E0D99038]();
}

uint64_t sub_1A0307544()
{
  return MEMORY[0x1E0D99068]();
}

uint64_t sub_1A0307550()
{
  return MEMORY[0x1E0D99070]();
}

uint64_t sub_1A030755C()
{
  return MEMORY[0x1E0D99078]();
}

uint64_t sub_1A0307568()
{
  return MEMORY[0x1E0D99090]();
}

uint64_t sub_1A0307574()
{
  return MEMORY[0x1E0D990A0]();
}

uint64_t sub_1A0307580()
{
  return MEMORY[0x1E0D990A8]();
}

uint64_t sub_1A030758C()
{
  return MEMORY[0x1E0D990B0]();
}

uint64_t sub_1A0307598()
{
  return MEMORY[0x1E0D990B8]();
}

uint64_t sub_1A03075A4()
{
  return MEMORY[0x1E0D990C0]();
}

uint64_t sub_1A03075B0()
{
  return MEMORY[0x1E0D990C8]();
}

uint64_t sub_1A03075BC()
{
  return MEMORY[0x1E0D990D0]();
}

uint64_t sub_1A03075C8()
{
  return MEMORY[0x1E0D3E0A8]();
}

uint64_t sub_1A03075D4()
{
  return MEMORY[0x1E0D3E0B0]();
}

uint64_t sub_1A03075E0()
{
  return MEMORY[0x1E0D3E0B8]();
}

uint64_t sub_1A03075EC()
{
  return MEMORY[0x1E0D3E0D0]();
}

uint64_t sub_1A03075F8()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1A0307604()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1A0307610()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1A030761C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A0307628()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A0307634()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1A0307640()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_1A030764C()
{
  return MEMORY[0x1E0DF2058]();
}

uint64_t sub_1A0307658()
{
  return MEMORY[0x1E0D1CFD8]();
}

uint64_t sub_1A0307664()
{
  return MEMORY[0x1E0D1CFE0]();
}

uint64_t sub_1A0307670()
{
  return MEMORY[0x1E0D1CFE8]();
}

uint64_t sub_1A030767C()
{
  return MEMORY[0x1E0D1CFF0]();
}

uint64_t sub_1A0307688()
{
  return MEMORY[0x1E0D1CFF8]();
}

uint64_t sub_1A0307694()
{
  return MEMORY[0x1E0D1D000]();
}

uint64_t sub_1A03076A0()
{
  return MEMORY[0x1E0D1D008]();
}

uint64_t sub_1A03076AC()
{
  return MEMORY[0x1E0D1D010]();
}

uint64_t sub_1A03076B8()
{
  return MEMORY[0x1E0D1D020]();
}

uint64_t sub_1A03076C4()
{
  return MEMORY[0x1E0D1D030]();
}

uint64_t sub_1A03076D0()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1A03076DC()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1A03076E8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A03076F4()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A0307700()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A030770C()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1A0307718()
{
  return MEMORY[0x1E0DEF6A0]();
}

uint64_t sub_1A0307724()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1A0307730()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1A030773C()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1A0307748()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1A0307754()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A0307760()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1A030776C()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1A0307778()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1A0307784()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1A0307790()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A030779C()
{
  return MEMORY[0x1E0CB1850]();
}

uint64_t sub_1A03077A8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A03077B4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A03077C0()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1A03077CC()
{
  return MEMORY[0x1E0CB19E0]();
}

uint64_t sub_1A03077D8()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1A03077E4()
{
  return MEMORY[0x1E0CB19F0]();
}

uint64_t sub_1A03077F0()
{
  return MEMORY[0x1E0CB1A08]();
}

uint64_t sub_1A03077FC()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1A0307808()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A0307814()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1A0307820()
{
  return MEMORY[0x1E0DEA640]();
}

uint64_t sub_1A030782C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A0307838()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A0307844()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1A0307850()
{
  return MEMORY[0x1E0DEA830]();
}

uint64_t sub_1A030785C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A0307868()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1A0307874()
{
  return MEMORY[0x1E0CB1A88]();
}

uint64_t sub_1A0307880()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1A030788C()
{
  return MEMORY[0x1E0D990E0]();
}

uint64_t sub_1A0307898()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1A03078A4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A03078B0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A03078BC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A03078C8()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1A03078D4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A03078E0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A03078EC()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1A03078F8()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A0307904()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1A0307910()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1A030791C()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1A0307928()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1A0307934()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1A0307940()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1A030794C()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1A0307958()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1A0307964()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1A0307970()
{
  return MEMORY[0x1E0DF0940]();
}

uint64_t sub_1A030797C()
{
  return MEMORY[0x1E0DF09A8]();
}

uint64_t sub_1A0307988()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1A0307994()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1A03079A0()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1A03079AC()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_1A03079B8()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1A03079C4()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1A03079D0()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1A03079DC()
{
  return MEMORY[0x1E0D1D050]();
}

uint64_t sub_1A03079E8()
{
  return MEMORY[0x1E0D1D060]();
}

uint64_t sub_1A03079F4()
{
  return MEMORY[0x1E0D1D070]();
}

uint64_t sub_1A0307A00()
{
  return MEMORY[0x1E0D1D080]();
}

uint64_t sub_1A0307A0C()
{
  return MEMORY[0x1E0D1D090]();
}

uint64_t sub_1A0307A18()
{
  return MEMORY[0x1E0D1D098]();
}

uint64_t sub_1A0307A24()
{
  return MEMORY[0x1E0D990E8]();
}

uint64_t sub_1A0307A30()
{
  return MEMORY[0x1E0D990F0]();
}

uint64_t sub_1A0307A3C()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1A0307A48()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1A0307A54()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1A0307A60()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1A0307A6C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1A0307A78()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A0307A84()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1A0307A90()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1A0307A9C()
{
  return MEMORY[0x1E0DEF988]();
}

uint64_t sub_1A0307AA8()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1A0307AB4()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1A0307AC0()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1A0307ACC()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1A0307AD8()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1A0307AE4()
{
  return MEMORY[0x1E0D99100]();
}

uint64_t sub_1A0307AF0()
{
  return MEMORY[0x1E0D99108]();
}

uint64_t sub_1A0307AFC()
{
  return MEMORY[0x1E0DEFA78]();
}

uint64_t sub_1A0307B08()
{
  return MEMORY[0x1E0DEFA90]();
}

uint64_t sub_1A0307B14()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1A0307B20()
{
  return MEMORY[0x1E0D99118]();
}

uint64_t sub_1A0307B2C()
{
  return MEMORY[0x1E0D99120]();
}

uint64_t sub_1A0307B38()
{
  return MEMORY[0x1E0D99130]();
}

uint64_t sub_1A0307B44()
{
  return MEMORY[0x1E0D99138]();
}

uint64_t sub_1A0307B50()
{
  return MEMORY[0x1E0DEFAB8]();
}

uint64_t sub_1A0307B5C()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_1A0307B68()
{
  return MEMORY[0x1E0CB2050]();
}

uint64_t sub_1A0307B74()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1A0307B80()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1A0307B8C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1A0307B98()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1A0307BA4()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1A0307BB0()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A0307BBC()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1A0307BC8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A0307BD4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A0307BE0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A0307BEC()
{
  return MEMORY[0x1E0DEBFC0]();
}

uint64_t sub_1A0307BF8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A0307C04()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1A0307C10()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1A0307C1C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1A0307C28()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1A0307C34()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1A0307C40()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1A0307C4C()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1A0307C58()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1A0307C64()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1A0307C70()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1A0307C7C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1A0307C88()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1A0307C94()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1A0307CA0()
{
  return MEMORY[0x1E0DEC288]();
}

uint64_t sub_1A0307CAC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A0307CB8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A0307CC4()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A0307CD0()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1A0307CDC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A0307CE8()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A0307CF4()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A0307D00()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A0307D0C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A0307D18()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A0307D24()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1A0307D30()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1A0307D3C()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1A0307D48()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_1A0307D54()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1A0307D60()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1A0307D6C()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1A0307D78()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1A0307D84()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1A0307D90()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1A0307D9C()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1A0307DA8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A0307DB4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A0307DC0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A0307DCC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A0307DD8()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1A0307DE4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A0307DF0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A0307DFC()
{
  return MEMORY[0x1E0DECEF8]();
}

uint64_t sub_1A0307E08()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A0307E14()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1A0307E20()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A0307E2C()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1A0307E38()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1A0307E44()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A0307E50()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1A0307E5C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1A0307E68()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1A0307E74()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A0307E80()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_1A0307E8C()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_1A0307E98()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1A0307EA4()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1A0307EB0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A0307EBC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A0307EC8()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A0307ED4()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A0307EE0()
{
  return MEMORY[0x1E0CB2670]();
}

uint64_t sub_1A0307EEC()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1A0307EF8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A0307F04()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A0307F10()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1A0307F1C()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1A0307F28()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1A0307F34()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A0307F40()
{
  return MEMORY[0x1E0CB2710]();
}

uint64_t sub_1A0307F4C()
{
  return MEMORY[0x1E0DEE780]();
}

uint64_t sub_1A0307F58()
{
  return MEMORY[0x1E0DEE798]();
}

uint64_t sub_1A0307F64()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E498]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4C8]();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return MEMORY[0x1E0DE2BB0]();
}

uint64_t MobileGestalt_copy_productType_obj()
{
  return MEMORY[0x1E0DE2BD0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x1E0DE2C00]();
}

uint64_t MobileGestalt_get_deviceSupportsGenerativeModelSystems()
{
  return MEMORY[0x1E0DE2C18]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE85B8](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1E0DE8A98](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1E0DEEB70]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1E0DEED68]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1E0DEEF60]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1E0DEEF68]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1E0DEEF70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}


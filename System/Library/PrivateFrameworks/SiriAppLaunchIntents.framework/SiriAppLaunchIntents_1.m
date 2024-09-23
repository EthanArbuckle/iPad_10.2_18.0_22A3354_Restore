uint64_t sub_22919307C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  v4 = sub_2291C42A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6B0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = sub_2291C4238();
  if (qword_255A2A070 != -1)
    swift_once();
  sub_2291C41FC();
  v12 = (void *)sub_2291C41F0();
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, v11, v8);
  sub_2291C4298();
  sub_2291C422C();

  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_22919364C((uint64_t)v21);
}

uint64_t sub_22919323C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v10[2];

  v2 = sub_2291C37E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6C0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (_QWORD *)((char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_22919368C(a1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10[1] = *v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6B0);
    return sub_2291C47D8();
  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v3 + 32))(v5, v8, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6B0);
    return sub_2291C47E4();
  }
}

uint64_t sub_229193360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  v4 = sub_2291C42A4();
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291933AC()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2291C428C();
  if (qword_255A2A070 != -1)
    swift_once();
  sub_2291C41FC();
  *(_QWORD *)(v0 + 104) = sub_2291C41F0();
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  sub_2291C4298();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_229193494;
  return sub_2291C4280();
}

uint64_t sub_229193494(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  void *v4;
  uint64_t v5;

  v4 = *(void **)(*v2 + 104);
  v5 = *v2;
  *(_QWORD *)(v5 + 120) = v1;
  swift_task_dealloc();

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v5 + 88) + 8))(*(_QWORD *)(v5 + 96), *(_QWORD *)(v5 + 80));
  sub_22919364C(v5 + 16);
  if (v1)
  {
    OUTLINED_FUNCTION_13();
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v5 + 8))(a1);
  }
}

uint64_t sub_229193548()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for BaseDialogProvider()
{
  return objc_opt_self();
}

uint64_t sub_22919359C(uint64_t a1)
{
  uint64_t *v1;

  return sub_22919307C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2291935A8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6B0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_22919360C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6B0);
  return sub_22919323C(a1);
}

uint64_t sub_22919364C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22919368C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2291936D4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v3 = a1;
  v16 = MEMORY[0x24BEE4AF8];
  sub_22919F2BC(0, v1, 0);
  v2 = v16;
  result = sub_2291953EC(v3);
  if ((result & 0x8000000000000000) == 0)
  {
    v6 = result;
    if (result < 1 << *(_BYTE *)(v3 + 32))
    {
      v7 = v5;
      v8 = v3 + 64;
      while ((*(_QWORD *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
      {
        if (v7 != *(_DWORD *)(v3 + 36))
          goto LABEL_18;
        v15 = v1;
        v9 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 24 * v6 + 8);
        v10 = v3;
        v12 = *(_QWORD *)(v16 + 16);
        v11 = *(_QWORD *)(v16 + 24);
        if (v12 >= v11 >> 1)
        {
          v14 = v8;
          result = (uint64_t)sub_22919F2BC((char *)(v11 > 1), v12 + 1, 1);
          v8 = v14;
        }
        *(_QWORD *)(v16 + 16) = v12 + 1;
        *(_QWORD *)(v16 + 8 * v12 + 32) = v9;
        if ((uint64_t)v6 >= -(-1 << *(_BYTE *)(v10 + 32)))
          goto LABEL_19;
        if ((*(_QWORD *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) == 0)
          goto LABEL_20;
        v3 = v10;
        if (v7 != *(_DWORD *)(v10 + 36))
          goto LABEL_21;
        v13 = v8;
        result = sub_2291C49E8();
        v1 = v15 - 1;
        if (v15 == 1)
          return v2;
        v6 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          v8 = v13;
          v7 = *(_DWORD *)(v3 + 36);
          if (result < 1 << *(_BYTE *)(v3 + 32))
            continue;
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_229193890(_QWORD *a1, unint64_t a2, uint64_t isUniquelyReferenced_nonNull_native)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  id v28;
  uint64_t result;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  v4 = a2;
  if (a2 >> 62)
  {
LABEL_24:
    swift_bridgeObjectRetain();
    v6 = sub_2291C4B68();
    if (v6)
      goto LABEL_3;
LABEL_20:
    swift_bridgeObjectRelease();
    swift_release();
    return (uint64_t)a1;
  }
  v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_20;
LABEL_3:
  v32 = isUniquelyReferenced_nonNull_native;
  v33 = v4 & 0xC000000000000001;
  v7 = 4;
  v30 = v6;
  v31 = v4;
  while (1)
  {
    if (v33)
      v8 = (id)MEMORY[0x22E2C4694](v7 - 4, v4);
    else
      v8 = *(id *)(v4 + 8 * v7);
    v9 = v8;
    v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    swift_retain();
    v11 = sub_2291AA924((uint64_t)v9);
    v34 = v12;
    v35 = v13;
    swift_release();
    if ((v11 & 1) == 0)
    {

      goto LABEL_19;
    }
    v14 = v9;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v36 = a1;
    v15 = sub_22919EDA8((uint64_t)v14);
    v17 = a1[2];
    v18 = (v16 & 1) == 0;
    a1 = (_QWORD *)(v17 + v18);
    if (__OFADD__(v17, v18))
      goto LABEL_22;
    v19 = v15;
    v4 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E818);
    if ((sub_2291C4B14() & 1) != 0)
      break;
LABEL_14:
    a1 = v36;
    v22 = (unsigned __int16)(v11 & 0x100) >> 8;
    if ((v4 & 1) != 0)
    {
      v23 = v36[7] + 24 * v19;
      *(_BYTE *)v23 = 1;
      *(_BYTE *)(v23 + 1) = v22;
      *(_QWORD *)(v23 + 8) = v34;
      *(_QWORD *)(v23 + 16) = v35;
    }
    else
    {
      v36[(v19 >> 6) + 8] |= 1 << v19;
      *(_QWORD *)(v36[6] + 8 * v19) = v14;
      v24 = v36[7] + 24 * v19;
      *(_BYTE *)v24 = 1;
      *(_BYTE *)(v24 + 1) = v22;
      *(_QWORD *)(v24 + 8) = v34;
      *(_QWORD *)(v24 + 16) = v35;
      v25 = v36[2];
      v26 = __OFADD__(v25, 1);
      v27 = v25 + 1;
      if (v26)
        goto LABEL_23;
      v36[2] = v27;
      v28 = v14;
    }

    swift_bridgeObjectRelease();
    v4 = v31;
    isUniquelyReferenced_nonNull_native = v32;
    v6 = v30;
LABEL_19:
    ++v7;
    if (v10 == v6)
      goto LABEL_20;
  }
  v20 = sub_22919EDA8((uint64_t)v14);
  if ((v4 & 1) == (v21 & 1))
  {
    v19 = v20;
    goto LABEL_14;
  }
  sub_2291C43DC();
  result = sub_2291C4CC4();
  __break(1u);
  return result;
}

__n128 *sub_229193B00()
{
  __n128 *v0;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
  v0 = (__n128 *)OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_24_10(v0, (__n128)xmmword_2291C5A50);
  v0[2].n128_u64[0] = OUTLINED_FUNCTION_22_11();
  sub_2291C4790();
  return v0;
}

uint64_t sub_229193B58(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v3;
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
  void (*v16)(char *);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t);
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  char *v34;
  char v35;
  _QWORD *v36;
  char v37;
  _QWORD *v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  _QWORD *v59;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t);
  uint64_t v69;
  _QWORD v70[5];
  uint64_t v71[12];

  v3 = v2;
  v69 = a1;
  v5 = sub_2291C4538();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v61 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v61 - v13;
  if (qword_255A2A048 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v5, (uint64_t)qword_255A30028);
  v16 = *(void (**)(char *))(v6 + 16);
  v67 = v15;
  v16(v14);
  OUTLINED_FUNCTION_102();
  v17 = sub_2291C4520();
  v18 = sub_2291C4844();
  v19 = os_log_type_enabled(v17, v18);
  v66 = v12;
  v68 = (void (*)(char *, uint64_t, uint64_t))v16;
  if (v19)
  {
    v20 = OUTLINED_FUNCTION_12();
    v63 = v6;
    v21 = v20;
    v62 = OUTLINED_FUNCTION_12();
    v71[0] = v62;
    *(_DWORD *)v21 = 134218242;
    v65 = v3;
    v70[0] = sub_22919424C((uint64_t)a2);
    v64 = v9;
    sub_2291C4940();
    *(_WORD *)(v21 + 12) = 2080;
    v61[1] = v21 + 14;
    v22 = OUTLINED_FUNCTION_9_14();
    sub_22912A528(v22);
    v24 = v23;
    OUTLINED_FUNCTION_74_1();
    sub_229179920(v24);
    v26 = v25;
    v28 = v27;
    swift_release();
    v70[0] = sub_22913EFA8(v26, v28, v71);
    sub_2291C4940();
    OUTLINED_FUNCTION_25_12();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_229115000, v17, v18, "LaunchAppDeviceResolutionStrategy.processDevices() Found %ld appLaunch capable remote devices: %s", (uint8_t *)v21, 0x16u);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_25_12();
  v29 = *(void (**)(char *, uint64_t))(v6 + 8);
  v29(v14, v5);
  sub_2291944B8(v69, (uint64_t)v71);
  v30 = sub_22918513C(v71, a2);
  v31 = v30;
  if ((v32 & 1) != 0)
  {
    OUTLINED_FUNCTION_11_13();
    return v31;
  }
  if (!(v30 >> 62))
  {
    v33 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_9_14();
    if (v33 > 1)
      goto LABEL_8;
LABEL_23:
    if (v33)
    {
      sub_22917BBF8(0, (v31 & 0xC000000000000001) == 0, v31);
      if ((v31 & 0xC000000000000001) != 0)
        v59 = (_QWORD *)MEMORY[0x22E2C4694](0, v31);
      else
        v59 = *(id *)(v31 + 32);
      v36 = v59;
      OUTLINED_FUNCTION_0_18();
      sub_22919426C((uint64_t)v36, (uint64_t)v71);
      OUTLINED_FUNCTION_11_13();
      OUTLINED_FUNCTION_0_18();
    }
    else
    {
      OUTLINED_FUNCTION_0_18();
      OUTLINED_FUNCTION_11_13();
      OUTLINED_FUNCTION_0_18();
      return 0;
    }
    return (uint64_t)v36;
  }
  OUTLINED_FUNCTION_102();
  v56 = v5;
  v57 = sub_2291C4B68();
  OUTLINED_FUNCTION_0_18();
  v58 = v57 < 2;
  v5 = v56;
  if (v58)
  {
    OUTLINED_FUNCTION_9_14();
    v33 = sub_2291C4B68();
    OUTLINED_FUNCTION_0_18();
    goto LABEL_23;
  }
LABEL_8:
  OUTLINED_FUNCTION_11_13();
  v34 = sub_229194A10(v31);
  if (v34)
  {
    v36 = v34;
    v37 = v35;
    OUTLINED_FUNCTION_0_18();
    if ((v37 & 1) != 0)
    {
      v47 = v66;
      v68(v66, v67, v5);
      v48 = v36;
      v49 = sub_2291C4520();
      v50 = sub_2291C4844();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)OUTLINED_FUNCTION_12();
        v70[0] = OUTLINED_FUNCTION_12();
        v69 = v5;
        *(_DWORD *)v51 = 136315138;
        v68 = (void (*)(char *, uint64_t, uint64_t))(v51 + 4);
        v52 = sub_2291C43A0();
        v54 = OUTLINED_FUNCTION_21_9(v52, v53);
        OUTLINED_FUNCTION_2_16(v54);

        OUTLINED_FUNCTION_21();
        _os_log_impl(&dword_229115000, v49, v50, "LaunchAppDeviceResolutionStrategy.processDevices() Confirmation is required for auto-selection of device %s", v51, 0xCu);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }

      OUTLINED_FUNCTION_0_18();
      v29(v47, v5);
    }
    else
    {
      v68(v9, v67, v5);
      v38 = v36;
      v39 = v9;
      v40 = sub_2291C4520();
      v41 = sub_2291C4844();
      if (os_log_type_enabled(v40, v41))
      {
        v64 = v39;
        v42 = (uint8_t *)OUTLINED_FUNCTION_12();
        v43 = OUTLINED_FUNCTION_12();
        v65 = v3;
        v70[0] = v43;
        v69 = v5;
        *(_DWORD *)v42 = 136315138;
        v68 = (void (*)(char *, uint64_t, uint64_t))(v42 + 4);
        v44 = sub_2291C43A0();
        v46 = OUTLINED_FUNCTION_21_9(v44, v45);
        OUTLINED_FUNCTION_2_16(v46);

        OUTLINED_FUNCTION_21();
        _os_log_impl(&dword_229115000, v40, v41, "LaunchAppDeviceResolutionStrategy.processDevices() Auto-selecting device: %s", v42, 0xCu);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }

      v29(v39, v5);
      sub_22912F100(v3 + 96, (uint64_t)v70);
      OUTLINED_FUNCTION_29_14();
      sub_2291C43D0();
      v55 = sub_2291C4484();
      sub_22912F9F0(2, v55);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v70);
      sub_22912F100(v3 + 56, (uint64_t)v70);
      OUTLINED_FUNCTION_29_14();
      sub_229132138((uint64_t)v38, 3);

      OUTLINED_FUNCTION_0_18();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v70);
    }
  }
  else if (v31 >> 62)
  {
    v36 = sub_22912A430(v31);
    OUTLINED_FUNCTION_0_18();
    sub_22918700C(v31, 0);
  }
  else
  {
    sub_22918700C(v31, 0);
    return v31 & 0xFFFFFFFFFFFFFF8;
  }
  return (uint64_t)v36;
}

uint64_t sub_22919424C(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
    return sub_2291C4A0C();
  else
    return *(_QWORD *)(a1 + 16);
}

uint64_t sub_22919426C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  char v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *);
  char v31;
  uint64_t v32;
  _BYTE v33[16];
  _BYTE v34[16];
  _BYTE v35[8];
  uint64_t v36;
  _BYTE v37[8];
  uint64_t v38;

  v4 = v2;
  swift_retain();
  v7 = sub_2291AA924(a1);
  swift_release();
  OUTLINED_FUNCTION_16_14();
  v8 = sub_2291C4484();
  if (v8 == sub_2291C4484())
    goto LABEL_3;
  sub_2291862D0(a2 + 40, (uint64_t)v34);
  sub_2291862D0((uint64_t)v34, (uint64_t)v35);
  if (v36)
    goto LABEL_3;
  v11 = *(_QWORD *)(v4 + 40);
  v12 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v4 + 16), v11);
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_10_14();
  OUTLINED_FUNCTION_29_2(v3, v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
  v15 = sub_229192B54(v11);
  OUTLINED_FUNCTION_4_19();
  if ((v15 & 1) != 0)
    goto LABEL_13;
  v16 = *(_QWORD *)(v4 + 40);
  v17 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v4 + 16), v16);
  v18 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = OUTLINED_FUNCTION_6_17(v19, v32);
  OUTLINED_FUNCTION_29_2((uint64_t)v20, v21, v22);
  v23 = sub_2291C3584();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v15, v16);
  if ((v23 & 1) != 0)
  {
LABEL_13:
    OUTLINED_FUNCTION_16_14();
    v15 = sub_2291C4484();
    if (v15 == sub_2291C4484())
      goto LABEL_3;
  }
  sub_2291862D0(a2 + 24, (uint64_t)v33);
  sub_2291862D0((uint64_t)v33, (uint64_t)v37);
  if (v38 && (OUTLINED_FUNCTION_16_14(), v15 = sub_2291C4484(), sub_2291C4484() < v15))
  {
LABEL_3:
    v9 = 0;
  }
  else
  {
    v24 = (v7 & 1) == 0;
    v25 = *(_QWORD *)(v4 + 40);
    v26 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v4 + 16), v25);
    v27 = *(_QWORD *)(v25 - 8);
    MEMORY[0x24BDAC7A8](v26);
    v29 = OUTLINED_FUNCTION_6_17(v28, v32);
    v30(v29);
    v31 = sub_2291C35A8();
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v15, v25);
    v9 = v31 ^ 1 | v24;
  }
  return v9 & 1;
}

uint64_t sub_2291944B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __n128 *v18;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v45 = a1;
  v4 = sub_2291C4538();
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_18_2();
  v42 = v6 - v5;
  v43 = type metadata accessor for AppLaunchIntent();
  v7 = MEMORY[0x24BDAC7A8](v43);
  v44 = (uint64_t)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v40 - v9;
  v11 = sub_2291C40D0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_18_2();
  v15 = v14 - v13;
  v16 = sub_2291C3A7C();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_10_14();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
  v18 = (__n128 *)OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_24_10(v18, (__n128)xmmword_2291C5A50);
  v18[2].n128_u64[0] = OUTLINED_FUNCTION_22_11();
  v48 = (uint64_t)v18;
  sub_2291C4790();
  v19 = v48;
  OUTLINED_FUNCTION_29_2(v2, v45, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v17 + 88))(v2, v16) == *MEMORY[0x24BE98E08])
  {
    (*(void (**)(uint64_t, uint64_t))(v17 + 96))(v2, v16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v15, v2, v11);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v10, v15, v11);
    v20 = qword_255A2A0B0;
    v42 = v19;
    swift_bridgeObjectRetain();
    v45 = v15;
    if (v20 != -1)
      swift_once();
    sub_229138A58();
    OUTLINED_FUNCTION_12_14();
    v21 = v49;
    if (v49)
    {
      v22 = v48;
      v23 = HIBYTE(v49) & 0xF;
      if ((v49 & 0x2000000000000000) == 0)
        v23 = v48 & 0xFFFFFFFFFFFFLL;
      if (!v23)
      {
        swift_bridgeObjectRelease();
        v22 = 0;
        v21 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
    if (qword_255A2A0A0 != -1)
      swift_once();
    OUTLINED_FUNCTION_12_14();
    v30 = v48;
    v29 = v49;
    v31 = v44;
    sub_2291954E0((uint64_t)v10, v44);
    if (v29)
    {
      sub_2291224D0(v31);
    }
    else
    {
      if (qword_255A2A0A8 != -1)
        swift_once();
      v37 = v44;
      sub_2291C3E78();
      v30 = v48;
      v29 = v49;
      sub_2291224D0(v37);
      if (!v29)
      {
        sub_2291224D0((uint64_t)v10);
        OUTLINED_FUNCTION_13_16();
        v30 = 0;
LABEL_34:
        v25 = v42;
        swift_bridgeObjectRetain();
        v26 = MEMORY[0x24BEE4AF8];
        goto LABEL_35;
      }
    }
    if ((v29 & 0x2000000000000000) != 0)
      v38 = HIBYTE(v29) & 0xF;
    else
      v38 = v30 & 0xFFFFFFFFFFFFLL;
    sub_2291224D0((uint64_t)v10);
    OUTLINED_FUNCTION_13_16();
    if (v38)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_21();
      v30 = 0;
      v29 = 0;
    }
    goto LABEL_34;
  }
  OUTLINED_FUNCTION_102();
  swift_bridgeObjectRetain();
  sub_22919930C((uint64_t)&v46);
  v24 = v47;
  swift_bridgeObjectRelease();
  v25 = v19;
  if (v24)
  {
    v26 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_74_1();
    swift_bridgeObjectRelease_n();
    sub_22911F6D8(&v46, (uint64_t)&v48);
    v27 = v50;
    v28 = v51;
    __swift_project_boxed_opaque_existential_1Tm(&v48, v50);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28))
    {
      v26 = sub_229125D7C();
      swift_release();
    }
    OUTLINED_FUNCTION_9_14();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v48);
    OUTLINED_FUNCTION_4_19();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_229135634((uint64_t)&v46);
    if (qword_255A2A048 != -1)
      swift_once();
    v32 = __swift_project_value_buffer(v41, (uint64_t)qword_255A30028);
    v33 = v40;
    OUTLINED_FUNCTION_26_4(v42, v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16));
    v34 = sub_2291C4520();
    v35 = sub_2291C4850();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_229115000, v34, v35, "LaunchAppDeviceResolutionStrategy.remoteDevicesFilter() Unable to create AppLaunchIntent from parse, ignoring input", v36, 2u);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_103(v42, *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
    OUTLINED_FUNCTION_4_19();
    swift_bridgeObjectRelease();
    v26 = MEMORY[0x24BEE4AF8];
  }
  OUTLINED_FUNCTION_74_1();
  v21 = 0;
  v30 = 0;
  v29 = 0;
  v22 = 0;
LABEL_35:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v30;
  *(_QWORD *)(a2 + 32) = v29;
  *(_QWORD *)(a2 + 40) = v22;
  *(_QWORD *)(a2 + 48) = v21;
  *(_QWORD *)(a2 + 56) = v26;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = v25;
  return result;
}

char *sub_229194A10(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  char v19;
  char *v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t *v26;
  char v27;
  char v28;
  unint64_t *v29;
  char *v30;
  char *v31;
  _BYTE v32[16];

  v2 = v1;
  v4 = (_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1 + 16), v5);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18_2();
  v10 = v9 - v8;
  OUTLINED_FUNCTION_26_4(v9 - v8, v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  v12 = sub_229192B54(v5);
  OUTLINED_FUNCTION_103(v10, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  if ((v12 & 1) != 0)
    return 0;
  v13 = *(_QWORD *)(v2 + 40);
  v14 = __swift_project_boxed_opaque_existential_1Tm(v4, v13);
  v15 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = &v32[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_26_4((uint64_t)v17, v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  v19 = sub_2291C3584();
  OUTLINED_FUNCTION_103((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
  if ((v19 & 1) != 0)
    return 0;
  swift_retain();
  v22 = sub_229193890(MEMORY[0x24BEE4B00], a1, v2);
  v23 = v22;
  v24 = *(_QWORD *)(v22 + 16);
  if (v24 < 2)
  {
    if (v24 == 1)
    {
      v20 = sub_22914D8F8(v22);
      if (!v20)
      {
        OUTLINED_FUNCTION_21();
        return v20;
      }
      v31 = sub_22914D8F8(v23);
      OUTLINED_FUNCTION_21();
      if (v31)
      {

        return v20;
      }
LABEL_16:

      return 0;
    }
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v25 = (_QWORD *)sub_2291936D4(v22);
    v26 = (unint64_t *)sub_229194C50(v25);
    v28 = v27;
    swift_bridgeObjectRelease();
    v29 = sub_229194D08(v23, v26, v28 & 1);
    OUTLINED_FUNCTION_21();
    if (v29[2] == 1)
    {
      v20 = sub_22914D8F8((uint64_t)v29);
      if (!v20)
      {
        OUTLINED_FUNCTION_2_1();
        return v20;
      }
      v30 = sub_22914D8F8((uint64_t)v29);
      OUTLINED_FUNCTION_2_1();
      if (v30)
      {

        return v20;
      }
      goto LABEL_16;
    }
    OUTLINED_FUNCTION_2_1();
  }
  return 0;
}

uint64_t sub_229194C50(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1[2];
  if (!v1)
    return 0;
  result = a1[4];
  v4 = v1 - 1;
  if (v1 != 1)
  {
    v5 = a1 + 5;
    do
    {
      v7 = *v5++;
      v6 = v7;
      if (result <= v7)
        result = v6;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_229194C94()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  swift_release();
  return v0;
}

uint64_t sub_229194CC8()
{
  sub_229194C94();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LaunchAppDeviceResolutionStrategy()
{
  return objc_opt_self();
}

unint64_t *sub_229194D08(uint64_t isStackAllocationSafe, unint64_t *a2, char a3)
{
  uint64_t v3;
  uint64_t v5;
  char v6;
  char v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t *v11;
  _QWORD v13[2];

  v5 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3 & 1;
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    v9 = (_QWORD *)((char *)v13 - ((8 * v8 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_22912B4D4(0, v8, v9);
    v10 = sub_229194E84(v9, v8, v5, (uint64_t)a2, v6);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (unint64_t *)swift_slowAlloc();
    sub_22912B4D4(0, v8, v11);
    a2 = sub_229194E84(v11, v8, v5, (uint64_t)a2, v6);
    MEMORY[0x22E2C4EC8](v11, -1, -1);
  }
  return a2;
}

unint64_t *sub_229194E84(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;

  v6 = 0;
  v7 = 0;
  v8 = a3 + 64;
  v9 = 1 << *(_BYTE *)(a3 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a3 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    while (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v7 << 6);
      if ((a5 & 1) == 0)
        goto LABEL_18;
    }
    v15 = __OFADD__(v7++, 1);
    if (v15)
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v7 >= v12)
      return (unint64_t *)sub_229194FE0(result, a2, v6, a3);
    v16 = *(_QWORD *)(v8 + 8 * v7);
    if (!v16)
      break;
LABEL_17:
    v18 = __clz(__rbit64(v16));
    v11 = (v16 - 1) & v16;
    v14 = v18 + (v7 << 6);
    if ((a5 & 1) == 0)
    {
LABEL_18:
      if (*(_QWORD *)(*(_QWORD *)(a3 + 56) + 24 * v14 + 8) == a4)
      {
        *(unint64_t *)((char *)result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
        v15 = __OFADD__(v6++, 1);
        if (v15)
          goto LABEL_29;
      }
    }
  }
  v17 = v7 + 1;
  if (v7 + 1 >= v12)
    return (unint64_t *)sub_229194FE0(result, a2, v6, a3);
  v16 = *(_QWORD *)(v8 + 8 * v17);
  if (v16)
    goto LABEL_16;
  v17 = v7 + 2;
  if (v7 + 2 >= v12)
    return (unint64_t *)sub_229194FE0(result, a2, v6, a3);
  v16 = *(_QWORD *)(v8 + 8 * v17);
  if (v16)
    goto LABEL_16;
  v17 = v7 + 3;
  if (v7 + 3 >= v12)
    return (unint64_t *)sub_229194FE0(result, a2, v6, a3);
  v16 = *(_QWORD *)(v8 + 8 * v17);
  if (v16)
  {
LABEL_16:
    v7 = v17;
    goto LABEL_17;
  }
  while (1)
  {
    v7 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v7 >= v12)
      return (unint64_t *)sub_229194FE0(result, a2, v6, a3);
    v16 = *(_QWORD *)(v8 + 8 * v7);
    ++v17;
    if (v16)
      goto LABEL_17;
  }
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_229194FE0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  __int128 v34;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E810);
  result = sub_2291C4B74();
  v8 = result;
  v32 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v32)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v32)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v32)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v32)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v32)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = *(void **)(*(_QWORD *)(v4 + 48) + 8 * v13);
    v18 = *(_QWORD *)(v4 + 56) + 24 * v13;
    v19 = *(_BYTE *)v18;
    v20 = *(_BYTE *)(v18 + 1);
    v34 = *(_OWORD *)(v18 + 8);
    v21 = v17;
    result = sub_2291C48F8();
    v22 = -1 << *(_BYTE *)(v8 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) == 0)
      break;
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v25) = v21;
    v30 = *(_QWORD *)(v8 + 56) + 24 * v25;
    *(_BYTE *)v30 = v19;
    *(_BYTE *)(v30 + 1) = v20;
    *(_OWORD *)(v30 + 8) = v34;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      goto LABEL_39;
    if (!v5)
      return v8;
  }
  v26 = 0;
  v27 = (unint64_t)(63 - v22) >> 6;
  while (++v24 != v27 || (v26 & 1) == 0)
  {
    v28 = v24 == v27;
    if (v24 == v27)
      v24 = 0;
    v26 |= v28;
    v29 = *(_QWORD *)(v11 + 8 * v24);
    if (v29 != -1)
    {
      v25 = __clz(__rbit64(~v29)) + (v24 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void sub_229195284()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_7_18();
  v2 = (_QWORD *)OUTLINED_FUNCTION_18_13((uint64_t)v1);
  sub_229195314(v2, v3, v4);
  *(_QWORD *)(v0 + 32) = v5;
  OUTLINED_FUNCTION_6();
}

void sub_2291952B8()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OUTLINED_FUNCTION_7_18();
  v2 = (_QWORD *)OUTLINED_FUNCTION_18_13((uint64_t)v1);
  *(_QWORD *)(v0 + 32) = sub_229195380(v2, v3, v4);
  OUTLINED_FUNCTION_6();
}

void sub_2291952E8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_229195314(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_22917BBF8(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x22E2C4694](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  OUTLINED_FUNCTION_6();
}

void sub_229195378(id *a1)
{

}

uint64_t (*sub_229195380(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_22917BBF8(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x22E2C4694](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_229195524;
}

uint64_t sub_2291953EC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

char *sub_22919546C(char *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  char v7;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(void **)(*(_QWORD *)(a5 + 48) + 8 * a2);
    v6 = *(_QWORD *)(a5 + 56) + 24 * a2;
    v7 = *(_BYTE *)(v6 + 1);
    *result = *(_BYTE *)v6;
    result[1] = v7;
    *(_OWORD *)(result + 8) = *(_OWORD *)(v6 + 8);
    return (char *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_2291954E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppLaunchIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t OUTLINED_FUNCTION_0_18()
{
  unint64_t v0;

  return sub_22918700C(v0, 0);
}

uint64_t OUTLINED_FUNCTION_2_16(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 224) = a1;
  return sub_2291C4940();
}

uint64_t OUTLINED_FUNCTION_4_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

char *OUTLINED_FUNCTION_6_17@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void *OUTLINED_FUNCTION_7_18()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_11_13()
{
  uint64_t v0;

  return sub_2291861F8(v0 - 176);
}

uint64_t OUTLINED_FUNCTION_12_14()
{
  return sub_2291C3E78();
}

uint64_t OUTLINED_FUNCTION_13_16()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v2 - 168), v1);
}

uint64_t OUTLINED_FUNCTION_16_14()
{
  return sub_2291C43D0();
}

uint64_t OUTLINED_FUNCTION_18_13(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_21_9(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_22913EFA8(a1, a2, (uint64_t *)(v2 - 216));
}

uint64_t OUTLINED_FUNCTION_22_11()
{
  return sub_2291C4454();
}

uint64_t OUTLINED_FUNCTION_24_10(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2291C4460();
}

uint64_t OUTLINED_FUNCTION_25_12()
{
  return swift_bridgeObjectRelease_n();
}

_QWORD *OUTLINED_FUNCTION_29_14()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v0 - 216), *(_QWORD *)(v0 - 192));
}

uint64_t sub_22919562C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t EnumTagSinglePayload;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[8];
  uint64_t v16;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2BAD8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v15[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for AppLaunchIntent();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_255A2A068 != -1)
    swift_once();
  sub_22918D24C(&qword_255A2CD60, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  sub_2291C3E78();
  sub_22913B4D0();
  v8 = v7;
  v9 = sub_2291954E0(v0, (uint64_t)v6);
  if ((v8 & 1) == 0)
  {
    OUTLINED_FUNCTION_1_14(v9, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    return 0;
  }
  if (qword_255A29FA0 != -1)
    swift_once();
  v10 = _s11ApplicationVMa(0);
  sub_22918D24C(&qword_255A2A2C8, (void (*)(uint64_t))_s11ApplicationVMa);
  sub_2291C3E6C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v3, 1, v10);
  if ((_DWORD)EnumTagSinglePayload != 1)
  {
    if (qword_255A29FB0 != -1)
      swift_once();
    sub_22918D24C(&qword_255A2A2C0, (void (*)(uint64_t))_s11ApplicationVMa);
    v12 = sub_2291C3E78();
    v13 = v16;
    OUTLINED_FUNCTION_1_14(v12, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    sub_229195988((uint64_t)v3, _s11ApplicationVMa);
    if (!v13)
      return 1;
    swift_bridgeObjectRelease();
    return 0;
  }
  OUTLINED_FUNCTION_1_14(EnumTagSinglePayload, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
  sub_229195948((uint64_t)v3);
  return 1;
}

uint64_t sub_2291958A8()
{
  if (qword_255A2A088 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_2291958E8(uint64_t a1)
{
  return sub_22918D904(a1, qword_255A2E820, 0x6E756F4E707061, 0xE700000000000000, &qword_255A30070);
}

uint64_t type metadata accessor for AppLaunchIntent()
{
  uint64_t result;

  result = qword_255A2E880;
  if (!qword_255A2E880)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_229195948(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2BAD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_229195988(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2291959C0(uint64_t a1)
{
  return sub_22918D904(a1, &qword_255A2A158, 0x69766F7250707061, 0xEB00000000726564, &qword_255A30078);
}

uint64_t sub_2291959F0()
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
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A160);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2291CB940;
  if (qword_255A2A020 != -1)
    swift_once();
  v1 = qword_255A2FFF8;
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2C810);
  sub_22918D218(&qword_255A2E908, &qword_255A2C810);
  *(_QWORD *)(v0 + 64) = v2;
  *(_QWORD *)(v0 + 32) = v1;
  v3 = qword_255A29FA0;
  swift_retain();
  if (v3 != -1)
    swift_once();
  v4 = qword_255A2FED8;
  v5 = _s23ApplicationOntologyNodeCMa(0);
  v6 = MEMORY[0x24BE9EB08];
  *(_QWORD *)(v0 + 96) = v5;
  *(_QWORD *)(v0 + 104) = v6;
  *(_QWORD *)(v0 + 72) = v4;
  v7 = qword_255A2A060;
  swift_retain();
  if (v7 != -1)
    swift_once();
  v8 = qword_255A30060;
  *(_QWORD *)(v0 + 136) = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E398);
  sub_22918D218(&qword_255A2E910, &qword_255A2E398);
  *(_QWORD *)(v0 + 144) = v9;
  *(_QWORD *)(v0 + 112) = v8;
  v10 = qword_255A2A058;
  swift_retain();
  if (v10 != -1)
    swift_once();
  v11 = qword_255A30058;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A158);
  *(_QWORD *)(v0 + 176) = v12;
  sub_22918D218(&qword_255A2A168, &qword_255A2A158);
  v14 = v13;
  *(_QWORD *)(v0 + 184) = v13;
  *(_QWORD *)(v0 + 152) = v11;
  v15 = qword_255A2A078;
  swift_retain();
  if (v15 != -1)
    swift_once();
  v16 = qword_255A30070;
  *(_QWORD *)(v0 + 216) = __swift_instantiateConcreteTypeFromMangledName(qword_255A2E820);
  sub_22918D218(&qword_255A2E918, qword_255A2E820);
  *(_QWORD *)(v0 + 224) = v17;
  *(_QWORD *)(v0 + 192) = v16;
  v18 = qword_255A2A068;
  swift_retain();
  if (v18 != -1)
    swift_once();
  v19 = qword_255A30068;
  *(_QWORD *)(v0 + 256) = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E3E0);
  sub_22918D218(&qword_255A2E920, &qword_255A2E3E0);
  *(_QWORD *)(v0 + 264) = v20;
  *(_QWORD *)(v0 + 232) = v19;
  v21 = qword_255A2A098;
  swift_retain();
  if (v21 != -1)
    swift_once();
  v22 = qword_255A30098;
  *(_QWORD *)(v0 + 296) = v12;
  *(_QWORD *)(v0 + 304) = v14;
  *(_QWORD *)(v0 + 272) = v22;
  v23 = qword_255A2A0A0;
  swift_retain();
  if (v23 != -1)
    swift_once();
  v24 = qword_255A300A0;
  *(_QWORD *)(v0 + 336) = v12;
  *(_QWORD *)(v0 + 344) = v14;
  *(_QWORD *)(v0 + 312) = v24;
  v25 = qword_255A2A0B0;
  swift_retain();
  if (v25 != -1)
    swift_once();
  v26 = qword_255A300B0;
  *(_QWORD *)(v0 + 376) = v12;
  *(_QWORD *)(v0 + 384) = v14;
  *(_QWORD *)(v0 + 352) = v26;
  v27 = qword_255A2A0A8;
  swift_retain();
  if (v27 != -1)
    swift_once();
  v28 = qword_255A300A8;
  *(_QWORD *)(v0 + 416) = v12;
  *(_QWORD *)(v0 + 424) = v14;
  *(_QWORD *)(v0 + 392) = v28;
  v29 = qword_255A2A0B8;
  swift_retain();
  if (v29 != -1)
    swift_once();
  v30 = qword_255A300B8;
  *(_QWORD *)(v0 + 456) = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E928);
  sub_22918D218(&qword_255A2E930, &qword_255A2E928);
  *(_QWORD *)(v0 + 464) = v31;
  *(_QWORD *)(v0 + 432) = v30;
  v32 = qword_255A29FE8;
  swift_retain();
  if (v32 != -1)
    swift_once();
  v33 = qword_255A2FF68;
  *(_QWORD *)(v0 + 496) = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2B848);
  sub_22918D218(&qword_255A2E938, &qword_255A2B848);
  *(_QWORD *)(v0 + 504) = v34;
  *(_QWORD *)(v0 + 472) = v33;
  v35 = qword_255A2A080;
  swift_retain();
  if (v35 != -1)
    swift_once();
  v36 = qword_255A30078;
  *(_QWORD *)(v0 + 536) = v12;
  *(_QWORD *)(v0 + 544) = v14;
  *(_QWORD *)(v0 + 512) = v36;
  sub_2291C3CE0();
  swift_allocObject();
  swift_retain();
  result = sub_2291C3CD4();
  qword_255A30080 = result;
  return result;
}

uint64_t sub_229195F04()
{
  unint64_t v0;

  v0 = sub_2291C4B8C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

void *sub_229195F4C()
{
  return &unk_24F1D8230;
}

uint64_t sub_229195F58(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_229195F8C + 4 * byte_2291CB950[a1]))(0x6E776F6E6B6E75, 0xE700000000000000);
}

uint64_t sub_229195F8C()
{
  return 7368801;
}

uint64_t sub_229195F9C()
{
  return 0x7265646C6F66;
}

uint64_t sub_229195FB0()
{
  return 0x6E696874656D6F73;
}

void sub_229195FCC()
{
  sub_22913B034();
}

void sub_229195FD8()
{
  sub_2291C10C8();
}

void sub_229195FE0()
{
  sub_2291C13C8();
}

void sub_229195FE8()
{
  sub_2291C1624();
}

uint64_t sub_229195FF0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_229195F04();
  *a1 = result;
  return result;
}

uint64_t sub_22919601C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_229195F58(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for AppLaunchIntent.AppNoun(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppLaunchIntent.AppNoun(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229196118 + 4 * byte_2291CB959[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22919614C + 4 * byte_2291CB954[v4]))();
}

uint64_t sub_22919614C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229196154(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22919615CLL);
  return result;
}

uint64_t sub_229196168(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229196170);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_229196174(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22919617C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchIntent.AppNoun()
{
  return &type metadata for AppLaunchIntent.AppNoun;
}

uint64_t sub_229196198(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2291C40D0();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2291961D4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2291C40D0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_229196208(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2291C40D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_22919624C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2291C40D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_229196290(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2291C40D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2291962D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2291C40D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_229196318()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_229196324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_19();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_22919634C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_229196358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_19();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t sub_229196384()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2291C40D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_2291963EC(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F1D8230;
}

uint64_t sub_2291963FC()
{
  sub_2291966BC();
  sub_2291966F8();
  sub_229196734();
  return sub_2291C404C();
}

uint64_t sub_22919645C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2291C40D0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_229196494()
{
  return sub_2291958A8();
}

uint64_t sub_2291964A8()
{
  sub_22918D24C(&qword_255A2E8E8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  return sub_2291C3DDC();
}

uint64_t sub_2291964F8()
{
  sub_22918D24C(&qword_255A2E8E8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  return sub_2291C3DC4();
}

uint64_t sub_229196538()
{
  sub_22918D24C(&qword_255A2E8E8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
  return sub_2291C3DD0();
}

void sub_229196578()
{
  sub_22918D24C(&qword_255A2CD60, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
}

void sub_2291965A4()
{
  sub_22918D24C(&qword_255A2E8B8, (void (*)(uint64_t))type metadata accessor for AppLaunchIntent);
}

unint64_t sub_2291965D4()
{
  unint64_t result;

  result = qword_255A2E8C0;
  if (!qword_255A2E8C0)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBAC0, &type metadata for AppLaunchIntent.AppNoun);
    atomic_store(result, (unint64_t *)&qword_255A2E8C0);
  }
  return result;
}

void sub_229196610()
{
  sub_22918D218(&qword_255A2E8C8, &qword_255A2E8D0);
}

unint64_t sub_229196640()
{
  unint64_t result;

  result = qword_255A2E8D8;
  if (!qword_255A2E8D8)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CB9F8, &type metadata for AppLaunchIntent.AppNoun);
    atomic_store(result, (unint64_t *)&qword_255A2E8D8);
  }
  return result;
}

unint64_t sub_229196680()
{
  unint64_t result;

  result = qword_255A2E8E0;
  if (!qword_255A2E8E0)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBB00, &type metadata for AppLaunchIntent.AppNoun);
    atomic_store(result, (unint64_t *)&qword_255A2E8E0);
  }
  return result;
}

unint64_t sub_2291966BC()
{
  unint64_t result;

  result = qword_255A2E8F0;
  if (!qword_255A2E8F0)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBA60, &type metadata for AppLaunchIntent.AppNoun);
    atomic_store(result, (unint64_t *)&qword_255A2E8F0);
  }
  return result;
}

unint64_t sub_2291966F8()
{
  unint64_t result;

  result = qword_255A2E8F8;
  if (!qword_255A2E8F8)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBA28, &type metadata for AppLaunchIntent.AppNoun);
    atomic_store(result, (unint64_t *)&qword_255A2E8F8);
  }
  return result;
}

unint64_t sub_229196734()
{
  unint64_t result;

  result = qword_255A2E900;
  if (!qword_255A2E900)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBA88, &type metadata for AppLaunchIntent.AppNoun);
    atomic_store(result, (unint64_t *)&qword_255A2E900);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_19()
{
  return sub_2291C40D0();
}

void OUTLINED_FUNCTION_1_14(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_229195988(v2, a2);
}

id sub_229196788()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2291C46AC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

id sub_2291967F8(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  sub_229143614();
  v4 = sub_229196788();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2B948);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2291C5A70;
  v6 = MEMORY[0x24BEE0D00];
  sub_2291C4A3C();
  *(_QWORD *)(inited + 96) = v6;
  *(_QWORD *)(inited + 72) = a1;
  *(_QWORD *)(inited + 80) = a2;
  swift_bridgeObjectRetain();
  v7 = sub_2291C4670();
  sub_229196BBC(v7, v4);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE99160]), sel_init);
  objc_msgSend(v8, sel_setInputOrigin_, *MEMORY[0x24BE821C0]);
  objc_msgSend(v8, sel_setInteractionType_, *MEMORY[0x24BE82230]);
  v9 = (void *)objc_opt_self();
  v10 = OUTLINED_FUNCTION_0_20(v9, sel_runSiriKitExecutorCommandWithContext_payload_);

  return v10;
}

uint64_t sub_229196978()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_2291C4B8C();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_2291969C8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6C65636E6163;
  else
    return 0x6D7269666E6F63;
}

uint64_t sub_2291969FC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2291969C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_229196A24(char a1)
{
  id v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  sub_229143614();
  v2 = sub_229196788();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2B948);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2291C5A70;
  v4 = MEMORY[0x24BEE0D00];
  sub_2291C4A3C();
  v5 = 0x6C65636E6163;
  if ((a1 & 1) == 0)
    v5 = 0x6D7269666E6F63;
  v6 = 0xE600000000000000;
  *(_QWORD *)(inited + 96) = v4;
  if ((a1 & 1) == 0)
    v6 = 0xE700000000000000;
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = v6;
  v7 = sub_2291C4670();
  sub_229196BBC(v7, v2);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE99160]), sel_init);
  objc_msgSend(v8, sel_setInputOrigin_, *MEMORY[0x24BE821C0]);
  objc_msgSend(v8, sel_setInteractionType_, *MEMORY[0x24BE82230]);
  v9 = (void *)objc_opt_self();
  v10 = OUTLINED_FUNCTION_0_20(v9, sel_runSiriKitExecutorCommandWithContext_payload_);

  return v10;
}

void sub_229196BBC(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_2291C4658();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserData_, v3);

}

id OUTLINED_FUNCTION_0_20(id a1, SEL a2)
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(a1, a2, v3, v2);
}

uint64_t sub_229196C34()
{
  return sub_2291C3248();
}

uint64_t sub_229196C54(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_2291C383C();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v4 = sub_2291C4538();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = OUTLINED_FUNCTION_25();
  v2[11] = OUTLINED_FUNCTION_25();
  v2[12] = OUTLINED_FUNCTION_25();
  return swift_task_switch();
}

uint64_t sub_229196CEC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void (*v15)(uint64_t, uint64_t);
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void (*v34)(uint64_t, uint64_t);
  uint64_t (*v35)(_QWORD);

  if (qword_255A2A008 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 96);
  v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 64), (uint64_t)qword_255A2FFB0);
  v3 = OUTLINED_FUNCTION_8_6();
  v33 = v4;
  v4(v3);
  sub_2291C4520();
  v5 = OUTLINED_FUNCTION_51();
  if (os_log_type_enabled(v1, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_39(&dword_229115000, v1, v5, "LaunchAppHandleIntentFlow.execute() called", v6);
    OUTLINED_FUNCTION_2_0();
  }
  v7 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 64);
  v9 = *(_QWORD *)(v0 + 72);
  v11 = *(_QWORD *)(v0 + 48);
  v10 = *(_QWORD *)(v0 + 56);
  v13 = *(_QWORD *)(v0 + 32);
  v12 = *(_QWORD *)(v0 + 40);

  v34 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v34(v7, v8);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v13 + 24), *(_QWORD *)(v13 + 48));
  sub_2291C3830();
  v14 = sub_2291C353C();
  v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v15(v10, v12);
  if ((v14 & 1) != 0
    || (OUTLINED_FUNCTION_4_6(), (sub_2291C359C() & 1) != 0)
    || (OUTLINED_FUNCTION_4_6(), (sub_2291C35A8() & 1) != 0))
  {
    v16 = *(NSObject **)(v0 + 80);
    v17 = OUTLINED_FUNCTION_8_6();
    v33(v17);
    sub_2291C4520();
    v18 = OUTLINED_FUNCTION_51();
    if (OUTLINED_FUNCTION_17(v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v19 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v16, v2, "LaunchAppHandleIntentFlow.wrappedFlow.execute() called", v19);
      OUTLINED_FUNCTION_2_0();
    }
    v20 = *(_QWORD *)(v0 + 80);
    v21 = *(_QWORD *)(v0 + 64);

    v34(v20, v21);
    v35 = (uint64_t (*)(_QWORD))((int)*MEMORY[0x24BE96258] + MEMORY[0x24BE96258]);
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v22;
    *v22 = v0;
    v22[1] = sub_229135E4C;
    return v35(*(_QWORD *)(v0 + 24));
  }
  else
  {
    v24 = *(NSObject **)(v0 + 88);
    v25 = *(_QWORD *)(v0 + 56);
    v26 = *(_QWORD *)(v0 + 40);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2B578);
    sub_2291C3350();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_2291C5A70;
    sub_2291C3830();
    sub_2291C3344();
    v15(v25, v26);
    v27 = sub_2291C317C();
    swift_bridgeObjectRelease();
    v28 = OUTLINED_FUNCTION_8_6();
    v33(v28);
    sub_2291C4520();
    v29 = OUTLINED_FUNCTION_51();
    if (OUTLINED_FUNCTION_17(v29))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v30 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v24, v2, "Device is not authenticated - pushing an unlock flow", v30);
      OUTLINED_FUNCTION_2_0();
    }
    v31 = *(_QWORD *)(v0 + 88);
    v32 = *(_QWORD *)(v0 + 64);

    v34(v31, v32);
    *(_QWORD *)(v0 + 16) = v27;
    sub_2291C3338();
    sub_2291C36E0();
    OUTLINED_FUNCTION_2_1();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_229197094()
{
  uint64_t v0;

  type metadata accessor for LaunchAppHandleIntentFlow();
  sub_229122548(&qword_255A2EA28, v0, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppHandleIntentFlow, (uint64_t)&unk_2291CBBBC);
  return sub_2291C3434();
}

uint64_t sub_229197104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *);
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *);
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[24];
  ValueMetadata *v26;
  _UNKNOWN **v27;
  _BYTE v28[24];
  uint64_t v29;
  __int128 v30[2];

  type metadata accessor for LaunchAppHandleIntentStrategy();
  sub_229122548(&qword_255A2EA30, 255, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppHandleIntentStrategy, (uint64_t)&unk_2291C5B70);
  sub_2291C3374();
  v7 = OUTLINED_FUNCTION_8_6();
  v9 = v8(v7);
  OUTLINED_FUNCTION_2_1();
  *(_QWORD *)&v30[0] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EA38);
  swift_allocObject();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EA40);
  sub_229197404();
  v10 = sub_2291C3254();
  sub_22912F100(a4, (uint64_t)v30);
  sub_22912F100(a5, (uint64_t)v28);
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
  MEMORY[0x24BDAC7A8](v11);
  v13 = OUTLINED_FUNCTION_1_5(v12, v23);
  v14(v13);
  v26 = &type metadata for AppLaunchFlowFactoryImpl;
  v27 = &off_24F1DCCC0;
  type metadata accessor for LaunchAppHandleIntentFlow();
  v15 = (_QWORD *)swift_allocObject();
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, (uint64_t)&type metadata for AppLaunchFlowFactoryImpl);
  MEMORY[0x24BDAC7A8](v16);
  v18 = OUTLINED_FUNCTION_1_5(v17, v24);
  v19(v18);
  v15[11] = &type metadata for AppLaunchFlowFactoryImpl;
  v15[12] = &off_24F1DCCC0;
  v15[2] = v10;
  sub_22911F6D8(v30, (uint64_t)(v15 + 3));
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  *(_QWORD *)&v30[0] = v15;
  sub_229122548(&qword_255A2EA28, v20, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppHandleIntentFlow, (uint64_t)&unk_2291CBBBC);
  v21 = sub_2291C3428();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_2_1();
  return v21;
}

uint64_t type metadata accessor for LaunchAppHandleIntentFlow()
{
  return objc_opt_self();
}

uint64_t sub_229197344()
{
  return sub_229197094();
}

uint64_t sub_229197364(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2291221EC;
  return sub_229196C54(a1);
}

uint64_t sub_2291973B8()
{
  return sub_229196C34();
}

uint64_t sub_2291973D8(uint64_t a1, uint64_t a2)
{
  return sub_229122548(&qword_255A2EA28, a2, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppHandleIntentFlow, (uint64_t)&unk_2291CBBBC);
}

unint64_t sub_229197404()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A2EA48;
  if (!qword_255A2EA48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A2EA40);
    result = MEMORY[0x22E2C4E20](MEMORY[0x24BE96B80], v1);
    atomic_store(result, (unint64_t *)&qword_255A2EA48);
  }
  return result;
}

uint64_t sub_229197448()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  sub_2291C3A88();
  type metadata accessor for BaseDialogProvider();
  v0 = OUTLINED_FUNCTION_31();
  sub_2291C37D0();
  OUTLINED_FUNCTION_3();
  v1 = sub_2291C37C4();
  sub_2291C38FC();
  if (qword_2540B1F40 != -1)
    swift_once();
  v2 = static InstalledAppProvider.shared;
  swift_retain();
  sub_2291C34A0();
  return sub_229199008(&v6, v0, v1, &v5, v2, &v4);
}

uint64_t sub_22919750C(uint64_t a1)
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

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v12 - v7;
  v9 = sub_2291C3A28();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  sub_22912F208((uint64_t)v8, (uint64_t)v6);
  v10 = v1 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_input;
  swift_beginAccess();
  sub_22912F250((uint64_t)v6, v10);
  swift_endAccess();
  return 1;
}

uint64_t sub_229197610()
{
  type metadata accessor for InstallAppFlow();
  sub_22912C97C(&qword_255A2EBD0, (uint64_t (*)(uint64_t))type metadata accessor for InstallAppFlow, (uint64_t)&unk_2291CBC90);
  return sub_2291C3434();
}

uint64_t sub_229197684(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[38] = a1;
  v2[39] = v1;
  sub_2291C35D8();
  v2[40] = OUTLINED_FUNCTION_1_0();
  v3 = sub_2291C3974();
  v2[41] = v3;
  v2[42] = *(_QWORD *)(v3 - 8);
  v2[43] = OUTLINED_FUNCTION_1_0();
  type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0);
  v2[44] = OUTLINED_FUNCTION_1_0();
  v4 = sub_2291C3A7C();
  v2[45] = v4;
  v2[46] = *(_QWORD *)(v4 - 8);
  v2[47] = OUTLINED_FUNCTION_20();
  v2[48] = OUTLINED_FUNCTION_25();
  v5 = sub_2291C3A28();
  v2[49] = v5;
  v2[50] = *(_QWORD *)(v5 - 8);
  v2[51] = OUTLINED_FUNCTION_20();
  v2[52] = OUTLINED_FUNCTION_25();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  v2[53] = OUTLINED_FUNCTION_20();
  v2[54] = OUTLINED_FUNCTION_25();
  v6 = sub_2291C4538();
  v2[55] = v6;
  v2[56] = *(_QWORD *)(v6 - 8);
  v2[57] = OUTLINED_FUNCTION_20();
  v2[58] = OUTLINED_FUNCTION_25();
  v2[59] = OUTLINED_FUNCTION_25();
  v2[60] = OUTLINED_FUNCTION_25();
  v2[61] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_229197798()
{
  uint64_t *v0;
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
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t EnumTagSinglePayload;
  uint64_t v18;
  char v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  os_log_type_t v27;
  _DWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_115();
  if (qword_255A2A048 != -1)
    swift_once();
  v1 = v0[61];
  v2 = v0[55];
  v3 = v0[56];
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_255A30028);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[62] = (uint64_t)v5;
  v5(v1, v4, v2);
  v6 = sub_2291C4520();
  v7 = sub_2291C4838();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_12();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_229115000, v6, v7, "InstallAppFlow.execute executing InstallAppFlow", v8, 2u);
    OUTLINED_FUNCTION_2_0();
  }
  v9 = v0[61];
  v10 = v0[55];
  v11 = v0[56];
  v12 = v0[54];
  v13 = v0[49];
  v14 = v0[39];

  v15 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[63] = (uint64_t)v15;
  v15(v9, v10);
  v16 = v14 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_input;
  swift_beginAccess();
  sub_22912F144(v16, v12);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v12, 1, v13);
  if (!(_DWORD)EnumTagSinglePayload)
  {
    v35 = v0[50];
    v36 = v0[48];
    v37 = v0[45];
    v38 = v0[46];
    v74 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 16);
    v39 = v74(v0[52], v0[54], v0[49]);
    OUTLINED_FUNCTION_41_5(v39, &qword_255A2AF08);
    sub_2291C3A10();
    v40 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
    OUTLINED_FUNCTION_20_11();
    sub_2291994B4();
    v42 = v41;
    v0[64] = v41;
    v43 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    v43(v36, v37);
    if (!*(_QWORD *)(v42 + 16))
    {
      OUTLINED_FUNCTION_36();
      goto LABEL_7;
    }
    v0[65] = sub_22919AD48(0x45524F4D5F454553, 0xE800000000000000);
    v0[66] = v44;
    if (!v44)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_31_10();
      if (!v19)
        v55 = swift_once();
      OUTLINED_FUNCTION_7_19(v55, (uint64_t)qword_255A2FFB0);
      sub_2291C4520();
      v56 = OUTLINED_FUNCTION_85();
      if (OUTLINED_FUNCTION_17(v56))
      {
        *(_WORD *)OUTLINED_FUNCTION_12() = 0;
        OUTLINED_FUNCTION_10(&dword_229115000, v57, v58, "InstallAppFlow.execute unable to get localized system text for snippet");
        OUTLINED_FUNCTION_2_0();
      }
      OUTLINED_FUNCTION_19_12();
      OUTLINED_FUNCTION_152_0();
      sub_22911F6F0();
      v24 = OUTLINED_FUNCTION_94();
      v25 = 7;
      goto LABEL_12;
    }
    v45 = v0[53];
    v46 = v0[49];
    sub_22912F144(v16, v45);
    v47 = __swift_getEnumTagSinglePayload(v45, 1, v46);
    v48 = v0[53];
    if (v47)
    {
      OUTLINED_FUNCTION_86_0();
      OUTLINED_FUNCTION_36();
      v49 = &qword_255A2AF08;
      v50 = v48;
    }
    else
    {
      v59 = v0[51];
      v60 = v0[49];
      v61 = v0[47];
      v73 = v0[45];
      v62 = v74(v59, v48, v60);
      OUTLINED_FUNCTION_41_5(v62, &qword_255A2AF08);
      sub_2291C3A10();
      v40(v59, v60);
      v63 = v0 + 12;
      sub_22919930C((uint64_t)(v0 + 12));
      v43(v61, v73);
      v64 = v0[15];
      if (v64)
      {
        v65 = v0[16];
        __swift_project_boxed_opaque_existential_1Tm(v63, v0[15]);
        if ((*(uint64_t (**)(uint64_t, uint64_t))(v65 + 8))(v64, v65))
        {
          sub_229123F4C();
          v67 = v66;
          v69 = v68;
          swift_release();
          v0[67] = v67;
          v0[68] = v69;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
          if (v69)
          {
            v70 = HIBYTE(v69) & 0xF;
            if ((v69 & 0x2000000000000000) == 0)
              v70 = v67 & 0xFFFFFFFFFFFFLL;
            if (v70)
            {
              v71 = *(_QWORD *)(v42 + 16);
              v72 = (_QWORD *)swift_task_alloc();
              v0[69] = (uint64_t)v72;
              *v72 = v0;
              v72[1] = sub_229197EA8;
              return sub_22915959C(v71);
            }
            OUTLINED_FUNCTION_36();
            OUTLINED_FUNCTION_86_0();
          }
          else
          {
            OUTLINED_FUNCTION_86_0();
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          OUTLINED_FUNCTION_86_0();
          OUTLINED_FUNCTION_36();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
        }
        goto LABEL_22;
      }
      OUTLINED_FUNCTION_86_0();
      OUTLINED_FUNCTION_36();
      v49 = &qword_255A2A9F0;
      v50 = (uint64_t)(v0 + 12);
    }
    sub_22912C160(v50, v49);
LABEL_22:
    OUTLINED_FUNCTION_31_10();
    if (!v19)
      v51 = swift_once();
    OUTLINED_FUNCTION_7_19(v51, (uint64_t)qword_255A2FFB0);
    sub_2291C4520();
    v52 = OUTLINED_FUNCTION_85();
    if (OUTLINED_FUNCTION_17(v52))
    {
      *(_WORD *)OUTLINED_FUNCTION_12() = 0;
      OUTLINED_FUNCTION_10(&dword_229115000, v53, v54, "InstallAppFlow.execute unable to get requested app from input");
      OUTLINED_FUNCTION_2_0();
    }
    OUTLINED_FUNCTION_19_12();
    OUTLINED_FUNCTION_152_0();
    sub_22911F6F0();
    v24 = OUTLINED_FUNCTION_94();
    v25 = 6;
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_41_5(EnumTagSinglePayload, &qword_255A2AF08);
LABEL_7:
  OUTLINED_FUNCTION_31_10();
  if (!v19)
    v18 = swift_once();
  OUTLINED_FUNCTION_7_19(v18, (uint64_t)qword_255A2FFB0);
  sub_2291C4520();
  v20 = OUTLINED_FUNCTION_85();
  if (OUTLINED_FUNCTION_17(v20))
  {
    *(_WORD *)OUTLINED_FUNCTION_12() = 0;
    OUTLINED_FUNCTION_10(&dword_229115000, v21, v22, "InstallAppFlow.execute no results found in the pegasus response");
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_20_11();
  sub_22911F6F0();
  v24 = OUTLINED_FUNCTION_94();
  v25 = 8;
LABEL_12:
  *v23 = v25;
  swift_willThrow();
  v0[74] = v24;
  OUTLINED_FUNCTION_31_10();
  if (!v19)
    swift_once();
  v26 = __swift_project_value_buffer(v0[55], (uint64_t)qword_255A2FFB0);
  OUTLINED_FUNCTION_26_15(v26);
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_63();
  sub_2291C4520();
  v27 = sub_2291C485C();
  if (OUTLINED_FUNCTION_110(v27))
  {
    v28 = (_DWORD *)OUTLINED_FUNCTION_12();
    v29 = (_QWORD *)OUTLINED_FUNCTION_12();
    *v28 = 138412290;
    OUTLINED_FUNCTION_63();
    v30 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_14_14(v30);
    *v29 = v5;
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_23_13(&dword_229115000, v31, v32, "InstallAppFlow.execute could not create InstallAppFlow output. Error: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
    OUTLINED_FUNCTION_28_11();
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_152_0();
  v33 = (_QWORD *)swift_task_alloc();
  v0[75] = (uint64_t)v33;
  *v33 = v0;
  v33[1] = sub_229198340;
  return sub_2291986E4(v0[38]);
}

uint64_t sub_229197EA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 560) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 568) = a1;
  OUTLINED_FUNCTION_13();
  return swift_task_switch();
}

uint64_t sub_229197F18()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  void *v11;
  uint64_t v12;

  v11 = (void *)v0[71];
  v1 = v0[64];
  v2 = v0[44];
  v3 = v0[39];
  OUTLINED_FUNCTION_32_8(v3 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_installedAppProvider);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v0 + 17;
  swift_bridgeObjectRetain();
  sub_2291BA4B8(sub_229198EF4, v4, v1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_19();
  sub_22916F704();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 17));
  sub_2291C35B4();
  *(_QWORD *)(swift_task_alloc() + 16) = v1;
  sub_2291C3914();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v3 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_responseGenerator), *(_QWORD *)(v3 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_responseGenerator + 24));
  v0[30] = type metadata accessor for AppLaunchDataModels(0);
  sub_22912C97C((unint64_t *)&qword_255A2A868, type metadata accessor for AppLaunchDataModels, (uint64_t)&protocol conformance descriptor for AppLaunchDataModels);
  v0[31] = v5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 27);
  sub_229198F18(v2, (uint64_t)boxed_opaque_existential_1);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
  v7 = OUTLINED_FUNCTION_31();
  *(_OWORD *)(v7 + 16) = xmmword_2291C5A50;
  *(_QWORD *)(v7 + 32) = v11;
  v12 = v7;
  sub_2291C4790();
  v0[72] = v12;
  v8 = v11;
  v9 = (_QWORD *)swift_task_alloc();
  v0[73] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_229198154;
  return sub_2291C3800();
}

uint64_t sub_229198154()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + 216;
  swift_task_dealloc();
  OUTLINED_FUNCTION_36();
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  OUTLINED_FUNCTION_13();
  return swift_task_switch();
}

uint64_t sub_2291981B8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_115();
  v1 = *(void **)(v0 + 568);
  v2 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 344);
  v7 = *(_QWORD *)(v0 + 352);
  v3 = *(_QWORD *)(v0 + 328);
  sub_22911F698(*(_QWORD *)(v0 + 312) + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_outputPublisher, v0 + 176);
  OUTLINED_FUNCTION_32_8(v0 + 16);
  v4 = OUTLINED_FUNCTION_31();
  sub_22911F6D8((__int128 *)(v0 + 56), v4 + 16);
  sub_2291C31DC();
  OUTLINED_FUNCTION_3();
  *(_QWORD *)(v0 + 296) = sub_2291C31D0();
  sub_2291C36EC();

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v6, v3);
  sub_229198FCC(v7);
  swift_release();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_10(0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_229198340(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 608) = a1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_229198390()
{
  uint64_t v0;
  unsigned int v2;

  OUTLINED_FUNCTION_115();

  v2 = *(unsigned __int8 *)(v0 + 608);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_19();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_10(v2, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22919844C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  _DWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36();
  v0[74] = v0[70];
  if (qword_255A2A008 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0[55], (uint64_t)qword_255A2FFB0);
  OUTLINED_FUNCTION_26_15(v2);
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_63();
  sub_2291C4520();
  v3 = sub_2291C485C();
  if (OUTLINED_FUNCTION_110(v3))
  {
    v4 = (_DWORD *)OUTLINED_FUNCTION_12();
    v5 = (_QWORD *)OUTLINED_FUNCTION_12();
    *v4 = 138412290;
    OUTLINED_FUNCTION_63();
    v6 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_14_14(v6);
    *v5 = v1;
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_23_13(&dword_229115000, v7, v8, "InstallAppFlow.execute could not create InstallAppFlow output. Error: %@");
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
    OUTLINED_FUNCTION_28_11();
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_152_0();
  v9 = (_QWORD *)swift_task_alloc();
  v0[75] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_229198340;
  return sub_2291986E4(v0[38]);
}

uint64_t sub_2291985E0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2CD30);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2291C3938();
  sub_2291C395C();
  sub_22917FAA0();
  v3 = sub_2291C37AC();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
  sub_2291C3944();
  return sub_2291C392C();
}

uint64_t sub_2291986A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_2291986B8()
{
  uint64_t v0;

  sub_22911F698(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 16));
  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291986E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2[13] = a1;
  v2[14] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2CD30);
  v2[15] = OUTLINED_FUNCTION_1_0();
  v3 = OUTLINED_FUNCTION_15_6();
  v2[16] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[17] = v4;
  v2[18] = *(_QWORD *)(v4 + 64);
  v2[19] = OUTLINED_FUNCTION_25();
  v2[20] = OUTLINED_FUNCTION_25();
  v5 = sub_2291C37E8();
  v2[21] = v5;
  v2[22] = *(_QWORD *)(v5 - 8);
  v2[23] = OUTLINED_FUNCTION_1_0();
  v6 = (_QWORD *)swift_task_alloc();
  v2[24] = v6;
  *v6 = v2;
  v6[1] = sub_2291987A0;
  return sub_2291C3680();
}

uint64_t sub_2291987A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291987F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 160);
  v12 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 120);
  v10 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 112);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v5 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_deviceState), *(_QWORD *)(v5 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_deviceState + 24));
  sub_2291C3548();
  v6 = sub_2291C37AC();
  __swift_storeEnumTagSinglePayload(v4, 1, 1, v6);
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  sub_2291C36C8();
  sub_22912C160(v0 + 16, (uint64_t *)&unk_255A2CD40);
  sub_22912C160(v4, &qword_255A2CD30);
  OUTLINED_FUNCTION_32_8(v5 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_outputPublisher);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v11, v2, v10);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v11, v10);
  sub_2291C31DC();
  OUTLINED_FUNCTION_3();
  *(_QWORD *)(v0 + 96) = sub_2291C31D0();
  sub_2291C36EC();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v10);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v13);
  swift_release();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_229198A18()
{
  uint64_t v0;

  return sub_2291C4B50();
}

uint64_t sub_229198A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_229198AA4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;

  v1 = *(uint64_t **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = OUTLINED_FUNCTION_15_6();
  v4 = MEMORY[0x24BE99088];
  v1[3] = v3;
  v1[4] = v4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v1);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1, v2, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_229198B0C()
{
  uint64_t v0;

  sub_22912C160(v0 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_input, &qword_255A2AF08);
  OUTLINED_FUNCTION_18_14(OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_deviceState);
  sub_22911F9F0(v0 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_dialogProvider);
  OUTLINED_FUNCTION_18_14(OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_responseGenerator);
  swift_release();
  OUTLINED_FUNCTION_18_14(OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_outputPublisher);
  OUTLINED_FUNCTION_18_14(OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_installedAppProvider);
  OUTLINED_FUNCTION_18_14(OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_eventSender);
  return v0;
}

uint64_t sub_229198B94()
{
  sub_229198B0C();
  return swift_deallocClassInstance();
}

uint64_t sub_229198BB8()
{
  return type metadata accessor for InstallAppFlow();
}

uint64_t type metadata accessor for InstallAppFlow()
{
  uint64_t result;

  result = qword_255A2EAB0;
  if (!qword_255A2EAB0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_229198BF8()
{
  unint64_t v0;

  sub_22912EE48();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

unint64_t sub_229198C84()
{
  return 0xD000000000000049;
}

void sub_229198CA0(uint64_t a1@<X8>)
{
  _QWORD *v1;

  sub_22911F698(*v1 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_eventSender, a1);
}

uint64_t sub_229198CC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22912EF24;
  return sub_229197684(a1);
}

uint64_t sub_229198D1C(uint64_t a1)
{
  sub_22919750C(a1);
  return 1;
}

uint64_t sub_229198D40()
{
  return sub_229197610();
}

uint64_t sub_229198D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  v6 = MEMORY[0x22E2C4E20](&unk_2291CBCE8, a2);
  *v5 = v2;
  v5[1] = sub_2291221EC;
  return sub_22915BD30(a1, a2, v6);
}

uint64_t sub_229198DD4()
{
  type metadata accessor for InstallAppFlow();
  return sub_2291C3458();
}

void sub_229198DFC(uint64_t a1)
{
  uint64_t v2;

  sub_22912C97C(&qword_255A2EBD0, (uint64_t (*)(uint64_t))type metadata accessor for InstallAppFlow, (uint64_t)&unk_2291CBC90);
  *(_QWORD *)(a1 + 8) = v2;
}

uint64_t sub_229198E38()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_15_6();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_229198E94()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_15_6();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_33_9(v1);
  return sub_229198A8C(v2, v3);
}

void sub_229198EF4(uint64_t a1)
{
  uint64_t v1;

  sub_22916F8B8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_229198F10()
{
  return sub_2291985E0();
}

uint64_t sub_229198F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_229198F5C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_229198F80()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_33_9(v1);
  return sub_2291986A0(v2, v3);
}

uint64_t sub_229198FCC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_229199008(__int128 *a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5, __int128 *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v20[3];
  uint64_t v21;
  _UNKNOWN **v22;

  v21 = type metadata accessor for BaseDialogProvider();
  v22 = &off_24F1DC048;
  v20[0] = a2;
  type metadata accessor for InstallAppFlow();
  v12 = swift_allocObject();
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (_QWORD *)((char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  v17 = sub_229199108(a1, *v15, a3, a4, a5, a6, v12);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  return v17;
}

uint64_t sub_229199108(__int128 *a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5, __int128 *a6, uint64_t a7)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v14 = (_QWORD *)(a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_responseGenerator);
  v15 = sub_2291C37D0();
  v16 = MEMORY[0x24BE97F18];
  v14[3] = v15;
  v14[4] = v16;
  *v14 = a3;
  v17 = (_QWORD *)(a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_installedAppProvider);
  v17[3] = type metadata accessor for InstalledAppProvider();
  v17[4] = &protocol witness table for InstalledAppProvider;
  *v17 = a5;
  v18 = (_QWORD *)(a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_dialogProvider);
  v18[3] = type metadata accessor for BaseDialogProvider();
  v18[4] = &off_24F1DC048;
  *v18 = a2;
  v19 = a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_input;
  v20 = sub_2291C3A28();
  __swift_storeEnumTagSinglePayload(v19, 1, 1, v20);
  sub_22911F698((uint64_t)a1, a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_deviceState);
  type metadata accessor for LocUtil();
  v21 = swift_allocObject();
  sub_22911F6D8(a1, v21 + 16);
  *(_QWORD *)(a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_locUtil) = v21;
  sub_22911F6D8(a4, a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_outputPublisher);
  sub_22911F6D8(a6, a7 + OBJC_IVAR____TtC20SiriAppLaunchIntents14InstallAppFlow_eventSender);
  return a7;
}

uint64_t OUTLINED_FUNCTION_7_19(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return v4(v3, v5, v2);
}

uint64_t OUTLINED_FUNCTION_14_14(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 288) = a1;
  return sub_2291C4940();
}

uint64_t OUTLINED_FUNCTION_18_14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_destroy_boxed_opaque_existential_1Tm(v1 + a1);
}

void OUTLINED_FUNCTION_19_12()
{
  void *v0;

}

void OUTLINED_FUNCTION_23_13(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_26_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, a1, v2);
}

uint64_t OUTLINED_FUNCTION_28_11()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_32_8(uint64_t a1)
{
  uint64_t v1;

  sub_22911F698(a1, v1);
}

uint64_t OUTLINED_FUNCTION_33_9(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

void OUTLINED_FUNCTION_41_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22912C160(v2, a2);
}

uint64_t sub_22919930C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  uint64_t v9;
  uint64_t result;
  uint64_t *boxed_opaque_existential_1;

  v3 = sub_2291C3A7C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_5();
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 + 16))(v1, v1, v3);
  v5 = (*(uint64_t (**)(uint64_t *, uint64_t))(v4 + 88))(v1, v3);
  if (v5 == *MEMORY[0x24BE98E18])
  {
    OUTLINED_FUNCTION_8_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 96));
    v6 = OUTLINED_FUNCTION_14_15();
    v7 = v6;
    v8 = &off_24F1DC370;
LABEL_7:
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)(a1 + 32) = v8;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
    return (*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(boxed_opaque_existential_1, v1, v7);
  }
  if (v5 == *MEMORY[0x24BE98E20])
  {
    OUTLINED_FUNCTION_8_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 96));
    v9 = *v1;
    result = sub_2291C434C();
    *(_QWORD *)(a1 + 24) = result;
    *(_QWORD *)(a1 + 32) = &off_24F1DC380;
    *(_QWORD *)a1 = v9;
    return result;
  }
  if (v5 == *MEMORY[0x24BE98E98])
  {
    OUTLINED_FUNCTION_8_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 96));
    v6 = sub_2291C3AAC();
    v7 = v6;
    v8 = &off_24F1DC360;
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return OUTLINED_FUNCTION_8_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

void sub_229199460()
{
  uint64_t v0;

  sub_2291C3B24();
  OUTLINED_FUNCTION_11_14();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_36_6();
  sub_2291C3A94();
  sub_22914DC00();
  OUTLINED_FUNCTION_9_17();
  OUTLINED_FUNCTION_6();
}

void sub_2291994B4()
{
  void **v0;
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
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
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

  v3 = sub_2291C3068();
  v31 = *(_QWORD *)(v3 - 8);
  v32 = v3;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_82();
  v30 = v5;
  v6 = sub_2291C3098();
  v28 = *(_QWORD *)(v6 - 8);
  v29 = v6;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_82();
  v34 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EBF8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_82();
  v38 = v10;
  v37 = *(_QWORD *)(sub_2291C2D74() - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_18_2();
  v33 = sub_2291C2D8C();
  v12 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_7_20();
  v13 = sub_2291C30B0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_18_2();
  v17 = v16 - v15;
  v18 = OUTLINED_FUNCTION_14_15();
  v35 = *(_QWORD *)(v18 - 8);
  v36 = v18;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_36_6();
  v20 = sub_2291C3A7C();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_3_5();
  (*(void (**)(void **, uint64_t, uint64_t))(v21 + 16))(v0, v39, v20);
  v22 = (*(uint64_t (**)(void **, uint64_t))(v21 + 88))(v0, v20);
  if (v22 == *MEMORY[0x24BE98E18])
  {
    OUTLINED_FUNCTION_6_18(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 96));
    (*(void (**)(uint64_t, void **, uint64_t))(v35 + 32))(v1, v0, v36);
    sub_2291C3A34();
    sub_2291C2D80();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v33);
    sub_2291C2D68();
    OUTLINED_FUNCTION_15_12(v37);
    v23 = sub_2291C30A4();
    sub_22914D874(v23, v38);
    swift_bridgeObjectRelease();
    v24 = sub_2291C3014();
    if (__swift_getEnumTagSinglePayload(v38, 1, v24) == 1)
    {
      sub_22912250C(v38, &qword_255A2EBF8);
    }
    else
    {
      sub_2291C3008();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v38, v24);
      sub_2291C308C();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v34, v29);
      sub_2291C305C();
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v13);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v1, v36);
  }
  else if (v22 == *MEMORY[0x24BE98E20])
  {
    OUTLINED_FUNCTION_6_18(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 96));
    v25 = *v0;
    v26 = sub_229199AD8();
    if (v26)
    {
      v27 = (void *)v26;
      sub_2291C42E0();

      sub_2291C305C();
      OUTLINED_FUNCTION_15_12(v31);
    }

  }
  else
  {
    OUTLINED_FUNCTION_6_18(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  }
  OUTLINED_FUNCTION_54_0();
}

void sub_229199838()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  sub_2291C4304();
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_82();
  v27[1] = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD70);
  OUTLINED_FUNCTION_84();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v28 = (uint64_t)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v27 - v7;
  v27[0] = sub_2291C3080();
  v9 = *(_QWORD *)(v27[0] - 8);
  MEMORY[0x24BDAC7A8](v27[0]);
  OUTLINED_FUNCTION_18_2();
  v12 = v11 - v10;
  v13 = sub_2291C2D74();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_7_20();
  v15 = sub_2291C2D8C();
  OUTLINED_FUNCTION_11_14();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_18_2();
  v19 = v18 - v17;
  sub_2291C3A34();
  sub_2291C2D80();
  v20 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
  v21 = (uint64_t)v8;
  v20(v19, v15);
  sub_2291C2D5C();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v13);
  v22 = sub_2291C3074();
  v24 = v23;
  (*(void (**)(uint64_t, _QWORD))(v9 + 8))(v12, v27[0]);
  v25 = sub_2291C3B9C();
  v31 = 0;
  v29 = 0u;
  v30 = 0u;
  sub_229172A38(v22, v24);
  sub_2291C42F8();
  sub_229199C50();
  sub_2291C4310();
  __swift_storeEnumTagSinglePayload(v21, 0, 1, v25);
  v26 = v28;
  sub_229199C90(v21, v28);
  if (__swift_getEnumTagSinglePayload(v26, 1, v25) == 1)
  {
    sub_22912250C(v21, (uint64_t *)&unk_255A2CD70);
    OUTLINED_FUNCTION_16_15();
    sub_22912250C(v26, (uint64_t *)&unk_255A2CD70);
  }
  else
  {
    sub_22914DF34();
    OUTLINED_FUNCTION_16_15();
    sub_22912250C(v21, (uint64_t *)&unk_255A2CD70);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v26, v25);
  }
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_229199AD8()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = sub_2291C4340();
  v1 = v0;
  if (v0 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_2291C4B68())
  {
    v3 = 4;
    while (1)
    {
      v4 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22E2C4694](v3 - 4, v1) : *(id *)(v1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      sub_2291C42EC();
      v7 = swift_dynamicCastClass();
      if (v7)
      {
        v8 = v7;
        OUTLINED_FUNCTION_32_3();
        return v8;
      }

      ++v3;
      if (v6 == v2)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  OUTLINED_FUNCTION_32_3();
  return 0;
}

void sub_229199BCC()
{
  uint64_t v0;
  void *v1;

  sub_2291C3B9C();
  OUTLINED_FUNCTION_11_14();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_36_6();
  v1 = (void *)sub_229199AD8();
  if (v1)
  {
    sub_2291C4334();

    sub_22914DF34();
    OUTLINED_FUNCTION_9_17();
  }
  OUTLINED_FUNCTION_6();
}

void sub_229199C30()
{
  sub_229199BCC();
}

unint64_t sub_229199C50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A2BFD8;
  if (!qword_255A2BFD8)
  {
    v1 = sub_2291C3B9C();
    result = MEMORY[0x22E2C4E20](MEMORY[0x24BE9C7C0], v1);
    atomic_store(result, (unint64_t *)&qword_255A2BFD8);
  }
  return result;
}

uint64_t sub_229199C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_229199CD8(uint64_t a1)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v17[2];

  v2 = OUTLINED_FUNCTION_14_15();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 - 8);
  v8 = MEMORY[0x24BDAC7A8](v4);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v17 - v12;
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8_18((uint64_t)v17 - v14);
  if (swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    OUTLINED_FUNCTION_8_18((uint64_t)v13);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, a1);
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_8_18((uint64_t)v13);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v13, a1);
    sub_2291C434C();
    v15 = swift_dynamicCast();
    if ((_DWORD)v15)

  }
  return v15;
}

uint64_t OUTLINED_FUNCTION_6_18@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_7_20()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_8_18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_9_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_14_15()
{
  return sub_2291C3A40();
}

uint64_t OUTLINED_FUNCTION_15_12@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_16_15()
{
  unint64_t v0;
  uint64_t v1;

  return sub_229131704(v1, v0);
}

uint64_t sub_229199ED4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for OffloadedAppInstallerImpl();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  qword_255A30090 = v0;
  return result;
}

uint64_t sub_229199F0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  v4 = sub_2291C4538();
  v3[20] = v4;
  v3[21] = *(_QWORD *)(v4 - 8);
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_229199FB4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
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
  unsigned int v18;
  id v19;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;

  v1 = (void *)objc_opt_self();
  sub_22919A5C8();
  swift_bridgeObjectRetain();
  v2 = sub_22919A4F8();
  *(_QWORD *)(v0 + 120) = 0;
  v3 = objc_msgSend(v1, sel_existingCoordinatorForAppWithIdentity_error_, v2, v0 + 120);
  *(_QWORD *)(v0 + 192) = v3;

  v4 = *(void **)(v0 + 120);
  if (!v3)
    goto LABEL_8;
  v5 = qword_255A2A008;
  v6 = v4;
  v7 = v3;
  if (v5 != -1)
    swift_once();
  v8 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 160);
  v10 = *(_QWORD *)(v0 + 168);
  v11 = __swift_project_value_buffer(v9, (uint64_t)qword_255A2FFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
  v12 = sub_2291C4520();
  v13 = sub_2291C4844();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_229115000, v12, v13, "OffloadedAppInstaller.prioritizeInstall existing coordinator found", v14, 2u);
    OUTLINED_FUNCTION_2_0();
  }
  v15 = *(_QWORD *)(v0 + 184);
  v16 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 168);

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  *(_QWORD *)(v0 + 128) = 0;
  v18 = objc_msgSend(v7, sel_prioritizeWithError_, v0 + 128);

  v4 = *(void **)(v0 + 128);
  if (v18)
  {
    v19 = v4;
    OUTLINED_FUNCTION_0_21();
    OUTLINED_FUNCTION_4_20();
    OUTLINED_FUNCTION_19();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
LABEL_8:
    v21 = v4;
    v22 = (void *)sub_2291C2C0C();

    swift_willThrow();
    if (qword_255A2A008 != -1)
      swift_once();
    v24 = *(_QWORD *)(v0 + 168);
    v23 = *(_QWORD *)(v0 + 176);
    v25 = *(_QWORD *)(v0 + 160);
    v26 = __swift_project_value_buffer(v25, (uint64_t)qword_255A2FFB0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v23, v26, v25);
    v27 = sub_2291C4520();
    v28 = sub_2291C4844();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_229115000, v27, v28, "OffloadedAppInstaller.prioritizeInstall no existing coordinator found, creating a new request", v29, 2u);
      OUTLINED_FUNCTION_2_0();
    }
    v31 = *(_QWORD *)(v0 + 168);
    v30 = *(_QWORD *)(v0 + 176);
    v32 = *(_QWORD *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    swift_bridgeObjectRetain();
    v33 = sub_22919A4F8();
    *(_QWORD *)(v0 + 200) = v33;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_22919A364;
    v34 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v35 = (_QWORD *)(v0 + 80);
    v35[1] = 0x40000000;
    v35[2] = sub_22914E884;
    v35[3] = &block_descriptor_3;
    v35[4] = v34;
    objc_msgSend(v1, sel_prioritizeCoordinatorForAppWithIdentity_completion_, v33, v35);
    return swift_continuation_await();
  }
}

uint64_t sub_22919A364()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_22919A408()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 192);

  if (v1)
    OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_4_20();
  OUTLINED_FUNCTION_19();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22919A478()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 192);
  swift_willThrow();

  if (v2)
    OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_4_20();
  OUTLINED_FUNCTION_19();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_22919A4F8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2291C46AC();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithBundleID_, v1);

  return v2;
}

uint64_t sub_22919A568()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for OffloadedAppInstallerImpl()
{
  return objc_opt_self();
}

uint64_t sub_22919A5A4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_22919A5B0()
{
  return sub_22919A5A4();
}

unint64_t sub_22919A5C8()
{
  unint64_t result;

  result = qword_255A2ECB0;
  if (!qword_255A2ECB0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A2ECB0);
  }
  return result;
}

void OUTLINED_FUNCTION_0_21()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_4_20()
{
  return swift_task_dealloc();
}

uint64_t sub_22919A614()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_2291C4B8C();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

void *sub_22919A664()
{
  return &unk_24F1D82A8;
}

uint64_t sub_22919A670(char a1)
{
  if ((a1 & 1) != 0)
    return 0x69736976656C6574;
  else
    return 0x76745F656C707061;
}

uint64_t sub_22919A6AC(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_22(a1, &qword_255A2A158, 19, 0x80000002291CFFB0, &qword_255A30098);
}

uint64_t sub_22919A6D4(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_22(a1, &qword_255A2A158, 27, 0x80000002291CFF70, &qword_255A300A0);
}

uint64_t sub_22919A6FC(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_22(a1, &qword_255A2A158, 25, 0x80000002291CFF50, &qword_255A300A8);
}

uint64_t sub_22919A724(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_22(a1, &qword_255A2A158, 18, 0x80000002291CFF30, &qword_255A300B0);
}

uint64_t sub_22919A74C(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_22(a1, &qword_255A2E928, 28, 0x80000002291CFF90, &qword_255A300B8);
}

void sub_22919A774(char *a1, char *a2)
{
  sub_22913AC7C(*a1, *a2);
}

void sub_22919A780()
{
  sub_2291C10F0();
}

uint64_t sub_22919A788()
{
  return sub_2291C11EC();
}

void sub_22919A790()
{
  sub_2291C16A8();
}

uint64_t sub_22919A798@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22919A614();
  *a1 = result;
  return result;
}

uint64_t sub_22919A7C4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22919A670(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_22919A7EC(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F1D82A8;
}

uint64_t sub_22919A7FC()
{
  sub_22919AC64();
  sub_22919ACA0();
  sub_22919ACDC();
  return sub_2291C404C();
}

BOOL sub_22919A85C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v15;
  _BYTE v16[8];
  uint64_t v17;

  v1 = v0;
  v2 = type metadata accessor for AppLaunchIntent();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = &v16[-v7];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v16[-v9];
  if (qword_255A2A0A0 != -1)
    swift_once();
  sub_229138A58();
  sub_2291C3E78();
  v11 = v17;
  OUTLINED_FUNCTION_21();
  sub_2291954E0(v1, (uint64_t)v10);
  if (v11)
  {
    sub_2291224D0((uint64_t)v10);
    OUTLINED_FUNCTION_2_17();
LABEL_8:
    sub_2291224D0((uint64_t)v8);
    OUTLINED_FUNCTION_3_14();
LABEL_9:
    v13 = 1;
    goto LABEL_10;
  }
  if (qword_255A2A0B0 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_15();
  sub_2291C3E78();
  v12 = v17;
  sub_2291224D0((uint64_t)v10);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_17();
  if (v12)
    goto LABEL_8;
  if (qword_255A2A0A8 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_15();
  sub_2291C3E78();
  v15 = v17;
  sub_2291224D0((uint64_t)v8);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_3_14();
  if (v15)
    goto LABEL_9;
  if (qword_255A2A0B8 != -1)
    swift_once();
  OUTLINED_FUNCTION_1_15();
  sub_2291C3E78();
  v13 = v16[0] != 2;
LABEL_10:
  sub_2291224D0((uint64_t)v5);
  return v13;
}

uint64_t _s10DeviceTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22919AADC + 4 * byte_2291CBDD9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22919AB10 + 4 * byte_2291CBDD4[v4]))();
}

uint64_t sub_22919AB10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22919AB18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22919AB20);
  return result;
}

uint64_t sub_22919AB2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22919AB34);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22919AB38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22919AB40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10DeviceTypeOMa()
{
  return &_s10DeviceTypeON;
}

unint64_t sub_22919AB60()
{
  unint64_t result;

  result = qword_255A2ECB8;
  if (!qword_255A2ECB8)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBEB4, &_s10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_255A2ECB8);
  }
  return result;
}

unint64_t sub_22919ABA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A2ECC0;
  if (!qword_255A2ECC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A2ECC8);
    result = MEMORY[0x22E2C4E20](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255A2ECC0);
  }
  return result;
}

unint64_t sub_22919ABE8()
{
  unint64_t result;

  result = qword_255A2ECD0;
  if (!qword_255A2ECD0)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBDEC, &_s10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_255A2ECD0);
  }
  return result;
}

unint64_t sub_22919AC28()
{
  unint64_t result;

  result = qword_255A2ECD8;
  if (!qword_255A2ECD8)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBEF4, &_s10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_255A2ECD8);
  }
  return result;
}

unint64_t sub_22919AC64()
{
  unint64_t result;

  result = qword_255A2ECE0;
  if (!qword_255A2ECE0)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBE54, &_s10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_255A2ECE0);
  }
  return result;
}

unint64_t sub_22919ACA0()
{
  unint64_t result;

  result = qword_255A2ECE8;
  if (!qword_255A2ECE8)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBE1C, &_s10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_255A2ECE8);
  }
  return result;
}

unint64_t sub_22919ACDC()
{
  unint64_t result;

  result = qword_255A2ECF0;
  if (!qword_255A2ECF0)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CBE7C, &_s10DeviceTypeON);
    atomic_store(result, (unint64_t *)&qword_255A2ECF0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_22(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_22918D904(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4, a5);
}

uint64_t OUTLINED_FUNCTION_2_17()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2291954E0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_14()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2291954E0(v1, v0);
}

uint64_t sub_22919AD48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  id v11;

  sub_2291C2D14();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_1_16();
  v3 = 0;
  if ((sub_2291C35A8() & 1) == 0)
  {
    OUTLINED_FUNCTION_1_16();
    sub_2291C3530();
    sub_2291C2D08();
    sub_22912A5D0();
    v4 = sub_2291C4970();
    v6 = v5;
    swift_bridgeObjectRelease();
    v7 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    if (v7)
    {
      v8 = v7;
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      v11 = sub_22919AF94(a1, a2, 0x736C6562614CLL, 0xE600000000000000, (uint64_t)v10, v4, v6, v8);

      if (v11)
      {
        v3 = sub_2291C46B8();

        OUTLINED_FUNCTION_0_23();
        return v3;
      }
      OUTLINED_FUNCTION_0_23();
    }
    else
    {
      OUTLINED_FUNCTION_0_23();
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return v3;
}

uint64_t sub_22919AF60()
{
  return 0x736C6562614CLL;
}

uint64_t type metadata accessor for LocUtil()
{
  return objc_opt_self();
}

id sub_22919AF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v10 = (void *)sub_2291C46AC();
  v11 = (void *)sub_2291C46AC();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2291C46AC();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(a8, sel_localizedStringForKey_table_bundle_languageCode_, v10, v11, a5, v12);

  return v13;
}

uint64_t OUTLINED_FUNCTION_0_23()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

_QWORD *OUTLINED_FUNCTION_1_16()
{
  _QWORD *v0;
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1Tm(v0, v1);
}

id LaunchAppIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

_QWORD *sub_22919B08C(unint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_2291C4B68())
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v4 = 4;
    while (1)
    {
      v5 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22E2C4694](v4 - 4, a1) : *(id *)(a1 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      v8 = objc_msgSend(v5, sel_appId);
      if (v8)
      {
        v9 = v8;
        v10 = sub_2291C46B8();
        v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v3 = sub_229129450(0, v3[2] + 1, 1, (uint64_t)v3);
        v14 = v3[2];
        v13 = v3[3];
        if (v14 >= v13 >> 1)
          v3 = sub_229129450((_QWORD *)(v13 > 1), v14 + 1, 1, (uint64_t)v3);
        v3[2] = v14 + 1;
        v15 = &v3[2 * v14];
        v15[4] = v10;
        v15[5] = v12;
      }
      else
      {

      }
      ++v4;
      if (v7 == v2)
        goto LABEL_20;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
  }
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_22919B220(unint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v16 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_17;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_2291C4B68())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22E2C4694](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v15 = v7;
      sub_22919D954(&v15, a2, (uint64_t)a3, &v14);
      if (v3)
      {
        swift_bridgeObjectRelease();

        v10 = v16;
        swift_bridgeObjectRelease();
        return v10;
      }

      if (v14)
      {
        MEMORY[0x22E2C4358]();
        if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2291C479C();
        sub_2291C47B4();
        sub_2291C4790();
      }
      ++v6;
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        v10 = v16;
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  v10 = MEMORY[0x24BEE4AF8];
LABEL_19:

  return v10;
}

uint64_t sub_22919B3E0(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  unint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v25;
  uint64_t v26;

  v2 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v26 = MEMORY[0x24BEE4AF8];
    sub_22919F08C(0, v3, 0);
    v5 = v26;
    v6 = sub_22914C1B8();
    v7 = (uint64_t *)(a1 + 40);
    v25 = v2;
    do
    {
      v9 = *(v7 - 1);
      v8 = *v7;
      swift_bridgeObjectRetain();
      v10 = objc_msgSend(v2, sel_isInCarPlay);
      v11 = (void *)sub_2291C48E0();
      v12 = v11;
      if (v10)
      {
        v13 = v10;
        v14 = v6;
        v15 = sub_2291C4904();

        if ((v15 & 1) != 0)
        {
          if (qword_255A2A100 != -1)
            swift_once();
          v16 = off_255A2F980;
          if (*((_QWORD *)off_255A2F980 + 2))
          {
            swift_bridgeObjectRetain();
            v17 = sub_22919ECD4(v9, v8);
            if ((v18 & 1) != 0)
            {
              v19 = (uint64_t *)(v16[7] + 16 * v17);
              v9 = *v19;
              v20 = v19[1];
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease_n();
              v8 = v20;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
        }
        v6 = v14;
      }
      else
      {

      }
      v22 = *(_QWORD *)(v26 + 16);
      v21 = *(_QWORD *)(v26 + 24);
      if (v22 >= v21 >> 1)
        sub_22919F08C(v21 > 1, v22 + 1, 1);
      v7 += 2;
      *(_QWORD *)(v26 + 16) = v22 + 1;
      v23 = v26 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v9;
      *(_QWORD *)(v23 + 40) = v8;
      --v3;
      v2 = v25;
    }
    while (v3);

  }
  else
  {

    return MEMORY[0x24BEE4AF8];
  }
  return v5;
}

uint64_t sub_22919B5D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2DEC8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2291C47FC();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = (_QWORD *)OUTLINED_FUNCTION_31();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  v9 = (_QWORD *)OUTLINED_FUNCTION_31();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_255A2EE50;
  v9[5] = v8;
  sub_22919EB90((uint64_t)v6, (uint64_t)&unk_255A2EE60, (uint64_t)v9);
  return swift_release();
}

void LaunchAppIntentHandler.init()()
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
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
  __int128 v50;
  uint64_t v51;
  ValueMetadata *v52;
  _UNKNOWN **v53;
  __int128 v54;
  uint64_t v55;
  _UNKNOWN **v56;
  _BYTE v57[40];
  uint64_t v58[5];
  __int128 v59;
  __int128 v60;
  _UNKNOWN **v61;
  _QWORD v62[6];

  sub_2291C3518();
  if (qword_2540B1F40 != -1)
    swift_once();
  v0 = static InstalledAppProvider.shared;
  v55 = type metadata accessor for InstalledAppProvider();
  v56 = &protocol witness table for InstalledAppProvider;
  LOBYTE(v54) = v0;
  v52 = &type metadata for CoreDuetAppSelectionResolver;
  v53 = &off_24F1DA740;
  v1 = OUTLINED_FUNCTION_31();
  *(_QWORD *)&v50 = v1;
  *(_QWORD *)(v1 + 40) = &type metadata for CoreDuetKnowledgeStore;
  *(_QWORD *)(v1 + 48) = &off_24F1DCE58;
  v62[5] = 1;
  OUTLINED_FUNCTION_69_4(v1, v2, v3, v4, v5, v6, v7, v8, v23, v25, *((uint64_t *)&v25 + 1), v26, v27, v28, v29, v30, v31, v32, v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    *((uint64_t *)&v50 + 1),
    v51,
    (uint64_t)v52,
    (uint64_t)v53,
    v54);
  OUTLINED_FUNCTION_68_6(v9, v10, v11, v12, v13, v14, v15, v16, v24, v25, *((uint64_t *)&v25 + 1), v26, v27, v28, v29, v30, v31, v32, v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    *((uint64_t *)&v50 + 1),
    v51,
    (uint64_t)v52,
    (uint64_t)v53,
    v54);
  objc_opt_self();
  v17 = OUTLINED_FUNCTION_14_1();
  v18 = OUTLINED_FUNCTION_24_11(v17, sel_sharedPreferences);
  sub_22917BCD8(v18);
  v58[3] = type metadata accessor for RegexAppsResolver();
  v58[4] = (uint64_t)&off_24F1D9968;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v58);
  sub_2291501C4((uint64_t)&v45, (uint64_t)boxed_opaque_existential_1);
  if (v27)
  {
    *((_QWORD *)&v60 + 1) = &type metadata for AceAppResolver;
    v61 = &off_24F1DA660;
    v20 = OUTLINED_FUNCTION_31();
    *(_QWORD *)&v59 = v20;
    sub_22911F6D8(&v25, v20 + 56);
    sub_22911F6D8(&v54, v20 + 16);
    *(_QWORD *)(v20 + 96) = 1;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v54);
    sub_22912C160((uint64_t)&v25, &qword_255A2DC10);
    v59 = 0u;
    v60 = 0u;
    v61 = 0;
  }
  sub_22911F6D8(&v50, (uint64_t)v62);
  type metadata accessor for CarPlaySupportProvider();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_14_1();
  v21 = sub_22914985C();
  if (qword_255A2A090 != -1)
    swift_once();
  v22 = qword_255A30090;
  sub_22917BD24((uint64_t)v57, (uint64_t)&v25);
  swift_retain();
  sub_22919F8AC(&v25, v0, v21, v22);
  sub_22917BF20((uint64_t)v57);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  OUTLINED_FUNCTION_32_2();
}

uint64_t sub_22919B918()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

void static LaunchAppIntentHandler.handlerForIntentExtension()()
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
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
  __int128 v47;
  uint64_t v48;
  ValueMetadata *v49;
  _UNKNOWN **v50;
  _QWORD v51[5];
  _BYTE v52[40];
  uint64_t v53[5];
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _QWORD v57[6];

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  if (qword_2540B1F40 != -1)
    swift_once();
  v0 = static InstalledAppProvider.shared;
  v51[3] = type metadata accessor for InstalledAppProvider();
  v51[4] = &protocol witness table for InstalledAppProvider;
  LOBYTE(v51[0]) = v0;
  v49 = &type metadata for CoreDuetAppSelectionResolver;
  v50 = &off_24F1DA740;
  v1 = OUTLINED_FUNCTION_31();
  *(_QWORD *)&v47 = v1;
  *(_QWORD *)(v1 + 40) = &type metadata for CoreDuetKnowledgeStore;
  *(_QWORD *)(v1 + 48) = &off_24F1DCE58;
  v57[5] = 1;
  OUTLINED_FUNCTION_69_4(v1, v2, v3, v4, v5, v6, v7, v8, v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, v25, v26, v27, v28, v29, v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    *((uint64_t *)&v47 + 1),
    v48,
    (uint64_t)v49,
    (uint64_t)v50,
    v51[0]);
  OUTLINED_FUNCTION_68_6(v9, v10, v11, v12, v13, v14, v15, v16, v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, v25, v26, v27, v28, v29, v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    *((uint64_t *)&v47 + 1),
    v48,
    (uint64_t)v49,
    (uint64_t)v50,
    v51[0]);
  objc_opt_self();
  v17 = OUTLINED_FUNCTION_80_4();
  v18 = OUTLINED_FUNCTION_24_11(v17, sel_sharedPreferences);
  sub_22917BCD8(v18);
  v53[3] = type metadata accessor for RegexAppsResolver();
  v53[4] = (uint64_t)&off_24F1D9968;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v53);
  sub_2291501C4((uint64_t)&v42, (uint64_t)boxed_opaque_existential_1);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
  sub_22912C160((uint64_t)&v22, &qword_255A2DC10);
  v54 = 0u;
  v55 = 0u;
  v56 = 0;
  sub_22911F6D8(&v47, (uint64_t)v57);
  type metadata accessor for CarPlaySupportProvider();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_80_4();
  v20 = sub_22914985C();
  if (qword_255A2A090 != -1)
    swift_once();
  v21 = qword_255A30090;
  sub_22917BD24((uint64_t)v52, (uint64_t)&v22);
  OUTLINED_FUNCTION_14_1();
  sub_22919F8AC(&v22, v0, v20, v21);
  sub_22917BF20((uint64_t)v52);
  OUTLINED_FUNCTION_32_2();
}

uint64_t LaunchAppIntentHandler.resolveApplication(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[13] = a1;
  v2[14] = v1;
  v3 = OUTLINED_FUNCTION_66();
  v2[15] = v3;
  v2[16] = *(_QWORD *)(v3 - 8);
  v2[17] = OUTLINED_FUNCTION_25();
  v2[18] = OUTLINED_FUNCTION_25();
  v2[19] = OUTLINED_FUNCTION_25();
  v2[20] = OUTLINED_FUNCTION_25();
  v2[21] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_22919BBAC()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD);
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  void *v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  unint64_t v50;
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
  void *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  unsigned int v74;
  _QWORD *v75;
  unint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t *v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  char *v86;
  unint64_t *v87;
  __int128 v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  os_log_type_t v102;
  BOOL v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t);
  uint64_t v118;
  uint64_t v119;
  id *v120;
  id v121;
  char v122;
  void *v123;
  id v124;
  char v125;
  id v126;
  id v127;
  void *v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
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
  __int128 v158;
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
  uint64_t (*v171)(void);
  uint64_t (*v172)(void);
  uint64_t v173;
  uint64_t (*v174)(void);
  uint64_t (*v175)(uint64_t, uint64_t, _QWORD);
  uint64_t v176;
  _QWORD *v177;
  unint64_t v178;
  uint64_t v179[2];

  if (qword_255A2A050 != -1)
    swift_once();
  v1 = v0 + 12;
  v3 = (void **)(v0 + 13);
  v2 = (void *)v0[13];
  v4 = v0[21];
  v5 = v0[16];
  v6 = __swift_project_value_buffer(v0[15], (uint64_t)qword_255A30040);
  v0[22] = v6;
  v7 = *(void (**)(_QWORD))(v5 + 16);
  v0[23] = v7;
  v175 = (uint64_t (*)(uint64_t, uint64_t, _QWORD))v7;
  v176 = v6;
  v7(v4);
  v8 = v2;
  v9 = sub_2291C4520();
  v10 = sub_2291C4868();
  v11 = os_log_type_enabled(v9, v10);
  v12 = (void *)v0[13];
  v177 = v0;
  v167 = (uint64_t)(v0 + 12);
  if (v11)
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_12();
    v14 = (_QWORD *)OUTLINED_FUNCTION_12();
    *(_DWORD *)v13 = 138412290;
    *v1 = v12;
    v15 = v12;
    sub_2291C4940();
    *v14 = v12;

    OUTLINED_FUNCTION_81(&dword_229115000, v9, v10, "Calling resolveApplication with %@", v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }

  v16 = v0 + 11;
  v17 = v0[21];
  v18 = v0[15];
  v19 = *(uint64_t (**)(void))(v0[16] + 8);
  v0[24] = v19;
  v171 = v19;
  v20 = ((uint64_t (*)(uint64_t, uint64_t))v19)(v17, v18);
  v21 = OUTLINED_FUNCTION_24_11(v20, sel_application);
  if (v21)
  {
    v22 = v21;
    sub_22917BC2C(v21);
    if (v24)
    {
      v31 = v23;
      v32 = v24;
      OUTLINED_FUNCTION_59_3(v23, v176, v25, v26, v27, v28, v29, v30, v140, v144, v148, v152, v156, v160, v163, v167, (uint64_t)v171, v175);
      OUTLINED_FUNCTION_57_5();
      v33 = sub_2291C4520();
      v34 = sub_2291C4868();
      v35 = OUTLINED_FUNCTION_55_6(v34);
      v36 = v0[20];
      v37 = v0[15];
      if (v35)
      {
        v38 = v16;
        v39 = (uint8_t *)OUTLINED_FUNCTION_12();
        v179[0] = OUTLINED_FUNCTION_12();
        *(_DWORD *)v39 = 136315138;
        OUTLINED_FUNCTION_57_5();
        *v38 = sub_22913EFA8(v31, v32, v179);
        sub_2291C4940();
        OUTLINED_FUNCTION_46_1();
        OUTLINED_FUNCTION_81(&dword_229115000, v33, (os_log_type_t)v1, "Application resolved in previous turn, succeeding with %s", v39);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }
      OUTLINED_FUNCTION_42_1();

      OUTLINED_FUNCTION_64_4(v36, v37, v51, v52, v53, v54, v55, v56, v141, v145, v149, v153, v157, v161, v164, v168, v172);
      OUTLINED_FUNCTION_17_11();
      static ApplicationResolutionResult.success(with:)();

      goto LABEL_45;
    }

  }
  sub_22919F7A4(*v3);
  if (!v40)
    goto LABEL_53;
  v41 = v40;
  if ((unint64_t)v40 >> 62)
  {
    if (v40 >= 0)
      v118 = v40 & 0xFFFFFFFFFFFFFF8;
    else
      v118 = v40;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_66_0();
    OUTLINED_FUNCTION_79_3();
    if (v118)
    {
LABEL_13:
      v42 = (uint64_t)(v0 + 9);
      v43 = v0[19];
      v175((uint64_t)v43, v176, v0[15]);
      swift_bridgeObjectRetain_n();
      sub_2291C4520();
      v44 = OUTLINED_FUNCTION_51();
      v45 = OUTLINED_FUNCTION_55_6(v44);
      v46 = v0[19];
      v47 = v0[15];
      if (v45)
      {
        v48 = (uint8_t *)OUTLINED_FUNCTION_12();
        v179[0] = OUTLINED_FUNCTION_12();
        *(_DWORD *)v48 = 136315138;
        sub_22917959C(v41);
        v0[10] = sub_22913EFA8(v49, v50, v179);
        sub_2291C4940();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_42_1();
        OUTLINED_FUNCTION_81(&dword_229115000, v43, (os_log_type_t)v1, "Suggested applications: %s", v48);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }
      OUTLINED_FUNCTION_42_1();

      OUTLINED_FUNCTION_64_4(v46, v47, v57, v58, v59, v60, v61, v62, v140, v144, v148, v152, v156, v160, v163, v167, v171);
      v63 = *v3;
      sub_22919B08C(v41);
      OUTLINED_FUNCTION_79_3();
      sub_22919B3E0((uint64_t)v43, v63);
      OUTLINED_FUNCTION_37_8();
      v64 = *(_QWORD *)(v42 + 16);
      v65 = MEMORY[0x24BEE4AF8];
      v150 = (uint64_t)v3;
      if (v64)
      {
        v179[0] = MEMORY[0x24BEE4AF8];
        sub_22919F08C(0, v64, 0);
        v169 = v42;
        v66 = (uint64_t *)(v42 + 40);
        v67 = v179[0];
        do
        {
          v68 = v67;
          v70 = *(v66 - 1);
          v69 = *v66;
          v71 = objc_allocWithZone(MEMORY[0x24BE16E10]);
          v72 = OUTLINED_FUNCTION_57_5();
          v73 = OUTLINED_FUNCTION_24_11(v72, sel_init);
          v74 = objc_msgSend(v73, sel_isClarityBoardEnabled);

          if (v74)
          {
            if (qword_255A2A0F8 != -1)
              swift_once();
            v75 = off_255A2F978;
            if (*((_QWORD *)off_255A2F978 + 2))
            {
              OUTLINED_FUNCTION_57_5();
              v76 = sub_22919ECD4(v70, v69);
              v77 = v69;
              if ((v78 & 1) != 0)
              {
                v79 = (uint64_t *)(v75[7] + 16 * v76);
                v70 = *v79;
                v77 = v79[1];
                swift_bridgeObjectRetain();
                swift_bridgeObjectRelease();
              }
              swift_bridgeObjectRelease();
              v69 = v77;
            }
          }
          v67 = v68;
          v179[0] = v68;
          v81 = *(_QWORD *)(v68 + 16);
          v80 = *(_QWORD *)(v68 + 24);
          if (v81 >= v80 >> 1)
          {
            sub_22919F08C(v80 > 1, v81 + 1, 1);
            v67 = v179[0];
          }
          *(_QWORD *)(v67 + 16) = v81 + 1;
          v82 = v67 + 16 * v81;
          *(_QWORD *)(v82 + 32) = v70;
          *(_QWORD *)(v82 + 40) = v69;
          v66 += 2;
          --v64;
        }
        while (v64);
        swift_bridgeObjectRelease();
        v65 = MEMORY[0x24BEE4AF8];
      }
      else
      {
        OUTLINED_FUNCTION_36();
        v67 = MEMORY[0x24BEE4AF8];
      }
      v178 = v65;
      v83 = *(_QWORD *)(v67 + 16);
      v0 = v177;
      v84 = (char *)v177[14];
      if (v83)
      {
        v85 = &v84[OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps];
        v86 = v84;
        swift_bridgeObjectRetain();
        v146 = v67;
        v87 = (unint64_t *)(v67 + 40);
        *(_QWORD *)&v88 = 136315138;
        v158 = v88;
        v154 = MEMORY[0x24BEE4AD8] + 8;
        do
        {
          v89 = *(v87 - 1);
          v90 = *v87;
          v91 = *((_QWORD *)v85 + 3);
          v92 = *((_QWORD *)v85 + 4);
          __swift_project_boxed_opaque_existential_1Tm(v85, v91);
          v93 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v92 + 16);
          OUTLINED_FUNCTION_83_3();
          if (v93(v89, v90, 1, v91, v92))
          {
            v100 = swift_bridgeObjectRelease();
            MEMORY[0x22E2C4358](v100);
            if (*(_QWORD *)((v178 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v178 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_2291C479C();
            sub_2291C47B4();
            sub_2291C4790();
          }
          else
          {
            v101 = v177[18];
            OUTLINED_FUNCTION_59_3(0, v176, v94, v95, v96, v97, v98, v99, v142, v146, v150, v154, v158, *((uint64_t *)&v158 + 1), v165, v169, v173, v175);
            swift_bridgeObjectRetain_n();
            sub_2291C4520();
            v102 = OUTLINED_FUNCTION_51();
            v103 = OUTLINED_FUNCTION_110(v102);
            v104 = v177[18];
            v105 = v177[15];
            if (v103)
            {
              v106 = OUTLINED_FUNCTION_12();
              v179[0] = OUTLINED_FUNCTION_12();
              *(_DWORD *)v106 = v159;
              OUTLINED_FUNCTION_83_3();
              *(_QWORD *)(v106 + 4) = sub_22913EFA8(v89, v90, v179);
              OUTLINED_FUNCTION_46_1();
              OUTLINED_FUNCTION_81(&dword_229115000, v101, (os_log_type_t)v91, "%s is not found in installedApps", (uint8_t *)v106);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_2_0();
            }
            OUTLINED_FUNCTION_42_1();

            OUTLINED_FUNCTION_64_4(v104, v105, v107, v108, v109, v110, v111, v112, v143, v147, v151, v155, v159, v162, v166, v170, v174);
            swift_bridgeObjectRelease();
          }
          v87 += 2;
          --v83;
        }
        while (v83);
        OUTLINED_FUNCTION_36();
        v0 = v177;
        v113 = v178;
        v114 = (char *)v177[14];
        v3 = (void **)v150;
      }
      else
      {
        v114 = v84;
        v113 = MEMORY[0x24BEE4AF8];
      }

      OUTLINED_FUNCTION_36();
      if (v113 >> 62)
      {
        swift_bridgeObjectRetain();
        v119 = OUTLINED_FUNCTION_66_0();
        OUTLINED_FUNCTION_77();
        if (v119)
          goto LABEL_44;
      }
      else if (*(_QWORD *)((v113 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_44:
        sub_22919DCD4((void *)v0[13], v113);
        OUTLINED_FUNCTION_77();
LABEL_45:
        swift_task_dealloc();
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_9();
        OUTLINED_FUNCTION_15();
        v115 = OUTLINED_FUNCTION_19_5();
        return v116(v115);
      }
    }
  }
  else if (*(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
LABEL_53:
  v120 = v3;
  v121 = objc_msgSend(*v3, sel_isRemoteExecution);
  v122 = OUTLINED_FUNCTION_56_3();
  v123 = (void *)OUTLINED_FUNCTION_19_13();
  if (!v121)
    goto LABEL_57;
  v124 = v121;
  v125 = OUTLINED_FUNCTION_78_4();

  if ((v125 & 1) == 0)
  {
    v122 = 0;
    goto LABEL_60;
  }
  v126 = objc_msgSend(*v120, sel_smartSelectApps);
  v123 = (void *)OUTLINED_FUNCTION_19_13();
  if (v126)
  {
    v127 = v126;
    OUTLINED_FUNCTION_78_4();
    OUTLINED_FUNCTION_161();

  }
  else
  {
LABEL_57:
    v122 = 0;
  }

LABEL_60:
  v128 = (void *)v0[13];
  sub_22911F698(v0[14] + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_appsSearcher, (uint64_t)(v0 + 2));
  __swift_project_boxed_opaque_existential_1Tm(v0 + 2, v0[5]);
  v129 = objc_msgSend(v128, sel_requestedApplication);
  if (v129)
  {
    sub_22917BC20(v129);
    v131 = v130;
    v133 = v132;
  }
  else
  {
    v131 = 0;
    v133 = 0;
  }
  v0[25] = v133;
  v134 = objc_msgSend((id)v0[13], sel_requestedApplication);
  if (v134)
  {
    sub_22917BD60(v134);
    v136 = v135;
    v138 = v137;
  }
  else
  {
    v136 = 0;
    v138 = 0;
  }
  v0[26] = v138;
  v139 = (_QWORD *)swift_task_alloc();
  v0[27] = v139;
  *v139 = v0;
  v139[1] = sub_22919C610;
  return sub_2291B84D0(v131, v133, v136, v138, v122 & 1);
}

uint64_t sub_22919C610(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 224) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_QWORD *)(v4 + 232) = a1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_13();
  return swift_task_switch();
}

uint64_t sub_22919C690()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(void **)(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  sub_22919DCD4(v2, v1);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_51_6();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  v3 = OUTLINED_FUNCTION_19_5();
  return v4(v3);
}

uint64_t sub_22919C700()
{
  NSObject *v0;
  Class isa;
  Class v2;
  objc_class *v3;
  objc_class *v4;
  os_log_type_t v5;
  objc_class *v6;
  uint8_t *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v15;

  isa = v0[28].isa;
  v2 = v0[17].isa;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v0[2]);
  OUTLINED_FUNCTION_25_13();
  v3 = isa;
  v4 = isa;
  OUTLINED_FUNCTION_70_3();
  v5 = OUTLINED_FUNCTION_51();
  if (OUTLINED_FUNCTION_109(v5))
  {
    v6 = v0[28].isa;
    v7 = (uint8_t *)OUTLINED_FUNCTION_12();
    v8 = OUTLINED_FUNCTION_12();
    *(_DWORD *)v7 = 136315138;
    v15 = v8;
    v0[7].isa = v6;
    v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A8C0);
    v10 = sub_2291C46D0();
    v0[8].isa = (Class)sub_22913EFA8(v10, v11, &v15);
    sub_2291C4940();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_161_0();
    OUTLINED_FUNCTION_161_0();
    OUTLINED_FUNCTION_81(&dword_229115000, v0 + 2, (os_log_type_t)v2, "An error occurred trying to find apps: %s", v7);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_42();

  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_17_11();
  static LaunchAppApplicationResolutionResult.unsupported(forReason:)();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_51_6();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  v12 = OUTLINED_FUNCTION_19_5();
  return OUTLINED_FUNCTION_5_9(v12, v13);
}

uint64_t sub_22919C8DC(void *a1, void *aBlock, void *a3)
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
  v7[1] = sub_22919C958;
  return LaunchAppIntentHandler.resolveApplication(for:)((uint64_t)v6);
}

uint64_t sub_22919C958(void *a1)
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

uint64_t LaunchAppIntentHandler.confirm(intent:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[3] = a1;
  v2 = OUTLINED_FUNCTION_66();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_25();
  v1[7] = OUTLINED_FUNCTION_25();
  v1[8] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_22919CA34()
{
  _QWORD *v0;
  os_log_type_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  id v22;
  id v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  id v30;
  void *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(void);
  void *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;

  if (qword_255A2A050 != -1)
    swift_once();
  v2 = (void *)v0[3];
  v3 = v0[8];
  v4 = v0[4];
  v5 = v0[5];
  v6 = __swift_project_value_buffer(v4, (uint64_t)qword_255A30040);
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
  v7 = v2;
  sub_2291C4520();
  v8 = OUTLINED_FUNCTION_51();
  v9 = OUTLINED_FUNCTION_109(v8);
  v10 = (void *)v0[3];
  if (v9)
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_12();
    v12 = (_QWORD *)OUTLINED_FUNCTION_12();
    *(_DWORD *)v11 = 138412290;
    v0[2] = v10;
    v13 = v10;
    sub_2291C4940();
    *v12 = v10;

    OUTLINED_FUNCTION_81(&dword_229115000, v3, v1, "Calling confirm with %@", v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }

  v14 = (*(uint64_t (**)(_QWORD, _QWORD))(v0[5] + 8))(v0[8], v0[4]);
  v15 = OUTLINED_FUNCTION_24_11(v14, sel_application);
  if (v15)
  {
    v16 = v15;
    v17 = (id *)(v0 + 3);
    v18 = objc_msgSend(v15, sel_isOffloaded);
    OUTLINED_FUNCTION_56_3();
    v19 = (void *)OUTLINED_FUNCTION_19_13();
    if (v18)
    {
      v20 = v18;
      v21 = OUTLINED_FUNCTION_66_6();

      if ((v21 & 1) == 0)
        goto LABEL_15;
      v22 = objc_msgSend(*v17, sel_canReinstallOffloadedApps);
      v19 = (void *)OUTLINED_FUNCTION_19_13();
      if (v22)
      {
        v23 = v22;
        v24 = OUTLINED_FUNCTION_66_6();

        if ((v24 & 1) != 0)
        {
          v25 = objc_msgSend(*v17, sel_autoInstallOffloaded);
          v26 = (void *)OUTLINED_FUNCTION_19_13();
          v27 = v26;
          if (!v25)
          {

LABEL_21:
            v40 = (void *)v0[7];
            OUTLINED_FUNCTION_52_8();
            sub_2291C4520();
            v41 = OUTLINED_FUNCTION_51();
            if (OUTLINED_FUNCTION_13_5(v41))
            {
              *(_WORD *)OUTLINED_FUNCTION_12() = 0;
              OUTLINED_FUNCTION_7_12(&dword_229115000, v42, v43, "Confirm step: inProgress");
              OUTLINED_FUNCTION_2_0();
            }

            OUTLINED_FUNCTION_77_4();
            v44 = objc_allocWithZone((Class)OUTLINED_FUNCTION_31_11());
            v36 = 102;
LABEL_18:
            LaunchAppIntentResponse.init(code:userActivity:)(v36, 0);

            goto LABEL_19;
          }
          v28 = v25;
          v29 = OUTLINED_FUNCTION_78_4();

          if ((v29 & 1) == 0)
            goto LABEL_21;
        }
LABEL_15:
        v31 = (void *)v0[6];
        OUTLINED_FUNCTION_52_8();
        sub_2291C4520();
        v32 = OUTLINED_FUNCTION_51();
        if (OUTLINED_FUNCTION_13_5(v32))
        {
          *(_WORD *)OUTLINED_FUNCTION_12() = 0;
          OUTLINED_FUNCTION_7_12(&dword_229115000, v33, v34, "Confirm step: success");
          OUTLINED_FUNCTION_2_0();
        }

        OUTLINED_FUNCTION_77_4();
        v35 = objc_allocWithZone((Class)OUTLINED_FUNCTION_31_11());
        v36 = 1;
        goto LABEL_18;
      }
    }

    goto LABEL_15;
  }
  v30 = objc_allocWithZone((Class)type metadata accessor for LaunchAppIntentResponse());
  OUTLINED_FUNCTION_23_14();
LABEL_19:
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  v37 = OUTLINED_FUNCTION_19_5();
  return OUTLINED_FUNCTION_5_9(v37, v38);
}

uint64_t sub_22919CDDC(void *a1, void *aBlock, void *a3)
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
  v8[1] = sub_22919FFAC;
  return LaunchAppIntentHandler.confirm(intent:)((uint64_t)v6);
}

uint64_t LaunchAppIntentHandler.handle(intent:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[14] = a1;
  v2[15] = v1;
  v3 = OUTLINED_FUNCTION_66();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = OUTLINED_FUNCTION_25();
  v2[19] = OUTLINED_FUNCTION_25();
  v2[20] = OUTLINED_FUNCTION_25();
  v2[21] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_22919CEBC()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(NSObject *, uint64_t, uint64_t);
  id v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  id v29;
  char v30;
  _QWORD *v31;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  char *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t *v59;
  uint64_t v60;

  if (qword_255A2A050 != -1)
    swift_once();
  v1 = *(void **)(v0 + 112);
  v2 = *(NSObject **)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  v5 = __swift_project_value_buffer(v3, (uint64_t)qword_255A30040);
  *(_QWORD *)(v0 + 176) = v5;
  v6 = *(void (**)(NSObject *, uint64_t, uint64_t))(v4 + 16);
  *(_QWORD *)(v0 + 184) = v6;
  v6(v2, v5, v3);
  v7 = v1;
  sub_2291C4520();
  v8 = OUTLINED_FUNCTION_51();
  v9 = OUTLINED_FUNCTION_109(v8);
  v10 = *(void **)(v0 + 112);
  if (v9)
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_12();
    v12 = (_QWORD *)OUTLINED_FUNCTION_12();
    v59 = v11;
    *(_DWORD *)v11 = 138412290;
    *(_QWORD *)(v0 + 104) = v10;
    v13 = v10;
    sub_2291C4940();
    *v12 = v10;

    OUTLINED_FUNCTION_81(&dword_229115000, v2, (os_log_type_t)v4, "Calling handle with %@", v59);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }

  v14 = *(_QWORD *)(v0 + 168);
  v15 = *(_QWORD *)(v0 + 128);
  v16 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 136) + 8);
  *(_QWORD *)(v0 + 192) = v16;
  v17 = v16(v14, v15);
  v18 = OUTLINED_FUNCTION_24_11(v17, sel_application);
  *(_QWORD *)(v0 + 200) = v18;
  if (!v18)
    goto LABEL_13;
  v19 = v18;
  sub_22917BC2C(v18);
  *(_QWORD *)(v0 + 208) = v20;
  *(_QWORD *)(v0 + 216) = v21;
  if (!v21)
  {

LABEL_13:
    v6(*(NSObject **)(v0 + 144), v5, *(_QWORD *)(v0 + 128));
    v33 = sub_2291C4520();
    v34 = sub_2291C4850();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_229115000, v33, v34, "LaunchAppIntentHandler.handle: missing app / bundle id in the intent", v35, 2u);
      OUTLINED_FUNCTION_2_0();
    }
    v36 = *(_QWORD *)(v0 + 144);
    v37 = *(_QWORD *)(v0 + 128);

    v16(v36, v37);
    v38 = objc_allocWithZone((Class)OUTLINED_FUNCTION_31_11());
    v39 = OUTLINED_FUNCTION_23_14();
    goto LABEL_23;
  }
  v22 = v20;
  v23 = v21;
  v24 = OUTLINED_FUNCTION_24_11(v20, sel_isOffloaded);
  OUTLINED_FUNCTION_56_3();
  v25 = (void *)OUTLINED_FUNCTION_19_13();
  if (!v24)
  {
    v40 = 4;
LABEL_19:

    goto LABEL_20;
  }
  v26 = v24;
  v27 = sub_2291C4904();

  if ((v27 & 1) != 0)
  {
    v28 = objc_msgSend(*(id *)(v0 + 112), sel_canReinstallOffloadedApps);
    v25 = (void *)OUTLINED_FUNCTION_19_13();
    if (v28)
    {
      v29 = v28;
      v30 = sub_2291C4904();

      if ((v30 & 1) != 0)
      {
        __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)(v0 + 120)+ OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_offloadedAppInstaller), *(_QWORD *)(*(_QWORD *)(v0 + 120)+ OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_offloadedAppInstaller+ 24));
        v31 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 224) = v31;
        *v31 = v0;
        v31[1] = sub_22919D45C;
        return sub_229199F0C(v22, v23);
      }
      v40 = 100;
      goto LABEL_20;
    }
    v40 = 100;
    goto LABEL_19;
  }
  v40 = 4;
LABEL_20:
  v41 = objc_allocWithZone((Class)OUTLINED_FUNCTION_26_16());
  v42 = v40;
  v43 = v41;
  v44 = LaunchAppIntentResponse.init(code:userActivity:)(v42, 0);
  OUTLINED_FUNCTION_41_6(v44);
  OUTLINED_FUNCTION_25_13();
  v39 = v43;
  OUTLINED_FUNCTION_70_3();
  v45 = OUTLINED_FUNCTION_51();
  v46 = OUTLINED_FUNCTION_109(v45);
  v47 = *(void (**)(uint64_t, uint64_t))(v0 + 192);
  v48 = *(_QWORD *)(v0 + 152);
  v49 = *(_QWORD *)(v0 + 128);
  if (v46)
  {
    v50 = swift_slowAlloc();
    v60 = OUTLINED_FUNCTION_12();
    *(_DWORD *)v50 = 136315394;
    *(_QWORD *)(v0 + 40) = sub_22919F84C(v39);
    *(_QWORD *)(v0 + 48) = v51;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2DCA8);
    v52 = sub_2291C46D0();
    *(_QWORD *)(v0 + 56) = sub_22913EFA8(v52, v53, &v60);
    sub_2291C4940();
    OUTLINED_FUNCTION_56();

    *(_WORD *)(v50 + 12) = 2080;
    v54 = &v39[OBJC_IVAR___LaunchAppIntentResponse_code];
    OUTLINED_FUNCTION_72();
    *(_QWORD *)(v0 + 64) = *(_QWORD *)v54;
    v55 = sub_2291C46D0();
    *(_QWORD *)(v0 + 72) = sub_22913EFA8(v55, v56, &v60);
    sub_2291C4940();
    OUTLINED_FUNCTION_77();

    OUTLINED_FUNCTION_33_10(&dword_229115000, v57, v58, "Handling bundle %s with code %s");
    OUTLINED_FUNCTION_49_6();
    OUTLINED_FUNCTION_2_0();
  }

  v47(v48, v49);
LABEL_23:
  OUTLINED_FUNCTION_72_6();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  return (*(uint64_t (**)(char *))(v0 + 8))(v39);
}

uint64_t sub_22919D45C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_22919D4B4()
{
  uint64_t v0;
  id v1;
  char *v2;
  char *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = objc_allocWithZone((Class)OUTLINED_FUNCTION_26_16());
  v2 = LaunchAppIntentResponse.init(code:userActivity:)(101, 0);
  OUTLINED_FUNCTION_41_6(v2);
  OUTLINED_FUNCTION_25_13();
  v3 = (char *)v1;
  OUTLINED_FUNCTION_70_3();
  v4 = OUTLINED_FUNCTION_51();
  if (OUTLINED_FUNCTION_109(v4))
  {
    v25 = *(_QWORD *)(v0 + 152);
    v26 = *(_QWORD *)(v0 + 192);
    v23 = *(_QWORD *)(v0 + 200);
    v24 = *(_QWORD *)(v0 + 128);
    v5 = OUTLINED_FUNCTION_12();
    v27 = OUTLINED_FUNCTION_12();
    *(_DWORD *)v5 = 136315394;
    *(_QWORD *)(v0 + 40) = sub_22919F84C(v3);
    *(_QWORD *)(v0 + 48) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2DCA8);
    v7 = sub_2291C46D0();
    *(_QWORD *)(v0 + 56) = OUTLINED_FUNCTION_67_4(v7, v8, v9, v10, v11, v12, v23, v24, v25, v26, v27);
    OUTLINED_FUNCTION_44_7();
    OUTLINED_FUNCTION_77();

    *(_WORD *)(v5 + 12) = 2080;
    v13 = &v3[OBJC_IVAR___LaunchAppIntentResponse_code];
    OUTLINED_FUNCTION_72();
    *(_QWORD *)(v0 + 64) = *(_QWORD *)v13;
    v14 = sub_2291C46D0();
    *(_QWORD *)(v0 + 72) = OUTLINED_FUNCTION_67_4(v14, v15, v16, v17, v18, v19);
    sub_2291C4940();
    OUTLINED_FUNCTION_77();

    OUTLINED_FUNCTION_33_10(&dword_229115000, v20, v21, "Handling bundle %s with code %s");
    OUTLINED_FUNCTION_49_6();
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_72_6();
  swift_task_dealloc();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_1_10((uint64_t)v3, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22919D6B8()
{
  uint64_t v0;
  os_log_type_t v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t (*v21)(void);
  uint64_t v23;

  v2 = *(void **)(v0 + 232);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 184))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 128));
  v3 = v2;
  v4 = v2;
  swift_bridgeObjectRetain();
  v5 = sub_2291C4520();
  v6 = sub_2291C4850();
  if (OUTLINED_FUNCTION_110(v6))
  {
    v7 = *(void **)(v0 + 232);
    v8 = *(_QWORD *)(v0 + 208);
    v9 = *(_QWORD *)(v0 + 216);
    v10 = OUTLINED_FUNCTION_12();
    v23 = OUTLINED_FUNCTION_12();
    *(_DWORD *)v10 = 136315394;
    OUTLINED_FUNCTION_83_3();
    *(_QWORD *)(v0 + 80) = sub_22913EFA8(v8, v9, &v23);
    OUTLINED_FUNCTION_44_7();
    OUTLINED_FUNCTION_46_1();
    *(_WORD *)(v10 + 12) = 2080;
    *(_QWORD *)(v0 + 88) = v7;
    v11 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A8C0);
    v12 = sub_2291C46D0();
    *(_QWORD *)(v0 + 96) = OUTLINED_FUNCTION_67_4(v12, v13, v14, v15, v16, v17);
    sub_2291C4940();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_161_0();
    OUTLINED_FUNCTION_161_0();
    _os_log_impl(&dword_229115000, v5, v1, "Error prioritizing download for %s: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_42();

  OUTLINED_FUNCTION_89();
  v18 = *(void **)(v0 + 200);
  v19 = objc_allocWithZone((Class)OUTLINED_FUNCTION_31_11());
  OUTLINED_FUNCTION_23_14();

  OUTLINED_FUNCTION_42();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  v20 = OUTLINED_FUNCTION_19_5();
  return OUTLINED_FUNCTION_1_10(v20, v21);
}

uint64_t sub_22919D8D8(void *a1, void *aBlock, void *a3)
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
  v7[1] = sub_22919FFAC;
  return LaunchAppIntentHandler.handle(intent:)((uint64_t)v6);
}

void sub_22919D954(void **a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  _QWORD v38[2];
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v40 = a4;
  v7 = sub_2291C4538();
  v39 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = objc_msgSend(a2, sel_isInCarPlay);
  if (v11)
  {
    v12 = v11;
    sub_22917BC2C(v10);
    if (v14)
    {
      v15 = v13;
      sub_22914C1B8();
      v16 = (void *)sub_2291C48E0();
      v17 = sub_2291C4904();

      if ((v17 & 1) != 0)
      {
        __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(a3 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_carPlaySupportProvider), *(_QWORD *)(a3 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_carPlaySupportProvider + 24));
        v18 = sub_2291492B8(v15);
        swift_bridgeObjectRelease();

        if ((v18 & 1) == 0)
          goto LABEL_18;
        goto LABEL_8;
      }
      swift_bridgeObjectRelease();
    }

  }
LABEL_8:
  sub_22917BC2C(v10);
  v20 = v19;
  v22 = v21;
  sub_2291929D4(v10);
  LOBYTE(v20) = sub_22919E44C(v20, v22, v23, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0)
  {
    sub_22917BC2C(v10);
    if (v26)
    {
      v27 = v25;
      v28 = v26;
      v29 = *(_QWORD *)(a3 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps + 24);
      v30 = *(_QWORD *)(a3 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps + 32);
      __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(a3 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps), v29);
      if (((*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v30 + 40))(v27, v28, 1, v29, v30) & 1) != 0)
      {
        if (qword_255A2A050 != -1)
          swift_once();
        v31 = __swift_project_value_buffer(v7, (uint64_t)qword_255A30040);
        v32 = v39;
        (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v9, v31, v7);
        swift_bridgeObjectRetain();
        v33 = sub_2291C4520();
        v34 = sub_2291C4844();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = (uint8_t *)swift_slowAlloc();
          v36 = swift_slowAlloc();
          v42 = v36;
          *(_DWORD *)v35 = 136315138;
          v38[1] = v35 + 4;
          swift_bridgeObjectRetain();
          v41 = sub_22913EFA8(v27, v28, &v42);
          sub_2291C4940();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_229115000, v33, v34, "Filtered %s because it is not a launchable app.", v35, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E2C4EC8](v36, -1, -1);
          MEMORY[0x22E2C4EC8](v35, -1, -1);

          (*(void (**)(char *, uint64_t))(v39 + 8))(v9, v7);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v7);
        }
        goto LABEL_18;
      }
      swift_bridgeObjectRelease();
    }
    *v40 = v10;
    v37 = v10;
    return;
  }
LABEL_18:
  *v40 = 0;
}

void sub_22919DCD4(void *a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  _QWORD *v67;
  id v68;
  uint64_t v69;
  char *v70;
  os_log_type_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  id v82;
  uint64_t v83;
  unint64_t v84;

  v5 = OUTLINED_FUNCTION_66();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v77 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = ((char *)&v74 - v10);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v74 - v12;
  v14 = a2 >> 62;
  if (a2 >> 62)
  {
    OUTLINED_FUNCTION_86_2();
    v15 = sub_2291C4B68();
    OUTLINED_FUNCTION_79();
  }
  else
  {
    v15 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v15)
  {
    v16 = OUTLINED_FUNCTION_75_4();
    if (!v16 || (sub_22917BC20(v16), !v17))
    {
      v18 = OUTLINED_FUNCTION_75_4();
      if (!v18 || (sub_22917BD60(v18), !v19))
      {
        OUTLINED_FUNCTION_17_11();
        v25 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
        return;
      }
    }
    swift_bridgeObjectRelease();
  }
  v75 = v11;
  v76 = v6;
  v20 = sub_22919B220(a2, a1, v2);
  v84 = v20;
  v21 = sub_22919E55C((uint64_t *)&v84);
  if (v20 >> 62)
  {
    OUTLINED_FUNCTION_8_9();
    v26 = OUTLINED_FUNCTION_66_0();
    OUTLINED_FUNCTION_56();
    if (v26 == 1)
      goto LABEL_11;
    OUTLINED_FUNCTION_8_9();
    v22 = OUTLINED_FUNCTION_66_0();
    v21 = OUTLINED_FUNCTION_56();
  }
  else
  {
    v22 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22 == 1)
    {
LABEL_11:
      sub_22917BBF8(0, (v20 & 0xC000000000000001) == 0, v20);
      if ((v20 & 0xC000000000000001) != 0)
        v23 = (id)MEMORY[0x22E2C4694](0, v20);
      else
        v23 = *(id *)(v20 + 32);
      v24 = v23;
      OUTLINED_FUNCTION_17_11();
      static ApplicationResolutionResult.success(with:)();
      OUTLINED_FUNCTION_56();

      goto LABEL_44;
    }
  }
  if (v22 < 2)
  {
    v74 = v5;
    v28 = OUTLINED_FUNCTION_74_5(v21, sel_requestedApplication);
    if (v28)
    {
      sub_22917BD60(v28);
      v29 = (uint64_t)v28;
      v31 = v30;
    }
    else
    {
      v29 = 0;
      v31 = 0;
    }
    v32 = OUTLINED_FUNCTION_74_5((uint64_t)v28, sel_requestedApplication);
    if (v32)
    {
      sub_22917BC20(v32);
      v34 = v33;
      v36 = v35;
    }
    else
    {
      v34 = 0;
      v36 = 0;
    }
    v37 = sub_22919E44C(v29, v31, v34, v36);
    OUTLINED_FUNCTION_36();
    v38 = swift_bridgeObjectRelease();
    if (v37)
    {
      if (qword_255A2A050 != -1)
        swift_once();
      v39 = v74;
      v40 = __swift_project_value_buffer(v74, (uint64_t)qword_255A30040);
      v41 = v76;
      OUTLINED_FUNCTION_47_9(v40, v40);
      sub_2291C4520();
      v42 = OUTLINED_FUNCTION_51();
      if (OUTLINED_FUNCTION_13_5(v42))
      {
        *(_WORD *)OUTLINED_FUNCTION_12() = 0;
        OUTLINED_FUNCTION_4_17(&dword_229115000, v43, v44, "Restrictions appled for Siri app");
        OUTLINED_FUNCTION_2_0();
      }

      (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v39);
      OUTLINED_FUNCTION_17_11();
LABEL_32:
      static LaunchAppApplicationResolutionResult.unsupported(forReason:)();
LABEL_43:
      swift_bridgeObjectRelease();
      goto LABEL_44;
    }
    v45 = OUTLINED_FUNCTION_74_5(v38, sel_isInCarPlay);
    OUTLINED_FUNCTION_56_3();
    v46 = (void *)OUTLINED_FUNCTION_19_13();
    v47 = v46;
    if (v45)
    {
      v48 = v45;
      v49 = sub_2291C4904();

      if (v15 && (v49 & 1) != 0)
      {
        v50 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
        sub_22917BCD8(v50);
        v53 = v74;
        v54 = v76;
        if (v52)
        {
          v82 = v51;
          v83 = v52;
          v80 = 45;
          v81 = 0xE100000000000000;
          v78 = 95;
          v79 = 0xE100000000000000;
          sub_22912A5D0();
          v55 = sub_2291C4970();
          v57 = v56;
          OUTLINED_FUNCTION_56();
          v58 = (void *)objc_opt_self();
          sub_2291C46AC();
          OUTLINED_FUNCTION_37_8();
          objc_msgSend(v58, sel_isDomainServerFallbackDisabledForLocale_, v55);
          OUTLINED_FUNCTION_161();
          if ((v57 & 1) != 0)
          {
LABEL_54:
            if (qword_255A2A050 != -1)
              swift_once();
            v69 = __swift_project_value_buffer(v53, (uint64_t)qword_255A30040);
            v70 = v77;
            (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v77, v69, v53);
            sub_2291C4520();
            v71 = OUTLINED_FUNCTION_51();
            if (OUTLINED_FUNCTION_13_5(v71))
            {
              *(_WORD *)OUTLINED_FUNCTION_12() = 0;
              OUTLINED_FUNCTION_4_17(&dword_229115000, v72, v73, "Restrictions applied for carPlay");
              OUTLINED_FUNCTION_2_0();
            }

            (*(void (**)(char *, uint64_t))(v54 + 8))(v70, v53);
            OUTLINED_FUNCTION_17_11();
            goto LABEL_32;
          }
        }
        sub_22917BBF8(0, (a2 & 0xC000000000000001) == 0, a2);
        if ((a2 & 0xC000000000000001) != 0)
        {
          OUTLINED_FUNCTION_86_2();
          v59 = (id)MEMORY[0x22E2C4694](0, a2);
          OUTLINED_FUNCTION_79();
          if (!v14)
            goto LABEL_40;
        }
        else
        {
          v59 = *(id *)(a2 + 32);
          if (!v14)
          {
LABEL_40:
            v60 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_48:
            if (v60 == 1)
            {
              if (qword_255A2A050 != -1)
                swift_once();
              v61 = __swift_project_value_buffer(v53, (uint64_t)qword_255A30040);
              v62 = v75;
              (*(void (**)(NSObject *, uint64_t, uint64_t))(v54 + 16))(v75, v61, v53);
              v63 = v59;
              v64 = v62;
              sub_2291C4520();
              v65 = OUTLINED_FUNCTION_51();
              if (OUTLINED_FUNCTION_109(v65))
              {
                v66 = (uint8_t *)OUTLINED_FUNCTION_12();
                v67 = (_QWORD *)OUTLINED_FUNCTION_12();
                *(_DWORD *)v66 = 138412290;
                v82 = v63;
                v68 = v63;
                sub_2291C4940();
                *v67 = v63;

                OUTLINED_FUNCTION_81(&dword_229115000, v64, (os_log_type_t)a2, "We've identified a potential app in carPlay for server fallback: %@", v66);
                __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
                OUTLINED_FUNCTION_36_0();
                OUTLINED_FUNCTION_2_0();
              }

              (*(void (**)(NSObject *, uint64_t))(v54 + 8))(v62, v53);
              OUTLINED_FUNCTION_17_11();
              static LaunchAppApplicationResolutionResult.unsupported(forReason:)();

              goto LABEL_43;
            }

            goto LABEL_54;
          }
        }
        OUTLINED_FUNCTION_86_2();
        v60 = sub_2291C4B68();
        OUTLINED_FUNCTION_79();
        goto LABEL_48;
      }
    }
    else
    {

    }
    OUTLINED_FUNCTION_17_11();
    static LaunchAppApplicationResolutionResult.unsupported(forReason:)();
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_17_11();
  v27 = OUTLINED_FUNCTION_8_9();
  static ApplicationResolutionResult.disambiguation(with:)(v27);
  OUTLINED_FUNCTION_42_1();
LABEL_44:
  OUTLINED_FUNCTION_54_0();
}

BOOL sub_22919E44C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  char v7;
  uint64_t v8;
  char v10;

  if (a2)
  {
    if (sub_2291C46DC() == 0x6C7070612E6D6F63 && v5 == 0xEE00697269732E65)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      return 1;
    }
    v7 = sub_2291C4C94();
    OUTLINED_FUNCTION_56();
    if ((v7 & 1) != 0)
      return 1;
  }
  if (!a4)
    return 0;
  if (sub_2291C46DC() == 1769105779 && v8 == 0xE400000000000000)
    goto LABEL_14;
  v10 = sub_2291C4C94();
  OUTLINED_FUNCTION_36();
  return (v10 & 1) != 0;
}

uint64_t sub_22919E55C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  _DWORD *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  _DWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;

  v3 = OUTLINED_FUNCTION_66();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  if (!((unint64_t)*a1 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = OUTLINED_FUNCTION_8_9();
    if (v8)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_8_9();
  result = sub_2291C4B68();
  v8 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v8 < 1)
  {
    __break(1u);
  }
  else
  {
    v11 = 0;
    v40 = (_QWORD *)(v1 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps);
    v12 = v7 & 0xC000000000000001;
    *(_QWORD *)&v10 = 136315138;
    v37 = v10;
    v35 = v3;
    v36 = MEMORY[0x24BEE4AD8] + 8;
    v41 = v8;
    v42 = v7 & 0xC000000000000001;
    do
    {
      if (v12)
        v13 = (id)MEMORY[0x22E2C4694](v11, v7);
      else
        v13 = *(id *)(v7 + 8 * v11 + 32);
      v14 = v13;
      v15 = objc_msgSend(v13, sel_isOffloaded, v35, v36);
      if (v15 && (objc_msgSend(v15, sel_BOOLValue), OUTLINED_FUNCTION_161(), (v1 & 1) != 0))
      {
        sub_22917BC2C(v14);
        if (v17)
        {
          v18 = v16;
          v19 = v17;
          v20 = v40[3];
          v21 = v40[4];
          __swift_project_boxed_opaque_existential_1Tm(v40, v20);
          (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v21 + 32))(v18, v19, 1, v20, v21);
          v1 = v22;
          OUTLINED_FUNCTION_36();
          if (v1)
          {
            sub_2291C46AC();
            OUTLINED_FUNCTION_37_8();
          }
          else
          {
            v19 = 0;
          }
          v8 = v41;
          v12 = v42;
          objc_msgSend(v14, sel_setAdamId_, v19);

        }
        else
        {
          if (qword_255A2A008 != -1)
            swift_once();
          v23 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
          OUTLINED_FUNCTION_47_9(v23, v23);
          v24 = v14;
          LOBYTE(v1) = (_BYTE)v6;
          v25 = sub_2291C4520();
          v26 = sub_2291C4850();
          if (os_log_type_enabled(v25, v26))
          {
            v27 = (_DWORD *)OUTLINED_FUNCTION_12();
            v38 = v27;
            v39 = OUTLINED_FUNCTION_12();
            v43 = v39;
            *v27 = v37;
            v28 = objc_msgSend(v24, sel_description);
            v29 = sub_2291C46B8();
            v30 = v25;
            v32 = v31;

            v33 = sub_22913EFA8(v29, v32, &v43);
            v34 = (uint8_t *)v38;
            *(_QWORD *)(v38 + 1) = v33;

            OUTLINED_FUNCTION_36();
            swift_arrayDestroy();
            OUTLINED_FUNCTION_2_0();
          }

          (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
          v12 = v42;
        }
      }
      else
      {

      }
      ++v11;
    }
    while (v8 != v11);
    return OUTLINED_FUNCTION_56();
  }
  return result;
}

id LaunchAppIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchAppIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_22919E9A0(uint64_t a1)
{
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_20_17();
    OUTLINED_FUNCTION_9_18();
    __break(1u);
  }
  else
  {
    if (a1)
      *(_QWORD *)(sub_2291C47A8() + 16) = a1;
    OUTLINED_FUNCTION_42_7();
  }
}

void sub_22919EA0C(uint64_t a1)
{
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_20_17();
    OUTLINED_FUNCTION_9_18();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AAF0);
      *(_QWORD *)(OUTLINED_FUNCTION_81_2() + 16) = a1;
    }
    OUTLINED_FUNCTION_42_7();
  }
}

void sub_22919EA78(uint64_t a1)
{
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_20_17();
    OUTLINED_FUNCTION_9_18();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      sub_2291C43DC();
      *(_QWORD *)((OUTLINED_FUNCTION_81_2() & 0xFFFFFFFFFFFFF8) + 0x10) = a1;
    }
    OUTLINED_FUNCTION_42_7();
  }
}

uint64_t sub_22919EAE8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_229122588;
  return v6();
}

uint64_t sub_22919EB3C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_229122588;
  return v7();
}

uint64_t sub_22919EB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2291C47FC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_22912C160(a1, &qword_255A2DEC8);
  }
  else
  {
    sub_2291C47F0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2291C47CC();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_22919ECD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2291C4D0C();
  sub_2291C4700();
  v4 = sub_2291C4D30();
  return sub_22919EDD8(a1, a2, v4);
}

unint64_t sub_22919ED38(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E070);
  v2 = sub_2291C467C();
  return sub_22919EEB8(a1, v2);
}

unint64_t sub_22919EDA8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2291C48F8();
  return sub_22919EF84(a1, v2);
}

unint64_t sub_22919EDD8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2291C4C94() & 1) == 0)
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
      while (!v14 && (sub_2291C4C94() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22919EEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2E070);
    do
    {
      if ((sub_2291C46A0() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_22919EF84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_2291C43DC();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_2291C4904();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_2291C4904();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

void sub_22919F08C(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F6DC(a1, a2, a3, *v3, &qword_255A2A858, (void (*)(uint64_t, uint64_t, _QWORD *))sub_2291299E8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_229129D40);
  *v3 = v4;
}

void sub_22919F0C0(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2AA50, (uint64_t (*)(_QWORD))MEMORY[0x24BE9F808], (void (*)(uint64_t, uint64_t, char *))sub_2291299DC, (void (*)(uint64_t, uint64_t, char *))sub_229129D34);
  *v3 = v4;
}

void sub_22919F0FC(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2EE08, (uint64_t (*)(_QWORD))MEMORY[0x24BE9F8C0], (void (*)(uint64_t, uint64_t, char *))sub_229129A4C, (void (*)(uint64_t, uint64_t, char *))sub_229129DCC);
  *v3 = v4;
}

void sub_22919F138(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2EE00, (uint64_t (*)(_QWORD))MEMORY[0x24BE9F9A0], (void (*)(uint64_t, uint64_t, char *))sub_229129A58, (void (*)(uint64_t, uint64_t, char *))sub_229129DD8);
  *v3 = v4;
}

uint64_t sub_22919F174(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_22919F328(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

void sub_22919F190(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2EE10, type metadata accessor for AppLaunchDataModels.AppResultModel, (void (*)(uint64_t, uint64_t, char *))sub_229129AD0, (void (*)(uint64_t, uint64_t, char *))sub_229129E84);
  *v3 = v4;
}

void sub_22919F1CC(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2B248, (uint64_t (*)(_QWORD))MEMORY[0x24BEA5F08], (void (*)(uint64_t, uint64_t, char *))sub_229129ADC, (void (*)(uint64_t, uint64_t, char *))sub_229129E90);
  *v3 = v4;
}

void sub_22919F208(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2EE30, (uint64_t (*)(_QWORD))MEMORY[0x24BE97A98], (void (*)(uint64_t, uint64_t, char *))sub_229129B54, (void (*)(uint64_t, uint64_t, char *))sub_229129F48);
  *v3 = v4;
}

void sub_22919F244(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2EE28, type metadata accessor for AppLaunchDataModels.App, (void (*)(uint64_t, uint64_t, char *))sub_229129B60, (void (*)(uint64_t, uint64_t, char *))sub_229129F54);
  *v3 = v4;
}

void sub_22919F280(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F4D4(a1, a2, a3, *v3, &qword_255A2EE18, (uint64_t (*)(_QWORD))MEMORY[0x24BE701B0], (void (*)(uint64_t, uint64_t, char *))sub_229129B6C, (void (*)(uint64_t, uint64_t, char *))sub_229129F60);
  *v3 = v4;
}

char *sub_22919F2BC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_22919F5FC(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_22919F2D8(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_22919F6DC(a1, a2, a3, *v3, &qword_255A2AA68, (void (*)(uint64_t, uint64_t, _QWORD *))sub_2291299E8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22912A010);
  *v3 = v4;
}

void sub_22919F30C(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_22919F6DC(a1, a2, a3, a4, &qword_255A2A858, (void (*)(uint64_t, uint64_t, _QWORD *))sub_2291299E8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_229129D40);
}

uint64_t sub_22919F328(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EE98);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  v12 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_229129A64(v12, v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_229129DE4((uint64_t)v12, v8);
  }
  swift_release();
  return v10;
}

void sub_22919F410(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_6();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_7();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AAE8);
    v11 = OUTLINED_FUNCTION_31();
    v12 = _swift_stdlib_malloc_size((const void *)v11);
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  v13 = (char *)(a4 + 32);
  if ((a1 & 1) != 0)
  {
    sub_229129AE8(v13, v9, (char *)(v11 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_229129E9C((uint64_t)v13, v9);
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_32_2();
}

void sub_22919F4D4(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD), void (*a7)(uint64_t, uint64_t, char *), void (*a8)(uint64_t, uint64_t, char *))
{
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  size_t v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_6();
    if (v14 != v15)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
LABEL_24:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_7();
    }
  }
  else
  {
    v13 = a2;
  }
  v16 = *(_QWORD *)(a4 + 16);
  if (v13 <= v16)
    v17 = *(_QWORD *)(a4 + 16);
  else
    v17 = v13;
  if (!v17)
  {
    v21 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v18 = *(_QWORD *)(a6(0) - 8);
  v19 = *(_QWORD *)(v18 + 72);
  v20 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v21 = (_QWORD *)swift_allocObject();
  v22 = _swift_stdlib_malloc_size(v21);
  if (!v19)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v22 - v20 == 0x8000000000000000 && v19 == -1)
    goto LABEL_23;
  v21[2] = v16;
  v21[3] = 2 * ((uint64_t)(v22 - v20) / v19);
LABEL_18:
  v24 = *(unsigned __int8 *)(*(_QWORD *)(a6(0) - 8) + 80);
  v25 = (v24 + 32) & ~v24;
  v26 = (char *)v21 + v25;
  v27 = a4 + v25;
  if ((a1 & 1) != 0)
  {
    a7(v27, v16, v26);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a8(v27, v16, v26);
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_54_0();
}

char *sub_22919F5FC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EE20);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_229129BFC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22912A134(v13, v8, v12);
  }
  swift_release();
  return v10;
}

void sub_22919F6DC(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, _QWORD *), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  _QWORD *v18;
  uint64_t v19;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_54_6();
    if (v12 != v13)
    {
      if (v11 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_53_7();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v16 = (_QWORD *)OUTLINED_FUNCTION_31();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 16);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v18 = v16 + 4;
  v19 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    a6(v19, v14, v18);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a7(v19, v14, v18);
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_32_2();
}

void sub_22919F7A4(void *a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(a1, sel_suggestedApplications);
  if (v1)
  {
    v2 = v1;
    type metadata accessor for Application();
    sub_2291C4778();

  }
  OUTLINED_FUNCTION_0();
}

void sub_22919F7FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2291C46AC();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAppToLaunch_, v4);

}

uint64_t sub_22919F84C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_appToLaunch);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2291C46B8();

  return v3;
}

id sub_22919F8AC(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _BYTE v26[24];
  ValueMetadata *v27;
  _UNKNOWN **v28;
  _QWORD v29[3];
  uint64_t v30;
  _UNKNOWN **v31;
  _QWORD v32[5];
  _QWORD v33[5];

  v33[3] = &type metadata for AppsSearcher;
  v33[4] = &off_24F1DCF18;
  v33[0] = swift_allocObject();
  memcpy((void *)(v33[0] + 16), a1, 0xA8uLL);
  v8 = type metadata accessor for CarPlaySupportProvider();
  v32[3] = v8;
  v32[4] = &off_24F1D9728;
  v32[0] = a3;
  v30 = type metadata accessor for OffloadedAppInstallerImpl();
  v31 = &off_24F1DC398;
  v29[0] = a4;
  v27 = &type metadata for AppLaunchFeatureFlagsImpl;
  v28 = &off_24F1DCFA8;
  v9 = objc_allocWithZone((Class)type metadata accessor for LaunchAppIntentHandler());
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, (uint64_t)&type metadata for AppsSearcher);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *))(v13 + 16))(v12);
  v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (uint64_t *)&v26[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v17 + 16))(v16);
  v18 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v30);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (uint64_t *)&v26[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, (uint64_t)v27);
  MEMORY[0x24BDAC7A8](v22);
  (*(void (**)(void))(v23 + 16))();
  v24 = sub_22919FE1C(v12, a2, *v16, *v20, v9);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  return v24;
}

uint64_t sub_22919FAF4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  return swift_deallocObject();
}

uint64_t type metadata accessor for LaunchAppIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_22919FB44()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_18_6();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2_8(v1, (uint64_t)sub_229122588);
  return OUTLINED_FUNCTION_1_8(v2, v3, v4, v5);
}

uint64_t sub_22919FB8C()
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
  v5[1] = sub_229122588;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_255A2EE48 + dword_255A2EE48))(v2, v3, v4);
}

uint64_t objectdestroy_14Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22919FC34(uint64_t a1)
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
  v7[1] = sub_229122588;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255A2EE58 + dword_255A2EE58))(a1, v4, v5, v6);
}

uint64_t sub_22919FCB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22919FCDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)OUTLINED_FUNCTION_18_6();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22914FADC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255A2EE68 + dword_255A2EE68))(a1, v4);
}

uint64_t sub_22919FD4C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_18_6();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2_8(v1, (uint64_t)sub_229122588);
  return OUTLINED_FUNCTION_1_8(v2, v3, v4, v5);
}

uint64_t sub_22919FD94()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_18_6();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_2_8(v1, (uint64_t)sub_2291221EC);
  return OUTLINED_FUNCTION_1_8(v2, v3, v4, v5);
}

uint64_t sub_22919FDD8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  if (*(_QWORD *)(v0 + 120))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  return swift_deallocObject();
}

id sub_22919FE1C(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10;
  objc_super v12;
  _BYTE v13[24];
  ValueMetadata *v14;
  _UNKNOWN **v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  v19[3] = type metadata accessor for InstalledAppProvider();
  v19[4] = &protocol witness table for InstalledAppProvider;
  v19[0] = a2;
  v18[3] = &type metadata for AppsSearcher;
  v18[4] = &off_24F1DCF18;
  v18[0] = swift_allocObject();
  memcpy((void *)(v18[0] + 16), a1, 0xA8uLL);
  v17[3] = type metadata accessor for CarPlaySupportProvider();
  v17[4] = &off_24F1D9728;
  v17[0] = a3;
  v16[4] = &off_24F1DC398;
  v16[3] = type metadata accessor for OffloadedAppInstallerImpl();
  v15 = &off_24F1DCFA8;
  v16[0] = a4;
  v14 = &type metadata for AppLaunchFeatureFlagsImpl;
  sub_22911F698((uint64_t)v18, (uint64_t)a5 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_appsSearcher);
  sub_22911F698((uint64_t)v19, (uint64_t)a5 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps);
  sub_22911F698((uint64_t)v17, (uint64_t)a5 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_carPlaySupportProvider);
  sub_22911F698((uint64_t)v16, (uint64_t)a5 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_offloadedAppInstaller);
  sub_22911F698((uint64_t)v13, (uint64_t)a5 + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_featureFlags);
  v12.receiver = a5;
  v12.super_class = (Class)type metadata accessor for LaunchAppIntentHandler();
  v10 = objc_msgSendSuper2(&v12, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  return v10;
}

uint64_t OUTLINED_FUNCTION_9_18()
{
  return sub_2291C4B44();
}

uint64_t OUTLINED_FUNCTION_17_11()
{
  return type metadata accessor for LaunchAppApplicationResolutionResult();
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  return sub_2291C48E0();
}

char *OUTLINED_FUNCTION_23_14()
{
  return LaunchAppIntentResponse.init(code:userActivity:)(5, 0);
}

id OUTLINED_FUNCTION_24_11(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_25_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_26_16()
{
  return type metadata accessor for LaunchAppIntentResponse();
}

uint64_t OUTLINED_FUNCTION_31_11()
{
  return type metadata accessor for LaunchAppIntentResponse();
}

void OUTLINED_FUNCTION_33_10(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

uint64_t OUTLINED_FUNCTION_37_8()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_41_6(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_22919F7FC(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_44_7()
{
  return sub_2291C4940();
}

uint64_t OUTLINED_FUNCTION_47_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, a2, v2);
}

uint64_t OUTLINED_FUNCTION_49_6()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_51_6()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_52_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);
  uint64_t v3;

  return v2(v0, v3, *(_QWORD *)(v1 + 32));
}

BOOL OUTLINED_FUNCTION_55_6(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

unint64_t OUTLINED_FUNCTION_56_3()
{
  return sub_22914C1B8();
}

uint64_t OUTLINED_FUNCTION_57_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_59_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t (*a18)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v18;
  uint64_t v19;

  return a18(v18, a2, *(_QWORD *)(v19 + 120));
}

uint64_t OUTLINED_FUNCTION_63_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return __swift_destroy_boxed_opaque_existential_1Tm(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_64_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t (*a17)(void))
{
  return a17();
}

uint64_t OUTLINED_FUNCTION_65_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t, uint64_t))
{
  return a12(a11, a10);
}

uint64_t OUTLINED_FUNCTION_66_6()
{
  return sub_2291C4904();
}

uint64_t OUTLINED_FUNCTION_67_4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_22913EFA8(a1, a2, (uint64_t *)va);
}

void OUTLINED_FUNCTION_68_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  sub_22911F698((uint64_t)&a41, (uint64_t)&a31);
}

void OUTLINED_FUNCTION_69_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  sub_22911F698((uint64_t)&a41, v41 - 216);
}

uint64_t OUTLINED_FUNCTION_70_3()
{
  return sub_2291C4520();
}

uint64_t OUTLINED_FUNCTION_72_6()
{
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_74_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_75_4()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 603));
}

uint64_t OUTLINED_FUNCTION_77_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_78_4()
{
  return sub_2291C4904();
}

uint64_t OUTLINED_FUNCTION_79_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_80_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_81_2()
{
  return sub_2291C47A8();
}

uint64_t OUTLINED_FUNCTION_83_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_86_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2291A01D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2291C4D0C();
    sub_2291C4700();
    v6 = sub_2291C4D30();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2291C4C94() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2291C4C94() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_2291A0304(uint64_t a1)
{
  sub_2291A034C(a1, 0xD000000000000016, 0x80000002291D02C0, &qword_255A2EEA0);
}

void sub_2291A0328(uint64_t a1)
{
  sub_2291A034C(a1, 0xD000000000000028, 0x80000002291D0290, &qword_255A2EEA8);
}

void sub_2291A034C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = sub_2291C4898();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_36_8();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_18_2();
  v14 = v13 - v12;
  sub_2291C4634();
  sub_2291C4880();
  v15 = sub_229122DF4(a2, a3, v14, v4);
  OUTLINED_FUNCTION_32_9(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  OUTLINED_FUNCTION_106_0(v14, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  *a4 = v15;
  OUTLINED_FUNCTION_54_0();
}

void sub_2291A0404()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  sub_2291A54C8(0xD000000000000016, 0x80000002291D02C0, v0);
  qword_255A2EEB0 = (uint64_t)v0;
}

_QWORD *AppLaunchFlowProvider.init()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;

  a1[3] = &type metadata for AppLaunchFlowFactoryImpl;
  a1[4] = &off_24F1DCCC0;
  sub_2291C3A88();
  v2 = type metadata accessor for QuickActionScopeProvider();
  swift_allocObject();
  v3 = sub_2291301DC();
  a1[13] = v2;
  a1[14] = &off_24F1D8B30;
  a1[10] = v3;
  a1[18] = &type metadata for AppLaunchFeatureFlagsImpl;
  a1[19] = &off_24F1DCFA8;
  v4 = sub_2291C4370();
  v5 = sub_2291C4364();
  a1[23] = &type metadata for ReferenceResolver;
  a1[24] = &off_24F1D9080;
  result = (_QWORD *)swift_allocObject();
  a1[20] = result;
  result[5] = v4;
  result[6] = &off_24F1D8FF0;
  result[2] = v5;
  return result;
}

uint64_t sub_2291A0534()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

void static AppLaunchFlowProvider.warmup(refId:)(uint64_t a1, unint64_t a2)
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
  char *v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t aBlock[6];
  uint64_t v38;

  v35 = a2;
  v31 = a1;
  v3 = sub_2291C4538();
  v36 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_18_2();
  v7 = v6 - v5;
  v34 = *(_QWORD *)(sub_2291C4604() - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v8);
  v9 = OUTLINED_FUNCTION_10_15();
  v32 = *(_QWORD *)(v9 - 8);
  v33 = v9;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_18_2();
  v13 = v12 - v11;
  v14 = OUTLINED_FUNCTION_21_10();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v30 - v19;
  if (qword_255A2A0D0 != -1)
    swift_once();
  if (objc_msgSend((id)qword_255A2EEB0, sel_tryLock))
  {
    sub_2291C2CB4();
    if (qword_255A2A0C0 != -1)
      swift_once();
    v36 = qword_255A2EEA0;
    OUTLINED_FUNCTION_11_10((uint64_t)v18, (uint64_t)v20, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
    v21 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v22 = swift_allocObject();
    OUTLINED_FUNCTION_11_10(v22 + v21, (uint64_t)v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
    aBlock[4] = (uint64_t)sub_2291A5098;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2291A133C;
    aBlock[3] = (uint64_t)&block_descriptor_4;
    v23 = _Block_copy(aBlock);
    sub_2291C4628();
    v38 = MEMORY[0x24BEE4AF8];
    sub_22912E074(&qword_255A2EEB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EEC0);
    sub_2291A50D8();
    sub_2291C49DC();
    MEMORY[0x22E2C44B4](0, v13, v2, v23);
    _Block_release(v23);
    OUTLINED_FUNCTION_32_9(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v13, v33);
    OUTLINED_FUNCTION_72_5((uint64_t)v20, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    swift_release();
  }
  else
  {
    if (qword_255A2A008 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
    v25 = v36;
    OUTLINED_FUNCTION_9_13(v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 16));
    v26 = v35;
    swift_bridgeObjectRetain_n();
    v27 = sub_2291C4520();
    v28 = sub_2291C4868();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)OUTLINED_FUNCTION_12();
      aBlock[0] = OUTLINED_FUNCTION_12();
      *(_DWORD *)v29 = 136315138;
      swift_bridgeObjectRetain();
      v38 = sub_22913EFA8(v31, v26, aBlock);
      sub_2291C4940();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_81(&dword_229115000, v27, v28, "AppLaunchFlowProvider#warmup already in warmup. Rejecting warmup request for: %s", v29);
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_2_0();
    }

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v7, v3);
  }
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291A0970(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  os_signpost_type_t v18;
  uint8_t *v19;
  uint8_t *v20;
  os_signpost_id_t v21;
  uint8_t *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t aBlock;
  uint64_t v57;
  uint64_t (*v58)();
  void *v59;
  uint64_t (*v60)();
  uint64_t v61;

  v47 = a1;
  v1 = sub_2291C2CC0();
  v50 = *(_QWORD *)(v1 - 8);
  v51 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v48 = v2;
  v49 = (char *)v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2291C4604();
  v46 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v54 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_2291C464C();
  v45 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v52 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_2291C44B4();
  isa = v43[-1].isa;
  v7 = MEMORY[0x24BDAC7A8](v43);
  v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v42 - v10;
  v12 = sub_2291C44D8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A2A018 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v12, (uint64_t)qword_255A2FFE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  sub_2291C44A8();
  v17 = sub_2291C44CC();
  v18 = sub_2291C48D4();
  if ((sub_2291C491C() & 1) != 0)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v44 = v3;
    v20 = v19;
    *(_WORD *)v19 = 0;
    v21 = sub_2291C449C();
    _os_signpost_emit_with_name_impl(&dword_229115000, v17, v18, v21, "appLaunchFlowProviderWarmup", "enableTelemetry=YES", v20, 2u);
    v22 = v20;
    v3 = v44;
    MEMORY[0x22E2C4EC8](v22, -1, -1);
  }

  v23 = v43;
  (*((void (**)(char *, char *, NSObject *))isa + 2))(v9, v11, v43);
  sub_2291C4508();
  swift_allocObject();
  v44 = sub_2291C44FC();
  (*((void (**)(char *, NSObject *))isa + 1))(v11, v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v24 = dispatch_group_create();
  dispatch_group_enter(v24);
  if (qword_255A2A0C8 != -1)
    swift_once();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v24;
  v60 = sub_2291A5530;
  v61 = v25;
  aBlock = MEMORY[0x24BDAC760];
  v57 = 1107296256;
  v58 = sub_2291A133C;
  v59 = &block_descriptor_9;
  v26 = _Block_copy(&aBlock);
  v43 = v24;
  v27 = v52;
  sub_2291C4628();
  v55 = MEMORY[0x24BEE4AF8];
  v28 = sub_22912E074(&qword_255A2EEB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EEC0);
  v30 = sub_2291A50D8();
  v31 = v54;
  v42[2] = v29;
  v42[1] = v30;
  v42[3] = v28;
  sub_2291C49DC();
  MEMORY[0x22E2C44B4](0, v27, v31, v26);
  _Block_release(v26);
  v46 = *(_QWORD *)(v46 + 8);
  ((void (*)(char *, uint64_t))v46)(v31, v3);
  v32 = v53;
  v45 = *(_QWORD *)(v45 + 8);
  ((void (*)(char *, uint64_t))v45)(v27, v53);
  swift_release();
  if (qword_255A2A0C0 != -1)
    swift_once();
  v42[0] = qword_255A2EEA0;
  v34 = v49;
  v33 = v50;
  v35 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, v47, v51);
  v36 = (*(unsigned __int8 *)(v33 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80);
  v37 = (v48 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  v38 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v33 + 32))(v38 + v36, v34, v35);
  *(_QWORD *)(v38 + v37) = v44;
  v60 = sub_2291A5584;
  v61 = v38;
  aBlock = MEMORY[0x24BDAC760];
  v57 = 1107296256;
  v58 = sub_2291A133C;
  v59 = &block_descriptor_15;
  v39 = _Block_copy(&aBlock);
  swift_retain();
  sub_2291C4628();
  v55 = MEMORY[0x24BEE4AF8];
  sub_2291C49DC();
  v40 = v43;
  sub_2291C4874();
  _Block_release(v39);

  swift_release();
  ((void (*)(char *, uint64_t))v46)(v31, v3);
  ((void (*)(char *, uint64_t))v45)(v27, v32);
  return swift_release();
}

uint64_t sub_2291A0F44(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  int EnumTagSinglePayload;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2DEC8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2291C47FC();
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v5);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = a1;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5);
  v8 = a1;
  if (EnumTagSinglePayload == 1)
  {
    sub_22912250C((uint64_t)v4, &qword_255A2DEC8);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_2291C47F0();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_2291C47CC();
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
  *(_QWORD *)(v12 + 16) = &unk_255A2EEF8;
  *(_QWORD *)(v12 + 24) = v6;
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

uint64_t sub_2291A1104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  v5 = sub_2291C4538();
  v4[3] = v5;
  v4[4] = *(_QWORD *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2291A1164()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2540B1F40 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_2291A11DC;
  return sub_22913CE24();
}

uint64_t sub_2291A11DC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2291A1230()
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
  NSObject *v9;

  if (qword_255A2A008 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 32);
  v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 24), (uint64_t)qword_255A2FFB0);
  OUTLINED_FUNCTION_9_13(v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  v3 = sub_2291C4520();
  v4 = sub_2291C4868();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_12();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229115000, v3, v4, "AppLaunchFlowProvider#warmup InstalledAppProvider completed warmup", v5, 2u);
    OUTLINED_FUNCTION_2_0();
  }
  v7 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v9 = *(NSObject **)(v0 + 16);
  v8 = *(_QWORD *)(v0 + 24);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  dispatch_group_leave(v9);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2291A1340(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint8_t *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint8_t *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  NSObject *v34;
  os_signpost_type_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  char *v39;
  uint8_t *v40;
  os_signpost_id_t v41;
  _DWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v48 = a2;
  v47 = sub_2291C44E4();
  v50 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v49 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2291C44B4();
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2291C44D8();
  v52 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v51 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2291C2CC0();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v43 - v12;
  v14 = sub_2291C4538();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255A2A008 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v14, (uint64_t)qword_255A2FFB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v13, a1, v8);
  v19 = sub_2291C4520();
  v20 = sub_2291C4868();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v44 = v15;
    v22 = v21;
    v45 = v6;
    *(_DWORD *)v21 = 134217984;
    v43 = v21 + 4;
    v23 = v46;
    sub_2291C2CB4();
    sub_2291C2C60();
    v25 = v24;
    v26 = *(void (**)(char *, uint64_t))(v9 + 8);
    v26(v23, v8);
    v56 = v25;
    v6 = v45;
    sub_2291C4940();
    v26(v13, v8);
    _os_log_impl(&dword_229115000, v19, v20, "AppLaunchFlowProvider#warmup completed in %f seconds", v22, 0xCu);
    v27 = v22;
    v15 = v44;
    MEMORY[0x22E2C4EC8](v27, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v28 = v53;
  v29 = v50;
  v30 = v51;
  if (qword_255A2A0D0 != -1)
    swift_once();
  objc_msgSend((id)qword_255A2EEB0, sel_unlock);
  v31 = v52;
  v32 = v49;
  if (qword_255A2A018 != -1)
    swift_once();
  v33 = __swift_project_value_buffer(v6, (uint64_t)qword_255A2FFE0);
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v30, v33, v6);
  v34 = sub_2291C44CC();
  sub_2291C44F0();
  v35 = sub_2291C48C8();
  if ((sub_2291C491C() & 1) != 0)
  {
    swift_retain();
    sub_2291C4514();
    swift_release();
    v36 = v47;
    if ((*(unsigned int (**)(char *, uint64_t))(v29 + 88))(v32, v47) == *MEMORY[0x24BEE7810])
    {
      v37 = v6;
      v38 = "[Error] Interval already ended";
    }
    else
    {
      v39 = v32;
      v37 = v6;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v39, v36);
      v38 = "";
    }
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    v41 = sub_2291C449C();
    _os_signpost_emit_with_name_impl(&dword_229115000, v34, v35, v41, "appLaunchFlowProviderWarmup", v38, v40, 2u);
    MEMORY[0x22E2C4EC8](v40, -1, -1);
    v6 = v37;
  }

  (*(void (**)(char *, uint64_t))(v54 + 8))(v28, v55);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v30, v6);
}

uint64_t sub_2291A17FC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void AppLaunchFlowProvider.findFlow(for:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void **v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t, uint64_t);
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t, _QWORD *);
  uint64_t v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void **v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t, uint64_t);
  void (*v85)(uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t, void (*)(uint64_t, uint64_t, uint64_t));
  uint64_t (*v94)(uint64_t, uint64_t);
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t, uint64_t);
  id v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  id v104;
  id v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t);
  uint64_t v115;
  os_log_type_t v116;
  uint8_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t, uint64_t);
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t, uint64_t);
  NSObject *v127;
  os_log_type_t v128;
  uint8_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t, uint64_t);
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  void (*v135)(uint64_t, uint64_t);
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140[2];
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
  uint8_t *v158;
  void (*v159)(uint64_t, uint64_t, uint64_t);
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164[3];
  uint64_t v165;
  _UNKNOWN **v166;

  v161 = a2;
  v154 = sub_2291C3A40();
  v152 = *(_QWORD *)(v154 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_134();
  v143 = v6;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_19_1();
  v150 = v8;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v9);
  v153 = (uint64_t)v140 - v10;
  v159 = (void (*)(uint64_t, uint64_t, uint64_t))sub_2291C3A70();
  v157 = *((_QWORD *)v159 - 1);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_134();
  v149 = v12;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_19_1();
  v156 = v14;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v15);
  v158 = (uint8_t *)v140 - v16;
  v147 = sub_2291C3AAC();
  v146 = *(_QWORD *)(v147 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_18_2();
  v145 = v19 - v18;
  v20 = sub_2291C4538();
  v21 = *(_QWORD *)(v20 - 8);
  v162 = v20;
  v163 = v21;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_134();
  v142 = v23;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_19_1();
  v148 = v25;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_19_1();
  v151 = v27;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_19_1();
  v155 = v29;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_19_1();
  v141 = v31;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)v140 - v33;
  v35 = sub_2291C40D0();
  v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 - 8);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)v140 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)v140 - v40;
  sub_2291C3A7C();
  OUTLINED_FUNCTION_36_8();
  v43 = MEMORY[0x24BDAC7A8](v42);
  v45 = ((char *)v140 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_19_1();
  v140[1] = v46;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_19_1();
  v140[0] = v48;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v49);
  v51 = (void **)((char *)v140 - v50);
  v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v144 = a1;
  v53 = a1;
  v54 = v52;
  OUTLINED_FUNCTION_5_8((uint64_t)v140 - v50, v53, v52);
  v55 = (*(uint64_t (**)(void **, uint64_t))(v3 + 88))(v51, v2);
  if (v55 == *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_2_18();
    (*((void (**)(char *, void **, uint64_t))v36 + 4))(v41, v51, v35);
    if (qword_255A2A008 != -1)
      swift_once();
    v56 = v162;
    v57 = __swift_project_value_buffer(v162, (uint64_t)qword_255A2FFB0);
    v58 = v163;
    OUTLINED_FUNCTION_11_10((uint64_t)v34, v57, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v163 + 16));
    (*((void (**)(char *, char *, uint64_t))v36 + 2))(v39, v41, v35);
    OUTLINED_FUNCTION_28_8();
    v59 = OUTLINED_FUNCTION_25_14();
    if (os_log_type_enabled(v45, v59))
    {
      v60 = (uint8_t *)OUTLINED_FUNCTION_12();
      v159 = (void (*)(uint64_t, uint64_t, uint64_t))OUTLINED_FUNCTION_12();
      v164[0] = (uint64_t)v159;
      *(_DWORD *)v60 = 136315138;
      v158 = v60 + 4;
      sub_22912E074(&qword_255A2EED0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3710], MEMORY[0x24BEA3720]);
      v61 = sub_2291C4C70();
      v63 = OUTLINED_FUNCTION_20_18(v61, v62);
      OUTLINED_FUNCTION_10_5(v63);
      sub_2291C4940();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_27_12();
      OUTLINED_FUNCTION_81(&dword_229115000, v45, v59, "Received NLv3 parse: %s", v60);
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_2_0();
    }
    OUTLINED_FUNCTION_27_12();

    (*(void (**)(char *, uint64_t))(v58 + 8))(v34, v56);
    sub_2291A25A0((uint64_t)v41, v161);
    v77 = (void **)v41;
    v78 = v35;
LABEL_12:
    ((void (*)(void **, uint64_t))v36)(v77, v78);
    goto LABEL_37;
  }
  if (v55 != *MEMORY[0x24BE98E88])
  {
    if (v55 == *MEMORY[0x24BE98E18])
    {
      OUTLINED_FUNCTION_2_18();
      v79 = v152;
      v80 = v153;
      v81 = v154;
      OUTLINED_FUNCTION_29_2(v153, (uint64_t)v51, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v152 + 32));
      if (qword_255A2A008 != -1)
        swift_once();
      OUTLINED_FUNCTION_12_15(v162, (uint64_t)qword_255A2FFB0);
      v82 = v151;
      OUTLINED_FUNCTION_11_10(v151, v83, v84);
      v85 = *(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16);
      v86 = v150;
      OUTLINED_FUNCTION_31_12(v150);
      sub_2291C4520();
      v87 = OUTLINED_FUNCTION_25_14();
      if (OUTLINED_FUNCTION_28_12(v87))
      {
        v88 = (uint8_t *)OUTLINED_FUNCTION_12();
        v89 = OUTLINED_FUNCTION_12();
        v159 = v85;
        v164[0] = v89;
        *(_DWORD *)v88 = 136315138;
        v159(v143, v86, v81);
        v90 = sub_2291C46D0();
        v92 = OUTLINED_FUNCTION_20_18(v90, v91);
        OUTLINED_FUNCTION_10_5(v92);
        sub_2291C4940();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_38_10(v86);
        OUTLINED_FUNCTION_81(&dword_229115000, v45, (os_log_type_t)v34, "Received Pegasus results parse: %s", v88);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }
      OUTLINED_FUNCTION_38_10(v86);

      OUTLINED_FUNCTION_23_15();
      OUTLINED_FUNCTION_72_5(v82, v110);
      v165 = v81;
      v166 = &off_24F1DC370;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v164);
      OUTLINED_FUNCTION_31_12((uint64_t)boxed_opaque_existential_1);
      OUTLINED_FUNCTION_19_14();
      OUTLINED_FUNCTION_38_10(v80);
    }
    else if (v55 == *MEMORY[0x24BE98E20])
    {
      OUTLINED_FUNCTION_2_18();
      v95 = *v51;
      if (qword_255A2A008 != -1)
        swift_once();
      v96 = v162;
      OUTLINED_FUNCTION_12_15(v162, (uint64_t)qword_255A2FFB0);
      v97 = v148;
      OUTLINED_FUNCTION_11_10(v148, v98, v99);
      v100 = v95;
      v101 = OUTLINED_FUNCTION_28_8();
      v102 = sub_2291C4868();
      if (os_log_type_enabled(v101, v102))
      {
        v103 = (uint8_t *)OUTLINED_FUNCTION_12();
        v164[0] = OUTLINED_FUNCTION_12();
        *(_DWORD *)v103 = 136315138;
        v159 = (void (*)(uint64_t, uint64_t, uint64_t))(v103 + 4);
        v104 = v100;
        v105 = objc_msgSend(v104, sel_description);
        v106 = sub_2291C46B8();
        v108 = v107;

        v109 = sub_22913EFA8(v106, v108, v164);
        OUTLINED_FUNCTION_6_19(v109);
        sub_2291C4940();

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_81(&dword_229115000, v101, v102, "Received Pommes response parse: %s", v103);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }

      (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v97, v96);
      v165 = sub_2291C434C();
      v166 = &off_24F1DC380;
      v164[0] = (uint64_t)v100;
      OUTLINED_FUNCTION_19_14();
    }
    else
    {
      if (v55 != *MEMORY[0x24BE98E98])
      {
        if (qword_255A2A008 != -1)
          swift_once();
        v123 = v162;
        OUTLINED_FUNCTION_12_15(v162, (uint64_t)qword_255A2FFB0);
        v124 = v142;
        OUTLINED_FUNCTION_29_2(v142, v125, v126);
        OUTLINED_FUNCTION_29_15((uint64_t)v45);
        v36 = v54;
        v127 = OUTLINED_FUNCTION_28_8();
        v128 = sub_2291C4850();
        if (os_log_type_enabled(v127, v128))
        {
          v129 = (uint8_t *)OUTLINED_FUNCTION_12();
          v160 = OUTLINED_FUNCTION_12();
          v164[0] = v160;
          *(_DWORD *)v129 = 136315138;
          v130 = OUTLINED_FUNCTION_39_7();
          OUTLINED_FUNCTION_5_8(v130, (uint64_t)v45, v131);
          v132 = sub_22914D99C(12);
          v134 = OUTLINED_FUNCTION_20_18(v132, v133);
          OUTLINED_FUNCTION_6_19(v134);
          sub_2291C4940();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_26_17();
          OUTLINED_FUNCTION_81(&dword_229115000, v127, v128, "Received unknown parse: %s", v129);
          OUTLINED_FUNCTION_36_0();
          OUTLINED_FUNCTION_2_0();
        }
        OUTLINED_FUNCTION_26_17();

        (*(void (**)(uint64_t, uint64_t))(v163 + 8))(v124, v123);
        sub_2291C3464();
        v77 = v51;
        v78 = v2;
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_2_18();
      (*(void (**)(uint64_t, void **, uint64_t))(v146 + 32))(v145, v51, v147);
      if (qword_255A2A008 != -1)
        swift_once();
      v112 = v162;
      OUTLINED_FUNCTION_12_15(v162, (uint64_t)qword_255A2FFB0);
      v113 = v141;
      v114(v141);
      v115 = v140[0];
      OUTLINED_FUNCTION_29_15(v140[0]);
      sub_2291C4520();
      v116 = OUTLINED_FUNCTION_25_14();
      if (OUTLINED_FUNCTION_28_12(v116))
      {
        v117 = (uint8_t *)OUTLINED_FUNCTION_12();
        v164[0] = OUTLINED_FUNCTION_12();
        *(_DWORD *)v117 = 136315138;
        v118 = OUTLINED_FUNCTION_39_7();
        OUTLINED_FUNCTION_5_8(v118, v115, v119);
        v120 = sub_22914D99C(12);
        v122 = OUTLINED_FUNCTION_20_18(v120, v121);
        OUTLINED_FUNCTION_6_19(v122);
        sub_2291C4940();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_106_0(v115, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
        OUTLINED_FUNCTION_81(&dword_229115000, v45, (os_log_type_t)v34, "Received USO parse: %s", v117);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }
      OUTLINED_FUNCTION_106_0(v115, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));

      OUTLINED_FUNCTION_23_15();
      v135(v113, v112);
      v136 = v147;
      v165 = v147;
      v166 = &off_24F1DC360;
      v137 = __swift_allocate_boxed_opaque_existential_1(v164);
      v138 = v146;
      v139 = v145;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v146 + 16))(v137, v145, v136);
      OUTLINED_FUNCTION_19_14();
      (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v139, v136);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v164);
    goto LABEL_37;
  }
  OUTLINED_FUNCTION_2_18();
  v65 = v157;
  v64 = (uint64_t)v158;
  v66 = v159;
  OUTLINED_FUNCTION_29_2((uint64_t)v158, (uint64_t)v51, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v157 + 32));
  v67 = v163;
  if (qword_255A2A008 != -1)
    swift_once();
  v68 = __swift_project_value_buffer(v162, (uint64_t)qword_255A2FFB0);
  v69 = v155;
  OUTLINED_FUNCTION_11_10(v155, v68, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v67 + 16));
  v70 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v65 + 16);
  v71 = v156;
  v70(v156, v64, v66);
  sub_2291C4520();
  v72 = OUTLINED_FUNCTION_25_14();
  if (os_log_type_enabled((os_log_t)v67, v72))
  {
    v73 = (uint8_t *)OUTLINED_FUNCTION_12();
    v164[0] = OUTLINED_FUNCTION_12();
    *(_DWORD *)v73 = 136315138;
    v154 = (uint64_t)(v73 + 4);
    v70(v149, v71, v159);
    v74 = sub_2291C46D0();
    v76 = OUTLINED_FUNCTION_20_18(v74, v75);
    OUTLINED_FUNCTION_10_5(v76);
    sub_2291C4940();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_30_8();
    OUTLINED_FUNCTION_81(&dword_229115000, v67, v72, "Received direct invocation parse: %s", v73);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }
  v93 = *(void (**)(uint64_t, void (*)(uint64_t, uint64_t, uint64_t)))(v65 + 8);
  OUTLINED_FUNCTION_30_8();

  OUTLINED_FUNCTION_23_15();
  OUTLINED_FUNCTION_72_5(v69, v94);
  sub_2291A4604();
  v93(v64, v66);
LABEL_37:
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291A25A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint8_t *v44;
  _QWORD *v45;
  uint8_t *v47;
  uint8_t *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[2];

  v50 = a2;
  v3 = sub_2291C4538();
  v51 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v47 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v47 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v47 - v13;
  v15 = type metadata accessor for AppLaunchIntent();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v47 - v19;
  v21 = sub_2291C40D0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v20, a1, v21);
  if (qword_255A2A020 != -1)
    swift_once();
  sub_22912E074((unint64_t *)&qword_255A2CD60, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchIntent, (uint64_t)&unk_2291CBB28);
  sub_2291C3E78();
  if (!LOBYTE(v53[0]))
    goto LABEL_7;
  if (LOBYTE(v53[0]) == 1)
  {
    if (qword_255A2A008 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
    v28 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v12, v27, v3);
    v29 = sub_2291C4520();
    v30 = sub_2291C4868();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_229115000, v29, v30, "AppLaunchFlowProvider.findFlow() returning closeAppFlow", v31, 2u);
      MEMORY[0x22E2C4EC8](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v3);
    type metadata accessor for CloseAppWrapperFlow();
    v53[0] = sub_22915E32C();
    sub_22912E074((unint64_t *)&qword_255A2C9D8, (uint64_t (*)(uint64_t))type metadata accessor for CloseAppWrapperFlow, (uint64_t)&unk_2291C8AA8);
    sub_2291C341C();
    swift_release();
    goto LABEL_18;
  }
  if (LOBYTE(v53[0]) == 11)
  {
    if (qword_255A2A080 != -1)
      swift_once();
    sub_2291C3E78();
    v32 = v53[1];
    swift_bridgeObjectRelease();
    if (!v32)
    {
      if (qword_255A2A008 != -1)
        swift_once();
      v33 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
      (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v9, v33, v3);
      v34 = sub_2291C4520();
      v35 = sub_2291C4868();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_229115000, v34, v35, "AppLaunchFlowProvider.findFlow() returning launchAppWrapperFlow when an appProvider is not specified", v36, 2u);
        MEMORY[0x22E2C4EC8](v36, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v9, v3);
      goto LABEL_12;
    }
LABEL_32:
    sub_2291C3464();
    return sub_2291224D0((uint64_t)v20);
  }
  if (LOBYTE(v53[0]) != 5)
  {
    if (qword_255A2A008 != -1)
      swift_once();
    v37 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
    v38 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v6, v37, v3);
    sub_2291954E0((uint64_t)v20, (uint64_t)v18);
    v39 = sub_2291C4520();
    v40 = sub_2291C4850();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v49 = (_QWORD *)swift_slowAlloc();
      v53[0] = (uint64_t)v49;
      *(_DWORD *)v41 = 136315138;
      v47 = v41 + 4;
      v48 = v41;
      sub_2291C3E78();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EED8);
      v42 = sub_2291C46D0();
      v52 = sub_22913EFA8(v42, v43, v53);
      sub_2291C4940();
      swift_bridgeObjectRelease();
      sub_2291224D0((uint64_t)v18);
      v44 = v48;
      _os_log_impl(&dword_229115000, v39, v40, "Unexpected verb: %s", v48, 0xCu);
      v45 = v49;
      swift_arrayDestroy();
      MEMORY[0x22E2C4EC8](v45, -1, -1);
      MEMORY[0x22E2C4EC8](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v3);
    }
    else
    {
      sub_2291224D0((uint64_t)v18);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v3);
    }
    goto LABEL_32;
  }
LABEL_7:
  if (qword_255A2A008 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
  v23 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v14, v22, v3);
  v24 = sub_2291C4520();
  v25 = sub_2291C4868();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_229115000, v24, v25, "AppLaunchFlowProvider.findFlow() returning launchAppWrapperFlow", v26, 2u);
    MEMORY[0x22E2C4EC8](v26, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v3);
LABEL_12:
  __swift_project_boxed_opaque_existential_1Tm(v49, v49[3]);
  sub_2291B34A8();
LABEL_18:
  sub_2291C3470();
  swift_release();
  return sub_2291224D0((uint64_t)v20);
}

uint64_t sub_2291A2C90@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  _OWORD *v54;
  _QWORD *v55;
  char v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  char v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  char v74;
  uint64_t *v75;
  char v76;
  void (*v77)(char *, uint64_t);
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  _OWORD *v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  _OWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  unint64_t v108;
  unint64_t v109;
  NSObject *v110;
  os_log_type_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  uint64_t v119;
  _QWORD v120[6];
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  _OWORD *v131;
  uint64_t v132;
  uint64_t v133;
  __int128 v134;
  ValueMetadata *v135;
  unint64_t v136;
  _QWORD v137[3];
  uint64_t v138;
  _OWORD *v139;

  v132 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EEE0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v124 = (char *)v120 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v121 = (uint64_t)v120 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v122 = (uint64_t)v120 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v120[3] = (char *)v120 - v10;
  v130 = sub_2291C4538();
  v129 = *(_QWORD *)(v130 - 8);
  v11 = MEMORY[0x24BDAC7A8](v130);
  v13 = (char *)v120 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v123 = (char *)v120 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v125 = (char *)v120 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v120[5] = (char *)v120 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v120[0] = (char *)v120 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v120[4] = (char *)v120 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v120[2] = (char *)v120 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v120[1] = (char *)v120 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)v120 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)v120 - v32;
  v34 = MEMORY[0x24BDAC7A8](v31);
  v126 = (char *)v120 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v127 = (char *)v120 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v128 = (char *)v120 - v38;
  v39 = sub_2291C2D14();
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)v120 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = a1[3];
  v43 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v44);
  v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v43 + 8))(v44, v43);
  if (v45)
  {
    v46 = (char *)v45;
    v135 = &type metadata for Features;
    v136 = sub_2291A53DC();
    LOBYTE(v134) = 0;
    v47 = sub_2291C3ADC();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v134);
    if ((v47 & 1) == 0 || (sub_229123A60(), !v49))
    {
      if (sub_2291C40B8() == 0xD000000000000013 && v57 == 0x80000002291D0210)
      {
        swift_bridgeObjectRelease();
        v58 = v131;
      }
      else
      {
        v66 = sub_2291C4C94();
        swift_bridgeObjectRelease();
        v58 = v131;
        if ((v66 & 1) == 0)
        {
          sub_229123334();
          __asm { BR              X10 }
        }
      }
      __swift_project_boxed_opaque_existential_1Tm(v58, v58[3]);
      sub_2291B39F4();
      sub_2291C3470();
      goto LABEL_17;
    }
    v50 = v48;
    v51 = v49;
    sub_229123F4C();
    if (!v53)
    {
      swift_bridgeObjectRelease();
      if (qword_255A2A008 != -1)
        swift_once();
      v68 = v130;
      v69 = __swift_project_value_buffer(v130, (uint64_t)qword_255A2FFB0);
      v70 = v129;
      (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))(v30, v69, v68);
      v71 = sub_2291C4520();
      v72 = sub_2291C4868();
      if (os_log_type_enabled(v71, v72))
      {
        v73 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v73 = 0;
        _os_log_impl(&dword_229115000, v71, v72, "AppLaunchFlowProvider.findFlow() returning noFlow because appName is not present in USO", v73, 2u);
        MEMORY[0x22E2C4EC8](v73, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v70 + 8))(v30, v68);
      sub_2291C3464();
      return swift_release();
    }
    v121 = v52;
    v123 = v53;
    v122 = v50;
    v124 = v51;
    v125 = v46;
    v54 = v131;
    v55 = (_QWORD *)v131 + 5;
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)v131 + 5, *((_QWORD *)v131 + 8));
    v56 = sub_2291C3560();
    sub_2291A5418(v54, &v134);
    if ((v56 & 1) != 0)
    {
      sub_2291A544C((uint64_t)&v134);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1Tm(v137, v138);
      v74 = sub_2291C3578();
      sub_2291A544C((uint64_t)&v134);
      if ((v74 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_255A2A008 != -1)
          swift_once();
        v97 = v130;
        v98 = __swift_project_value_buffer(v130, (uint64_t)qword_255A2FFB0);
        v99 = v129;
        (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))(v33, v98, v97);
        v100 = sub_2291C4520();
        v101 = sub_2291C4868();
        if (os_log_type_enabled(v100, v101))
        {
          v102 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v102 = 0;
          _os_log_impl(&dword_229115000, v100, v101, "AppLaunchFlowProvider.findFlow() returning noFlow because device is not iOS", v102, 2u);
          MEMORY[0x22E2C4EC8](v102, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v99 + 8))(v33, v97);
        sub_2291C3464();
        return swift_release();
      }
    }
    v75 = (uint64_t *)v131;
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)v131 + 10, *((_QWORD *)v131 + 13));
    __swift_project_boxed_opaque_existential_1Tm(v55, v75[8]);
    sub_2291C3530();
    v76 = sub_2291306E0();
    v77 = *(void (**)(char *, uint64_t))(v40 + 8);
    v77(v42, v39);
    if ((v76 & 1) != 0)
    {
      v78 = __swift_project_boxed_opaque_existential_1Tm(v75 + 20, v75[23]);
      v79 = (_QWORD *)sub_2291482BC((uint64_t)v78);
      v80 = v130;
      if (v79[2])
      {
        v82 = v79[4];
        v81 = v79[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v83 = v127;
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_229123F4C();
        v83 = v127;
        if (!v104)
        {
LABEL_43:
          if (qword_255A2A008 != -1)
            swift_once();
          v105 = __swift_project_value_buffer(v80, (uint64_t)qword_255A2FFB0);
          v106 = v129;
          v107 = v126;
          (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))(v126, v105, v80);
          v108 = (unint64_t)v123;
          swift_bridgeObjectRetain();
          v109 = (unint64_t)v124;
          swift_bridgeObjectRetain();
          v110 = sub_2291C4520();
          v111 = sub_2291C4868();
          if (os_log_type_enabled(v110, v111))
          {
            v112 = swift_slowAlloc();
            v113 = swift_slowAlloc();
            *(_QWORD *)&v134 = v113;
            *(_DWORD *)v112 = 136315394;
            swift_bridgeObjectRetain();
            v139 = (_OWORD *)sub_22913EFA8(v121, v108, (uint64_t *)&v134);
            sub_2291C4940();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v112 + 12) = 2080;
            swift_bridgeObjectRetain();
            v139 = (_OWORD *)sub_22913EFA8(v122, v109, (uint64_t *)&v134);
            sub_2291C4940();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_229115000, v110, v111, "AppLaunchFlowProvider.findFlow() returning deepLaunchWrapperFlow for App: %s and Action: %s", (uint8_t *)v112, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x22E2C4EC8](v113, -1, -1);
            MEMORY[0x22E2C4EC8](v112, -1, -1);

            (*(void (**)(char *, uint64_t))(v129 + 8))(v126, v130);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v106 + 8))(v107, v80);
          }
          type metadata accessor for DeepLaunchWrapperFlow();
          *(_QWORD *)&v134 = sub_2291836AC();
          sub_22912E074((unint64_t *)&qword_255A2E060, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchWrapperFlow, (uint64_t)&unk_2291CAD58);
          sub_2291C341C();
          swift_release();
          sub_2291C3470();
LABEL_17:
          swift_release();
          return swift_release();
        }
        v82 = v103;
        v81 = v104;
      }
      __swift_project_boxed_opaque_existential_1Tm(v75 + 10, *((_QWORD *)v131 + 13));
      if ((sub_2291307BC(v82, v81) & 1) != 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_43;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_255A2A008 != -1)
        swift_once();
      v114 = __swift_project_value_buffer(v80, (uint64_t)qword_255A2FFB0);
      v115 = v129;
      (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))(v83, v114, v80);
      swift_bridgeObjectRetain();
      v116 = sub_2291C4520();
      v117 = sub_2291C4868();
      if (os_log_type_enabled(v116, v117))
      {
        v118 = (uint8_t *)swift_slowAlloc();
        v119 = swift_slowAlloc();
        *(_QWORD *)&v134 = v119;
        *(_DWORD *)v118 = 136315138;
        swift_bridgeObjectRetain();
        v139 = (_OWORD *)sub_22913EFA8(v82, v81, (uint64_t *)&v134);
        sub_2291C4940();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_229115000, v116, v117, "AppLaunchFlowProvider.findFlow() returning noFlow because app %s is not in scope", v118, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E2C4EC8](v119, -1, -1);
        MEMORY[0x22E2C4EC8](v118, -1, -1);

        (*(void (**)(char *, uint64_t))(v115 + 8))(v127, v80);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v115 + 8))(v83, v80);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v84 = v130;
      v85 = v129;
      if (qword_255A2A008 != -1)
        swift_once();
      v86 = __swift_project_value_buffer(v84, (uint64_t)qword_255A2FFB0);
      v87 = v128;
      (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v128, v86, v84);
      v88 = v85;
      sub_2291A5418(v131, &v134);
      v89 = sub_2291C4520();
      v90 = sub_2291C4868();
      if (os_log_type_enabled(v89, v90))
      {
        v91 = (uint8_t *)swift_slowAlloc();
        v92 = (_OWORD *)swift_slowAlloc();
        v131 = v92;
        *(_DWORD *)v91 = 136315138;
        v139 = v92;
        v127 = (char *)(v91 + 4);
        __swift_project_boxed_opaque_existential_1Tm(v137, v138);
        sub_2291C3530();
        v93 = sub_2291C2D08();
        v95 = v94;
        v77(v42, v39);
        v133 = sub_22913EFA8(v93, v95, (uint64_t *)&v139);
        sub_2291C4940();
        swift_bridgeObjectRelease();
        sub_2291A544C((uint64_t)&v134);
        _os_log_impl(&dword_229115000, v89, v90, "AppLaunchFlowProvider.findFlow() returning noFlow because it is not available in %s", v91, 0xCu);
        v96 = v131;
        swift_arrayDestroy();
        MEMORY[0x22E2C4EC8](v96, -1, -1);
        MEMORY[0x22E2C4EC8](v91, -1, -1);

        (*(void (**)(char *, uint64_t))(v129 + 8))(v128, v130);
      }
      else
      {
        sub_2291A544C((uint64_t)&v134);

        (*(void (**)(char *, uint64_t))(v88 + 8))(v87, v84);
      }
    }
    sub_2291C3464();
    return swift_release();
  }
  if (qword_255A2A008 != -1)
    swift_once();
  v59 = v130;
  v60 = __swift_project_value_buffer(v130, (uint64_t)qword_255A2FFB0);
  v61 = v129;
  (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))(v13, v60, v59);
  v62 = sub_2291C4520();
  v63 = sub_2291C4850();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v64 = 0;
    _os_log_impl(&dword_229115000, v62, v63, "No USO task found in input", v64, 2u);
    MEMORY[0x22E2C4EC8](v64, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v61 + 8))(v13, v59);
  return sub_2291C3464();
}

uint64_t sub_2291A4604()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  v1 = v0;
  v3 = sub_2291C3A58();
  v4 = v2;
  if (v3 == 0xD000000000000022 && v2 == 0x80000002291D01B0 || (OUTLINED_FUNCTION_24_12() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1Tm(v1, v1[3]);
    sub_2291B34A8();
    sub_2291C3470();
    return swift_release();
  }
  if (v3 == 0xD000000000000021 && v4 == 0x80000002291D01E0)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    type metadata accessor for CloseAppWrapperFlow();
    sub_22915E32C();
    sub_22912E074((unint64_t *)&qword_255A2C9D8, (uint64_t (*)(uint64_t))type metadata accessor for CloseAppWrapperFlow, (uint64_t)&unk_2291C8AA8);
    sub_2291C341C();
    swift_release();
    sub_2291C3470();
    return swift_release();
  }
  v6 = OUTLINED_FUNCTION_24_12();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    goto LABEL_9;
  return sub_2291C3464();
}

uint64_t sub_2291A47A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  _QWORD *v9;
  char v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2EEE8);
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_2291C38A8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 184));
  v9 = (_QWORD *)sub_2291482BC((uint64_t)v8);
  v10 = sub_22913B6C8(0xD000000000000011, 0x80000002291D0230, v9);
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    sub_2291C3A7C();
    sub_2291C41D8();
    sub_2291C389C();
    sub_2291C347C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v11 = sub_2291C3488();
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v11);
  }
  else
  {
    v13 = sub_2291C3488();
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v13);
  }
}

uint64_t sub_2291A4934@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  _BYTE v4[24];
  uint64_t v5;

  sub_2291C3EB4();
  if (v5)
  {
    sub_2291C3FC8();
    if ((swift_dynamicCast() & 1) != 0)
      swift_release();
  }
  else
  {
    sub_22912250C((uint64_t)v4, &qword_255A2A878);
  }
  v2 = sub_2291C3488();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

uint64_t sub_2291A49CC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  _QWORD *v34;

  v2 = v1;
  v4 = sub_2291C4538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_2291A4E3C() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1Tm(v1, v1[3]);
    sub_2291B3970();
    sub_2291C3470();
    swift_release();
    v8 = sub_2291C3488();
    v9 = a1;
    v10 = 0;
    return __swift_storeEnumTagSinglePayload(v9, v10, 1, v8);
  }
  v27 = v7;
  v28 = v5;
  v29 = v4;
  v31 = a1;
  v11 = __swift_project_boxed_opaque_existential_1Tm(v1 + 20, v1[23]);
  v32 = sub_2291482BC((uint64_t)v11);
  v12 = *(_QWORD *)(v32 + 16);
  if (!v12)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    v8 = sub_2291C3488();
    v9 = v31;
    v10 = 1;
    return __swift_storeEnumTagSinglePayload(v9, v10, 1, v8);
  }
  v13 = (uint64_t *)(v32 + 40);
  v33 = "com.shazam.Shazam";
  v30 = 0x80000002291D0250;
  while (1)
  {
    v14 = *(v13 - 1);
    v15 = *v13;
    if ((v14 != 0xD000000000000019 || v15 != 0x80000002291CF550) && (sub_2291C4C94() & 1) == 0)
      break;
    __swift_project_boxed_opaque_existential_1Tm(v2 + 5, v2[8]);
    if ((sub_2291C359C() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      type metadata accessor for URLBasedLaunchFlow();
      v34 = sub_229168578();
      sub_22912E074(&qword_255A2CEA0, (uint64_t (*)(uint64_t))type metadata accessor for URLBasedLaunchFlow, (uint64_t)&unk_2291C8E20);
      sub_2291C341C();
      swift_release();
      v17 = v31;
      goto LABEL_21;
    }
LABEL_13:
    v13 += 2;
    if (!--v12)
      goto LABEL_14;
  }
  if ((v14 != 0xD000000000000018 || v15 != v30) && (sub_2291C4C94() & 1) == 0)
    goto LABEL_13;
  swift_bridgeObjectRelease();
  if (qword_255A2A008 != -1)
    swift_once();
  v18 = v29;
  v19 = __swift_project_value_buffer(v29, (uint64_t)qword_255A2FFB0);
  v21 = v27;
  v20 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v27, v19, v18);
  v22 = sub_2291C4520();
  v23 = sub_2291C4868();
  v24 = os_log_type_enabled(v22, v23);
  v17 = v31;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_229115000, v22, v23, "AppLaunchFlowProvider.findFlow() returning LaunchQuickNoteFlow", v25, 2u);
    MEMORY[0x22E2C4EC8](v25, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v18);
  type metadata accessor for LaunchQuickNoteFlow();
  v34 = sub_22914E8E4();
  sub_22912E074(&qword_255A2C240, (uint64_t (*)(uint64_t))type metadata accessor for LaunchQuickNoteFlow, (uint64_t)&unk_2291C78A0);
  sub_2291C341C();
  swift_release();
LABEL_21:
  sub_2291C3470();
  swift_release();
  v26 = sub_2291C3488();
  return __swift_storeEnumTagSinglePayload(v17, 0, 1, v26);
}

uint64_t sub_2291A4DAC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  if ((sub_2291A4E3C() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1Tm(v1, v1[3]);
    sub_2291B3970();
    sub_2291C3470();
    swift_release();
    v3 = 0;
  }
  else
  {
    v4 = __swift_project_boxed_opaque_existential_1Tm(v1 + 20, v1[23]);
    sub_2291482BC((uint64_t)v4);
    swift_bridgeObjectRelease();
    v3 = 1;
  }
  v5 = sub_2291C3488();
  return __swift_storeEnumTagSinglePayload(a1, v3, 1, v5);
}

uint64_t sub_2291A4E3C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v0 = sub_229124994();
  v1 = sub_22912909C(v0);
  if ((sub_2291A4EB0(qword_24F1D8330, v1) & 1) != 0)
    v2 = 0;
  else
    v2 = sub_2291A01D0(0xD000000000000019, 0x80000002291CD9A0, v1);
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2291A4EB0(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t result;
  uint64_t v17;
  unint64_t i;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  _QWORD *v22;
  uint64_t v23;

  v23 = a1[2];
  if (v23)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v4 = a1 + 4;
      v5 = a1 + 5;
      v6 = a2 + 56;
      v7 = 1;
      v22 = a1 + 4;
      while (1)
      {
        v8 = *v5;
        v9 = *v4;
        swift_bridgeObjectRetain();
        sub_2291C4D0C();
        sub_2291C4700();
        v10 = sub_2291C4D30();
        v11 = -1 << *(_BYTE *)(a2 + 32);
        v12 = v10 & ~v11;
        if (((*(_QWORD *)(v6 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          goto LABEL_24;
        v13 = *(_QWORD *)(a2 + 48);
        v14 = (_QWORD *)(v13 + 16 * v12);
        v15 = *v14 == v9 && v14[1] == v8;
        if (!v15 && (sub_2291C4C94() & 1) == 0)
        {
          v17 = ~v11;
          for (i = v12 + 1; ; i = v19 + 1)
          {
            v19 = i & v17;
            if (((*(_QWORD *)(v6 + (((i & v17) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v17)) & 1) == 0)
              break;
            v20 = (_QWORD *)(v13 + 16 * v19);
            v21 = *v20 == v9 && v20[1] == v8;
            if (v21 || (sub_2291C4C94() & 1) != 0)
              goto LABEL_10;
          }
LABEL_24:
          swift_bridgeObjectRelease();
          goto LABEL_25;
        }
LABEL_10:
        result = swift_bridgeObjectRelease();
        if (v7 == v23)
          goto LABEL_22;
        if (v7 >= a1[2])
          break;
        if (!*(_QWORD *)(a2 + 16))
          goto LABEL_25;
        v4 = &v22[2 * v7++];
        v5 = v4 + 1;
      }
      __break(1u);
    }
    else
    {
LABEL_25:
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
LABEL_22:
    swift_bridgeObjectRelease();
    return 1;
  }
  return result;
}

uint64_t sub_2291A5060()
{
  uint64_t v0;

  OUTLINED_FUNCTION_21_10();
  OUTLINED_FUNCTION_22_12();
  OUTLINED_FUNCTION_37_9(v0);
  return OUTLINED_FUNCTION_14_16();
}

uint64_t sub_2291A5098()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_21_10() - 8) + 80);
  return sub_2291A0970(v0 + ((v1 + 16) & ~v1));
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

unint64_t sub_2291A50D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A2EEC8;
  if (!qword_255A2EEC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A2EEC0);
    result = MEMORY[0x22E2C4E20](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255A2EEC8);
  }
  return result;
}

uint64_t destroy for AppLaunchFlowProvider(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 160);
}

_OWORD *initializeWithCopy for AppLaunchFlowProvider(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

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
  v8 = *(_OWORD *)((char *)a2 + 184);
  *(_OWORD *)((char *)a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)(a1 + 10), (uint64_t)(a2 + 10));
  return a1;
}

uint64_t *assignWithCopy for AppLaunchFlowProvider(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  __swift_assign_boxed_opaque_existential_1(a1 + 15, a2 + 15);
  __swift_assign_boxed_opaque_existential_1(a1 + 20, a2 + 20);
  return a1;
}

void *__swift_memcpy200_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xC8uLL);
}

uint64_t assignWithTake for AppLaunchFlowProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 160);
  v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppLaunchFlowProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 200))
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

uint64_t storeEnumTagSinglePayload for AppLaunchFlowProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
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
      *(_BYTE *)(result + 200) = 1;
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
    *(_BYTE *)(result + 200) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppLaunchFlowProvider()
{
  return &type metadata for AppLaunchFlowProvider;
}

unint64_t sub_2291A53DC()
{
  unint64_t result;

  result = qword_255A2FB80;
  if (!qword_255A2FB80)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CCBA0, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_255A2FB80);
  }
  return result;
}

_OWORD *sub_2291A5418(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for AppLaunchFlowProvider(a2, a1);
  return a2;
}

uint64_t sub_2291A544C(uint64_t a1)
{
  destroy for AppLaunchFlowProvider(a1);
  return a1;
}

uint64_t sub_2291A5478(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  uint64_t result;

  a4();
  v5 = *a1 + 8;
  result = sub_2291C4940();
  *a1 = v5;
  return result;
}

void sub_2291A54C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2291C46AC();
  objc_msgSend(a3, sel_setName_, v4);

}

uint64_t sub_2291A550C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2291A5530()
{
  uint64_t v0;

  return sub_2291A0F44(*(void **)(v0 + 16));
}

uint64_t sub_2291A5538()
{
  uint64_t v0;

  OUTLINED_FUNCTION_21_10();
  OUTLINED_FUNCTION_22_12();
  OUTLINED_FUNCTION_37_9(v0);
  swift_release();
  return OUTLINED_FUNCTION_14_16();
}

uint64_t sub_2291A5584()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_21_10() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_2291A1340(v0 + v2, *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_2291A55C0()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2291A55EC(uint64_t a1)
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
  v7[1] = sub_2291221EC;
  return sub_2291A1104(a1, v4, v5, v6);
}

uint64_t sub_2291A5658()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2291A567C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2291221EC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255A2DEE0 + dword_255A2DEE0))(a1, v4);
}

uint64_t OUTLINED_FUNCTION_2_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_6_19(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_10_15()
{
  return sub_2291C464C();
}

uint64_t OUTLINED_FUNCTION_12_15(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_14_16()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_19_14()
{
  uint64_t v0;

  return sub_2291A2C90((_QWORD *)(v0 - 136), *(_QWORD *)(v0 - 160));
}

uint64_t OUTLINED_FUNCTION_20_18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_22913EFA8(a1, a2, (uint64_t *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_21_10()
{
  return sub_2291C2CC0();
}

uint64_t OUTLINED_FUNCTION_24_12()
{
  return sub_2291C4C94();
}

uint64_t OUTLINED_FUNCTION_25_14()
{
  return sub_2291C4868();
}

uint64_t OUTLINED_FUNCTION_26_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_27_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

BOOL OUTLINED_FUNCTION_28_12(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_29_15(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, *(_QWORD *)(v3 - 296), v2);
}

uint64_t OUTLINED_FUNCTION_30_8()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_31_12(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_32_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_37_9@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v2 + v1);
}

uint64_t OUTLINED_FUNCTION_38_10(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_39_7()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 176) = v0;
  return *(_QWORD *)(v1 - 328);
}

uint64_t sub_2291A5864(uint64_t a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  uint64_t v53;
  uint8_t *v54;
  void (*v55)(char *, uint64_t);
  _QWORD v56[2];
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66[3];
  uint64_t v67;
  uint64_t v68;

  v2 = sub_2291C4538();
  v62 = *(_QWORD *)(v2 - 8);
  v63 = v2;
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_134();
  v61 = v3;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v4);
  v59 = (char *)v56 - v5;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v6);
  v56[1] = (char *)v56 - v7;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v8);
  v57 = (char *)v56 - v9;
  v10 = type metadata accessor for AppLaunchIntent();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2291C40D0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2291C3A7C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_134();
  v58 = v19;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v20);
  v60 = (char *)v56 - v21;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v56 - v23;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v25((char *)v56 - v23, a1, v17);
  if ((*(unsigned int (**)(char *, uint64_t))(v18 + 88))(v24, v17) == *MEMORY[0x24BE98E08])
  {
    (*(void (**)(char *, uint64_t))(v18 + 96))(v24, v17);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v24, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v12, v16, v13);
    if (qword_255A2A020 != -1)
      swift_once();
    sub_229138A58();
    sub_2291C3E78();
    if (LOBYTE(v66[0]) != 11)
    {
      if (sub_22915CC7C(v66[0]) == 1852141679 && v26 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_1_17();
        OUTLINED_FUNCTION_14_0();
      }
    }
    sub_2291224D0((uint64_t)v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    return 1;
  }
  v56[0] = v18;
  v57 = v24;
  sub_22919930C((uint64_t)&v64);
  if (v65)
  {
    sub_22911F6D8(&v64, (uint64_t)v66);
    v28 = v67;
    v29 = v68;
    __swift_project_boxed_opaque_existential_1Tm(v66, v67);
    v30 = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(v28, v29);
    v32 = v62;
    v31 = v63;
    if (v30)
    {
      sub_229123334();
      swift_release();
      v34 = OUTLINED_FUNCTION_9_19() == 1852141679 && v33 == 0xE400000000000000;
      if (v34
        || ((OUTLINED_FUNCTION_1_17(), OUTLINED_FUNCTION_10_16(), OUTLINED_FUNCTION_9_19() == 0x736972616D6D7573)
          ? (v36 = v35 == 0xE900000000000065)
          : (v36 = 0),
            v36))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_2291C4C94();
        OUTLINED_FUNCTION_10_16();
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v66);
      (*(void (**)(char *, uint64_t))(v56[0] + 8))(v57, v17);
      return 1;
    }
    if (qword_255A2A008 != -1)
      swift_once();
    v49 = __swift_project_value_buffer(v31, (uint64_t)qword_255A2FFB0);
    OUTLINED_FUNCTION_7_21(v49, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v32 + 16));
    v50 = sub_2291C4520();
    v51 = sub_2291C4850();
    v52 = os_log_type_enabled(v50, v51);
    v53 = v56[0];
    if (v52)
    {
      v54 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_WORD *)v54 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v50, v51, "Unable to extract verb from UserDialogAct, ignoring input", v54);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_3_15();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v66);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v57, v17);
  }
  else
  {
    sub_229135634((uint64_t)&v64);
    v38 = v62;
    v37 = v63;
    if (qword_255A2A008 != -1)
      swift_once();
    v39 = __swift_project_value_buffer(v37, (uint64_t)qword_255A2FFB0);
    v40 = v61;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v61, v39, v37);
    v41 = v60;
    v25(v60, a1, v17);
    v42 = sub_2291C4520();
    v43 = sub_2291C4850();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)OUTLINED_FUNCTION_12();
      v66[0] = OUTLINED_FUNCTION_12();
      *(_DWORD *)v44 = 136315138;
      v59 = (char *)(v44 + 4);
      v45 = v58;
      v25((char *)v58, (uint64_t)v41, v17);
      v46 = sub_22914D99C(v45);
      *(_QWORD *)&v64 = sub_22913EFA8(v46, v47, v66);
      sub_2291C4940();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v56[0] + 8))(v41, v17);
      _os_log_impl(&dword_229115000, v42, v43, "Unable to handle parse: %s", v44, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
    }
    v55 = *(void (**)(char *, uint64_t))(v56[0] + 8);
    v55(v41, v17);

    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v40, v37);
    v55(v57, v17);
  }
  return 0;
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return sub_2291C4C94();
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_7_21@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_9_19()
{
  unsigned __int8 v0;

  return sub_22915C50C(v0);
}

uint64_t OUTLINED_FUNCTION_10_16()
{
  return swift_bridgeObjectRelease();
}

id sub_2291A60D0()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LaunchAppIntentHandler()), sel_init);
  qword_255A300C0 = (uint64_t)result;
  return result;
}

void sub_2291A6100(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[3];
  uint64_t v47;
  uint64_t v48;

  v2 = v1;
  v44 = a1;
  v45 = sub_2291C3A7C();
  v43 = *(_QWORD *)(v45 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_134();
  v40 = v4;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - v6;
  v8 = sub_2291C4538();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_134();
  v41 = v10;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v39 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v39 - v15;
  if (qword_255A2A048 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v8, (uint64_t)qword_255A30028);
  v18 = *(_QWORD *)(v9 + 16);
  v42 = v17;
  OUTLINED_FUNCTION_155_1((uint64_t)v16, v17);
  v19 = sub_2291C4520();
  v20 = sub_2291C4844();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)OUTLINED_FUNCTION_11();
    v39 = v18;
    *(_WORD *)v21 = 0;
    OUTLINED_FUNCTION_39(&dword_229115000, v19, v20, "LaunchApp.FlowStrategy.actionForInput() called", v21);
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_29_16((uint64_t)v16);
  sub_2291C3A10();
  v22 = sub_2291A5864((uint64_t)v7);
  v23 = *(void (**)(char *, uint64_t))(v43 + 8);
  v24 = v7;
  v25 = v45;
  v23(v24, v45);
  if ((v22 & 1) == 0)
  {
    v32 = v41;
    OUTLINED_FUNCTION_155_1(v41, v42);
    v33 = sub_2291C4520();
    v34 = sub_2291C4844();
    if (OUTLINED_FUNCTION_23_0(v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v35 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v33, (os_log_type_t)v32, "LaunchApp.FlowStrategy.actionForInput() ignoring", v35);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_29_16(v32);
    goto LABEL_15;
  }
  v26 = v40;
  sub_2291C3A10();
  sub_22919930C((uint64_t)v46);
  v23(v26, v25);
  v27 = v47;
  if (v47)
  {
    v28 = v48;
    __swift_project_boxed_opaque_existential_1Tm(v46, v47);
    if ((*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28))
    {
      v29 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 160));
      v30 = sub_2291482BC((uint64_t)v29);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
      if (qword_255A2A0F0 != -1)
        swift_once();
      v31 = sub_2291B5844(v30, qword_255A300D8);
      swift_bridgeObjectRelease();
      if ((v31 & 1) != 0)
        goto LABEL_18;
LABEL_15:
      sub_2291C3674();
      goto LABEL_21;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
  }
  else
  {
    sub_22912250C((uint64_t)v46, &qword_255A2A9F0);
  }
LABEL_18:
  OUTLINED_FUNCTION_155_1((uint64_t)v14, v42);
  v36 = sub_2291C4520();
  v37 = sub_2291C4844();
  if (OUTLINED_FUNCTION_23_0(v37))
  {
    v38 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v38 = 0;
    OUTLINED_FUNCTION_39(&dword_229115000, v36, (os_log_type_t)v14, "LaunchApp.FlowStrategy.actionForInput() handling", v38);
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_29_16((uint64_t)v14);
  sub_2291C3668();
LABEL_21:
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291A64BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3[39] = a2;
  v3[40] = v2;
  v3[38] = a1;
  v4 = sub_2291C3A40();
  v3[41] = v4;
  v3[42] = *(_QWORD *)(v4 - 8);
  v3[43] = OUTLINED_FUNCTION_1_0();
  v5 = sub_2291C3A70();
  v3[44] = v5;
  v3[45] = *(_QWORD *)(v5 - 8);
  v3[46] = OUTLINED_FUNCTION_1_0();
  v6 = sub_2291C3AAC();
  v3[47] = v6;
  v3[48] = *(_QWORD *)(v6 - 8);
  v3[49] = OUTLINED_FUNCTION_1_0();
  type metadata accessor for AppLaunchIntent();
  v3[50] = OUTLINED_FUNCTION_1_0();
  v7 = sub_2291C40D0();
  v3[51] = v7;
  v3[52] = *(_QWORD *)(v7 - 8);
  v3[53] = OUTLINED_FUNCTION_1_0();
  v8 = sub_2291C2FE4();
  v3[54] = v8;
  v3[55] = *(_QWORD *)(v8 - 8);
  v3[56] = OUTLINED_FUNCTION_1_0();
  v9 = sub_2291C3A7C();
  v3[57] = v9;
  v3[58] = *(_QWORD *)(v9 - 8);
  v3[59] = OUTLINED_FUNCTION_25();
  v3[60] = OUTLINED_FUNCTION_25();
  v3[61] = OUTLINED_FUNCTION_25();
  v10 = sub_2291C4538();
  v3[62] = v10;
  v3[63] = *(_QWORD *)(v10 - 8);
  v3[64] = OUTLINED_FUNCTION_25();
  v3[65] = OUTLINED_FUNCTION_25();
  v3[66] = OUTLINED_FUNCTION_25();
  v3[67] = OUTLINED_FUNCTION_25();
  v3[68] = OUTLINED_FUNCTION_25();
  v3[69] = OUTLINED_FUNCTION_25();
  v3[70] = OUTLINED_FUNCTION_25();
  return swift_task_switch();
}

uint64_t sub_2291A6628()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  NSObject *v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v33)(_QWORD, unint64_t, _QWORD);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  _QWORD *v59;
  _WORD *v60;
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
  void *v74;
  _QWORD *v75;
  id v76;
  NSObject *v77;
  os_log_type_t v78;
  _DWORD *v79;
  _QWORD *v80;
  void *v81;
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
  void **v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  _WORD *v117;
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
  uint64_t *v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  _WORD *v140;
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
  void *v151;
  id v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  NSObject *v162;
  _WORD *v163;
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
  uint64_t *boxed_opaque_existential_1;
  id v175;
  id v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  NSObject *v189;
  os_log_type_t v190;
  _BOOL4 v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  _DWORD *v195;
  uint64_t v196;
  unint64_t v197;
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
  _BYTE *v208;
  id v209;
  void *v210;
  uint64_t v211;
  uint64_t v212;
  void (*v213)(uint64_t, uint64_t);
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
  void (*v234)(uint64_t, uint64_t, uint64_t);
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
  uint64_t (*v245)(void);
  uint64_t (*v246)(void);
  void **v247;
  uint64_t v248;
  void *v249;
  _QWORD *v250;
  uint64_t v251;

  v1 = v0;
  if (qword_255A2A048 != -1)
    swift_once();
  v2 = v0[70];
  v3 = v0[63];
  v4 = __swift_project_value_buffer(v1[62], (uint64_t)qword_255A30028);
  v5 = *(void (**)(uint64_t))(v3 + 16);
  v239 = v4;
  v5(v2);
  v6 = sub_2291C4520();
  sub_2291C4844();
  if (OUTLINED_FUNCTION_21_8(v6))
  {
    v7 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_65(v7);
    OUTLINED_FUNCTION_6_13(&dword_229115000, v6, v8, "LaunchApp.FlowStrategy.makeIntentFromParse() called");
    OUTLINED_FUNCTION_2_0();
  }
  v9 = v1[39];

  v10 = OUTLINED_FUNCTION_132();
  v245 = v11;
  ((void (*)(uint64_t))v11)(v10);
  v12 = (void *)v1[39];
  if (v9)
    v13 = (id)v1[39];
  else
    v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LaunchAppIntent()), sel_init);
  v14 = v1[40];
  v1[35] = v13;
  v15 = v13;
  v16 = v12;
  sub_2291A7A28();
  v17 = (void *)sub_2291C47C0();
  objc_msgSend(v15, sel_setCanReinstallOffloadedApps_, v17);

  v18 = *(void **)(v14 + 216);
  if (v18)
  {
    v19 = v1[40];
    OUTLINED_FUNCTION_56_3();
    v20 = v15;
    v21 = v18;
    v22 = (void *)OUTLINED_FUNCTION_34_6();
    OUTLINED_FUNCTION_32_0(v20, sel_setIsRemoteExecution_);

    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v19 + 16), *(_QWORD *)(v19 + 40));
    if ((sub_2291C35A8() & 1) != 0)
    {
      v23 = v20;
      v24 = (void *)OUTLINED_FUNCTION_34_6();
      OUTLINED_FUNCTION_32_0(v23, sel_setSmartSelectApps_);

    }
    sub_2291A7764(v21);

  }
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1[40] + 16), *(_QWORD *)(v1[40] + 40));
  if ((sub_2291C359C() & 1) != 0)
  {
    OUTLINED_FUNCTION_56_3();
    v25 = v15;
    v26 = (void *)sub_2291C48E0();
    OUTLINED_FUNCTION_11_15((uint64_t)v26, sel_setIsInCarPlay_);

  }
  v247 = (void **)(v1 + 35);
  v27 = v15;
  sub_2291994B4();
  v29 = v28;
  v30 = *(_QWORD *)(v28 + 16);
  v250 = v1;
  v232 = (uint64_t)v5;
  if (v30)
  {
    v226 = (uint64_t)v27;
    v31 = v1[55];
    v251 = MEMORY[0x24BEE4AF8];
    sub_22919F2D8(0, v30, 0);
    v220 = v29;
    v32 = v29 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
    v248 = *(_QWORD *)(v31 + 72);
    v33 = *(void (**)(_QWORD, unint64_t, _QWORD))(v31 + 16);
    do
    {
      v33(v1[56], v32, v1[54]);
      sub_229122548(&qword_255A2F070, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE70478], MEMORY[0x24BE70460]);
      v34 = sub_2291C431C();
      v36 = v35;
      (*(void (**)(_QWORD, _QWORD))(v31 + 8))(v1[56], v1[54]);
      v37 = v251;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_22919F2D8(0, *(_QWORD *)(v251 + 16) + 1, 1);
        v37 = v251;
      }
      v39 = *(_QWORD *)(v37 + 16);
      v38 = *(_QWORD *)(v37 + 24);
      if (v39 >= v38 >> 1)
      {
        sub_22919F2D8(v38 > 1, v39 + 1, 1);
        v37 = v251;
      }
      *(_QWORD *)(v37 + 16) = v39 + 1;
      v40 = v37 + 16 * v39;
      *(_QWORD *)(v40 + 32) = v34;
      *(_QWORD *)(v40 + 40) = v36;
      v1 = v250;
      v32 += v248;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease();
    v27 = (id)v226;
    v5 = (void (*)(uint64_t))v232;
  }
  else
  {
    swift_bridgeObjectRelease();
    v37 = MEMORY[0x24BEE4AF8];
  }
  v42 = (void **)(v1 + 37);
  v43 = v1[61];
  v44 = v1[57];
  v45 = v1[58];
  v46 = v1[38];
  sub_2291A7FA0(v37, v27);

  v47 = v1;
  v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
  v48(v43, v46, v44);
  v49 = (*(uint64_t (**)(uint64_t, uint64_t))(v45 + 88))(v43, v44);
  if (v49 == *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_16_0(v47[58]);
    v50 = OUTLINED_FUNCTION_7_22();
    OUTLINED_FUNCTION_6_20(v50, v51, v52, v53, v54, v55, v56, v57, v214, v220, v226, v232, v239);
    v58 = sub_2291C4520();
    sub_2291C4844();
    v59 = v47;
    if (OUTLINED_FUNCTION_21_8(v58))
    {
      v60 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v60);
      OUTLINED_FUNCTION_6_13(&dword_229115000, v58, v61, "LaunchAppFlowStrategy.makeIntentFromParse() Creating intent from NLv3IntentOnly parse");
      OUTLINED_FUNCTION_2_0();
    }
    v62 = v47[69];
    v63 = v47[68];
    v64 = v47[62];
    v65 = v47[52];
    v66 = v47[50];
    v67 = v47[40];

    OUTLINED_FUNCTION_15_13(v62, v64, v68, v69, v70, v71, v72, v73, v215, v221, v227, v233, v240, v245);
    OUTLINED_FUNCTION_25_15(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 16));
    v74 = (void *)v59[35];
    v75 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v67 + 136), *(_QWORD *)(v67 + 160));
    v76 = v74;
    sub_2291B634C(v66, (uint64_t)v75, v76);

    v234(v63, v241, v64);
    v77 = sub_2291C4520();
    v78 = sub_2291C4868();
    if (os_log_type_enabled(v77, v78))
    {
      v79 = (_DWORD *)OUTLINED_FUNCTION_12();
      v80 = (_QWORD *)OUTLINED_FUNCTION_12();
      *v79 = 138412290;
      OUTLINED_FUNCTION_72();
      v81 = *v247;
      *v42 = *v247;
      v82 = v81;
      sub_2291C4940();
      *v80 = v81;
      OUTLINED_FUNCTION_33_11(&dword_229115000, v77, v78, "Finished creating intent from parse: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
    }

    v84 = v59[52];
    v83 = v59[53];
    v86 = v59[50];
    v85 = v59[51];
    OUTLINED_FUNCTION_15_13(v59[68], v59[62], v87, v88, v89, v90, v91, v92, v216, v222, v228, (uint64_t)v234, v241, v246);
    sub_2291224D0(v86);
    (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
    v93 = v247;
    OUTLINED_FUNCTION_72();
    goto LABEL_68;
  }
  if (v49 == *MEMORY[0x24BE98E88])
  {
    v94 = v250[61];
    v84 = v250[45];
    v95 = v250[46];
    v96 = v250[44];
    (*(void (**)(uint64_t, _QWORD))(v250[58] + 96))(v94, v250[57]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 32))(v95, v94, v96);
    v97 = (void *)v250[35];
    v98 = OUTLINED_FUNCTION_18_15();

    if (!v98)
    {
      type metadata accessor for Application();
      v99 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v100 = v97;
      sub_22917BA94(0, 0);
      v102 = (void *)v101;
      OUTLINED_FUNCTION_11_15(v101, sel_setApplication_);

    }
    v103 = OUTLINED_FUNCTION_18_15();
    if (!v103)
    {
LABEL_56:
      v176 = OUTLINED_FUNCTION_18_15();
      if (!v176)
      {
        (*(void (**)(_QWORD, _QWORD))(v250[45] + 8))(v250[46], v250[44]);
LABEL_67:
        v93 = v247;
LABEL_68:
        v249 = *v93;
        goto LABEL_69;
      }
      v177 = v176;
      v178 = sub_2291C3A64();
      if (v178)
      {
        sub_22913B3B0(0x656D614E707061, 0xE700000000000000, v178, v250 + 21);
        OUTLINED_FUNCTION_21();
        if (v250[24])
        {
          v179 = swift_dynamicCast();
          if ((v179 & 1) != 0)
          {
            v180 = (void *)sub_2291C46AC();
            v179 = swift_bridgeObjectRelease();
LABEL_65:
            v84 = v250[45];
            v181 = v250[46];
            v182 = v250[44];
            OUTLINED_FUNCTION_11_15(v179, sel_setName_);

            v213 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
            v211 = v181;
            v212 = v182;
LABEL_66:
            v213(v211, v212);
            goto LABEL_67;
          }
LABEL_64:
          v180 = 0;
          goto LABEL_65;
        }
      }
      else
      {
        *(_OWORD *)(v250 + 21) = 0u;
        *(_OWORD *)(v250 + 23) = 0u;
      }
      v179 = sub_22912250C((uint64_t)(v250 + 21), &qword_255A2A878);
      goto LABEL_64;
    }
    v104 = v103;
    v105 = sub_2291C3A64();
    if (v105)
    {
      sub_22913B3B0(0x746E656449707061, 0xED00007265696669, v105, v250 + 17);
      OUTLINED_FUNCTION_21();
      if (v250[20])
      {
        v106 = swift_dynamicCast();
        if ((v106 & 1) != 0)
        {
          v107 = (void *)sub_2291C46AC();
          v106 = swift_bridgeObjectRelease();
LABEL_55:
          OUTLINED_FUNCTION_11_15(v106, sel_setAppId_);

          goto LABEL_56;
        }
LABEL_54:
        v107 = 0;
        goto LABEL_55;
      }
    }
    else
    {
      *(_OWORD *)(v250 + 17) = 0u;
      *(_OWORD *)(v250 + 19) = 0u;
    }
    v106 = sub_22912250C((uint64_t)(v250 + 17), &qword_255A2A878);
    goto LABEL_54;
  }
  if (v49 != *MEMORY[0x24BE98E18])
  {
    if (v49 == *MEMORY[0x24BE98E20])
    {
      v130 = (uint64_t *)v250[61];
      v131 = OUTLINED_FUNCTION_16_0(v250[58]);
      v84 = *v130;
      OUTLINED_FUNCTION_6_20(v131, v132, v133, v134, v135, v136, v137, v138, v214, v220, v226, v232, v239);
      v139 = sub_2291C4520();
      sub_2291C4844();
      if (OUTLINED_FUNCTION_21_8(v139))
      {
        v140 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_65(v140);
        OUTLINED_FUNCTION_6_13(&dword_229115000, v139, v141, "LaunchAppFlowStrategy.makeIntentFromParse() Creating intent from Pommes Response parse");
        OUTLINED_FUNCTION_2_0();
      }
      v142 = v250[62];

      OUTLINED_FUNCTION_10_17(v143, v144, v145, v146, v147, v148, v149, v150, v218, v224, v230, v236, v243, (uint64_t (*)(uint64_t, uint64_t))v245);
      v250[15] = sub_2291C434C();
      v250[16] = &off_24F1DC380;
      v250[12] = v84;
      v151 = (void *)v250[35];
      v152 = (id)v84;
      OUTLINED_FUNCTION_19_15(v151);

      OUTLINED_FUNCTION_26_18();
      if (!v142)
        goto LABEL_47;
    }
    else
    {
      if (v49 == *MEMORY[0x24BE98E98])
      {
        v153 = v250 + 2;
        OUTLINED_FUNCTION_16_0(v250[58]);
        v154 = OUTLINED_FUNCTION_7_22();
        OUTLINED_FUNCTION_6_20(v154, v155, v156, v157, v158, v159, v160, v161, v214, v220, v226, v232, v239);
        v162 = sub_2291C4520();
        sub_2291C4844();
        if (OUTLINED_FUNCTION_21_8(v162))
        {
          v163 = (_WORD *)OUTLINED_FUNCTION_11();
          OUTLINED_FUNCTION_65(v163);
          OUTLINED_FUNCTION_6_13(&dword_229115000, v162, v164, "LaunchAppFlowStrategy.makeIntentFromParse(): got .uso parse");
          OUTLINED_FUNCTION_2_0();
        }
        v165 = v250[47];

        OUTLINED_FUNCTION_10_17(v166, v167, v168, v169, v170, v171, v172, v173, v219, v225, v231, v237, v244, (uint64_t (*)(uint64_t, uint64_t))v245);
        v250[5] = v165;
        v250[6] = &off_24F1DC360;
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v153);
        OUTLINED_FUNCTION_28_13((uint64_t)boxed_opaque_existential_1);
        v175 = (id)v250[35];
        sub_2291A7598(v153, v175);
        v84 = v250[48];

        OUTLINED_FUNCTION_26_18();
        OUTLINED_FUNCTION_56_3();
        v209 = v175;
        v210 = (void *)sub_2291C48E0();
        OUTLINED_FUNCTION_32_0(v209, sel_setIsNLv4Parse_);

        v211 = OUTLINED_FUNCTION_132();
        goto LABEL_66;
      }
      if (qword_255A2A008 != -1)
        swift_once();
      v183 = v250[64];
      v184 = v250[62];
      v185 = v250[60];
      v186 = v250[57];
      v187 = v250[38];
      v188 = __swift_project_value_buffer(v184, (uint64_t)qword_255A2FFB0);
      ((void (*)(uint64_t, uint64_t, uint64_t))v5)(v183, v188, v184);
      v48(v185, v187, v186);
      v189 = sub_2291C4520();
      v190 = sub_2291C4850();
      v191 = os_log_type_enabled(v189, v190);
      v192 = v250[60];
      if (v191)
      {
        v193 = v250[59];
        v238 = v250[58];
        v194 = v250[57];
        v195 = (_DWORD *)OUTLINED_FUNCTION_12();
        v251 = OUTLINED_FUNCTION_12();
        *v195 = 136315138;
        v48(v193, v192, v194);
        v196 = sub_22914D99C(v193);
        v250[36] = sub_22913EFA8(v196, v197, &v251);
        sub_2291C4940();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v238 + 8))(v192, v194);
        OUTLINED_FUNCTION_33_11(&dword_229115000, v189, v190, "Unable to process parse: %s");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_0();
      }
      v84 = *(_QWORD *)(v250[58] + 8);
      ((void (*)(_QWORD, _QWORD))v84)(v250[60], v250[57]);

      v198 = OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_15_13(v198, v199, v200, v201, v202, v203, v204, v205, v214, v220, v226, v232, v239, v245);
      v206 = v250[61];
      v207 = v250[57];
      sub_22911F6F0();
      swift_allocError();
      *v208 = 0;
      swift_willThrow();
      ((void (*)(uint64_t, uint64_t))v84)(v206, v207);

    }
LABEL_23:
    OUTLINED_FUNCTION_13_17();
    OUTLINED_FUNCTION_36_9();
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
    return (*(uint64_t (**)(void))(v84 + 8))();
  }
  OUTLINED_FUNCTION_16_0(v250[58]);
  v108 = OUTLINED_FUNCTION_7_22();
  OUTLINED_FUNCTION_6_20(v108, v109, v110, v111, v112, v113, v114, v115, v214, v220, v226, v232, v239);
  v116 = sub_2291C4520();
  sub_2291C4844();
  if (OUTLINED_FUNCTION_21_8(v116))
  {
    v117 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_65(v117);
    OUTLINED_FUNCTION_6_13(&dword_229115000, v116, v118, "LaunchAppFlowStrategy.makeIntentFromParse() Creating intent from Pegasus Result parse");
    OUTLINED_FUNCTION_2_0();
  }
  v119 = v250[62];
  v84 = v250[42];
  v120 = v250[41];

  OUTLINED_FUNCTION_10_17(v121, v122, v123, v124, v125, v126, v127, v128, v217, v223, v229, v235, v242, (uint64_t (*)(uint64_t, uint64_t))v245);
  v250[10] = v120;
  v250[11] = &off_24F1DC370;
  v129 = __swift_allocate_boxed_opaque_existential_1(v250 + 7);
  OUTLINED_FUNCTION_28_13((uint64_t)v129);
  OUTLINED_FUNCTION_19_15((id)v250[35]);
  (*(void (**)(_QWORD, _QWORD))(v250[42] + 8))(v250[43], v250[41]);

  OUTLINED_FUNCTION_26_18();
  if (v119)
    goto LABEL_23;
LABEL_47:
  v249 = (void *)v84;
LABEL_69:
  OUTLINED_FUNCTION_13_17();
  OUTLINED_FUNCTION_36_9();
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
  return (*(uint64_t (**)(void *))(v84 + 8))(v249);
}

void *sub_2291A7598(_QWORD *a1, void *a2)
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
  _QWORD *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _BYTE *v19;

  v4 = v2;
  v7 = sub_2291C4538();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_41_3();
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v9);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  if (v11)
  {
    v12 = v11;
    v13 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v4 + 136), *(_QWORD *)(v4 + 160));
    sub_2291B5CB8(v12, (uint64_t)v13, a2);
    v14 = a2;
    swift_release();
  }
  else
  {
    if (qword_255A2A008 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v7, (uint64_t)qword_255A2FFB0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v15, v7);
    v16 = sub_2291C4520();
    v17 = sub_2291C4850();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_229115000, v16, v17, "LaunchAppFlowStrategy.makeIntentFromUserParse() No tasks found in input", v18, 2u);
      MEMORY[0x22E2C4EC8](v18, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v3, v7);
    sub_22911F6F0();
    swift_allocError();
    *v19 = 0;
    swift_willThrow();
  }
  return a2;
}

void sub_2291A7764(void *a1)
{
  _QWORD *v1;
  uint64_t *v2;
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v35 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A888);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_82();
  v34 = v4;
  v5 = sub_2291C4448();
  v29 = *(_QWORD *)(v5 - 8);
  v30 = v5;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_82();
  v31 = v7;
  v8 = sub_2291C4394();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_41_3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A890);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2291C2CF0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v28 - v18;
  sub_2291C2CE4();
  __swift_project_boxed_opaque_existential_1Tm(v1 + 7, v1[10]);
  sub_2291C38B4();
  if (v20)
  {
    sub_2291C2CCC();
    OUTLINED_FUNCTION_21();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13) == 1)
    {
      sub_22912250C((uint64_t)v12, &qword_255A2A890);
    }
    else
    {
      OUTLINED_FUNCTION_22_13();
      OUTLINED_FUNCTION_25_15(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32));
    }
  }
  v21 = v1[15];
  v28[1] = v1[16];
  v28[0] = __swift_project_boxed_opaque_existential_1Tm(v1 + 12, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F068);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_2291C5A50;
  v23 = v35;
  *(_QWORD *)(v22 + 32) = v35;
  v36 = v22;
  sub_2291C4790();
  *v2 = v36;
  v2[1] = 0;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v29 + 104))(v31, *MEMORY[0x24BEA91E0], v30);
  v24 = sub_2291C443C();
  __swift_storeEnumTagSinglePayload(v34, 1, 1, v24);
  v25 = v23;
  OUTLINED_FUNCTION_132();
  sub_2291C4430();
  v27 = v32;
  v26 = v33;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v32 + 104))(v2, *MEMORY[0x24BEA9040], v33);
  sub_2291C4418();
  (*(void (**)(uint64_t *, uint64_t))(v27 + 8))(v2, v26);
  OUTLINED_FUNCTION_22_13();
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291A7A28()
{
  _QWORD *v0;
  _QWORD *v1;
  char v2;
  uint64_t v3;
  char v4;
  char v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  v1 = v0;
  if ((sub_2291C30F8() & 1) != 0
    && (v7 = &type metadata for Features,
        v8 = sub_2291A53DC(),
        v6[0] = 2,
        v2 = sub_2291C3ADC(),
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6),
        (v2 & 1) != 0)
    && !v1[27]
    && (v3 = v1[5], __swift_project_boxed_opaque_existential_1Tm(v1 + 2, v3), (sub_229192AA4(v3) & 1) != 0))
  {
    __swift_project_boxed_opaque_existential_1Tm(v1 + 2, v1[5]);
    v4 = sub_2291C359C() ^ 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

uint64_t sub_2291A7AF4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 176);

  return v0;
}

uint64_t sub_2291A7B38()
{
  sub_2291A7AF4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LaunchAppFlowStrategy()
{
  return objc_opt_self();
}

void sub_2291A7B78(uint64_t a1)
{
  sub_2291A6100(a1);
}

uint64_t sub_2291A7B98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_229121FF8;
  return sub_2291A64BC(a1, a2);
}

uint64_t sub_2291A7BF8()
{
  type metadata accessor for LaunchAppFlowStrategy();
  return sub_2291C3890();
}

uint64_t sub_2291A7C30()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppFlowStrategy();
  *v1 = v0;
  v1[1] = sub_229122588;
  return sub_2291C323C();
}

uint64_t sub_2291A7CB4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppFlowStrategy();
  *v1 = v0;
  v1[1] = sub_2291221EC;
  return sub_2291C3230();
}

uint64_t sub_2291A7D38()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppFlowStrategy();
  *v1 = v0;
  v1[1] = sub_229122588;
  return sub_2291C3224();
}

uint64_t sub_2291A7DBC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppFlowStrategy();
  *v1 = v0;
  v1[1] = sub_229122588;
  return sub_2291C3218();
}

uint64_t sub_2291A7E50()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppFlowStrategy();
  *v1 = v0;
  v1[1] = sub_229122588;
  return sub_2291C332C();
}

uint64_t sub_2291A7EE4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = sub_22911EB3C(a1, a2);
  return sub_22911EF4C(*(uint64_t (**)(uint64_t))(v2 + 8), v2, v3);
}

uint64_t sub_2291A7F1C(uint64_t a1, uint64_t a2)
{
  return sub_229122548(&qword_255A2F020, a2, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppFlowStrategy, (uint64_t)&unk_2291CC0A8);
}

uint64_t sub_2291A7F48(uint64_t a1, uint64_t a2)
{
  return sub_229122548(qword_255A2F028, a2, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppFlowStrategy, (uint64_t)&unk_2291CC0D8);
}

uint64_t sub_2291A7F74(uint64_t a1, uint64_t a2)
{
  return sub_229122548(qword_255A2F050, a2, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppFlowStrategy, (uint64_t)&unk_2291CC110);
}

void sub_2291A7FA0(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_2291C4760();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setPegasusAppResults_, v3);

}

uint64_t OUTLINED_FUNCTION_6_20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);

  return v15(v14, a13, v13);
}

uint64_t OUTLINED_FUNCTION_7_22()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v2, v0, v3);
}

uint64_t OUTLINED_FUNCTION_10_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t (*a14)(uint64_t, uint64_t))
{
  uint64_t v14;
  uint64_t v15;

  return a14(v14, v15);
}

id OUTLINED_FUNCTION_11_15(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_13_17()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 560);
}

uint64_t OUTLINED_FUNCTION_15_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t (*a14)(void))
{
  return a14();
}

id OUTLINED_FUNCTION_18_15()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 4040));
}

void *OUTLINED_FUNCTION_19_15(void *a1)
{
  _QWORD *v1;

  return sub_2291A7598(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_25_15@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v3, v1, v2);
}

uint64_t OUTLINED_FUNCTION_26_18()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0);
}

uint64_t OUTLINED_FUNCTION_28_13(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_29_16(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_33_11(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_34_6()
{
  return sub_2291C48E0();
}

uint64_t OUTLINED_FUNCTION_36_9()
{
  return swift_task_dealloc();
}

uint64_t sub_2291A80E8(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AD80);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (uint64_t)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_28;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; v7 = sub_2291C4B68())
  {
    v27[1] = v2;
    v28 = v6;
    v30 = a1;
    v31 = a1 & 0xC000000000000001;
    v6 = 4;
    v29 = v7;
    while (1)
    {
      v2 = v6 - 4;
      v8 = v31 ? (id)MEMORY[0x22E2C4694](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v9 = v8;
      if (__OFADD__(v2, 1))
        break;
      v32 = v6 - 3;
      sub_2291929D4(v8);
      if (v11)
        v12 = v10;
      else
        v12 = 0;
      if (v11)
        v13 = v11;
      else
        v13 = 0xE000000000000000;
      sub_22917BC2C(v9);
      if (v15)
        v16 = v14;
      else
        v16 = 0;
      if (v15)
        v17 = v15;
      else
        v17 = 0xE000000000000000;
      v18 = sub_2291967F8(v16, v17);
      sub_2291C4910();
      if (v19)
      {
        v20 = v28;
        sub_2291C46F4();
        swift_bridgeObjectRelease();
        v21 = 0;
      }
      else
      {
        v21 = 1;
        v20 = v28;
      }
      v22 = sub_2291C4250();
      __swift_storeEnumTagSinglePayload(v20, v21, 1, v22);
      type metadata accessor for AppLaunchApplication.Builder(0);
      swift_allocObject();
      sub_22912D04C();
      sub_22912D0AC(v12, v13, 0, 0);
      swift_release();
      swift_bridgeObjectRelease();
      sub_22912D0B8(v16, v17, 0, 0);
      v24 = v23;
      swift_release();
      swift_bridgeObjectRelease();
      v25 = v24 + OBJC_IVAR____TtCC20SiriAppLaunchIntents20AppLaunchApplication7Builder_selectAction;
      swift_beginAccess();
      sub_229148B54(v20, v25);
      swift_endAccess();
      type metadata accessor for AppLaunchApplication(0);
      swift_allocObject();
      sub_22912D224();

      sub_22911F918(v20, &qword_255A2AD80);
      MEMORY[0x22E2C4358]();
      if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2291C479C();
      sub_2291C47B4();
      sub_2291C4790();
      ++v6;
      a1 = v30;
      if (v32 == v29)
      {
        swift_bridgeObjectRelease();
        return v33;
      }
    }
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2291A83F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
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
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  NSObject *v45;
  os_log_type_t v46;
  _WORD *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  unsigned int (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t);
  char v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  _WORD *v72;
  char v73;
  NSObject *v74;
  os_log_type_t v75;
  _WORD *v76;
  uint64_t v77;
  char v78;
  NSObject *v79;
  os_log_type_t v80;
  _WORD *v81;
  NSObject *v82;
  os_log_type_t v83;
  _WORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char *v90;
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
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t, uint64_t);
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;

  v114 = a2;
  v115 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD70);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_82();
  v97 = v3;
  OUTLINED_FUNCTION_8_5();
  v96 = sub_2291C3B24();
  v95 = *(_QWORD *)(v96 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_82();
  v94 = v5;
  OUTLINED_FUNCTION_8_5();
  v98 = sub_2291C3B9C();
  v92 = *(_QWORD *)(v98 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_134();
  v91 = v7;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v8);
  v93 = (uint64_t)&v90 - v9;
  OUTLINED_FUNCTION_8_5();
  v10 = sub_2291C3AAC();
  v11 = *(_QWORD *)(v10 - 8);
  v102 = v10;
  v103 = v11;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_82();
  v99 = v13;
  OUTLINED_FUNCTION_8_5();
  type metadata accessor for AppLaunchIntent();
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_82();
  v106 = v15;
  OUTLINED_FUNCTION_8_5();
  v107 = sub_2291C40D0();
  v105 = *(_QWORD *)(v107 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_82();
  v104 = v17;
  OUTLINED_FUNCTION_8_5();
  v18 = sub_2291C3A7C();
  v116 = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_134();
  v108 = v20;
  OUTLINED_FUNCTION_30_0();
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v90 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v90 - v25;
  v27 = sub_2291C3A70();
  v112 = *(_QWORD *)(v27 - 8);
  v113 = v27;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_82();
  v111 = v29;
  OUTLINED_FUNCTION_8_5();
  v30 = sub_2291C4538();
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_134();
  v101 = v32;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v33);
  v100 = (uint64_t)&v90 - v34;
  OUTLINED_FUNCTION_30_0();
  MEMORY[0x24BDAC7A8](v35);
  v90 = (char *)&v90 - v36;
  OUTLINED_FUNCTION_30_0();
  v38 = MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v90 - v39;
  MEMORY[0x24BDAC7A8](v38);
  v42 = (char *)&v90 - v41;
  if (qword_255A2A048 != -1)
    swift_once();
  v43 = __swift_project_value_buffer(v30, (uint64_t)qword_255A30028);
  v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16);
  v109 = v43;
  v110 = v44;
  OUTLINED_FUNCTION_18_7((uint64_t)v42, v43, v44);
  v45 = sub_2291C4520();
  v46 = sub_2291C4844();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_65(v47);
    OUTLINED_FUNCTION_23_9(&dword_229115000, v45, v46, "CloseAppDisambiguationStrategy.actionForInput() called");
    OUTLINED_FUNCTION_0_16();
  }

  v48 = *(void (**)(char *, uint64_t))(v31 + 8);
  v49 = v30;
  v48(v42, v30);
  OUTLINED_FUNCTION_47_10();
  v50 = v116;
  v51 = *(unsigned int (**)(char *, uint64_t))(v116 + 88);
  if (v51(v26, v18) == *MEMORY[0x24BE98E88])
  {
    OUTLINED_FUNCTION_28_6((uint64_t)v26, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 96));
    (*(void (**)(uint64_t, char *, uint64_t))(v112 + 32))(v111, v26, v113);
    v52 = sub_2291C3A58();
    LOBYTE(v42) = v53;
    if (v52 == 0xD000000000000030 && v53 == 0x80000002291CEAF0)
    {
      swift_bridgeObjectRelease();
LABEL_21:
      OUTLINED_FUNCTION_25_16((uint64_t)v40);
      v74 = sub_2291C4520();
      v75 = sub_2291C4844();
      if (os_log_type_enabled(v74, v75))
      {
        v76 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_65(v76);
        OUTLINED_FUNCTION_23_9(&dword_229115000, v74, v75, "CloseAppDisambiguationStrategy.actionForInput() directInvocation handling");
        OUTLINED_FUNCTION_0_16();
      }

      v48(v40, v49);
      sub_2291C3668();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v112 + 8))(v111, v113);
    }
    v73 = sub_2291C4C94();
    OUTLINED_FUNCTION_21();
    if ((v73 & 1) != 0)
      goto LABEL_21;
    (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v111, v113);
    v50 = v116;
  }
  else
  {
    OUTLINED_FUNCTION_28_6((uint64_t)v26, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
  }
  OUTLINED_FUNCTION_47_10();
  v54 = v51(v24, v18);
  if (v54 == *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_28_6((uint64_t)v24, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 96));
    v56 = v104;
    v55 = v105;
    v57 = OUTLINED_FUNCTION_36_10();
    v58 = v107;
    v59(v57);
    v42 = v106;
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v106, v56, v58);
    sub_22913896C();
    if ((v60 & 1) != 0)
    {
      sub_2291C365C();
      sub_22911F9C8((uint64_t)v42, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v56, v58);
    }
    sub_22911F9C8((uint64_t)v42, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v56, v58);
    goto LABEL_26;
  }
  if (v54 == *MEMORY[0x24BE98E98])
  {
    OUTLINED_FUNCTION_28_6((uint64_t)v24, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 96));
    v62 = v102;
    v63 = v99;
    v64 = OUTLINED_FUNCTION_36_10();
    v65(v64);
    v66 = v94;
    sub_2291C3A94();
    v67 = sub_2291C3B00();
    (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v66, v96);
    v68 = v97;
    sub_22914D85C(v67, v97);
    OUTLINED_FUNCTION_36();
    if (__swift_getEnumTagSinglePayload(v68, 1, v98) == 1)
    {
      sub_22911F918(v68, (uint64_t *)&unk_255A2CD70);
      if (qword_255A2A008 != -1)
        swift_once();
      v69 = __swift_project_value_buffer(v49, (uint64_t)qword_255A2FFB0);
      v110((uint64_t)v90, v69, v49);
      v70 = OUTLINED_FUNCTION_60_5();
      v71 = sub_2291C4850();
      if (OUTLINED_FUNCTION_23_0(v71))
      {
        v72 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_65(v72);
        OUTLINED_FUNCTION_23_9(&dword_229115000, v70, (os_log_type_t)v68, "CloseAppDisambiguationStrategy.actionForInputNLv4Uso() No user dialog act found in userParse");
        OUTLINED_FUNCTION_0_16();
      }

      OUTLINED_FUNCTION_31_13();
      sub_2291C3674();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v103 + 8))(v63, v62);
    }
    v85 = v92;
    v86 = v93;
    OUTLINED_FUNCTION_18_7(v93, v68, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v92 + 32));
    v87 = v85;
    LOBYTE(v85) = sub_2291C3B6C();
    v88 = v91;
    OUTLINED_FUNCTION_18_7(v91, v86, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v87 + 16));
    if ((v85 & 1) != 0)
    {
      OUTLINED_FUNCTION_39_8(v88);
LABEL_38:
      sub_2291C365C();
      OUTLINED_FUNCTION_39_8(v86);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v103 + 8))(v63, v62);
    }
    v89 = sub_2291C3B60();
    v42 = *(char **)(v87 + 8);
    OUTLINED_FUNCTION_39_8(v88);
    if ((v89 & 1) != 0)
    {
      v62 = v102;
      goto LABEL_38;
    }
    OUTLINED_FUNCTION_39_8(v86);
    (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v63, v102);
    v50 = v116;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v50 + 8))(v24, v18);
  }
LABEL_26:
  v77 = v108;
  OUTLINED_FUNCTION_47_10();
  v78 = sub_2291A5864(v77);
  OUTLINED_FUNCTION_28_6(v77, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
  if ((v78 & 1) != 0)
  {
    OUTLINED_FUNCTION_25_16(v100);
    v79 = OUTLINED_FUNCTION_60_5();
    v80 = sub_2291C4844();
    if (OUTLINED_FUNCTION_23_0(v80))
    {
      v81 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v81);
      OUTLINED_FUNCTION_23_9(&dword_229115000, v79, (os_log_type_t)v42, "CloseAppDisambiguationStrategy.actionForInput() handling");
      OUTLINED_FUNCTION_0_16();
    }

    OUTLINED_FUNCTION_31_13();
    return sub_2291C3668();
  }
  else
  {
    OUTLINED_FUNCTION_25_16(v101);
    v82 = OUTLINED_FUNCTION_60_5();
    v83 = sub_2291C4844();
    if (OUTLINED_FUNCTION_23_0(v83))
    {
      v84 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v84);
      OUTLINED_FUNCTION_23_9(&dword_229115000, v82, (os_log_type_t)v42, "CloseAppDisambiguationStrategy.actionForInput() ignoring");
      OUTLINED_FUNCTION_0_16();
    }

    OUTLINED_FUNCTION_31_13();
    return sub_2291C3674();
  }
}

uint64_t sub_2291A8C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_2291C35D8();
  v3[5] = OUTLINED_FUNCTION_1_0();
  v4 = sub_2291C3974();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = OUTLINED_FUNCTION_1_0();
  v5 = sub_2291C37AC();
  v3[9] = v5;
  v3[10] = *(_QWORD *)(v5 - 8);
  v3[11] = OUTLINED_FUNCTION_1_0();
  v6 = sub_2291C4538();
  v3[12] = v6;
  v3[13] = *(_QWORD *)(v6 - 8);
  v3[14] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

#error "2291A8DC8: call analysis failed (funcsize=96)"

uint64_t sub_2291A8E98()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_20_7();
}

uint64_t sub_2291A8EEC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  return OUTLINED_FUNCTION_59(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291A8F5C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 152) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_20_7();
}

uint64_t sub_2291A8FB4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_18();
  OUTLINED_FUNCTION_37_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_2_19(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291A8FFC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_13_18();
  OUTLINED_FUNCTION_37_10();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_2_19(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291A9044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[12] = a3;
  v4[13] = v3;
  v4[10] = a1;
  v4[11] = a2;
  v5 = sub_2291C4538();
  v4[14] = v5;
  v4[15] = *(_QWORD *)(v5 - 8);
  v4[16] = OUTLINED_FUNCTION_1_0();
  v6 = sub_2291C3974();
  v4[17] = v6;
  v4[18] = *(_QWORD *)(v6 - 8);
  v4[19] = OUTLINED_FUNCTION_1_0();
  v4[20] = *(_QWORD *)(type metadata accessor for AppLaunchDataModels.App(0) - 8);
  v4[21] = OUTLINED_FUNCTION_1_0();
  v4[22] = type metadata accessor for AppLaunchDataModels.AppDisambiguationModel(0);
  v4[23] = OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AD80);
  v4[24] = OUTLINED_FUNCTION_1_0();
  v7 = sub_2291C4250();
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 - 8);
  v4[27] = OUTLINED_FUNCTION_20();
  v4[28] = swift_task_alloc();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

void sub_2291A911C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _WORD *v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;

  v1 = *(_QWORD *)(v0 + 96);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_2291C4B68();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v54 = v1 >> 62;
  v56 = v1;
  if (v2)
  {
    if (v2 < 1)
    {
      __break(1u);
      goto LABEL_51;
    }
    v3 = 0;
    v4 = v1 & 0xC000000000000001;
    v5 = *(_QWORD *)(v0 + 96) + 32;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if (v4)
        v7 = (id)MEMORY[0x22E2C4694](v3, *(_QWORD *)(v0 + 96));
      else
        v7 = *(id *)(v5 + 8 * v3);
      v8 = v7;
      sub_2291929D4(v7);
      v10 = v9;
      v12 = v11;

      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = OUTLINED_FUNCTION_16_16(0, v6[2] + 1);
        v14 = v6[2];
        v13 = v6[3];
        if (v14 >= v13 >> 1)
          v6 = OUTLINED_FUNCTION_16_16((_QWORD *)(v13 > 1), v14 + 1);
        v6[2] = v14 + 1;
        v15 = &v6[2 * v14];
        v15[4] = v10;
        v15[5] = v12;
      }
      ++v3;
    }
    while (v2 != v3);
  }
  else
  {
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v16 = v6[2];
  if (v16)
  {
    v17 = *(_QWORD *)(v0 + 208);
    OUTLINED_FUNCTION_40_0();
    v18 = v6 + 5;
    v19 = MEMORY[0x24BEE4AF8];
    do
    {
      v21 = *(_QWORD *)(v0 + 192);
      v20 = *(_QWORD *)(v0 + 200);
      swift_bridgeObjectRetain_n();
      OUTLINED_FUNCTION_40_7();
      __swift_storeEnumTagSinglePayload(v21, 0, 1, v20);
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload(v21, 1, v20) == 1)
      {
        sub_22911F918(*(_QWORD *)(v0 + 192), &qword_255A2AD80);
      }
      else
      {
        v23 = *(_QWORD *)(v0 + 216);
        v22 = *(_QWORD *)(v0 + 224);
        v24 = *(_QWORD *)(v0 + 200);
        v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32);
        v25(v22, *(_QWORD *)(v0 + 192), v24);
        v25(v23, v22, v24);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v19 = OUTLINED_FUNCTION_137_0(0, *(_QWORD *)(v19 + 16) + 1);
        v27 = *(_QWORD *)(v19 + 16);
        v26 = *(_QWORD *)(v19 + 24);
        if (v27 >= v26 >> 1)
          v19 = OUTLINED_FUNCTION_137_0(v26 > 1, v27 + 1);
        v28 = *(_QWORD *)(v0 + 216);
        v29 = *(_QWORD *)(v0 + 200);
        *(_QWORD *)(v19 + 16) = v27 + 1;
        v25(v19+ ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80))+ *(_QWORD *)(v17 + 72) * v27, v28, v29);
      }
      v18 += 2;
      --v16;
    }
    while (v16);
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v19 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v0 + 232) = v19;
  OUTLINED_FUNCTION_21();
  v30 = sub_22919AD48(0x50415F4843494857, 0xE900000000000050);
  if (!v31)
  {
    OUTLINED_FUNCTION_77();
    if (qword_255A2A048 == -1)
    {
LABEL_34:
      v35 = __swift_project_value_buffer(*(_QWORD *)(v0 + 112), (uint64_t)qword_255A30028);
      OUTLINED_FUNCTION_8_8(v35);
      v36 = sub_2291C4520();
      v37 = sub_2291C4850();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_65(v38);
        OUTLINED_FUNCTION_23_9(&dword_229115000, v36, v37, "Unable to get localized system text for snippet");
        OUTLINED_FUNCTION_0_16();
      }
      v39 = *(_QWORD *)(v0 + 120);

      OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8));
      sub_22911F6F0();
      swift_allocError();
      *v40 = 7;
      swift_willThrow();
      OUTLINED_FUNCTION_21_11();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_23();
      swift_task_dealloc();
      (*(void (**)(void))(v0 + 8))();
      return;
    }
LABEL_51:
    swift_once();
    goto LABEL_34;
  }
  v32 = v30;
  v33 = v31;
  if (v54)
  {
    OUTLINED_FUNCTION_40_0();
    v34 = sub_2291C4B68();
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v34 = *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v41 = MEMORY[0x24BEE4AF8];
  if (!v34)
  {
LABEL_48:
    *(_QWORD *)(v0 + 56) = v32;
    *(_QWORD *)(v0 + 64) = v33;
    sub_2291C311C();
    *(_QWORD *)(v0 + 72) = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2BB20);
    sub_2291C311C();
    v51 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v51;
    *v51 = v0;
    v51[1] = sub_2291A96C4;
    sub_229156E80(v19);
    return;
  }
  v57 = MEMORY[0x24BEE4AF8];
  sub_22919F244(0, v34 & ~(v34 >> 63), 0);
  if ((v34 & 0x8000000000000000) == 0)
  {
    v52 = v33;
    v53 = v32;
    v42 = 0;
    v43 = *(_QWORD *)(v0 + 160);
    v41 = v57;
    v55 = *(_QWORD *)(v0 + 96) + 32;
    v44 = v34;
    do
    {
      if ((v56 & 0xC000000000000001) != 0)
        v45 = (id)MEMORY[0x22E2C4694](v42, *(_QWORD *)(v0 + 96));
      else
        v45 = *(id *)(v55 + 8 * v42);
      v46 = v45;
      v47 = *(_QWORD *)(v0 + 168);
      v58 = v45;
      sub_2291A99F4(&v58, v47);

      v49 = *(_QWORD *)(v57 + 16);
      v48 = *(_QWORD *)(v57 + 24);
      if (v49 >= v48 >> 1)
        sub_22919F244(v48 > 1, v49 + 1, 1);
      ++v42;
      v50 = *(_QWORD *)(v0 + 168);
      *(_QWORD *)(v57 + 16) = v49 + 1;
      sub_229148ACC(v50, v57+ ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))+ *(_QWORD *)(v43 + 72) * v49);
    }
    while (v44 != v42);
    v33 = v52;
    v32 = v53;
    goto LABEL_48;
  }
  __break(1u);
}

uint64_t sub_2291A96C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_166();
  *v4 = *v3;
  *(_QWORD *)(v2 + 248) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (!v1)
    *(_QWORD *)(v2 + 256) = v0;
  OUTLINED_FUNCTION_13();
  return swift_task_switch();
}

uint64_t sub_2291A9730()
{
  uint64_t *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  uint64_t v10;

  v1 = (void *)v0[32];
  v2 = v0[13];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[18] + 16))(v0[19], v0[11], v0[17]);
  sub_2291C392C();
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v2 + 96), *(_QWORD *)(v2 + 120));
  v0[5] = type metadata accessor for AppLaunchDataModels(0);
  sub_22911F7AC((unint64_t *)&qword_255A2A868, 255, type metadata accessor for AppLaunchDataModels, (uint64_t)&protocol conformance descriptor for AppLaunchDataModels);
  v0[6] = v3;
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  v4 = OUTLINED_FUNCTION_36_10();
  sub_229148B10(v4, v5);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2291C5A50;
  *(_QWORD *)(v6 + 32) = v1;
  v10 = v6;
  sub_2291C4790();
  v0[33] = v10;
  v7 = v1;
  v8 = (_QWORD *)swift_task_alloc();
  v0[34] = (uint64_t)v8;
  *v8 = v0;
  v8[1] = sub_2291A98AC;
  return sub_2291C3800();
}

uint64_t sub_2291A98AC()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  v1 = v0 + 16;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_36();
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_20_7();
}

uint64_t sub_2291A98F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);

  v1 = *(_QWORD *)(v0 + 184);

  v2 = OUTLINED_FUNCTION_36_10();
  v3(v2);
  sub_22911F9C8(v1, type metadata accessor for AppLaunchDataModels.AppDisambiguationModel);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2291A9994()
{
  uint64_t v0;

  sub_22911F9C8(*(_QWORD *)(v0 + 184), type metadata accessor for AppLaunchDataModels.AppDisambiguationModel);
  OUTLINED_FUNCTION_21_11();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_19(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291A99F4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v22 = a2;
  v3 = sub_2291C30E0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v21 - v8;
  v10 = *a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD20);
  v11 = swift_allocObject();
  v21 = xmmword_2291C5A70;
  *(_OWORD *)(v11 + 16) = xmmword_2291C5A70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2B948);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = v21;
  v23 = 0x696669746E656469;
  v24 = 0xEA00000000007265;
  v13 = MEMORY[0x24BEE0D00];
  sub_2291C4A3C();
  sub_22917BC2C(v10);
  *(_QWORD *)(inited + 96) = v13;
  if (v15)
    v16 = v14;
  else
    v16 = 0;
  if (v15)
    v17 = v15;
  else
    v17 = 0xE000000000000000;
  *(_QWORD *)(inited + 72) = v16;
  *(_QWORD *)(inited + 80) = v17;
  sub_2291C4670();
  v18 = sub_2291C3110();
  v19 = MEMORY[0x24BEAD1E8];
  *(_QWORD *)(v11 + 56) = v18;
  *(_QWORD *)(v11 + 64) = v19;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v11 + 32));
  sub_2291C3104();
  swift_bridgeObjectRelease();
  sub_2291C30EC();
  sub_2291929D4(v10);
  sub_22917BC2C(v10);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  AppLaunchDataModels.App.init(name:bundleId:isOffloaded:actionProperty:)();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

uint64_t sub_2291A9C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AD80);
  v4[6] = OUTLINED_FUNCTION_1_0();
  v5 = sub_2291C4250();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = OUTLINED_FUNCTION_20();
  v4[10] = swift_task_alloc();
  sub_2291C42A4();
  v4[11] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291A9CB8()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (*v26)(unint64_t, unint64_t, uint64_t);
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t (*v35)(uint64_t, uint64_t, char, char, char, char, char, uint64_t);

  v1 = v0[4];
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_40_0();
    result = sub_2291C4B68();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_17:
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = OUTLINED_FUNCTION_40_0();
  if (!v2)
    goto LABEL_17;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  v4 = 0;
  v5 = v1 & 0xC000000000000001;
  v6 = v0[4] + 32;
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    if (v5)
      v8 = (id)MEMORY[0x22E2C4694](v4, v0[4]);
    else
      v8 = *(id *)(v6 + 8 * v4);
    v9 = v8;
    sub_2291929D4(v8);
    v11 = v10;
    v13 = v12;

    if (v13)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = OUTLINED_FUNCTION_16_16(0, v7[2] + 1);
      v15 = v7[2];
      v14 = v7[3];
      if (v15 >= v14 >> 1)
        v7 = OUTLINED_FUNCTION_16_16((_QWORD *)(v14 > 1), v15 + 1);
      v7[2] = v15 + 1;
      v16 = &v7[2 * v15];
      v16[4] = v11;
      v16[5] = v13;
    }
    ++v4;
  }
  while (v2 != v4);
LABEL_18:
  swift_bridgeObjectRelease();
  v17 = v7[2];
  if (v17)
  {
    v18 = v0[8];
    OUTLINED_FUNCTION_40_0();
    v19 = v7 + 5;
    v20 = MEMORY[0x24BEE4AF8];
    do
    {
      v22 = v0[6];
      v21 = v0[7];
      swift_bridgeObjectRetain_n();
      OUTLINED_FUNCTION_36_10();
      OUTLINED_FUNCTION_40_7();
      __swift_storeEnumTagSinglePayload(v22, 0, 1, v21);
      swift_bridgeObjectRelease();
      if (__swift_getEnumTagSinglePayload(v22, 1, v21) == 1)
      {
        sub_22911F918(v0[6], &qword_255A2AD80);
      }
      else
      {
        v24 = v0[9];
        v23 = v0[10];
        v25 = v0[7];
        v26 = *(void (**)(unint64_t, unint64_t, uint64_t))(v18 + 32);
        v26(v23, v0[6], v25);
        v26(v24, v23, v25);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v20 = OUTLINED_FUNCTION_45_7(0, *(_QWORD *)(v20 + 16) + 1);
        v28 = *(_QWORD *)(v20 + 16);
        v27 = *(_QWORD *)(v20 + 24);
        if (v28 >= v27 >> 1)
          v20 = OUTLINED_FUNCTION_45_7(v27 > 1, v28 + 1);
        v29 = v0[9];
        v30 = v0[7];
        *(_QWORD *)(v20 + 16) = v28 + 1;
        v26(v20+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(_QWORD *)(v18 + 72) * v28, v29, v30);
      }
      v19 += 2;
      --v17;
    }
    while (v17);
    OUTLINED_FUNCTION_21();
  }
  else
  {
    v20 = MEMORY[0x24BEE4AF8];
  }
  v0[12] = v20;
  v31 = v0[4];
  OUTLINED_FUNCTION_21();
  v32 = sub_2291A80E8(v31);
  v0[13] = v32;
  type metadata accessor for CloseAppCATPatternsExecutor();
  sub_2291C4298();
  v33 = sub_2291C4214();
  v0[14] = v33;
  v35 = (uint64_t (*)(uint64_t, uint64_t, char, char, char, char, char, uint64_t))((char *)&dword_255A2B600
                                                                                        + dword_255A2B600);
  v34 = (_QWORD *)swift_task_alloc();
  v0[15] = v34;
  *v34 = v0;
  v34[1] = sub_2291A9FE8;
  return v35(v20, v32, 0, 0, 0, 0, 0, v33);
}

uint64_t sub_2291A9FE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 128) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_release();
    OUTLINED_FUNCTION_77();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_15();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    OUTLINED_FUNCTION_77();
    swift_bridgeObjectRelease();
    swift_release();
    OUTLINED_FUNCTION_13();
    return swift_task_switch();
  }
}

uint64_t sub_2291AA0BC()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)(v0 + 40) + 96), *(_QWORD *)(*(_QWORD *)(v0 + 40) + 120));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_2291AA138;
  return sub_2291C3818();
}

uint64_t sub_2291AA138()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 144) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291AA188()
{
  uint64_t v0;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_59(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291AA1DC()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_59(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291AA230()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  sub_22911FA24(v0 + 136);
  swift_release();
  sub_22911F9F0(v0 + 240);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 280);
  return v0;
}

uint64_t sub_2291AA27C()
{
  sub_2291AA230();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CloseAppDisambiguationStrategy()
{
  return objc_opt_self();
}

void sub_2291AA2BC()
{
  type metadata accessor for CloseAppDisambiguationStrategy();
  JUMPOUT(0x22E2C2E7CLL);
}

uint64_t sub_2291AA2FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2291A83F8(a1, a2);
}

uint64_t sub_2291AA310(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v6 = (uint64_t (*)(uint64_t))((char *)&dword_255A2BB18 + dword_255A2BB18);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_229146200;
  return v6(a2);
}

uint64_t sub_2291AA37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_255A2BB00 + dword_255A2BB00);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_22911FA58;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_2291AA40C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22911E62C;
  return sub_2291A8C5C(a1, a2);
}

uint64_t sub_2291AA470()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for CloseAppDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C3290();
}

uint64_t sub_2291AA4F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for CloseAppDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C32A8();
}

uint64_t sub_2291AA578()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for CloseAppDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C329C();
}

uint64_t sub_2291AA5F4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for CloseAppDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C32C0();
}

uint64_t sub_2291AA670()
{
  type metadata accessor for CloseAppDisambiguationStrategy();
  return sub_2291C32B4();
}

uint64_t sub_2291AA6A8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for CloseAppDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C39E0();
}

uint64_t sub_2291AA73C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for CloseAppDisambiguationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C39EC();
}

void sub_2291AA7D8(uint64_t a1, uint64_t a2)
{
  sub_22911F7AC(qword_255A2F198, a2, (uint64_t (*)(uint64_t))type metadata accessor for CloseAppDisambiguationStrategy, (uint64_t)&unk_2291CC240);
}

_UNKNOWN **sub_2291AA804()
{
  return &off_24F1DC008;
}

void sub_2291AA810(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  sub_22911F7AC(&qword_255A2F200, a2, (uint64_t (*)(uint64_t))type metadata accessor for CloseAppDisambiguationStrategy, (uint64_t)&unk_2291CC278);
  *(_QWORD *)(a1 + 8) = v3;
}

uint64_t OUTLINED_FUNCTION_2_19(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_13_18()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[7] + 8))(v0[8], v0[6]);
}

_QWORD *OUTLINED_FUNCTION_16_16(_QWORD *a1, int64_t a2)
{
  uint64_t v2;

  return sub_229129450(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_21_11()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_25_16(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v2 - 144))(a1, *(_QWORD *)(v2 - 152), v1);
}

uint64_t OUTLINED_FUNCTION_29_17(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 16);
}

uint64_t OUTLINED_FUNCTION_31_13()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_36_10()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_37_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_39_8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_40_7()
{
  return sub_2291C4244();
}

uint64_t OUTLINED_FUNCTION_45_7(char a1, int64_t a2)
{
  uint64_t v2;

  return sub_229129494(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_47_10()
{
  return sub_2291C3A10();
}

uint64_t sub_2291AA924(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F2D0);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_18_2();
  v5 = v4 - v3;
  sub_2291AAF0C((uint64_t)&unk_24F1D7FB8, 1, v4 - v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F2C8);
  v7 = __swift_getEnumTagSinglePayload(v5, 1, v6) != 1;
  sub_22912250C(v5, &qword_255A2F2D0);
  return sub_2291AA9E0(a1, v7) & 0x101;
}

uint64_t sub_2291AA9E0(uint64_t a1, int a2)
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
  char *v36;
  uint64_t v37;
  _BOOL4 v38;
  int v39;
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
  void *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  int v64;
  void (*v66)(char *, char *, uint64_t);
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;

  v3 = sub_2291C4538();
  v71 = *(_QWORD *)(v3 - 8);
  v72 = v3;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_82();
  v70 = v5;
  v6 = sub_2291C2D44();
  v78 = *(_QWORD *)(v6 - 8);
  v79 = (char *)v6;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_82();
  v75 = v8;
  v9 = sub_2291C2D50();
  v76 = *(_QWORD *)(v9 - 8);
  v77 = v9;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_82();
  v74 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2038);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_82();
  v81 = (char *)v13;
  v14 = OUTLINED_FUNCTION_9_20();
  v80 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_4_12();
  v69 = v16 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v73 = (char *)&v66 - v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F2D0);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_4_12();
  v23 = v21 - v22;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v66 - v25;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F2C8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_4_12();
  v31 = v29 - v30;
  v33 = MEMORY[0x24BDAC7A8](v32);
  v68 = (char *)&v66 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v66 - v35;
  sub_2291AAF0C((uint64_t)&unk_24F1D7F60, a2, (uint64_t)v26);
  if (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, v27) == 1)
  {
    v37 = v80;
    sub_22912250C((uint64_t)v26, &qword_255A2F2D0);
    sub_2291AAF0C((uint64_t)&unk_24F1D7F88, a2 & 1, v23);
    if (__swift_getEnumTagSinglePayload(v23, 1, v27) == 1)
    {
      sub_22912250C(v23, &qword_255A2F2D0);
      v38 = 0;
      v39 = 0;
    }
    else
    {
      v56 = *(int *)(v27 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v31, v23, v14);
      v57 = *(_QWORD *)(v23 + v56);
      *(_QWORD *)(v31 + v56) = v57;
      sub_22912250C(v31, &qword_255A2F2C8);
      v39 = 0;
      v38 = v57 > 2;
    }
  }
  else
  {
    v40 = *(int *)(v27 + 48);
    v41 = v80;
    v66 = *(void (**)(char *, char *, uint64_t))(v80 + 32);
    v66(v36, v26, v14);
    v67 = *(_QWORD *)&v26[v40];
    *(_QWORD *)&v36[v40] = v67;
    v42 = (uint64_t)v73;
    sub_2291C2CB4();
    v43 = v74;
    sub_2291C2D38();
    v45 = v78;
    v44 = (uint64_t)v79;
    v46 = v75;
    (*(void (**)(uint64_t, _QWORD, char *))(v78 + 104))(v75, *MEMORY[0x24BDCF220], v79);
    v47 = (uint64_t)v81;
    sub_2291C2D2C();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v44);
    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v43, v77);
    if (__swift_getEnumTagSinglePayload(v47, 1, v14) == 1)
    {
      v79 = v36;
      sub_22912250C((uint64_t)v81, &qword_2540B2038);
      if (qword_255A2A048 != -1)
        swift_once();
      v48 = v72;
      v49 = __swift_project_value_buffer(v72, (uint64_t)qword_255A30028);
      v51 = v70;
      v50 = v71;
      OUTLINED_FUNCTION_144_0(v70, v49, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v71 + 16));
      v52 = (void *)sub_2291C4520();
      v53 = sub_2291C4850();
      if (OUTLINED_FUNCTION_23_0(v53))
      {
        *(_WORD *)OUTLINED_FUNCTION_11() = 0;
        OUTLINED_FUNCTION_9_5(&dword_229115000, v54, v55, "SiriRemembersStoreProvider.getValidAggregateEntityUsage: Unable to create date range. We have to try to confirm");
        OUTLINED_FUNCTION_0_16();
      }

      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v48);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v14);
      sub_22912250C((uint64_t)v79, &qword_255A2F2C8);
      v39 = 256;
      v38 = 1;
    }
    else
    {
      v58 = v69;
      v66((char *)v69, v81, v14);
      v59 = *(int *)(v27 + 48);
      v60 = (uint64_t)v68;
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v68, v36, v14);
      *(_QWORD *)(v60 + v59) = v67;
      sub_2291C2C9C();
      v62 = v61;
      OUTLINED_FUNCTION_116_0(v60);
      sub_2291C2C9C();
      v64 = v63 >= v62;
      OUTLINED_FUNCTION_116_0(v58);
      OUTLINED_FUNCTION_116_0(v42);
      sub_22912250C((uint64_t)v36, &qword_255A2F2C8);
      v39 = v64 << 8;
      v38 = 1;
    }
  }
  return v39 | v38;
}

uint64_t sub_2291AAF0C@<X0>(uint64_t a1@<X1>, int a2@<W2>, uint64_t a3@<X8>)
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
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  os_log_type_t v42;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v58 = a2;
  v57 = a1;
  v61 = a3;
  v4 = sub_2291C4538();
  v59 = *(_QWORD *)(v4 - 8);
  v60 = v4;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_12();
  v8 = v6 - v7;
  MEMORY[0x24BDAC7A8](v9);
  v56 = (uint64_t)&v54 - v10;
  v11 = OUTLINED_FUNCTION_9_20();
  v54 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_18_2();
  v15 = v14 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2B238);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_18_2();
  v19 = v18 - v17;
  v20 = sub_2291C4154();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_18_2();
  v24 = v23 - v22;
  v25 = sub_2291C43C4();
  if (!v26)
  {
    if (qword_255A2A048 != -1)
      swift_once();
    v38 = v60;
    v39 = __swift_project_value_buffer(v60, (uint64_t)qword_255A30028);
    v40 = v59;
    OUTLINED_FUNCTION_144_0(v8, v39, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 16));
    v41 = (void *)sub_2291C4520();
    v42 = sub_2291C4844();
    if (OUTLINED_FUNCTION_23_0(v42))
    {
      *(_WORD *)OUTLINED_FUNCTION_11() = 0;
      OUTLINED_FUNCTION_9_5(&dword_229115000, v43, v44, "SiriRemembersStoreProvider.getEventData: Unable to search Siri Remembers for a nil roomName");
      OUTLINED_FUNCTION_0_16();
    }

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v8, v38);
    goto LABEL_13;
  }
  v27 = v25;
  v28 = v26;
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
  v29 = v58;
  sub_229132A94(v27, v28, v57, v19);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v19, 1, v20) == 1)
  {
    sub_22912250C(v19, &qword_255A2B238);
    if (qword_255A2A048 != -1)
      swift_once();
    v30 = v60;
    v31 = __swift_project_value_buffer(v60, (uint64_t)qword_255A30028);
    v32 = v59;
    v33 = v56;
    OUTLINED_FUNCTION_144_0(v56, v31, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v59 + 16));
    v34 = (void *)sub_2291C4520();
    v35 = sub_2291C4844();
    if (OUTLINED_FUNCTION_23_0(v35))
    {
      *(_WORD *)OUTLINED_FUNCTION_11() = 0;
      OUTLINED_FUNCTION_9_5(&dword_229115000, v36, v37, "SiriRemembersStoreProvider.getEventData: Did not find any previous interactions");
      OUTLINED_FUNCTION_0_16();
    }

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v33, v30);
LABEL_13:
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F2C8);
    v46 = v61;
    v47 = 1;
    return __swift_storeEnumTagSinglePayload(v46, v47, 1, v45);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 32))(v24, v19, v20);
  sub_2291C4148();
  if ((v29 & 1) != 0)
    v48 = sub_2291B68AC();
  else
    v48 = sub_2291B6A00();
  v49 = v48;
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v24, v20);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F2C8);
  v51 = *(int *)(v50 + 48);
  v52 = v61;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 32))(v61, v15, v55);
  *(_QWORD *)(v52 + v51) = v49;
  v46 = v52;
  v47 = 0;
  v45 = v50;
  return __swift_storeEnumTagSinglePayload(v46, v47, 1, v45);
}

uint64_t type metadata accessor for HistoricalDeviceInteractionProvider()
{
  return objc_opt_self();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriRemembersResult(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[24])
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *a1;
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

uint64_t storeEnumTagSinglePayload for SiriRemembersResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriRemembersResult()
{
  return &type metadata for SiriRemembersResult;
}

uint64_t OUTLINED_FUNCTION_9_20()
{
  return sub_2291C2CC0();
}

uint64_t sub_2291AB368()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[40];
  _QWORD v29[5];
  _BYTE v30[40];
  _BYTE v31[40];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  OUTLINED_FUNCTION_95_0();
  v33 = v0;
  v34 = v1;
  v26 = v2;
  v4 = v3;
  v27 = v3;
  type metadata accessor for SiriRemembersStoreProvider();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_12();
  v8 = v6 - v7;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = OUTLINED_FUNCTION_9_2();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v15);
  sub_2291C3A88();
  sub_22911F698(v4, (uint64_t)v31);
  type metadata accessor for BaseDialogProvider();
  v16 = OUTLINED_FUNCTION_31();
  sub_2291C440C();
  v17 = (void *)sub_2291C43F4();
  v18 = sub_22913200C((uint64_t)v11);
  OUTLINED_FUNCTION_79_4(v18, (uint64_t)v30);
  v19 = sub_2291C4400();
  sub_2291C37D0();
  OUTLINED_FUNCTION_3();
  v20 = sub_2291C37C4();
  v21 = sub_2291C4370();
  v22 = sub_2291C4364();
  v29[3] = v21;
  v29[4] = &off_24F1D8FF0;
  v29[0] = v22;
  sub_22911F988((uint64_t)v11, v8, (uint64_t (*)(_QWORD))type metadata accessor for SiriRemembersStoreProvider);
  sub_2291358C8((uint64_t)v29, (uint64_t)v28);
  swift_retain();
  v23 = v17;
  swift_retain();
  swift_retain();
  v24 = sub_2291AE424((uint64_t)v14, (uint64_t)&v32, (uint64_t)v31, v16, (uint64_t)v23, v8, (uint64_t)v30, 0, v19, v20, (uint64_t)v28);
  sub_22913A714((uint64_t)v29);
  swift_release();
  swift_release();
  sub_22911F9C8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SiriRemembersStoreProvider);
  swift_release();

  __swift_destroy_boxed_opaque_existential_1Tm(v26);
  __swift_destroy_boxed_opaque_existential_1Tm(v27);
  return v24;
}

void sub_2291AB598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_12();
  v6 = v4 - v5;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - v8;
  if (!*(_BYTE *)(v1 + 592))
  {
    v10 = OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_26_4((uint64_t)v9, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16));
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v10);
    sub_22912F208((uint64_t)v9, v6);
    swift_beginAccess();
    v11 = OUTLINED_FUNCTION_132();
    sub_22912F250(v11, v12);
    swift_endAccess();
    *(_BYTE *)(v1 + 592) = 1;
  }
  OUTLINED_FUNCTION_10_1();
}

uint64_t sub_2291AB68C()
{
  type metadata accessor for LaunchAppWrapperFlow();
  sub_22912C97C((unint64_t *)&qword_255A2E5F8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppWrapperFlow, (uint64_t)&unk_2291CC558);
  return sub_2291C3434();
}

uint64_t sub_2291AB700(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[20] = a1;
  v2[21] = v1;
  v3 = OUTLINED_FUNCTION_66();
  v2[22] = v3;
  v2[23] = *(_QWORD *)(v3 - 8);
  v2[24] = OUTLINED_FUNCTION_25();
  v2[25] = OUTLINED_FUNCTION_25();
  v2[26] = OUTLINED_FUNCTION_25();
  v2[27] = OUTLINED_FUNCTION_25();
  v4 = sub_2291C3A40();
  v2[28] = v4;
  v2[29] = *(_QWORD *)(v4 - 8);
  v2[30] = OUTLINED_FUNCTION_1_0();
  v5 = sub_2291C3AAC();
  v2[31] = v5;
  v2[32] = *(_QWORD *)(v5 - 8);
  v2[33] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_63_3();
  v2[34] = OUTLINED_FUNCTION_1_0();
  v6 = OUTLINED_FUNCTION_87_2();
  v2[35] = v6;
  v2[36] = *(_QWORD *)(v6 - 8);
  v2[37] = OUTLINED_FUNCTION_1_0();
  v7 = OUTLINED_FUNCTION_68_7();
  v2[38] = v7;
  v2[39] = *(_QWORD *)(v7 - 8);
  v2[40] = OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  v2[41] = OUTLINED_FUNCTION_1_0();
  v8 = OUTLINED_FUNCTION_9_2();
  v2[42] = v8;
  v2[43] = *(_QWORD *)(v8 - 8);
  v2[44] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

void sub_2291AB810()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  char v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = v0[41];
  v3 = v0[42];
  v4 = v0[21] + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_input;
  swift_beginAccess();
  sub_22912F144(v4, v2);
  if (__swift_getEnumTagSinglePayload(v2, 1, v3) != 1)
  {
    v11 = v0[21];
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[43] + 32))(v0[44], v0[41], v0[42]);
    __asm { BR              X10 }
  }
  sub_22911F918(v0[41], &qword_255A2AF08);
  if (qword_255A2A048 != -1)
    swift_once();
  OUTLINED_FUNCTION_70_4();
  v5 = *(NSObject **)(v1 + 192);
  v6 = *(_QWORD *)(v1 + 184);
  OUTLINED_FUNCTION_14_17(v7, (uint64_t)qword_255A30028);
  sub_2291C4520();
  v8 = OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_19_16(v8);
  OUTLINED_FUNCTION_85_0();
  if ((v9 & 1) != 0)
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_12();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_229115000, v5, (os_log_type_t)v6, "LaunchAppWrapperFlow.execute Input is nil. Error executing request", v10, 2u);
    OUTLINED_FUNCTION_2_0();
  }
  v12 = v0[23];

  OUTLINED_FUNCTION_52_9(*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
  sub_2291C4B50();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_2291ABEB4()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291ABEE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_37();
  v2 = *(_QWORD *)(v0 + 288);
  v1 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 280);
  sub_22911F9C8(*(_QWORD *)(v0 + 272), (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291ABF60()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291ABF9C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_156(*(_QWORD *)(v0 + 256));
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291ABFFC()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291AC030()
{
  uint64_t v0;

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_156(*(_QWORD *)(v0 + 344));
  OUTLINED_FUNCTION_12_16(*(_QWORD *)(v0 + 312));
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291AC0B8()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291AC0F4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_156(*(_QWORD *)(v0 + 232));
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291AC154()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291AC190()
{
  uint64_t v0;

  OUTLINED_FUNCTION_37();

  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291AC1EC()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291AC220()
{
  uint64_t v0;

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_1_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291AC274(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  OUTLINED_FUNCTION_13();
  return swift_task_switch();
}

uint64_t sub_2291AC294()
{
  uint64_t v0;
  char v1;
  _QWORD *v3;

  sub_2291AC460(*(_QWORD **)(v0 + 32));
  if ((v1 & 1) != 0)
  {
    sub_2291ACBFC();
    return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v3;
    *v3 = v0;
    v3[1] = sub_2291AC308;
    return sub_2291AC528(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  }
}

uint64_t sub_2291AC308()
{
  uint64_t v0;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

BOOL sub_2291AC334()
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
  char *v11;
  char v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_95_0();
  v21 = v1;
  v22 = v2;
  v4 = v3;
  OUTLINED_FUNCTION_63_3();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_12();
  v8 = v6 - v7;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - v10;
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v12 = sub_2291C35A8();
  sub_22911F988(v4, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
  if ((v12 & 1) == 0)
  {
    v14 = OUTLINED_FUNCTION_32_10();
    if ((v14 & 1) != 0)
    {
      OUTLINED_FUNCTION_81_3(v14, v15, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    }
    else
    {
      v16 = OUTLINED_FUNCTION_47_11();
      v17 = v16;
      OUTLINED_FUNCTION_81_3(v16, v18, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
      if ((v17 & 1) == 0)
      {
        v13 = 0;
        goto LABEL_8;
      }
    }
    v13 = sub_22919A85C();
LABEL_8:
    sub_22911F9C8(v8, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    goto LABEL_9;
  }
  v13 = 1;
LABEL_9:
  sub_22911F9C8((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
  return v13;
}

void sub_2291AC460(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  v2 = OUTLINED_FUNCTION_132();
  if (v3(v2))
  {
    sub_229125D7C();
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
    if ((sub_2291C35A8() & 1) != 0)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_2_1();
    }
    else
    {
      if ((OUTLINED_FUNCTION_32_10() & 1) == 0)
        OUTLINED_FUNCTION_47_11();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_36();
    }
  }
  OUTLINED_FUNCTION_10_1();
}

uint64_t sub_2291AC528(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[31] = a2;
  v3[32] = v2;
  v3[30] = a1;
  v4 = OUTLINED_FUNCTION_68_7();
  v3[33] = v4;
  v3[34] = *(_QWORD *)(v4 - 8);
  v3[35] = OUTLINED_FUNCTION_1_0();
  v5 = OUTLINED_FUNCTION_66();
  v3[36] = v5;
  v3[37] = *(_QWORD *)(v5 - 8);
  v3[38] = OUTLINED_FUNCTION_25();
  v3[39] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291AC59C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;

  if (qword_255A2A048 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 296);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_255A30028);
  *(_QWORD *)(v0 + 320) = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 328) = v5;
  v5(v1, v4, v2);
  swift_retain_n();
  v6 = sub_2291C4520();
  v7 = sub_2291C4838();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *(_QWORD *)(v0 + 256);
    v9 = (uint8_t *)OUTLINED_FUNCTION_12();
    v32 = OUTLINED_FUNCTION_12();
    *(_DWORD *)v9 = 136315138;
    v10 = *(void **)(v8 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_executionDevice);
    if (v10)
    {
      v11 = objc_msgSend(v10, sel_description);
      v12 = sub_2291C46B8();
      v14 = v13;

    }
    else
    {
      v14 = 0xE500000000000000;
      v12 = 0x3E6C696E3CLL;
    }
    *(_QWORD *)(v0 + 232) = sub_22913EFA8(v12, v14, &v32);
    sub_2291C4940();
    swift_bridgeObjectRelease();
    swift_release_n();
    OUTLINED_FUNCTION_81(&dword_229115000, v6, v7, "Executing LaunchApp RCHFlow with remoteDevice: %s", v9);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }
  v15 = *(_QWORD *)(v0 + 296);
  swift_release_n();

  v16 = *(void (**)(uint64_t))(v15 + 8);
  v17 = OUTLINED_FUNCTION_132();
  v16(v17);
  *(_QWORD *)(v0 + 336) = v16;
  v18 = *(_QWORD *)(v0 + 256);
  sub_22911F698(v18 + 16, v0 + 16);
  sub_22911F698(v18 + 256, v0 + 56);
  v19 = OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_executionDevice;
  *(_QWORD *)(v0 + 344) = OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_executionDevice;
  v20 = *(void **)(v18 + v19);
  sub_22911F698(v18 + 512, v0 + 96);
  sub_22911F698(v18 + 336, v0 + 136);
  sub_22911F698(v18 + 552, v0 + 176);
  v21 = *(_QWORD *)(v0 + 120);
  v22 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 96, v21);
  v23 = *(_QWORD *)(v21 - 8);
  v24 = OUTLINED_FUNCTION_3_13();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v24, v22, v21);
  v25 = *(_QWORD *)(v0 + 200);
  __swift_mutable_project_boxed_opaque_existential_1(v0 + 176, v25);
  v26 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_3_13();
  (*(void (**)(void))(v26 + 16))();
  v27 = v20;
  *(_QWORD *)(v0 + 352) = sub_2291AF7BC((__int128 *)(v0 + 16), (__int128 *)(v0 + 56), (uint64_t)v20, v24, (__int128 *)(v0 + 136));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 176);
  OUTLINED_FUNCTION_19();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  OUTLINED_FUNCTION_16();
  sub_2291C3A10();
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v28;
  *v28 = v0;
  v28[1] = sub_2291AC8FC;
  OUTLINED_FUNCTION_41();
  return sub_2291A64BC(v29, v30);
}

uint64_t sub_2291AC8FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  *(_QWORD *)(*v2 + 368) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 272);
  if (!v1)
    *(_QWORD *)(v4 + 376) = a1;
  OUTLINED_FUNCTION_156(v5);
  OUTLINED_FUNCTION_13();
  return swift_task_switch();
}

uint64_t sub_2291AC97C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 376);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 256);
  v4 = v3 + 16;
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v3 + 136), *(_QWORD *)(v3 + 160));
  v5 = *(void **)(v3 + v2);
  v6 = v5;
  v7 = OUTLINED_FUNCTION_132();
  sub_2291B36E0(v7, v8, (uint64_t)v1, v4, v5);

  sub_2291C36F8();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2291ACA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  void *v41;

  OUTLINED_FUNCTION_37();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  v25 = *(void **)(v22 + 368);
  v26 = *(NSObject **)(v22 + 304);
  (*(void (**)(NSObject *, _QWORD, _QWORD))(v22 + 328))(v26, *(_QWORD *)(v22 + 320), *(_QWORD *)(v22 + 288));
  v27 = v25;
  v28 = v25;
  v29 = v26;
  sub_2291C4520();
  v30 = OUTLINED_FUNCTION_85();
  if (os_log_type_enabled(v26, v30))
  {
    v31 = *(void **)(v22 + 368);
    v32 = (uint8_t *)OUTLINED_FUNCTION_12();
    v33 = OUTLINED_FUNCTION_12();
    *(_DWORD *)v32 = 136315138;
    a11 = v33;
    *(_QWORD *)(v22 + 216) = v31;
    v34 = v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A8C0);
    v35 = sub_2291C46D0();
    *(_QWORD *)(v22 + 224) = sub_22913EFA8(v35, v36, &a11);
    sub_2291C4940();
    OUTLINED_FUNCTION_36();

    OUTLINED_FUNCTION_81(&dword_229115000, v26, v30, "Failure creating intent for RCH: %s", v32);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }
  v37 = *(void **)(v22 + 368);
  v38 = *(void (**)(uint64_t, uint64_t))(v22 + 336);
  v39 = *(_QWORD *)(v22 + 304);
  v40 = *(_QWORD *)(v22 + 288);

  v38(v39, v40);
  v41 = *(void **)(v22 + 368);
  sub_2291C3704();

  swift_release();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v22 + 8));
}

void sub_2291ACBFC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char *v30;
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
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[40];
  _BYTE v54[40];
  _BYTE v55[40];
  _BYTE v56[40];
  uint64_t v57[5];
  uint64_t v58[5];
  _QWORD v59[6];

  OUTLINED_FUNCTION_95_0();
  v50 = v1;
  v52 = v2;
  v3 = OUTLINED_FUNCTION_9_2();
  v48 = *(_QWORD *)(v3 - 8);
  v49 = (uint64_t *)v3;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_82();
  v51 = v5;
  v6 = OUTLINED_FUNCTION_66();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_5();
  if (qword_255A2A048 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v6, (uint64_t)qword_255A30028);
  OUTLINED_FUNCTION_72_7(v0, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  v9 = sub_2291C4520();
  v10 = sub_2291C4868();
  if (os_log_type_enabled(v9, v10))
  {
    *(_WORD *)OUTLINED_FUNCTION_12() = 0;
    OUTLINED_FUNCTION_23_9(&dword_229115000, v9, v10, "Target device resolution is required, pushing device resolution flow");
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0, v6);
  *(_BYTE *)(v0 + 592) = 2;
  OUTLINED_FUNCTION_74_6();
  sub_22911F698(v0 + 216, (uint64_t)v58);
  OUTLINED_FUNCTION_79_4(v11, (uint64_t)v57);
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v58, v58[3]);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_18_2();
  v15 = v14 - v13;
  (*(void (**)(uint64_t))(v16 + 16))(v14 - v13);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v57[3]);
  MEMORY[0x24BDAC7A8](v17);
  v19 = OUTLINED_FUNCTION_41_7(v18, v47);
  v20(v19);
  v47 = sub_2291AF1BC((uint64_t)v59, v15, *(_QWORD *)v7);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
  v21 = v51;
  (*(void (**)(uint64_t, uint64_t *, uint64_t *))(v48 + 16))(v51, v50, v49);
  OUTLINED_FUNCTION_74_6();
  sub_22911F698(v0 + 96, (uint64_t)v58);
  sub_22911F698(v0 + 56, (uint64_t)v57);
  sub_22911F698(v0 + 176, (uint64_t)v56);
  sub_22911F698(v0 + 216, (uint64_t)v55);
  OUTLINED_FUNCTION_79_4(v22, (uint64_t)v54);
  sub_22911F698(v0 + 512, (uint64_t)v53);
  OUTLINED_FUNCTION_27_10((uint64_t)v58);
  v50 = &v47;
  OUTLINED_FUNCTION_43_7();
  MEMORY[0x24BDAC7A8](v23);
  v25 = OUTLINED_FUNCTION_41_7(v24, v47);
  OUTLINED_FUNCTION_18_7((uint64_t)v25, v26, v27);
  OUTLINED_FUNCTION_27_10((uint64_t)v55);
  v49 = &v47;
  OUTLINED_FUNCTION_43_7();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v47 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_18_7((uint64_t)v30, v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16));
  OUTLINED_FUNCTION_27_10((uint64_t)v54);
  OUTLINED_FUNCTION_43_7();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_10_14();
  OUTLINED_FUNCTION_18_7(v0 + 216, v35, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 16));
  OUTLINED_FUNCTION_27_10((uint64_t)v53);
  OUTLINED_FUNCTION_43_7();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_18_2();
  v39 = v38 - v37;
  OUTLINED_FUNCTION_18_7(v38 - v37, v41, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16));
  v42 = *(_QWORD *)v7;
  v43 = *(_QWORD *)(v0 + 216);
  v44 = swift_retain();
  v45 = sub_2291AF31C(v44, v21, (uint64_t)v59, v42, (uint64_t)v57, (uint64_t)v56, (uint64_t)v30, v43, v39);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v55);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v58);
  v59[0] = v45;
  v46 = OUTLINED_FUNCTION_31();
  *(_QWORD *)(v46 + 16) = sub_2291AF74C;
  *(_QWORD *)(v46 + 24) = v0;
  type metadata accessor for ExecutionDeviceResolutionFlow();
  sub_22912C97C(&qword_255A2E390, (uint64_t (*)(uint64_t))type metadata accessor for ExecutionDeviceResolutionFlow, (uint64_t)&unk_2291CB240);
  swift_retain();
  sub_2291C36D4();
  swift_release();
  OUTLINED_FUNCTION_2_1();
  swift_release();
  OUTLINED_FUNCTION_54_0();
}

void sub_2291AD054()
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
  NSObject *v22;
  os_log_type_t v23;
  _WORD *v24;
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
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  OUTLINED_FUNCTION_95_0();
  v50 = v0;
  v51 = v1;
  v47 = OUTLINED_FUNCTION_63_3();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_4_12();
  v43 = v3 - v4;
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v41 - v6;
  v7 = OUTLINED_FUNCTION_9_2();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_42_8(v9, v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = *(_QWORD *)(OUTLINED_FUNCTION_68_7() - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_18_2();
  v16 = v15 - v14;
  v45 = OUTLINED_FUNCTION_87_2();
  v44 = *(_QWORD *)(v45 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_82();
  v42 = v18;
  v19 = OUTLINED_FUNCTION_66();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3_5();
  if (qword_255A2A048 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v19, (uint64_t)qword_255A30028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v0, v21, v19);
  v22 = sub_2291C4520();
  v23 = sub_2291C4844();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (_WORD *)OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_35_8(v24);
    OUTLINED_FUNCTION_23_9(&dword_229115000, v22, v23, "Device resolution was required but none were found. Dialoging failure and completing the flow.");
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v0, v19);
  v25 = v50;
  v26 = v50 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_input;
  OUTLINED_FUNCTION_49_7();
  sub_22912F144(v26, (uint64_t)v12);
  if (OUTLINED_FUNCTION_84_4((uint64_t)v12))
  {
    sub_22911F918((uint64_t)v12, &qword_255A2AF08);
LABEL_13:
    v36 = 0;
    v37 = 0;
    v38 = 0;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v49, v12, v7);
  sub_22911F918((uint64_t)v12, &qword_255A2AF08);
  sub_2291C3A10();
  OUTLINED_FUNCTION_77_5(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  v27 = v48;
  if (OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v48 + 88)) != *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_80(v16, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_80(v16, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 96));
  v28 = v44;
  v29 = v42;
  v30 = v45;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 32))(v42, v16, v45);
  v31 = (uint64_t)v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v46, v29, v30);
  if (qword_255A2A0A0 != -1)
    swift_once();
  OUTLINED_FUNCTION_71_4((unint64_t *)&qword_255A2CD60, v32, (uint64_t)&unk_2291CBB28);
  v16 = v33;
  OUTLINED_FUNCTION_62_6();
  v34 = v53;
  swift_bridgeObjectRelease();
  v35 = v43;
  sub_22911F988(v31, v43, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
  if (v34)
  {
    sub_22911F9C8(v35, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
  }
  else
  {
    if (qword_255A2A0A8 != -1)
      swift_once();
    sub_2291C3E78();
    v40 = v53;
    sub_22911F9C8(v35, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    if (!v40)
    {
      v36 = 0;
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
  }
  v36 = 1;
LABEL_20:
  if (qword_255A2A0B0 != -1)
    swift_once();
  OUTLINED_FUNCTION_62_6();
  v37 = v52;
  v38 = v53;
  sub_22911F9C8(v31, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
LABEL_14:
  sub_22911F698(v25 + 56, (uint64_t)&v54);
  sub_2291AE2A4(v25 + 416, (uint64_t)&v52);
  v39 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_56_4(v39);
  *(_BYTE *)(v16 + 112) = v36;
  *(_QWORD *)(v16 + 120) = v37;
  *(_QWORD *)(v16 + 128) = v38;
  sub_2291C31DC();
  OUTLINED_FUNCTION_3();
  v52 = OUTLINED_FUNCTION_86_3();
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291AD568(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v10;

  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_22918FFB0;
  return sub_229191144(a1, a3, a4, a5);
}

void sub_2291AD5E8()
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _WORD *v21;
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
  _QWORD v36[12];
  uint64_t v37;

  OUTLINED_FUNCTION_95_0();
  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2BAD8);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_82();
  v32 = v4;
  OUTLINED_FUNCTION_63_3();
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_82();
  v31 = v6;
  v7 = OUTLINED_FUNCTION_9_2();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_42_8(v9, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_10_14();
  v11 = OUTLINED_FUNCTION_68_7();
  v33 = *(_QWORD *)(v11 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_82();
  v35 = v13;
  v30 = *(_QWORD *)(OUTLINED_FUNCTION_87_2() - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_82();
  v29 = v15;
  v16 = OUTLINED_FUNCTION_66();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_3_5();
  if (qword_255A2A048 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v16, (uint64_t)qword_255A30028);
  OUTLINED_FUNCTION_26_4(v0, v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16));
  v19 = sub_2291C4520();
  v20 = sub_2291C4844();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (_WORD *)OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_35_8(v21);
    OUTLINED_FUNCTION_23_9(&dword_229115000, v19, v20, "A failure occured at some point");
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v0, v16);
  v22 = v0 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_input;
  OUTLINED_FUNCTION_49_7();
  sub_22912F144(v22, v1);
  if (OUTLINED_FUNCTION_84_4(v1))
  {
    sub_22911F918(v1, &qword_255A2AF08);
LABEL_13:
    v25 = 0;
    v26 = 0;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v34, v1, v7);
  sub_22911F918(v1, &qword_255A2AF08);
  sub_2291C3A10();
  OUTLINED_FUNCTION_77_5(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  v8 = v33;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v33 + 88))(v35, v11) != *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_52_9(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_52_9(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 96));
  OUTLINED_FUNCTION_72_7(v29, v35, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 32));
  OUTLINED_FUNCTION_72_7(v31, v29, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 16));
  if (qword_255A29FA0 != -1)
    swift_once();
  v8 = _s11ApplicationVMa(0);
  sub_22912C97C((unint64_t *)&qword_255A2CD60, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchIntent, (uint64_t)&unk_2291CBB28);
  OUTLINED_FUNCTION_71_4(&qword_255A2A2C8, v23, (uint64_t)&unk_2291C59EC);
  sub_2291C3E6C();
  if (__swift_getEnumTagSinglePayload(v32, 1, v8) == 1)
  {
    sub_22911F9C8(v31, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    OUTLINED_FUNCTION_20_10();
    sub_22911F918(v32, &qword_255A2BAD8);
    v25 = 0;
    v26 = 0;
  }
  else
  {
    if (qword_255A29FB0 != -1)
      swift_once();
    OUTLINED_FUNCTION_71_4(&qword_255A2A2C0, v24, (uint64_t)&unk_2291C59BC);
    sub_2291C3E78();
    v25 = v36[0];
    v26 = v36[1];
    sub_22911F9C8(v31, (uint64_t (*)(_QWORD))type metadata accessor for AppLaunchIntent);
    OUTLINED_FUNCTION_20_10();
    sub_22911F9C8(v32, _s11ApplicationVMa);
  }
LABEL_14:
  sub_22911F698(v2 + 56, (uint64_t)&v37);
  sub_2291AE2A4(v2 + 416, (uint64_t)v36);
  v27 = OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_56_4(v27);
  *(_QWORD *)(v8 + 112) = v25;
  *(_QWORD *)(v8 + 120) = v26;
  *(_WORD *)(v8 + 128) = 0;
  sub_2291C31DC();
  OUTLINED_FUNCTION_3();
  v36[0] = OUTLINED_FUNCTION_86_3();
  OUTLINED_FUNCTION_61_5();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291ADAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_22918FF38;
  return sub_229190380(a1, a3, a4);
}

void sub_2291ADB6C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  char v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD *v26;
  uint8_t *v27;
  NSObject *v28;
  id v29;

  OUTLINED_FUNCTION_95_0();
  v1 = v0;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_66();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_12();
  v8 = (v6 - v7);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - v10;
  if (v3)
  {
    if (v3 == (void *)1)
    {
      v15 = 5;
    }
    else if (v3 == (void *)2)
    {
      if (qword_255A2A048 != -1)
        swift_once();
      v12 = __swift_project_value_buffer(v4, (uint64_t)qword_255A30028);
      OUTLINED_FUNCTION_18_7((uint64_t)v8, v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
      sub_2291C4520();
      v13 = OUTLINED_FUNCTION_85();
      if (os_log_type_enabled(v8, v13))
      {
        v14 = (uint8_t *)OUTLINED_FUNCTION_12();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_229115000, v8, v13, "Unexpected device resolution result", v14, 2u);
        OUTLINED_FUNCTION_2_0();
      }

      OUTLINED_FUNCTION_80((uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
      v15 = 6;
    }
    else
    {
      v16 = qword_255A2A048;
      v17 = v3;
      if (v16 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v4, (uint64_t)qword_255A30028);
      OUTLINED_FUNCTION_18_7((uint64_t)v11, v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
      v19 = v17;
      v20 = sub_2291C4520();
      v21 = sub_2291C4850();
      if (os_log_type_enabled(v20, v21))
      {
        v28 = v20;
        v22 = (uint8_t *)OUTLINED_FUNCTION_12();
        v26 = (_QWORD *)OUTLINED_FUNCTION_12();
        v27 = v22;
        *(_DWORD *)v22 = 138412290;
        v29 = v19;
        v23 = v19;
        v24 = v28;
        sub_2291C4940();
        *v26 = v3;
        sub_22918D478(v3);
        sub_22918D478(v3);
        OUTLINED_FUNCTION_81(&dword_229115000, v24, v21, "ExecutionDeviceResolutionFlow selected device: %@", v27);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }
      sub_22918D478(v3);
      sub_22918D478(v3);

      OUTLINED_FUNCTION_80((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
      v25 = *(void **)(v1 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_executionDevice);
      *(_QWORD *)(v1 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_executionDevice) = v3;

      v15 = 4;
    }
  }
  else
  {
    v15 = 3;
  }
  *(_BYTE *)(v1 + 592) = v15;
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291ADE3C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 176);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 216);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 296);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 336);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 376);
  sub_22911FA24(v0 + 416);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 512);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 552);
  sub_22911F918(v0 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_input, &qword_255A2AF08);

  return v0;
}

uint64_t sub_2291ADEE0()
{
  sub_2291ADE3C();
  return swift_deallocClassInstance();
}

uint64_t sub_2291ADF04()
{
  return type metadata accessor for LaunchAppWrapperFlow();
}

uint64_t type metadata accessor for LaunchAppWrapperFlow()
{
  uint64_t result;

  result = qword_255A2F308;
  if (!qword_255A2F308)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2291ADF44()
{
  unint64_t v0;

  sub_22912EE48();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t getEnumTagSinglePayload for LaunchAppWrapperFlow.State(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for LaunchAppWrapperFlow.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_2291AE0BC + 4 * byte_2291CC3CC[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2291AE0F0 + 4 * byte_2291CC3C7[v4]))();
}

uint64_t sub_2291AE0F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2291AE0F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2291AE100);
  return result;
}

uint64_t sub_2291AE10C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2291AE114);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2291AE118(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2291AE120(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LaunchAppWrapperFlow.State()
{
  return &type metadata for LaunchAppWrapperFlow.State;
}

unint64_t sub_2291AE140()
{
  unint64_t result;

  result = qword_255A2F4C8[0];
  if (!qword_255A2F4C8[0])
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CC530, &type metadata for LaunchAppWrapperFlow.State);
    atomic_store(result, qword_255A2F4C8);
  }
  return result;
}

uint64_t sub_2291AE17C(uint64_t a1)
{
  char v1;

  sub_2291AB598(a1);
  return v1 & 1;
}

uint64_t sub_2291AE1A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22914D678;
  return sub_2291C344C();
}

uint64_t sub_2291AE208()
{
  return sub_2291AB68C();
}

uint64_t sub_2291AE228(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22918FF38;
  return sub_2291AB700(a1);
}

uint64_t sub_2291AE27C()
{
  type metadata accessor for LaunchAppWrapperFlow();
  return sub_2291C3458();
}

uint64_t sub_2291AE2A4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for DialogResponseUtil(a2, a1);
  return a2;
}

uint64_t sub_2291AE2E0()
{
  OUTLINED_FUNCTION_60_6();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2291AE308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  v5 = OUTLINED_FUNCTION_88_3(v4);
  return sub_2291ADAE8(v5, v6, v2, v3);
}

uint64_t sub_2291AE38C()
{
  OUTLINED_FUNCTION_60_6();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2291AE3B4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_BYTE *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  v6 = OUTLINED_FUNCTION_88_3(v5);
  return sub_2291AD568(v6, v7, v2, v4, v3);
}

uint64_t sub_2291AE424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v16;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  _BYTE v43[24];
  ValueMetadata *v44;
  _UNKNOWN **v45;
  _QWORD v46[3];
  ValueMetadata *v47;
  _UNKNOWN **v48;
  uint64_t v49[3];
  uint64_t v50;
  _UNKNOWN **v51;
  _BYTE v52[24];
  ValueMetadata *v53;
  _UNKNOWN **v54;
  _QWORD v55[6];

  v42 = a8;
  v41 = a7;
  v40 = a5;
  v16 = type metadata accessor for BaseDialogProvider();
  v55[3] = v16;
  v55[4] = &off_24F1DC048;
  v55[0] = a4;
  v53 = &type metadata for AppLaunchFlowFactoryImpl;
  v54 = &off_24F1DCCC0;
  v50 = type metadata accessor for SiriRemembersStoreProvider();
  v51 = &off_24F1D8EB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v49);
  sub_229133E0C(a6, (uint64_t)boxed_opaque_existential_1);
  v47 = &type metadata for ReferenceResolver;
  v48 = &off_24F1D9080;
  v18 = swift_allocObject();
  v46[0] = v18;
  v19 = *(_OWORD *)(a11 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)a11;
  *(_OWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 48) = *(_QWORD *)(a11 + 32);
  v44 = &type metadata for AppLaunchFeatureFlagsImpl;
  v45 = &off_24F1DCFA8;
  type metadata accessor for LaunchAppWrapperFlow();
  v20 = swift_allocObject();
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v55, v16);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (uint64_t *)((char *)&v39 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, (uint64_t)v53);
  MEMORY[0x24BDAC7A8](v25);
  (*(void (**)(void))(v26 + 16))();
  v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v49, v50);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v39 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v30 + 16))(v29);
  v31 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, (uint64_t)v47);
  MEMORY[0x24BDAC7A8](v31);
  v33 = (__int128 *)((char *)&v39 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(__int128 *))(v34 + 16))(v33);
  v35 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v43, (uint64_t)v44);
  MEMORY[0x24BDAC7A8](v35);
  (*(void (**)(void))(v36 + 16))();
  v37 = sub_2291AE758(a1, a2, a3, *v23, v40, (uint64_t)v29, v41, v42, a9, a10, v33, v20);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v55);
  return v37;
}

uint64_t sub_2291AE758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, __int128 *a11, uint64_t a12)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v33[2];
  _QWORD __src[12];
  __int128 v35;
  ValueMetadata *v36;
  _UNKNOWN **v37;
  _QWORD v38[5];
  uint64_t v39[5];
  _BYTE v40[24];
  ValueMetadata *v41;
  _UNKNOWN **v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[6];

  v46[3] = sub_2291C440C();
  v46[4] = MEMORY[0x24BEA9118];
  v46[0] = a5;
  v45[3] = sub_2291C43E8();
  v45[4] = MEMORY[0x24BEA90F8];
  v45[0] = a9;
  v44[3] = sub_2291C37D0();
  v44[4] = MEMORY[0x24BE97F18];
  v44[0] = a10;
  v43[3] = type metadata accessor for BaseDialogProvider();
  v43[4] = &off_24F1DC048;
  v43[0] = a4;
  v41 = &type metadata for AppLaunchFlowFactoryImpl;
  v42 = &off_24F1DCCC0;
  v39[3] = type metadata accessor for SiriRemembersStoreProvider();
  v39[4] = (uint64_t)&off_24F1D8EB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v39);
  sub_229133E0C(a6, (uint64_t)boxed_opaque_existential_1);
  v38[3] = &type metadata for ReferenceResolver;
  v38[4] = &off_24F1D9080;
  v19 = swift_allocObject();
  v38[0] = v19;
  v20 = *a11;
  v21 = a11[1];
  *(_QWORD *)(v19 + 48) = *((_QWORD *)a11 + 4);
  *(_OWORD *)(v19 + 16) = v20;
  *(_OWORD *)(v19 + 32) = v21;
  v36 = &type metadata for AppLaunchFeatureFlagsImpl;
  v37 = &off_24F1DCFA8;
  v22 = a12 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_input;
  v23 = sub_2291C3A28();
  __swift_storeEnumTagSinglePayload(v22, 1, 1, v23);
  *(_QWORD *)(a12 + OBJC_IVAR____TtC20SiriAppLaunchIntents20LaunchAppWrapperFlow_executionDevice) = 0;
  swift_beginAccess();
  v24 = a1;
  sub_22914FF0C(a1, v22);
  swift_endAccess();
  sub_22911F698(a2, a12 + 16);
  v25 = a3;
  sub_22911F698(a3, a12 + 56);
  sub_22911F698((uint64_t)v43, a12 + 96);
  sub_22911F698((uint64_t)v40, a12 + 136);
  sub_22911F698((uint64_t)v46, a12 + 176);
  sub_22911F698((uint64_t)v39, a12 + 216);
  sub_22911F698(a7, a12 + 256);
  *(_BYTE *)(a12 + 592) = a8;
  v26 = type metadata accessor for CoreAnalyticsService();
  v27 = swift_allocObject();
  *(_QWORD *)(a12 + 320) = v26;
  *(_QWORD *)(a12 + 328) = &off_24F1D8940;
  *(_QWORD *)(a12 + 296) = v27;
  sub_22911F698((uint64_t)v45, a12 + 336);
  sub_22911F698((uint64_t)v44, a12 + 376);
  sub_22911F698((uint64_t)v38, a12 + 512);
  sub_22911F698(a12 + 16, (uint64_t)__src);
  sub_22911F698(a12 + 376, (uint64_t)&__src[5]);
  v28 = (void *)sub_2291C46AC();
  LODWORD(v22) = MGGetSInt32Answer();

  LOBYTE(__src[11]) = (_DWORD)v22 == 1;
  sub_22911F698((uint64_t)__src, (uint64_t)v33);
  type metadata accessor for LocUtil();
  v29 = swift_allocObject();
  sub_22911F6D8(v33, v29 + 16);
  __src[10] = v29;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1Tm(a7);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1Tm(v25);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  sub_22911F918(v24, &qword_255A2AF08);
  memcpy((void *)(a12 + 416), __src, 0x59uLL);
  sub_22911F6D8(&v35, a12 + 552);
  return a12;
}

_QWORD *sub_2291AEAD4(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v25;
  ValueMetadata *v26;
  _UNKNOWN **v27;
  __int128 v28;
  uint64_t v29;
  _UNKNOWN **v30;
  __int128 v31;
  uint64_t v32;
  _UNKNOWN **v33;
  __int128 v34;
  uint64_t v35;
  _UNKNOWN **v36;

  a11[5] = type metadata accessor for LaunchAppDeviceResolutionStrategy();
  a11[6] = &off_24F1DC098;
  a11[2] = a1;
  v35 = type metadata accessor for BaseDialogProvider();
  v36 = &off_24F1DC048;
  *(_QWORD *)&v34 = a4;
  v32 = type metadata accessor for SiriRemembersStoreProvider();
  v33 = &off_24F1D8EB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v31);
  sub_229133E0C(a7, (uint64_t)boxed_opaque_existential_1);
  v29 = type metadata accessor for CoreAnalyticsService();
  v30 = &off_24F1D8940;
  *(_QWORD *)&v28 = a9;
  v26 = &type metadata for ReferenceResolver;
  v27 = &off_24F1D9080;
  v19 = swift_allocObject();
  *(_QWORD *)&v25 = v19;
  v20 = *(_OWORD *)(a10 + 16);
  *(_OWORD *)(v19 + 16) = *(_OWORD *)a10;
  *(_OWORD *)(v19 + 32) = v20;
  *(_QWORD *)(v19 + 48) = *(_QWORD *)(a10 + 32);
  v21 = (uint64_t)a11 + OBJC_IVAR____TtC20SiriAppLaunchIntents29ExecutionDeviceResolutionFlow_input;
  v22 = sub_2291C3A28();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  swift_beginAccess();
  sub_22912F250(a2, v21);
  swift_endAccess();
  sub_22911F6D8(a3, (uint64_t)(a11 + 7));
  sub_22911F6D8(&v34, (uint64_t)(a11 + 12));
  sub_22911F6D8(a5, (uint64_t)(a11 + 17));
  sub_22911F6D8(a6, (uint64_t)(a11 + 22));
  sub_22911F6D8(&v31, (uint64_t)(a11 + 27));
  *(_QWORD *)((char *)a11 + OBJC_IVAR____TtC20SiriAppLaunchIntents29ExecutionDeviceResolutionFlow_state) = a8;
  sub_22911F6D8(&v28, (uint64_t)(a11 + 32));
  sub_22911F6D8(&v25, (uint64_t)(a11 + 37));
  return a11;
}

_QWORD *sub_2291AECA8(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, __int128 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v18;
  __int128 v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  __int128 *v43;
  uint64_t v44;
  _QWORD v45[3];
  ValueMetadata *v46;
  _UNKNOWN **v47;
  _QWORD v48[3];
  uint64_t v49;
  _UNKNOWN **v50;
  uint64_t v51[3];
  uint64_t v52;
  _UNKNOWN **v53;
  _QWORD v54[3];
  uint64_t v55;
  _UNKNOWN **v56;
  _QWORD v57[6];

  v44 = a8;
  v43 = a6;
  v16 = type metadata accessor for LaunchAppDeviceResolutionStrategy();
  v57[3] = v16;
  v57[4] = &off_24F1DC098;
  v57[0] = a1;
  v55 = type metadata accessor for BaseDialogProvider();
  v56 = &off_24F1DC048;
  v54[0] = a4;
  v52 = type metadata accessor for SiriRemembersStoreProvider();
  v53 = &off_24F1D8EB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v51);
  sub_229133E0C(a7, (uint64_t)boxed_opaque_existential_1);
  v49 = type metadata accessor for CoreAnalyticsService();
  v50 = &off_24F1D8940;
  v48[0] = a9;
  v46 = &type metadata for ReferenceResolver;
  v47 = &off_24F1D9080;
  v18 = swift_allocObject();
  v45[0] = v18;
  v19 = *(_OWORD *)(a10 + 16);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)a10;
  *(_OWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 48) = *(_QWORD *)(a10 + 32);
  type metadata accessor for ExecutionDeviceResolutionFlow();
  v20 = (_QWORD *)swift_allocObject();
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v16);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (uint64_t *)((char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v54, v55);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (uint64_t *)((char *)&v43 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v28 + 16))(v27);
  v29 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v51, v52);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (char *)&v43 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v32 + 16))(v31);
  v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v48, v49);
  MEMORY[0x24BDAC7A8](v33);
  v35 = (uint64_t *)((char *)&v43 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v36 + 16))(v35);
  v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v45, (uint64_t)v46);
  MEMORY[0x24BDAC7A8](v37);
  v39 = (char *)&v43 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v40 + 16))(v39);
  v41 = sub_2291AEAD4(*v23, a2, a3, *v27, a5, v43, (uint64_t)v31, v44, *v35, (uint64_t)v39, v20);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v51);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
  return v41;
}

uint64_t sub_2291AEFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v22[3];
  uint64_t v23;
  _UNKNOWN **v24;
  _BYTE v25[24];
  uint64_t v26;
  _QWORD v27[5];
  uint64_t v28[5];

  v8 = type metadata accessor for SiriRemembersStoreProvider();
  v28[3] = v8;
  v28[4] = (uint64_t)&off_24F1D8EB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v28);
  sub_229133E0C(a2, (uint64_t)boxed_opaque_existential_1);
  v27[3] = type metadata accessor for CoreAnalyticsService();
  v27[4] = &off_24F1D8940;
  v27[0] = a3;
  sub_22911F698(a1, a4 + 16);
  sub_22911F698((uint64_t)v28, a4 + 56);
  sub_22911F698((uint64_t)v27, a4 + 96);
  sub_22911F698((uint64_t)v28, (uint64_t)v25);
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v12);
  v23 = v8;
  v24 = &off_24F1D8EB0;
  v14 = __swift_allocate_boxed_opaque_existential_1(v22);
  sub_229133E0C((uint64_t)v12, (uint64_t)v14);
  type metadata accessor for HistoricalDeviceInteractionProvider();
  v15 = (uint64_t *)swift_allocObject();
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v19 + 16))(v18);
  v15[5] = v8;
  v15[6] = (uint64_t)&off_24F1D8EB0;
  v20 = __swift_allocate_boxed_opaque_existential_1(v15 + 2);
  sub_229133E0C((uint64_t)v18, (uint64_t)v20);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  *(_QWORD *)(a4 + 136) = v15;
  return a4;
}

uint64_t sub_2291AF1BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  uint64_t v20[3];
  uint64_t v21;
  _UNKNOWN **v22;

  v21 = type metadata accessor for SiriRemembersStoreProvider();
  v22 = &off_24F1D8EB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  sub_229133E0C(a2, (uint64_t)boxed_opaque_existential_1);
  v7 = type metadata accessor for CoreAnalyticsService();
  v19[3] = v7;
  v19[4] = &off_24F1D8940;
  v19[0] = a3;
  type metadata accessor for LaunchAppDeviceResolutionStrategy();
  v8 = swift_allocObject();
  v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v7);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (_QWORD *)((char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  v17 = sub_2291AEFE8(a1, (uint64_t)v11, *v15, v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  return v17;
}

_QWORD *sub_2291AF31C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52[5];
  uint64_t v53[5];
  uint64_t v54[5];
  __int128 v55[2];
  __int128 v56[2];
  uint64_t v57[5];
  __int128 v58[2];
  uint64_t v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  uint64_t v62[5];
  _QWORD v63[5];
  _QWORD v64[6];

  v47 = a6;
  v48 = a5;
  v49 = a3;
  v50 = a2;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AF08);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64[3] = type metadata accessor for LaunchAppDeviceResolutionStrategy();
  v64[4] = &off_24F1DC098;
  v64[0] = a1;
  v63[3] = type metadata accessor for BaseDialogProvider();
  v63[4] = &off_24F1DC048;
  v63[0] = a4;
  v62[3] = type metadata accessor for SiriRemembersStoreProvider();
  v62[4] = (uint64_t)&off_24F1D8EB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v62);
  sub_229133E0C(a7, (uint64_t)boxed_opaque_existential_1);
  v61[3] = type metadata accessor for CoreAnalyticsService();
  v61[4] = &off_24F1D8940;
  v61[0] = a8;
  v60[3] = &type metadata for ReferenceResolver;
  v60[4] = &off_24F1D9080;
  v20 = swift_allocObject();
  v60[0] = v20;
  v21 = *(_OWORD *)(a9 + 16);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a9;
  *(_OWORD *)(v20 + 32) = v21;
  *(_QWORD *)(v20 + 48) = *(_QWORD *)(a9 + 32);
  sub_22911F698((uint64_t)v64, (uint64_t)v59);
  v22 = sub_2291C3A28();
  v51 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v18, a2, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v22);
  sub_22911F698(a3, (uint64_t)v58);
  sub_22911F698((uint64_t)v63, (uint64_t)v57);
  sub_22911F698(a5, (uint64_t)v56);
  v23 = v47;
  sub_22911F698(v47, (uint64_t)v55);
  sub_22911F698((uint64_t)v62, (uint64_t)v54);
  sub_22911F698((uint64_t)v61, (uint64_t)v53);
  sub_22911F698((uint64_t)v60, (uint64_t)v52);
  v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v59, v59[3]);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (uint64_t *)((char *)&v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v27 + 16))(v26);
  v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v57[3]);
  MEMORY[0x24BDAC7A8](v28);
  v30 = (uint64_t *)((char *)&v46 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v31 + 16))(v30);
  v32 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v54, v54[3]);
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v46 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v35 + 16))(v34);
  v36 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v53, v53[3]);
  MEMORY[0x24BDAC7A8](v36);
  v38 = (uint64_t *)((char *)&v46 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v39 + 16))(v38);
  v40 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v52, v52[3]);
  MEMORY[0x24BDAC7A8](v40);
  v42 = (char *)&v46 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v43 + 16))(v42);
  v44 = sub_2291AECA8(*v26, (uint64_t)v18, v58, *v30, v56, v55, (uint64_t)v34, 0x8000000000000000, *v38, (uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v53);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v59);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v60);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v61);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v62);
  __swift_destroy_boxed_opaque_existential_1Tm(v23);
  __swift_destroy_boxed_opaque_existential_1Tm(v48);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
  __swift_destroy_boxed_opaque_existential_1Tm(v49);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v64);
  return v44;
}

uint64_t sub_2291AF750()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2291AF774(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_2291AF798()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

_QWORD *sub_2291AF7BC(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v9;
  __int128 v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  uint64_t v22;
  __int128 *v23;
  _BYTE v24[24];
  ValueMetadata *v25;
  _UNKNOWN **v26;
  _QWORD v27[5];

  v23 = a5;
  v27[3] = &type metadata for ReferenceResolver;
  v27[4] = &off_24F1D9080;
  v9 = swift_allocObject();
  v27[0] = v9;
  v10 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a4;
  *(_OWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(a4 + 32);
  v25 = &type metadata for AppLaunchFeatureFlagsImpl;
  v26 = &off_24F1DCFA8;
  type metadata accessor for LaunchAppFlowStrategy();
  v11 = (_QWORD *)swift_allocObject();
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, (uint64_t)&type metadata for ReferenceResolver);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v14);
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, (uint64_t)&type metadata for AppLaunchFeatureFlagsImpl);
  MEMORY[0x24BDAC7A8](v16);
  (*(void (**)(void))(v17 + 16))();
  v11[20] = &type metadata for ReferenceResolver;
  v11[21] = &off_24F1D9080;
  v18 = swift_allocObject();
  v11[17] = v18;
  v19 = *((_OWORD *)v14 + 1);
  *(_OWORD *)(v18 + 16) = *(_OWORD *)v14;
  *(_OWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 48) = *((_QWORD *)v14 + 4);
  v11[25] = &type metadata for AppLaunchFeatureFlagsImpl;
  v11[26] = &off_24F1DCFA8;
  v11[27] = 0;
  sub_22911F6D8(a1, (uint64_t)(v11 + 2));
  v20 = (void *)v11[27];
  v11[27] = a3;

  sub_22911F6D8(a2, (uint64_t)(v11 + 7));
  sub_22911F6D8(v23, (uint64_t)(v11 + 12));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  return v11;
}

uint64_t OUTLINED_FUNCTION_1_18()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[43] + 8))(v0[44], v0[42]);
}

uint64_t OUTLINED_FUNCTION_12_16@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_14_17(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

BOOL OUTLINED_FUNCTION_19_16(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_32_10()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 40);
  __swift_project_boxed_opaque_existential_1Tm(v1, v2);
  return sub_229192B54(v2);
}

_WORD *OUTLINED_FUNCTION_35_8(_WORD *result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 336) = v1;
  *result = 0;
  return result;
}

char *OUTLINED_FUNCTION_41_7@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_42_8(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 272) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_46_5(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 160);
}

uint64_t OUTLINED_FUNCTION_47_11()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1Tm(v1, *(_QWORD *)(v0 + 40));
  return sub_2291C3584();
}

uint64_t OUTLINED_FUNCTION_49_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_52_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void *OUTLINED_FUNCTION_56_4(uint64_t a1)
{
  uint64_t v1;

  return memcpy((void *)(a1 + 16), (const void *)(v1 - 248), 0x59uLL);
}

uint64_t OUTLINED_FUNCTION_60_6()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_61_5()
{
  return sub_2291C36EC();
}

uint64_t OUTLINED_FUNCTION_62_6()
{
  return sub_2291C3E78();
}

uint64_t OUTLINED_FUNCTION_68_7()
{
  return sub_2291C3A7C();
}

void OUTLINED_FUNCTION_71_4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_22912C97C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_72_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_73_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 96))(v1);
}

void OUTLINED_FUNCTION_74_6()
{
  uint64_t v0;
  uint64_t v1;

  sub_22911F698(v0, v1 - 128);
}

uint64_t OUTLINED_FUNCTION_77_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_79_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_22911F698(v2, a2);
}

void OUTLINED_FUNCTION_81_3(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;

  sub_22911F988(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_84_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_86_3()
{
  return sub_2291C31D0();
}

uint64_t OUTLINED_FUNCTION_87_2()
{
  return sub_2291C40D0();
}

uint64_t OUTLINED_FUNCTION_88_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_2291AFBE4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2[10] = a1;
  v2[11] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2C5A8);
  v2[12] = OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD70);
  v2[13] = OUTLINED_FUNCTION_1_0();
  v3 = sub_2291C3B9C();
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = OUTLINED_FUNCTION_20();
  v2[17] = OUTLINED_FUNCTION_25();
  v4 = sub_2291C3B24();
  v2[18] = v4;
  v2[19] = *(_QWORD *)(v4 - 8);
  v2[20] = OUTLINED_FUNCTION_20();
  v2[21] = OUTLINED_FUNCTION_25();
  v2[22] = OUTLINED_FUNCTION_25();
  v5 = sub_2291C4538();
  v2[23] = v5;
  v2[24] = *(_QWORD *)(v5 - 8);
  v2[25] = OUTLINED_FUNCTION_20();
  v2[26] = OUTLINED_FUNCTION_25();
  v2[27] = OUTLINED_FUNCTION_25();
  v2[28] = OUTLINED_FUNCTION_25();
  v6 = sub_2291C3AAC();
  v2[29] = v6;
  v2[30] = *(_QWORD *)(v6 - 8);
  v2[31] = OUTLINED_FUNCTION_20();
  v2[32] = OUTLINED_FUNCTION_25();
  v2[33] = OUTLINED_FUNCTION_25();
  v7 = sub_2291C3A70();
  v2[34] = v7;
  v2[35] = *(_QWORD *)(v7 - 8);
  v2[36] = OUTLINED_FUNCTION_1_0();
  v2[37] = type metadata accessor for AppLaunchIntent();
  v2[38] = OUTLINED_FUNCTION_1_0();
  v8 = sub_2291C40D0();
  v2[39] = v8;
  v2[40] = *(_QWORD *)(v8 - 8);
  v2[41] = OUTLINED_FUNCTION_1_0();
  v9 = sub_2291C3A7C();
  v2[42] = v9;
  v2[43] = *(_QWORD *)(v9 - 8);
  v2[44] = OUTLINED_FUNCTION_20();
  v2[45] = OUTLINED_FUNCTION_25();
  v2[46] = OUTLINED_FUNCTION_25();
  v2[47] = OUTLINED_FUNCTION_25();
  v10 = sub_2291C386C();
  v2[48] = v10;
  v2[49] = *(_QWORD *)(v10 - 8);
  v2[50] = OUTLINED_FUNCTION_20();
  v2[51] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291AFD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
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
  void (*v21)(uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  unsigned int *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  void (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  _BOOL4 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _DWORD *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  void *v76;
  os_log_type_t v77;
  _WORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  unsigned int *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t (*v92)(void);
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  char v98;
  uint64_t v99;
  void *v100;
  os_log_type_t v101;
  _WORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _BYTE *v112;
  os_log_type_t v113;
  uint64_t v114;
  os_log_type_t v115;
  void (*v116)(uint64_t, uint64_t, uint64_t);
  void (*v117)(uint64_t);
  uint64_t v118;
  void (*v119)(uint64_t, uint64_t);
  uint64_t v120[2];

  sub_2291C3A10();
  v1 = OUTLINED_FUNCTION_132();
  v3 = v2(v1);
  if ((_DWORD)v3 == *MEMORY[0x24BE98E08])
  {
    v4 = *(_QWORD *)(v0 + 368);
    v5 = *(_QWORD *)(v0 + 344);
    v7 = *(_QWORD *)(v0 + 320);
    v6 = *(_QWORD *)(v0 + 328);
    v8 = *(_QWORD *)(v0 + 304);
    OUTLINED_FUNCTION_18_7(v4, *(_QWORD *)(v0 + 376), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 96));
    OUTLINED_FUNCTION_5_8(v6, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
    OUTLINED_FUNCTION_5_8(v8, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
    if (qword_255A29FE8 != -1)
      swift_once();
    sub_22912C97C((unint64_t *)&qword_255A2CD60, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchIntent, (uint64_t)&unk_2291CBB28);
    sub_2291C3E78();
    __asm { BR              X10 }
  }
  if ((_DWORD)v3 != *MEMORY[0x24BE98E88])
  {
    if ((_DWORD)v3 != *MEMORY[0x24BE98E98])
    {
LABEL_28:
      if (qword_255A2A048 != -1)
        v3 = swift_once();
      OUTLINED_FUNCTION_4_0(v3, (uint64_t)qword_255A30028);
      v76 = (void *)sub_2291C4520();
      v77 = sub_2291C4850();
      if (OUTLINED_FUNCTION_17(v77))
      {
        v78 = (_WORD *)OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_65(v78);
        OUTLINED_FUNCTION_10(&dword_229115000, v79, v80, "Unsupported parse type");
        OUTLINED_FUNCTION_2_0();
      }
      v81 = *(_QWORD *)(v0 + 192);

      OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v81 + 8));
      sub_22911F6F0();
      v82 = OUTLINED_FUNCTION_94();
      OUTLINED_FUNCTION_13_19(v82, v83);
      goto LABEL_37;
    }
    v12 = *(_QWORD *)(v0 + 344);
    v13 = *(_QWORD *)(v0 + 240);
    OUTLINED_FUNCTION_9_13(*(_QWORD *)(v0 + 376), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
    OUTLINED_FUNCTION_60(*(uint64_t (**)(uint64_t, uint64_t))(v12 + 96));
    OUTLINED_FUNCTION_41_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
    if (qword_255A2A048 != -1)
      swift_once();
    v14 = *(_QWORD *)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 264);
    v17 = *(_QWORD *)(v0 + 232);
    v16 = *(_QWORD *)(v0 + 240);
    v18 = *(_QWORD *)(v0 + 224);
    v19 = *(_QWORD *)(v0 + 192);
    v20 = __swift_project_value_buffer(*(_QWORD *)(v0 + 184), (uint64_t)qword_255A30028);
    v21 = *(void (**)(uint64_t))(v19 + 16);
    v118 = v20;
    v21(v18);
    v116 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
    v116(v14, v15, v17);
    v22 = sub_2291C4520();
    v23 = sub_2291C4844();
    v24 = os_log_type_enabled(v22, v23);
    v25 = *(_QWORD *)(v0 + 192);
    if (v24)
    {
      v27 = *(_QWORD *)(v0 + 168);
      v26 = *(_QWORD *)(v0 + 176);
      v113 = v23;
      v29 = *(_QWORD *)(v0 + 144);
      v28 = *(_QWORD *)(v0 + 152);
      v30 = (_DWORD *)OUTLINED_FUNCTION_12();
      v120[0] = OUTLINED_FUNCTION_12();
      *v30 = 136315138;
      sub_2291C3A94();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v27, v26, v29);
      v31 = sub_22914E4B4(v27);
      v33 = v32;
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v29);
      *(_QWORD *)(v0 + 72) = sub_22913EFA8(v31, v33, v120);
      sub_2291C4940();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_55_7();
      OUTLINED_FUNCTION_59_4(&dword_229115000, v22, v113, "DeviceConfirmationStrategy.parseDisambiguationResult using follow up USO parse:  %s");
      OUTLINED_FUNCTION_26_6();
      OUTLINED_FUNCTION_2_0();
    }
    v47 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 240) + 8);
    OUTLINED_FUNCTION_55_7();

    v48 = *(void (**)(uint64_t))(v25 + 8);
    v49 = OUTLINED_FUNCTION_132();
    v48(v49);
    v51 = *(_QWORD *)(v0 + 152);
    v50 = *(_QWORD *)(v0 + 160);
    v53 = *(_QWORD *)(v0 + 104);
    v52 = *(_QWORD *)(v0 + 112);
    sub_2291C3A94();
    v54 = sub_2291C3B00();
    v55 = *(void (**)(uint64_t))(v51 + 8);
    v56 = OUTLINED_FUNCTION_132();
    v55(v56);
    sub_22914D85C(v54, v53);
    OUTLINED_FUNCTION_21();
    if (__swift_getEnumTagSinglePayload(v53, 1, v52) == 1)
    {
      v57 = *(_QWORD *)(v0 + 264);
      v58 = *(_QWORD *)(v0 + 248);
      v59 = *(_QWORD *)(v0 + 232);
      v60 = *(_QWORD *)(v0 + 208);
      v61 = *(_QWORD *)(v0 + 184);
      sub_2291B22AC(*(_QWORD *)(v0 + 104), (uint64_t *)&unk_255A2CD70);
      ((void (*)(uint64_t, uint64_t, uint64_t))v21)(v60, v118, v61);
      v116(v58, v57, v59);
      v62 = sub_2291C4520();
      v63 = sub_2291C4844();
      v64 = os_log_type_enabled(v62, v63);
      v65 = *(_QWORD *)(v0 + 248);
      v66 = *(_QWORD *)(v0 + 208);
      v67 = *(_QWORD *)(v0 + 184);
      if (v64)
      {
        v119 = v47;
        v68 = *(_QWORD *)(v0 + 168);
        v69 = *(_QWORD *)(v0 + 176);
        v115 = v63;
        v71 = *(_QWORD *)(v0 + 144);
        v70 = *(_QWORD *)(v0 + 152);
        v114 = *(_QWORD *)(v0 + 232);
        v72 = (_DWORD *)OUTLINED_FUNCTION_12();
        v120[0] = OUTLINED_FUNCTION_12();
        *v72 = 136315138;
        sub_2291C3A94();
        OUTLINED_FUNCTION_5_8(v68, v69, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 16));
        v73 = sub_22914E4B4(v68);
        v75 = v74;
        ((void (*)(uint64_t, uint64_t))v55)(v69, v71);
        *(_QWORD *)(v0 + 64) = sub_22913EFA8(v73, v75, v120);
        sub_2291C4940();
        OUTLINED_FUNCTION_36();
        v119(v65, v114);
        OUTLINED_FUNCTION_59_4(&dword_229115000, v62, v115, "DeviceConfirmationStrategy.parseDisambiguationResult missing required userDialogActs from parse: %s");
        OUTLINED_FUNCTION_26_6();
        OUTLINED_FUNCTION_2_0();
      }
      OUTLINED_FUNCTION_55_7();

      ((void (*)(uint64_t, uint64_t))v48)(v66, v67);
      v86 = *(_QWORD *)(v0 + 264);
      v87 = *(_QWORD *)(v0 + 232);
      sub_22911F6F0();
      v88 = OUTLINED_FUNCTION_94();
      OUTLINED_FUNCTION_13_19(v88, v89);
      v90 = v86;
      v91 = v87;
LABEL_36:
      v47(v90, v91);
      goto LABEL_37;
    }
    v84 = *(_QWORD *)(v0 + 136);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 32))(v84, *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
    if ((sub_2291C3B54() & 1) != 0)
    {
      OUTLINED_FUNCTION_34_7();
      OUTLINED_FUNCTION_156(*(_QWORD *)(v0 + 120));
      OUTLINED_FUNCTION_123();
      v85 = (unsigned int *)MEMORY[0x24BE98400];
    }
    else
    {
      v94 = *(_QWORD *)(v0 + 128);
      v95 = *(_QWORD *)(v0 + 136);
      v96 = *(_QWORD *)(v0 + 120);
      v97 = sub_2291C3B6C();
      OUTLINED_FUNCTION_18_7(v94, v95, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v96 + 16));
      v53 = *(_QWORD *)(v0 + 120);
      v84 = *(_QWORD *)(v0 + 128);
      v50 = *(_QWORD *)(v0 + 112);
      if ((v97 & 1) != 0)
      {
        OUTLINED_FUNCTION_40_8();
      }
      else
      {
        v98 = sub_2291C3B60();
        OUTLINED_FUNCTION_40_8();
        if ((v98 & 1) == 0)
        {
          v117 = v48;
          ((void (*)(_QWORD, uint64_t, _QWORD))v21)(*(_QWORD *)(v0 + 216), v118, *(_QWORD *)(v0 + 184));
          v100 = (void *)sub_2291C4520();
          v101 = sub_2291C4850();
          if (OUTLINED_FUNCTION_17(v101))
          {
            v102 = (_WORD *)OUTLINED_FUNCTION_12();
            OUTLINED_FUNCTION_65(v102);
            OUTLINED_FUNCTION_10(&dword_229115000, v103, v104, "Unexpected UDA type");
            OUTLINED_FUNCTION_2_0();
          }
          v105 = *(_QWORD *)(v0 + 264);
          v106 = *(_QWORD *)(v0 + 232);
          v107 = *(_QWORD *)(v0 + 216);
          v108 = *(_QWORD *)(v0 + 184);
          v109 = *(_QWORD *)(v0 + 136);
          v110 = *(_QWORD *)(v0 + 112);

          ((void (*)(uint64_t, uint64_t))v117)(v107, v108);
          sub_22911F6F0();
          v111 = OUTLINED_FUNCTION_94();
          OUTLINED_FUNCTION_13_19(v111, v112);
          ((void (*)(uint64_t, uint64_t))v21)(v109, v110);
          v90 = v105;
          v91 = v106;
          goto LABEL_36;
        }
      }
      v99 = OUTLINED_FUNCTION_34_7();
      ((void (*)(uint64_t, _QWORD))v21)(v99, *(_QWORD *)(v0 + 112));
      OUTLINED_FUNCTION_123();
      v85 = (unsigned int *)MEMORY[0x24BE983F8];
    }
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v53 + 104))(v84, *v85, v50);
LABEL_46:
    v34 = *(_QWORD *)(v0 + 408);
    v36 = *(_QWORD *)(v0 + 384);
    v35 = *(_QWORD *)(v0 + 392);
    v37 = *(_QWORD *)(v0 + 96);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 336));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v37, v34, v36);
    __swift_storeEnumTagSinglePayload(v37, 0, 1, v36);
    sub_2291C3A04();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_9();
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
    OUTLINED_FUNCTION_19();
    v92 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
    return v92();
  }
  v9 = *(_QWORD *)(v0 + 344);
  v10 = *(_QWORD *)(v0 + 280);
  OUTLINED_FUNCTION_9_13(*(_QWORD *)(v0 + 376), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
  OUTLINED_FUNCTION_60(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 96));
  OUTLINED_FUNCTION_41_8(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
  if (sub_2291C3A58() == 0xD00000000000002ELL && v11 == 0x80000002291CE890)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v38 = sub_2291C4C94();
  OUTLINED_FUNCTION_21();
  if ((v38 & 1) == 0)
  {
    v3 = OUTLINED_FUNCTION_156(*(_QWORD *)(v0 + 280));
    goto LABEL_28;
  }
LABEL_15:
  v39 = sub_2291C3A64();
  if (v39)
  {
    sub_22913B3B0(0xD000000000000011, 0x80000002291CF160, v39, (_OWORD *)(v0 + 16));
    OUTLINED_FUNCTION_21();
    if (*(_QWORD *)(v0 + 40))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v40 = sub_229196978();
        if (v40 != 2)
        {
          v41 = v40;
          v42 = *(_QWORD *)(v0 + 392);
          OUTLINED_FUNCTION_156(*(_QWORD *)(v0 + 280));
          if ((v41 & 1) != 0)
            v43 = (unsigned int *)MEMORY[0x24BE983F8];
          else
            v43 = (unsigned int *)MEMORY[0x24BE98400];
          (*(void (**)(_QWORD, _QWORD, _QWORD))(v42 + 104))(*(_QWORD *)(v0 + 408), *v43, *(_QWORD *)(v0 + 384));
          goto LABEL_46;
        }
      }
      goto LABEL_23;
    }
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  sub_2291B22AC(v0 + 16, &qword_255A2A878);
LABEL_23:
  v44 = *(_QWORD *)(v0 + 280);
  sub_22911F6F0();
  v45 = OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_13_19(v45, v46);
  OUTLINED_FUNCTION_60(*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
LABEL_37:
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 336));
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
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
  v92 = *(uint64_t (**)(void))(v0 + 8);
  return v92();
}

uint64_t sub_2291B0A70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2CD30);
  v3[15] = OUTLINED_FUNCTION_1_0();
  v4 = sub_2291C37E8();
  v3[16] = v4;
  v3[17] = *(_QWORD *)(v4 - 8);
  v3[18] = OUTLINED_FUNCTION_1_0();
  type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
  v3[19] = OUTLINED_FUNCTION_1_0();
  sub_2291C35D8();
  v3[20] = OUTLINED_FUNCTION_1_0();
  v5 = sub_2291C3974();
  v3[21] = v5;
  v3[22] = *(_QWORD *)(v5 - 8);
  v3[23] = OUTLINED_FUNCTION_1_0();
  v6 = sub_2291C37AC();
  v3[24] = v6;
  v3[25] = *(_QWORD *)(v6 - 8);
  v3[26] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B0B34()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v8;

  OUTLINED_FUNCTION_42_9();
  sub_2291C43D0();
  v1 = sub_2291C4484();
  if (v1 == sub_2291C4484() || (sub_2291C43D0(), v2 = sub_2291C4484(), v3 = 0, v4 = 0, v2 == sub_2291C4484()))
  {
    v3 = sub_2291C43B8();
    v4 = v5;
  }
  v0[27] = v4;
  sub_22917DA48();
  if ((sub_2291C30F8() & 1) != 0)
  {
    v6 = (_QWORD *)swift_task_alloc();
    v0[28] = (uint64_t)v6;
    *v6 = v0;
    v6[1] = sub_2291B0C98;
    return sub_229158B84(v3, v4);
  }
  else
  {
    v0[35] = sub_2291B19C0();
    v8 = (_QWORD *)swift_task_alloc();
    v0[36] = (uint64_t)v8;
    *v8 = v0;
    v8[1] = sub_2291B10F0;
    return sub_229159A38(v0[18], v3, v4);
  }
}

uint64_t sub_2291B0C98(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 232) = a1;
  *(_QWORD *)(v3 + 240) = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_20_7();
}

uint64_t sub_2291B0CFC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;

  v1 = v0[26];
  v2 = v0[14];
  sub_2291C35C0();
  *(_QWORD *)(swift_task_alloc() + 16) = v1;
  sub_2291C3914();
  OUTLINED_FUNCTION_9();
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 40));
  OUTLINED_FUNCTION_132();
  if ((sub_2291C35A8() & 1) != 0)
  {
    v3 = (void *)v0[29];
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v0[14] + 64), *(_QWORD *)(v0[14] + 88));
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v4 = OUTLINED_FUNCTION_14();
    *(_OWORD *)(v4 + 16) = xmmword_2291C5A50;
    *(_QWORD *)(v4 + 32) = v3;
    OUTLINED_FUNCTION_62_3();
    v0[31] = v18;
    v5 = v3;
    v6 = (_QWORD *)swift_task_alloc();
    v0[32] = (uint64_t)v6;
    *v6 = v0;
    v6[1] = sub_2291B0F90;
    OUTLINED_FUNCTION_45_3();
    return sub_2291C3824();
  }
  else
  {
    v8 = v0[30];
    sub_2291B166C();
    if (v8)
    {
      v9 = (void *)v0[29];
      OUTLINED_FUNCTION_156(v0[22]);

      OUTLINED_FUNCTION_20_19();
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_45_3();
      __asm { BR              X0 }
    }
    v11 = (void *)v0[29];
    v12 = v0[19];
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v0[14] + 64), *(_QWORD *)(v0[14] + 88));
    v0[10] = type metadata accessor for AppLaunchDataModels(0);
    sub_22912C97C((unint64_t *)&qword_255A2A868, type metadata accessor for AppLaunchDataModels, (uint64_t)&protocol conformance descriptor for AppLaunchDataModels);
    v0[11] = v13;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
    sub_2291B2268(v12, (uint64_t)boxed_opaque_existential_1);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v15 = OUTLINED_FUNCTION_14();
    *(_OWORD *)(v15 + 16) = xmmword_2291C5A50;
    *(_QWORD *)(v15 + 32) = v11;
    OUTLINED_FUNCTION_62_3();
    v0[33] = v18;
    v16 = v11;
    v17 = (_QWORD *)swift_task_alloc();
    v0[34] = (uint64_t)v17;
    *v17 = v0;
    v17[1] = sub_2291B1038;
    OUTLINED_FUNCTION_45_3();
    return sub_2291C380C();
  }
}

uint64_t sub_2291B0F90()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B0FC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 176);

  OUTLINED_FUNCTION_48_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_60(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_59(v3);
}

uint64_t sub_2291B1038()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_26();
  v1 = v0 + 56;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_36();
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_20_7();
}

uint64_t sub_2291B107C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_42_9();
  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 152);

  sub_2291B22DC(v3, type metadata accessor for AppLaunchDataModels.ConfirmationViewModel);
  OUTLINED_FUNCTION_48_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_60(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_2_19(v4);
}

uint64_t sub_2291B10F0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 296) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
    OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_20_7();
}

uint64_t sub_2291B1160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 192);
  v10 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 120);
  v11 = *(_QWORD *)(v0 + 136);
  v12 = *(_QWORD *)(v0 + 128);
  v5 = *(uint64_t **)(v0 + 96);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)(v0 + 112) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 112) + 40));
  sub_2291C3548();
  OUTLINED_FUNCTION_18_7(v4, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v3);
  v6 = sub_2291C3AD0();
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  v7 = MEMORY[0x24BE99088];
  v5[3] = v6;
  v5[4] = v7;
  __swift_allocate_boxed_opaque_existential_1(v5);
  sub_2291C36B0();
  swift_bridgeObjectRelease();
  sub_2291B22AC(v0 + 16, (uint64_t *)&unk_255A2CD40);
  sub_2291B22AC(v4, &qword_255A2CD30);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  v8 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return v8();
}

uint64_t sub_2291B12E4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_42_9();
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_2_19(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291B1328()
{
  uint64_t v0;

  OUTLINED_FUNCTION_42_9();
  OUTLINED_FUNCTION_23_16();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_2_19(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291B136C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2CD30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2291C3938();
  sub_2291C395C();
  sub_2291C3968();
  v6 = sub_2291C37AC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v5, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  sub_2291C3944();
  return sub_2291C392C();
}

uint64_t sub_2291B1444(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_51_7(a1);
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B1484(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_255A2A048 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_4_0(a1, (uint64_t)qword_255A30028);
  sub_2291C4520();
  v3 = sub_2291C4844();
  if (OUTLINED_FUNCTION_17(v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_65(v4);
    OUTLINED_FUNCTION_10(&dword_229115000, v5, v6, "RemoteDeviceConfirmationFlowStrategy.makeConfirmationRejectedResponse called");
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_50_7();
  OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v7;
  *v7 = v1;
  v7[1] = sub_229166D2C;
  return OUTLINED_FUNCTION_21_12(*(_QWORD *)(v1 + 16));
}

uint64_t sub_2291B1558(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_51_7(a1);
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B1598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  if (qword_255A2A048 != -1)
    a1 = swift_once();
  OUTLINED_FUNCTION_4_0(a1, (uint64_t)qword_255A30028);
  sub_2291C4520();
  v3 = sub_2291C4844();
  if (OUTLINED_FUNCTION_17(v3))
  {
    v4 = (_WORD *)OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_65(v4);
    OUTLINED_FUNCTION_10(&dword_229115000, v5, v6, "RemoteDeviceConfirmationFlowStrategy.makeFlowCancelledResponse called");
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_50_7();
  OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 56) = v7;
  *v7 = v1;
  v7[1] = sub_2291B2318;
  return OUTLINED_FUNCTION_21_12(*(_QWORD *)(v1 + 16));
}

void sub_2291B166C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 *inited;
  unint64_t v5;
  uint64_t v6;
  __n128 *v7;
  uint64_t v8;
  uint64_t *v9;
  __n128 *v10;
  uint64_t v11;

  v1 = sub_2291C30E0();
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  sub_2291B1D6C();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD20);
    v3 = OUTLINED_FUNCTION_31();
    *(_OWORD *)(v3 + 16) = xmmword_2291C5A70;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2B948);
    inited = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_37_11(inited);
    v5 = MEMORY[0x24BEE0D00];
    sub_2291C4A3C();
    inited[6].n128_u64[0] = v5;
    inited[4].n128_u64[1] = 0x6D7269666E6F63;
    inited[5].n128_u64[0] = 0xE700000000000000;
    sub_2291C4670();
    v11 = sub_2291C3110();
    v6 = MEMORY[0x24BEAD1E8];
    *(_QWORD *)(v3 + 56) = v11;
    *(_QWORD *)(v3 + 64) = v6;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v3 + 32));
    sub_2291C3104();
    swift_bridgeObjectRelease();
    sub_2291C30EC();
    v7 = (__n128 *)OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_37_11(v7);
    v9 = (uint64_t *)(v8 + 32);
    v10 = (__n128 *)swift_initStackObject();
    OUTLINED_FUNCTION_37_11(v10);
    swift_bridgeObjectRetain();
    sub_2291C4A3C();
    v10[6].n128_u64[0] = v5;
    v10[4].n128_u64[1] = 0x6C65636E6163;
    v10[5].n128_u64[0] = 0xE600000000000000;
    sub_2291C4670();
    v7[3].n128_u64[1] = v11;
    v7[4].n128_u64[0] = MEMORY[0x24BEAD1E8];
    __swift_allocate_boxed_opaque_existential_1(v9);
    sub_2291C3104();
    swift_bridgeObjectRelease();
    sub_2291C30EC();
    swift_bridgeObjectRelease();
    AppLaunchDataModels.ConfirmationViewModel.init(primaryAction:primaryLabel:secondaryAction:secondaryLabel:)();
  }
}

uint64_t sub_2291B19C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
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
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;

  v2 = v0;
  v3 = sub_2291C4538();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  if ((sub_2291C35A8() & 1) != 0)
    return MEMORY[0x24BEE4AF8];
  if (qword_255A2A008 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  v9 = sub_2291C4520();
  v10 = sub_2291C4868();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_229115000, v9, v10, "Making SAUIConfirmationView..", v11, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v7 = v2;
  v12 = sub_2291B1D6C();
  if (!v1)
  {
    v16 = v12;
    v17 = v13;
    v46 = v15;
    v47 = v14;
    v42 = sub_22911F948(0, (unint64_t *)&qword_255A2DC00);
    v45 = (id)sub_2291C46B8();
    v43 = v18;
    v19 = sub_2291C46B8();
    v41 = v20;
    v44 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v21 = OUTLINED_FUNCTION_31();
    v48 = xmmword_2291C5A50;
    *(_OWORD *)(v21 + 16) = xmmword_2291C5A50;
    swift_bridgeObjectRetain();
    v22 = sub_229196A24(0);
    v23 = (void *)objc_opt_self();
    v24 = objc_msgSend(v23, sel_wrapCommandInStartLocalRequest_, v22);

    *(_QWORD *)(v21 + 32) = v24;
    v49 = v21;
    OUTLINED_FUNCTION_44_8();
    v45 = sub_229178CC4(v16, v17, (uint64_t)v45, v43, v19, v41, v49);
    swift_bridgeObjectRelease();
    v25 = sub_2291C46B8();
    v27 = v26;
    v28 = sub_2291C46B8();
    v30 = v29;
    v31 = OUTLINED_FUNCTION_31();
    *(_OWORD *)(v31 + 16) = v48;
    v32 = sub_229196A24(1);
    v33 = objc_msgSend(v23, sel_wrapCommandInStartLocalRequest_, v32);

    *(_QWORD *)(v31 + 32) = v33;
    v49 = v31;
    OUTLINED_FUNCTION_44_8();
    v34 = sub_229178CC4(v47, v46, v25, v27, v28, v30, v49);
    sub_22911F948(0, &qword_255A2F670);
    v35 = v34;
    v36 = v45;
    v37 = sub_229178B28(v35, v36);
    v38 = OUTLINED_FUNCTION_31();
    *(_OWORD *)(v38 + 16) = v48;
    *(_QWORD *)(v38 + 32) = v37;
    v49 = v38;
    OUTLINED_FUNCTION_44_8();
    v7 = v49;

  }
  return v7;
}

uint64_t sub_2291B1D6C()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _BYTE *v12;
  uint64_t v14;

  v1 = sub_2291C4538();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22919AD48(0xD000000000000014, 0x80000002291D0550);
  if (v6)
  {
    v0 = v5;
    sub_22919AD48(0xD000000000000013, 0x80000002291D0570);
    if (v7)
      return v0;
    swift_bridgeObjectRelease();
  }
  if (qword_255A2A008 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v1, (uint64_t)qword_255A2FFB0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v8, v1);
  v9 = sub_2291C4520();
  v10 = sub_2291C485C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_229115000, v9, v10, "DeviceConfirmationStrategy.makePromptForConfirmation: Failed to localize labels for confirmation dialog.", v11, 2u);
    OUTLINED_FUNCTION_2_0();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_22911F6F0();
  swift_allocError();
  *v12 = 7;
  swift_willThrow();
  return v0;
}

uint64_t sub_2291B1F38()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 64);
  sub_22911FA24(v0 + 104);
  sub_22911F9F0(v0 + 200);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 240);
  return v0;
}

uint64_t sub_2291B1F7C()
{
  sub_2291B1F38();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceConfirmationStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2291B1FBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2291B1FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22911FA58;
  return sub_2291AFBE4(a1, a2);
}

uint64_t sub_2291B2024(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *a2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22911FA58;
  return sub_2291B0A70(a1, v4);
}

uint64_t sub_2291B2084()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for DeviceConfirmationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C32CC();
}

uint64_t sub_2291B2100()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for DeviceConfirmationStrategy();
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_2291C32D8();
}

uint64_t sub_2291B217C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22911E62C;
  return sub_2291B1444(a1);
}

uint64_t sub_2291B21CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22911FA58;
  return sub_2291B1558(a1);
}

uint64_t sub_2291B221C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22911FA58;
  return sub_229166D60();
}

uint64_t sub_2291B2260(uint64_t a1)
{
  uint64_t v1;

  return sub_2291B136C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2291B2268(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppLaunchDataModels.ConfirmationViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2291B22AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_25_17(*(_QWORD *)(v2 - 8));
  OUTLINED_FUNCTION_0();
}

void sub_2291B22DC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_25_17(*(_QWORD *)(v2 - 8));
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2291B230C()
{
  return MEMORY[0x24BE98D10];
}

uint64_t OUTLINED_FUNCTION_10_18()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_13_19(uint64_t a1, _BYTE *a2)
{
  *a2 = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_20_19()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[25] + 8))(v0[26], v0[24]);
}

uint64_t OUTLINED_FUNCTION_21_12(uint64_t a1)
{
  return sub_229190A30(a1);
}

uint64_t OUTLINED_FUNCTION_23_16()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[25] + 8))(v0[26], v0[24]);
}

uint64_t OUTLINED_FUNCTION_25_17@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_34_7()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136);
}

__n128 OUTLINED_FUNCTION_37_11(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)(v1 - 336);
  a1[1] = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_41_8@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_44_8()
{
  return sub_2291C4790();
}

void OUTLINED_FUNCTION_50_7()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_51_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return sub_2291C4538();
}

uint64_t OUTLINED_FUNCTION_55_7()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  return v1(v0);
}

void OUTLINED_FUNCTION_59_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t sub_2291B2438()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_2291C4538();
  v0[7] = v1;
  v0[8] = *(_QWORD *)(v1 - 8);
  v0[9] = OUTLINED_FUNCTION_25();
  v0[10] = OUTLINED_FUNCTION_25();
  v0[11] = OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B24C8()
{
  uint64_t v0;
  int domain_answer;
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  os_log_type_t v24;
  uint8_t *v25;

  *(_QWORD *)(v0 + 40) = 0;
  domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    v2 = domain_answer;
    if (qword_255A2A048 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 64);
    v4 = __swift_project_value_buffer(*(_QWORD *)(v0 + 56), (uint64_t)qword_255A30028);
    OUTLINED_FUNCTION_1_19(v4);
    v5 = sub_2291C4520();
    v6 = sub_2291C4850();
    if (OUTLINED_FUNCTION_109(v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_DWORD *)v7 = 67109120;
      *(_DWORD *)(v0 + 112) = v2;
      sub_2291C4940();
      v8 = "MarketplaceInfoDataProvider could not retrieve HYDROGEN domain eligiblity information, assuming ineligible. E"
           "ligibilityError: %d";
      v9 = v5;
      v10 = v3;
      v11 = v7;
      v12 = 8;
      goto LABEL_16;
    }
LABEL_17:

    OUTLINED_FUNCTION_69();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  }
  if (*(_QWORD *)(v0 + 40) != 4)
  {
    if (qword_255A2A048 != -1)
      swift_once();
    v22 = *(_QWORD *)(v0 + 64);
    v23 = __swift_project_value_buffer(*(_QWORD *)(v0 + 56), (uint64_t)qword_255A30028);
    OUTLINED_FUNCTION_1_19(v23);
    v5 = sub_2291C4520();
    v24 = sub_2291C4844();
    if (OUTLINED_FUNCTION_109(v24))
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_DWORD *)v25 = 134217984;
      swift_beginAccess();
      *(_QWORD *)(v0 + 48) = *(_QWORD *)(v0 + 40);
      sub_2291C4940();
      v8 = "MarketplaceInfoDataProvider device ineligible. Eligibility: %llu";
      v9 = v5;
      v10 = v22;
      v11 = v25;
      v12 = 12;
LABEL_16:
      _os_log_impl(&dword_229115000, v9, v10, v8, v11, v12);
      OUTLINED_FUNCTION_0_16();
    }
    goto LABEL_17;
  }
  if (qword_255A2A048 != -1)
    swift_once();
  v13 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 56);
  v15 = *(_QWORD *)(v0 + 64);
  v16 = __swift_project_value_buffer(v14, (uint64_t)qword_255A30028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v16, v14);
  v17 = sub_2291C4520();
  v18 = sub_2291C4844();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)OUTLINED_FUNCTION_12();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_229115000, v17, v18, "MarketplaceInfoDataProvider device eligible, fetching distributors...", v19, 2u);
    OUTLINED_FUNCTION_0_16();
  }

  OUTLINED_FUNCTION_69();
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v20;
  *v20 = v0;
  v20[1] = sub_2291B285C;
  return sub_2291C41E4();
}

uint64_t sub_2291B285C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = a1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B28DC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + 104);
  if (!v1[2]
    || (v3 = v1[4], v2 = v1[5], swift_bridgeObjectRetain(), swift_bridgeObjectRelease(), v3 == 0xD000000000000012)
    && v2 == 0x80000002291CF710
    || (sub_2291C4C94() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v3 = 0;
    v2 = 0;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v3, v2);
}

uint64_t type metadata accessor for MarketplaceInfoProvider()
{
  return objc_opt_self();
}

uint64_t sub_2291B2A0C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_19(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, a1, v2);
}

id sub_2291B2A48()
{
  objc_class *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_allocWithZone(v0);
  v2 = (void *)sub_2291C46AC();
  v3 = objc_msgSend(v1, sel_initWithIdentifier_displayString_, 0, v2);

  return v3;
}

void sub_2291B2AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2BAD8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v11 - v4;
  if (qword_255A29FA0 != -1)
    swift_once();
  type metadata accessor for AppLaunchIntent();
  v6 = _s11ApplicationVMa(0);
  sub_22912E074((unint64_t *)&qword_255A2CD60, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchIntent, (uint64_t)&unk_2291CBB28);
  sub_22912E074(&qword_255A2A2C8, _s11ApplicationVMa, (uint64_t)&unk_2291C59EC);
  OUTLINED_FUNCTION_0_24();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_229195948((uint64_t)v5);
  }
  else
  {
    if (qword_255A29FB0 != -1)
      swift_once();
    sub_22912E074(&qword_255A2A2C0, _s11ApplicationVMa, (uint64_t)&unk_2291C59BC);
    OUTLINED_FUNCTION_1_20();
    sub_2291C3E78();
    v7 = v13;
    v8 = v14;
    sub_2291B2D1C((uint64_t)v5);
    if (v8)
      sub_229181F58(v7, v8, v12);
  }
  OUTLINED_FUNCTION_0_24();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v6) == 1)
  {
    sub_229195948((uint64_t)v3);
  }
  else
  {
    if (qword_255A29FB8 != -1)
      swift_once();
    sub_22912E074(&qword_255A2A2C0, _s11ApplicationVMa, (uint64_t)&unk_2291C59BC);
    OUTLINED_FUNCTION_1_20();
    sub_2291C3E78();
    v9 = v13;
    v10 = v14;
    sub_2291B2D1C((uint64_t)v3);
    if (v10)
      sub_229181F4C(v9, v10, v12);
  }
}

uint64_t sub_2291B2D1C(uint64_t a1)
{
  uint64_t v2;

  v2 = _s11ApplicationVMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2291B2D58(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v9;
  uint64_t v10;
  id v11;

  if (a2)
    v9 = (void *)sub_2291C46AC();
  else
    v9 = 0;
  objc_msgSend(v6, sel_setName_, v9);

  if (a4)
    a4 = (void *)sub_2291C46AC();
  objc_msgSend(v6, sel_setAppId_, a4);

  if (a6)
    v10 = sub_2291C46AC();
  else
    v10 = 0;
  v11 = (id)v10;
  objc_msgSend(v6, sel_setSceneId_);

}

uint64_t OUTLINED_FUNCTION_0_24()
{
  return sub_2291C3E6C();
}

uint64_t OUTLINED_FUNCTION_1_20()
{
  uint64_t v0;

  return v0;
}

ValueMetadata *type metadata accessor for AppLaunchFlowFactoryImpl()
{
  return &type metadata for AppLaunchFlowFactoryImpl;
}

uint64_t sub_2291B2E60(void *a1, uint64_t a2, _QWORD *a3)
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15[2];
  __int128 v16[2];
  _QWORD v17[3];
  ValueMetadata *v18;
  _UNKNOWN **v19;

  type metadata accessor for LaunchAppIntent();
  type metadata accessor for LaunchAppIntentResponse();
  sub_2291C33F8();
  sub_2291C42BC();
  swift_allocObject();
  sub_2291C42B0();
  sub_2291C3380();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F728);
  sub_2291C33C8();
  type metadata accessor for LaunchAppNeedsValueStrategy();
  v17[0] = sub_2291B3B7C();
  sub_22912C97C(&qword_255A2F750, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppNeedsValueStrategy, (uint64_t)&unk_2291CC824);
  sub_2291C3368();
  swift_release();
  sub_2291C33B0();
  type metadata accessor for LaunchAppHandleIntentStrategy();
  v6 = a1;
  v7 = sub_2291185EC(a1);
  __swift_project_boxed_opaque_existential_1Tm(a3, a3[3]);
  v18 = &type metadata for AppLaunchFlowFactoryImpl;
  v19 = &off_24F1DCCC0;
  sub_22911F698(a2, (uint64_t)v16);
  sub_22911F698((uint64_t)v17, (uint64_t)v15);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  sub_22911F6D8(v16, v8 + 24);
  sub_22911F6D8(v15, v8 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  sub_2291C33BC();
  type metadata accessor for LaunchAppDisambiguationStrategy();
  v9 = sub_229143A68();
  __swift_project_boxed_opaque_existential_1Tm(a3, a3[3]);
  v18 = &type metadata for AppLaunchFlowFactoryImpl;
  v19 = &off_24F1DCCC0;
  sub_22911F698(a2, (uint64_t)v16);
  sub_22911F698((uint64_t)v17, (uint64_t)v15);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  sub_22911F6D8(v16, v10 + 24);
  sub_22911F6D8(v15, v10 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  sub_2291C33EC();
  type metadata accessor for LaunchAppUnsupportedValueStrategy();
  v11 = v6;
  v12 = sub_2291BA610((uint64_t)a1);
  __swift_project_boxed_opaque_existential_1Tm(a3, a3[3]);
  v18 = &type metadata for AppLaunchFlowFactoryImpl;
  v19 = &off_24F1DCCC0;
  sub_22911F698(a2, (uint64_t)v16);
  sub_22911F698((uint64_t)v17, (uint64_t)v15);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  sub_22911F6D8(v16, v13 + 24);
  sub_22911F6D8(v15, v13 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  sub_2291C33E0();
  type metadata accessor for LaunchAppConfirmationStrategy();
  v17[0] = sub_229152C9C();
  sub_22912C97C(&qword_255A2F758, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppConfirmationStrategy, (uint64_t)&unk_2291C7B50);
  sub_2291C3398();
  swift_release();
  sub_2291C33D4();
  return swift_release();
}

uint64_t sub_2291B3220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  type metadata accessor for DeepLaunchIntent();
  type metadata accessor for DeepLaunchIntentResponse();
  sub_2291C33F8();
  sub_2291C42BC();
  swift_allocObject();
  sub_2291C42B0();
  sub_2291C3380();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F768);
  sub_2291C33C8();
  sub_2291C3A88();
  v0 = sub_2291C37D0();
  swift_allocObject();
  v1 = sub_2291C37C4();
  v5 = v0;
  v6 = MEMORY[0x24BE97F18];
  *(_QWORD *)&v4 = v1;
  type metadata accessor for DeepLaunchHandleIntentStrategy();
  v2 = swift_allocObject();
  sub_22911F6D8(&v7, v2 + 16);
  sub_22911F6D8(&v4, v2 + 56);
  *(_QWORD *)&v7 = v2;
  sub_22912C97C(&qword_255A2F790, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchHandleIntentStrategy, (uint64_t)&unk_2291C8BEC);
  sub_2291C3374();
  swift_release();
  sub_2291C33BC();
  type metadata accessor for DeepLaunchUnsupportedValueStrategy();
  *(_QWORD *)&v7 = sub_22918E2E8();
  sub_22912C97C(&qword_255A2F798, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchUnsupportedValueStrategy, (uint64_t)&unk_2291CB674);
  sub_2291C33A4();
  swift_release();
  sub_2291C33E0();
  return swift_release();
}

uint64_t sub_2291B343C()
{
  uint64_t result;

  sub_2291C42BC();
  swift_allocObject();
  result = sub_2291C42B0();
  qword_255A300D0 = result;
  return result;
}

void sub_2291B34A8()
{
  type metadata accessor for LaunchAppWrapperFlow();
  sub_2291C38FC();
  sub_2291C3518();
  sub_2291AB368();
  sub_22912C97C((unint64_t *)&qword_255A2E5F8, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppWrapperFlow, (uint64_t)&unk_2291CC558);
  OUTLINED_FUNCTION_9_21();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_4_21();
}

void sub_2291B3528(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F760);
  v9 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_11_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F768);
  OUTLINED_FUNCTION_13_20();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  sub_2291B3220();
  OUTLINED_FUNCTION_11_16((uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F770);
  OUTLINED_FUNCTION_3();
  sub_2291C3404();
  v10 = a1;
  type metadata accessor for DeepLaunchFlowStrategy();
  sub_22912C97C(&qword_255A2F778, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchFlowStrategy, (uint64_t)&unk_2291C695C);
  OUTLINED_FUNCTION_12_17();
  swift_retain();
  OUTLINED_FUNCTION_1_21();
  if (qword_255A2A0E0 != -1)
    swift_once();
  v8 = OUTLINED_FUNCTION_7_23();
  OUTLINED_FUNCTION_3_16(v9);
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F780);
  sub_2291B3934(&qword_255A2F788, &qword_255A2F780);
  sub_2291C341C();
  OUTLINED_FUNCTION_26_1();
  swift_release();
  OUTLINED_FUNCTION_8_19();
  OUTLINED_FUNCTION_54_0();
}

void sub_2291B36E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F720);
  v15 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_11_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F728);
  OUTLINED_FUNCTION_13_20();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v16[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v16[3] = &type metadata for AppLaunchFlowFactoryImpl;
  v16[4] = &off_24F1DCCC0;
  sub_2291B2E60(a5, a4, v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  OUTLINED_FUNCTION_11_16((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F730);
  OUTLINED_FUNCTION_3();
  sub_2291C3404();
  v16[0] = a1;
  type metadata accessor for LaunchAppFlowStrategy();
  sub_22912C97C(&qword_255A2F738, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppFlowStrategy, (uint64_t)&unk_2291CC170);
  OUTLINED_FUNCTION_12_17();
  swift_retain();
  OUTLINED_FUNCTION_1_21();
  if (qword_255A2A0E0 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_7_23();
  OUTLINED_FUNCTION_3_16(v15);
  v16[0] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F740);
  sub_2291B3934(&qword_255A2F748, &qword_255A2F740);
  sub_2291C341C();
  OUTLINED_FUNCTION_26_1();
  swift_release();
  OUTLINED_FUNCTION_8_19();
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291B38C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_229197104(a1, a2, *(_QWORD *)(v2 + 16), v2 + 24, v2 + 64);
}

uint64_t sub_2291B38DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_229135F30(a1, a2, *(_QWORD *)(v2 + 16), v2 + 24, v2 + 64);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 64);
  return swift_deallocObject();
}

uint64_t sub_2291B3924(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22914BC8C(a1, a2, *(_QWORD *)(v2 + 16), v2 + 24, v2 + 64);
}

void sub_2291B3934(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x22E2C4E20](MEMORY[0x24BE96B80], v3), a1);
  }
  OUTLINED_FUNCTION_0();
}

void sub_2291B3970()
{
  __int128 v0;
  __int128 v1;

  sub_2291C3518();
  sub_2291C34A0();
  type metadata accessor for HomeScreenFlow();
  OUTLINED_FUNCTION_3();
  *(_QWORD *)&v1 = sub_22912E5D0(&v1, &v0);
  sub_22912C97C((unint64_t *)&qword_255A2AF00, (uint64_t (*)(uint64_t))type metadata accessor for HomeScreenFlow, (uint64_t)&unk_2291C6100);
  OUTLINED_FUNCTION_9_21();
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_4_21();
}

uint64_t sub_2291B39F4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[20];

  if (qword_2540B1F40 != -1)
    swift_once();
  v0 = static InstalledAppProvider.shared;
  v3[3] = type metadata accessor for InstalledAppProvider();
  v3[4] = &protocol witness table for InstalledAppProvider;
  v3[0] = v0;
  swift_retain();
  sub_2291C38FC();
  sub_2291C3518();
  sub_2291C34A0();
  sub_22919255C();
  v1 = sub_2291C341C();
  sub_2291B3AB8((uint64_t)v3);
  return v1;
}

uint64_t sub_2291B3AB8(uint64_t a1)
{
  destroy for JournalEntryFlow(a1);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  return sub_2291C3698();
}

uint64_t OUTLINED_FUNCTION_3_16@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_7_23()
{
  return sub_2291C368C();
}

uint64_t OUTLINED_FUNCTION_8_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_21()
{
  return sub_2291C341C();
}

uint64_t OUTLINED_FUNCTION_11_16@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_12_17()
{
  return swift_retain();
}

uint64_t sub_2291B3B7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[40];
  _QWORD v5[5];
  _BYTE v6[40];

  sub_2291C3A88();
  type metadata accessor for BaseDialogProvider();
  v0 = swift_allocObject();
  v5[3] = sub_2291C4370();
  v5[4] = &off_24F1D8FF0;
  v5[0] = sub_2291C4364();
  sub_2291C37D0();
  OUTLINED_FUNCTION_3();
  v1 = sub_2291C37C4();
  sub_2291358C8((uint64_t)v5, (uint64_t)v4);
  swift_retain();
  v2 = sub_2291B59BC((uint64_t)v6, v0, (uint64_t)v4, v1);
  sub_22913A714((uint64_t)v5);
  swift_release();
  return v2;
}

void sub_2291B3C34(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
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
  char *v38;
  void (*v39)(_QWORD);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  void (*v44)(_QWORD);
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  char *v48;
  uint64_t v49;
  char v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _WORD *v63;
  void (*isa)(char *, uint64_t);
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char v69;
  uint64_t v70;
  os_log_type_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  _WORD *v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  os_log_type_t v81;
  uint64_t v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  os_log_type_t v93;
  NSObject *v94;
  os_log_type_t v95;
  _WORD *v96;
  char v97;
  void (*v98)(uint64_t, uint8_t *);
  uint64_t v99;
  uint64_t v100;
  unsigned __int8 v101;
  unsigned __int8 v102;
  uint64_t v103;
  char v105;
  uint64_t v106;
  uint64_t v107;
  char v109;
  uint64_t v110;
  os_log_type_t v112;
  uint64_t v113;
  NSObject *v114;
  uint64_t v115;
  os_log_type_t v116;
  _BOOL4 v117;
  char *v118;
  uint8_t *v119;
  _QWORD *v120;
  uint64_t v121;
  os_log_type_t v122;
  NSObject *v123;
  os_log_type_t v124;
  uint8_t *v125;
  uint64_t v126;
  NSObject *v127;
  NSObject *v128;
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
  uint8_t *v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSObject *v150;
  char *v151;
  uint8_t *v152;
  NSObject *v153;
  uint64_t v154;
  void (*v155)(_QWORD);
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;

  v156 = a1;
  v3 = sub_2291C3A28();
  v147 = *(_QWORD *)(v3 - 8);
  v148 = v3;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_82();
  v141 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD70);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_82();
  v140 = v7;
  OUTLINED_FUNCTION_8_5();
  v8 = sub_2291C3B24();
  v138 = *(_QWORD *)(v8 - 8);
  v139 = v8;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_82();
  v137 = v10;
  OUTLINED_FUNCTION_8_5();
  v143 = (uint8_t *)sub_2291C3B9C();
  v134 = *((_QWORD *)v143 - 1);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v12);
  v146 = (uint64_t)&v126 - v13;
  OUTLINED_FUNCTION_8_5();
  v142 = sub_2291C3AAC();
  v144 = *(_QWORD *)(v142 - 8);
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_82();
  v145 = v15;
  OUTLINED_FUNCTION_8_5();
  v136 = type metadata accessor for AppLaunchIntent();
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_82();
  v152 = v17;
  OUTLINED_FUNCTION_8_5();
  v18 = sub_2291C40D0();
  v153 = *(NSObject **)(v18 - 8);
  v154 = v18;
  OUTLINED_FUNCTION_84();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_82();
  v151 = v20;
  OUTLINED_FUNCTION_8_5();
  v21 = sub_2291C3A7C();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v126 - v24;
  v26 = OUTLINED_FUNCTION_66();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_134();
  v150 = v28;
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_19_1();
  v149 = v33;
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_8_1();
  v36 = MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v126 - v37;
  if (qword_255A2A048 != -1)
    v36 = swift_once();
  OUTLINED_FUNCTION_13_13(v36, (uint64_t)qword_255A30028);
  v39 = *(void (**)(_QWORD))(v27 + 16);
  v135 = v40;
  v155 = v39;
  v39(v38);
  v41 = sub_2291C4520();
  v42 = sub_2291C4844();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v43 = 0;
    OUTLINED_FUNCTION_39(&dword_229115000, v41, v42, "LaunchAppNeedsValueStrategy.actionForInput() called", v43);
    OUTLINED_FUNCTION_2_0();
  }

  v44 = *(void (**)(_QWORD))(v27 + 8);
  OUTLINED_FUNCTION_65_4((uint64_t)v38);
  v45 = v156;
  sub_2291C3A10();
  v46 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v25, v21);
  if ((_DWORD)v46 == *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_41_9();
    v47 = v153;
    v21 = v154;
    v48 = v151;
    ((void (*)(char *, char *, uint64_t))v153[4].isa)(v151, v25, v154);
    v49 = (uint64_t)v152;
    ((void (*)(uint8_t *, char *, uint64_t))v47[2].isa)(v152, v48, v21);
    sub_22913896C();
    if ((v50 & 1) != 0)
    {
      sub_2291C365C();
LABEL_41:
      sub_2291224D0(v49);
      isa = (void (*)(char *, uint64_t))v47[1].isa;
      v65 = v48;
LABEL_42:
      v66 = v21;
      goto LABEL_43;
    }
    if (qword_255A2A020 != -1)
      swift_once();
    sub_22911F7AC((unint64_t *)&qword_255A2CD60, 255, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchIntent, (uint64_t)&unk_2291CBB28);
    sub_2291C3E78();
    if (v158 != 11)
    {
      if (sub_22915CC7C(v158) == 1852141679 && v67 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v69 = OUTLINED_FUNCTION_52_0();
        v70 = swift_bridgeObjectRelease();
        if ((v69 & 1) == 0)
        {
          if (qword_255A2A008 != -1)
            v70 = swift_once();
          OUTLINED_FUNCTION_13_13(v70, (uint64_t)qword_255A2FFB0);
          v71 = v130;
          OUTLINED_FUNCTION_7_24(v130, v72);
          v73 = sub_2291C4520();
          v74 = sub_2291C4838();
          if (OUTLINED_FUNCTION_23_0(v74))
          {
            v75 = (_WORD *)OUTLINED_FUNCTION_11();
            OUTLINED_FUNCTION_65(v75);
            OUTLINED_FUNCTION_39(&dword_229115000, v73, v71, "Incorrect verb in intent for flow, ignoring input", (uint8_t *)v27);
            OUTLINED_FUNCTION_2_0();
          }

          OUTLINED_FUNCTION_65_4(v130);
          OUTLINED_FUNCTION_54_7();
          goto LABEL_41;
        }
      }
    }
    v93 = v149;
    OUTLINED_FUNCTION_7_24(v149, v135);
    v94 = sub_2291C4520();
    v95 = sub_2291C4844();
    if (OUTLINED_FUNCTION_23_0(v95))
    {
      v96 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v96);
      OUTLINED_FUNCTION_39(&dword_229115000, v94, v93, "LaunchAppNeedsValueStrategy.actionForInput() handling", (uint8_t *)v27);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_65_4(v149);
    sub_2291C3668();
    goto LABEL_41;
  }
  if ((_DWORD)v46 != *MEMORY[0x24BE98E98])
  {
    v154 = a2;
    if (qword_255A2A008 != -1)
      v46 = swift_once();
    OUTLINED_FUNCTION_13_13(v46, (uint64_t)qword_255A2FFB0);
    v76 = v150;
    OUTLINED_FUNCTION_7_24((uint64_t)v150, v77);
    v78 = v147;
    v79 = v148;
    v80 = v141;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 16))(v141, v45, v148);
    sub_2291C4520();
    v81 = OUTLINED_FUNCTION_85();
    if (OUTLINED_FUNCTION_117(v81))
    {
      v153 = v76;
      v82 = OUTLINED_FUNCTION_12();
      v156 = v26;
      v83 = (uint8_t *)v82;
      v158 = OUTLINED_FUNCTION_12();
      v155 = v44;
      *(_DWORD *)v83 = 136315138;
      v152 = v83 + 4;
      v84 = v131;
      sub_2291C3A10();
      v85 = sub_22914D99C(v84);
      v157 = sub_22913EFA8(v85, v86, &v158);
      sub_2291C4940();
      OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_25_17(v147);
      OUTLINED_FUNCTION_81(&dword_229115000, v153, (os_log_type_t)v76, "Unable to handle parse: %s", v83);
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_2_0();
    }
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v80, v79);

    OUTLINED_FUNCTION_65_4((uint64_t)v150);
    sub_2291C3674();
    isa = *(void (**)(char *, uint64_t))(v22 + 8);
    v65 = v25;
    goto LABEL_42;
  }
  OUTLINED_FUNCTION_41_9();
  v52 = v144;
  v51 = v145;
  v53 = v142;
  (*(void (**)(char *, char *, uint64_t))(v144 + 32))(v145, v25, v142);
  v54 = v137;
  sub_2291C3A94();
  v55 = sub_2291C3B00();
  (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v54, v139);
  v56 = v140;
  sub_22914D85C(v55, v140);
  swift_bridgeObjectRelease();
  v57 = v143;
  if (__swift_getEnumTagSinglePayload(v56, 1, (uint64_t)v143) == 1)
  {
    sub_2291B22AC(v56, (uint64_t *)&unk_255A2CD70);
    if (qword_255A2A008 != -1)
      v58 = swift_once();
    OUTLINED_FUNCTION_13_13(v58, (uint64_t)qword_255A2FFB0);
    v59 = v132;
    OUTLINED_FUNCTION_7_24(v132, v60);
    v61 = sub_2291C4520();
    v62 = sub_2291C4850();
    if (OUTLINED_FUNCTION_23_0(v62))
    {
      v63 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v63);
      OUTLINED_FUNCTION_39(&dword_229115000, v61, (os_log_type_t)v59, "Unable to extract UserDialogAct from parse", v57);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_65_4(v59);
    OUTLINED_FUNCTION_54_7();
    goto LABEL_15;
  }
  v154 = a2;
  v87 = v53;
  v88 = v146;
  v89 = v56;
  v90 = v134;
  OUTLINED_FUNCTION_18_7(v146, v89, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v134 + 32));
  v91 = sub_2291C3B6C();
  v92 = v133;
  OUTLINED_FUNCTION_18_7(v133, v88, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v90 + 16));
  if ((v91 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_16(v92);
LABEL_46:
    sub_2291C365C();
    OUTLINED_FUNCTION_29_16(v146);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v51, v87);
    goto LABEL_44;
  }
  v97 = sub_2291C3B60();
  v98 = *(void (**)(uint64_t, uint8_t *))(v90 + 8);
  OUTLINED_FUNCTION_29_16(v92);
  if ((v97 & 1) != 0)
    goto LABEL_46;
  v99 = v146;
  sub_22914DF34();
  v53 = v87;
  if (v100)
  {
    sub_229123334();
    v102 = v101;
    if (sub_22915C50C(v101) == 1852141679 && v103 == 0xE400000000000000)
      goto LABEL_68;
    v105 = OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_74_1();
    v106 = v146;
    if ((v105 & 1) != 0)
      goto LABEL_69;
    if (sub_22915C50C(v102) == 0x736972616D6D7573 && v107 == 0xE900000000000065)
      goto LABEL_68;
    v109 = OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_74_1();
    v106 = v146;
    if ((v109 & 1) != 0)
      goto LABEL_69;
    if (sub_22915C50C(v102) == 0x627265566F6ELL && v110 == 0xE600000000000000)
    {
LABEL_68:
      swift_bridgeObjectRelease();
      v106 = v146;
    }
    else
    {
      v112 = OUTLINED_FUNCTION_52_0();
      v113 = OUTLINED_FUNCTION_21();
      v106 = v146;
      if ((v112 & 1) == 0)
      {
        if (qword_255A2A008 != -1)
          v113 = swift_once();
        OUTLINED_FUNCTION_13_13(v113, (uint64_t)qword_255A2FFB0);
        v114 = v127;
        OUTLINED_FUNCTION_7_24((uint64_t)v127, v115);
        sub_2291C4520();
        v116 = OUTLINED_FUNCTION_85();
        v117 = OUTLINED_FUNCTION_13_5(v116);
        v118 = v145;
        if (v117)
        {
          v119 = (uint8_t *)OUTLINED_FUNCTION_11();
          *(_WORD *)v119 = 0;
          OUTLINED_FUNCTION_39(&dword_229115000, v114, v112, "Unable to extract verb or incorrect verb in parse, ignoring input", v119);
          OUTLINED_FUNCTION_2_0();
        }

        OUTLINED_FUNCTION_65_4((uint64_t)v127);
        goto LABEL_76;
      }
    }
LABEL_69:
    v120 = OUTLINED_FUNCTION_68_5(v129);
    v121 = sub_2291482BC((uint64_t)v120);
    if (qword_255A2A0F0 != -1)
      swift_once();
    v122 = sub_2291B5844(v121, qword_255A300D8);
    OUTLINED_FUNCTION_21();
    v118 = v145;
    if ((v122 & 1) != 0)
    {
      v123 = v128;
      OUTLINED_FUNCTION_7_24((uint64_t)v128, v135);
      sub_2291C4520();
      v124 = OUTLINED_FUNCTION_51();
      if (OUTLINED_FUNCTION_13_5(v124))
      {
        v125 = (uint8_t *)OUTLINED_FUNCTION_11();
        *(_WORD *)v125 = 0;
        OUTLINED_FUNCTION_39(&dword_229115000, v123, v122, "LaunchAppNeedsValueStrategy.actionForInput() handling", v125);
        OUTLINED_FUNCTION_2_0();
      }

      OUTLINED_FUNCTION_65_4((uint64_t)v128);
      sub_2291C3668();
      goto LABEL_77;
    }
LABEL_76:
    OUTLINED_FUNCTION_54_7();
LABEL_77:
    swift_release();
    v98(v106, v143);
    isa = *(void (**)(char *, uint64_t))(v144 + 8);
    v65 = v118;
    goto LABEL_16;
  }
  sub_2291C3674();
  OUTLINED_FUNCTION_29_16(v99);
LABEL_15:
  isa = *(void (**)(char *, uint64_t))(v52 + 8);
  v65 = v51;
LABEL_16:
  v66 = v53;
LABEL_43:
  isa(v65, v66);
LABEL_44:
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291B4850(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = OUTLINED_FUNCTION_66();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B4898()
{
  uint64_t *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  _WORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_255A2A048 != -1)
    swift_once();
  v2 = v0[5];
  v1 = v0[6];
  v3 = __swift_project_value_buffer(v0[4], (uint64_t)qword_255A30028);
  OUTLINED_FUNCTION_44_2((uint64_t)v1, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  sub_2291C4520();
  v4 = OUTLINED_FUNCTION_51();
  if (os_log_type_enabled(v1, v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_65(v5);
    OUTLINED_FUNCTION_39(&dword_229115000, v1, v4, "LaunchAppNeedsValueStrategy.makePromptForValue() called", (uint8_t *)v2);
    OUTLINED_FUNCTION_2_0();
  }
  v7 = v0[5];
  v6 = v0[6];
  v8 = v0[4];

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v9 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_229188360;
  return sub_229191414(v0[2]);
}

uint64_t sub_2291B49B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  v5 = sub_2291C3A28();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = OUTLINED_FUNCTION_1_0();
  v6 = sub_2291C3B24();
  v4[13] = v6;
  v4[14] = *(_QWORD *)(v6 - 8);
  v4[15] = OUTLINED_FUNCTION_1_0();
  v7 = sub_2291C3AAC();
  v4[16] = v7;
  v4[17] = *(_QWORD *)(v7 - 8);
  v4[18] = OUTLINED_FUNCTION_1_0();
  type metadata accessor for AppLaunchIntent();
  v4[19] = OUTLINED_FUNCTION_1_0();
  v8 = OUTLINED_FUNCTION_66();
  v4[20] = v8;
  v4[21] = *(_QWORD *)(v8 - 8);
  v4[22] = OUTLINED_FUNCTION_25();
  v4[23] = OUTLINED_FUNCTION_25();
  v4[24] = OUTLINED_FUNCTION_25();
  v4[25] = OUTLINED_FUNCTION_25();
  v4[26] = OUTLINED_FUNCTION_25();
  v4[27] = OUTLINED_FUNCTION_25();
  v9 = sub_2291C40D0();
  v4[28] = v9;
  v4[29] = *(_QWORD *)(v9 - 8);
  v4[30] = OUTLINED_FUNCTION_1_0();
  v10 = sub_2291C3A7C();
  v4[31] = v10;
  v4[32] = *(_QWORD *)(v10 - 8);
  v4[33] = OUTLINED_FUNCTION_25();
  v4[34] = OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B4AE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  _QWORD *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _WORD *v42;
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
  NSObject *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  unint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  unint64_t v84;
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
  _BYTE *v96;
  uint64_t v97;
  os_log_type_t v98;
  uint8_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE *v104;
  uint64_t (*v105)(void);
  id v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v121)(uint64_t, uint64_t, uint64_t);
  uint64_t v122;
  void *v123;
  void *v124;
  __int128 v125;
  __int128 v126;

  v1 = v0[34];
  v3 = v0[31];
  v2 = v0[32];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2FBD0);
  v4 = (void *)sub_2291C3980();
  sub_2291C3A10();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v5 == *MEMORY[0x24BE98E08])
  {
    v6 = v0[34];
    v7 = v0[29];
    v8 = v0[30];
    OUTLINED_FUNCTION_58_5(*(uint64_t (**)(uint64_t))(v0[32] + 96));
    v9 = OUTLINED_FUNCTION_5_8(v8, v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
    if (qword_255A2A048 != -1)
      v9 = swift_once();
    v123 = v4;
    v10 = v0[27];
    v12 = v0[20];
    v11 = v0[21];
    OUTLINED_FUNCTION_13_13(v9, (uint64_t)qword_255A30028);
    v120 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
    v122 = v13;
    OUTLINED_FUNCTION_5_8((uint64_t)v10, v13, v120);
    sub_2291C4520();
    v14 = OUTLINED_FUNCTION_51();
    if (OUTLINED_FUNCTION_109(v14))
    {
      v15 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v15 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v10, (os_log_type_t)v12, "LaunchApp.FlowStrategy.makeIntentFromParse() Creating intent from NLv3IntentOnly parse", v15);
      OUTLINED_FUNCTION_2_0();
    }
    v16 = v0[29];
    v17 = v0[30];
    v19 = v0[27];
    v18 = v0[28];
    v119 = v0[26];
    v21 = v0[20];
    v20 = v0[21];
    v22 = v0[19];
    v23 = v0[9];

    v24 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v24(v19, v21);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v22, v17, v18);
    v25 = __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v23 + 152), *(_QWORD *)(v23 + 176));
    sub_2291B634C(v22, (uint64_t)v25, v123);
    v120(v119, v122, v21);
    v26 = v123;
    v27 = OUTLINED_FUNCTION_28_8();
    v28 = sub_2291C4868();
    if (OUTLINED_FUNCTION_109(v28))
    {
      v29 = (uint8_t *)OUTLINED_FUNCTION_12();
      v30 = (_QWORD *)OUTLINED_FUNCTION_12();
      *(_DWORD *)v29 = 138412290;
      v0[5] = v26;
      v31 = v26;
      sub_2291C4940();
      *v30 = v26;

      OUTLINED_FUNCTION_81(&dword_229115000, v27, (os_log_type_t)v17, "Finished creating intent from parse: %@", v29);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_2_0();
    }

    v24(v0[26], v0[20]);
    v71 = objc_msgSend(v26, sel_requestedApplication);
    if (v71)
    {
      v72 = v71;
      *((_QWORD *)&v126 + 1) = OUTLINED_FUNCTION_42_5();
      *(_QWORD *)&v125 = v72;
    }
    else
    {
      v125 = 0u;
      v126 = 0u;
    }
    v86 = v0[29];
    v85 = v0[30];
    v87 = v0[28];
    v88 = v0[19];
    type metadata accessor for LaunchAppIntent();
    sub_2291C37F4();
    sub_2291224D0(v88);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v85, v87);
LABEL_33:
    v111 = v0[6];
    v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2BAE0);
    __swift_storeEnumTagSinglePayload(v111, 0, 1, v112);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_8();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v105 = (uint64_t (*)(void))v0[1];
    return v105();
  }
  if (v5 == *MEMORY[0x24BE98E98])
  {
    v32 = v0[34];
    v33 = v0[17];
    v34 = v0[18];
    v35 = v0[16];
    OUTLINED_FUNCTION_58_5(*(uint64_t (**)(uint64_t))(v0[32] + 96));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(v34, v32, v35);
    if (qword_255A2A048 != -1)
      swift_once();
    v124 = v4;
    v36 = v0[25];
    v38 = (uint8_t *)v0[20];
    v37 = v0[21];
    v39 = __swift_project_value_buffer((uint64_t)v38, (uint64_t)qword_255A30028);
    v121 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
    v121(v36, v39, (uint64_t)v38);
    v40 = sub_2291C4520();
    v41 = sub_2291C4844();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v42);
      OUTLINED_FUNCTION_39(&dword_229115000, v40, v41, "LaunchApp.FlowStrategy.makeIntentFromParse() Creating intent from USO parse", v38);
      OUTLINED_FUNCTION_2_0();
    }
    v44 = v0[14];
    v43 = v0[15];
    v45 = v0[13];

    OUTLINED_FUNCTION_31_7();
    sub_2291C3A94();
    sub_22914DC00();
    v47 = v46;
    v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
    v56 = v0[20];
    if (v47)
    {
      v57 = OUTLINED_FUNCTION_68_5(v0[9]);
      sub_2291B5CB8(v47, (uint64_t)v57, v124);
      OUTLINED_FUNCTION_32_5(v58, v59, v60, v61, v62, v63, v64, v65, v114, v115, v116, v118, v121);
      swift_retain_n();
      v66 = OUTLINED_FUNCTION_28_8();
      v67 = sub_2291C4868();
      if (OUTLINED_FUNCTION_55_6(v67))
      {
        v68 = (uint8_t *)OUTLINED_FUNCTION_12();
        *(_QWORD *)&v125 = OUTLINED_FUNCTION_12();
        *(_DWORD *)v68 = 136315138;
        v0[3] = v47;
        sub_2291C40C4();
        swift_retain();
        v69 = sub_2291C46D0();
        v0[4] = sub_22913EFA8(v69, v70, (uint64_t *)&v125);
        sub_2291C4940();
        OUTLINED_FUNCTION_14_6();
        OUTLINED_FUNCTION_49_4();
        OUTLINED_FUNCTION_81(&dword_229115000, v66, (os_log_type_t)v44, "LaunchApp.FlowStrategy.makeIntentFromParseNLv4Uso() Finished creating intent from parse: %s", v68);
        OUTLINED_FUNCTION_36_0();
        OUTLINED_FUNCTION_2_0();
      }
      OUTLINED_FUNCTION_49_4();

      OUTLINED_FUNCTION_31_7();
      v106 = objc_msgSend(v124, sel_requestedApplication);
      if (v106)
      {
        v107 = v106;
        *((_QWORD *)&v126 + 1) = OUTLINED_FUNCTION_42_5();
        *(_QWORD *)&v125 = v107;
      }
      else
      {
        v125 = 0u;
        v126 = 0u;
      }
      v108 = v0[17];
      v109 = v0[18];
      v110 = v0[16];
      type metadata accessor for LaunchAppIntent();
      sub_2291C37F4();
      OUTLINED_FUNCTION_35_5();
      (*(void (**)(uint64_t, uint64_t))(v108 + 8))(v109, v110);
      goto LABEL_33;
    }
    v97 = v0[23];
    OUTLINED_FUNCTION_32_5(v48, v49, v50, v51, v52, v53, v54, v55, v114, v115, v116, v118, v121);
    OUTLINED_FUNCTION_28_8();
    v98 = OUTLINED_FUNCTION_85();
    if (OUTLINED_FUNCTION_13_5(v98))
    {
      v99 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v99 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v56, (os_log_type_t)v97, "LaunchApp.FlowStrategy.makeIntentFromParseNLv4Uso() No tasks found in input", v99);
      OUTLINED_FUNCTION_2_0();
    }
    v101 = v0[17];
    v100 = v0[18];
    v102 = v0[16];

    OUTLINED_FUNCTION_31_7();
    sub_22911F6F0();
    v103 = OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_40_6(v103, v104);

    (*(void (**)(uint64_t, uint64_t))(v101 + 8))(v100, v102);
  }
  else
  {
    if (qword_255A2A008 != -1)
      swift_once();
    v73 = v0[21];
    v74 = v0[22];
    v76 = v0[11];
    v75 = v0[12];
    v77 = v0[7];
    v78 = __swift_project_value_buffer(v0[20], (uint64_t)qword_255A2FFB0);
    OUTLINED_FUNCTION_18_7(v74, v78, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v73 + 16));
    OUTLINED_FUNCTION_5_8(v75, v77, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v76 + 16));
    v79 = sub_2291C4520();
    v80 = sub_2291C4850();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = v0[33];
      v117 = v0[11];
      v82 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_QWORD *)&v125 = OUTLINED_FUNCTION_12();
      *(_DWORD *)v82 = 136315138;
      sub_2291C3A10();
      v83 = sub_22914D99C(v81);
      v0[2] = sub_22913EFA8(v83, v84, (uint64_t *)&v125);
      sub_2291C4940();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_58_5(*(uint64_t (**)(uint64_t))(v117 + 8));
      OUTLINED_FUNCTION_81(&dword_229115000, v79, v80, "Unable to process parse: %s", v82);
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_2_0();
    }
    v90 = v0[21];
    v89 = v0[22];
    v91 = v0[20];
    (*(void (**)(_QWORD, _QWORD))(v0[11] + 8))(v0[12], v0[10]);

    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v89, v91);
    v92 = v0[34];
    v94 = v0[31];
    v93 = v0[32];
    sub_22911F6F0();
    v95 = OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_40_6(v95, v96);

    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v92, v94);
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
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
  v105 = (uint64_t (*)(void))v0[1];
  return v105();
}

uint64_t type metadata accessor for LaunchAppNeedsValueStrategy()
{
  return objc_opt_self();
}

void sub_2291B5510(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2291B3C34(a1, a2);
}

uint64_t sub_2291B5530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22914301C;
  return sub_2291B49B0(a1, a2, a3);
}

uint64_t sub_2291B559C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22913FA64;
  return sub_2291B4850(a1);
}

uint64_t sub_2291B55F0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppNeedsValueStrategy();
  *v1 = v0;
  v1[1] = sub_22914301C;
  return sub_2291C3164();
}

uint64_t sub_2291B566C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppNeedsValueStrategy();
  *v1 = v0;
  v1[1] = sub_22914301C;
  return sub_2291C3170();
}

uint64_t sub_2291B56E8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppNeedsValueStrategy();
  *v1 = v0;
  v1[1] = sub_22914301C;
  return sub_2291C39E0();
}

uint64_t sub_2291B577C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppNeedsValueStrategy();
  *v1 = v0;
  v1[1] = sub_22914301C;
  return sub_2291C39EC();
}

void sub_2291B5818(uint64_t a1, uint64_t a2)
{
  sub_22911F7AC(qword_255A2F890, a2, (uint64_t (*)(uint64_t))type metadata accessor for LaunchAppNeedsValueStrategy, (uint64_t)&unk_2291CC7EC);
}

uint64_t sub_2291B5844(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  unint64_t i;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v22;

  if (!*(_QWORD *)(a2 + 16))
    return 1;
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 1;
  v22 = a1 + 32;
  v4 = a2 + 56;
  swift_bridgeObjectRetain();
  v5 = 0;
  while (!*(_QWORD *)(a2 + 16))
  {
LABEL_20:
    if (++v5 == v2)
    {
      v20 = 1;
      goto LABEL_24;
    }
  }
  v6 = (uint64_t *)(v22 + 16 * v5);
  v8 = *v6;
  v7 = v6[1];
  sub_2291C4D0C();
  swift_bridgeObjectRetain();
  sub_2291C4700();
  v9 = sub_2291C4D30();
  v10 = -1 << *(_BYTE *)(a2 + 32);
  v11 = v9 & ~v10;
  if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
  {
LABEL_19:
    OUTLINED_FUNCTION_74_1();
    goto LABEL_20;
  }
  v12 = *(_QWORD *)(a2 + 48);
  v13 = (_QWORD *)(v12 + 16 * v11);
  v14 = *v13 == v8 && v13[1] == v7;
  if (!v14 && (OUTLINED_FUNCTION_52_0() & 1) == 0)
  {
    v15 = ~v10;
    for (i = v11 + 1; ; i = v17 + 1)
    {
      v17 = i & v15;
      if (((*(_QWORD *)(v4 + (((i & v15) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v15)) & 1) == 0)
        break;
      v18 = (_QWORD *)(v12 + 16 * v17);
      v19 = *v18 == v8 && v18[1] == v7;
      if (v19 || (OUTLINED_FUNCTION_52_0() & 1) != 0)
        goto LABEL_23;
    }
    goto LABEL_19;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  v20 = 0;
LABEL_24:
  OUTLINED_FUNCTION_74_1();
  return v20;
}

uint64_t sub_2291B59BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[3];
  ValueMetadata *v23;
  _UNKNOWN **v24;
  _QWORD v25[5];

  v8 = type metadata accessor for BaseDialogProvider();
  v25[3] = v8;
  v25[4] = &off_24F1DC048;
  v25[0] = a2;
  v23 = &type metadata for ReferenceResolver;
  v24 = &off_24F1D9080;
  v9 = swift_allocObject();
  v22[0] = v9;
  v10 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(a3 + 32);
  type metadata accessor for LaunchAppNeedsValueStrategy();
  v11 = swift_allocObject();
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (_QWORD *)((char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, (uint64_t)v23);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v19 + 16))(v18);
  v20 = sub_2291B5B34(a1, *v14, (uint64_t)v18, a4, v11);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  return v20;
}

uint64_t sub_2291B5B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  __int128 v14[2];
  _QWORD __src[12];
  _QWORD v16[5];
  _QWORD v17[5];

  v17[3] = sub_2291C37D0();
  v17[4] = MEMORY[0x24BE97F18];
  swift_release();
  v17[0] = a4;
  v16[3] = &type metadata for ReferenceResolver;
  v16[4] = &off_24F1D9080;
  v9 = swift_allocObject();
  v16[0] = v9;
  v10 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v9 + 32) = v10;
  *(_QWORD *)(v9 + 48) = *(_QWORD *)(a3 + 32);
  sub_22911F698(a1, a5 + 16);
  sub_22911F698((uint64_t)v16, a5 + 152);
  sub_22911F698((uint64_t)v17, a5 + 192);
  sub_22911F698(a5 + 16, (uint64_t)__src);
  sub_22911F698(a5 + 192, (uint64_t)&__src[5]);
  v11 = (void *)sub_2291C46AC();
  LODWORD(a3) = MGGetSInt32Answer();

  LOBYTE(__src[11]) = (_DWORD)a3 == 1;
  sub_22911F698((uint64_t)__src, (uint64_t)v14);
  type metadata accessor for LocUtil();
  v12 = swift_allocObject();
  sub_22911F6D8(v14, v12 + 16);
  __src[10] = v12;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  memcpy((void *)(a5 + 56), __src, 0x59uLL);
  return a5;
}

void sub_2291B5CB8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void (*v18)(NSObject *, uint64_t);
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v34;
  uint8_t *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  void (*v61)(NSObject *, uint64_t);
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t, uint64_t);
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[4];
  uint64_t v68[5];
  _QWORD v69[3];
  ValueMetadata *v70;
  _UNKNOWN **v71;

  v5 = OUTLINED_FUNCTION_66();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = ((char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = ((char *)&v60 - v11);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = ((char *)&v60 - v14);
  MEMORY[0x24BDAC7A8](v13);
  v17 = ((char *)&v60 - v16);
  v70 = &type metadata for ReferenceResolver;
  v71 = &off_24F1D9080;
  v69[0] = OUTLINED_FUNCTION_7_16();
  sub_2291358C8(a2, v69[0] + 16);
  LOBYTE(v18) = 0;
  v19 = OUTLINED_FUNCTION_49_8();

  if (!v19)
  {
    OUTLINED_FUNCTION_42_5();
    v28 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    OUTLINED_FUNCTION_20_13();
    v30 = v29;
    objc_msgSend(a3, sel_setRequestedApplication_, v29);

  }
  sub_22912628C(v20, v21, v22, v23, v24, v25, v26, v27, v60, (uint64_t)v61, v62, (uint64_t)v63, (uint64_t)v64, v65, v66, v67[0], v67[1], v67[2], v67[3],
    v68[0]);
  if ((v31 & 1) != 0 || sub_229127504())
  {
    v64 = v15;
    if (qword_255A2A048 != -1)
      swift_once();
    v32 = __swift_project_value_buffer(v5, (uint64_t)qword_255A30028);
    v33 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v62 = v32;
    v63 = v33;
    OUTLINED_FUNCTION_44_2((uint64_t)v17, v32, v33);
    sub_2291C4520();
    v34 = OUTLINED_FUNCTION_51();
    if (OUTLINED_FUNCTION_55_6(v34))
    {
      v35 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v35 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v17, (os_log_type_t)v12, "LaunchAppConverter user referenced an app without name or verb only request", v35);
      OUTLINED_FUNCTION_2_0();
    }

    v18 = *(void (**)(NSObject *, uint64_t))(v6 + 8);
    v18(v17, v5);
    v36 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_40_9(MEMORY[0x24BEE4AF8]);
    sub_2291C3EB4();
    if (v68[3])
    {
      sub_229148680((uint64_t)v68, (uint64_t)v67);
      sub_2291C3E9C();
      if (OUTLINED_FUNCTION_5_20() || (sub_2291C3FC8(), (OUTLINED_FUNCTION_5_20() & 1) != 0))
      {
        swift_retain();
        sub_2291C3CA4();
        OUTLINED_FUNCTION_60_7();
        if (v65)
        {
          sub_2291C3D10();
          swift_release();
          __swift_project_boxed_opaque_existential_1Tm(v69, (uint64_t)v70);
          OUTLINED_FUNCTION_57_6();
          OUTLINED_FUNCTION_40_9(v37);
          swift_release();
        }
        OUTLINED_FUNCTION_60_7();
      }
      else
      {
        sub_2291C3EFC();
        if ((swift_dynamicCast() & 1) != 0)
        {
          swift_release();
          sub_2291C3F80();
          OUTLINED_FUNCTION_3();
          sub_2291C3F74();
          if (MEMORY[0x22E2C3AD0]())
          {
            __swift_project_boxed_opaque_existential_1Tm(v69, (uint64_t)v70);
            OUTLINED_FUNCTION_57_6();
            OUTLINED_FUNCTION_40_9(v57);
            swift_release();
            OUTLINED_FUNCTION_50_8();
          }
          else
          {
            OUTLINED_FUNCTION_44_2((uint64_t)v9, v62, v63);
            sub_2291C4520();
            v58 = OUTLINED_FUNCTION_85();
            if (OUTLINED_FUNCTION_55_6(v58))
            {
              v59 = (uint8_t *)OUTLINED_FUNCTION_11();
              v61 = v18;
              *(_WORD *)v59 = 0;
              OUTLINED_FUNCTION_39(&dword_229115000, v9, (os_log_type_t)v12, "Error building entity for reference resolution", v59);
              OUTLINED_FUNCTION_2_0();
            }

            OUTLINED_FUNCTION_50_8();
            v18(v9, v5);
          }
        }
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v67);
    }
    sub_2291B22AC((uint64_t)v68, &qword_255A2A878);
    sub_22919F7A4(a3);
    if (v38)
      v39 = v38;
    else
      v39 = v36;
    if ((unint64_t)v39 >> 62)
    {
      swift_bridgeObjectRetain();
      v40 = sub_2291C4B68();
      OUTLINED_FUNCTION_21();
    }
    else
    {
      v40 = *(_QWORD *)(((unint64_t)v39 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    OUTLINED_FUNCTION_21();
    v41 = (uint64_t)v64;
    if (!v40)
    {
      OUTLINED_FUNCTION_44_2((uint64_t)v64, v62, v63);
      OUTLINED_FUNCTION_28_8();
      v42 = OUTLINED_FUNCTION_85();
      if (OUTLINED_FUNCTION_109(v42))
      {
        v43 = (uint8_t *)OUTLINED_FUNCTION_11();
        *(_WORD *)v43 = 0;
        OUTLINED_FUNCTION_39(&dword_229115000, v39, (os_log_type_t)v18, "LaunchAppConverter unable to resolve app reference", v43);
        OUTLINED_FUNCTION_2_0();
      }

      v18(v41, v5);
    }
  }
  else
  {
    v44 = OUTLINED_FUNCTION_49_8();
    if (v44)
    {
      v45 = v44;
      sub_229123F4C();
      LOBYTE(v18) = v46;
      sub_2291B2D58(v47, v46, 0, 0, 0, 0);

      swift_bridgeObjectRelease();
    }
    v48 = __swift_project_boxed_opaque_existential_1Tm(v69, (uint64_t)&type metadata for ReferenceResolver);
    v49 = sub_2291482BC((uint64_t)v48);
    v50 = sub_2291874B8(v49);
    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_40_9(v50);
  }
  if (qword_255A2A048 != -1)
    swift_once();
  v51 = __swift_project_value_buffer(v5, (uint64_t)qword_255A30028);
  OUTLINED_FUNCTION_44_2((uint64_t)v12, v51, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
  v52 = a3;
  sub_2291C4520();
  v53 = OUTLINED_FUNCTION_51();
  if (OUTLINED_FUNCTION_42_10(v53))
  {
    v64 = v12;
    v54 = (uint8_t *)OUTLINED_FUNCTION_12();
    v68[0] = OUTLINED_FUNCTION_12();
    *(_DWORD *)v54 = 136315138;
    sub_22919F7A4(v52);
    if (v55)
    {
      sub_22917959C(v55);
      v55 = OUTLINED_FUNCTION_44_9();
    }
    v67[0] = OUTLINED_FUNCTION_51_8(v55, v56, v68);
    sub_2291C4940();

    OUTLINED_FUNCTION_14_6();
    OUTLINED_FUNCTION_81(&dword_229115000, v12, (os_log_type_t)v18, "LaunchAppConverter suggestedApplications: %s", v54);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_2_0();
  }

  OUTLINED_FUNCTION_64_0((uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v69);
  OUTLINED_FUNCTION_54_0();
}

void sub_2291B634C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];

  v5 = OUTLINED_FUNCTION_66();
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  v14[3] = &type metadata for ReferenceResolver;
  v14[4] = &off_24F1D9080;
  v14[0] = OUTLINED_FUNCTION_7_16();
  sub_2291358C8(a2, v14[0] + 16);
  v7 = OUTLINED_FUNCTION_44_5();

  if (!v7)
  {
    OUTLINED_FUNCTION_42_5();
    v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    OUTLINED_FUNCTION_20_13();
    v10 = v9;
    objc_msgSend(a3, sel_setRequestedApplication_, v9);

  }
  v11 = OUTLINED_FUNCTION_44_5();
  if (v11)
  {
    v12 = v11;
    sub_2291B2AA0();

  }
  if ((sub_22919562C() & 1) != 0)
  {
    if (qword_255A2A078 != -1)
      swift_once();
    type metadata accessor for AppLaunchIntent();
    sub_22911F7AC((unint64_t *)&qword_255A2CD60, 255, (uint64_t (*)(uint64_t))type metadata accessor for AppLaunchIntent, (uint64_t)&unk_2291CBB28);
    sub_2291C3E78();
    __asm { BR              X10 }
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291B6804()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_7_24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 120))(a1, a2, v2);
}

void OUTLINED_FUNCTION_40_9(uint64_t a1)
{
  void *v1;

  sub_229189290(a1, v1);
}

uint64_t OUTLINED_FUNCTION_41_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v1, v0);
}

BOOL OUTLINED_FUNCTION_42_10(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_44_9()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_49_8()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 603));
}

uint64_t OUTLINED_FUNCTION_50_8()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_51_8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_22913EFA8(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_54_7()
{
  return sub_2291C3674();
}

void OUTLINED_FUNCTION_57_6()
{
  sub_229137478();
}

uint64_t OUTLINED_FUNCTION_58_5@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

uint64_t OUTLINED_FUNCTION_60_7()
{
  return swift_release();
}

uint64_t sub_2291B68AC()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v0 = sub_2291C413C();
  result = sub_2291B6B28(6, v0);
  v5 = v4 >> 1;
  v6 = (v4 >> 1) - v3;
  if (__OFSUB__(v4 >> 1, v3))
    goto LABEL_20;
  if (v6)
  {
    v7 = v2;
    v8 = v3;
    v18 = MEMORY[0x24BEE4AF8];
    result = (uint64_t)sub_22919F2BC(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0)
    {
LABEL_21:
      __break(1u);
      return result;
    }
    v9 = v18;
    while (v8 < v5)
    {
      v10 = *(__int16 *)(v7 + 2 * v8);
      v12 = *(_QWORD *)(v18 + 16);
      v11 = *(_QWORD *)(v18 + 24);
      if (v12 >= v11 >> 1)
        result = (uint64_t)sub_22919F2BC((char *)(v11 > 1), v12 + 1, 1);
      *(_QWORD *)(v18 + 16) = v12 + 1;
      *(_QWORD *)(v18 + 8 * v12 + 32) = v10;
      if (v5 == ++v8)
      {
        result = swift_unknownObjectRelease();
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
  result = swift_unknownObjectRelease();
  v9 = MEMORY[0x24BEE4AF8];
LABEL_11:
  v13 = *(_QWORD *)(v9 + 16);
  if (v13)
  {
    v14 = 0;
    v15 = (uint64_t *)(v9 + 32);
    while (1)
    {
      v16 = *v15++;
      v17 = __OFADD__(v14, v16);
      v14 += v16;
      if (v17)
        break;
      if (!--v13)
        goto LABEL_17;
    }
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v14 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2291B6A00()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v0 = sub_2291C413C();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_22919F2BC(0, v1, 0);
    v2 = 0;
    v3 = v13;
    v4 = *(_QWORD *)(v13 + 16);
    do
    {
      v5 = *(__int16 *)(v0 + 2 * v2 + 32);
      v6 = *(_QWORD *)(v13 + 24);
      if (v4 >= v6 >> 1)
        sub_22919F2BC((char *)(v6 > 1), v4 + 1, 1);
      ++v2;
      *(_QWORD *)(v13 + 16) = v4 + 1;
      *(_QWORD *)(v13 + 8 * v4++ + 32) = v5;
    }
    while (v1 != v2);
    result = swift_bridgeObjectRelease();
  }
  else
  {
    result = swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
  }
  v8 = *(_QWORD *)(v3 + 16);
  if (v8)
  {
    v9 = 0;
    v10 = (uint64_t *)(v3 + 32);
    while (1)
    {
      v11 = *v10++;
      v12 = __OFADD__(v9, v11);
      v9 += v11;
      if (v12)
        break;
      if (!--v8)
        goto LABEL_14;
    }
    __break(1u);
  }
  else
  {
    v9 = 0;
LABEL_14:
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t sub_2291B6B28(uint64_t result, uint64_t a2)
{
  unint64_t v3;
  char v4;
  unint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_2291B6B94(0, result, v3);
  if ((v4 & 1) != 0)
    v5 = v3;
  else
    v5 = result;
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_9;
  if (v3 >= v5)
    return a2;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_2291B6B94(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

ValueMetadata *type metadata accessor for CoreDuetKnowledgeStore()
{
  return &type metadata for CoreDuetKnowledgeStore;
}

id sub_2291B6BF0(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1B0B0]), sel_init);
  v7[0] = 0;
  v3 = objc_msgSend(v2, sel_executeQuery_error_, a1, v7);

  if (v3)
  {
    v4 = v7[0];
  }
  else
  {
    v5 = v7[0];
    sub_2291C2C0C();

    swift_willThrow();
  }
  return v3;
}

id sub_2291B6CC8(uint64_t a1)
{
  return sub_2291B6BF0(a1);
}

uint64_t sub_2291B6CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = sub_2291C2DBC();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_18_2();
  v1 = sub_2291C2F90();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_18_2();
  v2 = sub_2291C2EF4();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_18_2();
  (*(void (**)(uint64_t, _QWORD))(v5 + 104))(v4 - v3, *MEMORY[0x24BE702B8]);
  sub_2291C2E1C();
  sub_22912E074(&qword_255A2F8B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE703D8], MEMORY[0x24BE703D0]);
  sub_2291C4328();
  sub_2291C2E40();
  sub_22912E074(&qword_255A2F8C0, (uint64_t (*)(uint64_t))MEMORY[0x24BE70060], MEMORY[0x24BE70058]);
  sub_2291C4328();
  return sub_2291C2E4C();
}

uint64_t sub_2291B6EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v13 = sub_2291C3050();
  MEMORY[0x24BDAC7A8](v13);
  sub_2291B6F9C(a2, a3, a4, a5, a6, a7, (uint64_t)&v16 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_2291C2F84();
}

uint64_t sub_2291B6F7C(uint64_t a1)
{
  uint64_t *v1;

  return sub_2291B6EBC(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_2291B6F9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v23 = a6;
  v22 = a5;
  v27 = a7;
  v11 = sub_2291C2E10();
  v26 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2291C2FA8();
  v25 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2291C2EE8();
  v24 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = a1;
  v38 = a2;
  sub_22912E074(&qword_255A2F8E8, v20, MEMORY[0x24BE70270]);
  sub_2291C4328();
  v35 = a3;
  v36 = a4;
  sub_22912E074(&qword_255A2F8F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE703F0], MEMORY[0x24BE703E8]);
  sub_2291C4328();
  v31 = v22;
  v32 = v23;
  v33 = a3;
  v34 = a4;
  sub_22912E074(&qword_255A2F8F8, (uint64_t (*)(uint64_t))MEMORY[0x24BE70150], MEMORY[0x24BE70138]);
  sub_2291C4328();
  sub_2291C3050();
  v28 = v19;
  v29 = v16;
  v30 = v13;
  sub_22912E074(&qword_255A2F900, (uint64_t (*)(uint64_t))MEMORY[0x24BE70C10], MEMORY[0x24BE70BE8]);
  sub_2291C4328();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v19, v17);
}

uint64_t sub_2291B7234()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F940);
  sub_2291C2E94();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE70220];
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2291C5A70;
  sub_22912E074(&qword_255A2F948, v0, MEMORY[0x24BE70218]);
  sub_2291C4328();
  return sub_2291C2E88();
}

uint64_t sub_2291B732C()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F950);
  sub_2291C2F0C();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE70300];
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2291C5A70;
  sub_22912E074(&qword_255A2F958, v0, MEMORY[0x24BE702F0]);
  sub_2291C4328();
  return sub_2291C2E88();
}

uint64_t sub_2291B7424()
{
  swift_bridgeObjectRetain();
  return sub_2291C2F00();
}

uint64_t sub_2291B7470()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F910);
  sub_2291C2F24();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE70320];
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2291C5A70;
  sub_22912E074(&qword_255A2F918, v0, MEMORY[0x24BE70318]);
  sub_2291C4328();
  return sub_2291C2F9C();
}

uint64_t sub_2291B7568()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_2291C2ED0();
  MEMORY[0x24BDAC7A8](v0);
  sub_22912E074(&qword_255A2F920, v1, MEMORY[0x24BE70250]);
  sub_2291C4328();
  return sub_2291C2F18();
}

uint64_t sub_2291B7638()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F928);
  sub_2291C2E7C();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE70200];
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2291C5A70;
  sub_22912E074(&qword_255A2F930, v0, MEMORY[0x24BE701F0]);
  sub_2291C4328();
  return sub_2291C2EC4();
}

uint64_t sub_2291B7730()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_2291C2EB8();
  MEMORY[0x24BDAC7A8](v0);
  sub_22912E074(&qword_255A2F938, v1, MEMORY[0x24BE70238]);
  sub_2291C4328();
  return sub_2291C2E70();
}

uint64_t sub_2291B7800()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_2291C2E64();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2291C2EAC();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BE701C0], v0);
  return sub_2291C2EA0();
}

uint64_t sub_2291B78B8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_2291C2F60();
  MEMORY[0x24BDAC7A8](v0);
  sub_22912E074(&qword_255A2F908, v1, MEMORY[0x24BE70358]);
  sub_2291C4328();
  return sub_2291C2DE0();
}

uint64_t sub_2291B799C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unsigned int *v8;
  uint64_t v10;

  v4 = sub_2291C2F30();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2291C2F3C();
  if (a3)
    v8 = (unsigned int *)MEMORY[0x24BE70330];
  else
    v8 = (unsigned int *)MEMORY[0x24BE70338];
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v8, v4);
  sub_2291C2F48();
  return sub_2291C2F54();
}

uint64_t sub_2291B7A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v17;
  uint64_t v18;

  v17 = a3;
  v18 = a4;
  v5 = sub_2291C2E10();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2291C2FA8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2291C2EE8();
  MEMORY[0x24BDAC7A8](v13);
  (*(void (**)(char *, uint64_t))(v15 + 16))((char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  sub_2291C3020();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v17, v9);
  sub_2291C3044();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v18, v5);
  return sub_2291C3038();
}

uint64_t sub_2291B7BDC()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_2291C2FFC();
  MEMORY[0x24BDAC7A8](v0);
  sub_22912E074(&qword_255A2F8C8, v1, MEMORY[0x24BE70578]);
  sub_2291C4328();
  return sub_2291C2DB0();
}

uint64_t sub_2291B7CAC()
{
  return sub_2291B7BDC();
}

uint64_t sub_2291B7CC4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_2291C2DD4();
  MEMORY[0x24BDAC7A8](v0);
  sub_22912E074(&qword_255A2F8D0, v1, MEMORY[0x24BE70068]);
  sub_2291C4328();
  return sub_2291C2FF0();
}

uint64_t sub_2291B7D94()
{
  return sub_2291B7CC4();
}

uint64_t sub_2291B7DAC()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F8D8);
  sub_2291C2DA4();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE6FFD8];
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2291C5A70;
  sub_22912E074(&qword_255A2F8E0, v0, MEMORY[0x24BE6FFC0]);
  sub_2291C4328();
  return sub_2291C2DC8();
}

uint64_t sub_2291B7EA4()
{
  return sub_2291B7DAC();
}

uint64_t sub_2291B7EBC()
{
  swift_bridgeObjectRetain();
  return sub_2291C2D98();
}

uint64_t sub_2291B7F08()
{
  return sub_2291B7EBC();
}

uint64_t sub_2291B7F20()
{
  return sub_2291B7234();
}

uint64_t sub_2291B7F38()
{
  return sub_2291B7470();
}

uint64_t sub_2291B7F50()
{
  return sub_2291B78B8();
}

uint64_t sub_2291B7F6C(uint64_t a1)
{
  uint64_t *v1;

  return sub_2291B7A90(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2291B7F88(uint64_t a1)
{
  uint64_t v1;

  return sub_2291B799C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2291B7FA4()
{
  return sub_2291B7568();
}

uint64_t sub_2291B7FBC()
{
  return sub_2291B7638();
}

uint64_t sub_2291B7FD4()
{
  return sub_2291B7730();
}

uint64_t sub_2291B7FEC()
{
  return sub_2291B7800();
}

uint64_t sub_2291B8004()
{
  return sub_2291B732C();
}

uint64_t sub_2291B801C()
{
  return sub_2291B7424();
}

unint64_t static BundleIDs.appStore.getter()
{
  return 0xD000000000000012;
}

ValueMetadata *type metadata accessor for BundleIDs()
{
  return &type metadata for BundleIDs;
}

uint64_t destroy for AppsSearcher(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);
  if (*(_QWORD *)(a1 + 104))
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
}

uint64_t initializeWithCopy for AppsSearcher(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  v6 = (_OWORD *)(a1 + 80);
  v7 = (_OWORD *)(a2 + 80);
  v8 = *(_QWORD *)(a2 + 104);
  if (v8)
  {
    v9 = *(_QWORD *)(a2 + 112);
    *(_QWORD *)(a1 + 104) = v8;
    *(_QWORD *)(a1 + 112) = v9;
    (**(void (***)(_OWORD *, _OWORD *))(v8 - 8))(v6, v7);
  }
  else
  {
    v10 = *(_OWORD *)(a2 + 96);
    *v6 = *v7;
    *(_OWORD *)(a1 + 96) = v10;
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  }
  v11 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 120, a2 + 120);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  return a1;
}

uint64_t assignWithCopy for AppsSearcher(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)(a2 + 40));
  v4 = *(_QWORD *)(a2 + 104);
  if (!*(_QWORD *)(a1 + 104))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 104) = v4;
      *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 80, a2 + 80);
      goto LABEL_8;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 80);
    v6 = *(_OWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 80) = v5;
    *(_OWORD *)(a1 + 96) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)(a2 + 80));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)(a2 + 120));
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  return a1;
}

void *__swift_memcpy168_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA8uLL);
}

uint64_t assignWithTake for AppsSearcher(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 104))
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v6 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for AppsSearcher(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 168))
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

uint64_t storeEnumTagSinglePayload for AppsSearcher(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
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
      *(_BYTE *)(result + 168) = 1;
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
    *(_BYTE *)(result + 168) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppsSearcher()
{
  return &type metadata for AppsSearcher;
}

uint64_t sub_2291B8374@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;
  __int128 v14[2];

  *(_QWORD *)(a5 + 160) = a4;
  sub_22912F100((uint64_t)a1, a5);
  sub_22912F100((uint64_t)a1, (uint64_t)v14);
  v10 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  sub_22917BCD8(v10);
  *(_QWORD *)(a5 + 64) = type metadata accessor for RegexAppsResolver();
  *(_QWORD *)(a5 + 72) = &off_24F1D9968;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(a5 + 40));
  sub_2291501C4((uint64_t)v14, (uint64_t)boxed_opaque_existential_1);
  if (*(_QWORD *)(a2 + 24))
  {
    sub_22911F6D8((__int128 *)a2, (uint64_t)v14);
    *(_QWORD *)(a5 + 104) = &type metadata for AceAppResolver;
    *(_QWORD *)(a5 + 112) = &off_24F1DA660;
    v12 = swift_allocObject();
    *(_QWORD *)(a5 + 80) = v12;
    sub_22911F6D8(v14, v12 + 56);
    sub_22911F6D8(a1, v12 + 16);
    *(_QWORD *)(v12 + 96) = a4;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    sub_22912250C(a2, &qword_255A2DC10);
    *(_QWORD *)(a5 + 112) = 0;
    *(_OWORD *)(a5 + 80) = 0u;
    *(_OWORD *)(a5 + 96) = 0u;
  }
  return sub_22911F6D8(a3, a5 + 120);
}

uint64_t sub_2291B84D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v6 + 200) = a4;
  *(_QWORD *)(v6 + 208) = v5;
  *(_BYTE *)(v6 + 576) = a5;
  *(_QWORD *)(v6 + 184) = a2;
  *(_QWORD *)(v6 + 192) = a3;
  *(_QWORD *)(v6 + 176) = a1;
  v7 = sub_2291C44E4();
  *(_QWORD *)(v6 + 216) = v7;
  *(_QWORD *)(v6 + 224) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 232) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 240) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 248) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 256) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 264) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 272) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 280) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 288) = OUTLINED_FUNCTION_25();
  v8 = sub_2291C44B4();
  *(_QWORD *)(v6 + 296) = v8;
  *(_QWORD *)(v6 + 304) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 312) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 320) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 328) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 336) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 344) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 352) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 360) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 368) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 376) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 384) = OUTLINED_FUNCTION_25();
  v9 = sub_2291C44D8();
  *(_QWORD *)(v6 + 392) = v9;
  *(_QWORD *)(v6 + 400) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v6 + 408) = swift_task_alloc();
  v10 = sub_2291C4538();
  *(_QWORD *)(v6 + 416) = v10;
  *(_QWORD *)(v6 + 424) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v6 + 432) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 440) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 448) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 456) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 464) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 472) = OUTLINED_FUNCTION_25();
  *(_QWORD *)(v6 + 480) = OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B865C()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4);
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_signpost_type_t v21;
  uint8_t *v22;
  os_signpost_id_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
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
  os_log_type_t v51;
  uint8_t *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t (*v58)(uint64_t);
  uint64_t v59;
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
  void (*v74)(uint64_t);
  uint64_t v75;

  if (qword_255A2A050 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 480);
  v2 = *(_QWORD *)(v0 + 424);
  v3 = __swift_project_value_buffer(*(_QWORD *)(v0 + 416), (uint64_t)qword_255A30040);
  *(_QWORD *)(v0 + 488) = v3;
  v4 = *(void (**))(v2 + 16);
  *(_QWORD *)(v0 + 496) = v4;
  v73 = v3;
  v4(v1);
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_102();
  sub_2291C4520();
  v5 = OUTLINED_FUNCTION_51();
  v6 = os_log_type_enabled(v1, v5);
  v7 = *(_QWORD *)(v0 + 424);
  if (v6)
  {
    v8 = *(_QWORD *)(v0 + 176);
    v9 = *(_QWORD *)(v0 + 184);
    v64 = *(_QWORD *)(v0 + 192);
    v66 = *(_QWORD *)(v0 + 200);
    v10 = OUTLINED_FUNCTION_12();
    v75 = OUTLINED_FUNCTION_12();
    *(_DWORD *)v10 = 136315394;
    *(_QWORD *)(v0 + 112) = v8;
    *(_QWORD *)(v0 + 120) = v9;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A2DCA8);
    v11 = sub_2291C46D0();
    *(_QWORD *)(v0 + 152) = sub_22913EFA8(v11, v12, &v75);
    sub_2291C4940();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42_1();
    *(_WORD *)(v10 + 12) = 2080;
    *(_QWORD *)(v0 + 96) = v64;
    *(_QWORD *)(v0 + 104) = v66;
    swift_bridgeObjectRetain();
    v13 = sub_2291C46D0();
    *(_QWORD *)(v0 + 168) = sub_22913EFA8(v13, v14, &v75);
    sub_2291C4940();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42_1();
    _os_log_impl(&dword_229115000, v1, v5, "AppsSearcher.searchApps with appName: %s and appID: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
  }
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_42_1();

  v15 = *(void (**)(uint64_t))(v7 + 8);
  v16 = OUTLINED_FUNCTION_132();
  v15(v16);
  v74 = v15;
  *(_QWORD *)(v0 + 504) = v15;
  if (qword_255A2A008 != -1)
    swift_once();
  v17 = *(_QWORD *)(v0 + 472);
  v18 = *(_QWORD *)(v0 + 416);
  v19 = __swift_project_value_buffer(v18, (uint64_t)qword_255A2FFB0);
  ((void (*)(uint64_t, uint64_t, uint64_t))v4)(v17, v19, v18);
  sub_2291C44C0();
  sub_2291C44A8();
  v20 = sub_2291C44CC();
  v21 = sub_2291C48D4();
  if ((sub_2291C491C() & 1) != 0)
  {
    v22 = (uint8_t *)OUTLINED_FUNCTION_12();
    *(_WORD *)v22 = 0;
    v23 = sub_2291C449C();
    _os_signpost_emit_with_name_impl(&dword_229115000, v20, v21, v23, "appsSearcherSearchApps", "", v22, 2u);
    OUTLINED_FUNCTION_2_0();
  }
  v25 = *(_QWORD *)(v0 + 376);
  v24 = *(_QWORD *)(v0 + 384);
  v26 = *(_QWORD *)(v0 + 296);
  v27 = *(_QWORD *)(v0 + 304);
  v28 = *(_QWORD *)(v0 + 208);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v25, v24, v26);
  sub_2291C4508();
  swift_allocObject();
  *(_QWORD *)(v0 + 512) = sub_2291C44FC();
  v29 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  *(_QWORD *)(v0 + 520) = v29;
  v29(v24, v26);
  sub_2291B9B70(v28 + 80, v0 + 56);
  v30 = *(NSObject **)(v0 + 416);
  if (*(_QWORD *)(v0 + 80))
  {
    v31 = sub_22911F6D8((__int128 *)(v0 + 56), v0 + 16);
    OUTLINED_FUNCTION_42_11(v31, v32, v33, v34, v35, v36, v37, v38, v61, v62, v63, v65, v67, v68, v69, v70, v71, v72, v73);
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_62_7();
    v39 = OUTLINED_FUNCTION_51();
    if (os_log_type_enabled(v30, v39))
    {
      v40 = (uint8_t *)OUTLINED_FUNCTION_12();
      v75 = OUTLINED_FUNCTION_12();
      *(_DWORD *)v40 = 136315138;
      v41 = swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 136) = OUTLINED_FUNCTION_64_5(v41, v42, &v75);
      sub_2291C4940();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_42_1();
      _os_log_impl(&dword_229115000, v30, v39, "AppsSearcher.searchApps aceAppsResolver is available, performing on device app search based on %s", v40, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_0();
    }
    OUTLINED_FUNCTION_42_1();

    v59 = OUTLINED_FUNCTION_132();
    v74(v59);
    v55 = *(_QWORD *)(v0 + 40);
    v56 = *(_QWORD *)(v0 + 48);
    v57 = (_QWORD *)OUTLINED_FUNCTION_13_21((_QWORD *)(v0 + 16));
    *(_QWORD *)(v0 + 528) = v57;
    v58 = sub_2291B8C7C;
  }
  else
  {
    v43 = sub_22912250C(v0 + 56, &qword_255A2F968);
    OUTLINED_FUNCTION_42_11(v43, v44, v45, v46, v47, v48, v49, v50, v61, v62, v63, v65, v67, v68, v69, v70, v71, v72, v73);
    OUTLINED_FUNCTION_62_7();
    v51 = OUTLINED_FUNCTION_51();
    if (os_log_type_enabled(v30, v51))
    {
      v52 = (uint8_t *)OUTLINED_FUNCTION_12();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_229115000, v30, v51, "AppsSearcher.searchApps falling back to regexAppsResolver", v52, 2u);
      OUTLINED_FUNCTION_2_0();
    }
    v53 = *(_QWORD **)(v0 + 208);

    v54 = OUTLINED_FUNCTION_132();
    v74(v54);
    v55 = v53[8];
    v56 = v53[9];
    v57 = (_QWORD *)OUTLINED_FUNCTION_13_21(v53 + 5);
    *(_QWORD *)(v0 + 552) = v57;
    v58 = sub_2291B8EF4;
  }
  *v57 = v0;
  v57[1] = v58;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v74)(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200), v55, v56);
}

uint64_t sub_2291B8C7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 536) = a1;
  *(_QWORD *)(v3 + 544) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B8CE4()
{
  os_signpost_type_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  _WORD *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_32_11();
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  v3 = sub_2291C44CC();
  OUTLINED_FUNCTION_10_19();
  sub_2291C48C8();
  if ((OUTLINED_FUNCTION_56_5() & 1) != 0)
  {
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_57_7();
    OUTLINED_FUNCTION_10_0();
    if (OUTLINED_FUNCTION_12_18() != *MEMORY[0x24BEE7810])
      OUTLINED_FUNCTION_23_17(*(_QWORD *)(v1 + 288));
    v5 = (_WORD *)OUTLINED_FUNCTION_12();
    v6 = OUTLINED_FUNCTION_22_14(v5);
    OUTLINED_FUNCTION_17_12(&dword_229115000, v3, v0, v6, "appsSearcherSearchApps");
    OUTLINED_FUNCTION_2_0();
  }
  v4 = *(_QWORD *)(v1 + 368);
  v14 = *(_QWORD *)(v1 + 536);
  v7 = v3;
  v8 = *(void (**)(uint64_t, uint64_t))(v1 + 520);
  v9 = *(_QWORD *)(v1 + 400);
  v10 = *(_QWORD *)(v1 + 408);
  v11 = *(_QWORD *)(v1 + 392);
  v12 = *(_QWORD *)(v1 + 296);
  OUTLINED_FUNCTION_2_20(v7);
  v8(v4, v12);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  OUTLINED_FUNCTION_16();
  swift_task_dealloc();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_73();
  swift_task_dealloc();
  OUTLINED_FUNCTION_108_1();
  OUTLINED_FUNCTION_106_1();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_104_1();
  OUTLINED_FUNCTION_103_1();
  OUTLINED_FUNCTION_93_1();
  OUTLINED_FUNCTION_102_1();
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_100_1();
  OUTLINED_FUNCTION_45_8();
  OUTLINED_FUNCTION_44_10();
  OUTLINED_FUNCTION_43_8();
  OUTLINED_FUNCTION_41_10();
  OUTLINED_FUNCTION_40_10();
  OUTLINED_FUNCTION_38_11();
  OUTLINED_FUNCTION_37_12();
  OUTLINED_FUNCTION_36_11();
  OUTLINED_FUNCTION_61_6();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v14);
}

uint64_t sub_2291B8EF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 560) = a1;
  *(_QWORD *)(v3 + 568) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291B8F5C()
{
  uint64_t v0;
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v2;
  void *v3;
  os_log_type_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  os_log_type_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  __n128 *v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  os_log_type_t v38;
  _QWORD *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  __n128 *v50;
  const char *v51;
  uint8_t *v52;
  os_signpost_id_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (**v60)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t (**v64)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v3 = *(void **)(v0 + 560);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 496))(*(_QWORD *)(v0 + 448), *(_QWORD *)(v0 + 488), *(_QWORD *)(v0 + 416));
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_62_7();
  v4 = OUTLINED_FUNCTION_51();
  if (OUTLINED_FUNCTION_109(v4))
  {
    v5 = (_DWORD *)OUTLINED_FUNCTION_12();
    v64 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))OUTLINED_FUNCTION_12();
    *v5 = 136315138;
    v6 = type metadata accessor for Application();
    v7 = swift_bridgeObjectRetain();
    MEMORY[0x22E2C4388](v7, v6);
    v8 = swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 128) = OUTLINED_FUNCTION_64_5(v8, v9, (uint64_t *)&v64);
    sub_2291C4940();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_42_1();
    OUTLINED_FUNCTION_9_22(&dword_229115000, v10, v11, "AppsSearcher.searchApps via regex found apps: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
  }
  v12 = *(void (**)(uint64_t))(v0 + 504);
  OUTLINED_FUNCTION_42_1();

  v13 = OUTLINED_FUNCTION_132();
  v12(v13);
  v14 = *(_QWORD *)(v0 + 560);
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_2291C4B68();
    swift_bridgeObjectRelease();
    if (v15)
      goto LABEL_13;
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v15)
      goto LABEL_13;
  }
  v16 = *(_QWORD *)(v0 + 200);
  if (v16)
  {
    v17 = *(_QWORD **)(v0 + 208);
    v18 = *(_QWORD *)(v0 + 192);
    v19 = v17[3];
    v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v17[4];
    __swift_project_boxed_opaque_existential_1Tm(v17, v19);
    v20 = v1[2](v18, v16, v17[20], v19, v1);
    if (v20)
    {
      v21 = (void *)v20;
      v22 = *(void **)(v0 + 488);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_28_14();
      v23 = v21;
      OUTLINED_FUNCTION_60_8();
      v24 = OUTLINED_FUNCTION_51();
      if (OUTLINED_FUNCTION_109(v24))
      {
        OUTLINED_FUNCTION_12();
        v62 = v1;
        v25 = (_QWORD *)OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_55_8(5.7779e-34);
        *(_QWORD *)(v0 + 144) = v26;
        v27 = v62;
        OUTLINED_FUNCTION_19_17();
        *v25 = v21;

        OUTLINED_FUNCTION_9_22(&dword_229115000, v28, v29, "AppsSearcher.searchApps via bundleId found app: %@");
        __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
        OUTLINED_FUNCTION_27_13();
        OUTLINED_FUNCTION_2_0();
      }

      v30 = (uint64_t *)(v0 + 360);
      v15 = *(_QWORD *)(v0 + 360);
      (*(void (**)(_QWORD, _QWORD))(v0 + 504))(*(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 416));
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
      v31 = (__n128 *)OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_20_20(v31, (__n128)xmmword_2291C5A50);
      v2 = OUTLINED_FUNCTION_53_8();
      OUTLINED_FUNCTION_10_19();
      sub_2291C48C8();
      if ((OUTLINED_FUNCTION_8_20() & 1) != 0)
      {
        OUTLINED_FUNCTION_65_0();
        OUTLINED_FUNCTION_49_9();
        OUTLINED_FUNCTION_10_0();
        if (OUTLINED_FUNCTION_7_25() != *MEMORY[0x24BEE7810])
        {
          v32 = (uint64_t *)(v0 + 280);
LABEL_33:
          OUTLINED_FUNCTION_23_17(*v32);
          v51 = "";
LABEL_34:
          v52 = (uint8_t *)OUTLINED_FUNCTION_12();
          *(_WORD *)v52 = 0;
          v53 = sub_2291C449C();
          _os_signpost_emit_with_name_impl(&dword_229115000, v2, (os_signpost_type_t)v15, v53, "appsSearcherSearchApps", v51, v52, 2u);
          OUTLINED_FUNCTION_2_0();
        }
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
LABEL_13:
  if (*(_BYTE *)(v0 + 576) != 1)
  {
    OUTLINED_FUNCTION_32_11();
    sub_2291C44CC();
    OUTLINED_FUNCTION_39_9();
    sub_2291C48C8();
    if ((OUTLINED_FUNCTION_8_20() & 1) != 0)
    {
      v32 = (uint64_t *)(v0 + 248);
      v44 = *(_QWORD *)(v0 + 248);
      v45 = *(_QWORD *)(v0 + 216);
      v46 = *(_QWORD *)(v0 + 224);
      swift_retain();
      sub_2291C4514();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v46 + 88))(v44, v45) != *MEMORY[0x24BEE7810])
        goto LABEL_33;
      goto LABEL_29;
    }
    v60 = *(uint64_t (***)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v0 + 560);
    v47 = *(_QWORD *)(v0 + 328);
    goto LABEL_31;
  }
  v33 = *(_QWORD *)(v0 + 560);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)(v0 + 208) + 120), *(_QWORD *)(*(_QWORD *)(v0 + 208) + 144));
  v34 = sub_22915F438(v33);
  if (v34)
  {
    v35 = (void *)v34;
    v36 = *(void **)(v0 + 488);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_28_14();
    v37 = v35;
    OUTLINED_FUNCTION_60_8();
    v38 = OUTLINED_FUNCTION_51();
    if (OUTLINED_FUNCTION_109(v38))
    {
      OUTLINED_FUNCTION_12();
      v63 = v1;
      v39 = (_QWORD *)OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_55_8(5.7779e-34);
      *(_QWORD *)(v0 + 160) = v40;
      v41 = v63;
      OUTLINED_FUNCTION_19_17();
      *v39 = v35;

      OUTLINED_FUNCTION_9_22(&dword_229115000, v42, v43, "AppsSearcher.searchApps selected single app of: %@");
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A2A848);
      OUTLINED_FUNCTION_27_13();
      OUTLINED_FUNCTION_2_0();
    }

    v30 = (uint64_t *)(v0 + 352);
    v15 = *(_QWORD *)(v0 + 352);
    (*(void (**)(_QWORD, _QWORD))(v0 + 504))(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 416));
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v50 = (__n128 *)OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_20_20(v50, (__n128)xmmword_2291C5A50);
    v2 = OUTLINED_FUNCTION_53_8();
    OUTLINED_FUNCTION_10_19();
    sub_2291C48C8();
    if ((OUTLINED_FUNCTION_8_20() & 1) != 0)
    {
      OUTLINED_FUNCTION_65_0();
      OUTLINED_FUNCTION_49_9();
      OUTLINED_FUNCTION_10_0();
      if (OUTLINED_FUNCTION_7_25() != *MEMORY[0x24BEE7810])
      {
        v32 = (uint64_t *)(v0 + 272);
        goto LABEL_33;
      }
      goto LABEL_29;
    }
LABEL_30:
    v60 = v1;
    v47 = *v30;
LABEL_31:
    v61 = v47;
    goto LABEL_35;
  }
  if (v15)
  {
    sub_22917BBF8(0, (v14 & 0xC000000000000001) == 0, *(_QWORD *)(v0 + 560));
    if ((v14 & 0xC000000000000001) != 0)
      v48 = (id)MEMORY[0x22E2C4694](0, *(_QWORD *)(v0 + 560));
    else
      v48 = *(id *)(*(_QWORD *)(v0 + 560) + 32);
    v15 = *(_QWORD *)(v0 + 408);
    v30 = (uint64_t *)(v0 + 344);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v49 = OUTLINED_FUNCTION_14();
    *(_OWORD *)(v49 + 16) = xmmword_2291C5A50;
    *(_QWORD *)(v49 + 32) = v48;
    v64 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v49;
    sub_2291C4790();
    v1 = v64;
    v2 = sub_2291C44CC();
    sub_2291C44F0();
    sub_2291C48C8();
    if ((OUTLINED_FUNCTION_8_20() & 1) != 0)
    {
      OUTLINED_FUNCTION_65_0();
      OUTLINED_FUNCTION_49_9();
      OUTLINED_FUNCTION_10_0();
      if (OUTLINED_FUNCTION_7_25() != *MEMORY[0x24BEE7810])
      {
        v32 = (uint64_t *)(v0 + 264);
        goto LABEL_33;
      }
LABEL_29:
      v51 = "[Error] Interval already ended";
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_32_11();
  swift_bridgeObjectRelease();
  sub_2291C44CC();
  OUTLINED_FUNCTION_39_9();
  sub_2291C48C8();
  if ((OUTLINED_FUNCTION_8_20() & 1) != 0)
  {
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_49_9();
    OUTLINED_FUNCTION_10_0();
    if (OUTLINED_FUNCTION_7_25() != *MEMORY[0x24BEE7810])
    {
      v32 = (uint64_t *)(v0 + 256);
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  v61 = *(_QWORD *)(v0 + 336);
  v60 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x24BEE4AF8];
LABEL_35:
  v54 = *(void (**)(uint64_t, uint64_t))(v0 + 520);
  v55 = *(_QWORD *)(v0 + 400);
  v56 = *(_QWORD *)(v0 + 408);
  v57 = *(_QWORD *)(v0 + 392);
  v58 = *(_QWORD *)(v0 + 296);

  v54(v61, v58);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v56, v57);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_73();
  swift_task_dealloc();
  OUTLINED_FUNCTION_108_1();
  OUTLINED_FUNCTION_106_1();
  OUTLINED_FUNCTION_104_1();
  OUTLINED_FUNCTION_103_1();
  OUTLINED_FUNCTION_93_1();
  OUTLINED_FUNCTION_102_1();
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_100_1();
  OUTLINED_FUNCTION_45_8();
  OUTLINED_FUNCTION_44_10();
  OUTLINED_FUNCTION_43_8();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_41_10();
  OUTLINED_FUNCTION_40_10();
  OUTLINED_FUNCTION_38_11();
  OUTLINED_FUNCTION_37_12();
  OUTLINED_FUNCTION_36_11();
  return (*(uint64_t (**)(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)))(v0 + 8))(v60);
}

uint64_t sub_2291B9824()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_signpost_type_t v3;
  uint64_t v4;
  os_signpost_id_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_32_11();
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  v2 = sub_2291C44CC();
  OUTLINED_FUNCTION_10_19();
  v3 = sub_2291C48C8();
  if ((sub_2291C491C() & 1) != 0)
  {
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_57_7();
    OUTLINED_FUNCTION_10_0();
    if (OUTLINED_FUNCTION_12_18() != *MEMORY[0x24BEE7810])
      OUTLINED_FUNCTION_23_17(*(_QWORD *)(v0 + 240));
    *(_WORD *)OUTLINED_FUNCTION_12() = 0;
    v5 = sub_2291C449C();
    OUTLINED_FUNCTION_17_12(&dword_229115000, v2, v3, v5, "appsSearcherSearchApps");
    OUTLINED_FUNCTION_2_0();
  }
  v4 = *(_QWORD *)(v0 + 320);
  v6 = *(void (**)(uint64_t, uint64_t))(v0 + 520);
  OUTLINED_FUNCTION_3_17();
  v7 = *(_QWORD *)(v0 + 296);
  OUTLINED_FUNCTION_2_20(v8);
  v6(v4, v7);
  swift_release();
  OUTLINED_FUNCTION_26_19();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_73();
  swift_task_dealloc();
  OUTLINED_FUNCTION_108_1();
  OUTLINED_FUNCTION_106_1();
  OUTLINED_FUNCTION_104_1();
  OUTLINED_FUNCTION_103_1();
  OUTLINED_FUNCTION_93_1();
  OUTLINED_FUNCTION_102_1();
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_100_1();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_45_8();
  OUTLINED_FUNCTION_44_10();
  OUTLINED_FUNCTION_43_8();
  OUTLINED_FUNCTION_41_10();
  OUTLINED_FUNCTION_40_10();
  OUTLINED_FUNCTION_38_11();
  OUTLINED_FUNCTION_37_12();
  OUTLINED_FUNCTION_36_11();
  OUTLINED_FUNCTION_61_6();
  return OUTLINED_FUNCTION_6_21(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291B99D4()
{
  os_signpost_type_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  _WORD *v4;
  os_signpost_id_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_35_9();
  OUTLINED_FUNCTION_32_11();
  v2 = sub_2291C44CC();
  OUTLINED_FUNCTION_10_19();
  sub_2291C48C8();
  if ((OUTLINED_FUNCTION_56_5() & 1) != 0)
  {
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_57_7();
    OUTLINED_FUNCTION_10_0();
    if (OUTLINED_FUNCTION_12_18() != *MEMORY[0x24BEE7810])
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 224) + 8))(*(_QWORD *)(v1 + 232), *(_QWORD *)(v1 + 216));
    v4 = (_WORD *)OUTLINED_FUNCTION_12();
    v5 = OUTLINED_FUNCTION_22_14(v4);
    OUTLINED_FUNCTION_17_12(&dword_229115000, v2, v0, v5, "appsSearcherSearchApps");
    OUTLINED_FUNCTION_2_0();
  }
  v3 = *(_QWORD *)(v1 + 312);
  v6 = *(void (**)(uint64_t, uint64_t))(v1 + 520);
  OUTLINED_FUNCTION_3_17();
  v7 = *(_QWORD *)(v1 + 296);
  OUTLINED_FUNCTION_2_20(v8);
  v6(v3, v7);
  swift_release();
  OUTLINED_FUNCTION_26_19();
  swift_task_dealloc();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_73();
  swift_task_dealloc();
  OUTLINED_FUNCTION_108_1();
  OUTLINED_FUNCTION_106_1();
  OUTLINED_FUNCTION_104_1();
  OUTLINED_FUNCTION_103_1();
  OUTLINED_FUNCTION_93_1();
  OUTLINED_FUNCTION_102_1();
  OUTLINED_FUNCTION_101_1();
  OUTLINED_FUNCTION_100_1();
  OUTLINED_FUNCTION_45_8();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_44_10();
  OUTLINED_FUNCTION_43_8();
  OUTLINED_FUNCTION_41_10();
  OUTLINED_FUNCTION_40_10();
  OUTLINED_FUNCTION_38_11();
  OUTLINED_FUNCTION_37_12();
  OUTLINED_FUNCTION_36_11();
  OUTLINED_FUNCTION_61_6();
  return OUTLINED_FUNCTION_6_21(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2291B9B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2291B9BB8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_2_20(void *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1[33];
  *(_QWORD *)(v2 - 128) = v1[34];
  *(_QWORD *)(v2 - 120) = v3;
  v4 = v1[31];
  *(_QWORD *)(v2 - 112) = v1[32];
  *(_QWORD *)(v2 - 104) = v4;
  v5 = v1[29];
  *(_QWORD *)(v2 - 96) = v1[30];
  *(_QWORD *)(v2 - 88) = v5;

}

uint64_t OUTLINED_FUNCTION_6_21(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_7_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8_20()
{
  return sub_2291C491C();
}

void OUTLINED_FUNCTION_9_22(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_10_19()
{
  return sub_2291C44F0();
}

uint64_t OUTLINED_FUNCTION_12_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 88))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_13_21(_QWORD *a1)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1Tm(a1, v1);
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_17_12(void *a1, NSObject *a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5)
{
  const char *v5;
  uint8_t *v6;

  _os_signpost_emit_with_name_impl(a1, a2, a3, a4, a5, v5, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_19_17()
{
  return sub_2291C4940();
}

uint64_t OUTLINED_FUNCTION_20_20(__n128 *a1, __n128 a2)
{
  unint64_t v2;
  uint64_t v3;

  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  *(_QWORD *)(v3 - 88) = a1;
  return sub_2291C4790();
}

uint64_t OUTLINED_FUNCTION_22_14(_WORD *a1)
{
  *a1 = 0;
  return sub_2291C449C();
}

uint64_t OUTLINED_FUNCTION_23_17(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 + 224) + 8))(a1, *(_QWORD *)(v1 + 216));
}

uint64_t OUTLINED_FUNCTION_26_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_27_13()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_28_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_36_11()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_37_12()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_38_11()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_39_9()
{
  return sub_2291C44F0();
}

uint64_t OUTLINED_FUNCTION_40_10()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_41_10()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_42_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);

  return v21(v19, a19, v20);
}

uint64_t OUTLINED_FUNCTION_43_8()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_44_10()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_45_8()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_49_9()
{
  return sub_2291C4514();
}

uint64_t OUTLINED_FUNCTION_53_8()
{
  return sub_2291C44CC();
}

void OUTLINED_FUNCTION_55_8(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t OUTLINED_FUNCTION_56_5()
{
  return sub_2291C491C();
}

uint64_t OUTLINED_FUNCTION_57_7()
{
  return sub_2291C4514();
}

uint64_t OUTLINED_FUNCTION_60_8()
{
  return sub_2291C4520();
}

uint64_t OUTLINED_FUNCTION_61_6()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_62_7()
{
  return sub_2291C4520();
}

uint64_t OUTLINED_FUNCTION_64_5(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  return sub_22913EFA8(v3, v4, a3);
}

void *sub_2291B9E74()
{
  void *result;

  result = (void *)sub_2291B9E90();
  off_255A2F970 = result;
  return result;
}

uint64_t sub_2291B9E90()
{
  uint64_t v0;

  v0 = sub_2291C4670();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2291BA0F0(0xD00000000000001BLL, 0x80000002291D0690, 0xD000000000000017, 0x80000002291D0670);
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2291BA0F0(0x6C7070612E6D6F63, 0xEF636973754D2E65, 0xD000000000000019, 0x80000002291D06B0);
  swift_bridgeObjectRelease();
  swift_isUniquelyReferenced_nonNull_native();
  sub_2291BA0F0(0xD000000000000015, 0x80000002291CD740, 0xD000000000000017, 0x80000002291D06D0);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2291B9FDC()
{
  uint64_t result;

  result = sub_2291B9FF8();
  qword_255A300D8 = result;
  return result;
}

uint64_t sub_2291B9FF8()
{
  uint64_t v1;
  uint64_t v2;

  v2 = MEMORY[0x24BEE4B08];
  sub_22912A60C(&v1, 0xD000000000000019, 0x80000002291CD9A0);
  swift_bridgeObjectRelease();
  sub_22912A60C(&v1, 0xD000000000000019, 0x80000002291CF550);
  swift_bridgeObjectRelease();
  return v2;
}

void *sub_2291BA080()
{
  void *result;

  result = (void *)sub_2291C4670();
  off_255A2F978 = result;
  return result;
}

void *sub_2291BA0B8()
{
  void *result;

  result = (void *)sub_2291C4670();
  off_255A2F980 = result;
  return result;
}

uint64_t sub_2291BA0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_22919ECD4(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2F988);
  if ((sub_2291C4B14() & 1) == 0)
    goto LABEL_5;
  v15 = sub_22919ECD4(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_2291C4CC4();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = (uint64_t *)(v17[7] + 16 * v13);
    result = swift_bridgeObjectRelease();
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_2291BA328(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2291BA21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t result;
  char v14;
  _QWORD *v15;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_22919ECD4(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2F990);
  result = sub_2291C4B14();
  if ((result & 1) == 0)
    goto LABEL_5;
  result = sub_22919ECD4(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_2291C4CC4();
    __break(1u);
    return result;
  }
  v11 = result;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    *(_QWORD *)(v15[7] + 8 * v11) = a1;
  }
  else
  {
    sub_2291BA374(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_2291BA328(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

unint64_t sub_2291BA374(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

uint64_t sub_2291BA3BC(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
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
  uint64_t v14;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_2291C4AE4();
    sub_2291C45EC();
    OUTLINED_FUNCTION_98_4();
    v10 = a3 + v9;
    v12 = *(_QWORD *)(v11 + 72);
    while (1)
    {
      a1(&v13, v10);
      if (v4)
        break;
      v4 = 0;
      sub_2291C4ACC();
      sub_2291C4AF0();
      sub_2291C4AFC();
      sub_2291C4AD8();
      v10 += v12;
      if (!--v6)
        return v14;
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_2291BA4B8(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v21;

  v4 = v3;
  v6 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18_2();
  v10 = v9 - v8;
  v11 = *(_QWORD *)(a3 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  if (v11)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_22919F190(0, v11, 0);
    v12 = v21;
    sub_2291C2FE4();
    OUTLINED_FUNCTION_98_4();
    v14 = a3 + v13;
    v19 = *(_QWORD *)(v15 + 72);
    while (1)
    {
      a1(v14);
      if (v4)
        break;
      v4 = 0;
      v17 = *(_QWORD *)(v21 + 16);
      v16 = *(_QWORD *)(v21 + 24);
      if (v17 >= v16 >> 1)
        sub_22919F190(v16 > 1, v17 + 1, 1);
      *(_QWORD *)(v21 + 16) = v17 + 1;
      sub_2291BDB54(v10, v21+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v17);
      v14 += v19;
      if (!--v11)
        return v12;
    }
    swift_release();
  }
  return v12;
}

uint64_t sub_2291BA610(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  sub_2291C3A88();
  type metadata accessor for BaseDialogProvider();
  v2 = OUTLINED_FUNCTION_31();
  sub_2291C3A88();
  type metadata accessor for LocUtil();
  v3 = OUTLINED_FUNCTION_31();
  sub_22911F6D8(&v8, v3 + 16);
  sub_2291C37D0();
  swift_allocObject();
  v4 = sub_2291C37C4();
  type metadata accessor for MarketplaceInfoProvider();
  v5 = OUTLINED_FUNCTION_31();
  if (qword_2540B1F40 != -1)
    swift_once();
  v6 = static InstalledAppProvider.shared;
  swift_retain();
  return sub_2291BDB98(&v9, v2, v3, v4, a1, v5, v6);
}

uint64_t sub_2291BA718(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = OUTLINED_FUNCTION_66();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BA760(uint64_t a1)
{
  uint64_t v1;
  uint8_t *v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _BYTE *v17;

  if (qword_255A2A048 != -1)
    a1 = swift_once();
  v2 = *(uint8_t **)(v1 + 48);
  OUTLINED_FUNCTION_4_0(a1, (uint64_t)qword_255A30028);
  v3 = sub_2291C4520();
  v4 = sub_2291C4844();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_65(v5);
    OUTLINED_FUNCTION_39(&dword_229115000, v3, v4, "LaunchApp.UnsupportedValueStrategy.makeUnsupportedValueOutput() called", v2);
    OUTLINED_FUNCTION_2_0();
  }
  v6 = *(_QWORD *)(v1 + 48);

  OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2FBD0);
  v7 = (void *)sub_2291C3980();
  *(_QWORD *)(v1 + 64) = v7;
  v8 = (void *)sub_2291C398C();
  v9 = objc_msgSend(v8, sel_unsupportedReason);

  LaunchAppApplicationUnsupportedReason.init(rawValue:)((uint64_t)v9);
  if ((v10 & 1) != 0)
  {
    sub_22911F6F0();
    v16 = OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_5_21(v16, v17);

    OUTLINED_FUNCTION_82_3();
    return OUTLINED_FUNCTION_18_16(*(uint64_t (**)(void))(v1 + 8));
  }
  else
  {
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 72) = v11;
    v12 = OUTLINED_FUNCTION_62_8(v11);
    return sub_2291BA9D4(v12, v13, v14);
  }
}

uint64_t sub_2291BA8D8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BA928()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_19();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_0_7(v1);
}

uint64_t sub_2291BA954()
{
  uint64_t v0;

  OUTLINED_FUNCTION_82_3();
  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BA984(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return OUTLINED_FUNCTION_1_6();
}

uint64_t sub_2291BA994()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2FBD0);
  v1 = sub_2291C3980();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2291BA9D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v10;

  if (a2 == 1)
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 24) = v6;
    *v6 = v3;
    v6[1] = sub_2291BAA80;
    return sub_2291BAF2C(a1, v7, a3);
  }
  else
  {
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 16) = v10;
    *v10 = v3;
    v10[1] = sub_22918FF38;
    return sub_2291BAAAC(a1, a2);
  }
}

uint64_t sub_2291BAA80()
{
  uint64_t v0;

  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BAAAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  OUTLINED_FUNCTION_100_3();
  v3[11] = OUTLINED_FUNCTION_1_0();
  v4 = OUTLINED_FUNCTION_99_4();
  v3[12] = v4;
  v3[13] = *(_QWORD *)(v4 - 8);
  v3[14] = OUTLINED_FUNCTION_1_0();
  sub_2291C42A4();
  v3[15] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BAB18()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;

  v1 = *(_QWORD *)(v0 + 72);
  if (v1 == 4)
  {
    OUTLINED_FUNCTION_93_4();
    OUTLINED_FUNCTION_18_12();
    *(_QWORD *)(v0 + 152) = OUTLINED_FUNCTION_11_12();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v4;
    *v4 = v0;
    v4[1] = sub_2291BACE4;
    return sub_22914A124(0);
  }
  else if (v1 == 3)
  {
    OUTLINED_FUNCTION_93_4();
    OUTLINED_FUNCTION_18_12();
    *(_QWORD *)(v0 + 128) = OUTLINED_FUNCTION_11_12();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v2;
    *v2 = v0;
    v2[1] = sub_2291BAC0C;
    return sub_22914A7FC(0);
  }
  else
  {
    sub_22911F6F0();
    v5 = OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_5_21(v5, v6);
    OUTLINED_FUNCTION_40_11();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_9();
    return OUTLINED_FUNCTION_40(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_2291BAC0C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_49();
  v0[2] = v2;
  v0[3] = v3;
  v0[4] = v1;
  OUTLINED_FUNCTION_140(v4);
  v0[18] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_2291BAC6C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_53_9();
  OUTLINED_FUNCTION_66_7();
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 128));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v2;
  *v2 = v0;
  v2[1] = sub_2291BADBC;
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_41_11();
}

uint64_t sub_2291BACE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_49();
  v0[5] = v2;
  v0[6] = v3;
  v0[7] = v1;
  OUTLINED_FUNCTION_140(v4);
  v0[21] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_2291BAD44()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_53_9();
  OUTLINED_FUNCTION_66_7();
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 128));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v2;
  *v2 = v0;
  v2[1] = sub_2291BADBC;
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_41_11();
}

uint64_t sub_2291BADBC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_26();
  *v2 = *v1;
  *(_QWORD *)(v3 + 192) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BAE0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = *(_QWORD *)(v0 + 104);

  OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_18_16(v2);
}

uint64_t sub_2291BAE64()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_40_11();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  return OUTLINED_FUNCTION_40(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BAEA0()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_40_11();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  return OUTLINED_FUNCTION_40(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BAEDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);

  OUTLINED_FUNCTION_64_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_40_11();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  return OUTLINED_FUNCTION_40(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BAF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a3;
  v4[4] = v3;
  v4[2] = a1;
  v5 = OUTLINED_FUNCTION_66();
  v4[5] = v5;
  v4[6] = *(_QWORD *)(v5 - 8);
  v4[7] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BAF74()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;
  void *v5;
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = objc_msgSend(*(id *)(v0 + 24), sel_requestedApplication);
  if (v1 && (sub_22917BC20(v1), *(_QWORD *)(v0 + 64) = v1, (*(_QWORD *)(v0 + 72) = v2) != 0))
  {
    if ((sub_2291C30F8() & 1) != 0)
    {
      v3 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v3;
      *v3 = v0;
      v3[1] = sub_2291BB138;
      return sub_2291BD5A4(*(_QWORD *)(v0 + 24));
    }
    else
    {
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 80) = v12;
      v13 = OUTLINED_FUNCTION_62_8(v12);
      return sub_2291BC9A0(v13, v14, v15);
    }
  }
  else
  {
    if (qword_255A2A048 != -1)
      v1 = (id)swift_once();
    v5 = *(void **)(v0 + 56);
    OUTLINED_FUNCTION_4_0((uint64_t)v1, (uint64_t)qword_255A30028);
    sub_2291C4520();
    v6 = OUTLINED_FUNCTION_85();
    if (OUTLINED_FUNCTION_17(v6))
    {
      v7 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v7);
      OUTLINED_FUNCTION_10(&dword_229115000, v8, v9, "Unable to get app name, cannot construct UnsupportedValueStrategy response");
      OUTLINED_FUNCTION_2_0();
    }
    v10 = *(_QWORD *)(v0 + 48);

    OUTLINED_FUNCTION_22_3(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    sub_22911F6F0();
    OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_43_9(v11, 6);
    OUTLINED_FUNCTION_82_3();
    return OUTLINED_FUNCTION_18_16(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_2291BB0FC()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_76_3();
  v1 = *v0;
  OUTLINED_FUNCTION_24_13(v2);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_96_4();
  return OUTLINED_FUNCTION_40(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2291BB138(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_75_5();
  OUTLINED_FUNCTION_140(v5);
  v3[12] = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_13();
    return OUTLINED_FUNCTION_5_0();
  }
  else
  {
    v7 = v3[9];
    v8 = (_QWORD *)swift_task_alloc();
    if ((a1 & 1) != 0)
    {
      v3[13] = (uint64_t)v8;
      *v8 = v2;
      v8[1] = sub_2291BB220;
      return sub_2291BB2D0(v3[2], v3[8], v7, v3[3]);
    }
    else
    {
      v3[14] = (uint64_t)v8;
      *v8 = v2;
      v8[1] = sub_2291BB260;
      return sub_2291BBF18(v3[2], v3[8], v7);
    }
  }
}

uint64_t sub_2291BB220()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_76_3();
  v1 = *v0;
  OUTLINED_FUNCTION_24_13(v2);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_96_4();
  return OUTLINED_FUNCTION_40(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2291BB260()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_76_3();
  v1 = *v0;
  OUTLINED_FUNCTION_24_13(v2);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_96_4();
  return OUTLINED_FUNCTION_40(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2291BB2A0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82_3();
  return OUTLINED_FUNCTION_0_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BB2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[25] = a4;
  v5[26] = v4;
  v5[23] = a2;
  v5[24] = a3;
  v5[22] = a1;
  OUTLINED_FUNCTION_100_3();
  v5[27] = OUTLINED_FUNCTION_1_0();
  v6 = OUTLINED_FUNCTION_99_4();
  v5[28] = v6;
  v5[29] = *(_QWORD *)(v6 - 8);
  v5[30] = OUTLINED_FUNCTION_1_0();
  type metadata accessor for AppLaunchDataModels.AppResultWrapperModel(0);
  v5[31] = OUTLINED_FUNCTION_1_0();
  sub_2291C4304();
  v5[32] = OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2FBC0);
  v5[33] = OUTLINED_FUNCTION_1_0();
  v7 = sub_2291C2FE4();
  v5[34] = v7;
  v5[35] = *(_QWORD *)(v7 - 8);
  v5[36] = OUTLINED_FUNCTION_20();
  v5[37] = OUTLINED_FUNCTION_25();
  v8 = OUTLINED_FUNCTION_66();
  v5[38] = v8;
  v5[39] = *(_QWORD *)(v8 - 8);
  v5[40] = OUTLINED_FUNCTION_20();
  v5[41] = OUTLINED_FUNCTION_25();
  v5[42] = OUTLINED_FUNCTION_25();
  v5[43] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BB3C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  void *v39;
  os_log_type_t v40;
  _WORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  if (qword_255A2A008 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 312);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_255A2FFB0);
  v5 = *(void (**)(uint64_t))(v2 + 16);
  *(_QWORD *)(v0 + 352) = v5;
  v56 = v4;
  v5(v1);
  v6 = sub_2291C4520();
  v7 = sub_2291C4838();
  if (OUTLINED_FUNCTION_13_5(v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_11();
    *(_WORD *)v8 = 0;
    OUTLINED_FUNCTION_39(&dword_229115000, v6, (os_log_type_t)v3, "LaunchAppUnsupportedValueStrategy: building smart view with app results", v8);
    OUTLINED_FUNCTION_2_0();
  }
  v9 = *(_QWORD *)(v0 + 344);
  v11 = *(_QWORD *)(v0 + 304);
  v10 = *(_QWORD *)(v0 + 312);
  v12 = *(void **)(v0 + 200);

  v13 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  *(_QWORD *)(v0 + 360) = v13;
  v54 = (uint64_t)v13;
  v13(v9, v11);
  v14 = sub_2291BDA5C(v12);
  if (v14)
  {
    v23 = *(_QWORD *)(v14 + 16);
    v47 = v14;
    if (v23)
    {
      v50 = v0 + 168;
      v51 = v0 + 136;
      v57 = *(_QWORD *)(v0 + 280);
      v24 = (unint64_t *)(v14 + 40);
      v58 = MEMORY[0x24BEE4AF8];
      *(_QWORD *)&v22 = 136315138;
      v49 = v22;
      v48 = MEMORY[0x24BEE4AD8] + 8;
      v52 = (uint64_t)v5;
      do
      {
        sub_229172A38(*(v24 - 1), *v24);
        sub_2291C42F8();
        sub_22912C97C(&qword_255A2F070, (uint64_t (*)(uint64_t))MEMORY[0x24BE70478], MEMORY[0x24BE70460]);
        sub_2291C4310();
        v25 = *(_QWORD *)(v0 + 296);
        v27 = *(_QWORD *)(v0 + 264);
        v26 = *(_QWORD *)(v0 + 272);
        __swift_storeEnumTagSinglePayload(v27, 0, 1, v26);
        v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v57 + 32);
        v28(v25, v27, v26);
        v29 = OUTLINED_FUNCTION_48_0();
        ((void (*)(uint64_t))v28)(v29);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v30 = v58;
        else
          v30 = sub_2291295E0(0, *(_QWORD *)(v58 + 16) + 1, 1, v58);
        v32 = *(_QWORD *)(v30 + 16);
        v31 = *(_QWORD *)(v30 + 24);
        if (v32 >= v31 >> 1)
          v30 = sub_2291295E0(v31 > 1, v32 + 1, 1, v30);
        v33 = *(_QWORD *)(v0 + 288);
        v34 = *(_QWORD *)(v0 + 272);
        *(_QWORD *)(v30 + 16) = v32 + 1;
        v58 = v30;
        v28(v30+ ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80))+ *(_QWORD *)(v57 + 72) * v32, v33, v34);
        v24 += 2;
        --v23;
      }
      while (v23);
    }
    else
    {
      v58 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 368) = v58;
    v35 = *(_QWORD *)(v58 + 16);
    if (v35)
    {
      v36 = *(_QWORD *)(v0 + 192);
      *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 184);
      *(_QWORD *)(v0 + 24) = v36;
      *(_QWORD *)(v0 + 32) = 0;
      *(_QWORD *)(v0 + 40) = 0;
      *(_QWORD *)(v0 + 48) = v35;
      swift_bridgeObjectRetain();
      v37 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 376) = v37;
      *v37 = v0;
      v37[1] = sub_2291BB908;
      return sub_229157D9C(v0 + 16);
    }
    v14 = swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_78_5(v14, v15, v16, v17, v18, v19, v20, v21, v47, v48, v49, *((uint64_t *)&v49 + 1), v50, v51, v52, v53, v54, v56);
  v39 = (void *)sub_2291C4520();
  v40 = sub_2291C485C();
  if (OUTLINED_FUNCTION_17(v40))
  {
    v41 = (_WORD *)OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_65(v41);
    OUTLINED_FUNCTION_10(&dword_229115000, v42, v43, "LaunchAppUnsupportedValueStrategy: attempted to create SmartResultBasedView, but found no app results");
    OUTLINED_FUNCTION_2_0();
  }
  v44 = *(_QWORD *)(v0 + 320);
  v45 = *(_QWORD *)(v0 + 304);

  v55(v44, v45);
  sub_22911F6F0();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_43_9(v46, 8);
  OUTLINED_FUNCTION_61_7();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2291BB908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_64();
  *(_QWORD *)(v0 + 384) = v2;
  *(_QWORD *)(v0 + 392) = v1;
  OUTLINED_FUNCTION_47();
  if (!v1)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_2291BB960()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  void (*v11)(void *, uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  sub_22919AD48(0x45524F4D5F454553, 0xE800000000000000);
  if (v1)
  {
    v25 = *(void **)(v0 + 384);
    v2 = *(_QWORD *)(v0 + 368);
    v24 = *(_QWORD *)(v0 + 248);
    v3 = *(_QWORD *)(v0 + 208);
    sub_22912F100(v3 + 232, v0 + 56);
    v4 = swift_task_alloc();
    *(_QWORD *)(v4 + 16) = v0 + 56;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2291BA4B8(sub_229198EF4, v4, v2);
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_19();
    sub_22916F704();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
    sub_2291C35B4();
    *(_QWORD *)(swift_task_alloc() + 16) = v2;
    sub_2291C3914();
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_19();
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v3 + 104), *(_QWORD *)(v3 + 128));
    *(_QWORD *)(v0 + 120) = OUTLINED_FUNCTION_92_3();
    sub_22912C97C((unint64_t *)&qword_255A2A868, type metadata accessor for AppLaunchDataModels, (uint64_t)&protocol conformance descriptor for AppLaunchDataModels);
    *(_QWORD *)(v0 + 128) = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
    sub_2291BDB18(v24, (uint64_t)boxed_opaque_existential_1, (void (*)(_QWORD))type metadata accessor for AppLaunchDataModels.AppResultWrapperModel);
    OUTLINED_FUNCTION_48_0();
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v7 = OUTLINED_FUNCTION_14();
    *(_OWORD *)(v7 + 16) = xmmword_2291C5A50;
    *(_QWORD *)(v7 + 32) = v25;
    v26 = v7;
    sub_2291C4790();
    *(_QWORD *)(v0 + 400) = v26;
    v8 = v25;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v9;
    *v9 = v0;
    v9[1] = sub_2291BBCC8;
    OUTLINED_FUNCTION_94_4();
    return sub_2291C3800();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_255A2A048 != -1)
      swift_once();
    v11 = *(void (**)(void *, uint64_t, uint64_t))(v0 + 352);
    v12 = *(void **)(v0 + 328);
    v13 = *(_QWORD *)(v0 + 304);
    v14 = __swift_project_value_buffer(v13, (uint64_t)qword_255A30028);
    v11(v12, v14, v13);
    sub_2291C4520();
    v15 = OUTLINED_FUNCTION_85();
    if (OUTLINED_FUNCTION_17(v15))
    {
      v16 = (_WORD *)OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_65(v16);
      OUTLINED_FUNCTION_10(&dword_229115000, v17, v18, "Unable to get localized system text for snippet");
      OUTLINED_FUNCTION_2_0();
    }
    v19 = *(void **)(v0 + 384);
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
    v21 = *(_QWORD *)(v0 + 328);
    v22 = *(_QWORD *)(v0 + 304);

    v20(v21, v22);
    sub_22911F6F0();
    OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_43_9(v23, 7);

    OUTLINED_FUNCTION_61_7();
    swift_task_dealloc();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_27();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2291BBCC8()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_2291BBD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(_QWORD *)(v0 + 224);

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  sub_22911F9C8(v1, type metadata accessor for AppLaunchDataModels.AppResultWrapperModel);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_28();
  swift_task_dealloc();
  v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_27_14(v5);
}

uint64_t sub_2291BBDC4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21();
  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_19();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_3_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BBE58()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A2CD30);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2291C3938();
  sub_2291C395C();
  sub_22917FAA0();
  v3 = sub_2291C37AC();
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v3);
  sub_2291C3944();
  return sub_2291C392C();
}

uint64_t sub_2291BBF18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[15] = a3;
  v4[16] = v3;
  v4[13] = a1;
  v4[14] = a2;
  v5 = OUTLINED_FUNCTION_66();
  v4[17] = v5;
  v4[18] = *(_QWORD *)(v5 - 8);
  v4[19] = OUTLINED_FUNCTION_1_0();
  type metadata accessor for AppLaunchDataModels.ButtonFallbackModel(0);
  v4[20] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_100_3();
  v4[21] = OUTLINED_FUNCTION_1_0();
  v6 = OUTLINED_FUNCTION_99_4();
  v4[22] = v6;
  v4[23] = *(_QWORD *)(v6 - 8);
  v4[24] = OUTLINED_FUNCTION_1_0();
  v7 = sub_2291C30E0();
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 - 8);
  v4[27] = OUTLINED_FUNCTION_20();
  v4[28] = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BBFC0()
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
  id v9;
  __n128 *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v16;

  v1 = *(_QWORD *)(v0[16] + 144);
  v0[29] = v1;
  if (v1 && (sub_2291C43B8(), v2))
  {
    OUTLINED_FUNCTION_95_4();
    v3 = sub_2291C43B8();
    v5 = v4;
    OUTLINED_FUNCTION_56_6();
    v6 = OUTLINED_FUNCTION_29_18((uint64_t)"SEARCH_APP_STORE");
    v8 = v7;
    v9 = OUTLINED_FUNCTION_97_3();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD20);
    v10 = (__n128 *)OUTLINED_FUNCTION_31();
    v11 = OUTLINED_FUNCTION_71_5(v10, (__n128)xmmword_2291C5A70);
    v12 = OUTLINED_FUNCTION_91_3(v11, MEMORY[0x24BEAD1E8]);
    *v12 = (uint64_t)v9;
    *((_BYTE *)v12 + 8) = 0;
    OUTLINED_FUNCTION_70_5((uint64_t)v12, *MEMORY[0x24BEAD188]);
    sub_2291C30EC();
    v0[38] = v5;
    v0[39] = 0;
    v0[36] = v6;
    v0[37] = v8;
    v13 = v0[15];
    v0[2] = v0[14];
    v0[3] = v13;
    v0[4] = v3;
    v0[6] = 0;
    v0[7] = 0;
    v0[5] = v5;
    v14 = (_QWORD *)swift_task_alloc();
    v0[40] = v14;
    *v14 = v0;
    v14[1] = sub_2291BC37C;
    return OUTLINED_FUNCTION_21_13((uint64_t)(v0 + 2));
  }
  else
  {
    v16 = (_QWORD *)swift_task_alloc();
    v0[30] = v16;
    *v16 = v0;
    v16[1] = sub_2291BC120;
    return sub_2291BD414();
  }
}

uint64_t sub_2291BC120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_113();
  v3[31] = v1;
  v3[32] = v2;
  v3[33] = v4;
  v3[34] = v5;
  v3[35] = v0;
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BC174()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __n128 *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD *v20;

  v1 = v0[32];
  if (v1)
  {
    v2 = v0[34];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v3 = sub_22919AD48(0xD000000000000015, 0x80000002291D0790);
    if (v4)
    {
      v5 = v0[33];
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AD88);
      v6 = OUTLINED_FUNCTION_31();
      *(_OWORD *)(v6 + 16) = xmmword_2291C5A70;
      *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v6 + 64) = sub_22912E144();
      *(_QWORD *)(v6 + 32) = v5;
      *(_QWORD *)(v6 + 40) = v2;
      swift_bridgeObjectRetain();
      v3 = sub_2291C46C4();
      v8 = v7;
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = 0;
    }
    static AppSearchCommands.searchMarketplaceActionProperty(appName:marketplace:)(v0[14], v0[15], v0[31], v1);
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_56();
    v9 = 0;
    v11 = 0;
    v13 = v0[33];
    v12 = v0[34];
  }
  else
  {
    if (v0[29])
    {
      v9 = sub_2291C43B8();
      v11 = v10;
    }
    else
    {
      v9 = 0;
      v11 = 0;
    }
    OUTLINED_FUNCTION_56_6();
    v3 = OUTLINED_FUNCTION_29_18((uint64_t)"SEARCH_APP_STORE");
    v8 = v14;
    v15 = OUTLINED_FUNCTION_97_3();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CD20);
    v16 = (__n128 *)OUTLINED_FUNCTION_31();
    v17 = OUTLINED_FUNCTION_71_5(v16, (__n128)xmmword_2291C5A70);
    v18 = OUTLINED_FUNCTION_91_3(v17, MEMORY[0x24BEAD1E8]);
    *v18 = (uint64_t)v15;
    *((_BYTE *)v18 + 8) = 0;
    OUTLINED_FUNCTION_70_5((uint64_t)v18, *MEMORY[0x24BEAD188]);
    sub_2291C30EC();
    v13 = 0;
    v12 = 0;
  }
  v0[38] = v11;
  v0[39] = v12;
  v0[36] = v3;
  v0[37] = v8;
  v19 = v0[15];
  v0[2] = v0[14];
  v0[3] = v19;
  v0[4] = v9;
  v0[5] = v11;
  v0[6] = v13;
  v0[7] = v12;
  v20 = (_QWORD *)swift_task_alloc();
  v0[40] = v20;
  *v20 = v0;
  v20[1] = sub_2291BC37C;
  return OUTLINED_FUNCTION_21_13((uint64_t)(v0 + 2));
}

uint64_t sub_2291BC37C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_75_5();
  OUTLINED_FUNCTION_64();
  *(_QWORD *)(v1 + 328) = v2;
  *(_QWORD *)(v1 + 336) = v0;
  OUTLINED_FUNCTION_47();
  swift_bridgeObjectRelease();
  if (v0)
    OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_2291BC400()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  void *v19;
  os_log_type_t v20;
  _WORD *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = *(_QWORD *)(v0 + 296);
  sub_2291C35B4();
  sub_2291C3914();
  if (v1)
  {
    v2 = *(void **)(v0 + 328);
    v4 = *(_QWORD *)(v0 + 288);
    v3 = *(_QWORD *)(v0 + 296);
    v5 = *(_QWORD *)(v0 + 216);
    v6 = *(_QWORD *)(v0 + 160);
    v7 = *(_QWORD *)(v0 + 128);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 16))(v5, *(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 200));
    AppLaunchDataModels.ButtonFallbackModel.init(buttonLabel:actionProperty:)(v4, v3, v5);
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v7 + 104), *(_QWORD *)(v7 + 128));
    *(_QWORD *)(v0 + 88) = OUTLINED_FUNCTION_92_3();
    sub_22912C97C((unint64_t *)&qword_255A2A868, type metadata accessor for AppLaunchDataModels, (uint64_t)&protocol conformance descriptor for AppLaunchDataModels);
    *(_QWORD *)(v0 + 96) = v8;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 64));
    sub_2291BDB18(v6, (uint64_t)boxed_opaque_existential_1, (void (*)(_QWORD))type metadata accessor for AppLaunchDataModels.ButtonFallbackModel);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v10 = OUTLINED_FUNCTION_14();
    *(_OWORD *)(v10 + 16) = xmmword_2291C5A50;
    *(_QWORD *)(v10 + 32) = v2;
    OUTLINED_FUNCTION_38();
    *(_QWORD *)(v0 + 344) = v35;
    v11 = v2;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 352) = v12;
    *v12 = v0;
    v12[1] = sub_2291BC758;
    OUTLINED_FUNCTION_94_4();
    return sub_2291C380C();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)(v0 + 128) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 128) + 40));
    v14 = sub_2291C35A8();
    if ((v14 & 1) != 0)
    {
      v15 = *(void **)(v0 + 328);
      __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)(v0 + 128) + 104), *(_QWORD *)(*(_QWORD *)(v0 + 128) + 128));
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
      v16 = OUTLINED_FUNCTION_14();
      *(_OWORD *)(v16 + 16) = xmmword_2291C5A50;
      *(_QWORD *)(v16 + 32) = v15;
      OUTLINED_FUNCTION_38();
      *(_QWORD *)(v0 + 360) = v35;
      v17 = v15;
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 368) = v18;
      *v18 = v0;
      v18[1] = sub_2291BC814;
      OUTLINED_FUNCTION_62();
      return sub_2291C3824();
    }
    else
    {
      if (qword_255A2A048 != -1)
        v14 = swift_once();
      v19 = *(void **)(v0 + 152);
      OUTLINED_FUNCTION_4_0(v14, (uint64_t)qword_255A30028);
      sub_2291C4520();
      v20 = OUTLINED_FUNCTION_85();
      if (OUTLINED_FUNCTION_17(v20))
      {
        v21 = (_WORD *)OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_65(v21);
        OUTLINED_FUNCTION_10(&dword_229115000, v22, v23, "Unable to get localized button text for snippet");
        OUTLINED_FUNCTION_2_0();
      }
      v24 = *(void **)(v0 + 328);
      v25 = *(_QWORD *)(v0 + 208);
      v33 = *(_QWORD *)(v0 + 200);
      v34 = *(_QWORD *)(v0 + 224);
      v26 = *(_QWORD *)(v0 + 184);
      v27 = *(_QWORD *)(v0 + 192);
      v28 = *(_QWORD *)(v0 + 176);
      v30 = *(_QWORD *)(v0 + 144);
      v29 = *(_QWORD *)(v0 + 152);
      v31 = *(_QWORD *)(v0 + 136);

      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      sub_22911F6F0();
      OUTLINED_FUNCTION_94();
      OUTLINED_FUNCTION_43_9(v32, 7);

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v27, v28);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v34, v33);
      OUTLINED_FUNCTION_28_15();
      OUTLINED_FUNCTION_8();
      OUTLINED_FUNCTION_9();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_23();
      return OUTLINED_FUNCTION_27_14(*(uint64_t (**)(void))(v0 + 8));
    }
  }
}

uint64_t sub_2291BC758()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_2291BC79C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  v1 = *(_QWORD *)(v0 + 160);

  sub_22911F9C8(v1, type metadata accessor for AppLaunchDataModels.ButtonFallbackModel);
  OUTLINED_FUNCTION_33_12();
  OUTLINED_FUNCTION_63_5();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_59(v2);
}

uint64_t sub_2291BC814()
{
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BC84C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_33_12();
  OUTLINED_FUNCTION_63_5();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_59(v1);
}

uint64_t sub_2291BC8B0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28_15();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_59(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BC900()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 200));
  OUTLINED_FUNCTION_28_15();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_23();
  return OUTLINED_FUNCTION_59(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BC960()
{
  sub_2291C3968();
  return sub_2291C392C();
}

uint64_t sub_2291BC9A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[15] = a3;
  v4[16] = v3;
  v4[13] = a1;
  v4[14] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A2CD30);
  v4[17] = OUTLINED_FUNCTION_1_0();
  v5 = sub_2291C37E8();
  v4[18] = v5;
  v4[19] = *(_QWORD *)(v5 - 8);
  v4[20] = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BCA04()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(v1[16] + 144);
  v1[21] = v2;
  if (v2 && (sub_2291C43B8(), v3))
  {
    OUTLINED_FUNCTION_95_4();
    OUTLINED_FUNCTION_84_5();
    v5 = v4;
    if (v0)
    {
      v6 = sub_2291C43B8();
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    v1[28] = v7;
    v1[29] = 0;
    v1[27] = v5;
    v10 = v1[15];
    v1[2] = v1[14];
    v1[3] = v10;
    v1[4] = v6;
    v1[6] = 0;
    v1[7] = 0;
    v1[5] = v7;
    swift_bridgeObjectRetain();
    v11 = (_QWORD *)swift_task_alloc();
    v1[30] = v11;
    v12 = OUTLINED_FUNCTION_104_4(v11);
    return sub_229159680(v12, v13);
  }
  else
  {
    v8 = (_QWORD *)swift_task_alloc();
    v1[22] = v8;
    *v8 = v1;
    v8[1] = sub_2291BCAF8;
    return sub_2291BD414();
  }
}

uint64_t sub_2291BCAF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_64();
  v0[23] = v3;
  v0[24] = v4;
  v0[25] = v5;
  v0[26] = v6;
  OUTLINED_FUNCTION_47();
  if (v1)
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_8();
    return OUTLINED_FUNCTION_59(*(uint64_t (**)(void))(v2 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_13();
    return OUTLINED_FUNCTION_5_0();
  }
}

uint64_t sub_2291BCB60()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[24];
  if (v1)
  {
    sub_2291BD168(v0[14], v0[15], v0[23], v0[24], v0[25], v0[26]);
    v3 = v2;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_56();
    v1 = 0;
    v5 = v0[25];
    v4 = v0[26];
    v6 = v0[15];
  }
  else
  {
    OUTLINED_FUNCTION_84_5();
    v3 = v7;
    v6 = swift_bridgeObjectRetain();
    v5 = 0;
    v4 = 0;
  }
  v0[28] = v1;
  v0[29] = v4;
  v0[27] = v3;
  v0[2] = v0[14];
  v0[3] = v6;
  v0[4] = 0;
  v0[5] = v1;
  v0[6] = v5;
  v0[7] = v4;
  v8 = (_QWORD *)swift_task_alloc();
  v0[30] = v8;
  v9 = OUTLINED_FUNCTION_104_4(v8);
  return sub_229159680(v9, v10);
}

uint64_t sub_2291BCC50()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_75_5();
  OUTLINED_FUNCTION_140(v2);
  *(_QWORD *)(v1 + 248) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_36();
  if (v0)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_5_0();
}

uint64_t sub_2291BCCCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 152);
  v1 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 136);
  v12 = *(_QWORD *)(v0 + 144);
  v4 = *(uint64_t **)(v0 + 104);
  OUTLINED_FUNCTION_37_13();
  sub_2291C3548();
  v5 = sub_2291C37AC();
  OUTLINED_FUNCTION_13_10(v3, v6, v7, v5);
  v8 = sub_2291C3AD0();
  *(_OWORD *)(v0 + 80) = 0u;
  *(_QWORD *)(v0 + 96) = 0;
  *(_OWORD *)(v0 + 64) = 0u;
  v9 = MEMORY[0x24BE99088];
  v4[3] = v8;
  v4[4] = v9;
  __swift_allocate_boxed_opaque_existential_1(v4);
  sub_2291C36A4();
  swift_bridgeObjectRelease();
  sub_22911F918(v0 + 64, (uint64_t *)&unk_255A2CD40);
  sub_22911F918(v3, &qword_255A2CD30);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v12);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  v10 = (uint64_t (*)(void))OUTLINED_FUNCTION_43();
  return OUTLINED_FUNCTION_3_0(v10);
}

uint64_t sub_2291BCDDC()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_8();
  return OUTLINED_FUNCTION_59(*(uint64_t (**)(void))(v0 + 8));
}

void sub_2291BCE14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  __n128 *v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  __n128 *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  __n128 *v27;
  uint64_t v28;
  __n128 *v29;
  uint64_t v30;
  uint64_t v31;

  v1 = OUTLINED_FUNCTION_66();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_18_2();
  v5 = (v4 - v3);
  v6 = OUTLINED_FUNCTION_29_18((uint64_t)"SEARCH_APP_STORE");
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    v10 = static AppSearchCommands.searchAppStoreAceCommand(appName:)();
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81888]), sel_init);
    sub_2291BDA20(v8, v9, v11);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
    v12 = OUTLINED_FUNCTION_14();
    *(_OWORD *)(v12 + 16) = xmmword_2291C5A50;
    *(_QWORD *)(v12 + 32) = v10;
    OUTLINED_FUNCTION_13_22(v12);
    v13 = v10;
    sub_2291BD9BC(v31, v11, (uint64_t *)&unk_255A2DBF0, (SEL *)&selRef_setCommands_);
    OUTLINED_FUNCTION_37_13();
    if ((sub_2291C3590() & 1) != 0)
    {
      OUTLINED_FUNCTION_77();
      v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE818D0]), sel_init);
      objc_msgSend(v14, sel_setButtonView_, v11);
      v15 = (__n128 *)OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_87_3(v15);
      *(_QWORD *)(v16 + 32) = v14;
      OUTLINED_FUNCTION_13_22(v16);
      OUTLINED_FUNCTION_88_4();

    }
    else
    {
      OUTLINED_FUNCTION_37_13();
      if ((sub_2291C3584() & 1) != 0)
      {
        sub_22913A418();
        v20 = (__n128 *)OUTLINED_FUNCTION_14();
        OUTLINED_FUNCTION_87_3(v20);
        *(_QWORD *)(v21 + 32) = v13;
        OUTLINED_FUNCTION_13_22(v21);
        v22 = v13;
        v23 = sub_229178A40(v8, v9, v31);
        v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815E8]), sel_init);
        v25 = OUTLINED_FUNCTION_14();
        *(_OWORD *)(v25 + 16) = xmmword_2291C5A50;
        *(_QWORD *)(v25 + 32) = v23;
        OUTLINED_FUNCTION_13_22(v25);
        v26 = v23;
        sub_2291BD9BC(v31, v24, (uint64_t *)&unk_255A2FBA0, (SEL *)&selRef_setTemplateItems_);
        v27 = (__n128 *)OUTLINED_FUNCTION_14();
        OUTLINED_FUNCTION_87_3(v27);
        *(_QWORD *)(v28 + 32) = v24;
        OUTLINED_FUNCTION_13_22(v28);
        OUTLINED_FUNCTION_88_4();

      }
      else
      {
        OUTLINED_FUNCTION_77();
        __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
        if ((sub_2291C359C() & 1) != 0)
        {

        }
        else
        {
          v29 = (__n128 *)OUTLINED_FUNCTION_14();
          OUTLINED_FUNCTION_87_3(v29);
          *(_QWORD *)(v30 + 32) = v11;
          OUTLINED_FUNCTION_13_22(v30);
          OUTLINED_FUNCTION_88_4();
        }
      }
    }
  }
  else
  {
    if (qword_255A2A048 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v1, (uint64_t)qword_255A30028);
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v2 + 16))(v5, v17, v1);
    sub_2291C4520();
    v18 = OUTLINED_FUNCTION_85();
    if (os_log_type_enabled(v5, v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_11();
      *(_WORD *)v19 = 0;
      OUTLINED_FUNCTION_39(&dword_229115000, v5, v18, "Unable to get translated App Store button label", v19);
      OUTLINED_FUNCTION_2_0();
    }

    OUTLINED_FUNCTION_64_0((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  }
  OUTLINED_FUNCTION_54_0();
}

void sub_2291BD168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v32;

  v10 = OUTLINED_FUNCTION_66();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_18_2();
  v14 = (v13 - v12);
  v15 = v6[6];
  __swift_project_boxed_opaque_existential_1Tm(v6 + 2, v6[5]);
  if ((sub_2291C359C() & 1) == 0)
  {
    sub_22919AD48(0xD000000000000015, 0x80000002291D0790);
    if (v16)
    {
      v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81140]), sel_init);
      sub_22915C414(a3, a4, v17);
      sub_22915C450(a1, a2, v17);
      v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81888]), sel_init);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A2AD88);
      v19 = OUTLINED_FUNCTION_31();
      *(_OWORD *)(v19 + 16) = xmmword_2291C5A70;
      *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v19 + 64) = sub_22912E144();
      *(_QWORD *)(v19 + 32) = a5;
      *(_QWORD *)(v19 + 40) = a6;
      swift_bridgeObjectRetain();
      v20 = sub_2291C46C4();
      v22 = v21;
      OUTLINED_FUNCTION_21();
      sub_2291BD950(v20, v22, v18);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255A2CCF0);
      v23 = OUTLINED_FUNCTION_14();
      *(_OWORD *)(v23 + 16) = xmmword_2291C5A50;
      *(_QWORD *)(v23 + 32) = v17;
      OUTLINED_FUNCTION_13_22(v23);
      v24 = v17;
      sub_2291BD9BC(v32, v18, (uint64_t *)&unk_255A2DBF0, (SEL *)&selRef_setCommands_);
      v25 = OUTLINED_FUNCTION_14();
      *(_OWORD *)(v25 + 16) = xmmword_2291C5A50;
      *(_QWORD *)(v25 + 32) = v18;
      OUTLINED_FUNCTION_13_22(v25);

    }
    else
    {
      if (qword_255A2A048 != -1)
        swift_once();
      v26 = __swift_project_value_buffer(v10, (uint64_t)qword_255A30028);
      (*(void (**)(NSObject *, uint64_t, uint64_t))(v11 + 16))(v14, v26, v10);
      sub_2291C4520();
      v27 = OUTLINED_FUNCTION_85();
      if (OUTLINED_FUNCTION_13_5(v27))
      {
        v28 = (uint8_t *)OUTLINED_FUNCTION_11();
        *(_WORD *)v28 = 0;
        OUTLINED_FUNCTION_39(&dword_229115000, v14, (os_log_type_t)v15, "Unable to get translated search marketplace button label", v28);
        OUTLINED_FUNCTION_2_0();
      }

      OUTLINED_FUNCTION_64_0((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    }
  }
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_2291BD414()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_1_6();
}

uint64_t sub_2291BD424()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 16);
  if ((*(_BYTE *)(v1 + 304) & 1) != 0)
  {
    OUTLINED_FUNCTION_44_11(v1);
    v2 = OUTLINED_FUNCTION_59_5();
    return OUTLINED_FUNCTION_42_12(v2, v3, v4, v5, v6);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 216));
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v8;
    *v8 = v0;
    v8[1] = sub_2291BD49C;
    return sub_2291B2438();
  }
}

uint64_t sub_2291BD49C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_113();
  *(_QWORD *)(v4 + 32) = v2;
  *(_QWORD *)(v4 + 40) = v3;
  OUTLINED_FUNCTION_47();
  if (v0)
    return (*(uint64_t (**)(void))(v1 + 8))();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BD4F0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  v1 = v0[5];
  if (v1)
  {
    v2 = v0[4];
    v3 = (_QWORD *)v0[2];
    v4 = v3[32];
    v5 = v3[33];
    __swift_project_boxed_opaque_existential_1Tm(v3 + 29, v4);
    v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, v1, 1, v4, v5);
    if (v6 && (sub_22917BC20(v6), v8))
    {
      v9 = (_QWORD *)v0[2];
      v10 = v9[34];
      v11 = v9[35];
      *((_OWORD *)v9 + 17) = *((_OWORD *)v0 + 2);
      v9[36] = v7;
      v9[37] = v8;
      sub_2291BDAB0(v10, v11);
    }
    else
    {
      OUTLINED_FUNCTION_36();
    }
  }
  *(_BYTE *)(v0[2] + 304) = 1;
  OUTLINED_FUNCTION_44_11(v0[2]);
  v12 = OUTLINED_FUNCTION_59_5();
  return OUTLINED_FUNCTION_42_12(v12, v13, v14, v15, v16);
}

uint64_t sub_2291BD5A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = v1;
  return OUTLINED_FUNCTION_1_6();
}

uint64_t sub_2291BD5B4()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;

  if ((sub_2291C30F8() & 1) == 0)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  *(_QWORD *)(v0 + 40) = &type metadata for Features;
  v1 = sub_2291A53DC();
  *(_BYTE *)(v0 + 16) = 2;
  *(_QWORD *)(v0 + 48) = v1;
  v2 = sub_2291C3ADC();
  OUTLINED_FUNCTION_138();
  if ((v2 & 1) == 0)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v3 = sub_2291BDA5C(*(void **)(v0 + 56));
  if (!v3)
    v3 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (!v4)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v5 = *(_QWORD *)(*(_QWORD *)(v0 + 64) + 40);
  v6 = (_QWORD *)OUTLINED_FUNCTION_48_0();
  __swift_project_boxed_opaque_existential_1Tm(v6, v7);
  if ((sub_229192AA4(v5) & 1) == 0)
  {
    OUTLINED_FUNCTION_72_8();
    if ((sub_2291C3554() & 1) == 0)
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  OUTLINED_FUNCTION_72_8();
  if ((sub_2291C359C() & 1) != 0)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  if (*(_QWORD *)(*(_QWORD *)(v0 + 64) + 144))
  {
    sub_2291C43B8();
    if (v8)
    {
      OUTLINED_FUNCTION_95_4();
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
    }
  }
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v10;
  *v10 = v0;
  v10[1] = sub_2291BD6EC;
  return sub_2291BD414();
}

uint64_t sub_2291BD6EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_113();
  v4[10] = v2;
  v4[11] = v3;
  v4[12] = v5;
  v4[13] = v6;
  OUTLINED_FUNCTION_47();
  if (v0)
    return OUTLINED_FUNCTION_3_4(0, *(uint64_t (**)(void))(v1 + 8));
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_2291BD740()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  if (v1)
    sub_2291BDAB0(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  return OUTLINED_FUNCTION_3_4(v1 == 0, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2291BD784()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  sub_22911F9F0(v0 + 56);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 104);

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 192);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 232);
  sub_2291BDAB0(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 280));
  return v0;
}

uint64_t sub_2291BD7E4()
{
  sub_2291BD784();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LaunchAppUnsupportedValueStrategy()
{
  return objc_opt_self();
}

uint64_t sub_2291BD824(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22918FFB0;
  return sub_2291BA718(a1, a2);
}

uint64_t sub_2291BD888(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22918FE74;
  return sub_2291BA984(a1);
}

uint64_t sub_2291BD8D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  type metadata accessor for LaunchAppUnsupportedValueStrategy();
  *v1 = v0;
  v1[1] = sub_22918FF38;
  return sub_2291C3260();
}

void sub_2291BD950(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  v4 = (void *)sub_2291C46AC();
  OUTLINED_FUNCTION_21();
  objc_msgSend(a3, sel_setText_, v4);
  OUTLINED_FUNCTION_1_9(v4);
}

void sub_2291BD994(uint64_t a1, void *a2)
{
  sub_2291BD9BC(a1, a2, (uint64_t *)&unk_255A2DBF0, (SEL *)&selRef_setCommands_);
}

void sub_2291BD9A8(uint64_t a1, void *a2)
{
  sub_2291BD9BC(a1, a2, (uint64_t *)&unk_255A2FBA0, (SEL *)&selRef_setTemplateItems_);
}

void sub_2291BD9BC(uint64_t a1, void *a2, uint64_t *a3, SEL *a4)
{
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v6 = (id)sub_2291C4760();
  OUTLINED_FUNCTION_56();
  objc_msgSend(a2, *a4, v6);

}

void sub_2291BDA20(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;

  v4 = (void *)sub_2291C46AC();
  objc_msgSend(a3, sel_setText_, v4);
  OUTLINED_FUNCTION_1_9(v4);
}

uint64_t sub_2291BDA5C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_pegasusAppResults);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2291C4778();

  return v3;
}

uint64_t sub_2291BDAB0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2291BDAE0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2291BDB10()
{
  return sub_2291BBE58();
}

void sub_2291BDB18(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  void (*v4)(uint64_t);

  a3(0);
  v3 = OUTLINED_FUNCTION_48_0();
  v4(v3);
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2291BDB54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppLaunchDataModels.AppResultModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2291BDB98(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v28[3];
  uint64_t v29;
  _UNKNOWN **v30;
  _BYTE v31[24];
  ValueMetadata *v32;
  _UNKNOWN **v33;
  _QWORD v34[3];
  uint64_t v35;
  _UNKNOWN **v36;

  v35 = type metadata accessor for BaseDialogProvider();
  v36 = &off_24F1DC048;
  v34[0] = a2;
  v32 = &type metadata for AppLaunchFeatureFlagsImpl;
  v33 = &off_24F1DCFA8;
  v29 = type metadata accessor for MarketplaceInfoProvider();
  v30 = &off_24F1DCC88;
  v28[0] = a6;
  type metadata accessor for LaunchAppUnsupportedValueStrategy();
  v14 = swift_allocObject();
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (_QWORD *)((char *)&v28[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v18 + 16))(v17);
  v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, (uint64_t)v32);
  MEMORY[0x24BDAC7A8](v19);
  (*(void (**)(void))(v20 + 16))();
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v28, v29);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (_QWORD *)((char *)&v28[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  v25 = sub_2291BDD7C(a1, *v17, a3, a4, a5, *v23, a7, v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
  return v25;
}

uint64_t sub_2291BDD7C(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;

  v16 = sub_2291C37D0();
  v17 = MEMORY[0x24BE97F18];
  *(_QWORD *)(a8 + 128) = v16;
  *(_QWORD *)(a8 + 136) = v17;
  *(_QWORD *)(a8 + 104) = a4;
  *(_QWORD *)(a8 + 256) = type metadata accessor for InstalledAppProvider();
  *(_QWORD *)(a8 + 264) = &protocol witness table for InstalledAppProvider;
  *(_QWORD *)(a8 + 232) = a7;
  *(_QWORD *)(a8 + 80) = type metadata accessor for BaseDialogProvider();
  *(_QWORD *)(a8 + 88) = &off_24F1DC048;
  *(_QWORD *)(a8 + 56) = a2;
  *(_QWORD *)(a8 + 176) = &type metadata for AppLaunchFeatureFlagsImpl;
  *(_QWORD *)(a8 + 184) = &off_24F1DCFA8;
  *(_QWORD *)(a8 + 216) = type metadata accessor for MarketplaceInfoProvider();
  *(_QWORD *)(a8 + 224) = &off_24F1DCC88;
  *(_QWORD *)(a8 + 192) = a6;
  *(_OWORD *)(a8 + 272) = 0u;
  *(_OWORD *)(a8 + 288) = 0u;
  *(_BYTE *)(a8 + 304) = 0;
  sub_22911F6D8(a1, a8 + 16);
  *(_QWORD *)(a8 + 96) = a3;
  *(_QWORD *)(a8 + 144) = a5;
  return a8;
}

uint64_t OUTLINED_FUNCTION_13_22(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return sub_2291C4790();
}

uint64_t OUTLINED_FUNCTION_18_16(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_21_13(uint64_t a1)
{
  return sub_2291574F8(a1);
}

uint64_t OUTLINED_FUNCTION_24_13@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_27_14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_28_15()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_29_18@<X0>(uint64_t a1@<X8>)
{
  return sub_22919AD48(0xD000000000000010, (a1 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_33_12()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[23] + 8))(v0[24], v0[22]);
}

uint64_t OUTLINED_FUNCTION_37_13()
{
  _QWORD *v0;
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1Tm(v0, v1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_40_11()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_41_11()
{
  return sub_2291C3818();
}

uint64_t OUTLINED_FUNCTION_42_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_43_9@<X0>(_BYTE *a1@<X1>, char a2@<W8>)
{
  *a1 = a2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_44_11@<X0>(uint64_t a1@<X8>)
{
  return sub_2291BDAE0(*(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 280));
}

uint64_t OUTLINED_FUNCTION_53_9()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 176) = v0;
  return sub_2291C35B4();
}

uint64_t OUTLINED_FUNCTION_56_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_59_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_61_7()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 344);
}

uint64_t OUTLINED_FUNCTION_62_8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 16);
}

uint64_t OUTLINED_FUNCTION_63_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_66_7()
{
  return sub_2291C3914();
}

uint64_t OUTLINED_FUNCTION_70_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_71_5(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_2291C3110();
}

uint64_t OUTLINED_FUNCTION_72_8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 40);
  __swift_project_boxed_opaque_existential_1Tm(v0, v2);
  return v2;
}

void OUTLINED_FUNCTION_75_5()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

void OUTLINED_FUNCTION_76_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_78_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD);

  return v20(v18, a18, *(_QWORD *)(v19 + 304));
}

uint64_t OUTLINED_FUNCTION_82_3()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_84_5()
{
  sub_2291BCE14();
}

__n128 OUTLINED_FUNCTION_87_3(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)(v1 - 112);
  a1[1] = result;
  return result;
}

void OUTLINED_FUNCTION_88_4()
{
  void *v0;

}

uint64_t *OUTLINED_FUNCTION_91_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t *v3;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return __swift_allocate_boxed_opaque_existential_1(v3);
}

uint64_t OUTLINED_FUNCTION_92_3()
{
  return type metadata accessor for AppLaunchDataModels(0);
}

uint64_t OUTLINED_FUNCTION_93_4()
{
  return type metadata accessor for LaunchAppCATPatternsExecutor(0);
}

uint64_t OUTLINED_FUNCTION_95_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_96_4()
{
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_97_3()
{
  return static AppSearchCommands.searchAppStoreAceCommand(appName:)();
}

uint64_t OUTLINED_FUNCTION_99_4()
{
  return sub_2291C3974();
}

uint64_t OUTLINED_FUNCTION_100_3()
{
  return sub_2291C35D8();
}

uint64_t OUTLINED_FUNCTION_104_4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 160);
}

ValueMetadata *type metadata accessor for AppLaunchFeatureFlagsImpl()
{
  return &type metadata for AppLaunchFeatureFlagsImpl;
}

const char *sub_2291BE158()
{
  return "SiriAppLaunch";
}

const char *sub_2291BE16C(char a1)
{
  if (!a1)
    return "applaunch_QuickAction";
  if (a1 == 1)
    return "applaunch_watchos_cdtvc";
  return "applaunch_SuperSmart";
}

const char *sub_2291BE1B0()
{
  return sub_2291BE158();
}

const char *sub_2291BE1B8()
{
  char *v0;

  return sub_2291BE16C(*v0);
}

uint64_t sub_2291BE1C0()
{
  char v0;
  char v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  if ((sub_2291C30F8() & 1) != 0)
  {
    v3 = &type metadata for Features;
    v4 = sub_2291A53DC();
    v2[0] = 2;
    v0 = sub_2291C3ADC();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  }
  else
  {
    v0 = 0;
  }
  return v0 & 1;
}

uint64_t storeEnumTagSinglePayload for Features(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2291BE270 + 4 * byte_2291CCAB5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2291BE2A4 + 4 * byte_2291CCAB0[v4]))();
}

uint64_t sub_2291BE2A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2291BE2AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2291BE2B4);
  return result;
}

uint64_t sub_2291BE2C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2291BE2C8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2291BE2CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2291BE2D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

unint64_t sub_2291BE2F4()
{
  unint64_t result;

  result = qword_255A2FBE0;
  if (!qword_255A2FBE0)
  {
    result = MEMORY[0x22E2C4E20](&unk_2291CCB78, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_255A2FBE0);
  }
  return result;
}

void LaunchAppIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_22();
  LaunchAppIntentResponse.init(code:userActivity:)(a1, a2);
  OUTLINED_FUNCTION_6();
}

uint64_t LaunchAppApplicationUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 6) < 0xFFFFFFFFFFFFFFFBLL)
    return 0;
  return result;
}

id LaunchAppIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LaunchAppIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

void LaunchAppIntent.init(coder:)()
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
  v7.super_class = (Class)type metadata accessor for LaunchAppIntent();
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

void LaunchAppIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2291C46AC();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  OUTLINED_FUNCTION_6();
}

void LaunchAppIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  objc_super v6;

  if (a2)
  {
    v5 = (void *)sub_2291C46AC();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for LaunchAppIntent();
  objc_msgSendSuper2(&v6, sel_initWithIdentifier_backingStore_, v5, a3);

  OUTLINED_FUNCTION_8_4();
}

uint64_t LaunchAppIntent.__allocating_init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_14_18();
  OUTLINED_FUNCTION_10_20();
  if (v3)
  {
    v4 = (void *)sub_2291C4658();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

void *LaunchAppIntent.init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_14_18();
  OUTLINED_FUNCTION_10_20();
  if (v3)
  {
    v4 = (void *)sub_2291C4658();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v4 = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for LaunchAppIntent();
  objc_msgSendSuper2(&v6, sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

id LaunchAppIntent.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for LaunchAppIntent);
}

unint64_t LaunchAppIntentResponseCode.init(rawValue:)(unint64_t result)
{
  unint64_t v1;

  if (result - 100 >= 3)
    v1 = 0;
  else
    v1 = result;
  if (result >= 7)
    return v1;
  return result;
}

uint64_t sub_2291BE770()
{
  _QWORD *v0;

  return sub_2291C10FC(*v0);
}

void sub_2291BE778()
{
  sub_2291C117C();
}

uint64_t sub_2291BE780(uint64_t a1)
{
  _QWORD *v1;

  return sub_2291C157C(a1, *v1);
}

unint64_t sub_2291BE788@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = LaunchAppIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t LaunchAppIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___LaunchAppIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2291BE840(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___LaunchAppIntentResponse_code);
  result = OUTLINED_FUNCTION_11_17();
  *v3 = a1;
  return result;
}

char *LaunchAppIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___LaunchAppIntentResponse_code];
  OUTLINED_FUNCTION_11_17();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for LaunchAppIntent()
{
  return objc_opt_self();
}

id LaunchAppIntentResponse.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_init);
}

id LaunchAppIntentResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_12_19(OBJC_IVAR___LaunchAppIntentResponse_code);
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for LaunchAppIntentResponse()
{
  return objc_opt_self();
}

uint64_t LaunchAppIntentResponse.__allocating_init(coder:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithCoder_);
  OUTLINED_FUNCTION_161();
  return v0;
}

void LaunchAppIntentResponse.init(coder:)()
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
  v7.super_class = (Class)OUTLINED_FUNCTION_12_19(OBJC_IVAR___LaunchAppIntentResponse_code);
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

uint64_t LaunchAppIntentResponse.__allocating_init(backingStore:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithBackingStore_);
  OUTLINED_FUNCTION_161();
  return v0;
}

void LaunchAppIntentResponse.init(backingStore:)()
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
  v7.super_class = (Class)OUTLINED_FUNCTION_12_19(OBJC_IVAR___LaunchAppIntentResponse_code);
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithBackingStore_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

void LaunchAppIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v1;

  if (a1)
  {
    sub_2291C4658();
    OUTLINED_FUNCTION_56();
  }
  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithPropertiesByName_);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_6();
}

void LaunchAppIntentResponse.init(propertiesByName:)(uint64_t a1)
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

  *(_QWORD *)&v1[OBJC_IVAR___LaunchAppIntentResponse_code] = 0;
  if (a1)
  {
    sub_2291C4658();
    OUTLINED_FUNCTION_56();
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for LaunchAppIntentResponse();
  v8 = OUTLINED_FUNCTION_3_18((uint64_t)v9.super_class, sel_initWithPropertiesByName_, v2, v3, v4, v5, v6, v7, v9);
  OUTLINED_FUNCTION_161();
  if (v1)

  OUTLINED_FUNCTION_8_4();
}

id LaunchAppIntentResponse.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for LaunchAppIntentResponse);
}

uint64_t sub_2291BEC88@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = LaunchAppApplicationUnsupportedReason.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static LaunchAppApplicationResolutionResult.unsupported(forReason:)()
{
  void *ObjCClassFromMetadata;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  return OUTLINED_FUNCTION_7_26(ObjCClassFromMetadata, sel_unsupportedWithReason_);
}

void LaunchAppApplicationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = OUTLINED_FUNCTION_1_22();
  v4 = (void *)sub_2291C4658();
  OUTLINED_FUNCTION_56();
  objc_msgSend(v3, sel_initWithJSONDictionary_forIntent_, v4, a2);

  OUTLINED_FUNCTION_6();
}

void LaunchAppApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  objc_super v6;

  v4 = (void *)sub_2291C4658();
  OUTLINED_FUNCTION_56();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for LaunchAppApplicationResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v4, a2);
  OUTLINED_FUNCTION_161();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_8_4();
}

uint64_t type metadata accessor for LaunchAppApplicationResolutionResult()
{
  return objc_opt_self();
}

id LaunchAppApplicationResolutionResult.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for LaunchAppApplicationResolutionResult);
}

id sub_2291BEEAC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_2291BEEE0()
{
  unint64_t result;

  result = qword_255A2FBF0;
  if (!qword_255A2FBF0)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for LaunchAppIntentResponseCode, &type metadata for LaunchAppIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255A2FBF0);
  }
  return result;
}

unint64_t sub_2291BEF20()
{
  unint64_t result;

  result = qword_255A2FBF8;
  if (!qword_255A2FBF8)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for LaunchAppApplicationUnsupportedReason, &type metadata for LaunchAppApplicationUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_255A2FBF8);
  }
  return result;
}

uint64_t sub_2291BEF5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = LaunchAppIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2291BEF84(uint64_t *a1)
{
  return sub_2291BE840(*a1);
}

ValueMetadata *type metadata accessor for LaunchAppIntentResponseCode()
{
  return &type metadata for LaunchAppIntentResponseCode;
}

ValueMetadata *type metadata accessor for LaunchAppApplicationUnsupportedReason()
{
  return &type metadata for LaunchAppApplicationUnsupportedReason;
}

id OUTLINED_FUNCTION_1_22()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

id OUTLINED_FUNCTION_3_18(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v9;

  return objc_msgSendSuper2(&a9, a2, v9);
}

uint64_t OUTLINED_FUNCTION_5_23()
{
  return sub_2291C46AC();
}

id OUTLINED_FUNCTION_7_26(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_10_20()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_17()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_12_19@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return type metadata accessor for LaunchAppIntentResponse();
}

uint64_t OUTLINED_FUNCTION_13_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14_18()
{
  return sub_2291C46AC();
}

void CloseAppIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_22();
  CloseAppIntentResponse.init(code:userActivity:)(a1, a2);
  OUTLINED_FUNCTION_6();
}

uint64_t CloseAppApplicationUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  uint64_t v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = 0;
  if (a1 == 1)
    return 1;
  else
    return v1;
}

id CloseAppIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloseAppIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

void CloseAppIntent.init(coder:)()
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
  v7.super_class = (Class)type metadata accessor for CloseAppIntent();
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

void CloseAppIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2291C46AC();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  OUTLINED_FUNCTION_6();
}

void CloseAppIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  objc_super v6;

  if (a2)
  {
    v5 = (void *)sub_2291C46AC();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for CloseAppIntent();
  objc_msgSendSuper2(&v6, sel_initWithIdentifier_backingStore_, v5, a3);

  OUTLINED_FUNCTION_8_4();
}

uint64_t CloseAppIntent.__allocating_init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_14_18();
  OUTLINED_FUNCTION_10_20();
  if (v3)
  {
    v4 = (void *)sub_2291C4658();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

void *CloseAppIntent.init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_14_18();
  OUTLINED_FUNCTION_10_20();
  if (v3)
  {
    v4 = (void *)sub_2291C4658();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v4 = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for CloseAppIntent();
  objc_msgSendSuper2(&v6, sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

id CloseAppIntent.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for CloseAppIntent);
}

unint64_t CloseAppIntentResponseCode.init(rawValue:)(unint64_t result)
{
  uint64_t v1;

  if (result == 100)
    v1 = 100;
  else
    v1 = 0;
  if (result >= 7)
    return v1;
  return result;
}

unint64_t sub_2291BF484@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = CloseAppIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t CloseAppIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CloseAppIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2291BF53C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CloseAppIntentResponse_code);
  result = OUTLINED_FUNCTION_11_17();
  *v3 = a1;
  return result;
}

char *CloseAppIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___CloseAppIntentResponse_code];
  OUTLINED_FUNCTION_11_17();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for CloseAppIntent()
{
  return objc_opt_self();
}

id CloseAppIntentResponse.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_init);
}

id CloseAppIntentResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_12_20(OBJC_IVAR___CloseAppIntentResponse_code);
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for CloseAppIntentResponse()
{
  return objc_opt_self();
}

uint64_t CloseAppIntentResponse.__allocating_init(coder:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithCoder_);
  OUTLINED_FUNCTION_161();
  return v0;
}

void CloseAppIntentResponse.init(coder:)()
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
  v7.super_class = (Class)OUTLINED_FUNCTION_12_20(OBJC_IVAR___CloseAppIntentResponse_code);
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

uint64_t CloseAppIntentResponse.__allocating_init(backingStore:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithBackingStore_);
  OUTLINED_FUNCTION_161();
  return v0;
}

void CloseAppIntentResponse.init(backingStore:)()
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
  v7.super_class = (Class)OUTLINED_FUNCTION_12_20(OBJC_IVAR___CloseAppIntentResponse_code);
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithBackingStore_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

void CloseAppIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v1;

  if (a1)
  {
    sub_2291C4658();
    OUTLINED_FUNCTION_56();
  }
  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithPropertiesByName_);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_6();
}

void CloseAppIntentResponse.init(propertiesByName:)(uint64_t a1)
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

  *(_QWORD *)&v1[OBJC_IVAR___CloseAppIntentResponse_code] = 0;
  if (a1)
  {
    sub_2291C4658();
    OUTLINED_FUNCTION_56();
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for CloseAppIntentResponse();
  v8 = OUTLINED_FUNCTION_3_18((uint64_t)v9.super_class, sel_initWithPropertiesByName_, v2, v3, v4, v5, v6, v7, v9);
  OUTLINED_FUNCTION_161();
  if (v1)

  OUTLINED_FUNCTION_8_4();
}

id CloseAppIntentResponse.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for CloseAppIntentResponse);
}

uint64_t sub_2291BF988@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = CloseAppApplicationUnsupportedReason.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static CloseAppApplicationResolutionResult.unsupported(forReason:)()
{
  void *ObjCClassFromMetadata;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  return OUTLINED_FUNCTION_7_26(ObjCClassFromMetadata, sel_unsupportedWithReason_);
}

void CloseAppApplicationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = OUTLINED_FUNCTION_1_22();
  v4 = (void *)sub_2291C4658();
  OUTLINED_FUNCTION_56();
  objc_msgSend(v3, sel_initWithJSONDictionary_forIntent_, v4, a2);

  OUTLINED_FUNCTION_6();
}

void CloseAppApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;
  objc_super v6;

  v4 = (void *)sub_2291C4658();
  OUTLINED_FUNCTION_56();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CloseAppApplicationResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v4, a2);
  OUTLINED_FUNCTION_161();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_8_4();
}

uint64_t type metadata accessor for CloseAppApplicationResolutionResult()
{
  return objc_opt_self();
}

id CloseAppApplicationResolutionResult.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for CloseAppApplicationResolutionResult);
}

unint64_t sub_2291BFBB0()
{
  unint64_t result;

  result = qword_255A2FC80;
  if (!qword_255A2FC80)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for CloseAppIntentResponseCode, &type metadata for CloseAppIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255A2FC80);
  }
  return result;
}

unint64_t sub_2291BFBF0()
{
  unint64_t result;

  result = qword_255A2FC88;
  if (!qword_255A2FC88)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for CloseAppApplicationUnsupportedReason, &type metadata for CloseAppApplicationUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_255A2FC88);
  }
  return result;
}

uint64_t sub_2291BFC2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CloseAppIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2291BFC54(uint64_t *a1)
{
  return sub_2291BF53C(*a1);
}

ValueMetadata *type metadata accessor for CloseAppIntentResponseCode()
{
  return &type metadata for CloseAppIntentResponseCode;
}

ValueMetadata *type metadata accessor for CloseAppApplicationUnsupportedReason()
{
  return &type metadata for CloseAppApplicationUnsupportedReason;
}

uint64_t OUTLINED_FUNCTION_12_20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return type metadata accessor for CloseAppIntentResponse();
}

void DeepLaunchIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_22();
  DeepLaunchIntentResponse.init(code:userActivity:)(a1, a2);
  OUTLINED_FUNCTION_6();
}

uint64_t DeepLaunchPageNameUnsupportedReason.init(rawValue:)(uint64_t a1)
{
  uint64_t v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = 0;
  if (a1 == 1)
    return 1;
  else
    return v1;
}

id DeepLaunchIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

void DeepLaunchIntent.init(coder:)()
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
  v7.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

void DeepLaunchIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2291C46AC();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithIdentifier_backingStore_, v6, a3);

  OUTLINED_FUNCTION_6();
}

void DeepLaunchIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  objc_super v6;

  if (a2)
  {
    v5 = (void *)sub_2291C46AC();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  objc_msgSendSuper2(&v6, sel_initWithIdentifier_backingStore_, v5, a3);

  OUTLINED_FUNCTION_8_4();
}

uint64_t DeepLaunchIntent.__allocating_init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_14_18();
  OUTLINED_FUNCTION_10_20();
  if (v3)
  {
    v4 = (void *)sub_2291C4658();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

void DeepLaunchIntent.init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  OUTLINED_FUNCTION_5_23();
  OUTLINED_FUNCTION_13_23();
  OUTLINED_FUNCTION_14_18();
  OUTLINED_FUNCTION_10_20();
  if (v3)
  {
    v4 = (void *)sub_2291C4658();
    OUTLINED_FUNCTION_74_1();
  }
  else
  {
    v4 = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeepLaunchIntent();
  objc_msgSendSuper2(&v5, sel_initWithDomain_verb_parametersByName_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  OUTLINED_FUNCTION_138_1();
}

id DeepLaunchIntent.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for DeepLaunchIntent);
}

unint64_t DeepLaunchIntentResponseCode.init(rawValue:)(unint64_t result)
{
  uint64_t v1;

  if (result == 100)
    v1 = 100;
  else
    v1 = 0;
  if (result >= 7)
    return v1;
  return result;
}

unint64_t sub_2291C00E0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = DeepLaunchIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t DeepLaunchIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DeepLaunchIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2291C0198(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___DeepLaunchIntentResponse_code);
  result = OUTLINED_FUNCTION_11_17();
  *v3 = a1;
  return result;
}

char *DeepLaunchIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___DeepLaunchIntentResponse_code];
  OUTLINED_FUNCTION_11_17();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

uint64_t type metadata accessor for DeepLaunchIntent()
{
  return objc_opt_self();
}

id DeepLaunchIntentResponse.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_init);
}

id DeepLaunchIntentResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_12_21(OBJC_IVAR___DeepLaunchIntentResponse_code);
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DeepLaunchIntentResponse()
{
  return objc_opt_self();
}

uint64_t DeepLaunchIntentResponse.__allocating_init(coder:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithCoder_);
  OUTLINED_FUNCTION_161();
  return v0;
}

void DeepLaunchIntentResponse.init(coder:)()
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
  v7.super_class = (Class)OUTLINED_FUNCTION_12_21(OBJC_IVAR___DeepLaunchIntentResponse_code);
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

uint64_t DeepLaunchIntentResponse.__allocating_init(backingStore:)()
{
  uint64_t v0;
  id v1;

  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithBackingStore_);
  OUTLINED_FUNCTION_161();
  return v0;
}

void DeepLaunchIntentResponse.init(backingStore:)()
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
  v7.super_class = (Class)OUTLINED_FUNCTION_12_21(OBJC_IVAR___DeepLaunchIntentResponse_code);
  OUTLINED_FUNCTION_3_18((uint64_t)v7.super_class, sel_initWithBackingStore_, v1, v2, v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_33_5();
}

void DeepLaunchIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v1;

  if (a1)
  {
    sub_2291C4658();
    OUTLINED_FUNCTION_13_24();
  }
  v1 = OUTLINED_FUNCTION_1_22();
  OUTLINED_FUNCTION_7_26(v1, sel_initWithPropertiesByName_);
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_6();
}

void DeepLaunchIntentResponse.init(propertiesByName:)(uint64_t a1)
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

  *(_QWORD *)&v1[OBJC_IVAR___DeepLaunchIntentResponse_code] = 0;
  if (a1)
  {
    sub_2291C4658();
    OUTLINED_FUNCTION_13_24();
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for DeepLaunchIntentResponse();
  v8 = OUTLINED_FUNCTION_3_18((uint64_t)v9.super_class, sel_initWithPropertiesByName_, v2, v3, v4, v5, v6, v7, v9);
  OUTLINED_FUNCTION_161();
  if (v1)

  OUTLINED_FUNCTION_8_4();
}

id DeepLaunchIntentResponse.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for DeepLaunchIntentResponse);
}

void DeepLaunchRequestedApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  sub_2291C07A8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchRequestedApplicationResolutionResult);
}

uint64_t type metadata accessor for DeepLaunchRequestedApplicationResolutionResult()
{
  return objc_opt_self();
}

id DeepLaunchRequestedApplicationResolutionResult.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for DeepLaunchRequestedApplicationResolutionResult);
}

uint64_t sub_2291C0684@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = DeepLaunchPageNameUnsupportedReason.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id _s20SiriAppLaunchIntents04DeepC36RequestedApplicationResolutionResultC11unsupported9forReasonACXDAA0ecfg11UnsupportedL0O_tFZ_0()
{
  void *ObjCClassFromMetadata;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  return OUTLINED_FUNCTION_7_26(ObjCClassFromMetadata, sel_unsupportedWithReason_);
}

void _s20SiriAppLaunchIntents04DeepC36RequestedApplicationResolutionResultC14JSONDictionary6intentACSgSDySSypG_So8INIntentCtcfC_0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = OUTLINED_FUNCTION_1_22();
  v4 = (void *)sub_2291C4658();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_initWithJSONDictionary_forIntent_, v4, a2);

  OUTLINED_FUNCTION_6();
}

void DeepLaunchPageNameResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  sub_2291C07A8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for DeepLaunchPageNameResolutionResult);
}

void sub_2291C07A8(uint64_t a1, void *a2, uint64_t (*a3)(uint64_t))
{
  void *v3;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  objc_super v10;

  v6 = (void *)sub_2291C4658();
  v7 = OUTLINED_FUNCTION_74_1();
  v10.receiver = v3;
  v10.super_class = (Class)a3(v7);
  v8 = objc_msgSendSuper2(&v10, sel_initWithJSONDictionary_forIntent_, v6, a2);

  v9 = v8;
  if (v9)

  OUTLINED_FUNCTION_138_1();
}

uint64_t type metadata accessor for DeepLaunchPageNameResolutionResult()
{
  return objc_opt_self();
}

id DeepLaunchPageNameResolutionResult.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for DeepLaunchPageNameResolutionResult);
}

unint64_t sub_2291C08D0()
{
  unint64_t result;

  result = qword_255A2FD10;
  if (!qword_255A2FD10)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for DeepLaunchIntentResponseCode, &type metadata for DeepLaunchIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255A2FD10);
  }
  return result;
}

unint64_t sub_2291C0910()
{
  unint64_t result;

  result = qword_255A2FD18;
  if (!qword_255A2FD18)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for DeepLaunchRequestedApplicationUnsupportedReason, &type metadata for DeepLaunchRequestedApplicationUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_255A2FD18);
  }
  return result;
}

unint64_t sub_2291C0950()
{
  unint64_t result;

  result = qword_255A2FD20;
  if (!qword_255A2FD20)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for DeepLaunchPageNameUnsupportedReason, &type metadata for DeepLaunchPageNameUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_255A2FD20);
  }
  return result;
}

uint64_t sub_2291C098C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = DeepLaunchIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2291C09B4(uint64_t *a1)
{
  return sub_2291C0198(*a1);
}

void type metadata accessor for DeepLaunchIntentResponseCode()
{
  OUTLINED_FUNCTION_55_1();
}

void type metadata accessor for DeepLaunchRequestedApplicationUnsupportedReason()
{
  OUTLINED_FUNCTION_55_1();
}

void type metadata accessor for DeepLaunchPageNameUnsupportedReason()
{
  OUTLINED_FUNCTION_55_1();
}

uint64_t OUTLINED_FUNCTION_12_21@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return type metadata accessor for DeepLaunchIntentResponse();
}

uint64_t OUTLINED_FUNCTION_13_24()
{
  return swift_bridgeObjectRelease();
}

BOOL InAppVerb.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_2291C0A48@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  _BOOL8 result;
  char v4;

  result = InAppVerb.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static InAppVerbResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2291C0ABC(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static InAppVerbResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2291C0ABC(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_2291C0ABC(uint64_t a1, SEL *a2)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);
}

id InAppVerbResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  void *v3;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v6 = objc_msgSend(v5, sel_initWithJSONDictionary_forIntent_, v3, a2);

  return v6;
}

id InAppVerbResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  objc_super v8;

  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for InAppVerbResolutionResult();
  v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v3, a2);

  v6 = v5;
  if (v6)

  return v6;
}

uint64_t type metadata accessor for InAppVerbResolutionResult()
{
  return objc_opt_self();
}

id InAppVerbResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InAppVerbResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2291C0CF8()
{
  unint64_t result;

  result = qword_255A2FDC8;
  if (!qword_255A2FDC8)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for InAppVerb, &type metadata for InAppVerb);
    atomic_store(result, (unint64_t *)&qword_255A2FDC8);
  }
  return result;
}

ValueMetadata *type metadata accessor for InAppVerb()
{
  return &type metadata for InAppVerb;
}

unint64_t AppReference.init(rawValue:)(unint64_t result)
{
  if (result > 5)
    return 0;
  return result;
}

unint64_t sub_2291C0D58@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = AppReference.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static AppReferenceResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2291C0ABC(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static AppReferenceResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2291C0ABC(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id AppReferenceResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  void *v3;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v6 = objc_msgSend(v5, sel_initWithJSONDictionary_forIntent_, v3, a2);

  return v6;
}

id AppReferenceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  objc_super v8;

  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for AppReferenceResolutionResult();
  v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v3, a2);

  v6 = v5;
  if (v6)

  return v6;
}

uint64_t type metadata accessor for AppReferenceResolutionResult()
{
  return objc_opt_self();
}

id AppReferenceResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppReferenceResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2291C0FC8()
{
  unint64_t result;

  result = qword_255A2FDF8;
  if (!qword_255A2FDF8)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for AppReference, &type metadata for AppReference);
    atomic_store(result, (unint64_t *)&qword_255A2FDF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppReference()
{
  return &type metadata for AppReference;
}

void sub_2291C1014()
{
  sub_2291C1580();
}

void sub_2291C1020()
{
  sub_2291C170C();
}

void sub_2291C102C(uint64_t a1)
{
  sub_2291C1080(a1, (void (*)(uint64_t))sub_22915C50C);
}

void sub_2291C1038(uint64_t a1)
{
  sub_2291C1080(a1, (void (*)(uint64_t))sub_22915CC7C);
}

void sub_2291C1044()
{
  sub_2291C179C();
}

void sub_2291C1050()
{
  OUTLINED_FUNCTION_125_2();
  OUTLINED_FUNCTION_9_23();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C1074(uint64_t a1)
{
  sub_2291C1080(a1, (void (*)(uint64_t))sub_22918DD38);
}

void sub_2291C1080(uint64_t a1, void (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_125_2();
  a2(a1);
  OUTLINED_FUNCTION_3_19();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C10C8()
{
  OUTLINED_FUNCTION_125_2();
  OUTLINED_FUNCTION_20_21();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C10F0()
{
  sub_2291C16A8();
}

void sub_2291C1100()
{
  OUTLINED_FUNCTION_125_2();
  OUTLINED_FUNCTION_232();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

uint64_t sub_2291C1128(uint64_t a1, char a2)
{
  if (!a2)
    OUTLINED_FUNCTION_18_17();
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

void sub_2291C117C()
{
  OUTLINED_FUNCTION_2_21();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_2291C1194()
{
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

uint64_t sub_2291C11EC()
{
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

void sub_2291C1240()
{
  OUTLINED_FUNCTION_10_21();
  __asm { BR              X10 }
}

uint64_t sub_2291C1268()
{
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

void sub_2291C12E8()
{
  OUTLINED_FUNCTION_15_14();
  __asm { BR              X10 }
}

uint64_t sub_2291C1310()
{
  OUTLINED_FUNCTION_16_17();
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

void sub_2291C13C8()
{
  OUTLINED_FUNCTION_10_21();
  __asm { BR              X10 }
}

uint64_t sub_2291C13F0()
{
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

uint64_t sub_2291C143C()
{
  return sub_2291C4700();
}

void sub_2291C1450()
{
  OUTLINED_FUNCTION_15_14();
  __asm { BR              X10 }
}

uint64_t sub_2291C1478()
{
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

uint64_t sub_2291C1518(uint64_t a1, char a2)
{
  if (!a2)
    OUTLINED_FUNCTION_13_25();
  OUTLINED_FUNCTION_3_19();
  return OUTLINED_FUNCTION_90_2();
}

void sub_2291C1580()
{
  char v0;

  OUTLINED_FUNCTION_6_22();
  if (!v0)
    OUTLINED_FUNCTION_13_25();
  OUTLINED_FUNCTION_3_19();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C15F4(uint64_t a1, uint64_t a2)
{
  sub_2291C1660(a1, a2, (void (*)(uint64_t))sub_22915C50C);
}

void sub_2291C1600()
{
  OUTLINED_FUNCTION_181();
  OUTLINED_FUNCTION_9_23();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C1624()
{
  OUTLINED_FUNCTION_6_22();
  OUTLINED_FUNCTION_20_21();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C1648(uint64_t a1, uint64_t a2)
{
  sub_2291C1660(a1, a2, (void (*)(uint64_t))sub_22915CC7C);
}

void sub_2291C1654(uint64_t a1, uint64_t a2)
{
  sub_2291C1660(a1, a2, (void (*)(uint64_t))sub_22918DD38);
}

void sub_2291C1660(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_181();
  a3(a2);
  OUTLINED_FUNCTION_3_19();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C16A8()
{
  OUTLINED_FUNCTION_6_22();
  OUTLINED_FUNCTION_3_19();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C170C()
{
  OUTLINED_FUNCTION_6_22();
  OUTLINED_FUNCTION_3_19();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C1774()
{
  OUTLINED_FUNCTION_181();
  OUTLINED_FUNCTION_232();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

void sub_2291C179C()
{
  char v0;

  OUTLINED_FUNCTION_6_22();
  if (!v0)
    OUTLINED_FUNCTION_18_17();
  OUTLINED_FUNCTION_3_19();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_107_1();
  OUTLINED_FUNCTION_14_3();
}

unint64_t AppNoun.init(rawValue:)(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

void sub_2291C1814()
{
  sub_2291C1100();
}

void sub_2291C182C()
{
  sub_2291C1774();
}

unint64_t sub_2291C1844@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = AppNoun.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static AppNounResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2291C0ABC(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static AppNounResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2291C0ABC(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id AppNounResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  void *v3;
  id v5;
  id v6;

  v5 = objc_allocWithZone(v2);
  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v6 = objc_msgSend(v5, sel_initWithJSONDictionary_forIntent_, v3, a2);

  return v6;
}

id AppNounResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v5;
  id v6;
  objc_super v8;

  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for AppNounResolutionResult();
  v5 = objc_msgSendSuper2(&v8, sel_initWithJSONDictionary_forIntent_, v3, a2);

  v6 = v5;
  if (v6)

  return v6;
}

uint64_t type metadata accessor for AppNounResolutionResult()
{
  return objc_opt_self();
}

id AppNounResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppNounResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2291C1AB4()
{
  unint64_t result;

  result = qword_255A2FE28;
  if (!qword_255A2FE28)
  {
    result = MEMORY[0x22E2C4E20](&protocol conformance descriptor for AppNoun, &type metadata for AppNoun);
    atomic_store(result, (unint64_t *)&qword_255A2FE28);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppNoun()
{
  return &type metadata for AppNoun;
}

uint64_t OUTLINED_FUNCTION_2_21()
{
  return sub_2291C4D18();
}

uint64_t OUTLINED_FUNCTION_3_19()
{
  return sub_2291C4700();
}

uint64_t OUTLINED_FUNCTION_6_22()
{
  return sub_2291C4D0C();
}

uint64_t OUTLINED_FUNCTION_9_23()
{
  return sub_2291C4700();
}

void OUTLINED_FUNCTION_20_21()
{
  sub_2291C13C8();
}

id static ApplicationResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_24();
  v8.super_class = (Class)&OBJC_METACLASS___ApplicationResolutionResult;
  v6 = OUTLINED_FUNCTION_3_18((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_23(v6);
}

void static ApplicationResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_20();
    swift_bridgeObjectRetain();
    sub_2291C4B5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2291C4CA0();
    OUTLINED_FUNCTION_14_20();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_20();
  v2 = (void *)sub_2291C4760();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___ApplicationResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_8_4();
}

unint64_t sub_2291C1D14()
{
  unint64_t result;

  result = qword_255A2FE80;
  if (!qword_255A2FE80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A2FE80);
  }
  return result;
}

id static ApplicationResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_24();
  v8.super_class = (Class)&OBJC_METACLASS___ApplicationResolutionResult;
  v6 = OUTLINED_FUNCTION_3_18((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_23(v6);
}

uint64_t static Application.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t Application.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_27();
  if (v5)
  {
    sub_2291C46AC();
    OUTLINED_FUNCTION_8_21();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_23();
  OUTLINED_FUNCTION_10_22();
  if (v3)
  {
    OUTLINED_FUNCTION_13_26();
    OUTLINED_FUNCTION_11_18();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

void *Application.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_27();
  if (v5)
  {
    sub_2291C46AC();
    OUTLINED_FUNCTION_8_21();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_23();
  OUTLINED_FUNCTION_10_22();
  if (v3)
  {
    OUTLINED_FUNCTION_13_26();
    OUTLINED_FUNCTION_11_18();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for Application();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

uint64_t type metadata accessor for Application()
{
  return objc_opt_self();
}

uint64_t Application.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_161();
  return v1;
}

void *Application.init(coder:)()
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
  v8.super_class = (Class)type metadata accessor for Application();
  OUTLINED_FUNCTION_3_18((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_161();
  return v0;
}

id Application.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for Application);
}

void static ApplicationResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_25();
  __break(1u);
}

void static ApplicationResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_25();
  __break(1u);
}

void static ApplicationResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_25();
  __break(1u);
}

id ApplicationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_1_22();
  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void ApplicationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ApplicationResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_161();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_8_4();
}

uint64_t type metadata accessor for ApplicationResolutionResult()
{
  return objc_opt_self();
}

id ApplicationResolutionResult.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for ApplicationResolutionResult);
}

uint64_t OUTLINED_FUNCTION_0_25()
{
  return sub_2291C4B50();
}

id OUTLINED_FUNCTION_1_23(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_8_21()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_24()
{
  return swift_getObjCClassFromMetadata();
}

uint64_t OUTLINED_FUNCTION_10_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_23()
{
  return sub_2291C46AC();
}

uint64_t OUTLINED_FUNCTION_13_26()
{
  return sub_2291C46AC();
}

unint64_t OUTLINED_FUNCTION_14_20()
{
  return sub_2291C1D14();
}

uint64_t static InAppSearchCriteria.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t InAppSearchCriteria.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7_27();
  if (v5)
  {
    sub_2291C46AC();
    OUTLINED_FUNCTION_8_21();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_23();
  OUTLINED_FUNCTION_10_22();
  if (v3)
  {
    OUTLINED_FUNCTION_13_26();
    OUTLINED_FUNCTION_11_18();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

void *InAppSearchCriteria.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  OUTLINED_FUNCTION_7_27();
  if (v5)
  {
    sub_2291C46AC();
    OUTLINED_FUNCTION_8_21();
  }
  else
  {
    v0 = 0;
  }
  OUTLINED_FUNCTION_12_23();
  OUTLINED_FUNCTION_10_22();
  if (v3)
  {
    OUTLINED_FUNCTION_13_26();
    OUTLINED_FUNCTION_11_18();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for InAppSearchCriteria();
  objc_msgSendSuper2(&v7, sel_initWithIdentifier_displayString_pronunciationHint_, v0, v2, v4);
  OUTLINED_FUNCTION_161();

  return v1;
}

uint64_t type metadata accessor for InAppSearchCriteria()
{
  return objc_opt_self();
}

uint64_t InAppSearchCriteria.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(OUTLINED_FUNCTION_1_22(), sel_initWithCoder_, a1);
  OUTLINED_FUNCTION_161();
  return v1;
}

void *InAppSearchCriteria.init(coder:)()
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
  v8.super_class = (Class)type metadata accessor for InAppSearchCriteria();
  OUTLINED_FUNCTION_3_18((uint64_t)v8.super_class, sel_initWithCoder_, v1, v2, v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_161();
  return v0;
}

id InAppSearchCriteria.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for InAppSearchCriteria);
}

id static InAppSearchCriteriaResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_24();
  v8.super_class = (Class)&OBJC_METACLASS___InAppSearchCriteriaResolutionResult;
  v6 = OUTLINED_FUNCTION_3_18((uint64_t)v8.receiver, sel_successWithResolvedObject_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_23(v6);
}

void static InAppSearchCriteriaResolutionResult.disambiguation(with:)(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v4;

  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_14_20();
    swift_bridgeObjectRetain();
    sub_2291C4B5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2291C4CA0();
    OUTLINED_FUNCTION_14_20();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  OUTLINED_FUNCTION_14_20();
  v2 = (void *)sub_2291C4760();
  swift_bridgeObjectRelease();
  v4.receiver = ObjCClassFromMetadata;
  v4.super_class = (Class)&OBJC_METACLASS___InAppSearchCriteriaResolutionResult;
  v3 = objc_msgSendSuper2(&v4, sel_disambiguationWithObjectsToDisambiguate_, v2);

  OUTLINED_FUNCTION_8_4();
}

id static InAppSearchCriteriaResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)OUTLINED_FUNCTION_9_24();
  v8.super_class = (Class)&OBJC_METACLASS___InAppSearchCriteriaResolutionResult;
  v6 = OUTLINED_FUNCTION_3_18((uint64_t)v8.receiver, sel_confirmationRequiredWithObjectToConfirm_, v0, v1, v2, v3, v4, v5, v8);
  return OUTLINED_FUNCTION_1_23(v6);
}

void static InAppSearchCriteriaResolutionResult.success(with:)()
{
  OUTLINED_FUNCTION_0_26();
  __break(1u);
}

void static InAppSearchCriteriaResolutionResult.disambiguation(with:)()
{
  OUTLINED_FUNCTION_0_26();
  __break(1u);
}

void static InAppSearchCriteriaResolutionResult.confirmationRequired(with:)()
{
  OUTLINED_FUNCTION_0_26();
  __break(1u);
}

id InAppSearchCriteriaResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = OUTLINED_FUNCTION_1_22();
  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v5 = objc_msgSend(v4, sel_initWithJSONDictionary_forIntent_, v2, a2);

  return v5;
}

void InAppSearchCriteriaResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  sub_2291C4658();
  OUTLINED_FUNCTION_50_5();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for InAppSearchCriteriaResolutionResult();
  objc_msgSendSuper2(&v6, sel_initWithJSONDictionary_forIntent_, v3, a2);
  OUTLINED_FUNCTION_161();
  v5 = v2;

  if (v5)
  OUTLINED_FUNCTION_8_4();
}

uint64_t type metadata accessor for InAppSearchCriteriaResolutionResult()
{
  return objc_opt_self();
}

id InAppSearchCriteriaResolutionResult.__deallocating_deinit()
{
  return sub_2291BEEAC(type metadata accessor for InAppSearchCriteriaResolutionResult);
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return sub_2291C4B50();
}

uint64_t sub_2291C2B4C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2291C2B58()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2291C2B64()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2291C2B70()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_2291C2B7C()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_2291C2B88()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_2291C2B94()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_2291C2BA0()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_2291C2BAC()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_2291C2BB8()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_2291C2BC4()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_2291C2BD0()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_2291C2BDC()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2291C2BE8()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_2291C2BF4()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_2291C2C00()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_2291C2C0C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2291C2C18()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2291C2C24()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2291C2C30()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2291C2C3C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2291C2C48()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_2291C2C54()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2291C2C60()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_2291C2C6C()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2291C2C78()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2291C2C84()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_2291C2C90()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_2291C2C9C()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2291C2CA8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2291C2CB4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2291C2CC0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2291C2CCC()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2291C2CD8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2291C2CE4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2291C2CF0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2291C2CFC()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_2291C2D08()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2291C2D14()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2291C2D20()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_2291C2D2C()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2291C2D38()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2291C2D44()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2291C2D50()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2291C2D5C()
{
  return MEMORY[0x24BE6FC08]();
}

uint64_t sub_2291C2D68()
{
  return MEMORY[0x24BE6FC10]();
}

uint64_t sub_2291C2D74()
{
  return MEMORY[0x24BE6FC18]();
}

uint64_t sub_2291C2D80()
{
  return MEMORY[0x24BE6FC40]();
}

uint64_t sub_2291C2D8C()
{
  return MEMORY[0x24BE6FC90]();
}

uint64_t sub_2291C2D98()
{
  return MEMORY[0x24BE6FFD0]();
}

uint64_t sub_2291C2DA4()
{
  return MEMORY[0x24BE6FFD8]();
}

uint64_t sub_2291C2DB0()
{
  return MEMORY[0x24BE70050]();
}

uint64_t sub_2291C2DBC()
{
  return MEMORY[0x24BE70060]();
}

uint64_t sub_2291C2DC8()
{
  return MEMORY[0x24BE70078]();
}

uint64_t sub_2291C2DD4()
{
  return MEMORY[0x24BE70080]();
}

uint64_t sub_2291C2DE0()
{
  return MEMORY[0x24BE70118]();
}

uint64_t sub_2291C2DEC()
{
  return MEMORY[0x24BE70128]();
}

uint64_t sub_2291C2DF8()
{
  return MEMORY[0x24BE70140]();
}

uint64_t sub_2291C2E04()
{
  return MEMORY[0x24BE70148]();
}

uint64_t sub_2291C2E10()
{
  return MEMORY[0x24BE70150]();
}

uint64_t sub_2291C2E1C()
{
  return MEMORY[0x24BE70180]();
}

uint64_t sub_2291C2E28()
{
  return MEMORY[0x24BE70188]();
}

uint64_t sub_2291C2E34()
{
  return MEMORY[0x24BE70190]();
}

uint64_t sub_2291C2E40()
{
  return MEMORY[0x24BE70198]();
}

uint64_t sub_2291C2E4C()
{
  return MEMORY[0x24BE701A0]();
}

uint64_t sub_2291C2E58()
{
  return MEMORY[0x24BE701B0]();
}

uint64_t sub_2291C2E64()
{
  return MEMORY[0x24BE701C8]();
}

uint64_t sub_2291C2E70()
{
  return MEMORY[0x24BE701F8]();
}

uint64_t sub_2291C2E7C()
{
  return MEMORY[0x24BE70200]();
}

uint64_t sub_2291C2E88()
{
  return MEMORY[0x24BE70210]();
}

uint64_t sub_2291C2E94()
{
  return MEMORY[0x24BE70220]();
}

uint64_t sub_2291C2EA0()
{
  return MEMORY[0x24BE70230]();
}

uint64_t sub_2291C2EAC()
{
  return MEMORY[0x24BE70240]();
}

uint64_t sub_2291C2EB8()
{
  return MEMORY[0x24BE70248]();
}

uint64_t sub_2291C2EC4()
{
  return MEMORY[0x24BE70258]();
}

uint64_t sub_2291C2ED0()
{
  return MEMORY[0x24BE70260]();
}

uint64_t sub_2291C2EDC()
{
  return MEMORY[0x24BE70268]();
}

uint64_t sub_2291C2EE8()
{
  return MEMORY[0x24BE70278]();
}

uint64_t sub_2291C2EF4()
{
  return MEMORY[0x24BE702D0]();
}

uint64_t sub_2291C2F00()
{
  return MEMORY[0x24BE702F8]();
}

uint64_t sub_2291C2F0C()
{
  return MEMORY[0x24BE70300]();
}

uint64_t sub_2291C2F18()
{
  return MEMORY[0x24BE70310]();
}

uint64_t sub_2291C2F24()
{
  return MEMORY[0x24BE70320]();
}

uint64_t sub_2291C2F30()
{
  return MEMORY[0x24BE70340]();
}

uint64_t sub_2291C2F3C()
{
  return MEMORY[0x24BE70348]();
}

uint64_t sub_2291C2F48()
{
  return MEMORY[0x24BE70350]();
}

uint64_t sub_2291C2F54()
{
  return MEMORY[0x24BE70360]();
}

uint64_t sub_2291C2F60()
{
  return MEMORY[0x24BE70368]();
}

uint64_t sub_2291C2F6C()
{
  return MEMORY[0x24BE70390]();
}

uint64_t sub_2291C2F78()
{
  return MEMORY[0x24BE70398]();
}

uint64_t sub_2291C2F84()
{
  return MEMORY[0x24BE703A0]();
}

uint64_t sub_2291C2F90()
{
  return MEMORY[0x24BE703D8]();
}

uint64_t sub_2291C2F9C()
{
  return MEMORY[0x24BE703E0]();
}

uint64_t sub_2291C2FA8()
{
  return MEMORY[0x24BE703F0]();
}

uint64_t sub_2291C2FB4()
{
  return MEMORY[0x24BE70450]();
}

uint64_t sub_2291C2FC0()
{
  return MEMORY[0x24BE70458]();
}

uint64_t sub_2291C2FCC()
{
  return MEMORY[0x24BE70468]();
}

uint64_t sub_2291C2FD8()
{
  return MEMORY[0x24BE70470]();
}

uint64_t sub_2291C2FE4()
{
  return MEMORY[0x24BE70478]();
}

uint64_t sub_2291C2FF0()
{
  return MEMORY[0x24BE70580]();
}

uint64_t sub_2291C2FFC()
{
  return MEMORY[0x24BE70588]();
}

uint64_t sub_2291C3008()
{
  return MEMORY[0x24BE70980]();
}

uint64_t sub_2291C3014()
{
  return MEMORY[0x24BE70988]();
}

uint64_t sub_2291C3020()
{
  return MEMORY[0x24BE70BF0]();
}

uint64_t sub_2291C302C()
{
  return MEMORY[0x24BE70BF8]();
}

uint64_t sub_2291C3038()
{
  return MEMORY[0x24BE70C00]();
}

uint64_t sub_2291C3044()
{
  return MEMORY[0x24BE70C08]();
}

uint64_t sub_2291C3050()
{
  return MEMORY[0x24BE70C10]();
}

uint64_t sub_2291C305C()
{
  return MEMORY[0x24BE70C20]();
}

uint64_t sub_2291C3068()
{
  return MEMORY[0x24BE70C28]();
}

uint64_t sub_2291C3074()
{
  return MEMORY[0x24BE70CA0]();
}

uint64_t sub_2291C3080()
{
  return MEMORY[0x24BE70CA8]();
}

uint64_t sub_2291C308C()
{
  return MEMORY[0x24BE70EF0]();
}

uint64_t sub_2291C3098()
{
  return MEMORY[0x24BE70F00]();
}

uint64_t sub_2291C30A4()
{
  return MEMORY[0x24BE70FA8]();
}

uint64_t sub_2291C30B0()
{
  return MEMORY[0x24BE70FB0]();
}

uint64_t sub_2291C30BC()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t sub_2291C30C8()
{
  return MEMORY[0x24BEAA6A8]();
}

uint64_t sub_2291C30D4()
{
  return MEMORY[0x24BEAA6D8]();
}

uint64_t sub_2291C30E0()
{
  return MEMORY[0x24BEAB3D8]();
}

uint64_t sub_2291C30EC()
{
  return MEMORY[0x24BEAB428]();
}

uint64_t sub_2291C30F8()
{
  return MEMORY[0x24BEAB4E0]();
}

uint64_t sub_2291C3104()
{
  return MEMORY[0x24BEAD1B8]();
}

uint64_t sub_2291C3110()
{
  return MEMORY[0x24BEAD200]();
}

uint64_t sub_2291C311C()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_2291C3128()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_2291C3134()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_2291C3140()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_2291C314C()
{
  return MEMORY[0x24BEAD358]();
}

uint64_t sub_2291C3158()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_2291C3164()
{
  return MEMORY[0x24BE95F50]();
}

uint64_t sub_2291C3170()
{
  return MEMORY[0x24BE95F60]();
}

uint64_t sub_2291C317C()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_2291C3188()
{
  return MEMORY[0x24BE95FF0]();
}

uint64_t sub_2291C3194()
{
  return MEMORY[0x24BE96000]();
}

uint64_t sub_2291C31A0()
{
  return MEMORY[0x24BE96008]();
}

uint64_t sub_2291C31AC()
{
  return MEMORY[0x24BE96018]();
}

uint64_t sub_2291C31B8()
{
  return MEMORY[0x24BE96028]();
}

uint64_t sub_2291C31C4()
{
  return MEMORY[0x24BE96038]();
}

uint64_t sub_2291C31D0()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_2291C31DC()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_2291C31E8()
{
  return MEMORY[0x24BE96120]();
}

uint64_t sub_2291C31F4()
{
  return MEMORY[0x24BE96130]();
}

uint64_t sub_2291C3200()
{
  return MEMORY[0x24BE96140]();
}

uint64_t sub_2291C320C()
{
  return MEMORY[0x24BE96150]();
}

uint64_t sub_2291C3218()
{
  return MEMORY[0x24BE96200]();
}

uint64_t sub_2291C3224()
{
  return MEMORY[0x24BE96210]();
}

uint64_t sub_2291C3230()
{
  return MEMORY[0x24BE96220]();
}

uint64_t sub_2291C323C()
{
  return MEMORY[0x24BE96230]();
}

uint64_t sub_2291C3248()
{
  return MEMORY[0x24BE96260]();
}

uint64_t sub_2291C3254()
{
  return MEMORY[0x24BE96270]();
}

uint64_t sub_2291C3260()
{
  return MEMORY[0x24BE96290]();
}

uint64_t sub_2291C326C()
{
  return MEMORY[0x24BE96458]();
}

uint64_t sub_2291C3278()
{
  return MEMORY[0x24BE96490]();
}

uint64_t sub_2291C3284()
{
  return MEMORY[0x24BE96498]();
}

uint64_t sub_2291C3290()
{
  return MEMORY[0x24BE964A0]();
}

uint64_t sub_2291C329C()
{
  return MEMORY[0x24BE964B0]();
}

uint64_t sub_2291C32A8()
{
  return MEMORY[0x24BE964C0]();
}

uint64_t sub_2291C32B4()
{
  return MEMORY[0x24BE964D0]();
}

uint64_t sub_2291C32C0()
{
  return MEMORY[0x24BE964D8]();
}

uint64_t sub_2291C32CC()
{
  return MEMORY[0x24BE96610]();
}

uint64_t sub_2291C32D8()
{
  return MEMORY[0x24BE96620]();
}

uint64_t sub_2291C32E4()
{
  return MEMORY[0x24BE96630]();
}

uint64_t sub_2291C32F0()
{
  return MEMORY[0x24BE96680]();
}

uint64_t sub_2291C32FC()
{
  return MEMORY[0x24BE966C0]();
}

uint64_t sub_2291C3308()
{
  return MEMORY[0x24BE966D0]();
}

uint64_t sub_2291C3314()
{
  return MEMORY[0x24BE966E0]();
}

uint64_t sub_2291C3320()
{
  return MEMORY[0x24BE966E8]();
}

uint64_t sub_2291C332C()
{
  return MEMORY[0x24BE96738]();
}

uint64_t sub_2291C3338()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_2291C3344()
{
  return MEMORY[0x24BE96A70]();
}

uint64_t sub_2291C3350()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_2291C335C()
{
  return MEMORY[0x24BE96B78]();
}

uint64_t sub_2291C3368()
{
  return MEMORY[0x24BE96B88]();
}

uint64_t sub_2291C3374()
{
  return MEMORY[0x24BE96BA8]();
}

uint64_t sub_2291C3380()
{
  return MEMORY[0x24BE96BB8]();
}

uint64_t sub_2291C338C()
{
  return MEMORY[0x24BE96C00]();
}

uint64_t sub_2291C3398()
{
  return MEMORY[0x24BE96C18]();
}

uint64_t sub_2291C33A4()
{
  return MEMORY[0x24BE96C30]();
}

uint64_t sub_2291C33B0()
{
  return MEMORY[0x24BE96C68]();
}

uint64_t sub_2291C33BC()
{
  return MEMORY[0x24BE96C70]();
}

uint64_t sub_2291C33C8()
{
  return MEMORY[0x24BE96C78]();
}

uint64_t sub_2291C33D4()
{
  return MEMORY[0x24BE96C80]();
}

uint64_t sub_2291C33E0()
{
  return MEMORY[0x24BE96C90]();
}

uint64_t sub_2291C33EC()
{
  return MEMORY[0x24BE96CA0]();
}

uint64_t sub_2291C33F8()
{
  return MEMORY[0x24BE96CB8]();
}

uint64_t sub_2291C3404()
{
  return MEMORY[0x24BE96CD0]();
}

uint64_t sub_2291C3410()
{
  return MEMORY[0x24BE96DE8]();
}

uint64_t sub_2291C341C()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_2291C3428()
{
  return MEMORY[0x24BE96E80]();
}

uint64_t sub_2291C3434()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_2291C3440()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_2291C344C()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_2291C3458()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_2291C3464()
{
  return MEMORY[0x24BE96EE8]();
}

uint64_t sub_2291C3470()
{
  return MEMORY[0x24BE96F08]();
}

uint64_t sub_2291C347C()
{
  return MEMORY[0x24BE96F10]();
}

uint64_t sub_2291C3488()
{
  return MEMORY[0x24BE96F18]();
}

uint64_t sub_2291C3494()
{
  return MEMORY[0x24BE96F70]();
}

uint64_t sub_2291C34A0()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_2291C34AC()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_2291C34B8()
{
  return MEMORY[0x24BE97000]();
}

uint64_t sub_2291C34C4()
{
  return MEMORY[0x24BE97008]();
}

uint64_t sub_2291C34D0()
{
  return MEMORY[0x24BE97238]();
}

uint64_t sub_2291C34DC()
{
  return MEMORY[0x24BE97240]();
}

uint64_t sub_2291C34E8()
{
  return MEMORY[0x24BE97250]();
}

uint64_t sub_2291C34F4()
{
  return MEMORY[0x24BE97388]();
}

uint64_t sub_2291C3500()
{
  return MEMORY[0x24BE97390]();
}

uint64_t sub_2291C350C()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_2291C3518()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_2291C3524()
{
  return MEMORY[0x24BE97548]();
}

uint64_t sub_2291C3530()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_2291C353C()
{
  return MEMORY[0x24BE97588]();
}

uint64_t sub_2291C3548()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_2291C3554()
{
  return MEMORY[0x24BE975D0]();
}

uint64_t sub_2291C3560()
{
  return MEMORY[0x24BE975D8]();
}

uint64_t sub_2291C356C()
{
  return MEMORY[0x24BE975E0]();
}

uint64_t sub_2291C3578()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_2291C3584()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_2291C3590()
{
  return MEMORY[0x24BE975F8]();
}

uint64_t sub_2291C359C()
{
  return MEMORY[0x24BE97600]();
}

uint64_t sub_2291C35A8()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_2291C35B4()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_2291C35C0()
{
  return MEMORY[0x24BE976C0]();
}

uint64_t sub_2291C35CC()
{
  return MEMORY[0x24BE976F0]();
}

uint64_t sub_2291C35D8()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_2291C35E4()
{
  return MEMORY[0x24BE97718]();
}

uint64_t sub_2291C35F0()
{
  return MEMORY[0x24BE97720]();
}

uint64_t sub_2291C35FC()
{
  return MEMORY[0x24BE97728]();
}

uint64_t sub_2291C3608()
{
  return MEMORY[0x24BE97730]();
}

uint64_t sub_2291C3614()
{
  return MEMORY[0x24BE97968]();
}

uint64_t sub_2291C3620()
{
  return MEMORY[0x24BE97A50]();
}

uint64_t sub_2291C362C()
{
  return MEMORY[0x24BE97A68]();
}

uint64_t sub_2291C3638()
{
  return MEMORY[0x24BE97A70]();
}

uint64_t sub_2291C3644()
{
  return MEMORY[0x24BE97A80]();
}

uint64_t sub_2291C3650()
{
  return MEMORY[0x24BE97A98]();
}

uint64_t sub_2291C365C()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_2291C3668()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_2291C3674()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_2291C3680()
{
  return MEMORY[0x24BE97B10]();
}

uint64_t sub_2291C368C()
{
  return MEMORY[0x24BE97C18]();
}

uint64_t sub_2291C3698()
{
  return MEMORY[0x24BE97C20]();
}

uint64_t sub_2291C36A4()
{
  return MEMORY[0x24BE97C98]();
}

uint64_t sub_2291C36B0()
{
  return MEMORY[0x24BE97CB0]();
}

uint64_t sub_2291C36BC()
{
  return MEMORY[0x24BE97CB8]();
}

uint64_t sub_2291C36C8()
{
  return MEMORY[0x24BE97CE8]();
}

uint64_t sub_2291C36D4()
{
  return MEMORY[0x24BE97D08]();
}

uint64_t sub_2291C36E0()
{
  return MEMORY[0x24BE97D18]();
}

uint64_t sub_2291C36EC()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_2291C36F8()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t sub_2291C3704()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_2291C3710()
{
  return MEMORY[0x24BE97D70]();
}

uint64_t sub_2291C371C()
{
  return MEMORY[0x24BE97D98]();
}

uint64_t sub_2291C3728()
{
  return MEMORY[0x24BE97DA0]();
}

uint64_t sub_2291C3734()
{
  return MEMORY[0x24BE97DA8]();
}

uint64_t sub_2291C3740()
{
  return MEMORY[0x24BE97DC0]();
}

uint64_t sub_2291C374C()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_2291C3758()
{
  return MEMORY[0x24BE97DD0]();
}

uint64_t sub_2291C3764()
{
  return MEMORY[0x24BE97DE0]();
}

uint64_t sub_2291C3770()
{
  return MEMORY[0x24BE97DF0]();
}

uint64_t sub_2291C377C()
{
  return MEMORY[0x24BE97E08]();
}

uint64_t sub_2291C3788()
{
  return MEMORY[0x24BE97E20]();
}

uint64_t sub_2291C3794()
{
  return MEMORY[0x24BE97E30]();
}

uint64_t sub_2291C37A0()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_2291C37AC()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_2291C37B8()
{
  return MEMORY[0x24BE97E78]();
}

uint64_t sub_2291C37C4()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t sub_2291C37D0()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_2291C37DC()
{
  return MEMORY[0x24BE97FC0]();
}

uint64_t sub_2291C37E8()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_2291C37F4()
{
  return MEMORY[0x24BE981B8]();
}

uint64_t sub_2291C3800()
{
  return MEMORY[0x24BE98258]();
}

uint64_t sub_2291C380C()
{
  return MEMORY[0x24BE98278]();
}

uint64_t sub_2291C3818()
{
  return MEMORY[0x24BE98288]();
}

uint64_t sub_2291C3824()
{
  return MEMORY[0x24BE98298]();
}

uint64_t sub_2291C3830()
{
  return MEMORY[0x24BE98308]();
}

uint64_t sub_2291C383C()
{
  return MEMORY[0x24BE98320]();
}

uint64_t sub_2291C3848()
{
  return MEMORY[0x24BE98388]();
}

uint64_t sub_2291C3854()
{
  return MEMORY[0x24BE983D0]();
}

uint64_t sub_2291C3860()
{
  return MEMORY[0x24BE983D8]();
}

uint64_t sub_2291C386C()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_2291C3878()
{
  return MEMORY[0x24BE984A0]();
}

uint64_t sub_2291C3884()
{
  return MEMORY[0x24BE984F0]();
}

uint64_t sub_2291C3890()
{
  return MEMORY[0x24BE98500]();
}

uint64_t sub_2291C389C()
{
  return MEMORY[0x24BE985A0]();
}

uint64_t sub_2291C38A8()
{
  return MEMORY[0x24BE985A8]();
}

uint64_t sub_2291C38B4()
{
  return MEMORY[0x24BE985F0]();
}

uint64_t sub_2291C38C0()
{
  return MEMORY[0x24BE98610]();
}

uint64_t sub_2291C38CC()
{
  return MEMORY[0x24BE98638]();
}

uint64_t sub_2291C38D8()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_2291C38E4()
{
  return MEMORY[0x24BE98698]();
}

uint64_t sub_2291C38F0()
{
  return MEMORY[0x24BE986B0]();
}

uint64_t sub_2291C38FC()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_2291C3908()
{
  return MEMORY[0x24BE986E8]();
}

uint64_t sub_2291C3914()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_2291C3920()
{
  return MEMORY[0x24BE98830]();
}

uint64_t sub_2291C392C()
{
  return MEMORY[0x24BE98848]();
}

uint64_t sub_2291C3938()
{
  return MEMORY[0x24BE98858]();
}

uint64_t sub_2291C3944()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_2291C3950()
{
  return MEMORY[0x24BE98888]();
}

uint64_t sub_2291C395C()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_2291C3968()
{
  return MEMORY[0x24BE988D0]();
}

uint64_t sub_2291C3974()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_2291C3980()
{
  return MEMORY[0x24BE98950]();
}

uint64_t sub_2291C398C()
{
  return MEMORY[0x24BE98958]();
}

uint64_t sub_2291C3998()
{
  return MEMORY[0x24BE98960]();
}

uint64_t sub_2291C39A4()
{
  return MEMORY[0x24BE989A8]();
}

uint64_t sub_2291C39B0()
{
  return MEMORY[0x24BE989B0]();
}

uint64_t sub_2291C39BC()
{
  return MEMORY[0x24BE989B8]();
}

uint64_t sub_2291C39C8()
{
  return MEMORY[0x24BE98B38]();
}

uint64_t sub_2291C39D4()
{
  return MEMORY[0x24BE98C90]();
}

uint64_t sub_2291C39E0()
{
  return MEMORY[0x24BE98CA8]();
}

uint64_t sub_2291C39EC()
{
  return MEMORY[0x24BE98CB8]();
}

uint64_t sub_2291C39F8()
{
  return MEMORY[0x24BE98D18]();
}

uint64_t sub_2291C3A04()
{
  return MEMORY[0x24BE98D28]();
}

uint64_t sub_2291C3A10()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_2291C3A1C()
{
  return MEMORY[0x24BE98DC8]();
}

uint64_t sub_2291C3A28()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_2291C3A34()
{
  return MEMORY[0x24BE98DF0]();
}

uint64_t sub_2291C3A40()
{
  return MEMORY[0x24BE98DF8]();
}

uint64_t sub_2291C3A4C()
{
  return MEMORY[0x24BE98E28]();
}

uint64_t sub_2291C3A58()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_2291C3A64()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_2291C3A70()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_2291C3A7C()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_2291C3A88()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_2291C3A94()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_2291C3AA0()
{
  return MEMORY[0x24BE99048]();
}

uint64_t sub_2291C3AAC()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_2291C3AB8()
{
  return MEMORY[0x24BE99070]();
}

uint64_t sub_2291C3AC4()
{
  return MEMORY[0x24BE99078]();
}

uint64_t sub_2291C3AD0()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_2291C3ADC()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2291C3AE8()
{
  return MEMORY[0x24BE9C1E0]();
}

uint64_t sub_2291C3AF4()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_2291C3B00()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_2291C3B0C()
{
  return MEMORY[0x24BE9C3F0]();
}

uint64_t sub_2291C3B18()
{
  return MEMORY[0x24BE9C448]();
}

uint64_t sub_2291C3B24()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_2291C3B30()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t sub_2291C3B3C()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t sub_2291C3B48()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_2291C3B54()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_2291C3B60()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_2291C3B6C()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_2291C3B78()
{
  return MEMORY[0x24BE9C770]();
}

uint64_t sub_2291C3B84()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t sub_2291C3B90()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_2291C3B9C()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_2291C3BA8()
{
  return MEMORY[0x24BE9CAD8]();
}

uint64_t sub_2291C3BB4()
{
  return MEMORY[0x24BE9CAE8]();
}

uint64_t sub_2291C3BC0()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t sub_2291C3BCC()
{
  return MEMORY[0x24BE9CB18]();
}

uint64_t sub_2291C3BD8()
{
  return MEMORY[0x24BE9CB20]();
}

uint64_t sub_2291C3BE4()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_2291C3BF0()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t sub_2291C3BFC()
{
  return MEMORY[0x24BE9CD58]();
}

uint64_t sub_2291C3C08()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_2291C3C14()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_2291C3C20()
{
  return MEMORY[0x24BE9CF00]();
}

uint64_t sub_2291C3C2C()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_2291C3C38()
{
  return MEMORY[0x24BE9D0E0]();
}

uint64_t sub_2291C3C44()
{
  return MEMORY[0x24BE9D0E8]();
}

uint64_t sub_2291C3C50()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t sub_2291C3C5C()
{
  return MEMORY[0x24BE9DFE8]();
}

uint64_t sub_2291C3C68()
{
  return MEMORY[0x24BE9DFF0]();
}

uint64_t sub_2291C3C74()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_2291C3C80()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_2291C3C8C()
{
  return MEMORY[0x24BE9EAF8]();
}

uint64_t sub_2291C3C98()
{
  return MEMORY[0x24BE9EB20]();
}

uint64_t sub_2291C3CA4()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_2291C3CB0()
{
  return MEMORY[0x24BE9EBA8]();
}

uint64_t sub_2291C3CBC()
{
  return MEMORY[0x24BE9EDA8]();
}

uint64_t sub_2291C3CC8()
{
  return MEMORY[0x24BE9EDB0]();
}

uint64_t sub_2291C3CD4()
{
  return MEMORY[0x24BE9EE58]();
}

uint64_t sub_2291C3CE0()
{
  return MEMORY[0x24BE9EE60]();
}

uint64_t sub_2291C3CEC()
{
  return MEMORY[0x24BE9EF18]();
}

uint64_t sub_2291C3CF8()
{
  return MEMORY[0x24BE9EF20]();
}

uint64_t sub_2291C3D04()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_2291C3D10()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_2291C3D1C()
{
  return MEMORY[0x24BE9F7D8]();
}

uint64_t sub_2291C3D28()
{
  return MEMORY[0x24BE9F7F8]();
}

uint64_t sub_2291C3D34()
{
  return MEMORY[0x24BE9F808]();
}

uint64_t sub_2291C3D40()
{
  return MEMORY[0x24BE9F840]();
}

uint64_t sub_2291C3D4C()
{
  return MEMORY[0x24BE9F860]();
}

uint64_t sub_2291C3D58()
{
  return MEMORY[0x24BE9F878]();
}

uint64_t sub_2291C3D64()
{
  return MEMORY[0x24BE9F898]();
}

uint64_t sub_2291C3D70()
{
  return MEMORY[0x24BE9F8B8]();
}

uint64_t sub_2291C3D7C()
{
  return MEMORY[0x24BE9F8C0]();
}

uint64_t sub_2291C3D88()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_2291C3D94()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_2291C3DA0()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_2291C3DAC()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_2291C3DB8()
{
  return MEMORY[0x24BE9FA10]();
}

uint64_t sub_2291C3DC4()
{
  return MEMORY[0x24BE9FAB0]();
}

uint64_t sub_2291C3DD0()
{
  return MEMORY[0x24BE9FAB8]();
}

uint64_t sub_2291C3DDC()
{
  return MEMORY[0x24BE9FAC0]();
}

uint64_t sub_2291C3DE8()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t sub_2291C3DF4()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_2291C3E00()
{
  return MEMORY[0x24BE9FEB8]();
}

uint64_t sub_2291C3E0C()
{
  return MEMORY[0x24BE9FF28]();
}

uint64_t sub_2291C3E18()
{
  return MEMORY[0x24BE9FF38]();
}

uint64_t sub_2291C3E24()
{
  return MEMORY[0x24BE9FF40]();
}

uint64_t sub_2291C3E30()
{
  return MEMORY[0x24BE9FF48]();
}

uint64_t sub_2291C3E3C()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_2291C3E48()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_2291C3E54()
{
  return MEMORY[0x24BEA00D8]();
}

uint64_t sub_2291C3E60()
{
  return MEMORY[0x24BEA00E0]();
}

uint64_t sub_2291C3E6C()
{
  return MEMORY[0x24BEA0140]();
}

uint64_t sub_2291C3E78()
{
  return MEMORY[0x24BEA0168]();
}

uint64_t sub_2291C3E84()
{
  return MEMORY[0x24BEA01A8]();
}

uint64_t sub_2291C3E90()
{
  return MEMORY[0x24BEA04F8]();
}

uint64_t sub_2291C3E9C()
{
  return MEMORY[0x24BEA0500]();
}

uint64_t sub_2291C3EA8()
{
  return MEMORY[0x24BEA0508]();
}

uint64_t sub_2291C3EB4()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_2291C3EC0()
{
  return MEMORY[0x24BEA0698]();
}

uint64_t sub_2291C3ECC()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_2291C3ED8()
{
  return MEMORY[0x24BEA0898]();
}

uint64_t sub_2291C3EE4()
{
  return MEMORY[0x24BEA08A8]();
}

uint64_t sub_2291C3EF0()
{
  return MEMORY[0x24BEA08C0]();
}

uint64_t sub_2291C3EFC()
{
  return MEMORY[0x24BEA08D0]();
}

uint64_t sub_2291C3F08()
{
  return MEMORY[0x24BEA0980]();
}

uint64_t sub_2291C3F14()
{
  return MEMORY[0x24BEA0998]();
}

uint64_t sub_2291C3F20()
{
  return MEMORY[0x24BEA0A90]();
}

uint64_t sub_2291C3F2C()
{
  return MEMORY[0x24BEA0AA8]();
}

uint64_t sub_2291C3F38()
{
  return MEMORY[0x24BEA0AB8]();
}

uint64_t sub_2291C3F44()
{
  return MEMORY[0x24BEA0B20]();
}

uint64_t sub_2291C3F50()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_2291C3F5C()
{
  return MEMORY[0x24BEA0B30]();
}

uint64_t sub_2291C3F68()
{
  return MEMORY[0x24BEA0B38]();
}

uint64_t sub_2291C3F74()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_2291C3F80()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_2291C3F8C()
{
  return MEMORY[0x24BEA0C18]();
}

uint64_t sub_2291C3F98()
{
  return MEMORY[0x24BEA0C60]();
}

uint64_t sub_2291C3FA4()
{
  return MEMORY[0x24BEA0CF8]();
}

uint64_t sub_2291C3FB0()
{
  return MEMORY[0x24BEA0D88]();
}

uint64_t sub_2291C3FBC()
{
  return MEMORY[0x24BEA0D90]();
}

uint64_t sub_2291C3FC8()
{
  return MEMORY[0x24BEA0F98]();
}

uint64_t sub_2291C3FD4()
{
  return MEMORY[0x24BEA0FA0]();
}

uint64_t sub_2291C3FE0()
{
  return MEMORY[0x24BEA1370]();
}

uint64_t sub_2291C3FEC()
{
  return MEMORY[0x24BEA1520]();
}

uint64_t sub_2291C3FF8()
{
  return MEMORY[0x24BEA1528]();
}

uint64_t sub_2291C4004()
{
  return MEMORY[0x24BEA17F0]();
}

uint64_t sub_2291C4010()
{
  return MEMORY[0x24BEA1808]();
}

uint64_t sub_2291C401C()
{
  return MEMORY[0x24BEA1890]();
}

uint64_t sub_2291C4028()
{
  return MEMORY[0x24BEA1898]();
}

uint64_t sub_2291C4034()
{
  return MEMORY[0x24BEA1C10]();
}

uint64_t sub_2291C4040()
{
  return MEMORY[0x24BEA1C18]();
}

uint64_t sub_2291C404C()
{
  return MEMORY[0x24BEA1CD8]();
}

uint64_t sub_2291C4058()
{
  return MEMORY[0x24BEA1F90]();
}

uint64_t sub_2291C4064()
{
  return MEMORY[0x24BEA22F8]();
}

uint64_t sub_2291C4070()
{
  return MEMORY[0x24BEA2330]();
}

uint64_t sub_2291C407C()
{
  return MEMORY[0x24BEA2340]();
}

uint64_t sub_2291C4088()
{
  return MEMORY[0x24BEA2768]();
}

uint64_t sub_2291C4094()
{
  return MEMORY[0x24BEA2F58]();
}

uint64_t sub_2291C40A0()
{
  return MEMORY[0x24BEA2F60]();
}

uint64_t sub_2291C40AC()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_2291C40B8()
{
  return MEMORY[0x24BEA3640]();
}

uint64_t sub_2291C40C4()
{
  return MEMORY[0x24BEA3650]();
}

uint64_t sub_2291C40D0()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_2291C40DC()
{
  return MEMORY[0x24BEA3780]();
}

uint64_t sub_2291C40E8()
{
  return MEMORY[0x24BEA3798]();
}

uint64_t sub_2291C40F4()
{
  return MEMORY[0x24BEA37A8]();
}

uint64_t sub_2291C4100()
{
  return MEMORY[0x24BEA37F0]();
}

uint64_t sub_2291C410C()
{
  return MEMORY[0x24BEA5B38]();
}

uint64_t sub_2291C4118()
{
  return MEMORY[0x24BEA5B50]();
}

uint64_t sub_2291C4124()
{
  return MEMORY[0x24BEA5B68]();
}

uint64_t sub_2291C4130()
{
  return MEMORY[0x24BEA5B70]();
}

uint64_t sub_2291C413C()
{
  return MEMORY[0x24BEA5C60]();
}

uint64_t sub_2291C4148()
{
  return MEMORY[0x24BEA5C68]();
}

uint64_t sub_2291C4154()
{
  return MEMORY[0x24BEA5C78]();
}

uint64_t sub_2291C4160()
{
  return MEMORY[0x24BEA5D28]();
}

uint64_t sub_2291C416C()
{
  return MEMORY[0x24BEA5D48]();
}

uint64_t sub_2291C4178()
{
  return MEMORY[0x24BEA5D50]();
}

uint64_t sub_2291C4184()
{
  return MEMORY[0x24BEA5DB0]();
}

uint64_t sub_2291C4190()
{
  return MEMORY[0x24BEA5DB8]();
}

uint64_t sub_2291C419C()
{
  return MEMORY[0x24BEA5DD0]();
}

uint64_t sub_2291C41A8()
{
  return MEMORY[0x24BEA5DD8]();
}

uint64_t sub_2291C41B4()
{
  return MEMORY[0x24BEA5EB8]();
}

uint64_t sub_2291C41C0()
{
  return MEMORY[0x24BEA5ED0]();
}

uint64_t sub_2291C41CC()
{
  return MEMORY[0x24BEA5F08]();
}

uint64_t sub_2291C41D8()
{
  return MEMORY[0x24BEA8A80]();
}

uint64_t sub_2291C41E4()
{
  return MEMORY[0x24BDDB318]();
}

uint64_t sub_2291C41F0()
{
  return MEMORY[0x24BE92840]();
}

uint64_t sub_2291C41FC()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_2291C4208()
{
  return MEMORY[0x24BE92860]();
}

uint64_t sub_2291C4214()
{
  return MEMORY[0x24BE92888]();
}

uint64_t sub_2291C4220()
{
  return MEMORY[0x24BE92898]();
}

uint64_t sub_2291C422C()
{
  return MEMORY[0x24BE92920]();
}

uint64_t sub_2291C4238()
{
  return MEMORY[0x24BE92938]();
}

uint64_t sub_2291C4244()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_2291C4250()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_2291C425C()
{
  return MEMORY[0x24BE92B00]();
}

uint64_t sub_2291C4268()
{
  return MEMORY[0x24BE92B70]();
}

uint64_t sub_2291C4274()
{
  return MEMORY[0x24BE92B78]();
}

uint64_t sub_2291C4280()
{
  return MEMORY[0x24BE92BE0]();
}

uint64_t sub_2291C428C()
{
  return MEMORY[0x24BE92BF0]();
}

uint64_t sub_2291C4298()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_2291C42A4()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_2291C42B0()
{
  return MEMORY[0x24BE90B80]();
}

uint64_t sub_2291C42BC()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_2291C42C8()
{
  return MEMORY[0x24BE92EC8]();
}

uint64_t sub_2291C42D4()
{
  return MEMORY[0x24BE93020]();
}

uint64_t sub_2291C42E0()
{
  return MEMORY[0x24BE94640]();
}

uint64_t sub_2291C42EC()
{
  return MEMORY[0x24BE94648]();
}

uint64_t sub_2291C42F8()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_2291C4304()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_2291C4310()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_2291C431C()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_2291C4328()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_2291C4334()
{
  return MEMORY[0x24BE94668]();
}

uint64_t sub_2291C4340()
{
  return MEMORY[0x24BE946F0]();
}

uint64_t sub_2291C434C()
{
  return MEMORY[0x24BE94710]();
}

uint64_t sub_2291C4358()
{
  return MEMORY[0x24BEA5478]();
}

uint64_t sub_2291C4364()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_2291C4370()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_2291C437C()
{
  return MEMORY[0x24BEA9000]();
}

uint64_t sub_2291C4388()
{
  return MEMORY[0x24BEA9028]();
}

uint64_t sub_2291C4394()
{
  return MEMORY[0x24BEA9048]();
}

uint64_t sub_2291C43A0()
{
  return MEMORY[0x24BEA90B8]();
}

uint64_t sub_2291C43AC()
{
  return MEMORY[0x24BEA90C0]();
}

uint64_t sub_2291C43B8()
{
  return MEMORY[0x24BEA90C8]();
}

uint64_t sub_2291C43C4()
{
  return MEMORY[0x24BEA90D0]();
}

uint64_t sub_2291C43D0()
{
  return MEMORY[0x24BEA90D8]();
}

uint64_t sub_2291C43DC()
{
  return MEMORY[0x24BEA90E0]();
}

uint64_t sub_2291C43E8()
{
  return MEMORY[0x24BEA9100]();
}

uint64_t sub_2291C43F4()
{
  return MEMORY[0x24BEA9108]();
}

uint64_t sub_2291C4400()
{
  return MEMORY[0x24BEA9110]();
}

uint64_t sub_2291C440C()
{
  return MEMORY[0x24BEA9120]();
}

uint64_t sub_2291C4418()
{
  return MEMORY[0x24BEA9130]();
}

uint64_t sub_2291C4424()
{
  return MEMORY[0x24BEA9160]();
}

uint64_t sub_2291C4430()
{
  return MEMORY[0x24BEA91B0]();
}

uint64_t sub_2291C443C()
{
  return MEMORY[0x24BEA91C8]();
}

uint64_t sub_2291C4448()
{
  return MEMORY[0x24BEA9250]();
}

uint64_t sub_2291C4454()
{
  return MEMORY[0x24BEA9270]();
}

uint64_t sub_2291C4460()
{
  return MEMORY[0x24BEA9278]();
}

uint64_t sub_2291C446C()
{
  return MEMORY[0x24BEA92A0]();
}

uint64_t sub_2291C4478()
{
  return MEMORY[0x24BEA92F0]();
}

uint64_t sub_2291C4484()
{
  return MEMORY[0x24BEA92F8]();
}

uint64_t sub_2291C4490()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2291C449C()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_2291C44A8()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_2291C44B4()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2291C44C0()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_2291C44CC()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_2291C44D8()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_2291C44E4()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_2291C44F0()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_2291C44FC()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_2291C4508()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_2291C4514()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_2291C4520()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2291C452C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2291C4538()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2291C4544()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2291C4550()
{
  return MEMORY[0x24BEA5540]();
}

uint64_t sub_2291C455C()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_2291C4568()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_2291C4574()
{
  return MEMORY[0x24BEA5608]();
}

uint64_t sub_2291C4580()
{
  return MEMORY[0x24BEA5628]();
}

uint64_t sub_2291C458C()
{
  return MEMORY[0x24BEA5668]();
}

uint64_t sub_2291C4598()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_2291C45A4()
{
  return MEMORY[0x24BEA5930]();
}

uint64_t sub_2291C45B0()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_2291C45BC()
{
  return MEMORY[0x24BEA5A38]();
}

uint64_t sub_2291C45C8()
{
  return MEMORY[0x24BEA5A40]();
}

uint64_t sub_2291C45D4()
{
  return MEMORY[0x24BEA5A50]();
}

uint64_t sub_2291C45E0()
{
  return MEMORY[0x24BEA5A60]();
}

uint64_t sub_2291C45EC()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_2291C45F8()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_2291C4604()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2291C4610()
{
  return MEMORY[0x24BEE54A8]();
}

uint64_t sub_2291C461C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2291C4628()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2291C4634()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_2291C4640()
{
  return MEMORY[0x24BEE54F8]();
}

uint64_t sub_2291C464C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2291C4658()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2291C4664()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2291C4670()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2291C467C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2291C4688()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2291C4694()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2291C46A0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2291C46AC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2291C46B8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2291C46C4()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2291C46D0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2291C46DC()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2291C46E8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2291C46F4()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_2291C4700()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2291C470C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2291C4718()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2291C4724()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2291C4730()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_2291C473C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2291C4748()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2291C4754()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2291C4760()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2291C476C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_2291C4778()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2291C4784()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2291C4790()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2291C479C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2291C47A8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2291C47B4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2291C47C0()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2291C47CC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2291C47D8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2291C47E4()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2291C47F0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2291C47FC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2291C4808()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2291C4814()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2291C4820()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2291C482C()
{
  return MEMORY[0x24BEA5FA0]();
}

uint64_t sub_2291C4838()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2291C4844()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2291C4850()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2291C485C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2291C4868()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2291C4874()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_2291C4880()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_2291C488C()
{
  return MEMORY[0x24BEE5680]();
}

uint64_t sub_2291C4898()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2291C48A4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2291C48B0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2291C48BC()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2291C48C8()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2291C48D4()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2291C48E0()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2291C48EC()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2291C48F8()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2291C4904()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2291C4910()
{
  return MEMORY[0x24BE99138]();
}

uint64_t sub_2291C491C()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_2291C4928()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2291C4934()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2291C4940()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2291C494C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2291C4958()
{
  return MEMORY[0x24BDD04D8]();
}

uint64_t sub_2291C4964()
{
  return MEMORY[0x24BDD0510]();
}

uint64_t sub_2291C4970()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2291C497C()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_2291C4988()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_2291C4994()
{
  return MEMORY[0x24BDD05D0]();
}

uint64_t sub_2291C49A0()
{
  return MEMORY[0x24BDD05D8]();
}

uint64_t sub_2291C49AC()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_2291C49B8()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2291C49C4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2291C49D0()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2291C49DC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2291C49E8()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_2291C49F4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2291C4A00()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2291C4A0C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2291C4A18()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2291C4A24()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2291C4A30()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2291C4A3C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2291C4A48()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2291C4A54()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2291C4A60()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2291C4A6C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2291C4A78()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2291C4A84()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2291C4A90()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2291C4A9C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2291C4AA8()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2291C4AB4()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2291C4AC0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2291C4ACC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2291C4AD8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2291C4AE4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2291C4AF0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2291C4AFC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2291C4B08()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2291C4B14()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2291C4B20()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_2291C4B2C()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_2291C4B38()
{
  return MEMORY[0x24BEE2F20]();
}

uint64_t sub_2291C4B44()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2291C4B50()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2291C4B5C()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_2291C4B68()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2291C4B74()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2291C4B80()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2291C4B8C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2291C4B98()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2291C4BA4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2291C4BB0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2291C4BBC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2291C4BC8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2291C4BD4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2291C4BE0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2291C4BEC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2291C4BF8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2291C4C04()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2291C4C10()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2291C4C1C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2291C4C28()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2291C4C34()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2291C4C40()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2291C4C4C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2291C4C58()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_2291C4C64()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2291C4C70()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2291C4C7C()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2291C4C88()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2291C4C94()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2291C4CA0()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_2291C4CAC()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2291C4CB8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2291C4CC4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2291C4CD0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2291C4CDC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2291C4CE8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2291C4CF4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2291C4D00()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2291C4D0C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2291C4D18()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2291C4D24()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_2291C4D30()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2291C4D3C()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_2291C4D48()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2291C4D54()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2291C4D60()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2291C4D6C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t INTypedObjectWithCustomObject()
{
  return MEMORY[0x24BDD9B00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
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

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x24BDAF2F8]();
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


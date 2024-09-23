char *sub_24997C1DC()
{
  uint64_t v0;
  void *v1;
  char *v2;
  char *v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 112);
  if (v1)
  {
    v2 = *(char **)(v0 + 112);
  }
  else
  {
    v3 = sub_24997EE68((const char *)v0);
    v4 = *(void **)(v0 + 112);
    *(_QWORD *)(v0 + 112) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

uint64_t sub_24997C234@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[40];
  __int128 v11;
  uint64_t v12;
  _UNKNOWN **v13;

  v3 = v1 + 120;
  swift_beginAccess();
  sub_24997FC20(v3, (uint64_t)&v11, &qword_2578AEE80);
  if (!v12)
  {
    sub_24997FC64((uint64_t)&v11, &qword_2578AEE80);
    v4 = type metadata accessor for NPSManager();
    v5 = (_QWORD *)swift_allocObject();
    v6 = (char *)v5 + OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
    if (qword_2578AEE50 != -1)
      swift_once();
    v7 = sub_24998BA9C();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2578B09B0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v6, v8, v7);
    v5[2] = 0xD000000000000017;
    v5[3] = 0x800000024998D3A0;
    v5[4] = 0xD000000000000011;
    v5[5] = 0x800000024998D380;
    v12 = v4;
    v13 = &protocol witness table for NPSManager;
    *(_QWORD *)&v11 = v5;
    sub_24997FB38((uint64_t)&v11, (uint64_t)v10);
    swift_beginAccess();
    sub_24997FB7C((uint64_t)v10, v3);
    swift_endAccess();
  }
  return sub_24997FBC4(&v11, a1);
}

uint64_t sub_24997C3B0()
{
  void *v0;
  uint64_t result;

  v0 = (void *)sub_24997F578((uint64_t)&unk_251AD32B8);
  result = swift_arrayDestroy();
  off_2578AEDF0 = v0;
  return result;
}

uint64_t sub_24997C3F8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  type metadata accessor for SyncedPreferenceManager();
  v0 = (char *)swift_allocObject();
  swift_defaultActor_initialize();
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  v1 = OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  if (qword_2578AEE60 != -1)
    swift_once();
  v2 = sub_24998BA9C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2578B09E0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(&v0[v1], v3, v2);
  qword_2578AEE00 = (uint64_t)v0;
  return result;
}

char *SyncedPreferenceManager.__allocating_init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = (char *)swift_allocObject();
  swift_defaultActor_initialize();
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  v1 = OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  if (qword_2578AEE60 != -1)
    swift_once();
  v2 = sub_24998BA9C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2578B09E0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(&v0[v1], v3, v2);
  return v0;
}

uint64_t static SyncedPreferenceManager.shared.getter()
{
  if (qword_2578AEDF8 != -1)
    swift_once();
  return swift_retain();
}

char *SyncedPreferenceManager.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_defaultActor_initialize();
  *((_OWORD *)v0 + 8) = 0u;
  *((_OWORD *)v0 + 9) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  v1 = OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  if (qword_2578AEE60 != -1)
    swift_once();
  v2 = sub_24998BA9C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2578B09E0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(&v0[v1], v3, v2);
  return v0;
}

uint64_t sub_24997C634()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
  return swift_task_switch();
}

uint64_t sub_24997C64C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  char *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v18;

  v18 = (_QWORD *)(v0 + 16);
  if (qword_2578AEDE8 != -1)
LABEL_27:
    swift_once();
  v1 = (char *)off_2578AEDF0 + 56;
  v2 = -1;
  v3 = -1 << *((_BYTE *)off_2578AEDF0 + 32);
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  v4 = v2 & *((_QWORD *)off_2578AEDF0 + 7);
  v5 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_6;
    }
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if (v9 >= v5)
      goto LABEL_22;
    v10 = *(_QWORD *)&v1[8 * v9];
    ++v6;
    if (!v10)
    {
      v6 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_22;
      v10 = *(_QWORD *)&v1[8 * v6];
      if (!v10)
      {
        v6 = v9 + 2;
        if (v9 + 2 >= v5)
          goto LABEL_22;
        v10 = *(_QWORD *)&v1[8 * v6];
        if (!v10)
          break;
      }
    }
LABEL_21:
    v4 = (v10 - 1) & v10;
LABEL_6:
    swift_bridgeObjectRetain();
    v7 = sub_24997C1DC();
    v8 = (void *)sub_24998BAF0();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_removeObjectForKey_, v8);

  }
  v11 = v9 + 3;
  if (v11 < v5)
  {
    v10 = *(_QWORD *)&v1[8 * v11];
    if (!v10)
    {
      while (1)
      {
        v6 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_26;
        if (v6 >= v5)
          goto LABEL_22;
        v10 = *(_QWORD *)&v1[8 * v6];
        ++v11;
        if (v10)
          goto LABEL_21;
      }
    }
    v6 = v11;
    goto LABEL_21;
  }
LABEL_22:
  swift_release();
  sub_24997C234((uint64_t)v18);
  v12 = *(_QWORD *)(v0 + 40);
  v13 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1(v18, v12);
  (*(void (**)(void *, uint64_t, uint64_t))(v13 + 32))(off_2578AEDF0, v12, v13);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  v14 = sub_24998BA84();
  v15 = sub_24998BBBC();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_24997A000, v14, v15, "Successfully deleted plist.", v16, 2u);
    MEMORY[0x24BCFC8F0](v16, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SyncedPreferenceManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_24997FC64(v0 + 120, &qword_2578AEE80);
  v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  v2 = sub_24998BA9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SyncedPreferenceManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_24997FC64(v0 + 120, &qword_2578AEE80);
  v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SyncedPreferenceManager_logger;
  v2 = sub_24998BA9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t SyncedPreferenceManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_24997C9B4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_24997C9C0()
{
  return 1;
}

uint64_t sub_24997C9C8()
{
  sub_24998BCAC();
  sub_24998BCB8();
  return sub_24998BCD0();
}

uint64_t sub_24997CA08()
{
  return sub_24998BCB8();
}

uint64_t sub_24997CA2C()
{
  sub_24998BCAC();
  sub_24998BCB8();
  return sub_24998BCD0();
}

uint64_t sub_24997CA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24997F718(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24997CA94()
{
  return 0;
}

void sub_24997CAA0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24997CAAC()
{
  sub_24997F90C();
  return sub_24998BCF4();
}

uint64_t sub_24997CAD4()
{
  sub_24997F90C();
  return sub_24998BD00();
}

uint64_t sub_24997CAFC(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF058);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24997F90C();
  sub_24998BCE8();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF040);
  sub_24997F994(&qword_2578AF060, &qword_2578AF068, (uint64_t)&protocol conformance descriptor for CoastalLocation, MEMORY[0x24BEE12A0]);
  sub_24998BC94();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

_QWORD *sub_24997CC20@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_24997F7C0(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_24997CC48(_QWORD *a1)
{
  uint64_t *v1;

  return sub_24997CAFC(a1, *v1);
}

uint64_t SyncedPreferenceManager.getLocations()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_24997CC78(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v13 = sub_24997C1DC();
  v14 = (void *)sub_24998BAF0();
  v15 = objc_msgSend(v13, sel_dataForKey_, v14);

  if (v15)
  {
    sub_24998B994();
    v17 = v16;

    __asm { BR              X10 }
  }
  v18 = sub_24998BA84();
  v19 = sub_24998BBBC();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_24997A000, v18, v19, "Could not read data from UserDefaults, returning sample locations.", v20, 2u);
    MEMORY[0x24BCFC8F0](v20, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AEE90);
  v21 = type metadata accessor for CoastalLocation();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 72);
  v24 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_24998C1A0;
  v26 = v25 + v24;
  if (qword_2578AEE08 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v21, (uint64_t)qword_2578B0950);
  sub_24997E204(v27, v26);
  if (qword_2578AEE10 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v21, (uint64_t)qword_2578B0968);
  sub_24997E204(v28, v26 + v23);
  v29 = v26 + 2 * v23;
  if (qword_2578AEE18 != -1)
    swift_once();
  v30 = __swift_project_value_buffer(v21, (uint64_t)qword_2578B0980);
  sub_24997E204(v30, v29);
  sub_24997E248(0, 0xF000000000000000);
  return (*(uint64_t (**)(uint64_t))(v12 + 8))(v25);
}

uint64_t sub_24997D2A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v17 = type metadata accessor for CoastalLocation();
  v2 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v18 = MEMORY[0x24BEE4AF8];
    sub_249989E48(0, v5, 0);
    v7 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v8 = *(_QWORD *)(v2 + 72);
    v6 = v18;
    do
    {
      sub_24997E204(v7, (uint64_t)v4);
      v9 = &v4[*(int *)(v17 + 32)];
      v11 = *(_QWORD *)v9;
      v10 = *((_QWORD *)v9 + 1);
      swift_bridgeObjectRetain();
      sub_24997FAB0((uint64_t)v4);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249989E48(0, *(_QWORD *)(v6 + 16) + 1, 1);
        v6 = v18;
      }
      v13 = *(_QWORD *)(v6 + 16);
      v12 = *(_QWORD *)(v6 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_249989E48(v12 > 1, v13 + 1, 1);
        v6 = v18;
      }
      *(_QWORD *)(v6 + 16) = v13 + 1;
      v14 = v6 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v11;
      *(_QWORD *)(v14 + 40) = v10;
      v7 += v8;
      --v5;
    }
    while (v5);
  }
  v18 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF078);
  sub_24997FAEC();
  sub_24998BAC0();
  swift_bridgeObjectRelease();
  v18 = 91;
  v19 = 0xE100000000000000;
  sub_24998BB44();
  swift_bridgeObjectRelease();
  sub_24998BB44();
  return v18;
}

uint64_t SyncedPreferenceManager.set(locations:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[11] = a1;
  v2[12] = v1;
  v3 = sub_24998B9D0();
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24997D4D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 88);
  sub_24998B940();
  swift_allocObject();
  swift_bridgeObjectRetain();
  sub_24998B934();
  *(_QWORD *)(v0 + 56) = v1;
  sub_24997E968();
  v2 = sub_24998B928();
  v3 = *(_QWORD *)(v0 + 120);
  v24 = *(_QWORD *)(v0 + 112);
  v25 = *(_QWORD *)(v0 + 104);
  v4 = v2;
  v6 = v5;
  swift_release();
  swift_bridgeObjectRelease();
  v7 = sub_24997C1DC();
  v26 = v4;
  v27 = v6;
  v8 = (void *)sub_24998B988();
  v9 = (void *)sub_24998BAF0();
  objc_msgSend(v7, sel_setValue_forKey_, v8, v9);

  v10 = sub_24997C1DC();
  sub_24998B9B8();
  v11 = (void *)sub_24998B9AC();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v3, v25);
  v12 = (void *)sub_24998BAF0();
  objc_msgSend(v10, sel_setValue_forKey_, v11, v12);

  sub_24997C234(v0 + 16);
  v13 = *(_QWORD *)(v0 + 40);
  v14 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v13);
  if (qword_2578AEDE8 != -1)
    swift_once();
  (*(void (**)(void *, uint64_t, uint64_t))(v14 + 32))(off_2578AEDF0, v13, v14);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRetain_n();
  v15 = sub_24998BA84();
  v16 = sub_24998BBBC();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(_QWORD *)(v0 + 88);
  if (v17)
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v28 = v20;
    *(_DWORD *)v19 = 134218243;
    *(_QWORD *)(v0 + 72) = *(_QWORD *)(v18 + 16);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2081;
    v21 = sub_24997D2A8(v18);
    *(_QWORD *)(v0 + 80) = sub_24997E328(v21, v22, &v28);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24997A000, v15, v16, "Successfully saved %ld locations: %{private}s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v20, -1, -1);
    MEMORY[0x24BCFC8F0](v19, -1, -1);
    sub_24997E25C(v26, v27);

  }
  else
  {
    sub_24997E25C(v26, v27);

    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24997D9BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24997FE78;
  return SyncedPreferenceManager.set(locations:)(a1);
}

uint64_t sub_24997DA0C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24997FE74;
  v3[3] = v2;
  return swift_task_switch();
}

uint64_t SyncedPreferenceManager.getSelectedLocation()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_24997DA84()
{
  uint64_t v0;
  char *v1;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_24997C1DC();
  v2 = (void *)sub_24998BAF0();
  v3 = objc_msgSend(v1, sel_stringForKey_, v2);

  if (v3)
  {
    v4 = sub_24998BAFC();
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  swift_bridgeObjectRetain_n();
  v7 = sub_24998BA84();
  v8 = sub_24998BBBC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v14 = v13;
    *(_DWORD *)v9 = 136315138;
    if (v6)
      v10 = v4;
    else
      v10 = 7104878;
    if (v6)
      v11 = v6;
    else
      v11 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_24997E328(v10, v11, &v14);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24997A000, v7, v8, "Read selectedLocation: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v13, -1, -1);
    MEMORY[0x24BCFC8F0](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v4, v6);
}

uint64_t SyncedPreferenceManager.set(selectedLocation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return swift_task_switch();
}

uint64_t sub_24997DCCC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = sub_24997C1DC();
  if (v1)
    v3 = sub_24998BAF0();
  else
    v3 = 0;
  v4 = (void *)sub_24998BAF0();
  objc_msgSend(v2, sel_setValue_forKey_, v3, v4);

  swift_unknownObjectRelease();
  sub_24997C234(v0 + 16);
  v5 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v5);
  if (qword_2578AEDE8 != -1)
    swift_once();
  v7 = *(_QWORD *)(v0 + 64);
  (*(void (**)(void *, uint64_t, uint64_t))(v6 + 32))(off_2578AEDF0, v5, v6);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_bridgeObjectRetain_n();
  v8 = sub_24998BA84();
  v9 = sub_24998BBBC();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(_QWORD *)(v0 + 56);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = v12;
    *(_DWORD *)v11 = 136315138;
    if (v1)
    {
      v13 = v7;
    }
    else
    {
      v10 = 7104878;
      v13 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_24997E328(v10, v13, &v15);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24997A000, v8, v9, "Set selected location to: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v12, -1, -1);
    MEMORY[0x24BCFC8F0](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24997DF38(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24997FE78;
  v7[8] = a2;
  v7[9] = v6;
  v7[7] = a1;
  return swift_task_switch();
}

uint64_t sub_24997DFAC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24997FE7C;
  v3[3] = v2;
  return swift_task_switch();
}

uint64_t SyncedPreferenceManager.getLastUpdated()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = v1;
  return swift_task_switch();
}

uint64_t sub_24997E024()
{
  uint64_t v0;
  char *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v1 = sub_24997C1DC();
  v2 = (void *)sub_24998BAF0();
  v3 = objc_msgSend(v1, sel_valueForKey_, v2);

  if (v3)
  {
    sub_24998BBEC();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  sub_24997FBDC(v0 + 48, v0 + 16, &qword_2578AEED0);
  sub_24997FBDC(v0 + 16, v0 + 48, &qword_2578AEED0);
  v4 = *(_QWORD *)(v0 + 80);
  if (*(_QWORD *)(v0 + 72))
  {
    v5 = sub_24998B9D0();
    v6 = swift_dynamicCast();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, v6 ^ 1u, 1, v5);
  }
  else
  {
    sub_24997FC64(v0 + 48, &qword_2578AEED0);
    v7 = sub_24998B9D0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCFC86C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24997E204(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24997E248(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24997E25C(a1, a2);
  return a1;
}

uint64_t sub_24997E25C(uint64_t a1, unint64_t a2)
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

uint64_t sub_24997E2A0(uint64_t a1, unint64_t a2)
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

unint64_t sub_24997E2E4()
{
  unint64_t result;

  result = qword_2578AEE98;
  if (!qword_2578AEE98)
  {
    result = MEMORY[0x24BCFC884](&unk_24998C33C, &type metadata for SyncedPreferenceManager.StaticLocationList);
    atomic_store(result, (unint64_t *)&qword_2578AEE98);
  }
  return result;
}

uint64_t sub_24997E328(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24997E3F8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24997FA70((uint64_t)v12, *a3);
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
      sub_24997FA70((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_24997E3F8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24998BBE0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24997E5B0(a5, a6);
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
  v8 = sub_24998BC10();
  if (!v8)
  {
    sub_24998BC1C();
    __break(1u);
LABEL_17:
    result = sub_24998BC28();
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

uint64_t sub_24997E5B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24997E644(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24997E81C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24997E81C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24997E644(uint64_t a1, unint64_t a2)
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
      v3 = sub_24997E7B8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24998BC04();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24998BC1C();
      __break(1u);
LABEL_10:
      v2 = sub_24998BB50();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24998BC28();
    __break(1u);
LABEL_14:
    result = sub_24998BC1C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24997E7B8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF070);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24997E81C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF070);
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
  result = sub_24998BC28();
  __break(1u);
  return result;
}

unint64_t sub_24997E968()
{
  unint64_t result;

  result = qword_2578AEEB0;
  if (!qword_2578AEEB0)
  {
    result = MEMORY[0x24BCFC884](&unk_24998C314, &type metadata for SyncedPreferenceManager.StaticLocationList);
    atomic_store(result, (unint64_t *)&qword_2578AEEB0);
  }
  return result;
}

uint64_t sub_24997E9AC()
{
  return type metadata accessor for SyncedPreferenceManager();
}

uint64_t type metadata accessor for SyncedPreferenceManager()
{
  uint64_t result;

  result = qword_2578AEF20;
  if (!qword_2578AEF20)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24997E9F0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24998BA9C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SyncedPreferenceManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SyncedPreferenceManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SyncedPreferenceManager.deleteAll()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 168) + *(_QWORD *)(*(_QWORD *)v0 + 168));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_24997FE78;
  return v4();
}

uint64_t dispatch thunk of StaticLocationStore.set(locations:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24997EB60;
  return v9(a1, a2, a3);
}

uint64_t sub_24997EB60()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of StaticLocationStore.getLocations()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24997EC14;
  return v7(a1, a2);
}

uint64_t sub_24997EC14(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of SelectedLocationStore.set(selectedLocation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_24997FE78;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of SelectedLocationStore.getSelectedLocation()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24997ED54;
  return v7(a1, a2);
}

uint64_t sub_24997ED54(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24997EDBC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24997EDDC(uint64_t result, int a2, int a3)
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

void type metadata accessor for CLLocationCoordinate2D()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2578AF028)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2578AF028);
  }
}

ValueMetadata *type metadata accessor for SyncedPreferenceManager.StaticLocationList()
{
  return &type metadata for SyncedPreferenceManager.StaticLocationList;
}

char *sub_24997EE68(const char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void (*v33)(void);
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(char *, uint64_t);
  void (*v51)(char *, uint64_t);
  char *v53;
  char *v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;

  v55 = (unint64_t)a1;
  v1 = sub_24998B97C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v53 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v54 = (char *)&v53 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF088);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v53 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v53 - v17;
  v18 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v19 = (void *)sub_24998BAF0();
  v20 = objc_msgSend(v18, sel_containerURLForSecurityApplicationGroupIdentifier_, v19);

  if (v20)
  {
    sub_24998B970();

    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  v22 = (uint64_t)v56;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v2 + 56))(v16, v21, 1, v1);
  sub_24997FBDC((uint64_t)v16, v22, &qword_2578AF088);
  sub_24997FC20(v22, (uint64_t)v13, &qword_2578AF088);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v13, 1, v1) == 1)
  {
    sub_24997FC64((uint64_t)v13, &qword_2578AF088);
    v23 = sub_24998BA84();
    v24 = sub_24998BBB0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v58 = v26;
      *(_DWORD *)v25 = 136315138;
      v57 = sub_24997E328(0xD000000000000017, 0x800000024998D3A0, &v58);
      sub_24998BBD4();
      _os_log_impl(&dword_24997A000, v23, v24, "Could not find %s url. Using standard defaults.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCFC8F0](v26, -1, -1);
      MEMORY[0x24BCFC8F0](v25, -1, -1);
    }

    v27 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
LABEL_17:
    sub_24997FC64(v22, &qword_2578AF088);
    return (char *)v27;
  }
  v53 = v8;
  v28 = v54;
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v54, v13, v1);
  v29 = (void *)objc_opt_self();
  v30 = (void *)sub_24998BAF0();
  v31 = (void *)sub_24998B964();
  v32 = objc_msgSend(v29, sel_createWithSuiteName_container_, v30, v31);

  v33 = *(void (**)(void))(v2 + 16);
  if (!v32)
  {
    v55 = (unint64_t)"com.apple.weather";
    v43 = v53;
    v33();
    v44 = sub_24998BA84();
    v45 = sub_24998BBB0();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      v46 = swift_slowAlloc();
      v47 = swift_slowAlloc();
      v58 = v47;
      *(_DWORD *)v46 = 136315394;
      v48 = sub_24998B958();
      v57 = sub_24997E328(v48, v49, &v58);
      sub_24998BBD4();
      swift_bridgeObjectRelease();
      v50 = *(void (**)(char *, uint64_t))(v2 + 8);
      v50(v43, v1);
      *(_WORD *)(v46 + 12) = 2080;
      v57 = sub_24997E328(0xD000000000000017, v55 | 0x8000000000000000, &v58);
      v22 = (uint64_t)v56;
      sub_24998BBD4();
      _os_log_impl(&dword_24997A000, v44, (os_log_type_t)v45, "Could not create user defaults with url: %s and group: %s. Using standard defaults.", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24BCFC8F0](v47, -1, -1);
      MEMORY[0x24BCFC8F0](v46, -1, -1);

    }
    else
    {

      v50 = *(void (**)(char *, uint64_t))(v2 + 8);
      v50(v43, v1);
    }
    v27 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v50(v54, v1);
    goto LABEL_17;
  }
  ((void (*)(char *, char *, uint64_t))v33)(v5, v28, v1);
  v34 = (char *)v32;
  v35 = sub_24998BA84();
  v36 = sub_24998BBBC();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v58 = v38;
    v55 = (unint64_t)v34;
    *(_DWORD *)v37 = 136315138;
    v39 = sub_24998B94C();
    v57 = sub_24997E328(v39, v40, &v58);
    v34 = (char *)v55;
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    v41 = *(void (**)(char *, uint64_t))(v2 + 8);
    v41(v5, v1);
    _os_log_impl(&dword_24997A000, v35, v36, "Creating defaults at: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v38, -1, -1);
    MEMORY[0x24BCFC8F0](v37, -1, -1);

    v41(v54, v1);
    v42 = (uint64_t)v56;
  }
  else
  {

    v51 = *(void (**)(char *, uint64_t))(v2 + 8);
    v51(v5, v1);

    v51(v28, v1);
    v42 = v22;
  }
  sub_24997FC64(v42, &qword_2578AF088);
  return v34;
}

uint64_t sub_24997F578(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF090);
    v3 = sub_24998BBF8();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_24998BCAC();
      swift_bridgeObjectRetain();
      sub_24998BB2C();
      result = sub_24998BCD0();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_24998BCA0(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_24998BCA0();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_24997F718(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6E6F697461636F6CLL && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_24998BCA0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24997F7A4()
{
  return 0x6E6F697461636F6CLL;
}

_QWORD *sub_24997F7C0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF030);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24997F90C();
  sub_24998BCDC();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF040);
    sub_24997F994(&qword_2578AF048, &qword_2578AF050, (uint64_t)&protocol conformance descriptor for CoastalLocation, MEMORY[0x24BEE12D0]);
    sub_24998BC64();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_24997F90C()
{
  unint64_t result;

  result = qword_2578AF038;
  if (!qword_2578AF038)
  {
    result = MEMORY[0x24BCFC884](&unk_24998C428, &type metadata for SyncedPreferenceManager.StaticLocationList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF038);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCFC878](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24997F994(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578AF040);
    v10 = sub_24997FA10(a2, a3);
    result = MEMORY[0x24BCFC884](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24997FA10(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for CoastalLocation();
    result = MEMORY[0x24BCFC884](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24997FA70(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24997FAB0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24997FAEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578AF080;
  if (!qword_2578AF080)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578AF078);
    result = MEMORY[0x24BCFC884](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2578AF080);
  }
  return result;
}

uint64_t sub_24997FB38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24997FB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AEE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24997FBC4(__int128 *a1, uint64_t a2)
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

uint64_t sub_24997FBDC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24997FC20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24997FC64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for CoastalLocation.CategoryType(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SyncedPreferenceManager.StaticLocationList.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24997FD34 + 4 * byte_24998C1B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24997FD54 + 4 * byte_24998C1B5[v4]))();
}

_BYTE *sub_24997FD34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24997FD54(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24997FD5C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24997FD64(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24997FD6C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24997FD74(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24997FD80()
{
  return 0;
}

ValueMetadata *type metadata accessor for SyncedPreferenceManager.StaticLocationList.CodingKeys()
{
  return &type metadata for SyncedPreferenceManager.StaticLocationList.CodingKeys;
}

unint64_t sub_24997FDA0()
{
  unint64_t result;

  result = qword_2578AF098;
  if (!qword_2578AF098)
  {
    result = MEMORY[0x24BCFC884](&unk_24998C400, &type metadata for SyncedPreferenceManager.StaticLocationList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF098);
  }
  return result;
}

unint64_t sub_24997FDE8()
{
  unint64_t result;

  result = qword_2578AF0A0;
  if (!qword_2578AF0A0)
  {
    result = MEMORY[0x24BCFC884](&unk_24998C370, &type metadata for SyncedPreferenceManager.StaticLocationList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF0A0);
  }
  return result;
}

unint64_t sub_24997FE30()
{
  unint64_t result;

  result = qword_2578AF0A8;
  if (!qword_2578AF0A8)
  {
    result = MEMORY[0x24BCFC884](&unk_24998C398, &type metadata for SyncedPreferenceManager.StaticLocationList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF0A8);
  }
  return result;
}

uint64_t static SampleLocationBuilder.buildSampleLocations()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AEE90);
  v0 = type metadata accessor for CoastalLocation();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24998C1A0;
  v5 = v4 + v3;
  if (qword_2578AEE08 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v0, (uint64_t)qword_2578B0950);
  sub_24997E204(v6, v5);
  if (qword_2578AEE10 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v0, (uint64_t)qword_2578B0968);
  sub_24997E204(v7, v5 + v2);
  if (qword_2578AEE18 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v0, (uint64_t)qword_2578B0980);
  sub_24997E204(v8, v5 + 2 * v2);
  return v4;
}

uint64_t static SampleLocationBuilder.buildAppleParkLocation()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578AEE20 != -1)
    swift_once();
  v2 = type metadata accessor for CoastalLocation();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2578B0998);
  return sub_24997E204(v3, a1);
}

uint64_t sub_249980028()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF0B0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24998BA78();
  v4 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  v29 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24998B9E8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_24998BAE4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - v13;
  v15 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v15, qword_2578B0950);
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_2578B0950);
  sub_24998BAD8();
  v17 = (void *)sub_24998BAF0();
  v18 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v17);

  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_24998B9DC();
  v19 = sub_24998BB14();
  v21 = v20;
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23 = v8;
  v24 = v28;
  v25 = v29;
  v22(v14, v23);
  sub_24998BA54();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v2, 1, v24) == 1)
  {
    sub_24998BA6C();
    sub_249980AC8((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v6, v2, v24);
  }
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(v19, v21, (uint64_t)v6, 0, 0, 0xD000000000000011, 0x800000024998D480, v16, 37.4956053, -122.496507);
}

uint64_t sub_24998031C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF0B0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24998BA78();
  v4 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  v29 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24998B9E8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_24998BAE4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - v13;
  v15 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v15, qword_2578B0968);
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_2578B0968);
  sub_24998BAD8();
  v17 = (void *)sub_24998BAF0();
  v18 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v17);

  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_24998B9DC();
  v19 = sub_24998BB14();
  v21 = v20;
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23 = v8;
  v24 = v28;
  v25 = v29;
  v22(v14, v23);
  sub_24998BA54();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v2, 1, v24) == 1)
  {
    sub_24998BA6C();
    sub_249980AC8((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v6, v2, v24);
  }
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(v19, v21, (uint64_t)v6, 0, 0, 0xD000000000000010, 0x800000024998D460, v16, 21.2754283, -157.825717);
}

uint64_t sub_249980610()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF0B0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24998BA78();
  v4 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  v29 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24998B9E8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_24998BAE4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v27 - v13;
  v15 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v15, qword_2578B0980);
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_2578B0980);
  sub_24998BAD8();
  v17 = (void *)sub_24998BAF0();
  v18 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v17);

  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_24998B9DC();
  v19 = sub_24998BB14();
  v21 = v20;
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23 = v8;
  v24 = v28;
  v25 = v29;
  v22(v14, v23);
  sub_24998BA54();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v2, 1, v24) == 1)
  {
    sub_24998BA6C();
    sub_249980AC8((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v6, v2, v24);
  }
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(v19, v21, (uint64_t)v6, 0, 0, 0xD000000000000011, 0x800000024998D420, v16, -33.8911957, 151.277693);
}

uint64_t sub_249980904()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF0B0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24998BA78();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v7, qword_2578B0998);
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2578B0998);
  sub_24998BA54();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_24998BA6C();
    sub_249980AC8((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  }
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0x206B637544205041, 0xEC000000646E6F50, (uint64_t)v6, 0, 0, 0, 0, v8, 37.33532, -122.00974);
}

ValueMetadata *type metadata accessor for SampleLocationBuilder()
{
  return &type metadata for SampleLocationBuilder;
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

uint64_t sub_249980AC8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF0B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

UrchinKit::UrchinWidgetKind_optional __swiftcall UrchinWidgetKind.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  UrchinKit::UrchinWidgetKind_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24998BC34();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static UrchinWidgetKind.allCases.getter()
{
  return &unk_251AD3388;
}

uint64_t UrchinWidgetKind.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aSwell_1[8 * *v0];
}

uint64_t sub_249980B90(char *a1, char *a2)
{
  return sub_249983200(*a1, *a2);
}

unint64_t sub_249980BA0()
{
  unint64_t result;

  result = qword_2578AF0B8;
  if (!qword_2578AF0B8)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for UrchinWidgetKind, &type metadata for UrchinWidgetKind);
    atomic_store(result, (unint64_t *)&qword_2578AF0B8);
  }
  return result;
}

uint64_t sub_249980BE4()
{
  return sub_249983284();
}

uint64_t sub_249980BEC()
{
  return sub_2499832EC();
}

uint64_t sub_249980BF4()
{
  return sub_24998332C();
}

UrchinKit::UrchinWidgetKind_optional sub_249980BFC(Swift::String *a1)
{
  return UrchinWidgetKind.init(rawValue:)(*a1);
}

uint64_t sub_249980C08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = UrchinWidgetKind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_249980C30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578AF0C0;
  if (!qword_2578AF0C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578AF0C8);
    result = MEMORY[0x24BCFC884](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2578AF0C0);
  }
  return result;
}

void sub_249980C7C(_QWORD *a1@<X8>)
{
  *a1 = &unk_251AD33B0;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UrchinWidgetKind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UrchinWidgetKind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249980D74 + 4 * byte_24998C4E5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_249980DA8 + 4 * asc_24998C4E0[v4]))();
}

uint64_t sub_249980DA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249980DB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249980DB8);
  return result;
}

uint64_t sub_249980DC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249980DCCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_249980DD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249980DD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249980DE4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_249980DEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UrchinWidgetKind()
{
  return &type metadata for UrchinWidgetKind;
}

char *NPSManager.__allocating_init(appGroupName:npsContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = (char *)swift_allocObject();
  v9 = OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  if (qword_2578AEE50 != -1)
    swift_once();
  v10 = sub_24998BA9C();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2578B09B0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(&v8[v9], v11, v10);
  *((_QWORD *)v8 + 2) = a1;
  *((_QWORD *)v8 + 3) = a2;
  *((_QWORD *)v8 + 4) = a3;
  *((_QWORD *)v8 + 5) = a4;
  return v8;
}

uint64_t NPSManager.appGroupName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NPSManager.npsContainer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

char *NPSManager.init(appGroupName:npsContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  if (qword_2578AEE50 != -1)
    swift_once();
  v10 = sub_24998BA9C();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2578B09B0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(&v4[v9], v11, v10);
  *((_QWORD *)v4 + 2) = a1;
  *((_QWORD *)v4 + 3) = a2;
  *((_QWORD *)v4 + 4) = a3;
  *((_QWORD *)v4 + 5) = a4;
  return v4;
}

void sub_249980FD4()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  v0 = objc_msgSend(objc_allocWithZone((Class)UKNPSManagerBridge), sel_init);
  v1 = (void *)sub_24998BAF0();
  v2 = (void *)sub_24998BB98();
  v3 = (void *)sub_24998BAF0();
  v4 = (void *)sub_24998BAF0();
  objc_msgSend(v0, sel_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_, v1, v2, v3, v4);

  oslog = sub_24998BA84();
  v5 = sub_24998BBBC();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24997A000, oslog, v5, "Finished syncing using NPS.", v6, 2u);
    MEMORY[0x24BCFC8F0](v6, -1, -1);
  }

}

uint64_t NPSManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  v2 = sub_24998BA9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t NPSManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  v2 = sub_24998BA9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2499811D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_249981208()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_249981238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char **a5@<X8>)
{
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  type metadata accessor for NPSManager();
  v10 = (char *)swift_allocObject();
  v11 = OBJC_IVAR____TtC9UrchinKit10NPSManager_logger;
  if (qword_2578AEE50 != -1)
    swift_once();
  v12 = sub_24998BA9C();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_2578B09B0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(&v10[v11], v13, v12);
  *((_QWORD *)v10 + 2) = a1;
  *((_QWORD *)v10 + 3) = a2;
  *((_QWORD *)v10 + 4) = a3;
  *((_QWORD *)v10 + 5) = a4;
  *a5 = v10;
  return result;
}

void sub_249981304()
{
  sub_249980FD4();
}

uint64_t dispatch thunk of NPSManagerType.appGroupName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NPSManagerType.npsContainer.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NPSManagerType.init(appGroupName:npsContainer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of NPSManagerType.synchronize(keys:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_249981344()
{
  return type metadata accessor for NPSManager();
}

uint64_t type metadata accessor for NPSManager()
{
  uint64_t result;

  result = qword_2578AF100;
  if (!qword_2578AF100)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249981388()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24998BA9C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for NPSManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NPSManager.__allocating_init(appGroupName:npsContainer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of NPSManager.synchronize(keys:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

BOOL CLAuthorizationStatus.isAuthorized.getter(int a1)
{
  return (a1 - 3) < 2;
}

unint64_t CLAuthorizationStatus.string.getter(int a1)
{
  unint64_t result;

  result = 0xD000000000000010;
  switch(a1)
  {
    case 0:
      result = 0x7265746544746F6ELL;
      break;
    case 1:
      result = 0x7463697274736572;
      break;
    case 2:
      result = 0x6465696E6564;
      break;
    case 3:
      return result;
    case 4:
      result = 0xD000000000000013;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

const char *UrchinFeatureFlags.domain.getter()
{
  return "Urchin";
}

const char *UrchinFeatureFlags.feature.getter()
{
  return "urchin";
}

uint64_t static UrchinFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t UrchinFeatureFlags.hash(into:)()
{
  return sub_24998BCB8();
}

uint64_t UrchinFeatureFlags.hashValue.getter()
{
  sub_24998BCAC();
  sub_24998BCB8();
  return sub_24998BCD0();
}

unint64_t sub_24998158C()
{
  unint64_t result;

  result = qword_2578AF1A0;
  if (!qword_2578AF1A0)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for UrchinFeatureFlags, &type metadata for UrchinFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2578AF1A0);
  }
  return result;
}

const char *sub_2499815D0()
{
  return "Urchin";
}

const char *sub_2499815E4()
{
  return "urchin";
}

uint64_t storeEnumTagSinglePayload for UrchinFeatureFlags(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_249981638 + 4 * byte_24998C6C0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_249981658 + 4 * byte_24998C6C5[v4]))();
}

_BYTE *sub_249981638(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_249981658(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_249981660(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_249981668(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_249981670(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_249981678(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UrchinFeatureFlags()
{
  return &type metadata for UrchinFeatureFlags;
}

void static UrchinAnalytics.send<A>(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  unint64_t v19;
  os_log_type_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint8_t *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t aBlock[6];

  v5 = a1;
  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v38 = v7;
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2578AEE68 != -1)
    swift_once();
  v9 = sub_24998BA9C();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2578B09F8);
  v11 = sub_24998BA84();
  v12 = sub_24998BBA4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v35 = v5;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    v36 = v8;
    v16 = v15;
    aBlock[0] = v15;
    v37 = v10;
    *(_DWORD *)v14 = 136315138;
    v34 = v14 + 4;
    v17 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
    v18 = v17(a2, a3);
    v39 = sub_24997E328(v18, v19, aBlock);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    v20 = v12;
    v21 = (void (*)(uint64_t, uint64_t))v17;
    _os_log_impl(&dword_24997A000, v11, v20, "Attempting to send CoreAnalytics event: %s", v14, 0xCu);
    swift_arrayDestroy();
    v22 = v16;
    v8 = v36;
    MEMORY[0x24BCFC8F0](v22, -1, -1);
    v23 = v14;
    v5 = v35;
    MEMORY[0x24BCFC8F0](v23, -1, -1);

  }
  else
  {

    v21 = *(void (**)(uint64_t, uint64_t))(a3 + 8);
  }
  v21(a2, a3);
  v24 = (void *)sub_24998BAF0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v5, a2);
  v25 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = a2;
  *(_QWORD *)(v26 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v26 + v25, v8, a2);
  aBlock[4] = (uint64_t)sub_249981CD8;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_249981C0C;
  aBlock[3] = (uint64_t)&block_descriptor;
  v27 = _Block_copy(aBlock);
  swift_release();
  LOBYTE(v25) = AnalyticsSendEventLazy();
  _Block_release(v27);

  if ((v25 & 1) == 0)
  {
    v28 = sub_24998BA84();
    v29 = sub_24998BBB0();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      aBlock[0] = v31;
      *(_DWORD *)v30 = 136315138;
      v32 = ((uint64_t (*)(uint64_t, uint64_t))v21)(a2, a3);
      v39 = sub_24997E328(v32, v33, aBlock);
      sub_24998BBD4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24997A000, v28, v29, "Immediately failed to send CoreAnalytics event: %s. The event may not be enabled in the current config.", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCFC8F0](v31, -1, -1);
      MEMORY[0x24BCFC8F0](v30, -1, -1);
    }

  }
}

uint64_t sub_249981A6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  if (qword_2578AEE68 != -1)
    swift_once();
  v5 = sub_24998BA9C();
  __swift_project_value_buffer(v5, (uint64_t)qword_2578B09F8);
  v6 = sub_24998BA84();
  v7 = sub_24998BBA4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    sub_24997E328(v10, v11, &v13);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24997A000, v6, v7, "Successfully sent CoreAnalytics event: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v9, -1, -1);
    MEMORY[0x24BCFC8F0](v8, -1, -1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
}

id sub_249981C0C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_249981D2C();
    v4 = (void *)sub_24998BAA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_249981C80()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_249981CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_249981A6C(v0 + ((v2 + 32) & ~v2), v1, *(_QWORD *)(v0 + 24));
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

ValueMetadata *type metadata accessor for UrchinAnalytics()
{
  return &type metadata for UrchinAnalytics;
}

uint64_t dispatch thunk of static UrchinAnalytics.UrchinAnalyticsEvent.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of UrchinAnalytics.UrchinAnalyticsEvent.payload()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

unint64_t sub_249981D2C()
{
  unint64_t result;

  result = qword_2578AF1A8;
  if (!qword_2578AF1A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2578AF1A8);
  }
  return result;
}

uint64_t DateInterval.simpleString.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void (*v4)(char *, uint64_t);
  _QWORD v6[2];

  v0 = sub_24998B9D0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6[0] = 91;
  v6[1] = 0xE100000000000000;
  sub_24998B8F8();
  sub_24998B9C4();
  v4 = *(void (**)(char *, uint64_t))(v1 + 8);
  v4(v3, v0);
  sub_24998BB44();
  swift_bridgeObjectRelease();
  sub_24998BB44();
  sub_24998B8E0();
  sub_24998B9C4();
  v4(v3, v0);
  sub_24998BB44();
  swift_bridgeObjectRelease();
  sub_24998BB44();
  return v6[0];
}

uint64_t static DateInterval.createMidnightInterval(for:interval:timeZone:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;

  v68 = a1;
  v71 = a3;
  v4 = sub_24998BA00();
  v64 = *(_QWORD *)(v4 - 8);
  v65 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_24998BA0C();
  v72 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24998B9F4();
  v9 = *(_QWORD *)(v8 - 8);
  v53 = v8;
  v10 = v9;
  v54 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF1B0);
  MEMORY[0x24BDAC7A8](v13);
  v56 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24998B9D0();
  v16 = *(_QWORD *)(v15 - 8);
  v57 = v15;
  v58 = v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v70 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v69 = (char *)&v52 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v67 = (char *)&v52 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v55 = (char *)&v52 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v66 = (char *)&v52 - v25;
  v26 = sub_24998BA78();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_24998BA48();
  v61 = *(_QWORD *)(v30 - 8);
  v62 = v30;
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v52 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24998BA30();
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v29, a2, v26);
  sub_24998BA3C();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BDCF020], v8);
  v33 = v7;
  v34 = v59;
  (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v7, *MEMORY[0x24BDCF0B0], v59);
  v35 = v63;
  v36 = v64;
  v37 = v65;
  (*(void (**)(char *, _QWORD, uint64_t))(v64 + 104))(v63, *MEMORY[0x24BDCF068], v65);
  v38 = v56;
  v39 = v68;
  v40 = v35;
  v60 = v32;
  v41 = v55;
  sub_24998BA18();
  v42 = (uint64_t)v38;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v40, v37);
  v43 = v33;
  v44 = v57;
  (*(void (**)(char *, uint64_t))(v72 + 8))(v43, v34);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v12, v53);
  v45 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
  v46 = v39;
  v47 = v58;
  v45(v41, v46, v44);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48))(v38, 1, v44) == 1)
  {
    v48 = v66;
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v66, v41, v44);
    sub_249982310(v42);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v47 + 8))(v41, v44);
    v48 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v66, v42, v44);
  }
  v49 = v67;
  sub_24998B9A0();
  v45(v69, (uint64_t)v48, v44);
  v45(v70, (uint64_t)v49, v44);
  sub_24998B8EC();
  v50 = *(void (**)(char *, uint64_t))(v47 + 8);
  v50(v49, v44);
  v50(v48, v44);
  return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v60, v62);
}

uint64_t sub_249982310(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF1B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static DateInterval.createMidnightInterval(for:component:value:timeZone:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  char *v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, _QWORD, uint64_t);
  char *v41;
  uint64_t v42;
  void (*v43)(char *, _QWORD, uint64_t);
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t, uint64_t);
  unsigned int (*v57)(uint64_t, uint64_t, uint64_t);
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  unsigned int v64;
  char *v65;
  void (*v66)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;

  v74 = a4;
  v87 = a2;
  v88 = a3;
  v79 = a1;
  v89 = a5;
  v78 = sub_24998BA00();
  v76 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8](v78);
  v75 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_24998BA0C();
  v6 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24998B9F4();
  v10 = *(_QWORD *)(v9 - 8);
  v68 = v9;
  v11 = v10;
  v69 = v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF1B0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v86 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v68 - v17;
  v19 = sub_24998B9D0();
  v20 = *(_QWORD *)(v19 - 8);
  v71 = v19;
  v72 = v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v85 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v84 = (char *)&v68 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v81 = (char *)&v68 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v83 = (char *)&v68 - v28;
  v29 = MEMORY[0x24BDAC7A8](v27);
  v77 = (char *)&v68 - v30;
  v31 = MEMORY[0x24BDAC7A8](v29);
  v70 = (char *)&v68 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v90 = (char *)&v68 - v33;
  v34 = sub_24998BA78();
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v37 = (char *)&v68 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_24998BA48();
  v80 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v39 = (char *)&v68 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24998BA30();
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v37, v74, v34);
  sub_24998BA3C();
  v40 = *(void (**)(char *, _QWORD, uint64_t))(v11 + 104);
  v41 = v13;
  v40(v13, *MEMORY[0x24BDCF020], v9);
  v42 = v6;
  v43 = *(void (**)(char *, _QWORD, uint64_t))(v6 + 104);
  v44 = v8;
  v45 = v73;
  v43(v8, *MEMORY[0x24BDCF0B0], v73);
  v46 = v75;
  v47 = v76;
  v48 = v78;
  (*(void (**)(char *, _QWORD, uint64_t))(v76 + 104))(v75, *MEMORY[0x24BDCF068], v78);
  v49 = v79;
  sub_24998BA18();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
  v50 = *(void (**)(char *, uint64_t))(v42 + 8);
  v51 = (uint64_t)v18;
  v53 = v70;
  v52 = v71;
  v50(v44, v45);
  v54 = v41;
  v55 = v72;
  (*(void (**)(char *, uint64_t))(v69 + 8))(v54, v68);
  v56 = *(void (**)(char *, uint64_t, uint64_t))(v55 + 16);
  v56(v53, v49, v52);
  v57 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48);
  if (v57(v51, 1, v52) == 1)
  {
    v58 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v59 = v90;
    v58(v90, v53, v52);
    sub_249982310(v51);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v55 + 8))(v53, v52);
    v58 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v59 = v90;
    v58(v90, (char *)v51, v52);
  }
  v60 = v55;
  v61 = v77;
  v56(v77, (uint64_t)v59, v52);
  v62 = (uint64_t)v86;
  sub_24998BA24();
  v63 = v81;
  v56(v81, (uint64_t)v61, v52);
  v64 = v57(v62, 1, v52);
  v65 = v83;
  if (v64 == 1)
  {
    v58(v83, v63, v52);
    sub_249982310(v62);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v60 + 8))(v63, v52);
    v58(v65, (char *)v62, v52);
  }
  v56(v84, (uint64_t)v61, v52);
  v56(v85, (uint64_t)v65, v52);
  sub_24998B8EC();
  v66 = *(void (**)(char *, uint64_t))(v60 + 8);
  v66(v65, v52);
  v66(v61, v52);
  v66(v90, v52);
  return (*(uint64_t (**)(char *, uint64_t))(v80 + 8))(v39, v82);
}

uint64_t DateInterval.clampedDate(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  void (*v9)(char *, uint64_t);
  char v11;
  uint64_t v12;

  v4 = sub_24998B9D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24998B8F8();
  sub_2499829EC();
  v8 = sub_24998BACC();
  v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  v9(v7, v4);
  if ((v8 & 1) != 0)
    return sub_24998B8F8();
  sub_24998B8E0();
  v11 = sub_24998BACC();
  v9(v7, v4);
  if ((v11 & 1) != 0)
    return sub_24998B8E0();
  else
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
}

unint64_t sub_2499829EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578AF1B8;
  if (!qword_2578AF1B8)
  {
    v1 = sub_24998B9D0();
    result = MEMORY[0x24BCFC884](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_2578AF1B8);
  }
  return result;
}

void sub_249982A34()
{
  id v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  v1 = (void *)sub_24998BAF0();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  qword_2578AF1C0 = (uint64_t)v0;
}

uint64_t Date.log.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;

  if (qword_2578AEE28 != -1)
    swift_once();
  v0 = (void *)qword_2578AF1C0;
  v1 = (void *)sub_24998B9AC();
  v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  v3 = sub_24998BAFC();
  return v3;
}

uint64_t Date.shortLog.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_2578AEE28 != -1)
    swift_once();
  v0 = (void *)qword_2578AF1C0;
  v1 = (void *)sub_24998B9AC();
  v2 = objc_msgSend(v0, sel_stringFromDate_, v1);

  v3 = sub_24998BAFC();
  v5 = v4;

  v6 = sub_249982C30(6uLL, v3, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = MEMORY[0x24BCFC380](v6, v8, v10, v12);
  swift_bridgeObjectRelease();
  return v13;
}

unint64_t sub_249982C30(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_24998BB38();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_24998BB5C();
  }
  __break(1u);
  return result;
}

uint64_t static String.urchinKit(localized:comment:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v10;

  v2 = sub_24998B9E8();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_24998BAE4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)sub_24998BAF0();
  v8 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v7);

  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  sub_24998B9DC();
  return sub_24998BB14();
}

double static Double.UK.oneDay.getter()
{
  return 86400.0;
}

double static Double.UK.oneMinute.getter()
{
  return 60.0;
}

double static Double.UK.fiveMinutes.getter()
{
  return 300.0;
}

double static Double.UK.tenMinutes.getter()
{
  return 600.0;
}

double static Double.UK.fifteenMinutes.getter()
{
  return 900.0;
}

double static Double.UK.thirtyMinutes.getter()
{
  return 1800.0;
}

double static Double.UK.oneHour.getter()
{
  return 3600.0;
}

double static Double.UK.sixHours.getter()
{
  return 21600.0;
}

double static Double.UK.twelveHours.getter()
{
  return 43200.0;
}

double static Double.UK.twentyFourHours.getter()
{
  return 86400.0;
}

double static Double.UK.twoDays.getter()
{
  return 172800.0;
}

double static Double.UK.sevenDays.getter()
{
  return 604800.0;
}

double static Double.UK.nineDays.getter()
{
  return 777600.0;
}

ValueMetadata *type metadata accessor for Double.UK()
{
  return &type metadata for Double.UK;
}

ValueMetadata *type metadata accessor for AuthCurrentLocationProvider()
{
  return &type metadata for AuthCurrentLocationProvider;
}

uint64_t sub_249982F14()
{
  return swift_task_switch();
}

uint64_t sub_249982F28()
{
  uint64_t v0;
  id v1;
  id v2;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA88]), sel_init);
  v2 = objc_msgSend(v1, sel_authorizationStatus);

  return (*(uint64_t (**)(id))(v0 + 8))(v2);
}

uint64_t sub_249982F84(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_249982F9C()
{
  uint64_t v0;
  id v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA88]), sel_init);
  v2 = objc_msgSend(v1, sel_authorizationStatus);

  if (v2 - 3 > 1)
  {
    v3 = 1;
  }
  else
  {
    static CoastalLocation.dummyCurrentLocation()(*(uint64_t **)(v0 + 16));
    v3 = 0;
  }
  v4 = *(_QWORD *)(v0 + 16);
  v5 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, v3, 1, v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, double a9@<D0>, double a10@<D1>)
{
  int *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  char v27;
  uint64_t result;
  uint64_t v29;

  v20 = (int *)type metadata accessor for CoastalLocation();
  v21 = (_QWORD *)(a8 + v20[10]);
  *(_QWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  *(double *)(a8 + 16) = a9;
  *(double *)(a8 + 24) = a10;
  v22 = a8 + v20[7];
  v23 = sub_24998BA78();
  v29 = *(_QWORD *)(v23 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v22, a3, v23);
  *v21 = a6;
  v21[1] = a7;
  if (a5)
  {
    v24 = (_QWORD *)(a8 + v20[8]);
    *v24 = a4;
    v24[1] = a5;
  }
  else
  {
    CLLocationCoordinate2D.description.getter();
    sub_24998BB44();
    swift_bridgeObjectRelease();
    v25 = (_QWORD *)(a8 + v20[8]);
    *v25 = 979595116;
    v25[1] = 0xE400000000000000;
  }
  v26 = qword_2578AEE30;
  swift_bridgeObjectRetain();
  if (v26 == -1)
  {
    if (a5)
      goto LABEL_6;
LABEL_12:
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8))(a3, v23);
    v27 = 0;
    goto LABEL_13;
  }
  swift_once();
  if (!a5)
    goto LABEL_12;
LABEL_6:
  if (qword_2578AF1D8 == a4 && unk_2578AF1E0 == a5)
    v27 = 1;
  else
    v27 = sub_24998BCA0();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a3, v23);
  result = swift_bridgeObjectRelease();
LABEL_13:
  *(_BYTE *)(a8 + v20[9]) = v27 & 1;
  return result;
}

uint64_t sub_249983200(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aSwell_2[8 * a1] == *(_QWORD *)&aSwell_2[8 * a2] && qword_24998CC40[a1] == qword_24998CC40[a2])
    v3 = 1;
  else
    v3 = sub_24998BCA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_249983284()
{
  sub_24998BCAC();
  sub_24998BB2C();
  swift_bridgeObjectRelease();
  return sub_24998BCD0();
}

uint64_t sub_2499832EC()
{
  sub_24998BB2C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24998332C()
{
  sub_24998BCAC();
  sub_24998BB2C();
  swift_bridgeObjectRelease();
  return sub_24998BCD0();
}

uint64_t static CoastalLocation.dummyCurrentLocation()@<X0>(uint64_t *a1@<X8>)
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
  char *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t (*v26)(char *, uint64_t);
  uint64_t result;
  _QWORD v28[2];

  v28[0] = sub_24998BA78();
  v2 = *(_QWORD *)(v28[0] - 8);
  MEMORY[0x24BDAC7A8](v28[0]);
  v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24998B9E8();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_24998BAE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v28 - v11;
  sub_24998BAD8();
  v13 = (void *)sub_24998BAF0();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v13);

  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  sub_24998B9DC();
  v15 = sub_24998BB14();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  v18 = *MEMORY[0x24BDBFB70];
  v19 = *(_QWORD *)(MEMORY[0x24BDBFB70] + 8);
  sub_24998BA6C();
  if (qword_2578AEE30 != -1)
    swift_once();
  v20 = qword_2578AF1D8;
  v21 = unk_2578AF1E0;
  v22 = (int *)type metadata accessor for CoastalLocation();
  v23 = (uint64_t *)((char *)a1 + v22[10]);
  *a1 = v15;
  a1[1] = v17;
  a1[2] = v18;
  a1[3] = v19;
  v24 = v28[0];
  (*(void (**)(char *, char *, _QWORD))(v2 + 16))((char *)a1 + v22[7], v4, v28[0]);
  *v23 = 0;
  v23[1] = 0;
  v25 = (uint64_t *)((char *)a1 + v22[8]);
  *v25 = v20;
  v25[1] = v21;
  v26 = *(uint64_t (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain();
  result = v26(v4, v24);
  *((_BYTE *)a1 + v22[9]) = 1;
  return result;
}

uint64_t CoastalLocation.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CoastalLocation.displayName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*CoastalLocation.displayName.modify())()
{
  return nullsub_1;
}

uint64_t (*CoastalLocation.category.modify())()
{
  return nullsub_1;
}

double CoastalLocation.coordinate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void CoastalLocation.coordinate.setter(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 16) = a1;
  *(double *)(v2 + 24) = a2;
}

uint64_t (*CoastalLocation.coordinate.modify())()
{
  return nullsub_1;
}

uint64_t CoastalLocation.timezone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for CoastalLocation() + 28);
  v4 = sub_24998BA78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t CoastalLocation.timezone.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for CoastalLocation() + 28);
  v4 = sub_24998BA78();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*CoastalLocation.timezone.modify())()
{
  type metadata accessor for CoastalLocation();
  return nullsub_1;
}

uint64_t CoastalLocation.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CoastalLocation() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CoastalLocation.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for CoastalLocation() + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*CoastalLocation.id.modify())()
{
  type metadata accessor for CoastalLocation();
  return nullsub_1;
}

uint64_t CoastalLocation.isCurrent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for CoastalLocation() + 36));
}

uint64_t CoastalLocation.isCurrent.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for CoastalLocation();
  *(_BYTE *)(v1 + *(int *)(result + 36)) = a1;
  return result;
}

uint64_t (*CoastalLocation.isCurrent.modify())()
{
  type metadata accessor for CoastalLocation();
  return nullsub_1;
}

uint64_t CoastalLocation.mapkitIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for CoastalLocation() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CoastalLocation.mapkitIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for CoastalLocation() + 40));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*CoastalLocation.mapkitIdentifier.modify())()
{
  type metadata accessor for CoastalLocation();
  return nullsub_1;
}

id CoastalLocation.cllocation.getter()
{
  uint64_t v0;

  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, *(double *)(v0 + 16), *(double *)(v0 + 24));
}

void sub_249983988()
{
  qword_2578AF1D8 = 0x746E6572727563;
  unk_2578AF1E0 = 0xE700000000000000;
}

uint64_t static CoastalLocation.currentLocationID.getter()
{
  uint64_t v0;

  if (qword_2578AEE30 != -1)
    swift_once();
  v0 = qword_2578AF1D8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t CoastalLocation.currentLocation()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t result;

  sub_24997E204(v1, a1);
  v3 = type metadata accessor for CoastalLocation();
  *(_BYTE *)(a1 + *(int *)(v3 + 36)) = 1;
  if (qword_2578AEE30 != -1)
    swift_once();
  v5 = qword_2578AF1D8;
  v4 = unk_2578AF1E0;
  v6 = (uint64_t *)(a1 + *(int *)(v3 + 32));
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *v6 = v5;
  v6[1] = v4;
  return result;
}

uint64_t static CoastalLocation.makeCurrentLocation(displayName:category:coordinate:timezone:mapkitIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t (*v25)(char *, uint64_t);
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v29 = a4;
  v30 = a5;
  v28 = a1;
  v13 = sub_24998BA78();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v17(v16, a3, v13);
  v18 = qword_2578AEE30;
  swift_bridgeObjectRetain();
  if (v18 != -1)
    swift_once();
  v19 = qword_2578AF1D8;
  v20 = unk_2578AF1E0;
  v21 = (int *)type metadata accessor for CoastalLocation();
  v22 = (_QWORD *)(a6 + v21[10]);
  *(_QWORD *)a6 = v28;
  *(_QWORD *)(a6 + 8) = a2;
  *(double *)(a6 + 16) = a7;
  *(double *)(a6 + 24) = a8;
  v17((char *)(a6 + v21[7]), (uint64_t)v16, v13);
  v23 = v30;
  *v22 = v29;
  v22[1] = v23;
  v24 = (uint64_t *)(a6 + v21[8]);
  *v24 = v19;
  v24[1] = v20;
  v25 = *(uint64_t (**)(char *, uint64_t))(v14 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = v25(v16, v13);
  *(_BYTE *)(a6 + v21[9]) = 1;
  return result;
}

uint64_t type metadata accessor for CoastalLocation()
{
  uint64_t result;

  result = qword_2578AF2E0;
  if (!qword_2578AF2E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CoastalLocation.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRetain();
  sub_24998BB2C();
  swift_bridgeObjectRelease();
  sub_24998BB2C();
  sub_24998BBC8();
  v1 = type metadata accessor for CoastalLocation();
  sub_24998BA78();
  sub_2499858EC(&qword_2578AF220, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF530]);
  sub_24998BAB4();
  swift_bridgeObjectRetain();
  sub_24998BB2C();
  swift_bridgeObjectRelease();
  sub_24998BCC4();
  if (!*(_QWORD *)(v0 + *(int *)(v1 + 40) + 8))
    return sub_24998BCC4();
  sub_24998BCC4();
  swift_bridgeObjectRetain();
  sub_24998BB2C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_249983DA4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_249983DDC + 4 * byte_24998C810[a1]))(0xD000000000000010, 0x800000024998D560);
}

uint64_t sub_249983DDC()
{
  return 0x4E79616C70736964;
}

uint64_t sub_249983DFC()
{
  return 0x79726F6765746163;
}

uint64_t sub_249983E14()
{
  return 0x616E6964726F6F63;
}

uint64_t sub_249983E30()
{
  return 0x656E6F7A656D6974;
}

uint64_t sub_249983E48()
{
  return 25705;
}

uint64_t sub_249983E54()
{
  return 0x6E65727275437369;
}

BOOL sub_249983E70(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_249983E84()
{
  sub_24998BCAC();
  sub_24998BCB8();
  return sub_24998BCD0();
}

uint64_t sub_249983EC8()
{
  return sub_24998BCB8();
}

uint64_t sub_249983EF0()
{
  sub_24998BCAC();
  sub_24998BCB8();
  return sub_24998BCD0();
}

uint64_t sub_249983F30()
{
  unsigned __int8 *v0;

  return sub_249983DA4(*v0);
}

uint64_t sub_249983F38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_249986304(a1, a2);
  *a3 = result;
  return result;
}

void sub_249983F5C(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_249983F68()
{
  sub_2499857B8();
  return sub_24998BCF4();
}

uint64_t sub_249983F90()
{
  sub_2499857B8();
  return sub_24998BD00();
}

uint64_t CoastalLocation.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  __int128 v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF228);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2499857B8();
  sub_24998BCE8();
  LOBYTE(v11) = 0;
  sub_24998BC7C();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_2499857FC();
    sub_24998BC94();
    v11 = *(_OWORD *)(v3 + 16);
    v10[15] = 2;
    type metadata accessor for CLLocationCoordinate2D();
    sub_2499858EC(&qword_2578AF240, (uint64_t (*)(uint64_t))type metadata accessor for CLLocationCoordinate2D, MEMORY[0x24BEC2138]);
    sub_24998BC94();
    type metadata accessor for CoastalLocation();
    LOBYTE(v11) = 3;
    sub_24998BA78();
    sub_2499858EC(&qword_2578AF248, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF528]);
    sub_24998BC94();
    LOBYTE(v11) = 4;
    sub_24998BC7C();
    LOBYTE(v11) = 5;
    sub_24998BC88();
    LOBYTE(v11) = 6;
    sub_24998BC70();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t CoastalLocation.hashValue.getter()
{
  sub_24998BCAC();
  CoastalLocation.hash(into:)();
  return sub_24998BCD0();
}

uint64_t CoastalLocation.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  char *v39;
  __int128 v40;
  char v41;

  v33 = a2;
  v3 = sub_24998BA78();
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF250);
  v6 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for CoastalLocation();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v12[*(int *)(v10 + 40)];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v37 = v13;
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2499857B8();
  v14 = v8;
  v15 = (uint64_t)v39;
  sub_24998BCDC();
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v39 = v5;
    v16 = v6;
    v18 = v35;
    v17 = v36;
    LOBYTE(v40) = 0;
    *(_QWORD *)v12 = sub_24998BC4C();
    *((_QWORD *)v12 + 1) = v19;
    LOBYTE(v40) = 1;
    sub_249985840();
    sub_24998BC64();
    type metadata accessor for CLLocationCoordinate2D();
    v41 = 2;
    sub_2499858EC(&qword_2578AF260, (uint64_t (*)(uint64_t))type metadata accessor for CLLocationCoordinate2D, MEMORY[0x24BEC2140]);
    sub_24998BC64();
    *((_OWORD *)v12 + 1) = v40;
    LOBYTE(v40) = 3;
    sub_2499858EC(&qword_2578AF268, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF510], MEMORY[0x24BDCF540]);
    v20 = (uint64_t)v39;
    sub_24998BC64();
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(&v12[v9[7]], v20, v18);
    LOBYTE(v40) = 4;
    v21 = sub_24998BC4C();
    v22 = (uint64_t *)&v12[v9[8]];
    *v22 = v21;
    v22[1] = v23;
    LOBYTE(v40) = 5;
    v24 = sub_24998BC58();
    v25 = v9[9];
    v39 = v12;
    v12[v25] = v24 & 1;
    LOBYTE(v40) = 6;
    v26 = sub_24998BC40();
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v17);
    v29 = (uint64_t *)v37;
    swift_bridgeObjectRelease();
    *v29 = v26;
    v29[1] = v28;
    v30 = (uint64_t)v39;
    sub_24997E204((uint64_t)v39, v33);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
    return sub_24997FAB0(v30);
  }
}

uint64_t sub_249984678@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return CoastalLocation.init(from:)(a1, a2);
}

uint64_t sub_24998468C(_QWORD *a1)
{
  return CoastalLocation.encode(to:)(a1);
}

uint64_t sub_2499846A4()
{
  sub_24998BCAC();
  CoastalLocation.hash(into:)();
  return sub_24998BCD0();
}

uint64_t sub_2499846E4()
{
  sub_24998BCAC();
  CoastalLocation.hash(into:)();
  return sub_24998BCD0();
}

uint64_t sub_24998471C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + *(int *)(a1 + 32));
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t CoastalLocation.CategoryType.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24998BC34();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t CoastalLocation.CategoryType.rawValue.getter()
{
  return 0x6863616562;
}

uint64_t sub_2499847A8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24998BC34();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2499847F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CoastalLocation.CategoryType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24998481C()
{
  sub_2499865BC();
  return sub_24998BB74();
}

uint64_t sub_249984878()
{
  sub_2499865BC();
  return sub_24998BB68();
}

uint64_t sub_2499848C4()
{
  int *v0;
  uint64_t v1;
  char *v2;
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
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18[2];

  v0 = (int *)type metadata accessor for CoastalLocation();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24998BA78();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24998B9E8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_24998BAE4();
  MEMORY[0x24BDAC7A8](v8);
  __swift_allocate_value_buffer((uint64_t)v0, qword_2578AF1E8);
  v18[0] = __swift_project_value_buffer((uint64_t)v0, (uint64_t)qword_2578AF1E8);
  sub_24998BAD8();
  sub_24998B9DC();
  v9 = sub_24998BB14();
  v11 = v10;
  sub_24998BA6C();
  if (qword_2578AEE30 != -1)
    swift_once();
  v13 = qword_2578AF1D8;
  v12 = unk_2578AF1E0;
  v14 = &v2[v0[10]];
  *(_QWORD *)v2 = v9;
  *((_QWORD *)v2 + 1) = v11;
  *((_OWORD *)v2 + 1) = xmmword_24998CC60;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(&v2[v0[7]], v6, v3);
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = (uint64_t *)&v2[v0[8]];
  *v15 = v13;
  v15[1] = v12;
  v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_bridgeObjectRetain_n();
  v16(v6, v3);
  swift_bridgeObjectRelease();
  v2[v0[9]] = 1;
  return sub_249986600((uint64_t)v2, v18[0]);
}

uint64_t static CoastalLocation.demoCurrentLocation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249984CB0(&qword_2578AEE38, (uint64_t)qword_2578AF1E8, a1);
}

uint64_t sub_249984B2C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF0B0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24998BA78();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CoastalLocation();
  __swift_allocate_value_buffer(v7, qword_2578AF200);
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2578AF200);
  sub_24998BA54();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_24998BA60();
    sub_249980AC8((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  }
  return CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0x42207265646C6957, 0xEC00000068636165, (uint64_t)v6, 0, 0, 0, 0, v8, 36.953433, -122.078222);
}

uint64_t static CoastalLocation.testLocation.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_249984CB0(&qword_2578AEE40, (uint64_t)qword_2578AF200, a1);
}

uint64_t sub_249984CB0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for CoastalLocation();
  v6 = __swift_project_value_buffer(v5, a2);
  return sub_24997E204(v6, a3);
}

uint64_t sub_249984CFC()
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
  char *v15;
  uint64_t v16;
  char *v17;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t result;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF0B0);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v73 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v71 = (char *)&v61 - v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v68 = (char *)&v61 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v66 = (char *)&v61 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v64 = (char *)&v61 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v62 = (char *)&v61 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v61 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  v18 = sub_24998BA78();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v72 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v70 = (char *)&v61 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v67 = (char *)&v61 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v65 = (char *)&v61 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v63 = (char *)&v61 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v61 = (char *)&v61 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v61 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)&v61 - v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AEE90);
  v37 = *(_QWORD *)(type metadata accessor for CoastalLocation() - 8);
  v38 = *(_QWORD *)(v37 + 72);
  v39 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_24998CC70;
  v69 = v40;
  v41 = v40 + v39;
  sub_24998BA54();
  v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  v43 = v19;
  if (v42(v17, 1, v18) == 1)
  {
    sub_24998BA60();
    sub_249980AC8((uint64_t)v17);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v36, v17, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0x42207265646C6957, 0xEC00000068636165, (uint64_t)v36, 0, 0, 0, 0, v41, 36.953433, -122.078222);
  sub_24998BA54();
  v44 = v42(v15, 1, v18);
  v46 = (uint64_t)v63;
  v45 = (uint64_t)v64;
  v74 = v43;
  if (v44 == 1)
  {
    sub_24998BA60();
    sub_249980AC8((uint64_t)v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v34, v15, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0xD000000000000015, 0x800000024998D580, (uint64_t)v34, 0, 0, 0, 0, v41 + v38, 36.9633317, -122.007964);
  v47 = (uint64_t)v62;
  sub_24998BA54();
  v48 = v42((char *)v47, 1, v18);
  v49 = (uint64_t)v70;
  v50 = (uint64_t)v61;
  if (v48 == 1)
  {
    sub_24998BA60();
    sub_249980AC8(v47);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v61, v47, v18);
  }
  v51 = (uint64_t)v68;
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0x1000000000000010, 0x800000024998D5A0, v50, 0, 0, 0, 0, v41 + 2 * v38, 36.9616202, -122.024417);
  sub_24998BA54();
  v52 = v42((char *)v45, 1, v18);
  v53 = (uint64_t)v73;
  if (v52 == 1)
  {
    sub_24998BA60();
    sub_249980AC8(v45);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 32))(v46, v45, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0x616C6F7469706143, 0xEE00686361654220, v46, 0, 0, 0, 0, v41 + 3 * v38, 36.9714611, -121.951182);
  v54 = (uint64_t)v66;
  sub_24998BA54();
  if (v42((char *)v54, 1, v18) == 1)
  {
    v55 = (uint64_t)v65;
    sub_24998BA60();
    sub_249980AC8(v54);
  }
  else
  {
    v55 = (uint64_t)v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v65, v54, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0xD000000000000016, 0x800000024998D5C0, v55, 0, 0, 0, 0, v41 + 4 * v38, 36.9621603, -121.998786);
  sub_24998BA54();
  v56 = v42((char *)v51, 1, v18);
  v57 = (uint64_t)v67;
  if (v56 == 1)
  {
    sub_24998BA60();
    sub_249980AC8(v51);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v74 + 32))(v67, v51, v18);
  }
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0xD000000000000014, 0x800000024998D5E0, v57, 0, 0, 0, 0, v41 + 5 * v38, 36.9718383, -121.91376);
  v58 = (uint64_t)v71;
  sub_24998BA54();
  if (v42((char *)v58, 1, v18) == 1)
  {
    sub_24998BA60();
    sub_249980AC8(v58);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 32))(v49, v58, v18);
  }
  v59 = (uint64_t)v72;
  CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0xD000000000000010, 0x800000024998D600, v49, 0, 0, 0, 0, v41 + 6 * v38, 36.96054, -121.989479);
  sub_24998BA54();
  if (v42((char *)v53, 1, v18) == 1)
  {
    sub_24998BA60();
    sub_249980AC8(v53);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 32))(v59, v53, v18);
  }
  result = CoastalLocation.init(displayName:category:coordinate:timezone:id:mapkitIdentifier:)(0x6B6F6F4820656854, 0xE800000000000000, v59, 0, 0, 0, 0, v41 - v38 + 8 * v38, 36.9595787, -121.965127);
  qword_2578AF218 = v69;
  return result;
}

uint64_t static CoastalLocation.testLocations.getter()
{
  if (qword_2578AEE48 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t _s9UrchinKit15CoastalLocationV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
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
  double *v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  double *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char v31;
  uint64_t v33;

  v4 = type metadata accessor for CoastalLocation();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v33 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (double *)((char *)&v33 - v12);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (double *)((char *)&v33 - v15);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (double *)((char *)&v33 - v18);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (double *)((char *)&v33 - v20);
  if ((*a1 != *a2 || a1[1] != a2[1]) && (sub_24998BCA0() & 1) == 0)
  {
    sub_24997E204((uint64_t)a1, (uint64_t)v21);
    sub_24997E204((uint64_t)a2, (uint64_t)v19);
    sub_24997FAB0((uint64_t)v19);
    sub_24997FAB0((uint64_t)v21);
    sub_24997E204((uint64_t)a1, (uint64_t)v16);
    sub_24997E204((uint64_t)a2, (uint64_t)v13);
    goto LABEL_12;
  }
  sub_24997E204((uint64_t)a1, (uint64_t)v21);
  sub_24997E204((uint64_t)a2, (uint64_t)v19);
  v22 = v21[2];
  sub_24997FAB0((uint64_t)v21);
  v23 = v19[2];
  sub_24997FAB0((uint64_t)v19);
  sub_24997E204((uint64_t)a1, (uint64_t)v16);
  sub_24997E204((uint64_t)a2, (uint64_t)v13);
  if (v22 != v23)
  {
LABEL_12:
    sub_24997FAB0((uint64_t)v13);
    sub_24997FAB0((uint64_t)v16);
    sub_24997E204((uint64_t)a1, (uint64_t)v10);
    sub_24997E204((uint64_t)a2, (uint64_t)v7);
    goto LABEL_13;
  }
  v24 = v16[3];
  sub_24997FAB0((uint64_t)v16);
  v25 = v13[3];
  sub_24997FAB0((uint64_t)v13);
  sub_24997E204((uint64_t)a1, (uint64_t)v10);
  sub_24997E204((uint64_t)a2, (uint64_t)v7);
  if (v24 != v25)
  {
LABEL_13:
    v31 = 0;
    goto LABEL_14;
  }
  v26 = *(int *)(v4 + 32);
  v27 = *(_QWORD *)&v10[v26];
  v28 = *(_QWORD *)&v10[v26 + 8];
  v29 = &v7[v26];
  if (v27 == *(_QWORD *)v29 && v28 == *((_QWORD *)v29 + 1))
    v31 = 1;
  else
    v31 = sub_24998BCA0();
LABEL_14:
  sub_24997FAB0((uint64_t)v10);
  sub_24997FAB0((uint64_t)v7);
  return v31 & 1;
}

unint64_t sub_2499857B8()
{
  unint64_t result;

  result = qword_2578AF230;
  if (!qword_2578AF230)
  {
    result = MEMORY[0x24BCFC884](&unk_24998CBC8, &type metadata for CoastalLocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF230);
  }
  return result;
}

unint64_t sub_2499857FC()
{
  unint64_t result;

  result = qword_2578AF238;
  if (!qword_2578AF238)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for CoastalLocation.CategoryType, &type metadata for CoastalLocation.CategoryType);
    atomic_store(result, (unint64_t *)&qword_2578AF238);
  }
  return result;
}

unint64_t sub_249985840()
{
  unint64_t result;

  result = qword_2578AF258;
  if (!qword_2578AF258)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for CoastalLocation.CategoryType, &type metadata for CoastalLocation.CategoryType);
    atomic_store(result, (unint64_t *)&qword_2578AF258);
  }
  return result;
}

uint64_t sub_249985884(uint64_t a1)
{
  uint64_t result;

  result = sub_2499858EC(&qword_2578AF270, (uint64_t (*)(uint64_t))type metadata accessor for CoastalLocation, (uint64_t)&protocol conformance descriptor for CoastalLocation);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2499858C0()
{
  return sub_2499858EC(&qword_2578AF278, (uint64_t (*)(uint64_t))type metadata accessor for CoastalLocation, (uint64_t)&protocol conformance descriptor for CoastalLocation);
}

uint64_t sub_2499858EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BCFC884](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24998592C()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_24998593C()
{
  unint64_t result;

  result = qword_2578AF280;
  if (!qword_2578AF280)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for CoastalLocation.CategoryType, &type metadata for CoastalLocation.CategoryType);
    atomic_store(result, (unint64_t *)&qword_2578AF280);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for CoastalLocation(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    v8 = a3[7];
    v9 = a1 + v8;
    v10 = (uint64_t)a2 + v8;
    v11 = sub_24998BA78();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[8];
    v14 = a3[9];
    v15 = (_QWORD *)((char *)v4 + v13);
    v16 = (uint64_t *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    *((_BYTE *)v4 + v14) = *((_BYTE *)a2 + v14);
    v18 = a3[10];
    v19 = (_QWORD *)((char *)v4 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for CoastalLocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_24998BA78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CoastalLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24998BA78();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[8];
  v13 = a3[9];
  v14 = (_QWORD *)(a1 + v12);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(a2 + v13);
  v17 = a3[10];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CoastalLocation(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  v6 = a3[7];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_24998BA78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[8];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  v13 = a3[10];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for CoastalLocation(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[7];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_24998BA78();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((_BYTE *)a1 + v11) = *((_BYTE *)a2 + v11);
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  return a1;
}

uint64_t assignWithTake for CoastalLocation(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v7 = a3[7];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24998BA78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[8];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[10];
  *(_BYTE *)(a1 + a3[9]) = *(_BYTE *)(a2 + a3[9]);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CoastalLocation()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_249985DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_24998BA78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for CoastalLocation()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_249985E78(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_24998BA78();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_249985EEC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24998BA78();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CoastalLocation.CategoryType(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_249985FCC + 4 * byte_24998C817[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_249985FEC + 4 * byte_24998C81C[v4]))();
}

_BYTE *sub_249985FCC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_249985FEC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_249985FF4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_249985FFC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_249986004(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24998600C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CoastalLocation.CategoryType()
{
  return &type metadata for CoastalLocation.CategoryType;
}

uint64_t getEnumTagSinglePayload for CoastalLocation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CoastalLocation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249986104 + 4 * byte_24998C826[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_249986138 + 4 * byte_24998C821[v4]))();
}

uint64_t sub_249986138(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249986140(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249986148);
  return result;
}

uint64_t sub_249986154(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24998615CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_249986160(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249986168(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CoastalLocation.CodingKeys()
{
  return &type metadata for CoastalLocation.CodingKeys;
}

unint64_t sub_249986188()
{
  unint64_t result;

  result = qword_2578AF330;
  if (!qword_2578AF330)
  {
    result = MEMORY[0x24BCFC884](&unk_24998CBA0, &type metadata for CoastalLocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF330);
  }
  return result;
}

unint64_t sub_2499861D0()
{
  unint64_t result;

  result = qword_2578AF338;
  if (!qword_2578AF338)
  {
    result = MEMORY[0x24BCFC884](&unk_24998CB10, &type metadata for CoastalLocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF338);
  }
  return result;
}

unint64_t sub_249986218()
{
  unint64_t result;

  result = qword_2578AF340;
  if (!qword_2578AF340)
  {
    result = MEMORY[0x24BCFC884](&unk_24998CB38, &type metadata for CoastalLocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578AF340);
  }
  return result;
}

uint64_t sub_24998625C()
{
  sub_24998BCAC();
  sub_24998BB2C();
  return sub_24998BCD0();
}

uint64_t sub_2499862A8()
{
  return sub_24998BB2C();
}

uint64_t sub_2499862BC()
{
  sub_24998BCAC();
  sub_24998BB2C();
  return sub_24998BCD0();
}

uint64_t sub_249986304(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61;
  if (v3 || (sub_24998BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79726F6765746163 && a2 == 0xE800000000000000 || (sub_24998BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616E6964726F6F63 && a2 == 0xEA00000000006574 || (sub_24998BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656E6F7A656D6974 && a2 == 0xE800000000000000 || (sub_24998BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 25705 && a2 == 0xE200000000000000 || (sub_24998BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E65727275437369 && a2 == 0xE900000000000074 || (sub_24998BCA0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024998D560)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_24998BCA0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

unint64_t sub_2499865BC()
{
  unint64_t result;

  result = qword_2578AF348;
  if (!qword_2578AF348)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for CoastalLocation.CategoryType, &type metadata for CoastalLocation.CategoryType);
    atomic_store(result, (unint64_t *)&qword_2578AF348);
  }
  return result;
}

uint64_t sub_249986600(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CoastalLocation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t SelectedLocationManager.__allocating_init(currentLocationProvider:staticLocationProvider:selectedLocationProvider:)(__int128 *a1, __int128 *a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = swift_allocObject();
  swift_defaultActor_initialize();
  v7 = OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_2578AEE58 != -1)
    swift_once();
  v8 = sub_24998BA9C();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2578B09C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6 + v7, v9, v8);
  sub_24997FBC4(a1, v6 + 112);
  sub_24997FBC4(a2, v6 + 152);
  sub_24997FBC4(a3, v6 + 192);
  return v6;
}

uint64_t SelectedLocationManager.init(currentLocationProvider:staticLocationProvider:selectedLocationProvider:)(__int128 *a1, __int128 *a2, __int128 *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_defaultActor_initialize();
  v7 = OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_2578AEE58 != -1)
    swift_once();
  v8 = sub_24998BA9C();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_2578B09C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v3 + v7, v9, v8);
  sub_24997FBC4(a1, v3 + 112);
  sub_24997FBC4(a2, v3 + 152);
  sub_24997FBC4(a3, v3 + 192);
  return v3;
}

_QWORD *SelectedLocationManager.__allocating_init()()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v1 = (char *)v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_2578AEE58 != -1)
    swift_once();
  v2 = sub_24998BA9C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2578B09C8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1, v3, v2);
  if (qword_2578AEDF8 != -1)
    swift_once();
  v4 = qword_2578AEE00;
  v0[17] = &type metadata for AuthCurrentLocationProvider;
  v0[18] = &off_251AD3A40;
  v5 = type metadata accessor for SyncedPreferenceManager();
  v0[22] = v5;
  v0[23] = &protocol witness table for SyncedPreferenceManager;
  v0[19] = v4;
  v0[27] = v5;
  v0[28] = &protocol witness table for SyncedPreferenceManager;
  v0[24] = v4;
  swift_retain_n();
  return v0;
}

_QWORD *SelectedLocationManager.init()()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_defaultActor_initialize();
  v1 = (char *)v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  if (qword_2578AEE58 != -1)
    swift_once();
  v2 = sub_24998BA9C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2578B09C8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v1, v3, v2);
  if (qword_2578AEDF8 != -1)
    swift_once();
  v4 = qword_2578AEE00;
  v0[17] = &type metadata for AuthCurrentLocationProvider;
  v0[18] = &off_251AD3A40;
  v5 = type metadata accessor for SyncedPreferenceManager();
  v0[22] = v5;
  v0[23] = &protocol witness table for SyncedPreferenceManager;
  v0[19] = v4;
  v0[27] = v5;
  v0[28] = &protocol witness table for SyncedPreferenceManager;
  v0[24] = v4;
  swift_retain_n();
  return v0;
}

uint64_t sub_249986A08(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[30] = a1;
  v2[31] = v1;
  v3 = type metadata accessor for CoastalLocation();
  v2[32] = v3;
  v2[33] = *(_QWORD *)(v3 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = swift_task_alloc();
  v2[45] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_249986B0C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t);

  sub_24997FB38(v0[31] + 192, (uint64_t)(v0 + 2));
  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v5 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 16) + *(_QWORD *)(v2 + 16));
  v3 = (_QWORD *)swift_task_alloc();
  v0[46] = v3;
  *v3 = v0;
  v3[1] = sub_249986B98;
  return v5(v1, v2);
}

uint64_t sub_249986B98(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 376) = a1;
  *(_QWORD *)(v3 + 384) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249986BF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = v0[31];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  sub_24997FB38(v1 + 112, (uint64_t)(v0 + 7));
  v2 = v0[10];
  v3 = v0[11];
  __swift_project_boxed_opaque_existential_1(v0 + 7, v2);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  v0[49] = v4;
  *v4 = v0;
  v4[1] = sub_249986C8C;
  return v6(v2, v3);
}

uint64_t sub_249986C8C(int a1)
{
  uint64_t v1;

  *(_DWORD *)(*(_QWORD *)v1 + 456) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249986CEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  uint64_t (*v12)(_QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 384);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  if (v1)
  {
    if (qword_2578AEE30 != -1)
      swift_once();
    v2 = *(_QWORD *)(v0 + 248) + 112;
    v3 = unk_2578AF1E0;
    *(_QWORD *)(v0 + 400) = qword_2578AF1D8;
    *(_QWORD *)(v0 + 408) = v3;
    sub_24997FB38(v2, v0 + 96);
    v4 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 128);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), v4);
    v12 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v5 + 16) + *(_QWORD *)(v5 + 16));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v6;
    *v6 = v0;
    v6[1] = sub_249986E84;
    return v12(*(_QWORD *)(v0 + 360), v4, v5);
  }
  else
  {
    v8 = sub_24998BA84();
    v9 = sub_24998BBBC();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_24997A000, v8, v9, "SelectedLocation is nil, determining default...", v10, 2u);
      MEMORY[0x24BCFC8F0](v10, -1, -1);
    }

    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 448) = v11;
    *v11 = v0;
    v11[1] = sub_249987A8C;
    return sub_2499889AC(*(_QWORD *)(v0 + 240), *(_DWORD *)(v0 + 456));
  }
}

uint64_t sub_249986E84()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249986EDC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t (*v20)(_QWORD, uint64_t, uint64_t);

  v1 = v0[50];
  v2 = v0[51];
  v4 = v0[47];
  v3 = v0[48];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 12));
  if (v4 == v1 && v3 == v2)
  {
    sub_249989D78(v0[45], v0[44]);
  }
  else
  {
    v6 = v0[44];
    v7 = v0[45];
    v8 = sub_24998BCA0();
    sub_249989D78(v7, v6);
    if ((v8 & 1) == 0)
    {
      v9 = v0[44];
LABEL_9:
      v10 = v0[31];
      sub_249989DC0(v9);
      sub_24997FB38(v10 + 152, (uint64_t)(v0 + 17));
      v11 = v0[20];
      v12 = v0[21];
      __swift_project_boxed_opaque_existential_1(v0 + 17, v11);
      v19 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v12 + 16) + *(_QWORD *)(v12 + 16));
      v13 = (_QWORD *)swift_task_alloc();
      v0[53] = v13;
      *v13 = v0;
      v13[1] = sub_24998707C;
      return v19(v11, v12);
    }
  }
  v9 = v0[44];
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v0[33] + 48))(v9, 1, v0[32]) == 1)
    goto LABEL_9;
  v15 = v0[31] + 112;
  sub_249989DC0(v9);
  swift_bridgeObjectRelease();
  sub_24997FB38(v15, (uint64_t)(v0 + 22));
  v16 = v0[25];
  v17 = v0[26];
  __swift_project_boxed_opaque_existential_1(v0 + 22, v16);
  v20 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v17 + 16) + *(_QWORD *)(v17 + 16));
  v18 = (_QWORD *)swift_task_alloc();
  v0[55] = v18;
  *v18 = v0;
  v18[1] = sub_24998795C;
  return v20(v0[30], v16, v17);
}

uint64_t sub_24998707C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 432) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2499870DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(_QWORD, _QWORD, _QWORD);
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  unint64_t v30;
  uint8_t *v31;
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
  unsigned int v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t *v73;
  uint64_t (*v74)(uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  int v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v90;

  v1 = *(_QWORD *)(v0 + 360);
  v3 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 264);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  v4 = *(unsigned int (**)(_QWORD, _QWORD, _QWORD))(v2 + 48);
  if (v4(v1, 1, v3) != 1
    || (*(_QWORD *)(v0 + 376) == *(_QWORD *)(v0 + 400)
      ? (v5 = *(_QWORD *)(v0 + 384) == *(_QWORD *)(v0 + 408))
      : (v5 = 0),
        !v5 && (sub_24998BCA0() & 1) == 0))
  {
    v9 = *(_QWORD *)(v0 + 432);
    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v11 = v4;
      v13 = *(_QWORD *)(v0 + 256);
      v12 = *(_QWORD *)(v0 + 264);
      v14 = v9 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
      v15 = *(_QWORD *)(v12 + 72);
      swift_bridgeObjectRetain();
      while (1)
      {
        v17 = *(_QWORD *)(v0 + 376);
        v16 = *(_QWORD *)(v0 + 384);
        v18 = *(_QWORD *)(v0 + 288);
        sub_24997E204(v14, v18);
        v19 = (_QWORD *)(v18 + *(int *)(v13 + 32));
        v20 = *v19 == v17 && v16 == v19[1];
        if (v20 || (sub_24998BCA0() & 1) != 0)
          break;
        sub_24997FAB0(*(_QWORD *)(v0 + 288));
        v14 += v15;
        if (!--v10)
        {
          swift_bridgeObjectRelease();
          v4 = v11;
          goto LABEL_18;
        }
      }
      v21 = *(_QWORD *)(v0 + 320);
      v22 = *(_QWORD *)(v0 + 288);
      v24 = *(_QWORD *)(v0 + 256);
      v23 = *(_QWORD *)(v0 + 264);
      swift_bridgeObjectRelease();
      sub_249986600(v22, v21);
      v89 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
      v89(v21, 0, 1, v24);
      v4 = v11;
    }
    else
    {
LABEL_18:
      v89 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 264) + 56);
      v89(*(_QWORD *)(v0 + 320), 1, 1, *(_QWORD *)(v0 + 256));
    }
    v25 = *(_QWORD *)(v0 + 312);
    v26 = *(_QWORD *)(v0 + 256);
    sub_249989D78(*(_QWORD *)(v0 + 320), v25);
    if (v4(v25, 1, v26) != 1)
    {
      v35 = *(_QWORD *)(v0 + 360);
      v36 = *(_QWORD *)(v0 + 312);
      v37 = *(_QWORD *)(v0 + 296);
      v38 = *(_QWORD *)(v0 + 256);
      v39 = *(_QWORD *)(v0 + 240);
      sub_249989DC0(*(_QWORD *)(v0 + 320));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_249989DC0(v35);
      sub_249986600(v36, v37);
      sub_249986600(v37, v39);
      v40 = v39;
      v41 = 0;
      v42 = v38;
LABEL_43:
      v89(v40, v41, 1, v42);
      goto LABEL_44;
    }
    sub_249989DC0(*(_QWORD *)(v0 + 312));
    swift_bridgeObjectRetain();
    v27 = sub_24998BA84();
    v28 = sub_24998BBBC();
    v29 = os_log_type_enabled(v27, v28);
    v30 = *(_QWORD *)(v0 + 384);
    if (v29)
    {
      v88 = *(_QWORD *)(v0 + 376);
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v90 = v32;
      *(_DWORD *)v31 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 216) = sub_24997E328(v88, v30, &v90);
      sub_24998BBD4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24997A000, v27, v28, "Could not find selected locationID: %s in location list.", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCFC8F0](v32, -1, -1);
      MEMORY[0x24BCFC8F0](v31, -1, -1);

      if (*(_QWORD *)(v9 + 16))
      {
LABEL_23:
        v33 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 264) + 80);
        sub_24997E204(*(_QWORD *)(v0 + 432) + ((v33 + 32) & ~v33), *(_QWORD *)(v0 + 304));
        v34 = 0;
        goto LABEL_27;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (*(_QWORD *)(v9 + 16))
        goto LABEL_23;
    }
    v34 = 1;
LABEL_27:
    v43 = *(_QWORD *)(v0 + 304);
    v44 = *(_QWORD *)(v0 + 256);
    v89(v43, v34, 1, v44);
    swift_bridgeObjectRelease();
    v45 = v4(v43, 1, v44);
    v46 = *(_QWORD *)(v0 + 304);
    if (v45 == 1)
    {
      sub_249989DC0(v46);
      v47 = sub_24998BA84();
      v48 = sub_24998BBB0();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v49 = 0;
        _os_log_impl(&dword_24997A000, v47, v48, "Tried to default to first static location but could not find any, returning nil.", v49, 2u);
        MEMORY[0x24BCFC8F0](v49, -1, -1);
      }
      v50 = *(_QWORD *)(v0 + 360);
      v51 = *(_QWORD *)(v0 + 320);
      v52 = *(_QWORD *)(v0 + 256);
      v53 = *(_QWORD *)(v0 + 240);

      sub_249989DC0(v51);
      sub_249989DC0(v50);
      v40 = v53;
      v41 = 1;
      v42 = v52;
    }
    else
    {
      v54 = *(_QWORD *)(v0 + 272);
      v55 = *(_QWORD *)(v0 + 280);
      sub_249986600(v46, v55);
      sub_24997E204(v55, v54);
      v56 = sub_24998BA84();
      v57 = sub_24998BBBC();
      v58 = os_log_type_enabled(v56, v57);
      v59 = *(_QWORD *)(v0 + 320);
      v60 = *(_QWORD *)(v0 + 272);
      if (v58)
      {
        v61 = (uint8_t *)swift_slowAlloc();
        v62 = swift_slowAlloc();
        v90 = v62;
        *(_DWORD *)v61 = 136315138;
        v63 = CLLocationCoordinate2D.description.getter();
        *(_QWORD *)(v0 + 232) = sub_24997E328(v63, v64, &v90);
        sub_24998BBD4();
        swift_bridgeObjectRelease();
        sub_24997FAB0(v60);
        _os_log_impl(&dword_24997A000, v56, v57, "Defaulting to first static location: %s", v61, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BCFC8F0](v62, -1, -1);
        MEMORY[0x24BCFC8F0](v61, -1, -1);
      }
      else
      {
        sub_24997FAB0(*(_QWORD *)(v0 + 272));
      }

      sub_249989DC0(v59);
      v84 = *(_QWORD *)(v0 + 280);
      v85 = *(_QWORD *)(v0 + 256);
      v86 = *(_QWORD *)(v0 + 240);
      sub_249989DC0(*(_QWORD *)(v0 + 360));
      sub_249986600(v84, v86);
      v40 = v86;
      v41 = 0;
      v42 = v85;
    }
    goto LABEL_43;
  }
  v6 = *(_QWORD *)(v0 + 432);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v6 + 16))
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 264) + 80);
    sub_24997E204(*(_QWORD *)(v0 + 432) + ((v7 + 32) & ~v7), *(_QWORD *)(v0 + 344));
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  v66 = *(_QWORD *)(v0 + 336);
  v65 = *(_QWORD *)(v0 + 344);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 264) + 56))(v65, v8, 1, *(_QWORD *)(v0 + 256));
  swift_bridgeObjectRelease();
  sub_249989D78(v65, v66);
  v67 = sub_24998BA84();
  v68 = sub_24998BBBC();
  v69 = os_log_type_enabled(v67, v68);
  v70 = *(_QWORD *)(v0 + 336);
  if (v69)
  {
    v71 = *(_QWORD *)(v0 + 328);
    v72 = *(_QWORD *)(v0 + 256);
    v73 = (uint8_t *)swift_slowAlloc();
    v74 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v4;
    v75 = swift_slowAlloc();
    v90 = v75;
    *(_DWORD *)v73 = 136315138;
    sub_249989D78(v70, v71);
    v76 = v74(v71, 1, v72);
    v77 = *(_QWORD *)(v0 + 328);
    if (v76 == 1)
    {
      sub_249989DC0(*(_QWORD *)(v0 + 328));
      v78 = 0xE300000000000000;
      v79 = 7104878;
    }
    else
    {
      v80 = (uint64_t *)(v77 + *(int *)(*(_QWORD *)(v0 + 256) + 32));
      v79 = *v80;
      v78 = v80[1];
      swift_bridgeObjectRetain();
      sub_24997FAB0(v77);
    }
    v81 = *(_QWORD *)(v0 + 336);
    *(_QWORD *)(v0 + 224) = sub_24997E328(v79, v78, &v90);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    sub_249989DC0(v81);
    _os_log_impl(&dword_24997A000, v67, v68, "Prefer selected current location, but we don't have a current location, falling back to first static location: %s.", v73, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v75, -1, -1);
    MEMORY[0x24BCFC8F0](v73, -1, -1);

  }
  else
  {

    sub_249989DC0(v70);
  }
  v82 = *(_QWORD *)(v0 + 344);
  v83 = *(_QWORD *)(v0 + 240);
  sub_249989DC0(*(_QWORD *)(v0 + 360));
  sub_249989E00(v82, v83);
LABEL_44:
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

uint64_t sub_24998795C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2499879B4()
{
  uint64_t v0;

  sub_249989DC0(*(_QWORD *)(v0 + 360));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 176);
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

uint64_t sub_249987A8C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
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
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_249987B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[25] = a2;
  v3[26] = v2;
  v3[24] = a1;
  v4 = type metadata accessor for CoastalLocation();
  v3[27] = v4;
  v3[28] = *(_QWORD *)(v4 - 8);
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  v3[32] = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360) - 8);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_249987C2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v12)(_QWORD, uint64_t, uint64_t);
  uint64_t (*v13)(_QWORD, _QWORD, uint64_t, uint64_t);

  if (v0[25])
  {
    sub_24997FB38(v0[26] + 112, (uint64_t)(v0 + 7));
    v1 = v0[10];
    v2 = v0[11];
    __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
    v12 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v2 + 16) + *(_QWORD *)(v2 + 16));
    swift_bridgeObjectRetain();
    v3 = (_QWORD *)swift_task_alloc();
    v0[36] = v3;
    *v3 = v0;
    v3[1] = sub_249987DDC;
    return v12(v0[35], v1, v2);
  }
  else
  {
    v5 = sub_24998BA84();
    v6 = sub_24998BBBC();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_24997A000, v5, v6, "Clearing selected location", v7, 2u);
      MEMORY[0x24BCFC8F0](v7, -1, -1);
    }
    v8 = v0[26];

    sub_24997FB38(v8 + 192, (uint64_t)(v0 + 2));
    v9 = v0[5];
    v10 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v9);
    v13 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v10 + 8) + *(_QWORD *)(v10 + 8));
    v11 = (_QWORD *)swift_task_alloc();
    v0[40] = v11;
    *v11 = v0;
    v11[1] = sub_249988668;
    return v13(0, 0, v9, v10);
  }
}

uint64_t sub_249987DDC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249987E34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = v0[26];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  sub_24997FB38(v1 + 152, (uint64_t)(v0 + 12));
  v2 = v0[15];
  v3 = v0[16];
  __swift_project_boxed_opaque_existential_1(v0 + 12, v2);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 16) + *(_QWORD *)(v3 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v0[37] = v4;
  *v4 = v0;
  v4[1] = sub_249987EC8;
  return v6(v2, v3);
}

uint64_t sub_249987EC8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249987F28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  char v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  unint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint64_t v45;
  unint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(_QWORD, _QWORD, uint64_t, uint64_t);
  _QWORD *v59;

  v1 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF378);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_24998CD00;
  sub_249989D78(v2, v6 + v5);
  v7 = sub_24998873C(v1);
  swift_bridgeObjectRelease();
  v59 = (_QWORD *)v6;
  sub_24998A1D0(v7);
  v8 = *(_QWORD *)(v6 + 16);
  if (v8)
  {
    v9 = *(_QWORD *)(v0 + 224);
    v10 = (uint64_t)v59 + v5;
    swift_bridgeObjectRetain();
    v11 = MEMORY[0x24BEE4AF8];
    do
    {
      v13 = *(_QWORD *)(v0 + 264);
      v12 = *(_QWORD *)(v0 + 272);
      v14 = *(_QWORD *)(v0 + 216);
      sub_249989D78(v10, v12);
      sub_249989E00(v12, v13);
      v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v13, 1, v14);
      v16 = *(_QWORD *)(v0 + 264);
      if (v15 == 1)
      {
        sub_249989DC0(v16);
      }
      else
      {
        v18 = *(_QWORD *)(v0 + 240);
        v17 = *(_QWORD *)(v0 + 248);
        sub_249986600(v16, v17);
        sub_249986600(v17, v18);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v11 = sub_249989960(0, *(_QWORD *)(v11 + 16) + 1, 1, v11);
        v20 = *(_QWORD *)(v11 + 16);
        v19 = *(_QWORD *)(v11 + 24);
        if (v20 >= v19 >> 1)
          v11 = sub_249989960(v19 > 1, v20 + 1, 1, v11);
        v21 = *(_QWORD *)(v0 + 240);
        *(_QWORD *)(v11 + 16) = v20 + 1;
        sub_249986600(v21, v11+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v20);
      }
      v10 += v4;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease_n();
    v22 = *(_QWORD *)(v11 + 16);
    if (v22)
      goto LABEL_12;
LABEL_20:
    swift_bridgeObjectRelease();
    v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  v11 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  if (!v22)
    goto LABEL_20;
LABEL_12:
  v23 = *(_QWORD *)(v0 + 224);
  v55 = *(_QWORD *)(v0 + 216);
  v59 = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_249989E48(0, v22, 0);
  v24 = v11 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
  v25 = *(_QWORD *)(v23 + 72);
  do
  {
    v26 = *(_QWORD *)(v0 + 232);
    sub_24997E204(v24, v26);
    v27 = (uint64_t *)(v26 + *(int *)(v55 + 32));
    v29 = *v27;
    v28 = v27[1];
    swift_bridgeObjectRetain();
    sub_24997FAB0(v26);
    v30 = v59;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_249989E48(0, v59[2] + 1, 1);
      v30 = v59;
    }
    v32 = v30[2];
    v31 = v30[3];
    if (v32 >= v31 >> 1)
    {
      sub_249989E48(v31 > 1, v32 + 1, 1);
      v30 = v59;
    }
    v30[2] = v32 + 1;
    v33 = &v30[2 * v32];
    v33[4] = v29;
    v33[5] = v28;
    v24 += v25;
    --v22;
  }
  while (v22);
  swift_bridgeObjectRelease();
LABEL_21:
  v34 = (uint64_t *)(v0 + 192);
  v35 = sub_2499888E8(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200), v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((v35 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v36 = sub_24998BA84();
    v37 = sub_24998BBBC();
    v38 = os_log_type_enabled(v36, v37);
    v39 = *(_QWORD *)(v0 + 200);
    if (v38)
    {
      v56 = *v34;
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v59 = (_QWORD *)v41;
      *(_DWORD *)v40 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 184) = sub_24997E328(v56, v39, (uint64_t *)&v59);
      sub_24998BBD4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24997A000, v36, v37, "Setting selected location to %s.", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCFC8F0](v41, -1, -1);
      MEMORY[0x24BCFC8F0](v40, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_24997FB38(*(_QWORD *)(v0 + 208) + 192, v0 + 136);
    v50 = *(_QWORD *)(v0 + 160);
    v51 = *(_QWORD *)(v0 + 168);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), v50);
    v58 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v51 + 8) + *(_QWORD *)(v51 + 8));
    v52 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v52;
    *v52 = v0;
    v52[1] = sub_249988580;
    return v58(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 200), v50, v51);
  }
  else
  {
    v42 = sub_24998BA84();
    v43 = sub_24998BBB0();
    v44 = os_log_type_enabled(v42, v43);
    v45 = *(_QWORD *)(v0 + 280);
    v46 = *(_QWORD *)(v0 + 200);
    if (v44)
    {
      v54 = *v34;
      v57 = *(_QWORD *)(v0 + 280);
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v59 = (_QWORD *)v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 176) = sub_24997E328(v54, v46, (uint64_t *)&v59);
      sub_24998BBD4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24997A000, v42, v43, "Selected location %s is not contained the location list.", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCFC8F0](v48, -1, -1);
      MEMORY[0x24BCFC8F0](v47, -1, -1);

      v49 = v57;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v49 = v45;
    }
    sub_249989DC0(v49);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_249988580()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2499885E0()
{
  uint64_t v0;

  sub_249989DC0(*(_QWORD *)(v0 + 280));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_249988668()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2499886C0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24998873C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v16 = type metadata accessor for CoastalLocation();
  v2 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v17 = MEMORY[0x24BEE4AF8];
    sub_249989E64(0, v9, 0);
    v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v12 = *(_QWORD *)(v2 + 72);
    do
    {
      sub_24997E204(v11, (uint64_t)v4);
      swift_dynamicCast();
      v10 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249989E64(0, *(_QWORD *)(v10 + 16) + 1, 1);
        v10 = v17;
      }
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_249989E64(v13 > 1, v14 + 1, 1);
        v10 = v17;
      }
      *(_QWORD *)(v10 + 16) = v14 + 1;
      sub_249989E00((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v14);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

uint64_t sub_2499888E8(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_24998BCA0();
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
    if (v12 || (sub_24998BCA0() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2499889AC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(v3 + 344) = a2;
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v2;
  v4 = type metadata accessor for CoastalLocation();
  *(_QWORD *)(v3 + 168) = v4;
  *(_QWORD *)(v3 + 176) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 184) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  *(_QWORD *)(v3 + 192) = swift_task_alloc();
  *(_QWORD *)(v3 + 200) = swift_task_alloc();
  *(_QWORD *)(v3 + 208) = swift_task_alloc();
  *(_QWORD *)(v3 + 216) = swift_task_alloc();
  *(_QWORD *)(v3 + 224) = swift_task_alloc();
  *(_QWORD *)(v3 + 232) = swift_task_alloc();
  *(_QWORD *)(v3 + 240) = swift_task_alloc();
  *(_QWORD *)(v3 + 248) = swift_task_alloc();
  *(_QWORD *)(v3 + 256) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_249988A98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD, uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 160);
  if ((*(_DWORD *)(v0 + 344) - 3) > 1)
  {
    sub_24997FB38(v1 + 152, v0 + 16);
    v6 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v6);
    v10 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v7 + 16) + *(_QWORD *)(v7 + 16));
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v8;
    *v8 = v0;
    v8[1] = sub_249989228;
    return v10(v6, v7);
  }
  else
  {
    sub_24997FB38(v1 + 112, v0 + 56);
    v2 = *(_QWORD *)(v0 + 80);
    v3 = *(_QWORD *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v2);
    v9 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 16) + *(_QWORD *)(v3 + 16));
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v4;
    *v4 = v0;
    v4[1] = sub_249988BAC;
    return v9(*(_QWORD *)(v0 + 256), v2, v3);
  }
}

uint64_t sub_249988BAC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249988C04()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t (*v20)(uint64_t, uint64_t);

  v1 = v0[31];
  v2 = v0[32];
  v3 = v0[21];
  v4 = v0[22];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  sub_249989D78(v2, v1);
  v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v0[34] = v5;
  if (v5(v1, 1, v3) == 1)
  {
    v6 = v0[20];
    sub_249989DC0(v0[31]);
    sub_24997FB38(v6 + 152, (uint64_t)(v0 + 12));
    v7 = v0[15];
    v8 = v0[16];
    __swift_project_boxed_opaque_existential_1(v0 + 12, v7);
    v20 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v8 + 16) + *(_QWORD *)(v8 + 16));
    v9 = (_QWORD *)swift_task_alloc();
    v0[37] = v9;
    *v9 = v0;
    v9[1] = sub_249988F08;
    return v20(v7, v8);
  }
  else
  {
    sub_249986600(v0[31], v0[23]);
    v11 = sub_24998BA84();
    v12 = sub_24998BBBC();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_24997A000, v11, v12, "Using current location as default.", v13, 2u);
      MEMORY[0x24BCFC8F0](v13, -1, -1);
    }
    v14 = v0[23];
    v15 = v0[21];

    v16 = (uint64_t *)(v14 + *(int *)(v15 + 32));
    v18 = *v16;
    v17 = v16[1];
    v0[35] = v17;
    swift_bridgeObjectRetain();
    v19 = (_QWORD *)swift_task_alloc();
    v0[36] = v19;
    *v19 = v0;
    v19[1] = sub_249988DC8;
    return sub_249987B68(v18, v17);
  }
}

uint64_t sub_249988DC8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_249988E28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v0 + 176);
  v1 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  sub_249989DC0(*(_QWORD *)(v0 + 256));
  sub_249986600(v1, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
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

uint64_t sub_249988F08(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 304) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249988F68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v1 = *(_QWORD *)(v0 + 304);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 176) + 80);
    sub_24997E204(*(_QWORD *)(v0 + 304) + ((v2 + 32) & ~v2), *(_QWORD *)(v0 + 240));
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  v5 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 240);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 176) + 56))(v4, v3, 1, *(_QWORD *)(v0 + 168));
  swift_bridgeObjectRelease();
  sub_249989D78(v4, v5);
  v6 = sub_24998BA84();
  v7 = sub_24998BBBC();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 232);
  if (v8)
  {
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 272);
    v11 = *(_QWORD *)(v0 + 224);
    v12 = *(_QWORD *)(v0 + 168);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v25 = v14;
    *(_DWORD *)v13 = 136315138;
    sub_249989D78(v9, v11);
    v15 = v10(v11, 1, v12);
    v16 = *(_QWORD *)(v0 + 224);
    if (v15 == 1)
    {
      sub_249989DC0(*(_QWORD *)(v0 + 224));
      v17 = 0xE300000000000000;
      v18 = 7104878;
    }
    else
    {
      v21 = (uint64_t *)(v16 + *(int *)(*(_QWORD *)(v0 + 168) + 32));
      v18 = *v21;
      v17 = v21[1];
      swift_bridgeObjectRetain();
      sub_24997FAB0(v16);
    }
    v22 = *(_QWORD *)(v0 + 256);
    v23 = *(_QWORD *)(v0 + 232);
    *(_QWORD *)(v0 + 144) = sub_24997E328(v18, v17, &v25);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    sub_249989DC0(v23);
    _os_log_impl(&dword_24997A000, v6, v7, "No current location, using first static location as default: %s.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v14, -1, -1);
    MEMORY[0x24BCFC8F0](v13, -1, -1);

    v20 = v22;
  }
  else
  {
    v19 = *(_QWORD *)(v0 + 256);
    sub_249989DC0(*(_QWORD *)(v0 + 232));

    v20 = v19;
  }
  sub_249989DC0(v20);
  sub_249989E00(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 152));
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

uint64_t sub_249989228(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 320) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_249989288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 320);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 176) + 80);
    sub_24997E204(*(_QWORD *)(v0 + 320) + ((v2 + 32) & ~v2), *(_QWORD *)(v0 + 216));
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  v4 = *(_DWORD *)(v0 + 344);
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 176) + 56))(*(_QWORD *)(v0 + 216), v3, 1, *(_QWORD *)(v0 + 168));
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v0 + 216);
  if (v4)
  {
    v6 = *(_QWORD *)(v0 + 208);
    v7 = *(_QWORD *)(v0 + 168);
    v8 = *(_QWORD *)(v0 + 176);
    sub_249989D78(v5, v6);
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
    v10 = *(_QWORD *)(v0 + 208);
    if (v9 == 1)
    {
      sub_249989DC0(*(_QWORD *)(v0 + 208));
      v11 = 0;
      v12 = 0;
    }
    else
    {
      v26 = (uint64_t *)(v10 + *(int *)(*(_QWORD *)(v0 + 168) + 32));
      v11 = *v26;
      v12 = v26[1];
      swift_bridgeObjectRetain();
      sub_24997FAB0(v10);
    }
    *(_QWORD *)(v0 + 328) = v12;
    v27 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 336) = v27;
    *v27 = v0;
    v27[1] = sub_2499895E8;
    return sub_249987B68(v11, v12);
  }
  else
  {
    sub_249989D78(v5, *(_QWORD *)(v0 + 200));
    v13 = sub_24998BA84();
    v14 = sub_24998BBBC();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(_QWORD *)(v0 + 200);
    if (v15)
    {
      v17 = *(_QWORD *)(v0 + 192);
      v18 = *(_QWORD *)(v0 + 168);
      v19 = *(_QWORD *)(v0 + 176);
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v31 = v21;
      *(_DWORD *)v20 = 136315138;
      sub_249989D78(v16, v17);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18);
      v23 = *(_QWORD *)(v0 + 192);
      if (v22 == 1)
      {
        sub_249989DC0(*(_QWORD *)(v0 + 192));
        v24 = 0xE300000000000000;
        v25 = 7104878;
      }
      else
      {
        v29 = (uint64_t *)(v23 + *(int *)(*(_QWORD *)(v0 + 168) + 32));
        v25 = *v29;
        v24 = v29[1];
        swift_bridgeObjectRetain();
        sub_24997FAB0(v23);
      }
      v30 = *(_QWORD *)(v0 + 200);
      *(_QWORD *)(v0 + 136) = sub_24997E328(v25, v24, &v31);
      sub_24998BBD4();
      swift_bridgeObjectRelease();
      sub_249989DC0(v30);
      _os_log_impl(&dword_24997A000, v13, v14, "No location auth, using first static location as default: %s.", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BCFC8F0](v21, -1, -1);
      MEMORY[0x24BCFC8F0](v20, -1, -1);

    }
    else
    {

      sub_249989DC0(v16);
    }
    sub_249989E00(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 152));
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

uint64_t sub_2499895E8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_249989648()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;

  sub_249989D78(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
  v1 = sub_24998BA84();
  v2 = sub_24998BBBC();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(_QWORD *)(v0 + 200);
  if (v3)
  {
    v5 = *(_QWORD *)(v0 + 192);
    v6 = *(_QWORD *)(v0 + 168);
    v7 = *(_QWORD *)(v0 + 176);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    sub_249989D78(v4, v5);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
    v11 = *(_QWORD *)(v0 + 192);
    if (v10 == 1)
    {
      sub_249989DC0(*(_QWORD *)(v0 + 192));
      v12 = 0xE300000000000000;
      v13 = 7104878;
    }
    else
    {
      v14 = (uint64_t *)(v11 + *(int *)(*(_QWORD *)(v0 + 168) + 32));
      v13 = *v14;
      v12 = v14[1];
      swift_bridgeObjectRetain();
      sub_24997FAB0(v11);
    }
    v15 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v0 + 136) = sub_24997E328(v13, v12, &v17);
    sub_24998BBD4();
    swift_bridgeObjectRelease();
    sub_249989DC0(v15);
    _os_log_impl(&dword_24997A000, v1, v2, "No location auth, using first static location as default: %s.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BCFC8F0](v9, -1, -1);
    MEMORY[0x24BCFC8F0](v8, -1, -1);

  }
  else
  {

    sub_249989DC0(v4);
  }
  sub_249989E00(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 152));
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

uint64_t SelectedLocationManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 192);
  v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  v2 = sub_24998BA9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t SelectedLocationManager.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 192);
  v1 = v0 + OBJC_IVAR____TtC9UrchinKit23SelectedLocationManager_logger;
  v2 = sub_24998BA9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t SelectedLocationManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_249989960(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AEE90);
  v10 = *(_QWORD *)(type metadata accessor for CoastalLocation() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_24998BC1C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for CoastalLocation() - 8);
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
    sub_24998A708(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_249989B68(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF378);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_24998BC1C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360) - 8);
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
    sub_24998A5EC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_249989D78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249989DC0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_249989E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_249989E48(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_249989E80(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_249989E64(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_249989FE8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_249989E80(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF4D8);
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
  result = sub_24998BC28();
  __break(1u);
  return result;
}

uint64_t sub_249989FE8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF378);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_24998BC28();
  __break(1u);
  return result;
}

uint64_t sub_24998A1D0(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_249989B68(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_24998BC28();
  __break(1u);
  return result;
}

uint64_t sub_24998A348()
{
  return type metadata accessor for SelectedLocationManager();
}

uint64_t type metadata accessor for SelectedLocationManager()
{
  uint64_t result;

  result = qword_2578AF3A8;
  if (!qword_2578AF3A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24998A38C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24998BA9C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SelectedLocationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SelectedLocationManager.__allocating_init(currentLocationProvider:staticLocationProvider:selectedLocationProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of SelectedLocationManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of SelectedLocationManager.getSelectedLocation()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 208) + *(_QWORD *)(*(_QWORD *)v1 + 208));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24997FE78;
  return v6(a1);
}

uint64_t dispatch thunk of SelectedLocationManager.set(selectedLocation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 216) + *(_QWORD *)(*(_QWORD *)v2 + 216));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_24997FE78;
  return v8(a1, a2);
}

uint64_t dispatch thunk of CurrentLocationProvider.currentLocationAuthStatus()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24997EC14;
  return v7(a1, a2);
}

uint64_t dispatch thunk of CurrentLocationProvider.getCurrentLocation()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24997EB60;
  return v9(a1, a2, a3);
}

uint64_t sub_24998A5EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360) - 8);
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
  result = sub_24998BC28();
  __break(1u);
  return result;
}

uint64_t sub_24998A708(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for CoastalLocation() - 8);
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
  result = sub_24998BC28();
  __break(1u);
  return result;
}

id sub_24998A820()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 112);
  if (v1)
  {
    v2 = *(id *)(v0 + 112);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF50]), sel_init);
    v4 = *(void **)(v0 + 112);
    *(_QWORD *)(v0 + 112) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

uint64_t CurrentLocationSupportStore.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_OWORD *)(v0 + 112) = xmmword_24998CDE0;
  *(_QWORD *)(v0 + 128) = 0x800000024998D760;
  return v0;
}

uint64_t CurrentLocationSupportStore.init()()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_OWORD *)(v0 + 112) = xmmword_24998CDE0;
  *(_QWORD *)(v0 + 128) = 0x800000024998D760;
  return v0;
}

id sub_24998A918()
{
  id v0;
  void *v1;
  id v2;

  v0 = sub_24998A820();
  v1 = (void *)sub_24998BAF0();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_24998A970()
{
  id v0;
  void *v1;
  id v2;

  v0 = sub_24998A820();
  v1 = (void *)sub_24998BB80();
  v2 = (id)sub_24998BAF0();
  objc_msgSend(v0, sel_setValue_forKey_, v1, v2);

}

uint64_t CurrentLocationSupportStore.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t CurrentLocationSupportStore.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t CurrentLocationSupportStore.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for CurrentLocationSupportStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for CurrentLocationSupportStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CurrentLocationSupportStore.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of CurrentLocationSupportStore.hasBeenSupported()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CurrentLocationSupportStore.updateHasBeenSupported(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t CLLocationCoordinate2D.description.getter()
{
  sub_24998BB8C();
  sub_24998BB44();
  sub_24998BB8C();
  sub_24998BB44();
  swift_bridgeObjectRelease();
  sub_24998BB44();
  return 40;
}

uint64_t CLLocationCoordinate2D.shortDescription.getter(double a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF5B8);
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE13C8];
  *(_OWORD *)(v4 + 16) = xmmword_24998CE70;
  v6 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = v6;
  *(double *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 96) = v5;
  *(_QWORD *)(v4 + 104) = v6;
  *(double *)(v4 + 72) = a2;
  return sub_24998BB08();
}

uint64_t CLLocationCoordinate2D.id.getter()
{
  sub_24998BB8C();
  sub_24998BB44();
  sub_24998BB8C();
  return 0;
}

uint64_t sub_24998AC50()
{
  return CLLocationCoordinate2D.description.getter();
}

Swift::Bool __swiftcall CLLocationCoordinate2D.isValidMarineCoordinate()()
{
  double v0;
  double v1;
  Swift::Bool result;

  result = 0;
  if (v0 != 0.0 && v1 != 0.0)
    return CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v0);
  return result;
}

uint64_t LocationRule.LocationSupport.description.getter()
{
  char *v0;

  return *(_QWORD *)&aCurrent_0[8 * *v0];
}

uint64_t LocationRule.LocationSupport.imageName.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000015;
  if (*v0 != 1)
    v1 = 0;
  if (*v0)
    return v1;
  else
    return 0x6E6F697461636F6CLL;
}

BOOL LocationRule.LocationSupport.isSupported.getter()
{
  unsigned __int8 *v0;

  return *v0 != 2;
}

uint64_t LocationRule.LocationSupport.genericDisplayText.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _BYTE v21[16];

  v1 = sub_24998B9E8();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_24998BAE4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v21[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = &v21[-v8];
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = &v21[-v11];
  MEMORY[0x24BDAC7A8](v10);
  v14 = &v21[-v13];
  if (!*v0)
  {
    sub_24998BAD8();
    v18 = (void *)sub_24998BAF0();
    v19 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v18);

    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 16))(v12, v14, v2);
    sub_24998B9DC();
    v15 = sub_24998BB14();
    goto LABEL_5;
  }
  v15 = 0;
  if (*v0 == 1)
  {
    sub_24998BAD8();
    v16 = (void *)sub_24998BAF0();
    v17 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v16);

    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v3 + 16))(v6, v9, v2);
    sub_24998B9DC();
    v15 = sub_24998BB14();
    v14 = v9;
LABEL_5:
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v14, v2);
  }
  return v15;
}

UrchinKit::LocationRule::LocationSupport_optional __swiftcall LocationRule.LocationSupport.init(currentLocation:supportedLocation:)(CLLocation_optional currentLocation, CLLocation_optional supportedLocation)
{
  char *v2;
  id internal;
  char *v4;
  Class isa;
  double v6;
  double v7;
  UrchinKit::LocationRule::LocationSupport_optional result;
  char v9;

  internal = currentLocation.value._internal;
  v4 = v2;
  if (currentLocation.value.super.isa)
  {
    isa = currentLocation.value.super.isa;
    if (currentLocation.value._internal)
    {
      -[objc_class distanceFromLocation:](currentLocation.value.super.isa, sel_distanceFromLocation_, currentLocation.value._internal, supportedLocation.value.super.isa, supportedLocation.value._internal, *(_QWORD *)&supportedLocation.is_nil);
      v7 = v6;

      if (v7 <= 3000.0)
      {
        v9 = 0;
      }
      else if (v7 <= 100000.0)
      {
        v9 = 1;
      }
      else
      {
        v9 = 2;
      }
    }
    else
    {

      v9 = 3;
    }
  }
  else
  {

    v9 = 3;
  }
  *v4 = v9;
  return result;
}

UrchinKit::LocationRule::LocationSupport __swiftcall LocationRule.LocationSupport.init(currentLocation:supportedLocation:)(CLLocation currentLocation, CLLocation supportedLocation)
{
  char *v2;
  id internal;
  Class isa;
  char *v5;
  double v6;
  double v7;
  UrchinKit::LocationRule::LocationSupport result;
  char v9;

  internal = currentLocation._internal;
  isa = currentLocation.super.isa;
  v5 = v2;
  -[objc_class distanceFromLocation:](currentLocation.super.isa, sel_distanceFromLocation_, currentLocation._internal, supportedLocation._internal);
  v7 = v6;

  if (v7 <= 100000.0)
    v9 = 1;
  else
    v9 = 2;
  if (v7 <= 3000.0)
    v9 = 0;
  *v5 = v9;
  return result;
}

uint64_t LocationRule.LocationSupport.init(currentLocation:supportedLocation:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v12;
  uint64_t result;
  char v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578AF360);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CoastalLocation();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (double *)((char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_249989D78(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {

    sub_249989DC0(a1);
    result = sub_249989DC0((uint64_t)v8);
    v14 = 3;
  }
  else
  {
    sub_249986600((uint64_t)v8, (uint64_t)v12);
    if (*((_BYTE *)v12 + *(int *)(v9 + 36)) == 1)
    {
      if (a2)
      {
        v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFA80]), sel_initWithLatitude_longitude_, v12[2], v12[3]);
        objc_msgSend(v15, sel_distanceFromLocation_, a2);
        v17 = v16;

        if (v17 <= 3000.0)
        {
          sub_249989DC0(a1);
          result = sub_24997FAB0((uint64_t)v12);
          v14 = 0;
        }
        else
        {
          sub_249989DC0(a1);
          result = sub_24997FAB0((uint64_t)v12);
          if (v17 <= 100000.0)
            v14 = 1;
          else
            v14 = 2;
        }
      }
      else
      {
        sub_249989DC0(a1);
        result = sub_24997FAB0((uint64_t)v12);
        v14 = 1;
      }
    }
    else
    {

      sub_249989DC0(a1);
      result = sub_24997FAB0((uint64_t)v12);
      v14 = 3;
    }
  }
  *a3 = v14;
  return result;
}

BOOL static LocationRule.LocationSupport.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t LocationRule.LocationSupport.hash(into:)()
{
  return sub_24998BCB8();
}

uint64_t LocationRule.LocationSupport.hashValue.getter()
{
  sub_24998BCAC();
  sub_24998BCB8();
  return sub_24998BCD0();
}

UrchinKit::LocationRule::CurrentNearbyLocationSupport __swiftcall LocationRule.CurrentNearbyLocationSupport.init(location:poiLocation:)(CLLocation location, CLLocation poiLocation)
{
  BOOL *v2;
  id internal;
  Class isa;
  BOOL *v5;
  double v6;
  double v7;
  UrchinKit::LocationRule::CurrentNearbyLocationSupport result;

  internal = location._internal;
  isa = location.super.isa;
  v5 = v2;
  -[objc_class distanceFromLocation:](location.super.isa, sel_distanceFromLocation_, location._internal, poiLocation._internal);
  v7 = v6;

  *v5 = v7 > 4000.0;
  return result;
}

BOOL static LocationRule.CurrentNearbyLocationSupport.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t LocationRule.CurrentNearbyLocationSupport.hash(into:)()
{
  return sub_24998BCB8();
}

uint64_t LocationRule.CurrentNearbyLocationSupport.hashValue.getter()
{
  sub_24998BCAC();
  sub_24998BCB8();
  return sub_24998BCD0();
}

BOOL sub_24998B460(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_24998B47C()
{
  unint64_t result;

  result = qword_2578AF5C0;
  if (!qword_2578AF5C0)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for LocationRule.LocationSupport, &type metadata for LocationRule.LocationSupport);
    atomic_store(result, (unint64_t *)&qword_2578AF5C0);
  }
  return result;
}

unint64_t sub_24998B4C4()
{
  unint64_t result;

  result = qword_2578AF5C8;
  if (!qword_2578AF5C8)
  {
    result = MEMORY[0x24BCFC884](&protocol conformance descriptor for LocationRule.CurrentNearbyLocationSupport, &type metadata for LocationRule.CurrentNearbyLocationSupport);
    atomic_store(result, (unint64_t *)&qword_2578AF5C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LocationRule()
{
  return &type metadata for LocationRule;
}

uint64_t getEnumTagSinglePayload for LocationRule.LocationSupport(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LocationRule.LocationSupport(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24998B5F4 + 4 * byte_24998CEB5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24998B628 + 4 * byte_24998CEB0[v4]))();
}

uint64_t sub_24998B628(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24998B630(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24998B638);
  return result;
}

uint64_t sub_24998B644(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24998B64CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24998B650(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24998B658(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LocationRule.LocationSupport()
{
  return &type metadata for LocationRule.LocationSupport;
}

uint64_t getEnumTagSinglePayload for LocationRule.CurrentNearbyLocationSupport(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LocationRule.CurrentNearbyLocationSupport(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24998B750 + 4 * byte_24998CEBF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24998B784 + 4 * byte_24998CEBA[v4]))();
}

uint64_t sub_24998B784(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24998B78C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24998B794);
  return result;
}

uint64_t sub_24998B7A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24998B7A8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24998B7AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24998B7B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24998B7C0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LocationRule.CurrentNearbyLocationSupport()
{
  return &type metadata for LocationRule.CurrentNearbyLocationSupport;
}

uint64_t sub_24998B7DC(uint64_t a1)
{
  return sub_24998B86C(a1, qword_2578B09B0);
}

uint64_t sub_24998B800(uint64_t a1)
{
  return sub_24998B86C(a1, qword_2578B09C8);
}

uint64_t sub_24998B824(uint64_t a1)
{
  return sub_24998B86C(a1, qword_2578B09E0);
}

uint64_t sub_24998B848(uint64_t a1)
{
  return sub_24998B86C(a1, qword_2578B09F8);
}

uint64_t sub_24998B86C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24998BA9C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24998BA90();
}

uint64_t sub_24998B8E0()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_24998B8EC()
{
  return MEMORY[0x24BDCB838]();
}

uint64_t sub_24998B8F8()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_24998B904()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_24998B910()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_24998B91C()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_24998B928()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_24998B934()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_24998B940()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_24998B94C()
{
  return MEMORY[0x24BDCD760]();
}

uint64_t sub_24998B958()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_24998B964()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_24998B970()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_24998B97C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24998B988()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24998B994()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24998B9A0()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_24998B9AC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_24998B9B8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_24998B9C4()
{
  return MEMORY[0x24BDCE8C8]();
}

uint64_t sub_24998B9D0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24998B9DC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_24998B9E8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24998B9F4()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_24998BA00()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_24998BA0C()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_24998BA18()
{
  return MEMORY[0x24BDCF138]();
}

uint64_t sub_24998BA24()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_24998BA30()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_24998BA3C()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_24998BA48()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_24998BA54()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_24998BA60()
{
  return MEMORY[0x24BDCF4E0]();
}

uint64_t sub_24998BA6C()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_24998BA78()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_24998BA84()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24998BA90()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24998BA9C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24998BAA8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24998BAB4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24998BAC0()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24998BACC()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_24998BAD8()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_24998BAE4()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_24998BAF0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24998BAFC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24998BB08()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_24998BB14()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_24998BB20()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_24998BB2C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24998BB38()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_24998BB44()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24998BB50()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24998BB5C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_24998BB68()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_24998BB74()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_24998BB80()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_24998BB8C()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_24998BB98()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_24998BBA4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24998BBB0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24998BBBC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24998BBC8()
{
  return MEMORY[0x24BEC2030]();
}

uint64_t sub_24998BBD4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24998BBE0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24998BBEC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24998BBF8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24998BC04()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24998BC10()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24998BC1C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24998BC28()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24998BC34()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24998BC40()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_24998BC4C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_24998BC58()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_24998BC64()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_24998BC70()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_24998BC7C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_24998BC88()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_24998BC94()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24998BCA0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24998BCAC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24998BCB8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24998BCC4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_24998BCD0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24998BCDC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24998BCE8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24998BCF4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24998BD00()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
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


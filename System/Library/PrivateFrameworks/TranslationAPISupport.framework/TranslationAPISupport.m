void sub_2491B1688(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (*v9)(uint64_t);
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void (*v23)(_QWORD);
  id v24[2];

  v2 = v1;
  v24[1] = *(id *)MEMORY[0x24BDAC8D0];
  v24[0] = 0;
  v3 = objc_msgSend(a1, sel_makeXPCConnectionWithError_, v24);
  v4 = v24[0];
  if (v3)
  {
    v5 = v3;
    v6 = v2 + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_parent;
    v7 = *(void **)(v6 + *(int *)(type metadata accessor for AppExtensionHostView(0) + 20));
    v8 = v4;
    if (objc_msgSend(v7, sel_shouldAcceptWithConnection_, v5))
    {
      v9 = *(void (**)(uint64_t))(v2
                                          + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange);
      if (v9)
      {
        swift_retain();
        v9(1);
        sub_2491B32D0((uint64_t)v9);
      }
    }
    else
    {
      if (qword_2578535D0 != -1)
        swift_once();
      v19 = sub_2491B6CA4();
      __swift_project_value_buffer(v19, (uint64_t)qword_257853968);
      v20 = sub_2491B6C8C();
      v21 = sub_2491B6DF4();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_2491AF000, v20, v21, "Host Connection failed", v22, 2u);
        MEMORY[0x2495AE160](v22, -1, -1);
      }

    }
  }
  else
  {
    v10 = v24[0];
    v11 = (void *)sub_2491B6BE4();

    swift_willThrow();
    if (qword_2578535D0 != -1)
      swift_once();
    v12 = sub_2491B6CA4();
    __swift_project_value_buffer(v12, (uint64_t)qword_257853968);
    v13 = v11;
    v14 = sub_2491B6C8C();
    v15 = sub_2491B6DF4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412290;
      v18 = (void *)sub_2491B6BD8();
      v24[0] = v18;
      sub_2491B6E3C();
      *v17 = v18;

      _os_log_impl(&dword_2491AF000, v14, v15, "Host Connection failed: %@", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578537D8);
      swift_arrayDestroy();
      MEMORY[0x2495AE160](v17, -1, -1);
      MEMORY[0x2495AE160](v16, -1, -1);
    }
    else
    {

    }
    v23 = *(void (**)(_QWORD))(v2
                                        + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange);
    if (v23)
    {
      swift_retain();
      v23(0);

      sub_2491B32D0((uint64_t)v23);
    }
    else
    {

    }
  }
}

id sub_2491B1B14()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppExtensionHostView.HostCoordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2491B1BB8()
{
  return type metadata accessor for AppExtensionHostView.HostCoordinator(0);
}

uint64_t type metadata accessor for AppExtensionHostView.HostCoordinator(uint64_t a1)
{
  return sub_2491B1E98(a1, (uint64_t *)&unk_257853660);
}

void sub_2491B1BD4()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for AppExtensionHostView(319);
  if (v0 <= 0x3F)
  {
    sub_2491B1C84();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for AppExtensionHostView(uint64_t a1)
{
  return sub_2491B1E98(a1, (uint64_t *)&unk_2578536E0);
}

void sub_2491B1C84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257853670)
  {
    sub_2491B6C20();
    v0 = sub_2491B6E30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257853670);
  }
}

uint64_t *sub_2491B1CD8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    swift_retain();
    swift_retain();
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257853678) + 32);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for AppExtensionHostView.Configuration(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v14 = sub_2491B6C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v9, v10, v14);
      v15 = *(int *)(v11 + 20);
      v16 = &v9[v15];
      v17 = &v10[v15];
      v18 = *((_QWORD *)v17 + 1);
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = v18;
      v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56);
      swift_bridgeObjectRetain();
      v19(v9, 0, 1, v11);
    }
    v20 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v21 = (uint64_t *)((char *)a1 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = *v22;
    swift_unknownObjectRetain();
    if (v23)
    {
      v24 = v22[1];
      *v21 = v23;
      v21[1] = v24;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v21 = *(_OWORD *)v22;
    }
  }
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495AE0E8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for AppExtensionHostView.Configuration(uint64_t a1)
{
  return sub_2491B1E98(a1, qword_257853780);
}

uint64_t sub_2491B1E98(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2491B1ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257853678) + 32);
  v5 = type metadata accessor for AppExtensionHostView.Configuration(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_2491B6C20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    swift_bridgeObjectRelease();
  }
  result = swift_unknownObjectRelease();
  if (*(_QWORD *)(a1 + *(int *)(a2 + 24)))
    return swift_release();
  return result;
}

_QWORD *sub_2491B1F9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_retain();
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257853678) + 32);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_2491B6C20();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v8, v9, v13);
    v14 = *(int *)(v10 + 20);
    v15 = &v8[v14];
    v16 = &v9[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    v18 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56);
    swift_bridgeObjectRetain();
    v18(v8, 0, 1, v10);
  }
  v19 = *(int *)(a3 + 24);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  v22 = *v21;
  swift_unknownObjectRetain();
  if (v22)
  {
    v23 = v21[1];
    *v20 = v22;
    v20[1] = v23;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v20 = *(_OWORD *)v21;
  }
  return a1;
}

_QWORD *sub_2491B20DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void (*v18)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257853678) + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      v14 = sub_2491B6C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v7, v8, v14);
      v15 = *(int *)(v9 + 20);
      v16 = &v7[v15];
      v17 = &v8[v15];
      *(_QWORD *)v16 = *(_QWORD *)v17;
      *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
      v18 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56);
      swift_bridgeObjectRetain();
      v18(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    sub_2491B32E0((uint64_t)v7, type metadata accessor for AppExtensionHostView.Configuration);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  v28 = sub_2491B6C20();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 24))(v7, v8, v28);
  v29 = *(int *)(v9 + 20);
  v30 = &v7[v29];
  v31 = &v8[v29];
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *((_QWORD *)v30 + 1) = *((_QWORD *)v31 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v20 = *(int *)(a3 + 24);
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  v23 = *(_QWORD *)((char *)a1 + v20);
  v24 = *v22;
  if (!v23)
  {
    if (v24)
    {
      v26 = v22[1];
      *v21 = v24;
      v21[1] = v26;
      swift_retain();
      return a1;
    }
LABEL_13:
    *(_OWORD *)v21 = *(_OWORD *)v22;
    return a1;
  }
  if (!v24)
  {
    swift_release();
    goto LABEL_13;
  }
  v25 = v22[1];
  *v21 = v24;
  v21[1] = v25;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_2491B2304(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257853678) + 32);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v13 = sub_2491B6C20();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v8, v9, v13);
    *(_OWORD *)&v8[*(int *)(v10 + 20)] = *(_OWORD *)&v9[*(int *)(v10 + 20)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = *(int *)(a3 + 24);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = *v16;
  if (*v16)
  {
    v18 = v16[1];
    *v15 = v17;
    v15[1] = v18;
  }
  else
  {
    *(_OWORD *)v15 = *(_OWORD *)v16;
  }
  return a1;
}

_QWORD *sub_2491B2424(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
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
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257853678) + 32);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      v14 = sub_2491B6C20();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v7, v8, v14);
      *(_OWORD *)&v7[*(int *)(v9 + 20)] = *(_OWORD *)&v8[*(int *)(v9 + 20)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    sub_2491B32E0((uint64_t)v7, type metadata accessor for AppExtensionHostView.Configuration);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  v24 = sub_2491B6C20();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v7, v8, v24);
  v25 = *(int *)(v9 + 20);
  v26 = &v7[v25];
  v27 = &v8[v25];
  v29 = *(_QWORD *)v27;
  v28 = *((_QWORD *)v27 + 1);
  *(_QWORD *)v26 = v29;
  *((_QWORD *)v26 + 1) = v28;
  swift_bridgeObjectRelease();
LABEL_7:
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_unknownObjectRelease();
  v16 = *(int *)(a3 + 24);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v19 = *(_QWORD *)((char *)a1 + v16);
  v20 = *v18;
  if (!v19)
  {
    if (v20)
    {
      v22 = v18[1];
      *v17 = v20;
      v17[1] = v22;
      return a1;
    }
LABEL_13:
    *(_OWORD *)v17 = *(_OWORD *)v18;
    return a1;
  }
  if (!v20)
  {
    swift_release();
    goto LABEL_13;
  }
  v21 = v18[1];
  *v17 = v20;
  v17[1] = v21;
  swift_release();
  return a1;
}

uint64_t sub_2491B2604()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2491B2610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853678);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2491B2690()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2491B269C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_257853678);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

void sub_2491B2718()
{
  unint64_t v0;

  sub_2491B2794();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2491B2794()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2578536F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257853680);
    v0 = sub_2491B6D7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2578536F0);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495AE0F4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *sub_2491B2830(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2491B6C20();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2491B28C4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2491B6C20();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2491B290C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_2491B6C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2491B2974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_2491B6C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2491B29F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2491B6C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2491B2A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_2491B6C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2491B2AB8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2491B2AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2491B6C20();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2491B2B44()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2491B2B50(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2491B6C20();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_2491B2BCC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2491B6C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2491B2C3C()
{
  return sub_2491B323C(&qword_2578537B8, (uint64_t)&unk_2491B73E8);
}

id sub_2491B2C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  char *v6;
  uint64_t *v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v1 = v0;
  v2 = type metadata accessor for AppExtensionHostView(0);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2491B327C(v1, (uint64_t)v4);
  v5 = (objc_class *)type metadata accessor for AppExtensionHostView.HostCoordinator(0);
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_connection] = 0;
  v7 = (uint64_t *)&v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange];
  *v7 = 0;
  v7[1] = 0;
  v8 = &v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_identity];
  v9 = sub_2491B6C20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_2491B327C((uint64_t)v4, (uint64_t)&v6[OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_parent]);
  v10 = (uint64_t *)&v4[*(int *)(v2 + 24)];
  v11 = *v10;
  v12 = v10[1];
  v13 = *v7;
  *v7 = *v10;
  v7[1] = v12;
  sub_2491B32C0(v11);
  sub_2491B32D0(v13);
  v16.receiver = v6;
  v16.super_class = v5;
  v14 = objc_msgSendSuper2(&v16, sel_init);
  sub_2491B32E0((uint64_t)v4, type metadata accessor for AppExtensionHostView);
  return v14;
}

uint64_t sub_2491B2DA8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v21 = sub_2491B6C20();
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578537C8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_opt_self();
  v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578537D0);
    sub_2491B6D10();
    v16 = v22;
    objc_msgSend(v14, sel_setDelegate_, v22);

    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853678);
    MEMORY[0x2495ADD7C](v17);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {

      return sub_2491B3378((uint64_t)v8, &qword_257853680);
    }
    else
    {
      sub_2491B331C((uint64_t)v8, (uint64_t)v12);
      (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v12, v21);
      swift_bridgeObjectRetain();
      sub_2491B6E0C();
      v19 = sub_2491B6E18();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v6, 0, 1, v19);
      sub_2491B6E24();

      return sub_2491B32E0((uint64_t)v12, type metadata accessor for AppExtensionHostView.Configuration);
    }
  }
  else
  {
    result = sub_2491B6E54();
    __break(1u);
  }
  return result;
}

id sub_2491B3048()
{
  id v0;
  void *v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BA8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578537D0);
  sub_2491B6D10();
  objc_msgSend(v0, sel_setDelegate_, v2);

  return v0;
}

id sub_2491B30C8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_2491B2C60();
  *a1 = result;
  return result;
}

uint64_t sub_2491B30EC()
{
  return sub_2491B6CC8();
}

uint64_t sub_2491B3124()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_2491B3130()
{
  sub_2491B323C(&qword_2578537C0, (uint64_t)&unk_2491B7370);
  return sub_2491B6D04();
}

uint64_t sub_2491B3190()
{
  sub_2491B323C(&qword_2578537C0, (uint64_t)&unk_2491B7370);
  return sub_2491B6CD4();
}

uint64_t sub_2491B31F0()
{
  return sub_2491B6D34();
}

void sub_2491B3208()
{
  sub_2491B323C(&qword_2578537C0, (uint64_t)&unk_2491B7370);
  sub_2491B6CF8();
  __break(1u);
}

uint64_t sub_2491B323C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AppExtensionHostView(255);
    result = MEMORY[0x2495AE100](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2491B327C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppExtensionHostView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2491B32C0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_2491B32D0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2491B32E0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2491B331C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2491B3378(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_2491B33B4()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration));
}

id sub_2491B3440@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration);
  *a2 = v4;
  return v4;
}

void sub_2491B34D4(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  v2 = v1;
  sub_2491B6BF0();
  swift_release();

}

uint64_t sub_2491B3588()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  sub_2491B32C0(v1);
  return v1;
}

uint64_t sub_2491B362C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *, _QWORD *);

  v3 = *a1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  v5 = *(_QWORD *)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion + 8);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_2491B5E20;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_2491B32C0(v4);
}

uint64_t sub_2491B3700(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v1 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = v1;
    v4 = sub_2491B5DEC;
  }
  else
  {
    v4 = 0;
  }
  swift_getKeyPath();
  MEMORY[0x24BDAC7A8]();
  sub_2491B32C0(v2);
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BF0();
  sub_2491B32D0((uint64_t)v4);
  return swift_release();
}

uint64_t sub_2491B3824@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration;
  swift_beginAccess();
  return sub_2491B5D24(v3, a1);
}

uint64_t sub_2491B38D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2491B5D24(a2, (uint64_t)v5);
  v6 = a1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration;
  swift_beginAccess();
  sub_2491B5E48((uint64_t)v5, v6);
  return swift_endAccess();
}

void sub_2491B3984(char a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  id v4;

  v2 = a1 & 1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v3 = OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote;
  if (*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote) != v2)
  {
    swift_getKeyPath();
    sub_2491B6BFC();
    swift_release();
    if (*(_BYTE *)(v1 + v3) == 1)
    {
      swift_getKeyPath();
      sub_2491B6BFC();
      swift_release();
      v4 = objc_retain(*(id *)(v1
                             + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration));
      sub_2491B4400((uint64_t)v4);

    }
  }
}

uint64_t sub_2491B3AAC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
}

uint64_t sub_2491B3B38@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
  return result;
}

uint64_t sub_2491B3BCC()
{
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BF0();
  return swift_release();
}

void sub_2491B3C74(uint64_t a1, char a2)
{
  char v3;

  v3 = *(_BYTE *)(a1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
  *(_BYTE *)(a1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote) = a2;
  sub_2491B3984(v3);
}

uint64_t sub_2491B3CAC(void *a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  _QWORD *v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v34;
  void *v35;
  id v36;
  uint64_t v37;

  v3 = v2;
  v37 = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853850);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v8 = qword_2578535D0;
    v9 = a2;
    if (v8 != -1)
      swift_once();
    v10 = sub_2491B6CA4();
    __swift_project_value_buffer(v10, (uint64_t)qword_257853968);
    v11 = v9;
    v12 = sub_2491B6C8C();
    v13 = sub_2491B6DF4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v35 = v3;
      v15 = (uint8_t *)v14;
      v34 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v15 = 138412290;
      v36 = v11;
      v16 = v11;
      sub_2491B6E3C();
      v17 = v34;
      *v34 = a2;

      _os_log_impl(&dword_2491AF000, v12, v13, "Got response from extension with error: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578537D8);
      swift_arrayDestroy();
      MEMORY[0x2495AE160](v17, -1, -1);
      v18 = v15;
      v3 = v35;
      MEMORY[0x2495AE160](v18, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v35 = v2;
    if (qword_2578535D0 != -1)
      swift_once();
    v19 = sub_2491B6CA4();
    __swift_project_value_buffer(v19, (uint64_t)qword_257853968);
    v20 = a1;
    v21 = sub_2491B6C8C();
    v22 = sub_2491B6E00();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v23 = 138543362;
      v34 = a1;
      if (a1)
      {
        v36 = v20;
        v25 = v20;
      }
      else
      {
        v36 = 0;
      }
      sub_2491B6E3C();
      a1 = v34;
      *v24 = v34;

      _os_log_impl(&dword_2491AF000, v21, v22, "Extension UI completed preflight checks with configuration: %{public}@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578537D8);
      swift_arrayDestroy();
      MEMORY[0x2495AE160](v24, -1, -1);
      MEMORY[0x2495AE160](v23, -1, -1);

    }
    else
    {

    }
    v3 = v35;
  }
  v26 = sub_2491B6DDC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v7, 1, 1, v26);
  sub_2491B6DC4();
  v27 = a1;
  v28 = v3;
  v29 = a2;
  v30 = sub_2491B6DB8();
  v31 = (_QWORD *)swift_allocObject();
  v32 = MEMORY[0x24BEE6930];
  v31[2] = v30;
  v31[3] = v32;
  v31[4] = v28;
  v31[5] = a1;
  v31[6] = a2;
  sub_2491B4238((uint64_t)v7, (uint64_t)&unk_257853860, (uint64_t)v31);
  return swift_release();
}

uint64_t sub_2491B40E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a1;
  v6[4] = a4;
  sub_2491B6DC4();
  v6[7] = sub_2491B6DB8();
  sub_2491B6DA0();
  return swift_task_switch();
}

uint64_t sub_2491B4154()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v2 = *(void (**)(uint64_t, uint64_t))(v1
                                               + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  if (v2)
  {
    v4 = *(_QWORD *)(v0 + 40);
    v3 = *(_QWORD *)(v0 + 48);
    swift_retain();
    v2(v4, v3);
    sub_2491B32D0((uint64_t)v2);
  }
  **(_BYTE **)(v0 + 24) = v2 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2491B4238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2491B6DDC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2491B6DD0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2491B3378(a1, &qword_257853850);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2491B6DA0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853920);
  return swift_task_create();
}

void sub_2491B4400(uint64_t a1)
{
  char *v1;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v3 = *(void **)&v1[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection];
  if (v3
    && (v4 = objc_msgSend(v3, sel_remoteObjectProxy),
        sub_2491B6E48(),
        swift_unknownObjectRelease(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2578538F0),
        (swift_dynamicCast() & 1) != 0))
  {
    objc_msgSend(v1, sel_startRequestWithConfiguration_, a1);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_2578535D0 != -1)
      swift_once();
    v5 = sub_2491B6CA4();
    __swift_project_value_buffer(v5, (uint64_t)qword_257853968);
    v6 = sub_2491B6C8C();
    v7 = sub_2491B6DF4();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2491AF000, v6, v7, "Unable to obtain remote object proxy", v8, 2u);
      MEMORY[0x2495AE160](v8, -1, -1);
    }

  }
}

void *sub_2491B45BC()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection);
  v2 = v1;
  return v1;
}

id sub_2491B4650@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v4 = *(void **)(v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection);
  *a2 = v4;
  return v4;
}

void sub_2491B46E4(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  v2 = v1;
  sub_2491B6BF0();
  swift_release();

}

uint64_t sub_2491B4798(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *v13;
  _QWORD aBlock[6];

  objc_msgSend(a1, sel_setExportedObject_, v1);
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_2578547F0);
  objc_msgSend(a1, sel_setExportedInterface_, v4);

  v5 = objc_msgSend(v3, sel_interfaceWithProtocol_, &unk_257854900);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v5);
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_2491B5A10;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2491B4C80;
  aBlock[3] = &block_descriptor;
  v7 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v7);
  _Block_release(v7);
  objc_msgSend(a1, sel_resume);
  swift_getKeyPath();
  aBlock[0] = v1;
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  v8 = a1;
  sub_2491B6BF0();
  swift_release();

  if (qword_2578535D0 != -1)
    swift_once();
  v9 = sub_2491B6CA4();
  __swift_project_value_buffer(v9, (uint64_t)qword_257853968);
  v10 = sub_2491B6C8C();
  v11 = sub_2491B6DE8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2491AF000, v10, v11, "Host Connection established", v12, 2u);
    MEMORY[0x2495AE160](v12, -1, -1);
    v13 = v5;
  }
  else
  {
    v13 = v10;
    v10 = v5;
  }

  return 1;
}

void sub_2491B4A44(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v1 = a1 + 16;
  sub_2491B6D94();
  v2 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v3 = (void *)sub_2491B6D88();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithDomain_code_userInfo_, v3, 14, 0);

  if (qword_2578535D0 != -1)
    swift_once();
  v5 = sub_2491B6CA4();
  __swift_project_value_buffer(v5, (uint64_t)qword_257853968);
  v6 = v4;
  v7 = sub_2491B6C8C();
  v8 = sub_2491B6DF4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v6;
    sub_2491B6E3C();
    *v10 = v6;

    _os_log_impl(&dword_2491AF000, v7, v8, "Connection interrupted, finishing translation with error %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578537D8);
    swift_arrayDestroy();
    MEMORY[0x2495AE160](v10, -1, -1);
    MEMORY[0x2495AE160](v9, -1, -1);

  }
  else
  {

  }
  swift_beginAccess();
  v12 = MEMORY[0x2495AE1D8](v1);
  if (v12)
  {
    v13 = (void *)v12;
    v14 = v6;
    sub_2491B3CAC(0, v6);

  }
}

uint64_t sub_2491B4C80(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2491B4CF4()
{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_257853850);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2491B6DDC();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  v7 = v0;
  if (v6 == 1)
  {
    sub_2491B3378((uint64_t)v2, &qword_257853850);
  }
  else
  {
    sub_2491B6DD0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_2491B6DA0();
      v10 = v9;
      swift_unknownObjectRelease();
      if (v10 | v8)
      {
        v12[0] = 0;
        v12[1] = 0;
        v12[2] = v8;
        v12[3] = v10;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2491B4EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[6] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
  v4[7] = swift_task_alloc();
  v5 = sub_2491B6C20();
  v4[8] = v5;
  v4[9] = *(_QWORD *)(v5 - 8);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578538F8);
  v4[11] = swift_task_alloc();
  v6 = sub_2491B6C80();
  v4[12] = v6;
  v4[13] = *(_QWORD *)(v6 - 8);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  v7 = sub_2491B6C44();
  v4[16] = v7;
  v4[17] = *(_QWORD *)(v7 - 8);
  v4[18] = swift_task_alloc();
  v8 = sub_2491B6C5C();
  v4[19] = v8;
  v4[20] = *(_QWORD *)(v8 - 8);
  v4[21] = swift_task_alloc();
  v9 = sub_2491B6C74();
  v4[22] = v9;
  v4[23] = *(_QWORD *)(v9 - 8);
  v4[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2491B5008()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_2491B6C38();
  sub_2491B6C68();
  sub_2491B6C50();
  v0[25] = OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel___observationRegistrar;
  v0[26] = sub_2491B6050(&qword_257853900, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7808], MEMORY[0x24BDC7810]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[27] = v1;
  *v1 = v0;
  v1[1] = sub_2491B50E0;
  return sub_2491B6DAC();
}

uint64_t sub_2491B50E0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 248) = v0;
  else
    *(_QWORD *)(v2 + 224) = 0;
  return swift_task_switch();
}

uint64_t sub_2491B5148()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 232) = *(_QWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_2491B5164()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(v0 + 232))
  {
    sub_2491B6DC4();
    *(_QWORD *)(v0 + 240) = sub_2491B6DB8();
    sub_2491B6DA0();
    return swift_task_switch();
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 184);
    v2 = *(_QWORD *)(v0 + 192);
    v5 = *(_QWORD *)(v0 + 168);
    v4 = *(_QWORD *)(v0 + 176);
    v6 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 160);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
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

uint64_t sub_2491B52B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, unint64_t, uint64_t);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;

  v1 = v0[29];
  swift_release();
  if (!*(_QWORD *)(v1 + 16))
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[13] + 56))(v0[11], 1, 1, v0[12]);
    goto LABEL_5;
  }
  v2 = v0[12];
  v3 = v0[13];
  v4 = v0[11];
  v5 = *(void (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
  v5(v4, v0[29] + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
LABEL_5:
    v18 = v0[6];
    v17 = v0[7];
    sub_2491B3378(v0[11], &qword_2578538F8);
    v19 = type metadata accessor for AppExtensionHostView.Configuration(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
    swift_getKeyPath();
    v20 = swift_task_alloc();
    *(_QWORD *)(v20 + 16) = v18;
    *(_QWORD *)(v20 + 24) = v17;
    v0[4] = v18;
    sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
    sub_2491B6BF0();
    swift_release();
    swift_task_dealloc();
    sub_2491B3378(v17, &qword_257853680);
    goto LABEL_6;
  }
  v7 = v0[14];
  v6 = v0[15];
  v8 = v0[12];
  v23 = v0[13];
  v9 = v0[10];
  v11 = v0[8];
  v10 = v0[9];
  v12 = v0[6];
  v13 = v0[7];
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v23 + 32))(v6, v0[11], v8);
  v5(v7, v6, v8);
  sub_2491B6C2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, v9, v11);
  v14 = type metadata accessor for AppExtensionHostView.Configuration(0);
  v15 = (_QWORD *)(v13 + *(int *)(v14 + 20));
  *v15 = 0xD00000000000001ALL;
  v15[1] = 0x80000002491B79C0;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 0, 1, v14);
  swift_getKeyPath();
  v16 = swift_task_alloc();
  *(_QWORD *)(v16 + 16) = v12;
  *(_QWORD *)(v16 + 24) = v13;
  v0[5] = v12;
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BF0();
  swift_release();
  swift_task_dealloc();
  sub_2491B3378(v13, &qword_257853680);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  (*(void (**)(unint64_t, uint64_t))(v23 + 8))(v6, v8);
LABEL_6:
  swift_bridgeObjectRelease();
  v21 = (_QWORD *)swift_task_alloc();
  v0[32] = v21;
  *v21 = v0;
  v21[1] = sub_2491B5748;
  return sub_2491B6DAC();
}

uint64_t sub_2491B5604()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(v0 + 248);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853908);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_2491B5664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 184);
  v1 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 160);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
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

uint64_t sub_2491B5748()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 248) = v0;
  else
    *(_QWORD *)(v2 + 224) = 0;
  return swift_task_switch();
}

id LanguageSupportHostModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LanguageSupportHostModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LanguageSupportHostModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LanguageSupportHostModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2491B58E8()
{
  id *v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2491B5924(uint64_t a1)
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
  v9[1] = sub_2491B59A4;
  return sub_2491B40E4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2491B59A4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2491B59EC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2491B5A10()
{
  uint64_t v0;

  sub_2491B4A44(v0);
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

void sub_2491B5A38()
{
  sub_2491B60A8();
}

uint64_t type metadata accessor for LanguageSupportHostModel()
{
  uint64_t result;

  result = qword_2578538D8;
  if (!qword_2578538D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2491B5A88()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_2491B5AB4(uint64_t a1)
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
  v7[1] = sub_2491B59A4;
  return sub_2491B4EB0(a1, v4, v5, v6);
}

uint64_t sub_2491B5B20()
{
  return type metadata accessor for LanguageSupportHostModel();
}

void sub_2491B5B28()
{
  unint64_t v0;
  unint64_t v1;

  sub_2491B5C3C();
  if (v0 <= 0x3F)
  {
    sub_2491B6C14();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LanguageSupportHostModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LanguageSupportHostModel.didFinish(finalConfiguration:error:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of LanguageSupportHostModel.shouldAccept(connection:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of LanguageSupportHostModel.connectToService()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

void sub_2491B5C3C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2578538E8)
  {
    type metadata accessor for AppExtensionHostView.Configuration(255);
    v0 = sub_2491B6E30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2578538E8);
  }
}

void sub_2491B5C98()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_BYTE *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote) = *(_BYTE *)(v0 + 24);
  sub_2491B3984(v2);
}

void sub_2491B5CE0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration) = v2;
  v4 = v2;

}

uint64_t sub_2491B5D24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2491B5D74()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = v0[3];
  v2 = v0[4];
  v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion);
  v4 = *v3;
  *v3 = v1;
  v3[1] = v2;
  sub_2491B32C0(v1);
  return sub_2491B32D0(v4);
}

uint64_t sub_2491B5DC8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2491B5DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_2491B5E20(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_2491B5E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2491B5E90(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_2491B5EF8;
  return v5(v2 + 32);
}

uint64_t sub_2491B5EF8()
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

id sub_2491B5F48(void *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  uint64_t *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v7 = (uint64_t *)&v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__completion];
  *v7 = 0;
  v7[1] = 0;
  v8 = &v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration];
  v9 = type metadata accessor for AppExtensionHostView.Configuration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__isConnectedToRemote] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection] = 0;
  v10 = v3;
  sub_2491B6C08();
  *(_QWORD *)&v10[OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__preflightConfiguration] = a1;
  v11 = *v7;
  v12 = a1;
  sub_2491B32C0(a2);
  sub_2491B32D0(v11);
  *v7 = a2;
  v7[1] = a3;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for LanguageSupportHostModel();
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t sub_2491B6050(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495AE100](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2491B6090()
{
  uint64_t v0;

  return sub_2491B38D4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_2491B60A8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__xpcConnection) = v2;
  v4 = v2;

}

uint64_t sub_2491B60E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2491B6154;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257853910 + dword_257853910))(a1, v4);
}

uint64_t sub_2491B6160()
{
  return sub_2491B6090();
}

uint64_t sub_2491B6174()
{
  uint64_t v0;

  v0 = sub_2491B6CA4();
  __swift_allocate_value_buffer(v0, qword_257853968);
  __swift_project_value_buffer(v0, (uint64_t)qword_257853968);
  return sub_2491B6C98();
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

uint64_t sub_2491B6230@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BFC();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC21TranslationAPISupport24LanguageSupportHostModel__extensionConfiguration;
  swift_beginAccess();
  return sub_2491B5D24(v4, a2);
}

uint64_t sub_2491B62E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[16];
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
  MEMORY[0x24BDAC7A8]();
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2491B5D24(a1, (uint64_t)v5);
  v6 = *a2;
  swift_getKeyPath();
  v9 = v6;
  v10 = v5;
  v11 = v6;
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BF0();
  swift_release();
  return sub_2491B6B98((uint64_t)v5);
}

unint64_t RemoteUIExtensionPointIdentifier.getter()
{
  return 0xD000000000000029;
}

id PreflightHostingView.preflightConfiguration.getter()
{
  id *v0;

  return *v0;
}

void PreflightHostingView.preflightConfiguration.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*PreflightHostingView.preflightConfiguration.modify())()
{
  return nullsub_1;
}

void PreflightHostingView.init(preflightConfiguration:completion:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  id v8;
  uint64_t v9;
  uint64_t v10;

  objc_allocWithZone((Class)type metadata accessor for LanguageSupportHostModel());
  v8 = a1;
  sub_2491B5F48(v8, a2, a3);
  sub_2491B6D40();
  sub_2491B32D0(a2);

  *a4 = v8;
  a4[1] = v9;
  a4[2] = v10;
}

uint64_t PreflightHostingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  void **v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (*v12)();
  void *v13;
  uint64_t v14;
  uint64_t (**v15)();
  void (*v16)();
  uint64_t v17;
  void (**v18)();
  id v19;
  id v20;
  id v21;
  id v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v26 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853678);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for AppExtensionHostView(0);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v1[1];
  v24 = *v1;
  v7 = v1[2];
  v27 = v6;
  v28 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853928);
  sub_2491B6D58();
  v8 = v29;
  v9 = v30;
  v10 = v31;
  swift_getKeyPath();
  v29 = v8;
  v30 = v9;
  v31 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257853930);
  sub_2491B6D70();

  swift_release();
  swift_release();
  swift_release();
  v29 = v6;
  v30 = v7;
  sub_2491B6D4C();
  v11 = v27;
  v12 = (uint64_t (*)())swift_allocObject();
  v13 = v24;
  *((_QWORD *)v12 + 2) = v24;
  *((_QWORD *)v12 + 3) = v6;
  *((_QWORD *)v12 + 4) = v7;
  sub_2491B6834((uint64_t)v3, (uint64_t)v5);
  v14 = v25;
  *(_QWORD *)&v5[*(int *)(v25 + 20)] = v11;
  v15 = (uint64_t (**)())&v5[*(int *)(v14 + 24)];
  *v15 = sub_2491B6828;
  v15[1] = v12;
  v16 = (void (*)())swift_allocObject();
  *((_QWORD *)v16 + 2) = v13;
  *((_QWORD *)v16 + 3) = v6;
  *((_QWORD *)v16 + 4) = v7;
  v17 = v26;
  sub_2491B327C((uint64_t)v5, v26);
  v18 = (void (**)())(v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257853938) + 36));
  *v18 = sub_2491B68B4;
  v18[1] = v16;
  v18[2] = 0;
  v18[3] = 0;
  swift_retain_n();
  v19 = v13;
  v20 = v6;
  v21 = v19;
  v22 = v20;
  return sub_2491B68C0((uint64_t)v5);
}

uint64_t sub_2491B66F8()
{
  void *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257853928);
  sub_2491B6D4C();
  swift_getKeyPath();
  sub_2491B6050(&qword_257853870, (uint64_t (*)(uint64_t))type metadata accessor for LanguageSupportHostModel, (uint64_t)&protocol conformance descriptor for LanguageSupportHostModel);
  sub_2491B6BF0();

  return swift_release();
}

void sub_2491B67C8()
{
  void *v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257853928);
  sub_2491B6D4C();
  sub_2491B4CF4();

}

uint64_t sub_2491B6828()
{
  return sub_2491B66F8();
}

uint64_t sub_2491B6834(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_2491B68B4()
{
  sub_2491B67C8();
}

uint64_t sub_2491B68C0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppExtensionHostView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2491B68FC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for PreflightHostingView(id *a1)
{

  return swift_release();
}

_QWORD *_s21TranslationAPISupport20PreflightHostingViewVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  v6 = v4;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PreflightHostingView(uint64_t a1, uint64_t a2)
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

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
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

uint64_t assignWithTake for PreflightHostingView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PreflightHostingView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PreflightHostingView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreflightHostingView()
{
  return &type metadata for PreflightHostingView;
}

unint64_t sub_2491B6AF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257853940;
  if (!qword_257853940)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257853938);
    v2[0] = sub_2491B6050(&qword_2578537B8, type metadata accessor for AppExtensionHostView, (uint64_t)&unk_2491B73E8);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x2495AE100](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257853940);
  }
  return result;
}

void sub_2491B6B7C()
{
  uint64_t v0;

  sub_2491B3C74(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_2491B6B98(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257853680);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2491B6BD8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2491B6BE4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2491B6BF0()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_2491B6BFC()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_2491B6C08()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_2491B6C14()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_2491B6C20()
{
  return MEMORY[0x24BDC77B8]();
}

uint64_t sub_2491B6C2C()
{
  return MEMORY[0x24BDC77C8]();
}

uint64_t sub_2491B6C38()
{
  return MEMORY[0x24BDC77F0]();
}

uint64_t sub_2491B6C44()
{
  return MEMORY[0x24BDC7808]();
}

uint64_t sub_2491B6C50()
{
  return MEMORY[0x24BDC7818]();
}

uint64_t sub_2491B6C5C()
{
  return MEMORY[0x24BDC7820]();
}

uint64_t sub_2491B6C68()
{
  return MEMORY[0x24BDC7838]();
}

uint64_t sub_2491B6C74()
{
  return MEMORY[0x24BDC7840]();
}

uint64_t sub_2491B6C80()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_2491B6C8C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2491B6C98()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2491B6CA4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2491B6CB0()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_2491B6CBC()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_2491B6CC8()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_2491B6CD4()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_2491B6CE0()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2491B6CEC()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2491B6CF8()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2491B6D04()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2491B6D10()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_2491B6D1C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2491B6D28()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2491B6D34()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_2491B6D40()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_2491B6D4C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_2491B6D58()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_2491B6D64()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_2491B6D70()
{
  return MEMORY[0x24BDF47C8]();
}

uint64_t sub_2491B6D7C()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_2491B6D88()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2491B6D94()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2491B6DA0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2491B6DAC()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2491B6DB8()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2491B6DC4()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2491B6DD0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2491B6DDC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2491B6DE8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2491B6DF4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2491B6E00()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2491B6E0C()
{
  return MEMORY[0x24BDC7AF0]();
}

uint64_t sub_2491B6E18()
{
  return MEMORY[0x24BDC7AF8]();
}

uint64_t sub_2491B6E24()
{
  return MEMORY[0x24BDC7B08]();
}

uint64_t sub_2491B6E30()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2491B6E3C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2491B6E48()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2491B6E54()
{
  return MEMORY[0x24BEE2F48]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


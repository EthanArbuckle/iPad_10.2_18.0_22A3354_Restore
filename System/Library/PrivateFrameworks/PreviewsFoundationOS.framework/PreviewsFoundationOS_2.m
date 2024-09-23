uint64_t ThreadGuard.syncWrite<A>(callsite:_:)(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t *v2;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v19;

  v3 = v2;
  v4 = (uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 112));
  v5 = v4[3];
  v6 = v4[4];
  __swift_project_boxed_opaque_existential_1(v4, v5);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  if (result <= 1u)
    result = sub_244823F6C();
  v8 = *v2;
  v9 = *(_QWORD *)(*v2 + 104);
  if (*(uint64_t *)((char *)v3 + v9))
  {
    result = sub_244823F6C();
    v8 = *v3;
  }
  if (*(uint64_t *)((char *)v3 + *(_QWORD *)(v8 + 96)))
    result = sub_244823F6C();
  v10 = *(uint64_t *)((char *)v3 + v9);
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
  {
    __break(1u);
  }
  else
  {
    *(uint64_t *)((char *)v3 + v9) = v12;
    v13 = (uint64_t)v3 + *(_QWORD *)(*v3 + 88);
    swift_beginAccess();
    a2(v13);
    result = swift_endAccess();
    v14 = *(_QWORD *)(*v3 + 104);
    v15 = *(uint64_t *)((char *)v3 + v14);
    v11 = __OFSUB__(v15, 1);
    v16 = v15 - 1;
    v17 = v11;
    if (v19)
    {
      if (!v17)
      {
LABEL_15:
        *(uint64_t *)((char *)v3 + v14) = v16;
        return result;
      }
      __break(1u);
    }
    if (!v17)
      goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_2448C6008@<X0>(uint64_t a1@<X0>, void (*a2)(char *)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return ThreadGuard.syncRead<A>(callsite:_:)(a1, a2, a3, a4);
}

uint64_t sub_2448C6028(uint64_t a1, void (*a2)(uint64_t))
{
  return ThreadGuard.syncWrite<A>(callsite:_:)(a1, a2);
}

uint64_t sub_2448C6048()
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

uint64_t type metadata accessor for ThreadGuard(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ThreadGuard);
}

uint64_t method lookup function for ThreadGuard()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ThreadGuard.__allocating_init(value:tracker:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

void IsolatedInvalidatableCache.__allocating_init()()
{
  swift_allocObject();
  IsolatedInvalidatableCache.init()();
}

uint64_t sub_2448C6114()
{
  uint64_t v0;

  return v0;
}

void IsolatedInvalidatableCache.resource(on:for:create:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7[31] = a6;
  v7[32] = v6;
  v7[29] = a4;
  v7[30] = a5;
  v7[27] = a2;
  v7[28] = a3;
  v7[26] = a1;
  v8 = *(_QWORD **)v6;
  v9 = *(_QWORD *)(*(_QWORD *)v6 + 80);
  v7[33] = v9;
  v10 = v8[11];
  v7[34] = v10;
  v11 = v8[12];
  v7[35] = v11;
  v12 = v8[13];
  v7[36] = v12;
  v7[2] = v9;
  v7[3] = v10;
  v7[4] = v11;
  v7[5] = v12;
  type metadata accessor for IsolatedInvalidatableCache.ResourceStatus();
}

uint64_t sub_2448C6194(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[37] = a1;
  v1[38] = *(_QWORD *)(a1 - 8);
  v1[39] = swift_task_alloc();
  v1[40] = *(_QWORD *)(v3 - 8);
  v1[41] = swift_task_alloc();
  v4 = *(_QWORD *)(v2 - 8);
  v1[42] = v4;
  v1[43] = *(_QWORD *)(v4 + 64);
  v1[44] = swift_task_alloc();
  v5 = sub_2448EB508();
  v1[45] = v5;
  v1[46] = *(_QWORD *)(v5 - 8);
  v1[47] = swift_task_alloc();
  v1[48] = swift_task_alloc();
  v1[49] = swift_task_alloc();
  v1[50] = swift_task_alloc();
  swift_getObjectType();
  v1[51] = sub_2448EAF14();
  v1[52] = v6;
  return swift_task_switch();
}

uint64_t sub_2448C628C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void (*v17)(uint64_t *, _QWORD, uint64_t, uint64_t);
  _QWORD *v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t (*v26)(_QWORD);

  v1 = *(_QWORD *)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 264);
  v7 = *(_QWORD *)(v0 + 232);
  swift_beginAccess();
  MEMORY[0x2495190C8](v7, *(_QWORD *)(v6 + 16), v5, v2, v4);
  swift_endAccess();
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  *(_QWORD *)(v0 + 424) = v8;
  if (v8(v1, 1, v2) == 1)
  {
    v9 = *(uint64_t **)(v0 + 392);
    v10 = *(_QWORD *)(v0 + 352);
    v11 = *(_QWORD *)(v0 + 296);
    v12 = *(_QWORD *)(v0 + 304);
    v13 = *(_QWORD *)(v0 + 264);
    v14 = *(_QWORD *)(v0 + 232);
    v15 = *(int **)(v0 + 240);
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 336) + 16);
    *(_QWORD *)(v0 + 432) = v16;
    v16(v10, v14, v13);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    *(_QWORD *)(v0 + 440) = sub_2448EAF44();
    *v9 = sub_2448EAE54();
    swift_storeEnumTagMultiPayload();
    v17 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v12 + 56);
    *(_QWORD *)(v0 + 448) = v17;
    v17(v9, 0, 1, v11);
    swift_beginAccess();
    *(_QWORD *)(v0 + 456) = sub_2448EA8B4();
    sub_2448EA8F0();
    swift_endAccess();
    v26 = (uint64_t (*)(_QWORD))((char *)v15 + *v15);
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 464) = v18;
    *v18 = v0;
    v18[1] = sub_2448C65A4;
    return v26(*(_QWORD *)(v0 + 328));
  }
  else
  {
    v20 = *(uint64_t **)(v0 + 400);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      (*(void (**)(_QWORD, uint64_t *, _QWORD))(*(_QWORD *)(v0 + 320) + 32))(*(_QWORD *)(v0 + 208), v20, *(_QWORD *)(v0 + 272));
      swift_task_dealloc();
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
      v21 = *(_QWORD *)(v0 + 256);
      v22 = *(_QWORD *)(v0 + 232);
      v23 = *v20;
      *(_QWORD *)(v0 + 480) = *v20;
      v24 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 488) = v24;
      v24[2] = v21;
      v24[3] = v22;
      v24[4] = v23;
      v25 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 496) = v25;
      *v25 = v0;
      v25[1] = sub_2448C6968;
      return sub_2448EBC34();
    }
  }
}

uint64_t sub_2448C65A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 472) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2448C6604()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  void (*v30)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;

  v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 424);
  v2 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 264);
  v7 = *(_QWORD *)(v0 + 232);
  swift_beginAccess();
  MEMORY[0x2495190C8](v7, *(_QWORD *)(v6 + 16), v5, v3, v4);
  v8 = v1(v2, 1, v3);
  v9 = *(_QWORD *)(v0 + 384);
  v11 = *(_QWORD *)(v0 + 360);
  v10 = *(_QWORD *)(v0 + 368);
  if (v8)
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 8))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 360));
    swift_endAccess();
    v34 = 0;
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 304);
    v12 = *(_QWORD *)(v0 + 312);
    v14 = *(_QWORD *)(v0 + 296);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 16))(v12, *(_QWORD *)(v0 + 384), v14);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    swift_endAccess();
    v34 = sub_2448C6F34(v14);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  v30 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 448);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 432);
  v16 = *(_QWORD *)(v0 + 392);
  v17 = *(_QWORD *)(v0 + 352);
  v18 = *(_QWORD *)(v0 + 328);
  v19 = *(_QWORD *)(v0 + 320);
  v20 = *(_QWORD *)(v0 + 296);
  v33 = *(_QWORD *)(v0 + 288);
  v21 = *(_QWORD *)(v0 + 264);
  v31 = *(_QWORD *)(v0 + 336);
  v32 = *(_QWORD *)(v0 + 256);
  v22 = *(_QWORD *)(v0 + 232);
  v35 = *(_OWORD *)(v0 + 272);
  v15(v17, v22, v21);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v19 + 16))(v16, v18, v35);
  swift_storeEnumTagMultiPayload();
  v30(v16, 0, 1, v20);
  swift_beginAccess();
  sub_2448EA8F0();
  swift_endAccess();
  v15(v17, v22, v21);
  v23 = (*(unsigned __int8 *)(v31 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v21;
  *(_OWORD *)(v24 + 24) = v35;
  *(_QWORD *)(v24 + 40) = v33;
  *(_QWORD *)(v24 + 48) = v32;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v31 + 32))(v24 + v23, v17, v21);
  swift_retain();
  IsolatedInvalidatable.onInvalidation(_:)((uint64_t)sub_2448C7D48, v24, v35, v33);
  swift_release();
  if (v34)
  {
    v25 = *(_QWORD *)(v0 + 328);
    *(_QWORD *)(v0 + 200) = v34;
    v26 = swift_task_alloc();
    v27 = *(_OWORD *)(v0 + 280);
    *(_OWORD *)(v26 + 16) = *(_OWORD *)(v0 + 264);
    *(_OWORD *)(v26 + 32) = v27;
    *(_QWORD *)(v26 + 48) = v25;
    v28 = sub_2448EAEE4();
    MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v28);
    sub_2448EAD70();
    swift_task_dealloc();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 320) + 32))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 272));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2448C6968()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 504) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_2448C69DC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2448C6A60()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 424);
  v2 = *(_QWORD *)(v0 + 376);
  v3 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 264);
  v7 = *(_QWORD *)(v0 + 232);
  swift_beginAccess();
  MEMORY[0x2495190C8](v7, *(_QWORD *)(v6 + 16), v5, v3, v4);
  v8 = v1(v2, 1, v3);
  v10 = *(_QWORD *)(v0 + 368);
  v9 = *(_QWORD *)(v0 + 376);
  v11 = *(_QWORD *)(v0 + 360);
  if (v8)
  {
    (*(void (**)(_QWORD, _QWORD))(v10 + 8))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 360));
    swift_endAccess();
    v12 = 0;
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 304);
    v13 = *(_QWORD *)(v0 + 312);
    v15 = *(_QWORD *)(v0 + 296);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 16))(v13, *(_QWORD *)(v0 + 376), v15);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    swift_endAccess();
    v12 = sub_2448C6F34(v15);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 448);
  v17 = *(_QWORD *)(v0 + 392);
  v18 = *(_QWORD *)(v0 + 296);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 432))(*(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 264));
  v16(v17, 1, 1, v18);
  swift_beginAccess();
  sub_2448EA8F0();
  swift_endAccess();
  if (v12)
  {
    v19 = *(_QWORD *)(v0 + 472);
    *(_QWORD *)(v0 + 192) = v12;
    v20 = swift_task_alloc();
    v21 = *(_OWORD *)(v0 + 280);
    *(_OWORD *)(v20 + 16) = *(_OWORD *)(v0 + 264);
    *(_OWORD *)(v20 + 32) = v21;
    *(_QWORD *)(v20 + 48) = v19;
    v22 = sub_2448EAEE4();
    MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v22);
    sub_2448EAD70();
    swift_task_dealloc();
    swift_bridgeObjectRelease();
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2448C6CC4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
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

void IsolatedInvalidatableCache.snapshot.getter()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  type metadata accessor for IsolatedInvalidatableCache.ResourceStatus();
}

uint64_t sub_2448C6DC0()
{
  uint64_t v0;

  v0 = sub_2448EA83C();
  swift_bridgeObjectRelease();
  return v0;
}

void IsolatedInvalidatableCache.invalidate(file:line:column:function:trace:)()
{
  sub_2448C747C();
}

uint64_t sub_2448C6E54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = *(_QWORD *)(a1 + 24);
    v8 = *(_QWORD *)(v7 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v6, v7);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 56))(a2, 1, 1, *(_QWORD *)(a1 + 24));
  }
}

uint64_t sub_2448C6F34(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v3);
  if (swift_getEnumCaseMultiPayload() != 1)
    return *(_QWORD *)v3;
  (*(void (**)(char *))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 8))(v3);
  return 0;
}

void IsolatedInvalidatableCache.init()()
{
  type metadata accessor for IsolatedInvalidatableCache.ResourceStatus();
}

uint64_t sub_2448C6FF0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_2448EA7C4();
  return v0;
}

void type metadata accessor for IsolatedInvalidatableCache.ResourceStatus()
{
  JUMPOUT(0x24951ABD4);
}

void sub_2448C7028()
{
  type metadata accessor for IsolatedInvalidatableCache.ResourceStatus();
}

uint64_t sub_2448C7064(uint64_t a1)
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
  _BYTE v12[64];

  v4 = sub_2448EB508();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v12[-v6];
  v8 = *(_QWORD *)(v2 - 112);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(&v12[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], v1, v8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(v7, 1, 1, a1);
  swift_beginAccess();
  sub_2448EA8B4();
  sub_2448EA8F0();
  return swift_endAccess();
}

uint64_t sub_2448C715C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  sub_2448EAF44();
  return sub_2448EAF38();
}

uint64_t sub_2448C7200(int a1, id a2)
{
  id v2;

  v2 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  sub_2448EAF44();
  return sub_2448EAF2C();
}

void sub_2448C7270()
{
  type metadata accessor for IsolatedInvalidatableCache.ResourceStatus();
}

uint64_t sub_2448C72C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[96];

  v5 = sub_2448EB508();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t *)&v16[-v7];
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(&v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)], v3, v1);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v11 = sub_2448EAF44();
  sub_2448EBB68();
  v12 = *(_QWORD *)(v11 - 8);
  swift_allocObject();
  sub_2448EAE0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v13, v2, v11);
  sub_244805474();
  v14 = sub_2448EAE3C();
  swift_bridgeObjectRelease();
  *v8 = v14;
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(v8, 0, 1, a1);
  swift_beginAccess();
  sub_2448EA8B4();
  sub_2448EA8F0();
  return swift_endAccess();
}

void sub_2448C7470()
{
  sub_2448C7270();
}

void sub_2448C747C()
{
  uint64_t v0;

  v0 = sub_2448EB508();
  MEMORY[0x24BDAC7A8](v0);
  type metadata accessor for IsolatedInvalidatableCache.ResourceStatus();
}

uint64_t sub_2448C7984()
{
  sub_2448EAF50();
  sub_2447C8004();
  swift_allocError();
  sub_2448EA7DC();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  sub_2448EAF44();
  return sub_2448EAF2C();
}

uint64_t IsolatedInvalidatableCache.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t IsolatedInvalidatableCache.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void IsolatedOnDemand.init(create:)()
{
  type metadata accessor for IsolatedInvalidatableCache();
}

void sub_2448C7AAC()
{
  swift_allocObject();
  IsolatedInvalidatableCache.init()();
}

void sub_2448C7AC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  *v3 = v1;
  v3[1] = v2;
  v3[2] = v0;
}

void IsolatedOnDemand.resource(on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4[3] = a2;
  v4[4] = a3;
  v8 = *(_QWORD *)(v3 + 8);
  v9 = *(_QWORD *)(v3 + 16);
  v4[2] = 0;
  v10 = (_QWORD *)swift_task_alloc();
  v4[5] = v10;
  *v10 = v4;
  v10[1] = sub_2448C7B78;
  IsolatedInvalidatableCache.resource(on:for:create:)(a1, a2, a3, (uint64_t)(v4 + 2), v8, v9);
}

uint64_t sub_2448C7B78()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  swift_getObjectType();
  sub_2448EAF14();
  return swift_task_switch();
}

void IsolatedOnDemand.invalidate(file:line:column:function:trace:)()
{
  sub_2448C747C();
}

void IsolatedOnDemand.invalidate(callsite:trace:)()
{
  sub_2448C747C();
}

uint64_t sub_2448C7CBC(int a1)
{
  uint64_t v1;

  return sub_2448C7200(a1, *(id *)(v1 + 48));
}

uint64_t sub_2448C7CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_2448C7D48()
{
  sub_2448C7028();
}

uint64_t sub_2448C7D68(uint64_t a1)
{
  return sub_2448C715C(a1);
}

void sub_2448C7D88()
{
  type metadata accessor for IsolatedInvalidatableCache.ResourceStatus();
}

uint64_t sub_2448C7DBC(uint64_t a1)
{
  uint64_t v1;

  return sub_2448C6E54(a1, v1);
}

void type metadata accessor for IsolatedInvalidatableCache()
{
  JUMPOUT(0x24951ABD4);
}

uint64_t sub_2448C7DEC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for IsolatedInvalidatableCache()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IsolatedInvalidatableCache.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for IsolatedOnDemand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IsolatedOnDemand);
}

uint64_t sub_2448C7E50()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2448C7EC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X13 }
    }
    if (v9 == 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 1;
    }
    else
    {
      *a1 = *a2;
      *((_BYTE *)a1 + v5) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return v3;
}

uint64_t sub_2448C7FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return (*(uint64_t (**)(void))(v2 + 8))();
    else
      return swift_bridgeObjectRelease();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_2448C8028 + 4 * byte_2448F7B15[v5]))();
  }
}

_QWORD *sub_2448C8080(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_QWORD *))(v4 + 16))(a1);
    v8 = 1;
  }
  else
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
    v8 = 0;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

_QWORD *sub_2448C8158(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 24);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 24));
    else
      swift_bridgeObjectRelease();
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v7) = 1;
    }
    else
    {
      *a1 = *a2;
      *((_BYTE *)a1 + v7) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

_QWORD *sub_2448C82E8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    (*(void (**)(_QWORD *))(v4 + 32))(a1);
    v8 = 1;
  }
  else
  {
    v8 = 0;
    *a1 = *a2;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

_QWORD *sub_2448C83BC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 24);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 24));
    else
      swift_bridgeObjectRelease();
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 1;
    }
    else
    {
      v12 = 0;
      *a1 = *a2;
    }
    *((_BYTE *)a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_2448C8548(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64) > 8uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448C860C + 4 * byte_2448F7B38[(v4 - 1)]))();
}

void sub_2448C8658(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_2448C8800(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448C8848 + 4 * byte_2448F7B46[v3]))();
}

void sub_2448C8890(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64) <= 8uLL)
    v4 = 8;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_2448C8958()
{
  return sub_2448C7984();
}

uint64_t sub_2448C8974(void (*a1)(__int128 *__return_ptr, __int128 *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  __int128 *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  char v32;
  uint64_t v33;
  __int128 v34;
  char v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  uint64_t v41;
  char v42;
  uint64_t v43;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v43 = MEMORY[0x24BEE4AF8];
    sub_2447CEF40(0, v5, 0);
    v6 = v43;
    v8 = (__int128 *)(a3 + 56);
    while (1)
    {
      v9 = *((_QWORD *)v8 - 1);
      v10 = *((_BYTE *)v8 + 16);
      v11 = *((_QWORD *)v8 + 3);
      v12 = *((_BYTE *)v8 + 48);
      v29 = *(__int128 *)((char *)v8 - 24);
      v30 = v9;
      v31 = *v8;
      v32 = v10;
      v33 = v11;
      v34 = v8[2];
      v35 = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a1(&v36, &v29);
      if (v4)
        break;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v13 = v36;
      v14 = v37;
      v15 = v38;
      v16 = v39;
      v17 = v40;
      v18 = v41;
      v19 = v42;
      v43 = v6;
      v21 = *(_QWORD *)(v6 + 16);
      v20 = *(_QWORD *)(v6 + 24);
      if (v21 >= v20 >> 1)
      {
        v26 = v37;
        v27 = v36;
        v25 = v40;
        v23 = v42;
        sub_2447CEF40(v20 > 1, v21 + 1, 1);
        v19 = v23;
        v17 = v25;
        v14 = v26;
        v13 = v27;
        v6 = v43;
      }
      v8 += 5;
      *(_QWORD *)(v6 + 16) = v21 + 1;
      v22 = v6 + 80 * v21;
      *(_OWORD *)(v22 + 32) = v13;
      *(_OWORD *)(v22 + 48) = v14;
      *(_QWORD *)(v22 + 64) = v15;
      *(_BYTE *)(v22 + 72) = v16;
      *(_OWORD *)(v22 + 80) = v17;
      *(_QWORD *)(v22 + 96) = v18;
      *(_BYTE *)(v22 + 104) = v19;
      --v5;
      v4 = 0;
      if (!v5)
        return v6;
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_2448C8B2C(void (*a1)(_QWORD *__return_ptr, _QWORD *))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;

  v2 = v1;
  v3 = sub_2448EAB78();
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return v4;
  v5 = v3;
  v16 = MEMORY[0x24BEE4AF8];
  result = sub_2447CEFC0(0, v3 & ~(v3 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v4 = v16;
    while (1)
    {
      v14[0] = sub_2448EAC80();
      v14[1] = v7;
      a1(v15, v14);
      if (v2)
        break;
      v2 = 0;
      swift_bridgeObjectRelease();
      v9 = v15[0];
      v8 = v15[1];
      v16 = v4;
      v11 = *(_QWORD *)(v4 + 16);
      v10 = *(_QWORD *)(v4 + 24);
      if (v11 >= v10 >> 1)
      {
        sub_2447CEFC0(v10 > 1, v11 + 1, 1);
        v4 = v16;
      }
      *(_QWORD *)(v4 + 16) = v11 + 1;
      v12 = v4 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v9;
      *(_QWORD *)(v12 + 40) = v8;
      sub_2448EAB84();
      if (!--v5)
        return v4;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return v4;
  }
  __break(1u);
  return result;
}

Swift::String __swiftcall String.prefixingEachLine(with:startingOnLine:)(Swift::String with, Swift::UInt startingOnLine)
{
  void *object;
  uint64_t v3;
  uint64_t v4;
  Swift::UInt v5;
  void **v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  Swift::String result;
  uint64_t countAndFlagsBits;
  uint64_t v20;

  countAndFlagsBits = with._countAndFlagsBits;
  object = with._object;
  sub_2447D0980();
  v3 = sub_2448EB5B0();
  v20 = MEMORY[0x24BEE4AF8];
  sub_2447CEE18(0, 0, 0);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v5 = 0;
    v6 = (void **)(v3 + 40);
    do
    {
      v8 = (uint64_t)*(v6 - 1);
      v7 = *v6;
      swift_bridgeObjectRetain();
      if (v5 >= startingOnLine)
      {
        swift_bridgeObjectRetain();
        sub_2448EABC0();
        swift_bridgeObjectRelease();
        v8 = countAndFlagsBits;
        v7 = object;
      }
      v10 = *(_QWORD *)(v20 + 16);
      v9 = *(_QWORD *)(v20 + 24);
      if (v10 >= v9 >> 1)
        sub_2447CEE18(v9 > 1, v10 + 1, 1);
      v6 += 2;
      ++v5;
      *(_QWORD *)(v20 + 16) = v10 + 1;
      v11 = v20 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v8;
      *(_QWORD *)(v11 + 40) = v7;
    }
    while (v4 != v5);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738A630);
  sub_2447EB714(qword_25738A638, &qword_25738A630, MEMORY[0x24BEE12B0]);
  v12 = sub_2448EA9A4();
  v14 = v13;
  swift_release();
  v15 = v12;
  v16 = v14;
  result._object = v16;
  result._countAndFlagsBits = v15;
  return result;
}

_QWORD *sub_2448C8E64(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 56);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = *v2;
    if (v5 != 255)
    {
      v6 = (void *)*((_QWORD *)v2 - 3);
      v7 = *((_QWORD *)v2 - 2);
      v8 = *((_QWORD *)v2 - 1);
      sub_244817F58(v6, v7, v8, v5 & 1);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_2447C2D44(0, v3[2] + 1, 1, v3);
      v10 = v3[2];
      v9 = v3[3];
      if (v10 >= v9 >> 1)
        v3 = sub_2447C2D44((_QWORD *)(v9 > 1), v10 + 1, 1, v3);
      v3[2] = v10 + 1;
      v4 = &v3[4 * v10];
      v4[4] = v6;
      v4[5] = v7;
      v4[6] = v8;
      *((_BYTE *)v4 + 56) = v5 & 1;
    }
    v2 += 32;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

_QWORD *sub_2448C8F7C(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 *v2;
  _QWORD *v3;
  _QWORD *v4;
  int v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 48);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = *v2;
    if (v5 != 255)
    {
      v6 = (void *)*((_QWORD *)v2 - 2);
      v7 = *((_QWORD *)v2 - 1);
      sub_244818190(v6, v7, v5 & 1);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_2447C30C0(0, v3[2] + 1, 1, v3);
      v9 = v3[2];
      v8 = v3[3];
      if (v9 >= v8 >> 1)
        v3 = sub_2447C30C0((_QWORD *)(v8 > 1), v9 + 1, 1, v3);
      v3[2] = v9 + 1;
      v4 = &v3[3 * v9];
      v4[4] = v6;
      v4[5] = v7;
      *((_BYTE *)v4 + 48) = v5 & 1;
    }
    v2 += 24;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

_QWORD *sub_2448C908C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v5 = *v2;
    if (*v2)
    {
      v6 = *(v2 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_2447C1B70(0, v3[2] + 1, 1, v3);
      v8 = v3[2];
      v7 = v3[3];
      if (v8 >= v7 >> 1)
        v3 = sub_2447C1B70((_QWORD *)(v7 > 1), v8 + 1, 1, v3);
      v3[2] = v8 + 1;
      v4 = &v3[2 * v8];
      v4[4] = v6;
      v4[5] = v5;
    }
    v2 += 2;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t sub_2448C917C(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_2448CCFC0(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_2448EB790();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_2448EB820();
      v5 = sub_2448EB82C();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

Swift::String __swiftcall String.uppercasingFirstLetter()()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  Swift::String result;

  v2 = sub_2448C9E94(v0, v1, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0A20]);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

void String.uv_sha256.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  void (*v8)(char *, uint64_t);
  unint64_t v9;
  unint64_t v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x24BDAC8D0];
  v0 = sub_2448EA7B8();
  v11[1] = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_2448EA7AC();
  v11[2] = *(_QWORD *)(v1 - 8);
  v11[3] = v1;
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_2448EAADC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2448EAAC4();
  sub_2448EAAA0();
  v7 = v6;
  v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  if (v7 >> 60 == 15)
  {
    sub_2448EAAD0();
    sub_2448EAAA0();
    v10 = v9;
    v8(v5, v2);
    if (v10 >> 60 == 15)
      v7 = 0xC000000000000000;
    else
      v7 = v10;
  }
  sub_2448CD468();
  sub_2448EA794();
  __asm { BR              X10 }
}

uint64_t sub_2448C9404()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 104) = v3;
  *(_WORD *)(v5 - 96) = v4;
  *(_BYTE *)(v5 - 94) = BYTE2(v4);
  *(_BYTE *)(v5 - 93) = BYTE3(v4);
  *(_BYTE *)(v5 - 92) = BYTE4(v4);
  *(_BYTE *)(v5 - 91) = BYTE5(v4);
  sub_2448EA77C();
  sub_2447E74B0(v3, v4);
  sub_2448EA788();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 136) + 8))(v2, v0);
  sub_2448EA7A0();
  sub_2447E74B0(v3, v4);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 128) + 8))(v1, *(_QWORD *)(v5 - 120));
  return *(_QWORD *)(v5 - 104);
}

Swift::String __swiftcall String.deleting(prefix:)(Swift::String prefix)
{
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  Swift::String result;

  object = prefix._object;
  countAndFlagsBits = prefix._countAndFlagsBits;
  v3 = sub_2448EACA4();
  v5 = Substring.uv_deletingLeading(prefix:)(countAndFlagsBits, (uint64_t)object, v3, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = MEMORY[0x2495192FC](v5, v7, v9, v11);
  v14 = v13;
  swift_bridgeObjectRelease();
  v15 = v12;
  v16 = v14;
  result._object = v16;
  result._countAndFlagsBits = v15;
  return result;
}

uint64_t String.init(spaced:)(uint64_t a1)
{
  uint64_t v1;

  sub_2448C908C(a1);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738A630);
  sub_2447EB714(qword_25738A638, &qword_25738A630, MEMORY[0x24BEE12B0]);
  v1 = sub_2448EA9A4();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t String.contains(anyCharactersFrom:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD v14[2];

  if ((a3 & 0x2000000000000000) != 0)
    v3 = HIBYTE(a3) & 0xF;
  else
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    v6 = a3 & 0xFFFFFFFFFFFFFFLL;
    v7 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
    swift_bridgeObjectRetain();
    for (i = 0; i < v3; i += v11)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        sub_2448EB790();
        v11 = v10;
      }
      else
      {
        if ((a3 & 0x2000000000000000) != 0)
        {
          v14[0] = a2;
          v14[1] = v6;
          if (*((char *)v14 + i) < 0)
            __asm { BR              X9 }
        }
        else
        {
          v9 = v7;
          if ((a2 & 0x1000000000000000) == 0)
            v9 = sub_2448EB820();
          if (*(char *)(v9 + i) < 0)
            __asm { BR              X10 }
        }
        v11 = 1;
      }
      v12 = sub_2448EA254();
      if ((v12 & 1) != 0)
        break;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t String.filteringCharacters(to:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t i;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  unint64_t v20;

  if ((a3 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a3) & 0xF;
  else
    v4 = a2 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return 0;
  v19 = 0;
  v20 = 0xE000000000000000;
  v16 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v17 = a3 & 0xFFFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain_n();
  for (i = 0; i < v4; i += v11)
  {
    if ((a3 & 0x1000000000000000) != 0)
    {
      v9 = sub_2448EB790();
      v11 = v10;
    }
    else
    {
      if ((a3 & 0x2000000000000000) != 0)
      {
        v18[0] = a2;
        v18[1] = v17;
        v9 = *((unsigned __int8 *)v18 + i);
        if (*((char *)v18 + i) < 0)
          __asm { BR              X9 }
      }
      else
      {
        v8 = v16;
        if ((a2 & 0x1000000000000000) == 0)
          v8 = sub_2448EB820();
        v9 = *(unsigned __int8 *)(v8 + i);
        if (*(char *)(v8 + i) < 0)
          __asm { BR              X9 }
      }
      v11 = 1;
    }
    if ((sub_2448EA254() & 1) != 0)
    {
      if (v9 <= 0x7F)
      {
        v7 = v9 + 1;
      }
      else
      {
        v12 = (v9 & 0x3F) << 8;
        if (v9 >= 0x800)
        {
          v13 = (v12 | (v9 >> 6) & 0x3F) << 8;
          v14 = (((v13 | (v9 >> 12) & 0x3F) << 8) | (v9 >> 18)) - 2122219023;
          v7 = (v13 | (v9 >> 12)) + 8487393;
          if (HIWORD(v9))
            v7 = v14;
        }
        else
        {
          v7 = (v12 | (v9 >> 6)) + 33217;
        }
      }
      v18[0] = (v7 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v7) >> 3))));
      MEMORY[0x249519338](v18);
      sub_2448EABC0();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease_n();
  return v19;
}

uint64_t String.replacingCharacters(in:with:)()
{
  sub_2448C8B2C((void (*)(_QWORD *__return_ptr, _QWORD *))sub_2448CD55C);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573916E8);
  sub_2447EB714(&qword_2573916F0, &qword_2573916E8, MEMORY[0x24BEE12C8]);
  return sub_2448EAC8C();
}

uint64_t sub_2448C9CB8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[4];

  v6 = *a1;
  v7 = a1[1];
  v11[2] = a2;
  swift_bridgeObjectRetain();
  v8 = sub_2448C9D4C((uint64_t (*)(_QWORD *))sub_2448CDBD8, (uint64_t)v11, v6, v7);
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
    v9 = a3;
  else
    v9 = v6;
  result = swift_bridgeObjectRetain();
  *a4 = v9;
  a4[1] = result;
  return result;
}

uint64_t sub_2448C9D4C(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v16;
  _QWORD v17[4];

  v17[3] = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) != 0)
    v5 = HIBYTE(a4) & 0xF;
  else
    v5 = a3 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v16 = a4 & 0xFFFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if ((a4 & 0x1000000000000000) != 0)
      {
        v10 = sub_2448EB790();
      }
      else
      {
        if ((a4 & 0x2000000000000000) != 0)
        {
          v17[0] = a3;
          v17[1] = v16;
        }
        else if ((a3 & 0x1000000000000000) == 0)
        {
          sub_2448EB820();
        }
        v10 = sub_2448EB82C();
      }
      v12 = v11;
      LODWORD(v17[0]) = v10;
      v13 = a1(v17);
      if (v4)
      {
        swift_bridgeObjectRelease();
        return v14 & 1;
      }
      if ((v13 & 1) != 0)
        break;
      v9 += v12;
      if (v9 >= v5)
      {
        swift_bridgeObjectRelease();
        v14 = 0;
        return v14 & 1;
      }
    }
    swift_bridgeObjectRelease();
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

Swift::String __swiftcall String.lowercasingFirstLetter()()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  Swift::String result;

  v2 = sub_2448C9E94(v0, v1, (uint64_t (*)(uint64_t))MEMORY[0x24BEE0A08]);
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

unint64_t sub_2448C9E94(unint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v3;
  unint64_t result;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  _QWORD v18[4];

  v18[2] = a1;
  v18[3] = a2;
  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return 0;
  swift_bridgeObjectRetain();
  result = sub_2448C917C(a1, a2);
  if ((result & 0x100000000) == 0)
  {
    v8 = result;
    result = sub_2448CD3A8(1uLL);
    if ((v8 & 0xFFFFFF80) != 0)
    {
      v14 = (v8 & 0x3F) << 8;
      v9 = (v14 | (v8 >> 6)) + 33217;
      v15 = (v14 | (v8 >> 6) & 0x3F) << 8;
      v16 = (((v15 | (v8 >> 12) & 0x3F) << 8) | (v8 >> 18)) - 2122219023;
      v17 = (v15 | (v8 >> 12)) + 8487393;
      if (HIWORD(v8))
        v17 = v16;
      if (v8 >= 0x800)
        v9 = v17;
      goto LABEL_8;
    }
    if (v8 <= 0xFF)
    {
      v9 = (v8 + 1);
LABEL_8:
      v18[0] = (v9 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v9) >> 3)) & 7)));
      v10 = MEMORY[0x249519338](v18);
      v11 = a3(v10);
      v13 = v12;
      swift_bridgeObjectRelease();
      v18[0] = v11;
      v18[1] = v13;
      swift_bridgeObjectRetain();
      sub_2448EABC0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v18[0];
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL String.firstCharacterIsUppercase.getter(uint64_t a1, unint64_t a2)
{
  return sub_2448CA044(a1, a2, MEMORY[0x24BDCB678]);
}

BOOL String.firstCharacterIsLowercase.getter(uint64_t a1, unint64_t a2)
{
  return sub_2448CA044(a1, a2, MEMORY[0x24BDCB670]);
}

BOOL sub_2448CA044(uint64_t a1, unint64_t a2, void (*a3)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  _BOOL8 result;
  _QWORD v21[4];

  v6 = sub_2448EA26C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v10 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v10)
    return 0;
  v11 = sub_2448EAB84();
  v21[0] = sub_2448EACA4();
  v21[1] = v12;
  v21[2] = v13;
  v21[3] = v14;
  a3(v21[0], v12, v13, v14);
  sub_2448940D8();
  v15 = sub_2448EB5C8();
  v17 = v16;
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  result = 0;
  if ((v19 & 1) == 0 && !(v15 >> 14))
    return (v17 ^ (unint64_t)v11) < 0x4000;
  return result;
}

Swift::String __swiftcall String.strippingTrailingNewlines()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t, uint64_t);
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String result;
  _QWORD v24[4];

  v2 = v1;
  v3 = v0;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573916F8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2448EACA4();
  v9 = sub_2448CCB54(10, 0xE100000000000000, v7, v8);
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    v10 = sub_2448EA56C();
    v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    while (1)
    {
      v24[2] = v3;
      v24[3] = v2;
      v24[0] = 10;
      v24[1] = 0xE100000000000000;
      v11(v6, 1, 1, v10);
      sub_2447D0980();
      sub_2448EB5EC();
      v13 = v12;
      sub_2448CD57C((uint64_t)v6);
      v14 = swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        break;
      v16 = sub_2448EACA4();
      v18 = sub_2448CCB54(10, 0xE100000000000000, v16, v17);
      swift_bridgeObjectRelease();
      if ((v18 & 1) == 0)
        goto LABEL_5;
    }
    __break(1u);
  }
  else
  {
LABEL_5:
    v19 = sub_2448EACA4();
    v20 = MEMORY[0x2495192FC](v19);
    v22 = v21;
    swift_bridgeObjectRelease();
    v14 = v20;
    v15 = v22;
  }
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

Swift::String __swiftcall String.describingDifference(from:)(Swift::String from)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *i;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  Swift::String result;
  _BYTE v30[16];
  unint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;

  v3 = (unint64_t)v2;
  v4 = v1;
  object = from._object;
  countAndFlagsBits = from._countAndFlagsBits;
  v7 = 0x66666964206F4ELL;
  if (v1 == from._countAndFlagsBits && v2 == from._object || (v8 = sub_2448EBBEC(), (v8 & 1) != 0))
  {
    v9 = (void *)0xE700000000000000;
LABEL_5:
    v10 = v7;
  }
  else
  {
    v39 = 10;
    v40 = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v8);
    v31 = &v39;
    swift_bridgeObjectRetain();
    v11 = sub_2447CC5C4(0x7FFFFFFFFFFFFFFFLL, 1, sub_244806DE4, (uint64_t)v30, v4, v3);
    v39 = 10;
    v40 = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v11);
    v31 = &v39;
    swift_bridgeObjectRetain();
    v12 = sub_2447CC5C4(0x7FFFFFFFFFFFFFFFLL, 1, sub_2448CDCB0, (uint64_t)v30, countAndFlagsBits, (unint64_t)object);
    v36 = *(_QWORD *)(v11 + 16);
    v13 = *(_QWORD *)(v12 + 16);
    v33 = v11;
    v34 = v13;
    v32 = v11 + 32;
    swift_bridgeObjectRetain();
    v10 = swift_bridgeObjectRetain();
    v14 = 0;
    v15 = 0;
    v35 = v12;
    for (i = (uint64_t *)(v12 + 56); ; i += 4)
    {
      if (v15 == v36)
      {
        if (v34 == v14)
          goto LABEL_30;
        v17 = 0;
        v18 = 0;
        v37 = 0;
        v19 = 0;
        v15 = v36;
      }
      else
      {
        if (v15 >= *(_QWORD *)(v33 + 16))
          goto LABEL_32;
        v20 = (unint64_t *)(v32 + 32 * v15);
        v18 = v20[2];
        v17 = v20[3];
        v19 = *v20;
        v37 = v20[1];
        v10 = swift_bridgeObjectRetain();
        if (v34 == v14)
        {
          if (v17)
            goto LABEL_28;
LABEL_30:
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v7 = 0xD000000000000058;
          v9 = (void *)0x80000002448FD6E0;
          goto LABEL_5;
        }
        ++v15;
      }
      if (v14 >= *(_QWORD *)(v35 + 16))
        break;
      v22 = *(i - 1);
      v21 = *i;
      v23 = *(i - 3);
      v24 = *(i - 2);
      swift_bridgeObjectRetain();
      if (!v17)
      {
        if (v21)
        {
LABEL_28:
          swift_bridgeObjectRelease();
          v25 = v35;
          swift_bridgeObjectRelease();
          v26 = v33;
          swift_bridgeObjectRelease();
          v39 = 0;
          v40 = 0xE000000000000000;
          sub_2448EB79C();
          sub_2448EABC0();
          v27 = *(_QWORD *)(v26 + 16);
          swift_bridgeObjectRelease();
          v38 = v27;
          sub_2448EBB5C();
          sub_2448EABC0();
          swift_bridgeObjectRelease();
          sub_2448EABC0();
          v28 = *(_QWORD *)(v25 + 16);
          swift_bridgeObjectRelease();
          v38 = v28;
          sub_2448EBB5C();
          sub_2448EABC0();
          swift_bridgeObjectRelease();
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      if (!v21)
        goto LABEL_28;
      if (v18 != v22 || v17 != v21 || v19 >> 16 != v23 >> 16 || v37 >> 16 != v24 >> 16)
      {
        LOBYTE(v31) = 0;
        if ((sub_2448EBB20() & 1) == 0)
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v39 = 0;
          v40 = 0xE000000000000000;
          sub_2448EB79C();
          swift_bridgeObjectRelease();
          v39 = 0xD00000000000001CLL;
          v40 = 0x80000002448FD790;
          v38 = v14;
          sub_2448EBB5C();
          sub_2448EABC0();
          swift_bridgeObjectRelease();
          sub_2448EABC0();
          MEMORY[0x2495192FC](v23, v24, v22, v21);
          sub_2448EABC0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2448EABC0();
          MEMORY[0x2495192FC](v19, v37, v18, v17);
          sub_2448EABC0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_29:
          sub_2448EABC0();
          v7 = v39;
          v9 = (void *)v40;
          goto LABEL_5;
        }
      }
      swift_bridgeObjectRelease();
      v10 = swift_bridgeObjectRelease();
      ++v14;
    }
    __break(1u);
LABEL_32:
    __break(1u);
  }
  result._object = v9;
  result._countAndFlagsBits = v10;
  return result;
}

Swift::String __swiftcall String.indentingEachLine(startingOnLine:)(Swift::UInt startingOnLine)
{
  Swift::String v2;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String v5;
  Swift::String result;

  v2._countAndFlagsBits = 2105376;
  v2._object = (void *)0xE300000000000000;
  v5 = String.prefixingEachLine(with:startingOnLine:)(v2, startingOnLine);
  object = v5._object;
  countAndFlagsBits = v5._countAndFlagsBits;
  result._object = object;
  result._countAndFlagsBits = countAndFlagsBits;
  return result;
}

Swift::String __swiftcall String.uv_deletingTrailing(suffix:)(Swift::String suffix)
{
  void *object;
  uint64_t countAndFlagsBits;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String result;

  object = suffix._object;
  countAndFlagsBits = suffix._countAndFlagsBits;
  v3 = sub_2448EACA4();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = sub_2448CCB54(countAndFlagsBits, (unint64_t)object, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
    goto LABEL_5;
  v11 = sub_2448EAC2C();
  v12 = -(uint64_t)v11;
  if (__OFSUB__(0, v11))
  {
    __break(1u);
    goto LABEL_7;
  }
  v11 = sub_2448EB568();
  if (v11 >> 14 < v3 >> 14)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v3 = sub_2448EB580();
  v5 = v13;
  v7 = v14;
  v16 = v15;
  swift_bridgeObjectRelease();
  v9 = v16;
LABEL_5:
  v17 = MEMORY[0x2495192FC](v3, v5, v7, v9);
  v19 = v18;
  swift_bridgeObjectRelease();
  v11 = v17;
  v12 = v19;
LABEL_8:
  result._object = (void *)v12;
  result._countAndFlagsBits = v11;
  return result;
}

unint64_t Substring.uv_deletingTrailing(suffix:)(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  char v8;
  unint64_t result;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_2448CCB54(a1, a2, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    return a3;
  }
  result = sub_2448EAC2C();
  if (__OFSUB__(0, result))
  {
    __break(1u);
  }
  else
  {
    result = sub_2448EB568();
    if (result >> 14 >= a3 >> 14)
      return sub_2448EB580();
  }
  __break(1u);
  return result;
}

uint64_t Substring.uv_deletingLeading(prefix:)(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (sub_2448CC9C0(a1, a2, a3, a4))
  {
    sub_2448EAC2C();
    if (a4 >> 14 >= (unint64_t)sub_2448EB568() >> 14)
      return sub_2448EB580();
    __break(1u);
  }
  result = a3;
  if (a4 >> 14 >= a3 >> 14)
    return sub_2448EB580();
  __break(1u);
  return result;
}

Swift::String __swiftcall String.unquoted()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  char v18;
  Swift::String result;

  v2 = v1;
  v3 = v0;
  if (sub_2448EAC80() == 34 && v4 == 0xE100000000000000)
    goto LABEL_8;
  v6 = sub_2448EBBEC();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    goto LABEL_9;
  if (sub_2448EAC80() == 10322146 && v7 == 0xA300000000000000)
  {
LABEL_8:
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = sub_2448EBBEC();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
      goto LABEL_23;
  }
LABEL_9:
  sub_2448EAB90();
  if (sub_2448EAC80() == 34 && v8 == 0xE100000000000000)
    goto LABEL_16;
  v10 = sub_2448EBBEC();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    sub_2448EAB90();
    if (sub_2448EAC80() == 10322146 && v11 == 0xA300000000000000)
    {
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    v18 = sub_2448EBBEC();
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
      goto LABEL_17;
LABEL_23:
    swift_bridgeObjectRetain();
    goto LABEL_19;
  }
LABEL_17:
  v12 = sub_2448EAB84();
  v13 = sub_2448EAB90();
  if (v13 >> 14 < v12 >> 14)
  {
    __break(1u);
    goto LABEL_25;
  }
  v15 = sub_2448EACA4();
  v3 = MEMORY[0x2495192FC](v15);
  v2 = v16;
  swift_bridgeObjectRelease();
LABEL_19:
  v13 = v3;
  v14 = v2;
LABEL_25:
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

void sub_2448CAE7C()
{
  off_2573916D8 = &unk_25157DEB8;
}

uint64_t sub_2448CAE90(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573916F8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = a1;
  v44 = a2;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1;
  v8 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v8 = 11;
  v38 = v8 | (v7 << 16);
  v9 = sub_2448EA56C();
  v10 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v9 - 8) + 56);
  swift_bridgeObjectRetain();
  v32 = 0;
  v37 = 15;
  v36 = 0x80000002448FD7C0;
  v11 = MEMORY[0x24BEE0D00];
  v34 = v9;
  v35 = 0x80000002448FD7E0;
  v33 = v10;
  while (1)
  {
    v41 = a1;
    v42 = a2;
    v39 = 0xD000000000000018;
    v40 = v36;
    v10(v6, 1, 1, v9);
    sub_2447D0980();
    swift_bridgeObjectRetain();
    v12 = sub_2448EB5EC();
    v14 = v13;
    sub_2448CD57C((uint64_t)v6);
    swift_bridgeObjectRelease();
    result = v43;
    if ((v14 & 1) != 0)
      return result;
    v41 = v43;
    v42 = v44;
    v39 = 0xD000000000000011;
    v40 = v35;
    v10(v6, 1, 1, v9);
    swift_bridgeObjectRetain();
    v16 = v11;
    sub_2448EB5EC();
    v18 = v17;
    sub_2448CD57C((uint64_t)v6);
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
      goto LABEL_7;
    swift_bridgeObjectRetain();
    v19 = sub_2448EACA4();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    swift_bridgeObjectRelease();
    if (!((v19 ^ v21) >> 14))
    {
      swift_bridgeObjectRelease();
LABEL_7:
      v11 = v16;
      goto LABEL_8;
    }
    if ((v25 & 0x1000000000000000) != 0)
    {
      v23 = sub_2448CC650(v19, v21, v23, v25, 16);
      swift_bridgeObjectRelease();
      v11 = v16;
      if ((v23 & 0x100000000) != 0)
        goto LABEL_8;
LABEL_18:
      if (WORD1(v23) > 0x10u || (v23 & 0xFFFFF800) == 0xD800)
        goto LABEL_8;
      v41 = 0;
      v42 = 0xE000000000000000;
      sub_2448EBD84();
      sub_2448CD600();
      sub_2448EAB24();
      result = swift_bridgeObjectRelease();
      a1 = v43;
      a2 = v44;
      v30 = HIBYTE(v44) & 0xF;
      if ((v44 & 0x2000000000000000) == 0)
        v30 = v43 & 0xFFFFFFFFFFFFLL;
      v31 = 7;
      if (((v44 >> 60) & ((v43 & 0x800000000000000) == 0)) != 0)
        v31 = 11;
      v37 = v12;
      v38 = v31 | (v30 << 16);
      v10 = v33;
      v9 = v34;
      if (4 * v30 < v12 >> 14)
      {
        __break(1u);
        return result;
      }
    }
    else
    {
      if ((v25 & 0x2000000000000000) != 0)
      {
        v41 = v23;
        v42 = v25 & 0xFFFFFFFFFFFFFFLL;
        v26 = &v41;
      }
      else if ((v23 & 0x1000000000000000) != 0)
      {
        v26 = (_QWORD *)((v25 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else
      {
        v26 = (_QWORD *)sub_2448EB820();
      }
      v27 = v32;
      v28 = sub_2448CD770((uint64_t)v26, v19, v21, v23, v25, 16);
      LODWORD(v23) = v28;
      v32 = v27;
      LOBYTE(v39) = BYTE4(v28) & 1;
      v29 = BYTE4(v28) & 1;
      swift_bridgeObjectRelease();
      v11 = v16;
      if ((v29 & 1) == 0)
        goto LABEL_18;
LABEL_8:
      a1 = v43;
      a2 = v44;
      v10 = v33;
      v9 = v34;
    }
  }
}

Swift::String __swiftcall String.unescaped()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  Swift::String result;

  v2 = v1;
  v3 = v0;
  if (qword_257389DE8 != -1)
    swift_once();
  v4 = (char *)off_2573916D8;
  v5 = *((_QWORD *)off_2573916D8 + 2);
  if (v5)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_2447D0980();
    v6 = v4 + 56;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v3 = sub_2448EB5E0();
      v8 = v7;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v2 = v8;
      v6 += 32;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v9 = sub_2448CAE90(v3, v2);
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = v9;
  v13 = v11;
  result._object = v13;
  result._countAndFlagsBits = v12;
  return result;
}

Swift::String __swiftcall String.escapedAndQuotedString()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  sub_2448EABC0();
  sub_2448EABC0();
  v0 = 34;
  v1 = (void *)0xE100000000000000;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::String __swiftcall String.quotedCompilerArgumentAndEscaping()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  sub_2447D0980();
  sub_2448EB5E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2448EB5E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2448EB5E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257391700);
  swift_arrayDestroy();
  sub_2448EABC0();
  swift_bridgeObjectRelease();
  sub_2448EABC0();
  v0 = 34;
  v1 = (void *)0xE100000000000000;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

BOOL static String.PaddingPosition.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t String.PaddingPosition.hash(into:)()
{
  return sub_2448EBD0C();
}

uint64_t String.PaddingPosition.hashValue.getter()
{
  sub_2448EBD00();
  sub_2448EBD0C();
  return sub_2448EBD3C();
}

uint64_t String.padded(toAtLeastLength:withPad:position:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;

  if (sub_2448EAB78() >= a1)
  {
    swift_bridgeObjectRetain();
    return a5;
  }
  result = sub_2448EAB78();
  v11 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_15;
  }
  result = sub_2448EAB78();
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v11 == 0x8000000000000000 && result == -1)
    goto LABEL_17;
  v12 = v11 / result;
  if (!(v11 % result) || (v13 = __OFADD__(v12, 1), ++v12, !v13))
  {
    swift_bridgeObjectRetain();
    v14 = MEMORY[0x249519458](a2, a3, v12);
    if ((a4 & 1) != 0)
      v15 = a5;
    else
      v15 = v14;
    swift_bridgeObjectRetain();
    sub_2448EABC0();
    swift_bridgeObjectRelease();
    return v15;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_2448CB7BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257391728);
  sub_2448CDC08();
  v2 = sub_2448EA9A4();
  v4 = v3;
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_2448CB840@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738C210);
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE4260];
  *(_OWORD *)(v4 + 16) = xmmword_2448ECF10;
  v6 = MEMORY[0x24BEE42B0];
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = v6;
  *(_BYTE *)(v4 + 32) = v3;
  result = sub_2448EAAB8();
  *a2 = result;
  a2[1] = v8;
  return result;
}

Swift::String __swiftcall String.uv_escapingForRegex()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;
  uint64_t v3;
  void *v4;

  sub_2448CD5BC();
  sub_2448CD600();
  sub_2448EB2EC();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  sub_2448EB2EC();
  swift_bridgeObjectRelease();
  v0 = v3;
  v1 = v4;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

void NSString.uv_sha256.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  unint64_t v4;
  unint64_t v5;

  v1 = sub_2448EA7B8();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_2448EA7AC();
  MEMORY[0x24BDAC7A8](v2);
  v3 = objc_msgSend(v0, sel_dataUsingEncoding_, 4);
  if (v3 || (v3 = objc_msgSend(v0, sel_dataUsingEncoding_, 1)) != 0)
  {
    sub_2448EA47C();
    v5 = v4;

  }
  else
  {
    v5 = 0xC000000000000000;
  }
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16A8]), sel_init);
  sub_2448CD468();
  sub_2448EA794();
  __asm { BR              X10 }
}

uint64_t sub_2448CBFFC(uint64_t result, char *a2)
{
  char *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (char *)result;
  if (result)
  {
    if (a2)
      goto LABEL_6;
  }
  else
  {
    if (!a2)
      return result;
    v3 = 0;
  }
  do
  {
    do
    {
      v4 = *v3++;
      sub_2447FDA40();
      v5 = (void *)sub_2448EB49C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25738C210);
      v6 = swift_allocObject();
      v7 = MEMORY[0x24BEE4260];
      *(_OWORD *)(v6 + 16) = xmmword_2448ECF10;
      v8 = MEMORY[0x24BEE42B0];
      *(_QWORD *)(v6 + 56) = v7;
      *(_QWORD *)(v6 + 64) = v8;
      *(_BYTE *)(v6 + 32) = v4;
      sub_2448EB3B8();

      result = swift_bridgeObjectRelease();
    }
    while (!a2);
LABEL_6:
    ;
  }
  while (v3 != a2);
  return result;
}

Swift::String __swiftcall Substring.uv_escapingForRegex()()
{
  Swift::String v0;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String result;

  MEMORY[0x2495192FC]();
  v0 = String.uv_escapingForRegex()();
  swift_bridgeObjectRelease();
  countAndFlagsBits = v0._countAndFlagsBits;
  object = v0._object;
  result._object = object;
  result._countAndFlagsBits = countAndFlagsBits;
  return result;
}

_QWORD *sub_2448CC130(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738A140);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2448CC194()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2448EACA4();
  v4 = sub_2448CC210(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2448CC210(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_2448CC354(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_2448CC130(v9, 0);
      v12 = sub_2448CC440((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x249519338](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x249519338);
LABEL_9:
      sub_2448EB820();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x249519338]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_2448CC354(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_2448852EC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_2448852EC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_2448EAC14();
  }
  __break(1u);
  return result;
}

unint64_t sub_2448CC440(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_2448852EC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_2448EAC20();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_2448EB820();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_2448852EC(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_2448EABF0();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_2448CC650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_2448CDB94();
  swift_bridgeObjectRetain();
  v7 = sub_2448EAC98();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_2448CC194();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_2448EB820();
  }
LABEL_7:
  v13 = sub_2448CC740(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

unsigned __int8 *sub_2448CC740(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL sub_2448CC9C0(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;

  v5 = a4 >> 14;
  swift_bridgeObjectRetain();
  if (v5 == a3 >> 14)
  {
LABEL_10:
    sub_2448EABD8();
    v14 = v13;
    swift_bridgeObjectRelease();
    v15 = v14 == 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      while (1)
      {
        v7 = sub_2448EB574();
        v9 = v8;
        v10 = sub_2448EB550();
        v11 = sub_2448EABD8();
        if (!v12)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v15 = 1;
          goto LABEL_13;
        }
        if (v7 != v11 || v12 != v9)
          break;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v5 == v10 >> 14)
        {
LABEL_9:
          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
      }
      v6 = sub_2448EBBEC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
        break;
      if (v5 == v10 >> 14)
        goto LABEL_9;
    }
    swift_bridgeObjectRelease();
    v15 = 0;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_2448CCB54(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v24;

  if ((a2 & 0x2000000000000000) != 0)
    v5 = HIBYTE(a2) & 0xF;
  else
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  v6 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v6 = 11;
  v7 = v6 | (v5 << 16);
  v8 = a3 >> 14;
  swift_bridgeObjectRetain();
  v24 = v8;
  if (v8 != a4 >> 14)
  {
    swift_bridgeObjectRetain();
    v9 = sub_2448EB55C();
    v10 = sub_2448EB574();
    v12 = v11;
    if (!v5)
    {
LABEL_22:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v22 = 1;
      goto LABEL_21;
    }
    v13 = v10;
    v7 = sub_2448EAB90();
    if (v13 == sub_2448EAC80() && v12 == v14)
      goto LABEL_13;
LABEL_14:
    v16 = sub_2448EBBEC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      v22 = 0;
      goto LABEL_21;
    }
    while (v24 != v9 >> 14)
    {
      v9 = sub_2448EB55C();
      v17 = sub_2448EB574();
      v19 = v18;
      if (v7 < 0x4000)
        goto LABEL_22;
      v20 = v17;
      v7 = sub_2448EAB90();
      if (v20 != sub_2448EAC80() || v19 != v21)
        goto LABEL_14;
LABEL_13:
      swift_bridgeObjectRelease_n();
    }
    swift_bridgeObjectRelease();
  }
  if (v7 < 0x4000)
  {
    v22 = 1;
  }
  else
  {
    sub_2448EAB90();
    sub_2448EAC80();
    swift_bridgeObjectRelease();
    v22 = 0;
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return v22;
}

unint64_t sub_2448CCDB8(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_2448CCE54(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_2448CCEC0(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_2448CCE54(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_2448852EC(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_2448CCEC0(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v10 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          v5 = v10;
        }
        return v5 << 16;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 != (a2 & 0xFFFFFFFFFFFFLL))
        {
          do
LABEL_9:
            v7 = *(_BYTE *)(v6 + v5--) & 0xC0;
          while (v7 == 128);
          ++v5;
        }
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_2448EB820();
        v5 = v12;
        if (v12 != v9)
          goto LABEL_9;
      }
      return v5 << 16;
    }
    v8 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v8 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v8)
      return sub_2448EB784();
  }
  return result;
}

unint64_t sub_2448CCFC0(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_2448CD33C(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_2448CCEC0(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_2448CD05C(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unint64_t v7;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t result;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unsigned int v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;

  v7 = a3;
  v10 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v10) = 1;
  v11 = 4 << v10;
  if ((a3 & 0xC) == 4 << v10)
LABEL_55:
    v7 = sub_2448852EC(v7, a4, a5);
  v12 = a1;
  if ((a1 & 0xC) == v11)
    v12 = sub_2448852EC(a1, a4, a5);
  result = sub_2448CCDB8(a1, a4, a5);
  v7 >>= 14;
  if (a2 < 0)
  {
    v11 = 0;
    a1 = v12 >> 14;
    v20 = (char *)&v28 + 6;
    while (a1 < v7 || v7 < result >> 14)
    {
      if (result < 0x10000)
      {
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
      if ((a5 & 0x1000000000000000) != 0)
      {
        v27 = v20;
        result = sub_2448EAB3C();
        v20 = v27;
      }
      else
      {
        v21 = result >> 16;
        if ((a5 & 0x2000000000000000) != 0)
        {
          v29 = a4;
          v30 = a5 & 0xFFFFFFFFFFFFFFLL;
          if ((*((_BYTE *)&v29 + v21 - 1) & 0xC0) == 0x80)
          {
            v24 = 0;
            do
              v25 = v20[v21 + v24--] & 0xC0;
            while (v25 == 128);
            v26 = 1 - v24;
          }
          else
          {
            v26 = 1;
          }
          v21 -= v26;
        }
        else
        {
          v22 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a4 & 0x1000000000000000) == 0)
          {
            v28 = v20;
            v22 = sub_2448EB820();
            v20 = v28;
          }
          do
            v23 = *(_BYTE *)(v22 - 1 + v21--) & 0xC0;
          while (v23 == 128);
        }
        result = (v21 << 16) | 5;
      }
      if (--v11 <= a2)
      {
        if (a1 < v7 || result >> 14 >= v7)
          return result;
        return 0;
      }
    }
    return 0;
  }
  a1 = v12 >> 14;
  if (a2)
  {
    if ((a5 & 0x2000000000000000) != 0)
      v14 = HIBYTE(a5) & 0xF;
    else
      v14 = a4 & 0xFFFFFFFFFFFFLL;
    v11 = a5 & 0xFFFFFFFFFFFFFFLL;
    while (v7 < a1 || result >> 14 < v7)
    {
      v15 = result >> 16;
      if (result >> 16 >= v14)
      {
        __break(1u);
        goto LABEL_54;
      }
      if ((a5 & 0x1000000000000000) != 0)
      {
        result = sub_2448EAB30();
        if (!--a2)
          goto LABEL_26;
      }
      else
      {
        if ((a5 & 0x2000000000000000) != 0)
        {
          v29 = a4;
          v30 = a5 & 0xFFFFFFFFFFFFFFLL;
          v17 = *((unsigned __int8 *)&v29 + v15);
        }
        else
        {
          v16 = (a5 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a4 & 0x1000000000000000) == 0)
            v16 = sub_2448EB820();
          v17 = *(unsigned __int8 *)(v16 + v15);
        }
        v18 = (char)v17;
        v19 = __clz(v17 ^ 0xFF) - 24;
        if (v18 >= 0)
          LOBYTE(v19) = 1;
        result = ((v15 + v19) << 16) | 5;
        if (!--a2)
          goto LABEL_26;
      }
    }
    return 0;
  }
LABEL_26:
  if (v7 >= a1 && v7 < result >> 14)
    return 0;
  return result;
}

unint64_t sub_2448CD33C(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_2448852EC(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_2448CD3A8(unint64_t result)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  if (result)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      v2 = *v1;
      v3 = v1[1];
      v4 = HIBYTE(v3) & 0xF;
      if ((v3 & 0x2000000000000000) == 0)
        v4 = *v1;
      v5 = 7;
      if (((v3 >> 60) & ((v2 & 0x800000000000000) == 0)) != 0)
        v5 = 11;
      result = sub_2448CD05C(0xFuLL, result, v5 | (v4 << 16), v2, v3);
      if ((v6 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_257391740);
        sub_2447EB714(qword_257391748, &qword_257391740, MEMORY[0x24BEE2AB0]);
        return sub_2448EAB48();
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_2448CD468()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573916E0;
  if (!qword_2573916E0)
  {
    v1 = sub_2448EA7B8();
    result = MEMORY[0x24951AC70](MEMORY[0x24BDC6AE8], v1);
    atomic_store(result, (unint64_t *)&qword_2573916E0);
  }
  return result;
}

uint64_t sub_2448CD4B0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_2448EA2A8();
  if (!result || (result = sub_2448EA2CC(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_2448EA2C0();
      sub_2448EA7B8();
      sub_2448CD468();
      return sub_2448EA77C();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2448CD55C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_2448C9CB8(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_2448CD57C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573916F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2448CD5BC()
{
  unint64_t result;

  result = qword_257391708;
  if (!qword_257391708)
  {
    result = MEMORY[0x24951AC70](MEMORY[0x24BEE0D48], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257391708);
  }
  return result;
}

unint64_t sub_2448CD600()
{
  unint64_t result;

  result = qword_257391710;
  if (!qword_257391710)
  {
    result = MEMORY[0x24951AC70](MEMORY[0x24BEE0D40], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257391710);
  }
  return result;
}

uint64_t sub_2448CD644(uint64_t a1, char *a2)
{
  return sub_2448CBFFC(a1, a2);
}

unint64_t sub_2448CD660()
{
  unint64_t result;

  result = qword_257391718;
  if (!qword_257391718)
  {
    result = MEMORY[0x24951AC70](&protocol conformance descriptor for String.PaddingPosition, &type metadata for String.PaddingPosition);
    atomic_store(result, (unint64_t *)&qword_257391718);
  }
  return result;
}

uint64_t _s15PaddingPositionOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2448CD6F0 + 4 * byte_2448F7C25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2448CD724 + 4 * byte_2448F7C20[v4]))();
}

uint64_t sub_2448CD724(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2448CD72C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2448CD734);
  return result;
}

uint64_t sub_2448CD740(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2448CD748);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2448CD74C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2448CD754(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for String.PaddingPosition()
{
  return &type metadata for String.PaddingPosition;
}

uint64_t sub_2448CD770(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  unsigned int v29;
  unsigned __int8 v30;
  unint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_2448852EC(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_104;
  result = sub_2448EAC14();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_2448852EC(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_2448852EC(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_100;
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  result = sub_2448EAC14();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v34 = a6 + 55;
        }
        else
        {
          v33 = 97;
          v34 = 65;
        }
        if (a6 <= 10)
          v35 = a6 + 48;
        else
          v35 = 58;
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                v30 = 1;
                if (v38 < 0x61 || v38 >= v33)
                  return v29 | ((unint64_t)v30 << 32);
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            v40 = v24 * (unint64_t)a6;
            if ((v40 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_96;
            v41 = v38 + v39;
            v24 = v40 + v41;
            if (__CFADD__((_DWORD)v40, v41))
              goto LABEL_96;
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          v30 = 0;
          v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 87;
      if (a6 > 10)
      {
        v43 = a6 + 55;
      }
      else
      {
        v42 = 97;
        v43 = 65;
      }
      if (a6 <= 10)
        v44 = a6 + 48;
      else
        v44 = 58;
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              v30 = 1;
              if (v45 < 0x61 || v45 >= v42)
                return v29 | ((unint64_t)v30 << 32);
              v46 = -87;
            }
            else
            {
              v46 = -55;
            }
          }
          else
          {
            v46 = -48;
          }
          v47 = v24 * (unint64_t)a6;
          if ((v47 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_96;
          v48 = v45 + v46;
          v24 = v47 + v48;
          if (__CFADD__((_DWORD)v47, v48))
            goto LABEL_96;
          ++v19;
          if (!--result)
            goto LABEL_94;
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    v29 = 0;
    v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 87;
      if (a6 > 10)
      {
        v22 = a6 + 55;
      }
      else
      {
        v21 = 97;
        v22 = 65;
      }
      if (a6 <= 10)
        v23 = a6 + 48;
      else
        v23 = 58;
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              v30 = 1;
              if (v27 < 0x61 || v27 >= v21)
                return v29 | ((unint64_t)v30 << 32);
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v31 = v24 * (unint64_t)a6;
          if ((v31 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_96;
          v32 = v27 + v28;
          v24 = v31 - v32;
          if (v31 < v32)
            goto LABEL_96;
          ++v25;
          if (!--v26)
            goto LABEL_94;
        }
      }
LABEL_95:
      v29 = 0;
      v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

unint64_t sub_2448CDB94()
{
  unint64_t result;

  result = qword_257391720;
  if (!qword_257391720)
  {
    result = MEMORY[0x24951AC70](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_257391720);
  }
  return result;
}

uint64_t sub_2448CDBD8()
{
  return sub_2448EA254() & 1;
}

unint64_t sub_2448CDC08()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257391730;
  if (!qword_257391730)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257391728);
    v2 = sub_2448CDC6C();
    result = MEMORY[0x24951AC70](MEMORY[0x24BEE2B38], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257391730);
  }
  return result;
}

unint64_t sub_2448CDC6C()
{
  unint64_t result;

  result = qword_257391738;
  if (!qword_257391738)
  {
    result = MEMORY[0x24951AC70](MEMORY[0x24BEE0F90], MEMORY[0x24BEE0F88]);
    atomic_store(result, (unint64_t *)&qword_257391738);
  }
  return result;
}

uint64_t sub_2448CDCB0(_QWORD *a1)
{
  return sub_244806DE4(a1) & 1;
}

uint64_t Sequence.firstMap<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_2448EB7CC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - v2;
  sub_2448EACEC();
  MEMORY[0x24951AC70](MEMORY[0x24BEE25A0], v0);
  v4 = sub_2448EACE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = v4;
  v5 = sub_2448EAEE4();
  MEMORY[0x24951AC70](MEMORY[0x24BEE12E0], v5);
  sub_2448EB250();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2448CDDF0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t result;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_2448EB508();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x24BDAC7A8](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_2448EACBC();
  v57 = sub_2448EA7D0();
  v53 = sub_2448EB8C8();
  sub_2448EB880();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_2448EACB0();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_2448EB58C();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      sub_2448EB8B0();
      if (!--v31)
      {
        v34 = v49;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v34 = v49;
LABEL_9:
  sub_2448EB58C();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36 = v38;
    v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      sub_2448EB8B0();
      sub_2448EB58C();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t Sequence.keyedMap<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD v18[10];
  uint64_t v19;
  uint64_t v20;

  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = a7;
  v18[7] = a1;
  v18[8] = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A0A8);
  result = sub_2448CDDF0((void (*)(char *, char *))sub_2448CE798, (uint64_t)v18, a3, TupleTypeMetadata2, v11, a6, MEMORY[0x24BEE3F20], (uint64_t)&v19);
  if (!v7)
  {
    v13 = result;
    v14 = sub_2448EA8B4();
    v19 = v13;
    v15 = sub_2448EAEE4();
    v16 = MEMORY[0x24951AC70](&protocol conformance descriptor for [A : B], v14);
    v17 = (char *)MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v15);
    KeyValueMap.init<A>(_:)((uint64_t)&v19, v14, v15, v16, v17, (uint64_t)&v20);
    return v20;
  }
  return result;
}

uint64_t Sequence.compactKeyedMap<A, B>(_:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  swift_getTupleTypeMetadata2();
  result = sub_2448EACE0();
  if (!v0)
  {
    v2 = result;
    v3 = sub_2448EA8B4();
    v7 = v2;
    v4 = sub_2448EAEE4();
    v5 = MEMORY[0x24951AC70](&protocol conformance descriptor for [A : B], v3);
    v6 = (char *)MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v4);
    KeyValueMap.init<A>(_:)((uint64_t)&v7, v3, v4, v5, v6, (uint64_t)&v8);
    return v8;
  }
  return result;
}

void Sequence.orderedKeyedMap<A, B>(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _OWORD *a8@<X8>)
{
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD v20[10];
  uint64_t v21;

  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a1;
  v20[8] = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A0A8);
  v17 = sub_2448CDDF0((void (*)(char *, char *))sub_2448CE798, (uint64_t)v20, a3, TupleTypeMetadata2, v16, a6, MEMORY[0x24BEE3F20], (uint64_t)&v21);
  if (!v8)
  {
    v21 = v17;
    v18 = sub_2448EAEE4();
    v19 = (char *)MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v18);
    OrderedDictionary.init<A>(_:)((uint64_t)&v21, a4, a5, v18, a7, v19, a8);
  }
}

void Sequence.coiterate<A>(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v21 = a5;
  v12 = *(_QWORD *)(a3 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)&v20 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, v6, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a1, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a6, v19, a2);
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = v21;
  type metadata accessor for Coiteration();
}

uint64_t sub_2448CE760(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

uint64_t sub_2448CE798@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2448D0724(a1, a2, a3);
}

uint64_t Sequence.identified<A>(by:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v6[8];

  v4 = *a1;
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a4;
  v6[5] = a1;
  return Sequence.keyedMap<A, B>(_:)((uint64_t)sub_2448D06BC, (uint64_t)v6, a2, *(_QWORD *)(v4 + *MEMORY[0x24BEE46A8] + 8), *(_QWORD *)(v4 + *MEMORY[0x24BEE46A8]), a3, a4);
}

void Sequence.orderedKeyedMap<A, B>(_:uniquingKeysWith:)(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(char *, char *)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>, uint64_t a10)
{
  uint64_t v10;
  uint64_t TupleTypeMetadata2;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _BYTE v23[16];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = a1;
  v30 = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A0A8);
  v18 = sub_2448CDDF0((void (*)(char *, char *))sub_2448CE798, (uint64_t)v23, a5, TupleTypeMetadata2, v17, a8, MEMORY[0x24BEE3F20], (uint64_t)&v31);
  if (!v10)
  {
    v31 = v18;
    v19 = sub_2448EAEE4();
    v20 = (char *)MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v19);
    OrderedDictionary.init<A>(_:uniquingKeysWith:)((uint64_t)&v31, a3, a4, a6, a7, v19, a10, v20, a9);
  }
}

uint64_t Sequence.groupElements<A, B>(using:)(void (*a1)(char *, char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int (*a6)(char *, uint64_t, uint64_t), uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t AssociatedTypeWitness;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t AssociatedConformanceWitness;
  char *v41;
  char *v42;
  char *v43;
  void (*v45)(char *, char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  void (*v75)(char *, char *, char *);
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;

  v78 = a7;
  v73 = a6;
  v74 = a3;
  v75 = a1;
  v76 = a2;
  v9 = sub_2448EAEE4();
  v10 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v9);
  v72 = v9;
  v12 = type metadata accessor for Inhabited(255, v9, v10, v11);
  v65 = sub_2448EB508();
  v64 = *(_QWORD *)(v65 - 8);
  v13 = MEMORY[0x24BDAC7A8](v65);
  v71 = (uint64_t)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v59 - v16;
  v18 = *(_QWORD *)(v12 - 8);
  v19 = MEMORY[0x24BDAC7A8](v15);
  v63 = (char *)&v59 - v20;
  v82 = a5;
  v21 = *(_QWORD *)(a5 - 8);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v62 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v59 - v25;
  v83 = *(_QWORD *)(a4 - 8);
  v27 = MEMORY[0x24BDAC7A8](v24);
  v70 = (char *)&v59 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v59 - v29;
  v31 = v74;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v79 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v77 = (char *)&v59 - v33;
  v34 = sub_2448EB508();
  v35 = MEMORY[0x24BDAC7A8](v34);
  v84 = (char *)&v59 - v36;
  v68 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v59 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = swift_getAssociatedTypeWitness();
  v60 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v80 = (char *)&v59 - v39;
  v85 = sub_2448EA7C4();
  (*(void (**)(char *, _QWORD, uint64_t))(v68 + 16))(v38, v69, v31);
  sub_2448EACB0();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v41 = v84;
  v74 = AssociatedConformanceWitness;
  sub_2448EB58C();
  v42 = v41;
  v43 = v77;
  v73 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48);
  if (v73(v42, 1, AssociatedTypeWitness) != 1)
  {
    v45 = *(void (**)(char *, char *, uint64_t))(v79 + 32);
    v68 = v21;
    v69 = v45;
    v66 = AssociatedTypeWitness;
    v67 = v26;
    v61 = v17;
    v45(v43, v42, AssociatedTypeWitness);
    while (1)
    {
      v75(v30, v26, v43);
      MEMORY[0x2495190C8](v30, v85, a4, v12, v78);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, v12) == 1)
      {
        (*(void (**)(char *, uint64_t))(v64 + 8))(v17, v65);
        (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v70, v30, a4);
        v46 = (uint64_t)v62;
        (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v62, v26, v82);
        v47 = sub_2448EAE54();
        v48 = v72;
        v49 = MEMORY[0x24951AC70](MEMORY[0x24BEE12E8], v72);
        v50 = v71;
        v51 = v48;
        v26 = v67;
        Inhabited<>.init(_:otherElements:)(v46, v47, v51, v49, v71);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v50, 0, 1, v12);
        v52 = v66;
        sub_2448EA8B4();
        v17 = v61;
        v21 = v68;
        v43 = v77;
        sub_2448EA8F0();
      }
      else
      {
        v54 = v63;
        (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v63, v17, v12);
        v55 = MEMORY[0x24951AC70](MEMORY[0x24BEE12E8], v72);
        Inhabited<>.append(_:)((uint64_t)v26, v12, v55, v56);
        (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v70, v30, a4);
        v57 = v71;
        (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(v71, v54, v12);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v57, 0, 1, v12);
        v43 = v77;
        sub_2448EA8B4();
        v52 = v66;
        v26 = v67;
        sub_2448EA8F0();
        v58 = v54;
        v21 = v68;
        (*(void (**)(char *, uint64_t))(v18 + 8))(v58, v12);
      }
      (*(void (**)(char *, uint64_t))(v21 + 8))(v26, v82);
      (*(void (**)(char *, uint64_t))(v83 + 8))(v30, a4);
      (*(void (**)(char *, uint64_t))(v79 + 8))(v43, v52);
      sub_2448EB58C();
      v53 = v84;
      if (v73(v84, 1, v52) == 1)
        break;
      v69(v43, v53, v52);
    }
  }
  (*(void (**)(char *, uint64_t))(v60 + 8))(v80, v81);
  return v85;
}

uint64_t Sequence.groupElements<A, B>(using:)(void (*a1)(char *, char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *, uint64_t), uint64_t a7)
{
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t AssociatedTypeWitness;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t AssociatedConformanceWitness;
  char *v43;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, char *, char *);
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;

  v66 = a1;
  v72 = a7;
  v67 = a2;
  v10 = sub_2448EAEE4();
  v11 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v10);
  v58 = v10;
  v13 = type metadata accessor for Inhabited(255, v10, v11, v12);
  v14 = sub_2448EB508();
  v56 = *(_QWORD *)(v14 - 8);
  v57 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v63 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v73 = (char *)&v54 - v18;
  v19 = *(_QWORD *)(v13 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v55 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v54 - v23;
  v25 = *(_QWORD *)(a4 - 8);
  v26 = MEMORY[0x24BDAC7A8](v22);
  v62 = (char *)&v54 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v54 - v28;
  v61 = a6;
  v30 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v69 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v33 = (char *)&v54 - v32;
  v34 = sub_2448EB508();
  v35 = MEMORY[0x24BDAC7A8](v34);
  v68 = (char *)&v54 - v36;
  v64 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v54 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v39;
  v71 = swift_getAssociatedTypeWitness();
  v54 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v70 = (char *)&v54 - v41;
  v74 = sub_2448EA7C4();
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v38, v65, v40);
  v60 = v40;
  sub_2448EACB0();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v43 = v68;
  v65 = AssociatedConformanceWitness;
  sub_2448EB58C();
  v64 = *(_QWORD *)(v69 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v64)(v43, 1, AssociatedTypeWitness) != 1)
  {
    v45 = *(void (**)(char *, char *, uint64_t))(v69 + 32);
    v60 = v25;
    v61 = v45;
    v59 = v33;
    v45(v33, v43, AssociatedTypeWitness);
    while (1)
    {
      v66(v29, v24, v33);
      v49 = v73;
      MEMORY[0x2495190C8](v29, v74, a4, v13, v72);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v49, 1, v13) == 1)
      {
        (*(void (**)(char *, uint64_t))(v56 + 8))(v73, v57);
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v62, v29, a4);
        v46 = v63;
        (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v63, v24, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v46, 0, 1, v13);
        sub_2448EA8B4();
        v25 = v60;
        sub_2448EA8F0();
        v47 = *(void (**)(char *, uint64_t))(v19 + 8);
      }
      else
      {
        v50 = v55;
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v55, v73, v13);
        v51 = MEMORY[0x24951AC70](MEMORY[0x24BEE12E8], v58);
        v52 = MEMORY[0x24951AC70](&protocol conformance descriptor for Inhabited<A>, v13);
        Inhabited<>.append<A>(contentsOf:)((uint64_t)v24, v13, v13, v51, v52);
        (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v62, v29, a4);
        v53 = v63;
        (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v63, v50, v13);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v53, 0, 1, v13);
        sub_2448EA8B4();
        v25 = v60;
        sub_2448EA8F0();
        v47 = *(void (**)(char *, uint64_t))(v19 + 8);
        v47(v50, v13);
      }
      v33 = v59;
      v47(v24, v13);
      (*(void (**)(char *, uint64_t))(v25 + 8))(v29, a4);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v33, AssociatedTypeWitness);
      v48 = v68;
      sub_2448EB58C();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v64)(v48, 1, AssociatedTypeWitness) == 1)
        break;
      v61(v33, v48, AssociatedTypeWitness);
    }
  }
  (*(void (**)(char *, uint64_t))(v54 + 8))(v70, v71);
  return v74;
}

uint64_t Sequence.compactGroupElements<A, B>(_:)(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *, uint64_t), uint64_t a7)
{
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
  uint64_t TupleTypeMetadata2;
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
  char *v33;
  uint64_t v34;
  uint64_t AssociatedTypeWitness;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t);
  uint64_t AssociatedConformanceWitness;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(char *);
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;

  v93 = a7;
  v101 = a1;
  v102 = a2;
  v11 = sub_2448EAEE4();
  v12 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v11);
  v90 = v11;
  v14 = type metadata accessor for Inhabited(255, v11, v12, v13);
  v81 = sub_2448EB508();
  v80 = *(_QWORD *)(v81 - 8);
  v15 = MEMORY[0x24BDAC7A8](v81);
  v89 = (uint64_t)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v98 = (char *)&v77 - v18;
  v96 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v79 = (char *)&v77 - v19;
  v20 = a4;
  v103 = a4;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v22 = sub_2448EB508();
  v91 = *(_QWORD *)(v22 - 8);
  v92 = v22;
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v77 - v24;
  v108 = a5;
  v99 = *(_QWORD *)(a5 - 8);
  v26 = MEMORY[0x24BDAC7A8](v23);
  v78 = (char *)&v77 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v107 = (uint64_t)&v77 - v29;
  v97 = *(_QWORD *)(v20 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v94 = (char *)&v77 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v77 - v32;
  v95 = a6;
  v34 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v36 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)&v77 - v37;
  v39 = sub_2448EB508();
  v40 = MEMORY[0x24BDAC7A8](v39);
  v42 = (char *)&v77 - v41;
  v100 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v44 = (char *)&v77 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = v45;
  v105 = swift_getAssociatedTypeWitness();
  v77 = *(_QWORD *)(v105 - 8);
  MEMORY[0x24BDAC7A8](v105);
  v104 = (char *)&v77 - v47;
  v109 = sub_2448EA7C4();
  v48 = *(void (**)(char *, uint64_t, uint64_t))(v100 + 16);
  v88 = v46;
  v48(v44, v106, v46);
  sub_2448EACB0();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_2448EB58C();
  v100 = *(_QWORD *)(v36 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v100)(v42, 1, AssociatedTypeWitness) != 1)
  {
    v95 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    v106 = v14;
    v88 = TupleTypeMetadata2;
    v86 = AssociatedTypeWitness;
    v85 = v36;
    v82 = AssociatedConformanceWitness;
    v87 = v33;
    v84 = v38;
    v83 = v42;
    v95(v38, v42, AssociatedTypeWitness);
    while (1)
    {
      v101(v38);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48))(v25, 1, TupleTypeMetadata2) == 1)
      {
        (*(void (**)(char *, uint64_t))(v36 + 8))(v38, AssociatedTypeWitness);
        (*(void (**)(char *, uint64_t))(v91 + 8))(v25, v92);
      }
      else
      {
        v51 = &v25[*(int *)(TupleTypeMetadata2 + 48)];
        v52 = v103;
        (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v33, v25, v103);
        v53 = v99;
        (*(void (**)(uint64_t, char *, uint64_t))(v99 + 32))(v107, v51, v108);
        v54 = v98;
        MEMORY[0x2495190C8](v33, v109, v52, v14, v93);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v96 + 48))(v54, 1, v14) == 1)
        {
          (*(void (**)(char *, uint64_t))(v80 + 8))(v98, v81);
          v55 = v97;
          v56 = v103;
          (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v94, v33, v103);
          v57 = v25;
          v58 = v78;
          (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v78, v107, v108);
          v59 = sub_2448EAE54();
          v60 = v90;
          v61 = MEMORY[0x24951AC70](MEMORY[0x24BEE12E8], v90);
          v62 = v89;
          v63 = (uint64_t)v58;
          v25 = v57;
          AssociatedTypeWitness = v86;
          v64 = v60;
          v14 = v106;
          Inhabited<>.init(_:otherElements:)(v63, v59, v64, v61, v89);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v96 + 56))(v62, 0, 1, v14);
          sub_2448EA8B4();
          TupleTypeMetadata2 = v88;
          sub_2448EA8F0();
          (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v107, v108);
          v65 = *(void (**)(char *, uint64_t))(v55 + 8);
          v36 = v85;
          v65(v33, v56);
        }
        else
        {
          v66 = v96;
          v67 = v79;
          (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v79, v98, v14);
          v68 = MEMORY[0x24951AC70](MEMORY[0x24BEE12E8], v90);
          v69 = v107;
          Inhabited<>.append(_:)(v107, v14, v68, v70);
          v71 = v97;
          v72 = v103;
          (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v94, v87, v103);
          v73 = v89;
          (*(void (**)(uint64_t, char *, uint64_t))(v66 + 16))(v89, v67, v106);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v66 + 56))(v73, 0, 1, v106);
          sub_2448EA8B4();
          v14 = v106;
          AssociatedTypeWitness = v86;
          sub_2448EA8F0();
          v74 = *(void (**)(char *, uint64_t))(v66 + 8);
          v33 = v87;
          v75 = v67;
          TupleTypeMetadata2 = v88;
          v74(v75, v14);
          v76 = v69;
          v36 = v85;
          (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v76, v108);
          (*(void (**)(char *, uint64_t))(v71 + 8))(v33, v72);
        }
        v38 = v84;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v84, AssociatedTypeWitness);
        v42 = v83;
      }
      sub_2448EB58C();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v100)(v42, 1, AssociatedTypeWitness) == 1)
        break;
      v95(v38, v42, AssociatedTypeWitness);
    }
  }
  (*(void (**)(char *, uint64_t))(v77 + 8))(v104, v105);
  return v109;
}

double Sequence.orderedGroupElements<A, B>(using:)@<D0>(void (*a1)(char *, char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X6>, _OWORD *a8@<X8>)
{
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
  uint64_t AssociatedTypeWitness;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t AssociatedConformanceWitness;
  char *v48;
  double result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void (*v61)(char *, char *, uint64_t);
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  unsigned int (*v66)(char *, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, char *, char *);
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  __int128 v79;
  __int128 v80;

  v72 = a7;
  v51 = a4;
  v68 = a2;
  v69 = a1;
  v53 = a8;
  v12 = sub_2448EAEE4();
  v13 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v12);
  v64 = v12;
  v15 = type metadata accessor for Inhabited(255, v12, v13, v14);
  v58 = sub_2448EB508();
  v57 = *(_QWORD *)(v58 - 8);
  v16 = MEMORY[0x24BDAC7A8](v58);
  v63 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v50 - v19;
  v21 = *(_QWORD *)(v15 - 8);
  v22 = MEMORY[0x24BDAC7A8](v18);
  v56 = (char *)&v50 - v23;
  v65 = a5;
  v76 = *(_QWORD *)(a5 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v55 = (char *)&v50 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v78 = (char *)&v50 - v27;
  v77 = *(_QWORD *)(a4 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v62 = (char *)&v50 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v50 - v30;
  v71 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v33 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v59 = AssociatedTypeWitness;
  v73 = v33;
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v70 = (char *)&v50 - v34;
  v35 = sub_2448EB508();
  v36 = MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v50 - v37;
  v39 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v41 = (char *)&v50 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = swift_getAssociatedTypeWitness();
  v52 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v43 = (char *)&v50 - v42;
  v44 = v51;
  OrderedDictionary.init()((uint64_t *)&v80);
  v45 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 16);
  v46 = v59;
  v67 = a3;
  v45(v41, v75, a3);
  sub_2448EACB0();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v71 = v43;
  v67 = AssociatedConformanceWitness;
  sub_2448EB58C();
  v48 = v70;
  v66 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v73 + 48);
  if (v66(v38, 1, v46) != 1)
  {
    v61 = *(void (**)(char *, char *, uint64_t))(v73 + 32);
    v75 = v21;
    v60 = v38;
    v54 = v20;
    v61(v48, v38, v46);
    v69(v31, v78, v48);
    v79 = v80;
    type metadata accessor for OrderedDictionary(0, v44, v15, v72);
    OrderedDictionary.subscript.getter();
  }
  (*(void (**)(char *, uint64_t))(v52 + 8))(v71, v74);
  result = *(double *)&v80;
  *v53 = v80;
  return result;
}

void sub_2448D02D0()
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
  void (*v11)(char *, uint64_t, uint64_t);
  char *v12;
  char *v13;
  uint64_t v14;

  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v5, 1, v4) != 1)
  {
    v7 = *(_QWORD *)(v6 - 320);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v7, v5, v4);
    v8 = MEMORY[0x24951AC70](MEMORY[0x24BEE12E8], *(_QWORD *)(v6 - 248));
    Inhabited<>.append(_:)(*(_QWORD *)(v6 - 136), v4, v8, v9);
    v10 = *(_QWORD *)(v6 - 264);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 144) + 16))(v10, v3, v0);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
    v12 = *(char **)(v6 - 256);
    v11(v12, v7, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 160) + 56))(v12, 0, 1, v4);
    v13 = v12;
    v14 = *(_QWORD *)(v6 - 160);
    OrderedDictionary.subscript.setter(v13, v10, v2);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v7, v4);
    JUMPOUT(0x2448D0208);
  }
  JUMPOUT(0x2448D0104);
}

void Coiteration.makeIterator()(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t AssociatedConformanceWitness;
  uint64_t v20;
  _QWORD v21[2];
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

  v27 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  v25 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *(_QWORD *)(v4 + 40);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v26 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v21[1] = (char *)v21 - v9;
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = swift_getAssociatedTypeWitness();
  v22 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v21 - v15;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v18 = v23;
  v17(v13, v23, v10);
  sub_2448EACB0();
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v6, v18 + *(int *)(a1 + 52), v3);
  sub_2448EACB0();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v20 = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v27, v16, v14);
  v28 = v14;
  v29 = AssociatedTypeWitness;
  v30 = AssociatedConformanceWitness;
  v31 = v20;
  type metadata accessor for Coiterator();
}

uint64_t sub_2448D05D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 128) + 32))(v2 + *(int *)(a1 + 52), v3, v1);
}

void sub_2448D060C(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  sub_2448D0624(a1, a2, a3, a4, a5, (void (*)(_QWORD, _QWORD *))type metadata accessor for Coiterator, a6);
}

void sub_2448D0618(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  sub_2448D0624(a1, a2, a3, a4, a5, (void (*)(_QWORD, _QWORD *))type metadata accessor for Coiteration, a6);
}

void sub_2448D0624(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, void (*a6)(_QWORD, _QWORD *)@<X6>, uint64_t a7@<X8>)
{
  _QWORD v12[4];

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a7, a1);
  v12[0] = a2;
  v12[1] = a3;
  v12[2] = a4;
  v12[3] = a5;
  a6(0, v12);
  JUMPOUT(0x2448D0684);
}

uint64_t sub_2448D06BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;

  v6 = **(_QWORD **)(v3 + 40);
  swift_getAtKeyPath();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v6 + *MEMORY[0x24BEE46A8]) - 8) + 16))(a2, a3);
}

uint64_t sub_2448D0724@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t result;

  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 56);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  result = v8(a3, a3 + *(int *)(TupleTypeMetadata2 + 48), a1);
  if (v4)
    *a2 = v4;
  return result;
}

void sub_2448D0798(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  Coiteration.makeIterator()(a1, a2);
}

uint64_t sub_2448D07AC()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

uint64_t sub_2448D07C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = sub_2448D140C(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v2, a1);
  return v4;
}

uint64_t Coiterator.next()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  void (*v15)(char *, uint64_t);
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = a2;
  v2 = *(_QWORD *)(a1 + 40);
  v22[1] = *(_QWORD *)(a1 + 24);
  v22[2] = v2;
  v22[0] = swift_getAssociatedTypeWitness();
  v3 = sub_2448EB508();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v22 - v8;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = sub_2448EB508();
  v23 = *(_QWORD *)(v11 - 8);
  v24 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v22 - v12;
  sub_2448EB58C();
  sub_2448EB58C();
  v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 48))(v13, 1, AssociatedTypeWitness);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  if (v14 == 1 && (*(unsigned int (**)(char *, uint64_t))(*(_QWORD *)(v22[0] - 8) + 48))(v7, 1) == 1)
  {
    v15 = *(void (**)(char *, uint64_t))(v4 + 8);
    v15(v7, v3);
    v15(v9, v3);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v24);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v25, 1, 1, TupleTypeMetadata2);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v18 = v24;
    v19 = swift_getTupleTypeMetadata2();
    v20 = v25;
    v21 = v25 + *(int *)(v19 + 48);
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(v25, v13, v18);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v21, v9, v3);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v20, 0, 1, v19);
  }
}

uint64_t Sequence.stableSorted(by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *AssociatedTypeWitness;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = sub_2448EB9F4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v22[-v11];
  sub_2448EACEC();
  v23 = a3;
  v24 = a4;
  v25 = a1;
  v26 = a2;
  MEMORY[0x24951AC70](MEMORY[0x24BEE2FC0], v9);
  v13 = (uint64_t)v12;
  v14 = sub_2448EAD58();
  if (v4)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    v15 = v14;
    v16 = (*(uint64_t (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
    v27 = v15;
    MEMORY[0x24BDAC7A8](v16);
    *(_QWORD *)&v22[-16] = a3;
    *(_QWORD *)&v22[-8] = a4;
    AssociatedTypeWitness = (char *)swift_getAssociatedTypeWitness();
    swift_getTupleTypeMetadata2();
    v18 = sub_2448EAEE4();
    v19 = MEMORY[0x24951AC70](MEMORY[0x24BEE12E0], v18);
    v13 = sub_2447D31DC((void (*)(char *, char *))sub_2448D104C, (uint64_t)&v22[-32], v18, AssociatedTypeWitness, MEMORY[0x24BEE4078], v19, MEMORY[0x24BEE40A8], v20);
    swift_bridgeObjectRelease();
  }
  return v13;
}

uint64_t sub_2448D0C90(_QWORD *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t TupleTypeMetadata2;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char v23;
  char v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t *, uint64_t);
  uint64_t v33;
  int v34;
  uint64_t v35;
  void (*v36)(uint64_t *, uint64_t);
  uint64_t v37;
  uint64_t *v38;
  char *v39;
  uint64_t *v40;
  _QWORD *v41;
  void (*v42)(char *, char *, uint64_t);
  void (*v43)(uint64_t *, uint64_t);
  uint64_t *v44;
  char *v45;
  uint64_t v46;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t (*v50)(void);
  char *v51;
  uint64_t v52;
  uint64_t AssociatedTypeWitness;
  uint64_t *v54;
  _QWORD *v55;
  uint64_t v56;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v52 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v7 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v48 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (uint64_t *)((char *)&v48 - v14);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (uint64_t *)((char *)&v48 - v17);
  v19 = *(int *)(v16 + 48);
  v54 = a2;
  v55 = a1;
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v51 = v20;
  v22 = v56;
  v23 = a3();
  if (!v22)
  {
    v48 = v12;
    v49 = (uint64_t *)v9;
    v50 = a3;
    v56 = 0;
    v25 = (char *)v18 + *(int *)(TupleTypeMetadata2 + 48);
    v26 = AssociatedTypeWitness;
    *v18 = *v54;
    v54 = *(uint64_t **)(v26 - 8);
    v27 = (void (*)(char *, char *, uint64_t))v54[2];
    v28 = v23;
    v27(v25, v21, v26);
    v29 = (char *)v15 + *(int *)(TupleTypeMetadata2 + 48);
    v55 = (_QWORD *)*v55;
    *v15 = (uint64_t)v55;
    v27(v29, v51, v26);
    v30 = v26;
    v31 = TupleTypeMetadata2;
    if ((v28 & 1) != 0)
    {
      v32 = *(void (**)(uint64_t *, uint64_t))(v52 + 8);
      v32(v15, TupleTypeMetadata2);
      v32(v18, TupleTypeMetadata2);
      v24 = 1;
    }
    else
    {
      v51 = v25;
      v33 = v56;
      v34 = ((uint64_t (*)(char *, char *))v50)(v25, v29);
      v35 = v52;
      if (v33)
      {
        v36 = *(void (**)(uint64_t *, uint64_t))(v52 + 8);
        v36(v15, TupleTypeMetadata2);
        v36(v18, TupleTypeMetadata2);
      }
      else
      {
        v37 = *(int *)(TupleTypeMetadata2 + 48);
        v38 = v48;
        LODWORD(v56) = v34;
        v39 = (char *)v48 + v37;
        v40 = v54;
        v41 = v55;
        *v48 = v55;
        v42 = (void (*)(char *, char *, uint64_t))v40[4];
        v42(v39, v29, v30);
        v43 = *(void (**)(uint64_t *, uint64_t))(v35 + 8);
        v43(v38, v31);
        v44 = v49;
        v45 = (char *)v49 + *(int *)(v31 + 48);
        v46 = *v18;
        *v49 = *v18;
        v42(v45, v51, v30);
        v43(v44, v31);
        v24 = ((uint64_t)v41 < v46) & ~(_BYTE)v56;
      }
    }
  }
  return v24 & 1;
}

uint64_t sub_2448D0F4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t TupleTypeMetadata2;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v7 = *(int *)(MEMORY[0x24BDAC7A8](TupleTypeMetadata2) + 48);
  v8 = (char *)&v12 + v7 - v6;
  v9 = a1 + v7;
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, v9, AssociatedTypeWitness);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v8, AssociatedTypeWitness);
}

uint64_t sub_2448D102C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_2448D0C90(a1, a2, *(uint64_t (**)(void))(v2 + 32)) & 1;
}

uint64_t sub_2448D104C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2448D0F4C(a1, a2);
}

void sub_2448D1068()
{
  JUMPOUT(0x24951AC70);
}

void type metadata accessor for Coiteration()
{
  JUMPOUT(0x24951ABD4);
}

uint64_t sub_2448D10A8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_23;
  v12 = (v10 & ~v9) + *(_QWORD *)(v6 + 64);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v15 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v15 < 2)
    {
LABEL_23:
      if (v8)
      {
        if (v5 >= v7)
          return (*(uint64_t (**)(void))(v4 + 48))();
        else
          return (*(uint64_t (**)(uint64_t))(v6 + 48))((v10 + a1) & ~v9);
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_23;
LABEL_14:
  v16 = (v14 - 1) << v13;
  if (v12 > 3)
    v16 = 0;
  if (!(_DWORD)v12)
    return v8 + v16 + 1;
  if (v12 <= 3)
    v17 = (v10 & ~(_DWORD)v9) + *(_DWORD *)(v6 + 64);
  else
    v17 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448D1184 + 4 * byte_2448F7CD0[v17 - 1]))();
}

void sub_2448D1200(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  if (a3 > v7)
  {
    if (v8 <= 3)
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
  }
  else
  {
    v9 = 0;
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
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
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
  __asm { BR              X16 }
}

void type metadata accessor for Coiterator()
{
  JUMPOUT(0x24951ABD4);
}

uint64_t Weak.__allocating_init(_:)()
{
  uint64_t v0;

  v0 = sub_2448D173C();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t Weak.wrapped.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x24951AE5C](v0 + 16);
}

uint64_t Weak.init(_:)()
{
  uint64_t v0;

  v0 = sub_2448D16E0();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t Weak.hash(into:)()
{
  uint64_t v0;

  swift_beginAccess();
  if (!MEMORY[0x24951AE5C](v0 + 16))
    return sub_2448EBD0C();
  sub_2448EBD0C();
  return swift_unknownObjectRelease();
}

BOOL static Weak.== infix<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x24951AE5C](v3);
  swift_beginAccess();
  v5 = MEMORY[0x24951AE5C](a2 + 16);
  v6 = v5;
  if (v4)
  {
    swift_unknownObjectRelease();
    if (v6)
    {
      swift_unknownObjectRelease();
      return v4 == v6;
    }
    return 0;
  }
  if (v5)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return 1;
}

uint64_t Weak.deinit()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();
  return v0;
}

uint64_t Weak.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t Weak.hashValue.getter()
{
  sub_2448EBD00();
  Weak.hash(into:)();
  return sub_2448EBD3C();
}

uint64_t sub_2448D1644()
{
  return Weak.hashValue.getter();
}

uint64_t sub_2448D1664()
{
  return Weak.hash(into:)();
}

uint64_t sub_2448D1684()
{
  sub_2448EBD00();
  Weak.hash(into:)();
  return sub_2448EBD3C();
}

BOOL sub_2448D16C0(uint64_t *a1, uint64_t *a2)
{
  return static Weak.== infix<A>(_:_:)(*a1, *a2);
}

uint64_t sub_2448D16E0()
{
  uint64_t v0;

  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return v0;
}

uint64_t sub_2448D173C()
{
  swift_allocObject();
  return sub_2448D16E0();
}

void sub_2448D1774()
{
  JUMPOUT(0x24951AC70);
}

uint64_t sub_2448D1784@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x24951AE5C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_2448D17D0()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_2448D181C()
{
  return 8;
}

_QWORD *sub_2448D1828(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2448D1834()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Weak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Weak);
}

uint64_t method lookup function for Weak()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Weak.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t AnyEquatable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t result;

  type metadata accessor for AnyEquatableBoxImpl(0, a2, a3, a4);
  v7 = swift_allocObject();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 104) - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)v7 + 120), a1);
  *a5 = v7;
  return result;
}

uint64_t type metadata accessor for AnyEquatableBoxImpl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnyEquatableBoxImpl);
}

uint64_t sub_2448D1904(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 104) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 120), a1);
  return v2;
}

uint64_t AnyEquatable.base.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 88))();
}

uint64_t static AnyEquatable.== infix(_:_:)(uint64_t a1, _QWORD *a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a1 + 80))(*a2) & 1;
}

ValueMetadata *type metadata accessor for AnyEquatable()
{
  return &type metadata for AnyEquatable;
}

void sub_2448D19C0()
{
  sub_2448EB9A0();
  __break(1u);
}

void sub_2448D1A14()
{
  sub_2448EB9A0();
  __break(1u);
}

uint64_t type metadata accessor for AnyEquatableBox()
{
  return objc_opt_self();
}

uint64_t sub_2448D1A88()
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

uint64_t sub_2448D1AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;
  char v6;

  type metadata accessor for AnyEquatableBoxImpl(0, *(_QWORD *)(*(_QWORD *)v4 + 104), *(_QWORD *)(*(_QWORD *)v4 + 112), a4);
  result = swift_dynamicCastClass();
  if (result)
  {
    swift_retain();
    v6 = sub_2448EAA64();
    swift_release();
    return v6 & 1;
  }
  return result;
}

uint64_t sub_2448D1B90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1;

  v2 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 120);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  a1[3] = v3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(boxed_opaque_existential_1, v2, v3);
}

uint64_t sub_2448D1BD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 104) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120));
}

uint64_t sub_2448D1BF0()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 104) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120));
  return swift_deallocClassInstance();
}

uint64_t Actor.verifyIsolated(_:file:line:)()
{
  return sub_2448EAF20();
}

uint64_t Actor.makeIsolatedTask(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A208);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2448EAF74();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v4;
  v13[3] = a4;
  v13[4] = a3;
  v13[5] = a4;
  v13[6] = a1;
  v13[7] = a2;
  v13[8] = v4;
  swift_unknownObjectRetain_n();
  swift_retain();
  return sub_2447C5CB8((uint64_t)v11, (uint64_t)&unk_257391A00, (uint64_t)v13);
}

uint64_t sub_2448D1D50(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v8;
  *v8 = v6;
  v8[1] = sub_2447C81F0;
  return v10(a6);
}

uint64_t sub_2448D1DB4()
{
  return 0;
}

uint64_t sub_2448D1DC0(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  sub_2448EB79C();
  sub_2448EABC0();
  sub_2448EBBA4();
  v3 = sub_2448EABC0();
  a2(v3);
  sub_2448EABC0();
  swift_bridgeObjectRelease();
  sub_2448EABC0();
  return 0;
}

uint64_t sub_2448D1E90()
{
  uint64_t v0;

  return sub_2448D1DC0(*(_QWORD *)(v0 + 32), *(void (**)(uint64_t))(v0 + 40));
}

uint64_t sub_2448D1EA0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2448D1ED4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v2 = *(int **)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_2447C62E8;
  v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_2447C81F0;
  return v7(v3);
}

PreviewsFoundationOS::JITError __swiftcall JITError.init(additionalLinkErrorInformation:)(PreviewsFoundationOS::JITError additionalLinkErrorInformation)
{
  PreviewsFoundationOS::JITError *v1;

  v1->additionalLinkErrorInformation._rawValue = additionalLinkErrorInformation.additionalLinkErrorInformation._rawValue;
  return additionalLinkErrorInformation;
}

uint64_t JITError.additionalLinkErrorInformation.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t JITError.additionalLinkErrorInformation.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*JITError.additionalLinkErrorInformation.modify())()
{
  return nullsub_1;
}

unint64_t JITError.lowValueTitle.getter()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)v0 + 16))
    return 0xD000000000000017;
  else
    return 0;
}

uint64_t JITError.additionalInfo.getter()
{
  return 0;
}

unint64_t JITError.additionalDiagnostics.getter()
{
  uint64_t v0;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 16))
    return 0;
  sub_2448EB79C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738A630);
  sub_2447D48B0();
  sub_2448EA9A4();
  swift_bridgeObjectRelease();
  sub_2448EABC0();
  swift_bridgeObjectRelease();
  return 0xD00000000000001DLL;
}

void JITError.options.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 64;
  *(_BYTE *)(a1 + 8) = 0;
}

unint64_t sub_2448D20D4()
{
  uint64_t v0;

  if (*(_QWORD *)(*(_QWORD *)v0 + 16))
    return 0xD000000000000017;
  else
    return 0;
}

void sub_2448D2108(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 64;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t HumanReadableError.isJITRelated.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  double v20;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27[3];
  uint64_t v28;
  uint64_t v29;

  v28 = a1;
  v29 = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v27);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(boxed_opaque_existential_1, v2, a1);
  while (1)
  {
    v6 = v28;
    if (!v28)
      goto LABEL_2;
    v7 = v29;
    v8 = __swift_project_boxed_opaque_existential_1(v27, v28);
    v9 = *(_QWORD *)(v6 - 8);
    MEMORY[0x24BDAC7A8](v8);
    v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    HumanReadableError.unwrapped.getter(v6, v7, (uint64_t *)&v24);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v6);
    v12 = *((_QWORD *)&v25 + 1);
    v13 = v26;
    __swift_project_boxed_opaque_existential_1(&v24, *((uint64_t *)&v25 + 1));
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 56))(&v22, v12, v13);
    v14 = v22;
    LOBYTE(v7) = v23;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
    if ((v7 & 1) == 0 && (v14 & 0x40) != 0)
      break;
    v15 = v28;
    if (v28)
    {
      v16 = __swift_project_boxed_opaque_existential_1(v27, v28);
      v17 = *(_QWORD *)(v15 - 8);
      MEMORY[0x24BDAC7A8](v16);
      v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v17 + 16))(v19);
      v20 = HumanReadableError.underlying.getter(v15, (uint64_t)&v24);
      (*(void (**)(char *, uint64_t, double))(v17 + 8))(v19, v15, v20);
      goto LABEL_3;
    }
LABEL_2:
    v26 = 0;
    v24 = 0u;
    v25 = 0u;
LABEL_3:
    sub_2448D2304((uint64_t)&v24, (uint64_t)v27);
    sub_2448D234C((uint64_t)v27, (uint64_t)&v24);
    v5 = *((_QWORD *)&v25 + 1);
    sub_2448A9A08((uint64_t)&v24);
    if (!v5)
      goto LABEL_10;
  }
  v5 = 1;
LABEL_10:
  sub_2448A9A08((uint64_t)v27);
  return v5;
}

uint64_t sub_2448D2304(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738C3D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2448D234C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738C3D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void JITRelatedError.options.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 64;
  *(_BYTE *)(a1 + 8) = 0;
}

unint64_t sub_2448D23A8(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_2448D23D4();
  result = sub_2448D2418();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2448D23D4()
{
  unint64_t result;

  result = qword_257391A08;
  if (!qword_257391A08)
  {
    result = MEMORY[0x24951AC70](&protocol conformance descriptor for JITError, &type metadata for JITError);
    atomic_store(result, (unint64_t *)&qword_257391A08);
  }
  return result;
}

unint64_t sub_2448D2418()
{
  unint64_t result;

  result = qword_257391A10;
  if (!qword_257391A10)
  {
    result = MEMORY[0x24951AC70](&protocol conformance descriptor for JITError, &type metadata for JITError);
    atomic_store(result, (unint64_t *)&qword_257391A10);
  }
  return result;
}

unint64_t sub_2448D2460()
{
  unint64_t result;

  result = qword_257391A18;
  if (!qword_257391A18)
  {
    result = MEMORY[0x24951AC70](&protocol conformance descriptor for JITError, &type metadata for JITError);
    atomic_store(result, (unint64_t *)&qword_257391A18);
  }
  return result;
}

ValueMetadata *type metadata accessor for JITError()
{
  return &type metadata for JITError;
}

uint64_t sub_2448D24B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;

  v5 = v4;
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v8 = type metadata accessor for Future.Activity(0, v7, a3, a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (_QWORD *)((char *)&v25[-1] - v10);
  LOBYTE(v10) = *(_BYTE *)(a1 + 16);
  v12 = *(_BYTE *)(a1 + 56);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)a1;
  *(_BYTE *)(v5 + 32) = v10;
  *(_OWORD *)(v5 + 40) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v5 + 56) = *(_OWORD *)(a1 + 40);
  *(_BYTE *)(v5 + 72) = v12;
  *(_QWORD *)(v5 + 80) = mach_absolute_time();
  type metadata accessor for FutureTermination(255, v7, v13, v14);
  swift_getFunctionTypeMetadata1();
  *v11 = sub_2448EAE54();
  swift_storeEnumTagMultiPayload();
  v15 = sub_24481320C(v11, v8);
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
  *(_QWORD *)(v5 + 88) = v15;
  v26 = 0;
  type metadata accessor for Future(255, v7, v16, v17);
  v18 = sub_2448EB508();
  v19 = sub_24481320C(&v26, v18);
  *(_QWORD *)(v5 + 96) = v19;
  v25[1] = v19;
  v24 = v7;
  KeyPath = (uint64_t *)swift_getKeyPath();
  v25[0] = v5;
  v21 = sub_2448EA5D8();
  swift_retain();
  swift_retain();
  v22 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v21);
  SynchronousAccessProviding.syncSetValue<A>(at:to:)(KeyPath, (uint64_t)v25, v21, v22);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v5;
}

uint64_t Future.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_2448D26B0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v5 = type metadata accessor for Future.Activity(0, *(_QWORD *)(*v3 + 80), a1, a2);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v12 - v7;
  v12[1] = v3[11];
  v9 = sub_2448EA5D8();
  v10 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v9);
  SynchronousAccessProviding<>.peek(file:line:column:function:)((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Future.swift", 118, 2, 90, 22, (uint64_t)"recentStateSnapshot", 19, 2, v9, v10);
  sub_2448D2F74(v5, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t type metadata accessor for Future.Activity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Future.Activity);
}

uint64_t sub_2448D27B0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = type metadata accessor for FutureState(0, *(_QWORD *)(*(_QWORD *)v3 + 80), a1, a2);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - v7;
  sub_2448D26B0(v9, v10, (uint64_t)&v14 - v7);
  FutureState.succeededValue.getter(v5, v11, v12, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

BOOL sub_2448D2844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  BOOL v14;
  uint64_t v16;

  v5 = type metadata accessor for FutureState(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - v7;
  sub_2448D26B0(v9, v10, (uint64_t)&v16 - v7);
  v14 = FutureState.isCanceled.getter(v5, v11, v12, v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v14;
}

BOOL sub_2448D28D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  void *v14;
  uint64_t v16;

  v5 = type metadata accessor for FutureState(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - v7;
  sub_2448D26B0(v9, v10, (uint64_t)&v16 - v7);
  v14 = (void *)FutureState.failedError.getter(v5, v11, v12, v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v14)

  return v14 != 0;
}

uint64_t sub_2448D2974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;

  v5 = *v4;
  v12 = v4[11];
  v11 = *(_QWORD *)(v5 + 80);
  type metadata accessor for Future.Activity(255, v11, a3, a4);
  v6 = sub_2448EA5D8();
  swift_retain();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257391A20);
  v8 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v6);
  SynchronousAccessProviding.syncRead<A>(file:line:column:function:_:)((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Future.swift", 118, 2, 108, 34, (uint64_t)"runningTime", 11, 2, (uint64_t)sub_2448D31B8, (uint64_t)v10, v6, v7, v8);
  return swift_release();
}

uint64_t sub_2448D2A4C(void (*a1)(_QWORD), uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
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
  void (*v22)(char *, uint64_t);
  char *v24;
  char *v25;
  void (*v26)(char *);
  char v27[16];
  uint64_t v28;
  void (*v29)(_QWORD);
  uint64_t v30;
  uint64_t v31;

  v7 = *(_QWORD *)(*v4 + 80);
  v8 = type metadata accessor for FutureTermination(0, v7, a3, a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v25 = (char *)&v25 - v10;
  v11 = sub_2448EB508();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - v16;
  v31 = v4[11];
  v28 = v7;
  v29 = a1;
  v26 = (void (*)(char *))a1;
  v30 = a2;
  type metadata accessor for Future.Activity(255, v7, v18, v19);
  v20 = sub_2448EA5D8();
  swift_retain();
  v21 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v20);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)((uint64_t)&dword_2447B9000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Future.swift", 118, 2, 120, 56, (uint64_t)"_observeFinish(_:)", 18, 2, (uint64_t)sub_2448D5760, (uint64_t)v27, v20, v11, v21);
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v15, 1, v8) == 1)
  {
    v22 = *(void (**)(char *, uint64_t))(v12 + 8);
    v22(v17, v11);
    return ((uint64_t (*)(char *, uint64_t))v22)(v15, v11);
  }
  else
  {
    v24 = v25;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v25, v15, v8);
    v26(v24);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v24, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
}

uint64_t sub_2448D2C7C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_2448D429C(a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_2448D2CA4(uint64_t a1)
{
  uint64_t *v1;
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
  uint64_t *KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v22[16];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = *v1;
  v4 = v1[10];
  v5 = mach_absolute_time();
  v28 = v1[11];
  v6 = *(_QWORD *)(v3 + 80);
  v23 = v6;
  v24 = a1;
  v25 = v4;
  v26 = v5;
  type metadata accessor for Future.Activity(255, v6, v7, v8);
  v9 = sub_2448EA5D8();
  type metadata accessor for FutureTermination(255, v6, v10, v11);
  swift_getFunctionTypeMetadata1();
  v12 = sub_2448EAEE4();
  v13 = sub_2448EB508();
  swift_retain();
  v14 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v9);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)((uint64_t)&dword_2447B9000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Future.swift", 118, 2, 153, 44, (uint64_t)"didFinish(_:)", 13, 2, (uint64_t)sub_2448D5478, (uint64_t)v22, v9, v13, v14);
  v15 = swift_release();
  if (v29)
  {
    v27 = v29;
    MEMORY[0x24BDAC7A8](v15);
    MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v12);
    sub_2448EAD70();
    v15 = swift_bridgeObjectRelease();
  }
  v28 = v1[12];
  MEMORY[0x24BDAC7A8](v15);
  KeyPath = (uint64_t *)swift_getKeyPath();
  v27 = 0;
  type metadata accessor for Future(255, v6, v17, v18);
  sub_2448EB508();
  v19 = sub_2448EA5D8();
  swift_retain();
  v20 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v19);
  SynchronousAccessProviding.syncSetValue<A>(at:to:)(KeyPath, (uint64_t)&v27, v19, v20);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t Future<A>.init(dsoHandle:file:line:column:function:priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  v12 = sub_2448D42D8(a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  swift_release();
  return v12;
}

uint64_t sub_2448D2F74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = type metadata accessor for FutureTermination(0, *(_QWORD *)(a1 + 16), v7, v8);
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v6, v9);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
    v14 = type metadata accessor for FutureTermination(0, *(_QWORD *)(a1 + 16), v12, v13);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a2, 1, 1, v14);
  }
}

__n128 Future.initializationCallsite.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;
  __n128 result;

  v2 = *(_BYTE *)(v1 + 32);
  v3 = *(_BYTE *)(v1 + 72);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(v1 + 40);
  result = *(__n128 *)(v1 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(_BYTE *)(a1 + 56) = v3;
  return result;
}

void Future.initializationTime.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 80);
}

uint64_t sub_2448D30A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[2];

  v8 = type metadata accessor for Future.Activity(0, a2, a3, a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v16 - v10, a1, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = type metadata accessor for FutureTermination(255, a2, v12, v13);
    *(_OWORD *)a5 = *(_OWORD *)&v11[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    *(_BYTE *)(a5 + 16) = 0;
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v11, v14);
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    *(_QWORD *)a5 = 0;
    *(_QWORD *)(a5 + 8) = 0;
    *(_BYTE *)(a5 + 16) = 1;
  }
  return result;
}

uint64_t sub_2448D31B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;

  return sub_2448D30A4(a1, *(_QWORD *)(v4 + 16), a2, a3, a4);
}

uint64_t sub_2448D31D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  uint64_t v24;

  v10 = type metadata accessor for Future.Activity(0, a4, a3, a4);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (_QWORD *)((char *)v23 - v12);
  (*(void (**)(char *, _QWORD *, uint64_t))(v11 + 16))((char *)v23 - v12, a1, v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = type metadata accessor for FutureTermination(0, a4, v14, v15);
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v17 + 32))(a5, v13, v16);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(a5, 0, 1, v16);
  }
  else
  {
    (*(void (**)(_QWORD *, uint64_t))(v11 + 8))(a1, v10);
    v24 = *v13;
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = a4;
    v19[3] = a2;
    v19[4] = a3;
    v23[0] = sub_24481E31C;
    v23[1] = v19;
    type metadata accessor for FutureTermination(255, a4, v20, v21);
    swift_getFunctionTypeMetadata1();
    sub_2448EAEE4();
    swift_retain();
    sub_2448EAE9C();
    *a1 = v24;
    swift_storeEnumTagMultiPayload();
    v22 = swift_checkMetadataState();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(a5, 1, 1, v22);
  }
}

uint64_t sub_2448D33A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  int EnumCaseMultiPayload;
  void (*v17)(uint64_t *, uint64_t);
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  _QWORD v24[2];
  char v25;
  __int128 v26;
  const char *v27;
  uint64_t v28;
  char v29;

  v12 = type metadata accessor for Future.Activity(0, a5, a3, a4);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (_QWORD *)((char *)v24 - v14);
  (*(void (**)(char *, uint64_t *, uint64_t))(v13 + 16))((char *)v24 - v14, a1, v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v17 = *(void (**)(uint64_t *, uint64_t))(v13 + 8);
  if (EnumCaseMultiPayload == 1)
  {
    v17(v15, v12);
    v24[0] = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Future.swift";
    v24[1] = 118;
    v25 = 2;
    v26 = xmmword_2448ED150;
    v27 = "didFinish(_:)";
    v28 = 13;
    v29 = 2;
    result = sub_244823F6C();
    v19 = 0;
  }
  else
  {
    v17(a1, v12);
    v19 = *v15;
    v22 = type metadata accessor for FutureTermination(255, a5, v20, v21);
    v23 = (uint64_t *)((char *)a1 + *(int *)(swift_getTupleTypeMetadata2() + 48));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(a1, a2, v22);
    *v23 = a3;
    v23[1] = a4;
    result = swift_storeEnumTagMultiPayload();
  }
  *a6 = v19;
  return result;
}

void sub_2448D352C()
{
  sub_2448EB9A0();
  __break(1u);
}

uint64_t Future.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t Future<A>.termination.getter(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch();
}

uint64_t sub_2448D35C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  type metadata accessor for FutureTermination(0, *(_QWORD *)(v1 + 80), v3, v4);
  *v2 = v0;
  v2[1] = sub_2448D3650;
  return sub_2448EBB74();
}

uint64_t sub_2448D3650()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2448D3698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  v5 = sub_2448D3710(a1, v4, a3, a4);
  v7 = v6;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v4;
  v8[3] = v5;
  v8[4] = v7;
  Future.observeFinish(_:)((uint64_t)sub_2448D54E8, (uint64_t)v8);
  return swift_release();
}

uint64_t (*sub_2448D3710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  type metadata accessor for FutureTermination(255, a2, a3, a4);
  v6 = sub_2448EAF44();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - v8, a1, v6);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, v9, v6);
  return sub_2448D5574;
}

uint64_t sub_2448D37FC(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v6 = type metadata accessor for FutureTermination(0, a4, a3, a4);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)&v11 - v7, a1);
  return a2(v8);
}

uint64_t Future<A>.result.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5[2] = a1;
  v6 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v5[3] = v6;
  v5[4] = type metadata accessor for FutureTermination(0, v6, a3, a4);
  v7 = swift_task_alloc();
  v5[5] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v5[6] = v8;
  *v8 = v5;
  v8[1] = sub_2448D3918;
  v8[2] = v7;
  v8[3] = v4;
  v8[4] = *(_QWORD *)v4;
  return swift_task_switch();
}

uint64_t sub_2448D3918()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2448D396C()
{
  uint64_t v0;
  _QWORD *v1;
  int EnumCaseMultiPayload;
  uint64_t (*v3)(void);

  v1 = *(_QWORD **)(v0 + 40);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      sub_2448EAF50();
      sub_2447C8004();
      swift_allocError();
      sub_2448EA7DC();
      swift_willThrow();
      swift_task_dealloc();
      v3 = *(uint64_t (**)(void))(v0 + 8);
      return v3();
    }
    **(_QWORD **)(v0 + 16) = *v1;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    sub_2448EBD48();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 32))(*(_QWORD *)(v0 + 16), v1, *(_QWORD *)(v0 + 24));
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    sub_2448EBD48();
  }
  swift_storeEnumTagMultiPayload();
  swift_task_dealloc();
  v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t Future<A>.value.getter(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch();
}

uint64_t sub_2448D3ABC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_2448D3B30;
  return sub_2448EBBF8();
}

uint64_t sub_2448D3B30()
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

uint64_t sub_2448D3B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4[2] = a1;
  v6 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  v4[3] = v6;
  v4[4] = type metadata accessor for FutureTermination(0, v6, a3, a4);
  v7 = swift_task_alloc();
  v4[5] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v4[6] = v8;
  *v8 = v4;
  v8[1] = sub_2448D3C3C;
  v8[2] = v7;
  v8[3] = a2;
  v8[4] = *(_QWORD *)a2;
  return swift_task_switch();
}

uint64_t sub_2448D3C3C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2448D3C90()
{
  _QWORD *v0;
  uint64_t v1;
  int EnumCaseMultiPayload;
  uint64_t (*v3)(void);

  v1 = v0[5];
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
    {
      sub_2448EAF50();
      sub_2447C8004();
      swift_allocError();
      sub_2448EA7DC();
    }
    swift_willThrow();
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v0[3] - 8) + 32))(v0[2], v1);
    swift_task_dealloc();
    v3 = (uint64_t (*)(void))v0[1];
  }
  return v3();
}

uint64_t Task<>.future.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];
  _BYTE *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  __int128 v19;
  const char *v20;
  uint64_t v21;
  char v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A208);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Future(0, a2, v7, v8);
  v9 = sub_2448EAF74();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a1;
  swift_retain();
  *(_QWORD *)&v17 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFound"
                    "ation/Future.swift";
  *((_QWORD *)&v17 + 1) = 118;
  v18 = 2;
  v19 = xmmword_2448F80A0;
  v20 = "future";
  v21 = 6;
  v22 = 2;
  v14 = v6;
  v15 = &unk_257391A58;
  v16 = v10;
  v11 = sub_2447E98BC(&v17, sub_2448D56A0, (uint64_t)v13);
  sub_2447C7D14((uint64_t)v6);
  swift_release();
  return v11;
}

uint64_t sub_2448D3E88()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738A0A8);
  *v1 = v0;
  v1[1] = sub_2447C62E8;
  return sub_2448EB028();
}

void sub_2448D3F0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A208);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244883CDC(a2, (uint64_t)v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = a1;
  swift_retain();
  swift_retain();
  v12 = sub_2447C5CB8((uint64_t)v10, (uint64_t)&unk_257391B68, (uint64_t)v11);
  v13 = 0uLL;
  swift_retain();
  Promise.observeCancelation(on:_:)(&v13, (uint64_t)sub_244890168, v12);
  swift_release_n();
  sub_24481241C(0);
}

uint64_t sub_2448D4010(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t *a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t);

  v6[3] = a6;
  v8 = *a6;
  v9 = sub_2448EAF50();
  v6[4] = v9;
  v6[5] = *(_QWORD *)(v9 - 8);
  v6[6] = swift_task_alloc();
  v10 = *(_QWORD *)(v8 + 80);
  v6[7] = v10;
  v6[8] = *(_QWORD *)(v10 - 8);
  v11 = swift_task_alloc();
  v6[9] = v11;
  v14 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v12 = (_QWORD *)swift_task_alloc();
  v6[10] = v12;
  *v12 = v6;
  v12[1] = sub_2448D40D0;
  return v14(v11);
}

uint64_t sub_2448D40D0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2448D4134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  Promise.succeed(with:)(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2448D419C()
{
  uint64_t v0;
  void *v1;
  id v2;
  char v3;
  void *v4;

  v1 = *(void **)(v0 + 88);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738A0A8);
  v3 = swift_dynamicCast();
  v4 = *(void **)(v0 + 88);
  if ((v3 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
    sub_2447EB54C((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Future.swift", 118, 2, 270, 39, (uint64_t)"init(dsoHandle:file:line:column:function:priority:operation:)", 61, 2);
  }
  else
  {
    Promise.fail(with:)(*(void **)(v0 + 88));
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2448D4278()
{
  return sub_2448EB034();
}

uint64_t sub_2448D429C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  _QWORD v10[2];
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v10[0] = a1;
  v10[1] = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  return (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v8 + 192))(v10);
}

uint64_t sub_2448D42D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  _QWORD v13[6];
  __int128 v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  *(_QWORD *)&v14 = a1;
  *((_QWORD *)&v14 + 1) = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v13[2] = a9;
  v13[3] = a10;
  v13[4] = a11;
  v11 = sub_2447E98BC(&v14, sub_2448D56A0, (uint64_t)v13);
  sub_2447C7D14(a9);
  return v11;
}

uint64_t sub_2448D4340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_2448D3698(a1, v4, a3, a4);
}

uint64_t sub_2448D4348(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2447C62E8;
  return sub_2448D3B9C(a1, v1, v5, v6);
}

uint64_t sub_2448D439C()
{
  uint64_t v0;
  _QWORD v2[2];
  char v3;
  __int128 v4;
  const char *v5;
  uint64_t v6;
  char v7;

  v2[0] = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Future.swift";
  v2[1] = 118;
  v3 = 2;
  v4 = xmmword_2448F80B0;
  v5 = "value";
  v6 = 5;
  v7 = 2;
  return (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v0 + 192))(v2);
}

uint64_t type metadata accessor for Future(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Future);
}

uint64_t sub_2448D4408()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448D442C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2447C81F0;
  return sub_2448D3E88();
}

uint64_t sub_2448D4490()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for Future()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Future.recentStateSnapshot.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of Future.succeededValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of Future.isCanceled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of Future.didFail.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of Future.runningTime.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of Future.cancel(dsoHandle:file:line:column:function:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t sub_2448D4548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;
  _QWORD v6[6];

  v6[4] = MEMORY[0x24BEE0158] + 64;
  result = type metadata accessor for FutureTermination(319, *(_QWORD *)(a1 + 16), a3, a4);
  if (v5 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v6[5] = v6;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_2448D45D4(_OWORD *a1, char **a2, uint64_t a3)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  char *v10;
  unsigned int v11;
  unsigned int v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char v17;
  __int128 v18;

  v4 = (char *)a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v5 + 64) <= 0x39uLL)
    v6 = 57;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if ((v6 & 0xFFFFFFFFFFFFFFF8) + 24 <= 8)
    v7 = 8;
  else
    v7 = (v6 & 0xFFFFFFFFFFFFFFF8) + 24;
  v8 = *(_DWORD *)(v5 + 80);
  if ((v8 & 0x1000F8) != 0 || (v7 | 1) > 0x18)
  {
    v10 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = &v10[(unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8];
    swift_retain();
  }
  else
  {
    v11 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v11 >= 2)
      v11 = *(_DWORD *)a2 + 2;
    if (v11 == 1)
    {
      v13 = *((unsigned __int8 *)a2 + v6);
      if (v13 >= 3)
      {
        if (v6 <= 3)
          v14 = v6;
        else
          v14 = 4;
        __asm { BR              X13 }
      }
      if (v13 == 2)
      {
        v18 = *((_OWORD *)a2 + 1);
        *a1 = *(_OWORD *)a2;
        a1[1] = v18;
        a1[2] = *((_OWORD *)a2 + 2);
        *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)((char *)a2 + 41);
        v17 = 2;
      }
      else if (v13 == 1)
      {
        v15 = *a2;
        v16 = *a2;
        *(_QWORD *)v4 = v15;
        v17 = 1;
      }
      else
      {
        (*(void (**)(_OWORD *, char **))(v5 + 16))(a1, a2);
        v17 = 0;
      }
      v4[v6] = v17;
      *(_OWORD *)((unint64_t)&v4[v6 + 8] & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v6 + 8) & 0xFFFFFFFFFFFFF8);
      v4[v7] = 1;
    }
    else
    {
      *(_QWORD *)a1 = *a2;
      *((_BYTE *)a1 + v7) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return v4;
}

void sub_2448D47C0(id *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x39)
    v3 = 57;
  v4 = 8;
  if ((v3 & 0xFFFFFFFFFFFFFFF8) + 24 > 8)
    v4 = (v3 & 0xFFFFFFFFFFFFFFF8) + 24;
  v5 = *((unsigned __int8 *)a1 + v4);
  v6 = v4 & 0xFFFFFFF8;
  if (v5 >= 2 && v6 != 0)
    v5 = *(_DWORD *)a1 + 2;
  if (v5 == 1)
  {
    v8 = *((unsigned __int8 *)a1 + v3);
    if (v8 < 3)
    {
      if (v8 != 2)
      {
        if (v8 == 1)

        else
          (*(void (**)(void))(v2 + 8))();
      }
    }
    else
    {
      if (v3 <= 3)
        v9 = v3;
      else
        v9 = 4;
      ((void (*)(void))((char *)&loc_2448D4840 + 4 * byte_2448F80C5[v9]))();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

_OWORD *sub_2448D48AC(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char v14;
  __int128 v15;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v5 + 64) <= 0x39uLL)
    v6 = 57;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if ((v6 & 0xFFFFFFFFFFFFFFF8) + 24 <= 8)
    v7 = 8;
  else
    v7 = (v6 & 0xFFFFFFFFFFFFFFF8) + 24;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
    v8 = *(_DWORD *)a2 + 2;
  if (v8 == 1)
  {
    v10 = *((unsigned __int8 *)a2 + v6);
    if (v10 >= 3)
    {
      if (v6 <= 3)
        v11 = v6;
      else
        v11 = 4;
      __asm { BR              X13 }
    }
    if (v10 == 2)
    {
      v15 = *((_OWORD *)a2 + 1);
      *a1 = *(_OWORD *)a2;
      a1[1] = v15;
      a1[2] = *((_OWORD *)a2 + 2);
      *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)((char *)a2 + 41);
      v14 = 2;
    }
    else if (v10 == 1)
    {
      v12 = *a2;
      v13 = (id)*a2;
      *(_QWORD *)a1 = v12;
      v14 = 1;
    }
    else
    {
      (*(void (**)(_OWORD *, uint64_t *))(v5 + 16))(a1, a2);
      v14 = 0;
    }
    *((_BYTE *)a1 + v6) = v14;
    *(_OWORD *)(((unint64_t)a1 + v6 + 8) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v6 + 8) & 0xFFFFFFFFFFFFF8);
    *((_BYTE *)a1 + v7) = 1;
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *((_BYTE *)a1 + v7) = 0;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2448D4A58(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if ((__int128 *)a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x39uLL)
      v7 = 57;
    else
      v7 = *(_QWORD *)(v6 + 64);
    if ((v7 & 0xFFFFFFFFFFFFFFF8) + 24 <= 8)
      v8 = 8;
    else
      v8 = (v7 & 0xFFFFFFFFFFFFFFF8) + 24;
    v9 = *(unsigned __int8 *)(a1 + v8);
    if (v9 >= 2 && (v8 & 0xFFFFFFF8) != 0)
      v9 = *(_DWORD *)a1 + 2;
    if (v9 == 1)
    {
      v11 = *(unsigned __int8 *)(a1 + v7);
      if (v11 >= 3)
      {
        if (v7 <= 3)
          v12 = v7;
        else
          v12 = 4;
        __asm { BR              X12 }
      }
      if (v11 != 2)
      {
        if (v11 == 1)

        else
          (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v13 = *((unsigned __int8 *)a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v13 >= 2)
      v13 = *(_DWORD *)a2 + 2;
    if (v13 == 1)
    {
      v15 = *((unsigned __int8 *)a2 + v7);
      if (v15 >= 3)
      {
        if (v7 <= 3)
          v16 = v7;
        else
          v16 = 4;
        __asm { BR              X12 }
      }
      if (v15 == 2)
      {
        v20 = *a2;
        v21 = a2[1];
        v22 = a2[2];
        *(_OWORD *)(a1 + 41) = *(__int128 *)((char *)a2 + 41);
        *(_OWORD *)(a1 + 16) = v21;
        *(_OWORD *)(a1 + 32) = v22;
        *(_OWORD *)a1 = v20;
        v19 = 2;
      }
      else if (v15 == 1)
      {
        v17 = *(id *)a2;
        v18 = *(id *)a2;
        *(_QWORD *)a1 = v17;
        v19 = 1;
      }
      else
      {
        (*(void (**)(uint64_t, __int128 *, uint64_t))(v6 + 16))(a1, a2, v5);
        v19 = 0;
      }
      *(_BYTE *)(a1 + v7) = v19;
      *(_OWORD *)((a1 + v7 + 1 + 7) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v7 + 8) & 0xFFFFFFFFFFFFF8);
      *(_BYTE *)(a1 + v8) = 1;
    }
    else
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_BYTE *)(a1 + v8) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

_OWORD *sub_2448D4CF8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v10;
  uint64_t v11;
  char v12;
  char v13;
  __int128 v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v5 + 64) <= 0x39uLL)
    v6 = 57;
  else
    v6 = *(_QWORD *)(v5 + 64);
  if ((v6 & 0xFFFFFFFFFFFFFFF8) + 24 <= 8)
    v7 = 8;
  else
    v7 = (v6 & 0xFFFFFFFFFFFFFFF8) + 24;
  v8 = *(unsigned __int8 *)(a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0)
    v8 = *(_DWORD *)a2 + 2;
  if (v8 == 1)
  {
    v10 = *(unsigned __int8 *)(a2 + v6);
    if (v10 >= 3)
    {
      if (v6 <= 3)
        v11 = v6;
      else
        v11 = 4;
      __asm { BR              X13 }
    }
    if (v10 == 2)
    {
      v14 = *(_OWORD *)(a2 + 16);
      *a1 = *(_OWORD *)a2;
      a1[1] = v14;
      a1[2] = *(_OWORD *)(a2 + 32);
      *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)(a2 + 41);
      v13 = 2;
    }
    else if (v10 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v13 = 1;
    }
    else
    {
      (*(void (**)(_OWORD *, uint64_t))(v5 + 32))(a1, a2);
      v13 = 0;
    }
    *((_BYTE *)a1 + v6) = v13;
    *(_OWORD *)(((unint64_t)a1 + v6 + 8) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((a2 + v6 + 1 + 7) & 0xFFFFFFFFFFFFF8);
    v12 = 1;
  }
  else
  {
    v12 = 0;
    *(_QWORD *)a1 = *(_QWORD *)a2;
  }
  *((_BYTE *)a1 + v7) = v12;
  return a1;
}

uint64_t sub_2448D4E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v15;
  uint64_t v16;
  char v17;
  char v18;
  __int128 v19;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x39uLL)
      v7 = 57;
    else
      v7 = *(_QWORD *)(v6 + 64);
    if ((v7 & 0xFFFFFFFFFFFFFFF8) + 24 <= 8)
      v8 = 8;
    else
      v8 = (v7 & 0xFFFFFFFFFFFFFFF8) + 24;
    v9 = *(unsigned __int8 *)(a1 + v8);
    if (v9 >= 2 && (v8 & 0xFFFFFFF8) != 0)
      v9 = *(_DWORD *)a1 + 2;
    if (v9 == 1)
    {
      v11 = *(unsigned __int8 *)(a1 + v7);
      if (v11 >= 3)
      {
        if (v7 <= 3)
          v12 = v7;
        else
          v12 = 4;
        __asm { BR              X12 }
      }
      if (v11 != 2)
      {
        if (v11 == 1)

        else
          (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v13 = *(unsigned __int8 *)(a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v13 >= 2)
      v13 = *(_DWORD *)a2 + 2;
    if (v13 == 1)
    {
      v15 = *(unsigned __int8 *)(a2 + v7);
      if (v15 >= 3)
      {
        if (v7 <= 3)
          v16 = v7;
        else
          v16 = 4;
        __asm { BR              X12 }
      }
      if (v15 == 2)
      {
        v19 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v19;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
        v18 = 2;
      }
      else if (v15 == 1)
      {
        *(_QWORD *)a1 = *(_QWORD *)a2;
        v18 = 1;
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
        v18 = 0;
      }
      *(_BYTE *)(a1 + v7) = v18;
      *(_OWORD *)((a1 + v7 + 1 + 7) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((a2 + v7 + 1 + 7) & 0xFFFFFFFFFFFFF8);
      v17 = 1;
    }
    else
    {
      v17 = 0;
      *(_QWORD *)a1 = *(_QWORD *)a2;
    }
    *(_BYTE *)(a1 + v8) = v17;
  }
  return a1;
}

uint64_t sub_2448D512C(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  unsigned int v7;
  int v8;
  int v10;
  int v11;
  unsigned int v12;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (v3 <= 0x39)
    v3 = 57;
  v4 = (v3 & 0xFFFFFFFFFFFFFFF8) + 24;
  if (v4 <= 8)
    v4 = 8;
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_22;
  v5 = v4 | 1;
  v6 = 8 * (v4 | 1);
  if ((v4 | 1) <= 3)
  {
    v7 = (a2 + ~(-1 << v6) - 254) >> v6;
    if (v7 > 0xFFFE)
    {
      v8 = *(_DWORD *)&a1[v5];
      if (!v8)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v7 > 0xFE)
    {
      v8 = *(unsigned __int16 *)&a1[v5];
      if (!*(_WORD *)&a1[v5])
        goto LABEL_22;
      goto LABEL_15;
    }
    if (!v7)
      goto LABEL_22;
  }
  v8 = a1[v5];
  if (!a1[v5])
  {
LABEL_22:
    v12 = a1[v4];
    if (v12 >= 2)
      return (v12 ^ 0xFF) + 1;
    else
      return 0;
  }
LABEL_15:
  v10 = (v8 - 1) << v6;
  if (v5 >= 4)
    v10 = 0;
  if ((_DWORD)v5 == 1)
    v11 = *a1;
  else
    v11 = *(_DWORD *)a1;
  return (v11 | v10) + 255;
}

void sub_2448D520C(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  unint64_t v6;
  size_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x39)
    v5 = 57;
  v6 = (v5 & 0xFFFFFFFFFFFFFFF8) + 24;
  if (v6 <= 8)
    v6 = 8;
  v7 = v6 | 1;
  if (a3 < 0xFF)
  {
    v8 = 0;
  }
  else if (v7 <= 3)
  {
    v10 = (a3 + ~(-1 << (8 * v7)) - 254) >> (8 * v7);
    if (v10 > 0xFFFE)
    {
      v8 = 4u;
    }
    else if (v10 >= 0xFF)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 != 0;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v9 = a2 - 255;
  if (v7 < 4)
  {
    v9 &= ~(-1 << (8 * v7));
    bzero(a1, v7);
    if ((_DWORD)v7 == 1)
    {
      *a1 = v9;
      goto LABEL_20;
    }
  }
  else
  {
    bzero(a1, v6 | 1);
  }
  *(_DWORD *)a1 = v9;
LABEL_20:
  __asm { BR              X10 }
}

uint64_t sub_2448D53A8(_DWORD *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (v2 <= 0x39)
    v2 = 57;
  v3 = (v2 & 0xFFFFFFFFFFFFFFF8) + 24;
  v4 = 8;
  if (v3 > 8)
    v4 = v3;
  v5 = *((unsigned __int8 *)a1 + v4);
  v6 = v4 & 0xFFFFFFF8;
  if (v5 >= 2 && v6 != 0)
    return (*a1 + 2);
  return v5;
}

void sub_2448D53F8(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v4;
  size_t v5;
  char v6;
  unsigned int v7;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (v4 <= 0x39)
    v4 = 57;
  v5 = (v4 & 0xFFFFFFFFFFFFFFF8) + 24;
  if (v5 <= 8)
    v5 = 8;
  if (a2 > 1)
  {
    if ((_DWORD)v5)
      v6 = 2;
    else
      v6 = a2;
    if ((_DWORD)v5)
      v7 = a2 - 2;
    else
      v7 = 0;
    a1[v5] = v6;
    bzero(a1, v5);
    *(_DWORD *)a1 = v7;
  }
  else
  {
    a1[v5] = a2;
  }
}

uint64_t sub_2448D5478@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;

  return sub_2448D33A0(a1, v2[3], v2[4], v2[5], v2[2], a2);
}

uint64_t sub_2448D5494(uint64_t (**a1)(_QWORD))
{
  uint64_t v1;

  return (*a1)(*(_QWORD *)(v1 + 24));
}

uint64_t sub_2448D54C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448D54E8(uint64_t a1)
{
  uint64_t v1;

  return sub_2448D37FC(a1, *(uint64_t (**)(char *))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16));
}

uint64_t sub_2448D54F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for FutureTermination(255, *(_QWORD *)(v4 + 16), a3, a4);
  v5 = sub_2448EAF44();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
  return swift_deallocObject();
}

uint64_t sub_2448D5574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(v4 + 16);
  type metadata accessor for FutureTermination(255, v6, a3, a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(sub_2448EAF44() - 8) + 80);
  sub_2448D5600(a1, v4 + ((v7 + 24) & ~v7), v6, v8);
  v11 = type metadata accessor for FutureTermination(0, v6, v9, v10);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
}

uint64_t sub_2448D5600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5 = type metadata accessor for FutureTermination(0, a3, a3, a4);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - v7, a1, v5);
  sub_2448EAF44();
  return sub_2448EAF38();
}

void sub_2448D56A0(uint64_t a1)
{
  uint64_t *v1;

  sub_2448D3F0C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2448D56AC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448D56E0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t *v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = v1[5];
  v8 = (uint64_t *)v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_2447C62E8;
  return sub_2448D4010(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2448D5760@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return sub_2448D31D0(a1, v2[3], v2[4], v2[2], a2);
}

uint64_t WeakSet.init()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v5 = type metadata accessor for Weak(0, a1, a2, a3);
  v6 = sub_2448EAE54();
  if (MEMORY[0x2495196B0](v6, v5))
  {
    v7 = MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v5);
    v8 = sub_2448D5F18(v6, v5, v7);
  }
  else
  {
    v8 = MEMORY[0x24BEE4B08];
  }
  result = swift_bridgeObjectRelease();
  *a4 = v8;
  return result;
}

uint64_t WeakSet.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD v14[8];

  v14[2] = a2;
  v14[3] = a3;
  v14[4] = a4;
  v9 = type metadata accessor for Weak(0, a2, a3, a4);
  v14[6] = sub_2448CDDF0((void (*)(char *, char *))sub_24484C570, (uint64_t)v14, a3, v9, MEMORY[0x24BEE4078], a4, MEMORY[0x24BEE40A8], v10);
  v11 = sub_2448EAEE4();
  MEMORY[0x24951AC70](MEMORY[0x24BEE12E0], v11);
  MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v9);
  v12 = Collection<>.uniqued()(v11);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
  result = swift_bridgeObjectRelease();
  *a5 = v12;
  return result;
}

uint64_t WeakSet.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v8 = a1;
  v5 = sub_2448EAEE4();
  v6 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v5);
  result = WeakSet.init<A>(_:)((uint64_t)&v8, a2, v5, v6, &v9);
  *a3 = v9;
  return result;
}

uint64_t WeakSet.array.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for Weak(255, *(_QWORD *)(a1 + 16), a3, a4);
  swift_bridgeObjectRetain();
  MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v4);
  v5 = sub_2448EB160();
  MEMORY[0x24951AC70](MEMORY[0x24BEE1718], v5);
  v6 = sub_2448EACE0();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t WeakSet.startIndex.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2448D5A54(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE1590], a3, a4);
}

uint64_t WeakSet.endIndex.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2448D5A54(a1, MEMORY[0x24BEE1698], a3, a4);
}

uint64_t sub_2448D5A54(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v4;
  v7 = type metadata accessor for Weak(0, *(_QWORD *)(a1 + 16), a3, a4);
  v8 = MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v7);
  return a2(v6, v7, v8);
}

uint64_t WeakSet.index(after:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for Weak(0, *(_QWORD *)(a4 + 16), a3, a4);
  MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v4);
  return sub_2448EB0F4();
}

uint64_t WeakSet.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = type metadata accessor for Weak(0, *(_QWORD *)(a4 + 16), a3, a4);
  MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v4);
  sub_2448EB178();
  swift_beginAccess();
  v5 = MEMORY[0x24951AE5C](v7 + 16);
  swift_release();
  return v5;
}

uint64_t WeakSet.insert(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for Weak(0, *(_QWORD *)(a2 + 16), a3, a4);
  sub_2448D173C();
  MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v4);
  sub_2448EB160();
  sub_2448EB10C();
  return swift_release();
}

uint64_t WeakSet.remove(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for Weak(0, *(_QWORD *)(a2 + 16), a3, a4);
  sub_2448D173C();
  MEMORY[0x24951AC70](&protocol conformance descriptor for Weak<A>, v4);
  sub_2448EB160();
  sub_2448EB118();
  swift_release();
  return swift_release();
}

uint64_t sub_2448D5D00@<X0>(uint64_t a1@<X8>)
{
  return sub_2447DB438((uint64_t (*)(void))WeakSet.startIndex.getter, a1);
}

uint64_t sub_2448D5D0C@<X0>(uint64_t a1@<X8>)
{
  return sub_2447DB438((uint64_t (*)(void))WeakSet.endIndex.getter, a1);
}

void (*sub_2448D5D18(uint64_t **a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;
  uint64_t (*v7)();
  uint64_t v8;

  v6 = (uint64_t *)malloc(0x30uLL);
  *a1 = v6;
  v7 = sub_2448D5D7C(v6, *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16), a3);
  v6[4] = v8;
  v6[5] = (uint64_t)v7;
  return sub_24484C444;
}

uint64_t (*sub_2448D5D7C(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5))()
{
  *a1 = WeakSet.subscript.getter(a2, a3, a4 & 1, a5);
  return sub_24484C4A8;
}

uint64_t sub_2448D5DC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  char v6;

  result = WeakSet.index(after:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16), a2);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = v6 & 1;
  return result;
}

uint64_t sub_2448D5DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t result;

  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(unsigned __int8 *)(a1 + 16);
  v6 = WeakSet.index(after:)(*(_QWORD *)a1, v4, v5, a2);
  v8 = v7;
  v10 = v9;
  result = sub_2447DDA3C(v3, v4, v5);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v8;
  *(_BYTE *)(a1 + 16) = v10 & 1;
  return result;
}

uint64_t sub_2448D5E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char v10;

  v7 = *v5;
  result = WeakSet.startIndex.getter(a1, a2, a3, a4);
  *(_QWORD *)a5 = v7;
  *(_QWORD *)(a5 + 8) = result;
  *(_QWORD *)(a5 + 16) = v9;
  *(_BYTE *)(a5 + 24) = v10 & 1;
  return result;
}

uint64_t sub_2448D5EB0(uint64_t a1)
{
  MEMORY[0x24951AC70](&protocol conformance descriptor for WeakSet<A>, a1);
  return sub_2448EB22C();
}

uint64_t sub_2448D5EE4(uint64_t a1)
{
  MEMORY[0x24951AC70](&protocol conformance descriptor for WeakSet<A>, a1);
  return sub_2448EB238();
}

uint64_t sub_2448D5F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, unint64_t, uint64_t);
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a1;
  v45 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v37 - v10;
  v37 = v11;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v37 - v13;
  if (MEMORY[0x249519668](v12))
  {
    sub_2448EB76C();
    v15 = sub_2448EB760();
  }
  else
  {
    v15 = MEMORY[0x24BEE4B08];
  }
  v40 = MEMORY[0x2495196B0](v5, a2);
  if (!v40)
    return v15;
  v16 = 0;
  v43 = v15 + 56;
  v38 = v14;
  v39 = v5;
  while (1)
  {
    v17 = sub_2448EAE6C();
    sub_2448EAE18();
    if ((v17 & 1) != 0)
    {
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, v5+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v16, a2);
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
        goto LABEL_20;
    }
    else
    {
      result = sub_2448EB7F0();
      if (v37 != 8)
        goto LABEL_23;
      v46 = result;
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, (unint64_t)&v46, a2);
      swift_unknownObjectRelease();
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
      {
LABEL_20:
        __break(1u);
        return v15;
      }
    }
    v21 = v45;
    v41 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
    v42 = v20;
    v41(v44, v14, a2);
    v22 = sub_2448EA914();
    v23 = -1 << *(_BYTE *)(v15 + 32);
    v24 = v22 & ~v23;
    v25 = v24 >> 6;
    v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
    v27 = 1 << v24;
    v28 = *(_QWORD *)(v21 + 72);
    if (((1 << v24) & v26) != 0)
    {
      v29 = ~v23;
      do
      {
        v18(v8, *(_QWORD *)(v15 + 48) + v28 * v24, a2);
        v30 = a3;
        v31 = sub_2448EAA64();
        v32 = *(void (**)(char *, uint64_t))(v45 + 8);
        v32(v8, a2);
        if ((v31 & 1) != 0)
        {
          v32(v44, a2);
          a3 = v30;
          v14 = v38;
          v5 = v39;
          goto LABEL_7;
        }
        v24 = (v24 + 1) & v29;
        v25 = v24 >> 6;
        v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
        v27 = 1 << v24;
        a3 = v30;
      }
      while ((v26 & (1 << v24)) != 0);
      v14 = v38;
      v5 = v39;
    }
    v33 = v44;
    *(_QWORD *)(v43 + 8 * v25) = v27 | v26;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(*(_QWORD *)(v15 + 48) + v28 * v24, v33, a2);
    v35 = *(_QWORD *)(v15 + 16);
    v19 = __OFADD__(v35, 1);
    v36 = v35 + 1;
    if (v19)
      break;
    *(_QWORD *)(v15 + 16) = v36;
LABEL_7:
    v16 = v42;
    if (v42 == v40)
      return v15;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

void sub_2448D6220()
{
  JUMPOUT(0x24951AC70);
}

void sub_2448D6230()
{
  JUMPOUT(0x24951AC70);
}

uint64_t type metadata accessor for WeakSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakSet);
}

void CrashReportError.ConditionInFileError.init(report:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  unsigned __int8 *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int8 *v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  unsigned __int8 *v59;
  unsigned int v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v4 = type metadata accessor for CrashReportError.ConditionInFileError();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CrashReport(0);
  if (!*(_QWORD *)(a1 + *(int *)(v8 + 36)))
    goto LABEL_13;
  v9 = v8;
  v10 = swift_bridgeObjectRetain();
  v11 = sub_2448D67BC(v10);
  if (!*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_13:
    sub_244811324(a1);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
    return;
  }
  v63 = 0;
  v64 = v4;
  v65 = v5;
  v66 = a2;
  v12 = *(_QWORD *)(v11 + 40);
  v13 = *(_QWORD *)(v11 + 48);
  v14 = *(void **)(v11 + 64);
  v15 = *(_BYTE *)(v11 + 56);
  v16 = *(id *)(v11 + 32);
  sub_2447BE020(v12, v13, v15);
  v17 = v14;
  swift_bridgeObjectRelease();
  v18 = v16;
  swift_bridgeObjectRelease();
  v19 = (_QWORD *)(a1 + *(int *)(v9 + 20));
  v20 = v19[1];
  *(_QWORD *)v7 = *v19;
  *((_QWORD *)v7 + 1) = v20;
  *((_QWORD *)v7 + 2) = v12;
  *((_QWORD *)v7 + 3) = v13;
  v7[32] = v15;
  swift_bridgeObjectRetain();
  v21 = (void *)sub_2448EAA70();
  v22 = objc_msgSend(v17, sel_rangeWithName_, v21);
  v24 = v23;

  v25 = objc_msgSend(v16, sel_substringWithRange_, v22, v24);
  v26 = sub_2448EAA94();
  v28 = v27;

  v67 = v26;
  v68 = v28;
  *((_QWORD *)v7 + 5) = sub_2448EAC98();
  *((_QWORD *)v7 + 6) = v29;
  v30 = (void *)sub_2448EAA70();
  v31 = objc_msgSend(v17, sel_rangeWithName_, v30);
  v33 = v32;

  v34 = objc_msgSend(v16, sel_substringWithRange_, v31, v33);
  v35 = sub_2448EAA94();
  v37 = v36;

  v38 = HIBYTE(v37) & 0xF;
  v39 = v35 & 0xFFFFFFFFFFFFLL;
  if ((v37 & 0x2000000000000000) != 0)
    v40 = HIBYTE(v37) & 0xF;
  else
    v40 = v35 & 0xFFFFFFFFFFFFLL;
  if (!v40)
  {

    swift_bridgeObjectRelease();
    v58 = 0;
    v57 = 1;
    v42 = v64;
    v43 = v65;
    v44 = v66;
LABEL_51:
    *((_QWORD *)v7 + 7) = v58;
    v7[64] = v57 & 1;
    sub_2447BD1BC(a1, (uint64_t)&v7[*(int *)(v42 + 32)], type metadata accessor for CrashReport);
    sub_2447BD1BC((uint64_t)v7, v44, (uint64_t (*)(_QWORD))type metadata accessor for CrashReportError.ConditionInFileError);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v44, 0, 1, v42);
    return;
  }
  v41 = v17;
  v42 = v64;
  v43 = v65;
  v44 = v66;
  if ((v37 & 0x1000000000000000) != 0)
  {
    v46 = (uint64_t)sub_2448D7398(v35, v37, 10);
    LOBYTE(v35) = v62;
LABEL_48:

    swift_bridgeObjectRelease();
    v57 = v35 & 1;
    if ((v35 & 1) != 0)
      v58 = 0;
    else
      v58 = v46;
    goto LABEL_51;
  }
  if ((v37 & 0x2000000000000000) == 0)
  {
    if ((v35 & 0x1000000000000000) != 0)
      v45 = (unsigned __int8 *)((v37 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v45 = (unsigned __int8 *)sub_2448EB820();
    v46 = (uint64_t)sub_2448D747C(v45, v39, 10);
    LOBYTE(v35) = v47 & 1;
    goto LABEL_48;
  }
  v67 = v35;
  v68 = v37 & 0xFFFFFFFFFFFFFFLL;
  if (v35 == 43)
  {
    if (!v38)
      goto LABEL_62;
    if (v38 == 1 || (BYTE1(v35) - 48) > 9u)
      goto LABEL_35;
    v46 = (BYTE1(v35) - 48);
    if (v38 != 2)
    {
      if ((BYTE2(v35) - 48) > 9u)
        goto LABEL_35;
      v46 = 10 * (BYTE1(v35) - 48) + (BYTE2(v35) - 48);
      v48 = v38 - 3;
      if (v48)
      {
        v49 = (unsigned __int8 *)&v67 + 3;
        while (1)
        {
          v50 = *v49 - 48;
          if (v50 > 9)
            goto LABEL_35;
          v51 = 10 * v46;
          if ((unsigned __int128)(v46 * (__int128)10) >> 64 != (10 * v46) >> 63)
            goto LABEL_35;
          v46 = v51 + v50;
          if (__OFADD__(v51, v50))
            goto LABEL_35;
          LOBYTE(v35) = 0;
          ++v49;
          if (!--v48)
            goto LABEL_48;
        }
      }
    }
LABEL_47:
    LOBYTE(v35) = 0;
    goto LABEL_48;
  }
  if (v35 != 45)
  {
    if (!v38 || (v35 - 48) > 9u)
      goto LABEL_35;
    v46 = (v35 - 48);
    if (v38 != 1)
    {
      if ((BYTE1(v35) - 48) > 9u)
        goto LABEL_35;
      v46 = 10 * (v35 - 48) + (BYTE1(v35) - 48);
      v52 = v38 - 2;
      if (v52)
      {
        v53 = (unsigned __int8 *)&v67 + 2;
        while (1)
        {
          v54 = *v53 - 48;
          if (v54 > 9)
            goto LABEL_35;
          v55 = 10 * v46;
          if ((unsigned __int128)(v46 * (__int128)10) >> 64 != (10 * v46) >> 63)
            goto LABEL_35;
          v46 = v55 + v54;
          if (__OFADD__(v55, v54))
            goto LABEL_35;
          LOBYTE(v35) = 0;
          ++v53;
          if (!--v52)
            goto LABEL_48;
        }
      }
    }
    goto LABEL_47;
  }
  if (v38)
  {
    if (v38 != 1 && (BYTE1(v35) - 48) <= 9u)
    {
      if (v38 == 2)
      {
        LOBYTE(v35) = 0;
        v46 = -(uint64_t)(BYTE1(v35) - 48);
        goto LABEL_48;
      }
      if ((BYTE2(v35) - 48) <= 9u)
      {
        v46 = -10 * (BYTE1(v35) - 48) - (BYTE2(v35) - 48);
        v56 = v38 - 3;
        if (!v56)
          goto LABEL_47;
        v59 = (unsigned __int8 *)&v67 + 3;
        while (1)
        {
          v60 = *v59 - 48;
          if (v60 > 9)
            break;
          v61 = 10 * v46;
          if ((unsigned __int128)(v46 * (__int128)10) >> 64 != (10 * v46) >> 63)
            break;
          v46 = v61 - v60;
          if (__OFSUB__(v61, v60))
            break;
          LOBYTE(v35) = 0;
          ++v59;
          if (!--v56)
            goto LABEL_48;
        }
      }
    }
LABEL_35:
    v46 = 0;
    LOBYTE(v35) = 1;
    goto LABEL_48;
  }
  __break(1u);
LABEL_62:
  __break(1u);
}

uint64_t sub_2448D67BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  int64_t v5;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t i;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  int v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 v49;
  void *v50;
  id v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  uint64_t v57;
  int64_t v58;
  int64_t v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  id v68;

  v57 = a1 + 64;
  v1 = 1 << *(_BYTE *)(a1 + 32);
  v2 = -1;
  if (v1 < 64)
    v2 = ~(-1 << v1);
  v3 = v2 & *(_QWORD *)(a1 + 64);
  v58 = (unint64_t)(v1 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v5 = 0;
  v6 = 0x257389000uLL;
  v7 = &unk_257391000;
  v56 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v3)
    goto LABEL_5;
LABEL_4:
  v8 = __clz(__rbit64(v3));
  v3 &= v3 - 1;
  for (i = v8 | (v5 << 6); ; i = __clz(__rbit64(v11)) + (v5 << 6))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i) + 16);
    if (v13)
    {
      v60 = v5;
      v61 = v3;
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i);
      swift_bridgeObjectRetain_n();
      v15 = v14 + 40;
      v63 = (_QWORD *)MEMORY[0x24BEE4AF8];
      while (1)
      {
        swift_bridgeObjectRetain();
        v16 = (void *)sub_2448EAA70();
        if (*(_QWORD *)(v6 + 3568) == -1)
        {
          v17 = (void *)v7[382];
          if (!v17)
            goto LABEL_22;
        }
        else
        {
          swift_once();
          v17 = (void *)v7[382];
          if (!v17)
          {
LABEL_22:
            swift_bridgeObjectRelease();
            goto LABEL_23;
          }
        }
        v18 = v17;
        v19 = (void *)sub_2448EAA70();
        v20 = objc_msgSend(v18, sel_firstMatchInString_options_range_, v19, 0, 0, sub_2448EAB78());

        if (v20)
        {
          v66 = v18;
          v21 = (void *)sub_2448EAA70();
          v68 = v20;
          v22 = objc_msgSend(v20, sel_rangeWithName_, v21);
          v24 = v23;

          v67 = v16;
          if (v24 <= 0)
          {
            v64 = 0;
            v65 = 0;
          }
          else
          {
            v25 = objc_msgSend(v16, sel_substringWithRange_, v22, v24);
            sub_2448EAA94();

            v64 = sub_2448EAC98();
            v65 = v26;
          }
          v27 = (void *)sub_2448EAA70();
          v28 = objc_msgSend(v20, sel_rangeWithName_, v27);
          v30 = v29;

          v31 = objc_msgSend(v67, sel_substringWithRange_, v28, v30);
          sub_2448EAA94();

          v32 = sub_2448EAC98();
          v34 = sub_2448D76F8(v32, v33, v64, v65);
          v36 = v35;
          v38 = v37;
          v39 = ~v37;
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v39)
          {
            v40 = v63;
            v41 = v34;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v40 = sub_2447C1DA0(0, v63[2] + 1, 1, v63);
            v43 = v40[2];
            v42 = v40[3];
            if (v43 >= v42 >> 1)
              v40 = sub_2447C1DA0((_QWORD *)(v42 > 1), v43 + 1, 1, v40);
            v40[2] = v43 + 1;
            v63 = v40;
            v44 = &v40[5 * v43];
            v44[4] = v67;
            v44[5] = v41;
            v44[6] = v36;
            *((_BYTE *)v44 + 56) = v38;
            v44[8] = v68;
            v7 = (_QWORD *)&unk_257391000;
            v6 = 0x257389000;
          }
          else
          {

            v6 = 0x257389000;
            v7 = (_QWORD *)&unk_257391000;
          }
          goto LABEL_24;
        }
        swift_bridgeObjectRelease();

LABEL_23:
LABEL_24:
        v15 += 16;
        if (!--v13)
        {
          swift_bridgeObjectRelease_n();
          v5 = v60;
          v3 = v61;
          v45 = v63;
          if (!v63[2])
            goto LABEL_42;
LABEL_45:
          v62 = v3;
          v46 = v5;
          v47 = v45[5];
          v48 = v45[6];
          v49 = *((_BYTE *)v45 + 56);
          v50 = (void *)v45[8];
          v51 = (id)v45[4];
          sub_2447BE020(v47, v48, v49);
          v52 = v50;
          swift_bridgeObjectRelease();
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_2447C1DA0(0, v56[2] + 1, 1, v56);
            v56 = (_QWORD *)result;
          }
          v54 = v56[2];
          v53 = v56[3];
          if (v54 >= v53 >> 1)
          {
            result = (uint64_t)sub_2447C1DA0((_QWORD *)(v53 > 1), v54 + 1, 1, v56);
            v56 = (_QWORD *)result;
          }
          v56[2] = v54 + 1;
          v55 = &v56[5 * v54];
          v55[4] = v51;
          v55[5] = v47;
          v55[6] = v48;
          *((_BYTE *)v55 + 56) = v49;
          v55[8] = v52;
          v7 = (_QWORD *)&unk_257391000;
          v5 = v46;
          v3 = v62;
          if (!v62)
            goto LABEL_5;
          goto LABEL_4;
        }
      }
    }
    v45 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
      goto LABEL_45;
LABEL_42:
    result = swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_4;
LABEL_5:
    v10 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_53;
    }
    if (v10 >= v58)
      goto LABEL_51;
    v11 = *(_QWORD *)(v57 + 8 * v10);
    ++v5;
    if (!v11)
    {
      v5 = v10 + 1;
      if (v10 + 1 >= v58)
        goto LABEL_51;
      v11 = *(_QWORD *)(v57 + 8 * v5);
      if (!v11)
      {
        v5 = v10 + 2;
        if (v10 + 2 >= v58)
          goto LABEL_51;
        v11 = *(_QWORD *)(v57 + 8 * v5);
        if (!v11)
        {
          v5 = v10 + 3;
          if (v10 + 3 >= v58)
            goto LABEL_51;
          v11 = *(_QWORD *)(v57 + 8 * v5);
          if (!v11)
          {
            v12 = v10 + 4;
            if (v12 >= v58)
            {
LABEL_51:
              swift_release();
              return (uint64_t)v56;
            }
            v11 = *(_QWORD *)(v57 + 8 * v12);
            v5 = v12;
            if (!v11)
              break;
          }
        }
      }
    }
LABEL_19:
    v3 = (v11 - 1) & v11;
  }
  while (1)
  {
    v5 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v5 >= v58)
      goto LABEL_51;
    v11 = *(_QWORD *)(v57 + 8 * v5);
    ++v12;
    if (v11)
      goto LABEL_19;
  }
LABEL_53:
  __break(1u);
  return result;
}

uint64_t CrashReportError.ConditionInFileError.processName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrashReportError.ConditionInFileError.kind.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_2447BE020(v1, *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
  return v1;
}

uint64_t CrashReportError.ConditionInFileError.file.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrashReportError.ConditionInFileError.line.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t CrashReportError.ConditionInFileError.crashReport.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for CrashReportError.ConditionInFileError() + 32);
  return sub_2447F1688(v3, a1);
}

void sub_2448D6EA0(uint64_t a1)
{
  _s20PreviewsFoundationOS16CrashReportErrorV015ConditionInFileF0V4KindO2eeoiySbAG_AGtFZ_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void CrashReportError.ConditionInFileError.highValueTitle.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_2448D6EF0()
{
  swift_bridgeObjectRetain();
  sub_2448EABC0();
  swift_bridgeObjectRelease();
  return 0x6920747265737341;
}

void CrashReportError.ConditionInFileError.additionalInfo.getter()
{
  sub_2448EB79C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_2448EABC0();
  __asm { BR              X9 }
}

uint64_t sub_2448D709C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v5;

  sub_2448EABC0();
  swift_bridgeObjectRelease();
  sub_2448EABC0();
  swift_bridgeObjectRetain();
  sub_2448EABC0();
  swift_bridgeObjectRelease();
  if ((*(_BYTE *)(v3 + 64) & 1) == 0)
  {
    sub_2448EBB5C();
    sub_2448EABC0();
    swift_bridgeObjectRelease();
  }
  sub_2448EABC0();
  swift_bridgeObjectRelease();
  sub_2448EABC0();
  if (v2 <= 2 && v1)
  {
    sub_2447BE020(v0, v1, v2);
    sub_2448EABC0();
    sub_2447BE24C(v0, v1, v2);
    swift_bridgeObjectRetain();
    sub_2448EABC0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

id sub_2448D7268()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  result = sub_2448A3104(0xD000000000000048, 0x80000002448FDAB0, 0);
  qword_257391BF0 = (uint64_t)result;
  return result;
}

void sub_2448D731C()
{
  off_257391BF8 = &unk_25157D690;
}

uint64_t sub_2448D7330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2447F1688(v2 + *(int *)(a1 + 32), a2);
}

unsigned __int8 *sub_2448D7348(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_2448D747C(a1, a2, a3);
}

uint64_t type metadata accessor for CrashReportError.ConditionInFileError()
{
  uint64_t result;

  result = qword_257391C58;
  if (!qword_257391C58)
    return swift_getSingletonMetadata();
  return result;
}

unsigned __int8 *sub_2448D7398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_2448EAC98();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_2448CC194();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_2448EB820();
  }
LABEL_7:
  v11 = sub_2448D747C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_2448D747C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_2448D76F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(_QWORD *__return_ptr, uint64_t *);
  void (*v16)(char *__return_ptr, _QWORD *, uint64_t *);
  uint64_t v18;
  _QWORD v19[2];
  char v20;
  uint64_t v21;
  uint64_t v22;

  v6 = sub_2448EA938();
  v8 = v7;
  if (a4)
  {
    v9 = sub_2448EA938();
    v11 = v10;
  }
  else
  {
    v11 = 0;
    v9 = a3;
  }
  if (qword_257389DF8 != -1)
    swift_once();
  v12 = (char *)off_257391BF8;
  v13 = *((_QWORD *)off_257391BF8 + 2);
  if (v13)
  {
    v18 = a4;
    swift_bridgeObjectRetain_n();
    v14 = v12 + 56;
    while (1)
    {
      v15 = (void (*)(_QWORD *__return_ptr, uint64_t *))*((_QWORD *)v14 - 1);
      v16 = (void (*)(char *__return_ptr, _QWORD *, uint64_t *))*((_QWORD *)v14 - 3);
      v19[0] = v6;
      v19[1] = v8;
      v21 = v9;
      v22 = v11;
      swift_retain();
      swift_retain();
      v16(&v20, v19, &v21);
      if ((v20 & 1) != 0)
        break;
      swift_release();
      swift_release();
      v14 += 32;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        goto LABEL_12;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v21 = a3;
    v22 = v18;
    v15(v19, &v21);
    swift_release();
    return v19[0];
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
}

void _s20PreviewsFoundationOS16CrashReportErrorV015ConditionInFileF0V4KindO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

BOOL sub_2448D78C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
    return 0;
  if (a2)
    return a5 && (a1 == a4 && a2 == a5 || (sub_2448EBBEC() & 1) != 0);
  if (!a5)
    return 1;
  sub_2447BE24C(a1, 0, 0);
  return 0;
}

uint64_t _s20ConditionInFileErrorVwCP(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  int *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v36 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v36 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[2];
    v9 = a2[3];
    v10 = *((_BYTE *)a2 + 32);
    swift_bridgeObjectRetain();
    sub_2447BE020(v8, v9, v10);
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v9;
    *(_BYTE *)(a1 + 32) = v10;
    v11 = a2[6];
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_QWORD *)(a1 + 48) = v11;
    *(_QWORD *)(a1 + 56) = a2[7];
    v12 = *((_BYTE *)a2 + 64);
    v13 = *(int *)(a3 + 32);
    v14 = a1 + v13;
    v15 = (uint64_t)a2 + v13;
    *(_BYTE *)(a1 + 64) = v12;
    v16 = sub_2448EA548();
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    swift_bridgeObjectRetain();
    v17(v14, v15, v16);
    v18 = (int *)type metadata accessor for CrashReport(0);
    v19 = v18[5];
    v20 = (_QWORD *)(v14 + v19);
    v21 = (_QWORD *)(v15 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = v18[6];
    v24 = (_QWORD *)(v14 + v23);
    v25 = (_QWORD *)(v15 + v23);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    *(_DWORD *)(v14 + v18[7]) = *(_DWORD *)(v15 + v18[7]);
    v27 = v18[8];
    v28 = v14 + v27;
    v29 = v15 + v27;
    v30 = sub_2448EA500();
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v31(v28, v29, v30);
    *(_QWORD *)(v14 + v18[9]) = *(_QWORD *)(v15 + v18[9]);
    *(_QWORD *)(v14 + v18[10]) = *(_QWORD *)(v15 + v18[10]);
    *(_QWORD *)(v14 + v18[11]) = *(_QWORD *)(v15 + v18[11]);
    v32 = v18[12];
    v33 = (_QWORD *)(v14 + v32);
    v34 = (_QWORD *)(v15 + v32);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s20ConditionInFileErrorVwxx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  sub_2447BE24C(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = type metadata accessor for CrashReport(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v4 + *(int *)(v6 + 32);
  v8 = sub_2448EA500();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s20ConditionInFileErrorVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  int *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_2447BE020(v7, v8, v9);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = v8;
  *(_BYTE *)(a1 + 32) = v9;
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  v12 = *(int *)(a3 + 32);
  v13 = a1 + v12;
  v14 = a2 + v12;
  *(_BYTE *)(a1 + 64) = v11;
  v15 = sub_2448EA548();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  v16(v13, v14, v15);
  v17 = (int *)type metadata accessor for CrashReport(0);
  v18 = v17[5];
  v19 = (_QWORD *)(v13 + v18);
  v20 = (_QWORD *)(v14 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = v17[6];
  v23 = (_QWORD *)(v13 + v22);
  v24 = (_QWORD *)(v14 + v22);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  *(_DWORD *)(v13 + v17[7]) = *(_DWORD *)(v14 + v17[7]);
  v26 = v17[8];
  v27 = v13 + v26;
  v28 = v14 + v26;
  v29 = sub_2448EA500();
  v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v30(v27, v28, v29);
  *(_QWORD *)(v13 + v17[9]) = *(_QWORD *)(v14 + v17[9]);
  *(_QWORD *)(v13 + v17[10]) = *(_QWORD *)(v14 + v17[10]);
  *(_QWORD *)(v13 + v17[11]) = *(_QWORD *)(v14 + v17[11]);
  v31 = v17[12];
  v32 = (_QWORD *)(v13 + v31);
  v33 = (_QWORD *)(v14 + v31);
  v34 = v33[1];
  *v32 = *v33;
  v32[1] = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s20ConditionInFileErrorVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(_BYTE *)(a2 + 32);
  sub_2447BE020(v6, v7, v8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  v11 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v8;
  sub_2447BE24C(v9, v10, v11);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v12;
  v13 = *(int *)(a3 + 32);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = (int *)type metadata accessor for CrashReport(0);
  v18 = v17[5];
  v19 = (_QWORD *)(v14 + v18);
  v20 = (_QWORD *)(v15 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = v17[6];
  v22 = (_QWORD *)(v14 + v21);
  v23 = (_QWORD *)(v15 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(v14 + v17[7]) = *(_DWORD *)(v15 + v17[7]);
  v24 = v17[8];
  v25 = v14 + v24;
  v26 = v15 + v24;
  v27 = sub_2448EA500();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 24))(v25, v26, v27);
  *(_QWORD *)(v14 + v17[9]) = *(_QWORD *)(v15 + v17[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + v17[10]) = *(_QWORD *)(v15 + v17[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + v17[11]) = *(_QWORD *)(v15 + v17[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = v17[12];
  v29 = (_QWORD *)(v14 + v28);
  v30 = (_QWORD *)(v15 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s20ConditionInFileErrorVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v5 = *(int *)(a3 + 32);
  v6 = a2 + v5;
  v7 = a1 + v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v8 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, v6, v8);
  v9 = (int *)type metadata accessor for CrashReport(0);
  *(_OWORD *)(v7 + v9[5]) = *(_OWORD *)(v6 + v9[5]);
  *(_OWORD *)(v7 + v9[6]) = *(_OWORD *)(v6 + v9[6]);
  *(_DWORD *)(v7 + v9[7]) = *(_DWORD *)(v6 + v9[7]);
  v10 = v9[8];
  v11 = v7 + v10;
  v12 = v6 + v10;
  v13 = sub_2448EA500();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  *(_QWORD *)(v7 + v9[9]) = *(_QWORD *)(v6 + v9[9]);
  *(_QWORD *)(v7 + v9[10]) = *(_QWORD *)(v6 + v9[10]);
  *(_QWORD *)(v7 + v9[11]) = *(_QWORD *)(v6 + v9[11]);
  *(_OWORD *)(v7 + v9[12]) = *(_OWORD *)(v6 + v9[12]);
  return a1;
}

uint64_t _s20ConditionInFileErrorVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_BYTE *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v10 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_2447BE24C(v8, v9, v10);
  v11 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v12 = *(int *)(a3 + 32);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = (int *)type metadata accessor for CrashReport(0);
  v17 = v16[5];
  v18 = (_QWORD *)(v13 + v17);
  v19 = (uint64_t *)(v14 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v16[6];
  v23 = (_QWORD *)(v13 + v22);
  v24 = (uint64_t *)(v14 + v22);
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  *(_DWORD *)(v13 + v16[7]) = *(_DWORD *)(v14 + v16[7]);
  v27 = v16[8];
  v28 = v13 + v27;
  v29 = v14 + v27;
  v30 = sub_2448EA500();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 40))(v28, v29, v30);
  *(_QWORD *)(v13 + v16[9]) = *(_QWORD *)(v14 + v16[9]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v13 + v16[10]) = *(_QWORD *)(v14 + v16[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v13 + v16[11]) = *(_QWORD *)(v14 + v16[11]);
  swift_bridgeObjectRelease();
  v31 = v16[12];
  v32 = (_QWORD *)(v13 + v31);
  v33 = (uint64_t *)(v14 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s20ConditionInFileErrorVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2448D8254(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for CrashReport(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t _s20ConditionInFileErrorVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2448D82DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for CrashReport(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2448D8350()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CrashReport(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s20ConditionInFileErrorV4KindOwxx(uint64_t a1)
{
  return sub_2447BE24C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s20ConditionInFileErrorV4KindOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2447BE020(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s20ConditionInFileErrorV4KindOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2447BE020(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2447BE24C(v6, v7, v8);
  return a1;
}

uint64_t _s20ConditionInFileErrorV4KindOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_2447BE24C(v4, v5, v6);
  return a1;
}

uint64_t _s20ConditionInFileErrorV4KindOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s20ConditionInFileErrorV4KindOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_2448D8558(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_2448D8570(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CrashReportError.ConditionInFileError.Kind()
{
  return &type metadata for CrashReportError.ConditionInFileError.Kind;
}

uint64_t sub_2448D8598(uint64_t a1, uint64_t a2)
{
  char v2;

  if (!a2)
    return 0;
  sub_2447D0980();
  if ((sub_2448EB604() & 1) != 0)
    v2 = sub_2448EB604();
  else
    v2 = 0;
  return v2 & 1;
}

double sub_2448D866C(uint64_t a1)
{
  return *(double *)&a1;
}

uint64_t RepeatedInvocation.__allocating_init(scheduler:callback:cadences:)(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  RepeatedInvocation.init(scheduler:callback:cadences:)(a1, a2, a3, a4);
  return v8;
}

uint64_t *RepeatedInvocation.init(scheduler:callback:cadences:)(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t TupleTypeMetadata2;
  __int128 v15;

  v8 = *v4;
  v15 = *a4;
  v9 = *((_QWORD *)a4 + 2);
  *(uint64_t *)((char *)v4 + *(_QWORD *)(v8 + 128)) = 0;
  v10 = *((_BYTE *)a4 + 24);
  v11 = (uint64_t)v4 + *(_QWORD *)(*v4 + 136);
  v12 = *(_QWORD *)(v8 + 80);
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v11, 1, 1, TupleTypeMetadata2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 120), a1, v12);
  v4[6] = a2;
  v4[7] = a3;
  *((_OWORD *)v4 + 1) = v15;
  v4[4] = v9;
  *((_BYTE *)v4 + 40) = v10;
  return v4;
}

Swift::Void __swiftcall RepeatedInvocation.start()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t TupleTypeMetadata2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v1 = *v0;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v3 = sub_2448EB508();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - v5;
  v7 = (char *)v0 + *(_QWORD *)(v1 + 136);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  LODWORD(TupleTypeMetadata2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8)
                                                                                    + 48))(v6, 1, TupleTypeMetadata2);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if ((_DWORD)TupleTypeMetadata2 == 1)
    RepeatedInvocation.restart()();
}

Swift::Void __swiftcall RepeatedInvocation.restart()()
{
  uint64_t **v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  unsigned __int8 v8;

  v1 = *v0;
  RepeatedInvocation.cancel()();
  type metadata accessor for RepeatedInvocation.Cadence(255, v1[10], v1[11], v1[12]);
  v2 = sub_2448EAEE4();
  v3 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v2);
  v5 = type metadata accessor for Inhabited(0, v2, v3, v4);
  Inhabited.first.getter(v5, v6, (uint64_t)v7);
  sub_2448D8AE0(v7[0], v7[1], v8, 0);
}

Swift::Void __swiftcall RepeatedInvocation.cancel()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t TupleTypeMetadata2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v1 = v0;
  v2 = *v0;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v4 = sub_2448EB508();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - v6;
  v8 = *(_QWORD *)((char *)v1 + *(_QWORD *)(v2 + 128));
  if (v8)
  {
    v9 = *(void (**)(uint64_t))(**(_QWORD **)(v8 + 16) + 112);
    v10 = swift_retain();
    v9(v10);
    swift_release();
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v7, 1, 1, TupleTypeMetadata2);
  v11 = (char *)v1 + *(_QWORD *)(*v1 + 136);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v11, v7, v4);
  swift_endAccess();
}

uint64_t type metadata accessor for RepeatedInvocation.Cadence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RepeatedInvocation.Cadence);
}

uint64_t sub_2448D8AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata2;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  double v28;
  void (*v29)(uint64_t, double);
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v5 = v4;
  v31 = *(double *)&a1;
  v6 = *(_QWORD *)v4;
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v32 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  v33 = a4;
  v34 = v7;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v9 = sub_2448EB508();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (_QWORD *)((char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v31 - v14;
  v16 = (char *)(v4 + *(_QWORD *)(v6 + 136));
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v16, v9);
  v17 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v6) = v18(v15, 1, TupleTypeMetadata2);
  v19 = v15;
  v20 = v32;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
  v21 = (_DWORD)v6 == 1;
  v22 = v33;
  if (v21 || v18(v16, 1, TupleTypeMetadata2) || *(_QWORD *)v16 != v22)
  {
    *v13 = v22;
    (*(void (**)(uint64_t, uint64_t))(v20 + 24))(v34, v20);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, TupleTypeMetadata2);
    swift_beginAccess();
    (*(void (**)(char *, _QWORD *, uint64_t))(v10 + 40))(v16, v13, v9);
    swift_endAccess();
  }
  type metadata accessor for DelayedInvocation();
  v23 = v5 + *(_QWORD *)(*(_QWORD *)v5 + 120);
  swift_retain();
  v24 = sub_24483A164(v23, (uint64_t)sub_2448D96A4, v5, v34, v20);
  v25 = *(_QWORD *)(*(_QWORD *)v5 + 128);
  *(_QWORD *)(v5 + v25) = v24;
  result = swift_release();
  v27 = *(_QWORD *)(v5 + v25);
  if (v27)
  {
    v28 = v31;
    v29 = *(void (**)(uint64_t, double))(**(_QWORD **)(v27 + 16) + 104);
    v30 = swift_retain();
    v29(v30, v28);
    return swift_release();
  }
  return result;
}

uint64_t sub_2448D8D54()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t (**v28)(uint64_t *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t (**v32)(uint64_t *, uint64_t);
  uint64_t v33;
  void (*v34)(void);
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  double v44;
  uint64_t AssociatedConformanceWitness;
  char *v46;
  char *v47;
  char v48;
  void (*v49)(char *, uint64_t);
  uint64_t (*v50)(uint64_t *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t (**v57)(uint64_t *, uint64_t);
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  __int128 v63;
  char v64;
  uint64_t v65;

  v1 = v0;
  v2 = (_QWORD *)*v0;
  v3 = v2[10];
  v4 = v2[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v56 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v54 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v53 = (char *)&v51 - v8;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v10 = sub_2448EB508();
  v57 = *(uint64_t (***)(uint64_t *, uint64_t))(v10 - 8);
  v58 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (uint64_t *)((char *)&v51 - v12);
  v14 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v16 = (uint64_t *)((char *)&v51 - v15);
  v17 = *(_QWORD *)((char *)v1 + v2[16]);
  v55 = v2;
  v18 = v2;
  v59 = v16;
  if (v17)
  {
    v19 = v14;
    v20 = v3;
    v21 = v1;
    v22 = TupleTypeMetadata2;
    v23 = AssociatedTypeWitness;
    v24 = v4;
    v25 = *(void (**)(uint64_t))(**(_QWORD **)(v17 + 16) + 112);
    v26 = swift_retain();
    v25(v26);
    v4 = v24;
    AssociatedTypeWitness = v23;
    TupleTypeMetadata2 = v22;
    v1 = v21;
    v3 = v20;
    v14 = v19;
    v16 = v59;
    swift_release();
    v18 = (_QWORD *)*v1;
  }
  v27 = (char *)v1 + v18[17];
  swift_beginAccess();
  v28 = v57;
  v29 = v27;
  v30 = v58;
  ((void (*)(uint64_t *, char *, uint64_t))v57[2])(v13, v29, v58);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v14 + 48))(v13, 1, TupleTypeMetadata2) == 1)
    return v28[1](v13, v30);
  v58 = v14;
  v32 = (uint64_t (**)(uint64_t *, uint64_t))((char *)v16 + *(int *)(TupleTypeMetadata2 + 48));
  v33 = *v13;
  *v16 = *v13;
  v34 = *(void (**)(void))(v56 + 32);
  v57 = v32;
  v34();
  v35 = *((_BYTE *)v1 + 40);
  v62 = (_QWORD *)v1[2];
  v63 = *(_OWORD *)(v1 + 3);
  v64 = v35;
  type metadata accessor for RepeatedInvocation.Cadence(255, v3, v4, v55[12]);
  v36 = sub_2448EAEE4();
  v37 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v36);
  v39 = type metadata accessor for Inhabited(0, v36, v37, v38);
  v40 = MEMORY[0x24951AC70](&protocol conformance descriptor for Inhabited<A>, v39);
  PredicatedWrapper.value.getter(v39, v40, (uint64_t)&v65);
  v60 = v33;
  v61 = v65;
  MEMORY[0x24951AC70](MEMORY[0x24BEE12D8], v36);
  RandomAccessCollection.subscript.getter((uint64_t)&v62);
  swift_bridgeObjectRelease();
  if (BYTE8(v63) != 255)
  {
    v43 = v59;
    if (BYTE8(v63))
    {
      if (BYTE8(v63) != 1)
      {
        sub_2448D8AE0(v62, v63);
        goto LABEL_12;
      }
      v55 = v62;
      v52 = v63;
      v44 = *(double *)&v63;
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      v46 = v53;
      (*(void (**)(uint64_t, uint64_t, double))(AssociatedConformanceWitness + 8))(AssociatedTypeWitness, AssociatedConformanceWitness, v44);
      v47 = v54;
      (*(void (**)(uint64_t, uint64_t))(v4 + 24))(v3, v4);
      v48 = sub_2448EA9D4();
      v49 = *(void (**)(char *, uint64_t))(v56 + 8);
      v49(v47, AssociatedTypeWitness);
      v49(v46, AssociatedTypeWitness);
      if ((v48 & 1) == 0)
      {
        sub_2448D8AE0(v55, v52);
        v50 = *(uint64_t (**)(uint64_t *, uint64_t))(v58 + 8);
        v41 = v43;
        return v50(v41, TupleTypeMetadata2);
      }
    }
    sub_2448D9198();
LABEL_12:
    v42 = v58;
    v41 = v43;
    goto LABEL_13;
  }
  v42 = v58;
  v41 = v59;
LABEL_13:
  v50 = *(uint64_t (**)(uint64_t *, uint64_t))(v42 + 8);
  return v50(v41, TupleTypeMetadata2);
}

uint64_t sub_2448D9198()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t TupleTypeMetadata2;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
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
  __int128 v30;
  char v31;
  uint64_t v32;

  v1 = v0;
  v2 = (_QWORD *)*v0;
  v3 = v2[11];
  v25 = v2[10];
  v26 = v3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v6 = sub_2448EB508();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  v11 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v25 - v12;
  v14 = (char *)v1 + v2[17];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v14, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, TupleTypeMetadata2) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v16 = *(int *)(TupleTypeMetadata2 + 48);
  v17 = *(_QWORD *)v10;
  *(_QWORD *)v13 = *(_QWORD *)v10;
  result = (*(uint64_t (**)(char *, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(&v13[v16], &v10[v16], AssociatedTypeWitness);
  v18 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
    __break(1u);
  }
  else
  {
    v19 = *((_BYTE *)v1 + 40);
    v29 = v1[2];
    v30 = *(_OWORD *)(v1 + 3);
    v31 = v19;
    type metadata accessor for RepeatedInvocation.Cadence(255, v25, v26, v2[12]);
    v20 = sub_2448EAEE4();
    v21 = MEMORY[0x24951AC70](MEMORY[0x24BEE12C8], v20);
    v23 = type metadata accessor for Inhabited(0, v20, v21, v22);
    v24 = MEMORY[0x24951AC70](&protocol conformance descriptor for Inhabited<A>, v23);
    PredicatedWrapper.value.getter(v23, v24, (uint64_t)&v32);
    v27 = v18;
    v28 = v32;
    MEMORY[0x24951AC70](MEMORY[0x24BEE12D8], v20);
    RandomAccessCollection.subscript.getter((uint64_t)&v29);
    swift_bridgeObjectRelease();
    if (BYTE8(v30) != 255)
      sub_2448D8AE0(v29, v30);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
  }
  return result;
}

uint64_t *RepeatedInvocation.deinit()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 120), *(_QWORD *)(v1 + 80));
  swift_release();
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 136);
  swift_getAssociatedTypeWitness();
  swift_getTupleTypeMetadata2();
  v3 = sub_2448EB508();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t RepeatedInvocation.__deallocating_deinit()
{
  RepeatedInvocation.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2448D94F0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;

  v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getTupleTypeMetadata2();
    v0 = sub_2448EB508();
    if (v2 <= 0x3F)
      return swift_initClassMetadata2();
  }
  return v0;
}

uint64_t type metadata accessor for RepeatedInvocation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RepeatedInvocation);
}

uint64_t method lookup function for RepeatedInvocation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RepeatedInvocation.__allocating_init(scheduler:callback:cadences:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t sub_2448D9608(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t sub_2448D9650(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_2448D9694(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2448D969C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

uint64_t sub_2448D96A4()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 48))();
  return sub_2448D8D54();
}

uint64_t Predicated.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_2448EB508();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - v11;
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v27 - v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 24))(a1, a2, a3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1)
  {
    v19 = swift_getAssociatedTypeWitness();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(a1, v19);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v21 = type metadata accessor for Predicated(0, a2, a3, v20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v28, 1, 1, v21);
  }
  else
  {
    v23 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v23(v18, v12, AssociatedTypeWitness);
    v23(v16, v18, AssociatedTypeWitness);
    v24 = v28;
    sub_2448D9A94(a1, (uint64_t)v16, a2, a3, v28);
    v26 = type metadata accessor for Predicated(0, a2, a3, v25);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v24, 0, 1, v26);
  }
}

uint64_t type metadata accessor for Predicated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Predicated);
}

uint64_t static Predicated.unverified(value:proof:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v13 = (char *)&v19 - v12;
  v14 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t))(v17 + 16))((char *)&v19 - v15, a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, AssociatedTypeWitness);
  return sub_2448D9A94((uint64_t)v16, (uint64_t)v13, a3, a4, a5);
}

uint64_t Predicated.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a1, v1, AssociatedTypeWitness);
}

uint64_t Predicated.proof.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;

  v4 = v2 + *(int *)(a1 + 36);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, v4, AssociatedTypeWitness);
}

uint64_t sub_2448D9A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a5, a1, AssociatedTypeWitness);
  v12 = a5 + *(int *)(type metadata accessor for Predicated(0, a3, a4, v11) + 36);
  v13 = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a2, v13);
}

uint64_t sub_2448D9B50()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2448D9C10(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v8 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || ((v6 + v9) & (unint64_t)~v9) + *(_QWORD *)(v8 + 64) > 0x18)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    v15 = v7;
    v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v16, ((unint64_t)a2 + v10) & v16, v15);
  }
  return a1;
}

uint64_t sub_2448D9D2C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
  v4 = *(_QWORD *)(v3 + 64) + a1;
  v5 = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((v4 + *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80), v5);
}

uint64_t sub_2448D9DD0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_2448D9E8C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_2448D9F48(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_2448DA004(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_2448DA0C0(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v6)
    v10 = v6;
  else
    v10 = *(_DWORD *)(v8 + 84);
  if (!a2)
    return 0;
  v11 = *(unsigned __int8 *)(v8 + 80);
  v12 = *(_QWORD *)(v5 + 64) + v11;
  if (a2 <= v10)
    goto LABEL_23;
  v13 = (v12 & ~v11) + *(_QWORD *)(v8 + 64);
  v14 = 8 * v13;
  if (v13 <= 3)
  {
    v16 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v16))
    {
      v15 = *(_DWORD *)(a1 + v13);
      if (!v15)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v16 > 0xFF)
    {
      v15 = *(unsigned __int16 *)(a1 + v13);
      if (!*(_WORD *)(a1 + v13))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v16 < 2)
    {
LABEL_23:
      if (v10)
      {
        if (v6 >= v9)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
        else
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))((v12 + a1) & ~v11, v9, v7);
      }
      return 0;
    }
  }
  v15 = *(unsigned __int8 *)(a1 + v13);
  if (!*(_BYTE *)(a1 + v13))
    goto LABEL_23;
LABEL_14:
  v17 = (v15 - 1) << v14;
  if (v13 > 3)
    v17 = 0;
  if ((_DWORD)v13)
  {
    if (v13 <= 3)
      v18 = v13;
    else
      v18 = 4;
    __asm { BR              X12 }
  }
  return v10 + v17 + 1;
}

void sub_2448DA2A0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  size_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (*(_DWORD *)(v8 + 84) <= v7)
    v9 = v7;
  else
    v9 = *(_DWORD *)(v8 + 84);
  v10 = ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
      + *(_QWORD *)(v8 + 64);
  if (a3 <= v9)
  {
    v11 = 0;
  }
  else if (v10 <= 3)
  {
    v13 = ((a3 - v9 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      v11 = 4u;
    }
    else if (v13 >= 0x100)
    {
      v11 = 2;
    }
    else
    {
      v11 = v13 > 1;
    }
  }
  else
  {
    v11 = 1u;
  }
  if (v9 < a2)
  {
    v12 = ~v9 + a2;
    if (v10 < 4)
    {
      if ((_DWORD)v10)
      {
        v14 = v12 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if ((_DWORD)v10 == 3)
        {
          *(_WORD *)a1 = v14;
          a1[2] = BYTE2(v14);
        }
        else if ((_DWORD)v10 == 2)
        {
          *(_WORD *)a1 = v14;
        }
        else
        {
          *a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_2448DA504(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = type metadata accessor for IOPowerSource.Observer();
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(a3 + 16);
  if (v22)
  {
    v14 = 0;
    v15 = MEMORY[0x24BEE4AF8];
    v20[1] = a2;
    v21 = a3;
    v20[0] = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v13 = *(_QWORD *)(v24 + 72);
      sub_2448DCF60(a3 + v16 + v13 * v14, (uint64_t)v12);
      v17 = a1(v12);
      if (v3)
      {
        sub_2448DC7F0((uint64_t)v12);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if ((v17 & 1) != 0)
      {
        sub_2448DCFD0((uint64_t)v12, v23);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_2447CEFDC(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v25;
        v19 = *(_QWORD *)(v25 + 16);
        v18 = *(_QWORD *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_2447CEFDC(v18 > 1, v19 + 1, 1);
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = sub_2448DCFD0(v23, v15 + v16 + v19 * v13);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        result = sub_2448DC7F0((uint64_t)v12);
      }
      if (v22 == ++v14)
      {
        v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t IOPowerSource.State.BatteryInfo.lowPowerMode.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t IOPowerSource.State.BatteryInfo.lowPowerMode.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*IOPowerSource.State.BatteryInfo.lowPowerMode.modify())()
{
  return nullsub_1;
}

uint64_t IOPowerSource.State.BatteryInfo.status.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t IOPowerSource.State.BatteryInfo.status.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*IOPowerSource.State.BatteryInfo.status.modify())()
{
  return nullsub_1;
}

double IOPowerSource.State.BatteryInfo.level.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void IOPowerSource.State.BatteryInfo.level.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*IOPowerSource.State.BatteryInfo.level.modify())()
{
  return nullsub_1;
}

PreviewsFoundationOS::IOPowerSource::State::BatteryInfo __swiftcall IOPowerSource.State.BatteryInfo.init(lowPowerMode:status:level:)(Swift::Bool lowPowerMode, PreviewsFoundationOS::IOPowerSource::State::BatteryInfo::Status status, Swift::Double level)
{
  uint64_t v3;
  PreviewsFoundationOS::IOPowerSource::State::BatteryInfo result;

  *(_BYTE *)v3 = lowPowerMode;
  *(_BYTE *)(v3 + 1) = status;
  *(Swift::Double *)(v3 + 8) = level;
  result.level = level;
  result.lowPowerMode = lowPowerMode;
  return result;
}

uint64_t IOPowerSource.State.BatteryInfo.Status.hash(into:)()
{
  return sub_2448EBD0C();
}

BOOL static IOPowerSource.State.BatteryInfo.Status.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t IOPowerSource.State.BatteryInfo.Status.hashValue.getter()
{
  sub_2448EBD00();
  sub_2448EBD0C();
  return sub_2448EBD3C();
}

BOOL static IOPowerSource.State.BatteryInfo.== infix(_:_:)(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2
      && *((unsigned __int8 *)a1 + 1) == *((unsigned __int8 *)a2 + 1)
      && a1[1] == a2[1];
}

BOOL sub_2448DA814(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2
      && *((unsigned __int8 *)a1 + 1) == *((unsigned __int8 *)a2 + 1)
      && a1[1] == a2[1];
}

CFRunLoopSourceRef sub_2448DA854()
{
  id v0;
  uint64_t v1;
  CFRunLoopSourceRef result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  type metadata accessor for IOPowerSource();
  v1 = swift_allocObject();
  result = IOPowerSource.init(observeOn:)(v0);
  qword_257391E20 = v1;
  return result;
}

uint64_t IOPowerSource.__allocating_init(observeOn:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  IOPowerSource.init(observeOn:)(a1);
  return v2;
}

uint64_t static IOPowerSource.shared.getter()
{
  if (qword_257389E00 != -1)
    swift_once();
  return swift_retain();
}

uint64_t IOPowerSource.currentState.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[2];

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3 + 10);
  sub_2448130BC((uint64_t)&v3[4], (uint64_t)v7);
  os_unfair_lock_unlock(v3 + 10);
  swift_release();
  v4 = v7[0];
  v5 = v7[1];
  result = swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v5;
  return result;
}

uint64_t IOPowerSource.addObserver(_:)@<X0>(void (*a1)(__n128 *)@<X0>, void (*a2)(__n128 *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (**v17)(__n128 *);
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  _QWORD v26[2];
  __n128 v27;
  __int128 v28;
  char v29;
  __int128 v30;
  const char *v31;
  uint64_t v32;
  char v33;

  v4 = v3;
  v26[0] = a3;
  v7 = sub_2448EA548();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v26 - v12;
  v14 = type metadata accessor for IOPowerSource.Observer();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  _s20PreviewsFoundationOS11CrashReportV2IDVAEycfC_0();
  v17 = (void (**)(__n128 *))&v16[*(int *)(v14 + 20)];
  *v17 = a1;
  v17[1] = a2;
  v18 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v18(v13, v16, v7);
  v19 = swift_allocObject();
  swift_weakInit();
  v18(v11, v13, v7);
  v20 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v21 + v20, v11, v7);
  *(_QWORD *)&v28 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFound"
                    "ation/IOPowerSource.swift";
  *((_QWORD *)&v28 + 1) = 125;
  v29 = 2;
  v30 = xmmword_2448F8540;
  v31 = "addObserver(_:)";
  v32 = 15;
  v33 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738AF78);
  swift_allocObject();
  v22 = sub_2447E5D90(&v28, 0, 0, 1, 0, 0xD000000000000011, 0x80000002448F9A50, 0x64656C65636E6163, 0xE800000000000000);
  v23 = *(_QWORD *)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v23 + 40));
  sub_2448DAD08((__n128 *)(v23 + 16), (uint64_t)v16, &v27);
  os_unfair_lock_unlock((os_unfair_lock_t)(v23 + 40));
  swift_release();
  (*v17)(&v27);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  result = sub_2448DC7F0((uint64_t)v16);
  v25 = v26[0];
  *(_QWORD *)v26[0] = sub_2448DC7C0;
  *(_QWORD *)(v25 + 8) = v21;
  *(_QWORD *)(v25 + 16) = v22;
  return result;
}

uint64_t sub_2448DAC60(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  os_unfair_lock_s *v4;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = *(os_unfair_lock_s **)(result + 24);
    swift_retain();
    os_unfair_lock_lock(v4 + 10);
    sub_2448DBEF0((uint64_t)&v4[4], a2);
    os_unfair_lock_unlock(v4 + 10);
    swift_release();
    return swift_release();
  }
  return result;
}

__n128 sub_2448DAD08@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __n128 result;
  uint64_t v14;

  v6 = type metadata accessor for IOPowerSource.Observer();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2448DCF60(a2, (uint64_t)v9);
  v10 = a1[1].n128_u64[0];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = sub_2447C3574(0, *(_QWORD *)(v10 + 16) + 1, 1, v10);
  v12 = *(_QWORD *)(v10 + 16);
  v11 = *(_QWORD *)(v10 + 24);
  if (v12 >= v11 >> 1)
    v10 = sub_2447C3574(v11 > 1, v12 + 1, 1, v10);
  *(_QWORD *)(v10 + 16) = v12 + 1;
  sub_2448DCFD0((uint64_t)v9, v10+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v12);
  a1[1].n128_u64[0] = v10;
  result = *a1;
  *a3 = *a1;
  return result;
}

CFRunLoopSourceRef IOPowerSource.init(observeOn:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  CFRunLoopSourceRef result;
  void *v19;
  __CFRunLoop *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  char *v26;
  void *v27;
  _QWORD aBlock[6];

  v2 = v1;
  v27 = a1;
  v3 = sub_2448EB3D0();
  MEMORY[0x24BDAC7A8](v3);
  v26 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2448EA734();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_2448EA710();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2448EB40C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257391E28);
  v14 = swift_allocObject();
  *(_DWORD *)(v14 + 40) = 0;
  *(_OWORD *)(v14 + 16) = xmmword_2448F3340;
  *(_QWORD *)(v14 + 32) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 24) = v14;
  sub_244897DB4(0, (unint64_t *)&qword_25738C1F0);
  *(_QWORD *)(v2 + 40) = 0;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEE5758], v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5490], v6);
  sub_2448EB43C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_2448EA71C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2447BD7A0(&qword_25738D608, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738D610);
  sub_24486F760(&qword_25738D618, &qword_25738D610);
  sub_2448EB6C4();
  *(_QWORD *)(v2 + 56) = sub_2448EB430();
  v15 = v27;
  *(_QWORD *)(v2 + 16) = v27;
  v16 = v15;
  sub_2448DB248();
  type metadata accessor for IOPowerSource.NotificationCallbackWrapper();
  v17 = (void *)swift_allocObject();
  swift_weakInit();
  swift_weakAssign();
  *(_QWORD *)(v2 + 48) = v17;
  swift_retain();
  result = IOPSNotificationCreateRunLoopSource((IOPowerSourceCallbackType)sub_2448DB4BC, v17);
  if (result)
  {
    v19 = *(void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = result;

    v20 = (__CFRunLoop *)objc_msgSend(v16, sel_getCFRunLoop);
    CFRunLoopAddSource(v20, *(CFRunLoopSourceRef *)(v2 + 32), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);

    v21 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v22 = *MEMORY[0x24BDD1160];
    v23 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_2448DC84C;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2448DB560;
    aBlock[3] = &block_descriptor_13;
    v24 = _Block_copy(aBlock);
    swift_release();
    v25 = objc_msgSend(v21, sel_addObserverForName_object_queue_usingBlock_, v22, 0, 0, v24);
    swift_release();

    _Block_release(v24);
    *(_QWORD *)(v2 + 40) = v25;
    swift_unknownObjectRelease();
    return (CFRunLoopSourceRef)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2448DB248()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  double v5[2];

  sub_2448DB604(v5);
  if (LOBYTE(v5[0]) == 4)
    v1 = 2;
  else
    v1 = *(_QWORD *)&v5[0];
  if (LOBYTE(v5[0]) == 4)
    v2 = 0.0;
  else
    v2 = v5[1];
  v3 = *(_QWORD *)(v0 + 24);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 40));
  *(_QWORD *)(v3 + 16) = v1;
  *(double *)(v3 + 24) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 40));
  return swift_release();
}

uint64_t sub_2448DB2B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2448EA704();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2448EA734();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = *(_QWORD *)(v1 + 56);
  v10 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_2448DCF58;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2447EB164;
  aBlock[3] = &block_descriptor_8;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_2448EA71C();
  v15 = MEMORY[0x24BEE4AF8];
  sub_2447BD7A0((unint64_t *)&qword_25738B1E0, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738B1E8);
  sub_24486F760(qword_25738B1F0, &qword_25738B1E8);
  sub_2448EB6C4();
  MEMORY[0x249519C08](0, v9, v5, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  return swift_release();
}

uint64_t sub_2448DB4BC(uint64_t result)
{
  if (result)
  {
    swift_retain();
    if (swift_weakLoadStrong())
    {
      sub_2448DB2B8();
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_2448DB50C()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2448DB2B8();
    return swift_release();
  }
  return result;
}

uint64_t sub_2448DB560(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_2448EA284();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_2448EA278();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_2448DB604(double *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  CFTypeRef v5;
  CFTypeRef v6;
  CFArrayRef v7;
  CFArrayRef v8;
  uint64_t v9;
  const __CFArray *v10;
  char *v11;
  char *v12;
  char *v13;
  void (*v14)(void **__return_ptr, _OWORD *);
  void *v15;
  void (*v16)(__int128 *__return_ptr, _QWORD *);
  void *v17;
  id v18;
  char v19;
  const __CFArray *v20;
  const __CFArray *v21;
  id v22;
  unsigned __int8 v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  id v33;
  unsigned int v34;
  double *v35;
  uint64_t v36;
  const __CFArray *v37;
  CFTypeRef v38;
  double *v39;
  uint64_t v40;
  void *v41;
  _OWORD v42[2];
  __int128 v43;
  __int128 v44;
  _QWORD v45[3];
  uint64_t v46;
  void *v47;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257392048);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = IOPSCopyPowerSourcesInfo();
  if (!v5)
    goto LABEL_21;
  v6 = v5;
  v7 = IOPSCopyPowerSourcesList(v5);
  if (!v7)
  {
    swift_unknownObjectRelease();
LABEL_21:
    *(_OWORD *)a1 = xmmword_2448F8550;
    return;
  }
  v8 = v7;
  v39 = a1;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v6;
  v10 = v8;
  v38 = v6;
  swift_unknownObjectRetain();
  swift_retain();
  v37 = v10;
  sub_2448EB460();
  v11 = &v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257392050) + 44)];
  *(_QWORD *)v11 = sub_2448DCFC8;
  *((_QWORD *)v11 + 1) = v9;
  v36 = v9;
  v12 = &v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257392058) + 36)];
  *(_QWORD *)v12 = sub_2448DC640;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v4[*(int *)(v2 + 44)];
  *(_QWORD *)v13 = sub_2448DC650;
  *((_QWORD *)v13 + 1) = 0;
  sub_2448EA398();
  sub_2447BD7A0(&qword_257392060, (uint64_t (*)(uint64_t))MEMORY[0x24BDCD520], MEMORY[0x24BDCD530]);
  sub_2448EB58C();
  v14 = *(void (**)(void **__return_ptr, _OWORD *))v11;
  sub_2447F3DFC((uint64_t)v45, (uint64_t)&v43);
  if (!*((_QWORD *)&v44 + 1))
  {
LABEL_19:
    sub_2447BD180((uint64_t)v4, &qword_257392048);
    swift_unknownObjectRelease();
    swift_release();
    v20 = v37;

    *(_OWORD *)v39 = xmmword_2448F3350;
    return;
  }
  v40 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    sub_2447C91FC(&v43, v42);
    v14(&v41, v42);
    v15 = v41;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
    v47 = v15;
    if (((*(uint64_t (**)(void **))v12)(&v47) & 1) != 0)
      break;

LABEL_6:
    sub_2448EB58C();
    v14 = *(void (**)(void **__return_ptr, _OWORD *))v11;
    sub_2447F3DFC((uint64_t)v45, (uint64_t)&v43);
    if (!*((_QWORD *)&v44 + 1))
      goto LABEL_19;
  }
  v16 = *(void (**)(__int128 *__return_ptr, _QWORD *))v13;
  v45[0] = v15;
  v16(&v43, v45);

  v17 = (void *)v43;
  *(_QWORD *)&v43 = 1701869908;
  *((_QWORD *)&v43 + 1) = 0xE400000000000000;
  v18 = objc_msgSend(v17, sel___swift_objectForKeyedSubscript_, sub_2448EBC58());
  swift_unknownObjectRelease();
  if (v18)
  {
    sub_2448EB664();
    swift_unknownObjectRelease();
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }
  sub_2447F3DFC((uint64_t)&v43, (uint64_t)v45);
  if (!v46)
  {
    sub_2447BD180((uint64_t)v45, &qword_25738B658);
    goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:

    goto LABEL_6;
  }
  if (v42[0] != __PAIR128__(0xEF79726574746142, 0x6C616E7265746E49))
  {
    v19 = sub_2448EBBEC();
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      goto LABEL_22;
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
LABEL_22:
  sub_2447BD180((uint64_t)v4, &qword_257392048);
  swift_release();
  v21 = v37;

  v22 = v17;
  v23 = sub_2448DC39C(v22);
  *(_QWORD *)&v43 = 0xD000000000000010;
  *((_QWORD *)&v43 + 1) = 0x80000002448FDDD0;
  v24 = objc_msgSend(v22, sel___swift_objectForKeyedSubscript_, sub_2448EBC58());
  swift_unknownObjectRelease();
  if (v24)
  {
    sub_2448EB664();
    swift_unknownObjectRelease();
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }
  sub_2447F3DFC((uint64_t)&v43, (uint64_t)v45);
  if (v46)
  {
    sub_244897DB4(0, qword_2573901B8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v25 = *(void **)&v42[0];
      objc_msgSend(*(id *)&v42[0], sel_doubleValue);
      v27 = v26;

      goto LABEL_30;
    }
  }
  else
  {
    sub_2447BD180((uint64_t)v45, &qword_25738B658);
  }
  v27 = 1.0;
LABEL_30:
  strcpy((char *)&v43, "Max Capacity");
  BYTE13(v43) = 0;
  HIWORD(v43) = -5120;
  v28 = objc_msgSend(v22, sel___swift_objectForKeyedSubscript_, sub_2448EBC58());
  swift_unknownObjectRelease();
  if (v28)
  {
    sub_2448EB664();
    swift_unknownObjectRelease();
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
  }
  sub_2447F3DFC((uint64_t)&v43, (uint64_t)v45);
  if (v46)
  {
    sub_244897DB4(0, qword_2573901B8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v29 = *(void **)&v42[0];
      objc_msgSend(*(id *)&v42[0], sel_doubleValue);
      v31 = v30;

      v32 = 0.0;
      if (v31 != 0.0)
      {
        v32 = 1.0;
        if (v27 / v31 <= 1.0)
        {
          if (v27 / v31 > 0.0)
            v32 = v27 / v31;
          else
            v32 = 0.0;
        }
      }
      goto LABEL_45;
    }
  }
  else
  {
    sub_2447BD180((uint64_t)v45, &qword_25738B658);
  }
  v32 = 1.0;
  if (v27 <= 1.0)
  {
    if (v27 > 0.0)
      v32 = v27;
    else
      v32 = 0.0;
  }
LABEL_45:
  v33 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v34 = objc_msgSend(v33, sel_isLowPowerModeEnabled);

  swift_unknownObjectRelease();
  v35 = v39;
  *(_QWORD *)v39 = v34 & 0xFFFF00FF | ((unint64_t)v23 << 8);
  v35[1] = v32;
}

uint64_t sub_2448DBCC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  uint64_t v5;
  os_unfair_lock_s *v6;
  unsigned __int16 v7;
  double v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t *);
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;

  v0 = type metadata accessor for IOPowerSource.Observer();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    v6 = *(os_unfair_lock_s **)(result + 24);
    swift_retain();
    os_unfair_lock_lock(v6 + 10);
    sub_2448130BC((uint64_t)&v6[4], (uint64_t)&v17);
    os_unfair_lock_unlock(v6 + 10);
    swift_release();
    v7 = v17;
    v8 = v18;
    swift_bridgeObjectRelease();
    sub_2448DB248();
    v9 = *(os_unfair_lock_s **)(v5 + 24);
    swift_retain();
    os_unfair_lock_lock(v9 + 10);
    sub_2448130BC((uint64_t)&v9[4], (uint64_t)&v17);
    os_unfair_lock_unlock(v9 + 10);
    swift_release();
    v10 = v17;
    v11 = v18;
    if (v17 == 2)
    {
      if (v7 == 2)
        goto LABEL_12;
    }
    else if (v17 == 3)
    {
      if (v7 == 3)
      {
LABEL_12:
        swift_release();
        return swift_bridgeObjectRelease();
      }
    }
    else if ((v7 & 0xFE) != 2
           && (v7 & 1) != ((v17 & 1) == 0)
           && (((unsigned __int16)v17 ^ v7) & 0xFF00) == 0
           && v8 == v18)
    {
      goto LABEL_12;
    }
    v12 = *(_QWORD *)(v19 + 16);
    if (v12)
    {
      v13 = v19 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
      v14 = *(_QWORD *)(v1 + 72);
      do
      {
        sub_2448DCF60(v13, (uint64_t)v3);
        v15 = *(void (**)(uint64_t *))&v3[*(int *)(v0 + 20)];
        v17 = v10;
        v18 = v11;
        v15(&v17);
        sub_2448DC7F0((uint64_t)v3);
        v13 += v14;
        --v12;
      }
      while (v12);
    }
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_2448DBEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[4];

  v3 = *(_QWORD *)(a1 + 16);
  v6[2] = a2;
  swift_bridgeObjectRetain();
  v4 = sub_2448DA504((uint64_t (*)(char *))sub_2448DD014, (uint64_t)v6, v3);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = v4;
  return result;
}

BOOL sub_2448DBF58(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char v7;
  uint64_t v9;

  v2 = sub_2448EA548();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v2);
  sub_2447BD7A0(qword_257392068, v3, MEMORY[0x24BDCEA98]);
  v7 = sub_2448EAA64();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  return (v7 & 1) == 0;
}

uint64_t sub_2448DC03C()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_2448DC060@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2448EA548();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id *IOPowerSource.deinit()
{
  id *v0;

  swift_release();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t IOPowerSource.__deallocating_deinit()
{
  id *v0;

  swift_release();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

void IOPowerSource.State.description.getter()
{
  uint64_t v0;
  int v1;
  double v2;

  v1 = *(_QWORD *)v0;
  if (v1 != 2 && v1 != 3)
  {
    v2 = *(double *)(v0 + 8) * 100.0;
    if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) != 0)
    {
      if (v2 > -9.22337204e18)
      {
        if (v2 < 9.22337204e18)
        {
          sub_2448EBB5C();
          sub_2448EABC0();
          sub_2448EB79C();
          sub_2448EABC0();
          sub_2448EABC0();
          swift_bridgeObjectRelease();
          sub_2448EABC0();
          sub_2448EB91C();
          sub_2448EABC0();
          sub_2448EABC0();
          swift_bridgeObjectRelease();
          sub_2448EABC0();
          return;
        }
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_11:
    __break(1u);
  }
}

const __CFDictionary *sub_2448DC338@<X0>(_QWORD *a1@<X0>, const void *a2@<X1>, CFDictionaryRef *a3@<X8>)
{
  const void *v5;
  CFDictionaryRef v6;
  const __CFDictionary *result;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v5 = (const void *)sub_2448EBBD4();
  v6 = IOPSGetPowerSourceDescription(a2, v5);
  result = (const __CFDictionary *)swift_unknownObjectRelease();
  if (v6)
    result = v6;
  *a3 = v6;
  return result;
}

uint64_t sub_2448DC39C(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v18 = 0x6772616843207349;
  v19 = 0xEB00000000676E69;
  v2 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2448EBC58());
  swift_unknownObjectRelease();
  if (v2)
  {
    sub_2448EB664();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_2447F3DFC((uint64_t)&v16, (uint64_t)&v18);
  if (v20)
  {
    sub_244897DB4(0, qword_2573901B8);
    if (swift_dynamicCast())
      v3 = v15;
    else
      v3 = 0;
  }
  else
  {
    sub_2447BD180((uint64_t)&v18, &qword_25738B658);
    v3 = 0;
  }
  v18 = 0x6772616843207349;
  v19 = 0xEA00000000006465;
  v4 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2448EBC58());
  swift_unknownObjectRelease();
  if (v4)
  {
    sub_2448EB664();
    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  sub_2447F3DFC((uint64_t)&v16, (uint64_t)&v18);
  if (v20)
  {
    sub_244897DB4(0, qword_2573901B8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = v15;
      goto LABEL_17;
    }
  }
  else
  {
    sub_2447BD180((uint64_t)&v18, &qword_25738B658);
  }
  v5 = 0;
LABEL_17:
  sub_244897DB4(0, qword_2573901B8);
  v6 = (void *)sub_2448EB484();
  v7 = v6;
  if (v5)
  {
    v8 = v5;
    v9 = sub_2448EB490();

    if ((v9 & 1) != 0)
    {

      return 2;
    }
  }
  else
  {

  }
  v11 = (void *)sub_2448EB484();
  v12 = v11;
  if (v3)
  {
    v13 = v3;
    v14 = sub_2448EB490();

    if ((v14 & 1) != 0)
      return 1;
  }
  else
  {

  }
  return 0;
}

BOOL sub_2448DC640(_QWORD *a1)
{
  return *a1 != 0;
}

id sub_2448DC650@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = *a1;
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL _s20PreviewsFoundationOS13IOPowerSourceC5StateO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(_QWORD *)a1;
  if (v2 == 2)
    return *(_QWORD *)a2 == 2;
  if (v2 == 3)
    return *(_QWORD *)a2 == 3;
  if ((*(_QWORD *)a2 & 0xFELL) == 2)
    return 0;
  if (*(double *)(a1 + 8) == *(double *)(a2 + 8))
    return (((*(_QWORD *)a1 & 1) == 0) ^ *(_QWORD *)a2) & ((((unsigned __int16)*(_QWORD *)a2 ^ (unsigned __int16)*(_QWORD *)a1) & 0xFF00) == 0);
  else
    return 0;
}

uint64_t type metadata accessor for IOPowerSource.Observer()
{
  uint64_t result;

  result = qword_257392010;
  if (!qword_257392010)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2448DC728()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2448DC74C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2448EA548();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2448DC7C0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(sub_2448EA548() - 8) + 80);
  return sub_2448DAC60(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_2448DC7F0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IOPowerSource.Observer();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for IOPowerSource.NotificationCallbackWrapper()
{
  return objc_opt_self();
}

uint64_t sub_2448DC84C()
{
  return sub_2448DB50C();
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

unint64_t sub_2448DC870()
{
  unint64_t result;

  result = qword_257391E30;
  if (!qword_257391E30)
  {
    result = MEMORY[0x24951AC70](&protocol conformance descriptor for IOPowerSource.State.BatteryInfo.Status, &type metadata for IOPowerSource.State.BatteryInfo.Status);
    atomic_store(result, (unint64_t *)&qword_257391E30);
  }
  return result;
}

uint64_t type metadata accessor for IOPowerSource()
{
  return objc_opt_self();
}

uint64_t method lookup function for IOPowerSource()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IOPowerSource.__allocating_init(observeOn:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t getEnumTagSinglePayload for IOPowerSource.State(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t result;
  unsigned int v3;
  unsigned int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && a1[16])
    return (*(_DWORD *)a1 + 253);
  v3 = *a1;
  if (v3 < 2)
    return 0;
  v4 = (v3 + 2147483646) & 0x7FFFFFFF;
  result = v4 - 1;
  if (v4 <= 1)
    return 0;
  return result;
}

uint64_t storeEnumTagSinglePayload for IOPowerSource.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 3;
  }
  return result;
}

uint64_t sub_2448DC974(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_QWORD *sub_2448DC990(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *result = a2 - 255;
    result[1] = 0;
  }
  else if (a2)
  {
    *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for IOPowerSource.State()
{
  return &type metadata for IOPowerSource.State;
}

uint64_t getEnumTagSinglePayload for IOPowerSource.State.BatteryInfo(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[16])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IOPowerSource.State.BatteryInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for IOPowerSource.State.BatteryInfo()
{
  return &type metadata for IOPowerSource.State.BatteryInfo;
}

uint64_t storeEnumTagSinglePayload for IOPowerSource.State.BatteryInfo.Status(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2448DCAB4 + 4 * byte_2448F8565[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2448DCAE8 + 4 * byte_2448F8560[v4]))();
}

uint64_t sub_2448DCAE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2448DCAF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2448DCAF8);
  return result;
}

uint64_t sub_2448DCB04(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2448DCB0CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2448DCB10(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2448DCB18(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IOPowerSource.State.BatteryInfo.Status()
{
  return &type metadata for IOPowerSource.State.BatteryInfo.Status;
}

uint64_t *sub_2448DCB34(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
  }
  else
  {
    v7 = sub_2448EA548();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
  }
  swift_retain();
  return a1;
}

uint64_t sub_2448DCBC4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_2448DCC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

uint64_t sub_2448DCC74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2448DCCE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_2448DCD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2448EA548();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_2448DCDAC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2448DCDB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2448EA548();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_2448DCE34()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2448DCE40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2448EA548();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_2448DCEB8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2448EA548();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2448DCF2C()
{
  return sub_2447BD7A0((unint64_t *)&qword_25738CF90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_2448DCF58()
{
  return sub_2448DBCC0();
}

uint64_t sub_2448DCF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IOPowerSource.Observer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2448DCFA4()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

const __CFDictionary *sub_2448DCFC8@<X0>(_QWORD *a1@<X0>, CFDictionaryRef *a2@<X8>)
{
  uint64_t v2;

  return sub_2448DC338(a1, *(const void **)(v2 + 16), a2);
}

uint64_t sub_2448DCFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IOPowerSource.Observer();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL sub_2448DD014(uint64_t a1)
{
  return sub_2448DBF58(a1);
}

BOOL static Staleable.Discriminant.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Staleable.Discriminant.hash(into:)()
{
  return sub_2448EBD0C();
}

uint64_t Staleable.Discriminant.hashValue.getter()
{
  sub_2448EBD00();
  sub_2448EBD0C();
  return sub_2448EBD3C();
}

uint64_t sub_2448DD0C8()
{
  sub_2448EBD00();
  Staleable.Discriminant.hash(into:)();
  return sub_2448EBD3C();
}

uint64_t Staleable.discriminant.getter@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  *a2 = swift_getEnumCaseMultiPayload() == 1;
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
}

uint64_t Staleable.currentValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(v9 + 32))(a2, v6, *(_QWORD *)(a1 + 16));
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v9 + 56))(a2, 1, 1, *(_QWORD *)(a1 + 16));
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }
}

uint64_t Staleable.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v5);
  return (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 32))(a2, v5);
}

BOOL Staleable.isCurrent.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _BOOL8 v5;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  v5 = swift_getEnumCaseMultiPayload() == 1;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  return v5;
}

uint64_t Staleable.map<A>(_:)(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  int EnumCaseMultiPayload;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v25 = a4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v24 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v15 + 16))(v14, v16);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    v18(v12, v14, v5);
    v19 = v26;
    a1(v12);
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v12, v5);
    if (v19)
      return result;
  }
  else
  {
    v18(v9, v14, v5);
    v23 = v26;
    a1(v9);
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    if (v23)
      return result;
  }
  type metadata accessor for Staleable(0, v25, v21, v22);
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for Staleable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Staleable);
}

uint64_t Staleable.flattenedMap<A>(_:)@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
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

  v5 = v3;
  v27 = a3;
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v12;
  v26 = sub_2448EB508();
  v23 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v14 = (char *)&v23 - v13;
  v25 = v5;
  Staleable.value.getter(a2, (uint64_t)v11);
  a1(v11);
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (!v4)
  {
    MEMORY[0x24BDAC7A8](result);
    v16 = v24;
    v17 = v25;
    *(&v23 - 4) = v8;
    *(&v23 - 3) = v16;
    *(&v23 - 2) = v17;
    v20 = type metadata accessor for Staleable(0, v16, v18, v19);
    v21 = v26;
    sub_244818D58((void (*)(char *, char *))sub_2448DD6C8, (uint64_t)(&v23 - 6), MEMORY[0x24BEE4078], v20, v22, v27);
    return (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v14, v21);
  }
  return result;
}

uint64_t sub_2448DD6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(v4 + 24);
  v9 = *(_QWORD *)(v4 + 16);
  v10 = v5;
  v11 = a1;
  v6 = type metadata accessor for Staleable(0, v9, a3, a4);
  return Staleable.map<A>(_:)((void (*)(char *))sub_2448DE09C, (uint64_t)&v8, v6, v5);
}

void sub_2448DD730()
{
  JUMPOUT(0x24951AC70);
}

uint64_t sub_2448DD740()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_2448DD7A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if (v6 <= 7 && (unint64_t)(v5 + 1) <= 0x18 && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    v10 = *((unsigned __int8 *)a2 + v5);
    if (v10 >= 2)
    {
      if (v5 <= 3)
        v11 = v5;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    *((_BYTE *)v3 + v5) = v10 == 1;
  }
  else
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return v3;
}

uint64_t sub_2448DD8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  v8 = v6 == 1;
  (*(void (**)(uint64_t))(v4 + 16))(a1);
  *(_BYTE *)(a1 + v5) = v8;
  return a1;
}

uint64_t sub_2448DD968(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    v8 = *(unsigned __int8 *)(a2 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    v10 = v8 == 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
    *(_BYTE *)(a1 + v7) = v10;
  }
  return a1;
}

uint64_t sub_2448DDA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  v8 = v6 == 1;
  (*(void (**)(uint64_t))(v4 + 32))(a1);
  *(_BYTE *)(a1 + v5) = v8;
  return a1;
}

uint64_t sub_2448DDB0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  BOOL v10;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    v8 = *(unsigned __int8 *)(a2 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    v10 = v8 == 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(a1, a2, v5);
    *(_BYTE *)(a1 + v7) = v10;
  }
  return a1;
}

uint64_t sub_2448DDBF4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  if (!a2)
    return 0;
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 < 0xFF)
    goto LABEL_19;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v8 < 2)
    {
LABEL_19:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_19;
LABEL_12:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448DDCAC + 4 * byte_2448F8779[(v4 - 1)]))();
}

void sub_2448DDCF8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_2448DDE94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448DDED0 + 4 * byte_2448F8787[v3]))();
}

void sub_2448DDF18(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_2448DDFD4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2448DE020 + 4 * byte_2448F8791[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2448DE054 + 4 * byte_2448F878C[v4]))();
}

uint64_t sub_2448DE054(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2448DE05C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2448DE064);
  return result;
}

uint64_t sub_2448DE070(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2448DE078);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2448DE07C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2448DE084(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t type metadata accessor for Staleable.Discriminant(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Staleable.Discriminant);
}

uint64_t sub_2448DE09C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 16))(a1, *(_QWORD *)(v1 + 32));
}

uint64_t Future.then<A>(dsoHandle:file:line:column:function:on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, __int128 *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  __int128 v14;
  __int128 v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  *(_QWORD *)&v15 = a2;
  *((_QWORD *)&v15 + 1) = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v14 = *a10;
  return sub_2448DE3C0(&v15, &v14, a11, a12, a13);
}

uint64_t Future.flatMap<A>(dsoHandle:file:line:column:function:on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v14 = *a10;
  v13 = a10[1];
  v18[0] = a2;
  v18[1] = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v17[0] = v14;
  v17[1] = v13;
  v16[0] = v14;
  v16[1] = v13;
  return sub_2448DE188((uint64_t)v18, (uint64_t)v17, (uint64_t)v16, a11, a12, a13);
}

uint64_t sub_2448DE188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v17;
  __int128 v18;
  __int128 v21;
  __int128 v22;
  uint64_t v23[2];
  char v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  v18 = *(_OWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v17 = *(_BYTE *)(a1 + 56);
  v12 = *(void **)a2;
  v13 = *(_QWORD *)(a2 + 8);
  v14 = *(void **)a3;
  v15 = *(_QWORD *)(a3 + 8);
  type metadata accessor for FlatMapFuture(0, *(_QWORD *)(*(_QWORD *)v6 + 80), a6, a4);
  v23[0] = v7;
  v23[1] = v8;
  v24 = v9;
  v25 = v18;
  v26 = v10;
  v27 = v11;
  v28 = v17;
  *(_QWORD *)&v22 = v12;
  *((_QWORD *)&v22 + 1) = v13;
  *(_QWORD *)&v21 = v14;
  *((_QWORD *)&v21 + 1) = v15;
  swift_retain();
  sub_24481240C(v12);
  sub_24481240C(v14);
  swift_allocObject();
  swift_retain();
  return sub_2448DEF84(v23, v6, &v22, &v21, a4, a5);
}

uint64_t Future.tryFlatMap<A>(dsoHandle:file:line:column:function:on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v14 = *v13;
  v16 = *a10;
  v15 = a10[1];
  v22[0] = a2;
  v22[1] = a3;
  v23 = a4;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a9;
  v21[0] = v16;
  v21[1] = v15;
  v20[0] = v16;
  v20[1] = v15;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = *(_QWORD *)(v14 + 80);
  v17[3] = a13;
  v17[4] = a11;
  v17[5] = a12;
  swift_retain();
  v18 = sub_2448DE188((uint64_t)v22, (uint64_t)v21, (uint64_t)v20, (uint64_t)sub_2448DE4BC, (uint64_t)v17, a13);
  swift_release();
  return v18;
}

uint64_t sub_2448DE348(uint64_t *a1, uint64_t a2, _OWORD *a3, _OWORD *a4, uint64_t a5, uint64_t a6)
{
  swift_allocObject();
  return sub_2448DEF84(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2448DE3C0(__int128 *a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v9;
  char v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v15[2];
  __int128 v16;
  __int128 v17;
  char v18;
  __int128 v19;
  __int128 v20;
  char v21;

  v9 = *v5;
  v10 = *((_BYTE *)a1 + 56);
  v11 = *a1;
  v18 = *((_BYTE *)a1 + 16);
  v19 = *(__int128 *)((char *)a1 + 24);
  v20 = *(__int128 *)((char *)a1 + 40);
  v21 = v10;
  v16 = *a2;
  v17 = v11;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = *(_QWORD *)(v9 + 80);
  v12[3] = a5;
  v12[4] = a3;
  v12[5] = a4;
  v15[0] = 0;
  v15[1] = 0;
  swift_retain();
  v13 = sub_2448DE188((uint64_t)&v17, (uint64_t)&v16, (uint64_t)v15, (uint64_t)sub_2448E05A8, (uint64_t)v12, a5);
  swift_release();
  sub_24481241C(0);
  return v13;
}

uint64_t sub_2448DE498()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448DE4BC(uint64_t a1)
{
  uint64_t v1;

  return sub_2448DEE60(a1, *(uint64_t (**)(void))(v1 + 32));
}

uint64_t Future.then<A>(dsoHandle:file:line:column:function:priority:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t *v13;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v29 = a7;
  v30 = a8;
  v34 = a12;
  v32 = a13;
  v33 = a11;
  v31 = *v13;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A208);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  MEMORY[0x24BDAC7A8](v19);
  *(_QWORD *)&v36 = a2;
  *((_QWORD *)&v36 + 1) = a3;
  v37 = a4;
  v38 = a5;
  v39 = a6;
  v40 = v29;
  v41 = v30;
  v42 = a9;
  v35 = 0uLL;
  sub_244883CDC(a10, (uint64_t)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v23 = swift_allocObject();
  v24 = v32;
  *(_QWORD *)(v23 + 16) = *(_QWORD *)(v31 + 80);
  *(_QWORD *)(v23 + 24) = v24;
  sub_2448DE898((uint64_t)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v23 + v22);
  v25 = (_QWORD *)(v23 + ((v21 + v22 + 7) & 0xFFFFFFFFFFFFFFF8));
  v26 = v34;
  *v25 = v33;
  v25[1] = v26;
  swift_retain();
  v27 = sub_2448DE3C0(&v36, &v35, (uint64_t)sub_2448DE8E0, v23, v24);
  swift_release();
  sub_24481241C((id)v35);
  return v27;
}

uint64_t sub_2448DE654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD v23[2];

  v12 = *(_QWORD *)(a5 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A208);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[1] = type metadata accessor for Future(0, a6, v17, v18);
  sub_244883CDC(a2, (uint64_t)v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a5);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = (char *)swift_allocObject();
  *((_QWORD *)v20 + 2) = a5;
  *((_QWORD *)v20 + 3) = a6;
  *((_QWORD *)v20 + 4) = a3;
  *((_QWORD *)v20 + 5) = a4;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v20[v19], (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
  swift_retain();
  v21 = sub_2448D42D8((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 142, 22, (uint64_t)"then(dsoHandle:file:line:column:function:priority:transform:)", 61, 2, (uint64_t)v16, (uint64_t)&unk_257392278, (uint64_t)v20);
  swift_release();
  return v21;
}

uint64_t sub_2448DE7E0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25738A208) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = sub_2448EAF74();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448DE898(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A208);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2448DE8E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25738A208) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (uint64_t *)(v1 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_2448DE654(a1, v1 + v6, *v7, v7[1], v3, v4);
}

uint64_t sub_2448DE94C(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a2 + *a2);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_2447C62E8;
  return v9(a1, a4);
}

uint64_t sub_2448DE9C0(uint64_t a1, uint64_t (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;

  v9 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v12 = sub_2448EBD48();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (void **)((char *)&v21 - v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v21 - v13, a1, v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = *v14;
    type metadata accessor for Future(0, a5, v16, v17);
    v19 = sub_2447D2F1C((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 156, 31, (uint64_t)"then(callsite:on:transform:)", 28, 2, v18);

  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v9 + 32))(v11, v14, a4);
    v19 = a2(v11);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, a4);
  }
  return v19;
}

uint64_t Future.flatMapFailure(dsoHandle:file:line:column:function:on:resultCallback:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, __int128 *a10, uint64_t a11, uint64_t a12)
{
  uint64_t *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];
  __int128 v19;
  _QWORD v20[2];
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v13 = *v12;
  v20[0] = a2;
  v20[1] = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a8;
  v26 = a9;
  v19 = *a10;
  v14 = (_QWORD *)swift_allocObject();
  v15 = *(_QWORD *)(v13 + 80);
  v14[2] = v15;
  v14[3] = a11;
  v14[4] = a12;
  v18[0] = 0;
  v18[1] = 0;
  swift_retain();
  v16 = sub_2448DE188((uint64_t)v20, (uint64_t)v18, (uint64_t)&v19, (uint64_t)sub_2448DEDA0, (uint64_t)v14, v15);
  swift_release();
  sub_24481241C(0);
  return v16;
}

uint64_t sub_2448DEC08(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v7 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v10 = sub_2448EBD48();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v19 - v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v19 - v11, a1, v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = (void *)*v12;
    v15 = a2(*v12);

  }
  else
  {
    (*(void (**)(char *, _QWORD *, uint64_t))(v7 + 32))(v9, v12, a4);
    type metadata accessor for Future(0, a4, v16, v17);
    v15 = sub_2447D2DFC((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 178, 34, (uint64_t)"flatMapFailure(dsoHandle:file:line:column:function:on:resultCallback:)", 70, 2, (uint64_t)v9);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a4);
  }
  return v15;
}

uint64_t sub_2448DED7C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448DEDA0(uint64_t a1)
{
  uint64_t v1;

  return sub_2448DEC08(a1, *(uint64_t (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16));
}

uint64_t Future.tryThen<A>(dsoHandle:file:line:column:function:on:transform:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, __int128 *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v14 = *v13;
  *(_QWORD *)&v19 = a2;
  *((_QWORD *)&v19 + 1) = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v18 = *a10;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = *(_QWORD *)(v14 + 80);
  v15[3] = a13;
  v15[4] = a11;
  v15[5] = a12;
  swift_retain();
  v16 = sub_2448DE3C0(&v19, &v18, (uint64_t)sub_2448DEEFC, (uint64_t)v15, a13);
  swift_release();
  return v16;
}

uint64_t sub_2448DEE60(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_2448DEEFC(uint64_t a1)
{
  uint64_t v1;

  return sub_2448DEE60(a1, *(uint64_t (**)(void))(v1 + 32));
}

uint64_t sub_2448DEF28()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2448DEF84(uint64_t *a1, uint64_t a2, _OWORD *a3, _OWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  _QWORD v21[2];
  char v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v7 = *v6;
  v8 = *a1;
  v9 = a1[1];
  v10 = *((_BYTE *)a1 + 16);
  v20 = *(_OWORD *)(a1 + 3);
  v11 = a1[5];
  v12 = a1[6];
  v13 = *((_BYTE *)a1 + 56);
  v6[13] = a5;
  v6[14] = a6;
  *(_OWORD *)(v6 + 15) = *a3;
  *(_OWORD *)(v6 + 17) = *a4;
  v21[0] = a2;
  v14 = type metadata accessor for FlatMapFuture.Activity(0, *(_QWORD *)(v7 + 200), *(_QWORD *)(v7 + 208), (uint64_t)a4);
  swift_retain();
  swift_retain();
  v6[19] = sub_24481320C(v21, v14);
  swift_release();
  v21[0] = v8;
  v21[1] = v9;
  v22 = v10;
  v23 = v20;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v18 = sub_2448D24B4((uint64_t)v21, v15, v16, v17);
  swift_retain_n();
  Future.observeCompletion(_:)((uint64_t)sub_2448E029C, v18);
  swift_release();
  swift_retain();
  Future.observeCancelation(_:)((uint64_t)sub_2448E0294, v18);
  swift_release_n();
  swift_release();
  swift_release();
  return v18;
}

void sub_2448DF0B8(unint64_t a1)
{
  _QWORD *v1;
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
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  const void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  char *v56;
  void *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  void (*v63)(uint64_t, uint64_t);
  _QWORD v64[2];
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  _QWORD *v79;
  char *v80;
  unint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char v85[16];
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  void *aBlock;
  uint64_t v91;
  uint64_t (*v92)(uint64_t);
  void *v93;
  unint64_t (*v94)();
  char *v95;
  uint64_t v96;

  v81 = a1;
  v2 = *v1;
  v74 = sub_2448EA704();
  v72 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v71 = (char *)v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_2448EA734();
  v70 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v75 = (char *)v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v2 + 200);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v6 = sub_2448EBD48();
  v84 = *(_QWORD *)(v6 - 8);
  v7 = *(_QWORD *)(v84 + 64);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v80 = (char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v82 = (char *)v64 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v78 = (char *)v64 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v83 = (char *)v64 - v13;
  v14 = *(_QWORD *)(v2 + 208);
  type metadata accessor for Promise(255, v14, v15, v16);
  v76 = v6;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = sub_2448EB508();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v64 - v23;
  v79 = v1;
  v96 = v1[19];
  v86 = v5;
  v87 = v14;
  v88 = v81;
  v81 = v5;
  v77 = v14;
  type metadata accessor for FlatMapFuture.Activity(255, v5, v14, v25);
  v26 = sub_2448EA5D8();
  swift_retain();
  v27 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v26);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)((uint64_t)&dword_2447B9000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 306, 55, (uint64_t)"firstCompleted(_:)", 18, 2, (uint64_t)sub_2448E02A0, (uint64_t)v85, v26, v18, v27);
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 48))(v22, 1, TupleTypeMetadata2) == 1)
  {
    v28 = *(void (**)(char *, uint64_t))(v19 + 8);
    v28(v24, v18);
    v28(v22, v18);
    return;
  }
  v66 = v24;
  v67 = v19;
  v68 = v18;
  v65 = *(_QWORD *)&v22[*(int *)(TupleTypeMetadata2 + 48)];
  v30 = v83;
  v29 = v84;
  v31 = *(void (**)(char *, char *, uint64_t))(v84 + 32);
  v32 = v76;
  v31(v83, v22, v76);
  v33 = (uint64_t)v79;
  Result.analyze<A>(success:failure:)((void (*)(char *))sub_2448E02BC, (uint64_t)v79, (void (*)(char *))sub_2448E02C8, (uint64_t)v79, v32);
  v34 = v91;
  v69 = aBlock;
  v35 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v36 = v78;
  v35(v78, v30, v32);
  v35(v82, v36, v32);
  v37 = (uint64_t)v80;
  v35(v80, v36, v32);
  v38 = (*(unsigned __int8 *)(v29 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v39 = (v7 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = (char *)swift_allocObject();
  v41 = v77;
  *((_QWORD *)v40 + 2) = v81;
  *((_QWORD *)v40 + 3) = v41;
  *((_QWORD *)v40 + 4) = v33;
  v42 = v36;
  v43 = v65;
  v31(&v40[v38], v42, v32);
  *(_QWORD *)&v40[v39] = v43;
  v44 = v69;
  aBlock = v69;
  v91 = v34;
  swift_retain_n();
  swift_retain_n();
  if ((ExecutionLane.isCurrentLane.getter() & 1) == 0)
  {
    if (v44)
    {
      v64[1] = v34;
      if (v44 != (void *)1)
      {
        v94 = sub_2448E03AC;
        v95 = v40;
        aBlock = (void *)MEMORY[0x24BDAC760];
        v91 = 1107296256;
        v92 = sub_2447EB164;
        v93 = &block_descriptor_14;
        v55 = _Block_copy(&aBlock);
        swift_retain();
        sub_24481240C(v44);
        v56 = v75;
        sub_2448EA71C();
        v89 = MEMORY[0x24BEE4AF8];
        v81 = sub_2447EB5DC();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25738B1E8);
        sub_2448039A4();
        v57 = v44;
        v58 = v71;
        v59 = v74;
        sub_2448EB6C4();
        MEMORY[0x249519C08](0, v56, v58, v55);
        _Block_release(v55);
        sub_24481241C(v57);
        v60 = v58;
        v44 = v57;
        (*(void (**)(char *, uint64_t))(v72 + 8))(v60, v59);
        v61 = v56;
        v37 = (uint64_t)v80;
        (*(void (**)(char *, uint64_t))(v70 + 8))(v61, v73);
        swift_release();
        swift_release();
        goto LABEL_11;
      }
      sub_244803860();
      v81 = sub_2448EB418();
      v94 = sub_2448E03AC;
      v95 = v40;
      aBlock = (void *)MEMORY[0x24BDAC760];
      v91 = 1107296256;
      v92 = sub_2447EB164;
      v93 = &block_descriptor_16;
      v78 = (char *)_Block_copy(&aBlock);
      swift_retain();
      swift_release();
      v48 = v75;
      sub_2448EA71C();
      aBlock = (void *)MEMORY[0x24BEE4AF8];
      sub_2447EB5DC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25738B1E8);
      sub_2448039A4();
      v49 = v71;
      v50 = v74;
      sub_2448EB6C4();
      v51 = v48;
      v52 = v78;
      v53 = (void *)v81;
      MEMORY[0x249519C08](0, v51, v49, v78);
      _Block_release(v52);

      v54 = v50;
      v44 = v69;
      (*(void (**)(char *, uint64_t))(v72 + 8))(v49, v54);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v75, v73);
    }
    else
    {
      sub_2448DFD80(v33, v37, v43, v45);
    }
    swift_release();
LABEL_11:
    swift_release();
    v47 = v84;
    v46 = (uint64_t)v82;
    goto LABEL_12;
  }
  v46 = (uint64_t)v82;
  sub_2448DFD80(v33, (uint64_t)v82, v43, v45);
  swift_release();
  swift_release();
  v47 = v84;
LABEL_12:
  v62 = v83;
  v63 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
  v63(v37, v32);
  swift_release();
  swift_release();
  v63(v46, v32);
  swift_release_n();
  v63((uint64_t)v62, v32);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v68);
  sub_24481241C(v44);
}

uint64_t sub_2448DF8EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  char v5;
  __int128 v7;
  char v8;
  __int128 v9;
  __int128 v10;
  char v11;

  v4 = *(_BYTE *)(a1 + 16);
  v5 = *(_BYTE *)(a1 + 56);
  v7 = *(_OWORD *)a1;
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 24);
  v10 = *(_OWORD *)(a1 + 40);
  v11 = v5;
  return sub_2448DF940(&v7, a2, a3, a4);
}

uint64_t sub_2448DF940(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
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
  uint64_t result;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  _BYTE v32[8];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
  _QWORD *v38;
  _BYTE v39[16];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[3];

  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 208);
  v8 = type metadata accessor for FutureTermination(0, v7, a3, a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (_OWORD *)((char *)v36 - v10);
  v12 = a1[1];
  v45 = *a1;
  v46 = v12;
  v47[0] = a1[2];
  *(_OWORD *)((char *)v47 + 9) = *(__int128 *)((char *)a1 + 41);
  v38 = v4;
  v42 = v4[19];
  v13 = *(_QWORD *)(v6 + 200);
  v40 = v13;
  v41 = v7;
  type metadata accessor for FlatMapFuture.Activity(255, v13, v7, v14);
  v15 = sub_2448EA5D8();
  v18 = type metadata accessor for Future(255, v13, v16, v17);
  v21 = type metadata accessor for Future(255, v7, v19, v20);
  v23 = type metadata accessor for Either(255, v18, v21, v22);
  v24 = sub_2448EB508();
  swift_retain();
  v25 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v15);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)((uint64_t)&dword_2447B9000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 350, 42, (uint64_t)"cancel(callsite:)", 17, 2, (uint64_t)sub_2448E01FC, (uint64_t)v39, v15, v24, v25);
  result = swift_release();
  v27 = v44;
  if (v44 != 255)
  {
    v36[1] = v36;
    v28 = v43;
    v44 &= 1u;
    v29 = MEMORY[0x24BDAC7A8](result);
    v37 = v9;
    MEMORY[0x24BDAC7A8](v29);
    v33 = v13;
    v34 = v7;
    v35 = v30;
    swift_retain();
    Either.analyze<A>(left:right:)((void (*)(char *))sub_2448E0240, (uint64_t)v32, (void (*)(char *))sub_2448E0240, (uint64_t)v32, v23);
    v31 = v46;
    *v11 = v45;
    v11[1] = v31;
    v11[2] = v47[0];
    *(_OWORD *)((char *)v11 + 41) = *(_OWORD *)((char *)v47 + 9);
    swift_storeEnumTagMultiPayload();
    sub_2448D2CA4((uint64_t)v11);
    sub_24486F960(v28, v27);
    sub_24486F960(v28, v27);
    return (*(uint64_t (**)(_OWORD *, uint64_t))(v37 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_2448DFBE8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v7;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t TupleTypeMetadata2;

  v7 = *a1;
  if (v7 >> 62)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    sub_2448EBD48();
    type metadata accessor for Promise(255, a3, v20, v21);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(a4, 1, 1, TupleTypeMetadata2);
  }
  else
  {
    sub_24486F928(v7);
    type metadata accessor for Future(0, a3, v9, v10);
    v11 = sub_2447EB4A0((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 312, 77, (uint64_t)"firstCompleted(_:)", 18, 2);
    v13 = v12;
    *a1 = v11 | 0x4000000000000000;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    v14 = sub_2448EBD48();
    type metadata accessor for Promise(255, a3, v15, v16);
    v17 = swift_getTupleTypeMetadata2();
    v18 = *(int *)(v17 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a4, a2, v14);
    *(_QWORD *)(a4 + v18) = v13;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a4, 0, 1, v17);
  }
}

unint64_t sub_2448DFD80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  uint64_t v10;
  void *v11;
  uint64_t v12[2];
  unint64_t v13[2];

  v6 = *(_QWORD *)a1;
  v12[0] = *(_QWORD *)(a1 + 152);
  type metadata accessor for FlatMapFuture.Activity(255, *(_QWORD *)(v6 + 200), *(_QWORD *)(v6 + 208), a4);
  v7 = sub_2448EA5D8();
  v8 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v7);
  SynchronousAccessProviding<>.peek(file:line:column:function:)((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 325, 42, (uint64_t)"firstCompleted(_:)", 18, 2, v7, v8);
  result = sub_24486F928(v13[0]);
  if (v13[0] != 0x8000000000000008)
  {
    v10 = (*(uint64_t (**)(uint64_t))(a1 + 104))(a2);
    sub_244836CF8(v13);
    v11 = (void *)v13[0];
    v12[0] = v13[0];
    v12[1] = v13[1];
    Promise.track(future:on:)(v10, v12);
    sub_24481241C(v11);
    swift_retain();
    Future.observeFinish(_:)((uint64_t)sub_2448E0430, a1);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2448DFEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v6 = *v4;
  v14 = v4[19];
  v7 = *(_QWORD *)(v6 + 208);
  v12 = *(_QWORD *)(v6 + 200);
  v13 = v7;
  type metadata accessor for FlatMapFuture.Activity(255, v12, v7, a4);
  v8 = sub_2448EA5D8();
  swift_retain();
  v9 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v8);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)((uint64_t)&dword_2447B9000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/FlatMapFuture.swift", 125, 2, 335, 47, (uint64_t)"secondFinished(_:)", 18, 2, (uint64_t)sub_2448E0434, (uint64_t)v11, v8, MEMORY[0x24BEE1328], v9);
  result = swift_release();
  if (v15 == 1)
    return sub_2448D2CA4(a1);
  return result;
}

uint64_t sub_2448DFFB4()
{
  uint64_t v0;

  swift_release();
  sub_24481241C(*(id *)(v0 + 120));
  sub_24481241C(*(id *)(v0 + 136));
  return swift_release();
}

uint64_t sub_2448DFFE0()
{
  uint64_t v0;

  v0 = Future.deinit();
  swift_release();
  sub_24481241C(*(id *)(v0 + 120));
  sub_24481241C(*(id *)(v0 + 136));
  swift_release();
  return v0;
}

uint64_t sub_2448E0024()
{
  sub_2448DFFE0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FlatMapFuture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FlatMapFuture);
}

unint64_t *sub_2448E004C(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_24486F944(*a2);
  *a1 = v3;
  return a1;
}

unint64_t sub_2448E007C(unint64_t *a1)
{
  return sub_24486F928(*a1);
}

unint64_t *sub_2448E0084(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_24486F944(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_24486F928(v4);
  return a1;
}

unint64_t *sub_2448E00BC(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_24486F928(v3);
  return a1;
}

uint64_t sub_2448E00EC(uint64_t a1, unsigned int a2)
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

uint64_t sub_2448E0148(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2448E0198(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_2448E01B4(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2448E01C4(unint64_t *result, uint64_t a2)
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

uint64_t type metadata accessor for FlatMapFuture.Activity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FlatMapFuture.Activity);
}

uint64_t *sub_2448E01FC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  char v6;

  v2 = *result;
  v3 = (unint64_t)*result >> 62;
  v4 = *result & 0x3FFFFFFFFFFFFFFFLL;
  if ((_DWORD)v3 == 1)
  {
    v5 = 1;
  }
  else
  {
    v4 = 0;
    v5 = -1;
  }
  if ((_DWORD)v3)
  {
    v2 = v4;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  *result = 0x8000000000000008;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v6;
  return result;
}

uint64_t sub_2448E0244(uint64_t *a1)
{
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];
  _OWORD v7[2];

  v2 = *(_OWORD **)(v1 + 32);
  v3 = *a1;
  v4 = v2[1];
  v6[0] = *v2;
  v6[1] = v4;
  v7[0] = v2[2];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v2 + 41);
  return (*(uint64_t (**)(_OWORD *))(*(_QWORD *)v3 + 192))(v6);
}

uint64_t sub_2448E0294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_2448DF8EC(a1, v4, a3, a4);
}

uint64_t sub_2448E02A0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2448DFBE8(a1, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 24), a2);
}

id sub_2448E02BC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v1 + 120);
  v3 = *(_QWORD *)(v1 + 128);
  *a1 = v2;
  a1[1] = v3;
  return sub_24481240C(v2);
}

id sub_2448E02C8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v1 + 136);
  v3 = *(_QWORD *)(v1 + 144);
  *a1 = v2;
  a1[1] = v3;
  return sub_24481240C(v2);
}

uint64_t sub_2448E02D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v2 = *(_QWORD *)(sub_2448EBD48() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  if (swift_getEnumCaseMultiPayload() == 1)

  else
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_2448E03AC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v1 = *(_QWORD *)(sub_2448EBD48() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_2448DFD80(*(_QWORD *)(v0 + 32), v0 + v2, *(_QWORD *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)), v3);
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

unint64_t sub_2448E0434@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  unint64_t result;
  char v5;

  result = *a1;
  if (result >> 62 == 1)
  {
    result = sub_24486F928(result);
    *a1 = 0x8000000000000000;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t sub_2448E0490()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2448E04FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 16) - 8) + 80);
  v5 = *(int **)(v1 + 32);
  v6 = v1 + ((v4 + 48) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2447C62E8;
  v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
  v8 = (_QWORD *)swift_task_alloc();
  v7[2] = v8;
  *v8 = v7;
  v8[1] = sub_2447C62E8;
  return v10(a1, v6);
}

uint64_t sub_2448E05A8(uint64_t a1)
{
  uint64_t v1;

  return sub_2448DE9C0(a1, *(uint64_t (**)(char *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2448E05C8(__int128 *a1)
{
  return sub_2448E05E4(a1, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, __int128 *))sub_2448E30CC, &qword_25738A600, (uint64_t (*)(uint64_t *))sub_2447D2338);
}

uint64_t sub_2448E05E4(__int128 *a1, void (*a2)(uint64_t *__return_ptr, os_unfair_lock_s *, __int128 *), uint64_t *a3, uint64_t (*a4)(uint64_t *))
{
  uint64_t v4;
  uint64_t v8;
  char v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  char v12;
  uint64_t result;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  char v18;
  char v19;
  uint64_t v20;

  v8 = *((unsigned __int8 *)a1 + 16);
  v9 = *((_BYTE *)a1 + 56);
  v10 = *(_QWORD *)(v4 + 16);
  v14 = *a1;
  v15 = v8;
  v16 = *(__int128 *)((char *)a1 + 24);
  v17 = *(__int128 *)((char *)a1 + 40);
  v18 = v9;
  v19 = 2;
  v11 = *(os_unfair_lock_s **)(v10 + 104);
  swift_retain();
  os_unfair_lock_lock(v11 + 19);
  a2(&v20, v11 + 4, &v14);
  os_unfair_lock_unlock(v11 + 19);
  v12 = v20;
  result = swift_release();
  if ((v12 & 1) != 0)
  {
    sub_2447D3184((uint64_t)&v14, (uint64_t)&v20, a3);
    return a4(&v20);
  }
  return result;
}

uint64_t sub_2448E0710@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  os_unfair_lock_s *v13;
  uint64_t v14;
  uint64_t v15;
  os_unfair_lock_s *v16;
  uint64_t (*v17)();
  uint64_t v18;
  uint64_t result;
  _QWORD v20[3];

  v5 = v4;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v20[1] = sub_24481D1FC;
  v20[2] = v10;
  v11 = qword_257389CA0;
  swift_retain();
  swift_retain();
  if (v11 != -1)
    swift_once();
  v12 = (_QWORD *)((char *)off_25738DB00 + 16);
  v13 = (os_unfair_lock_s *)((char *)off_25738DB00 + 24);
  swift_retain();
  os_unfair_lock_lock(v13);
  sub_24483B130(v12, v20);
  os_unfair_lock_unlock(v13);
  v14 = v20[0];
  v15 = swift_release();
  MEMORY[0x24BDAC7A8](v15);
  v16 = *(os_unfair_lock_s **)(v5 + 16);
  swift_retain();
  os_unfair_lock_lock(v16 + 8);
  sub_2448E399C((uint64_t)&v16[4]);
  os_unfair_lock_unlock(v16 + 8);
  swift_release();
  v17 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v17 + 2) = sub_2448E3994;
  *((_QWORD *)v17 + 3) = v5;
  *((_QWORD *)v17 + 4) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738AF78);
  swift_allocObject();
  v18 = sub_2447E5D90(a1, 0, 0, 1, 0, 0xD000000000000011, 0x80000002448F9A50, 0x64656C65636E6163, 0xE800000000000000);
  result = swift_release();
  *a4 = sub_2448E39C8;
  a4[1] = v17;
  a4[2] = (uint64_t (*)())v18;
  return result;
}

uint64_t sub_2448E0918(void (*a1)(os_unfair_lock_s *), uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v4;

  v4 = *(os_unfair_lock_s **)(a3 + 16);
  swift_retain();
  os_unfair_lock_lock(v4 + 8);
  a1(v4 + 4);
  os_unfair_lock_unlock(v4 + 8);
  return swift_release();
}

uint64_t SingleFireEvent.__allocating_init(description:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SingleFireEvent.init(description:)(a1, a2);
  return v4;
}

BOOL SingleFireEvent.hasFired.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2448B02F8((unint64_t *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  v2 = v4;
  swift_release();
  sub_2448B0808(v2);
  return v2 == 0;
}

void sub_2448E0A54(uint64_t a1@<X0>, void (**a2)(_QWORD)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  char v12;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a2;
  v7 = *(_QWORD *)(a1 + 16);
  _Block_copy(a2);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 32));
  sub_2448E2998((_QWORD *)(v7 + 16), (uint64_t)sub_2448E3644, v6, (uint64_t)v11);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 32));
  swift_release();
  v8 = v11[0];
  if (v11[0])
  {
    v9 = v11[1];
    v10 = v11[2];
    swift_release();
    _Block_release(a2);
    *a3 = v8;
    a3[1] = v9;
    a3[2] = v10;
  }
  else
  {
    if (v12)
      a2[2](a2);
    swift_release();
    _Block_release(a2);
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
}

uint64_t SingleFireEvent.observe(_:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  char v12;

  v7 = *(_QWORD *)(v3 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 32));
  sub_2448E2998((_QWORD *)(v7 + 16), (uint64_t)a1, a2, (uint64_t)&v10);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 32));
  result = swift_release();
  if ((_QWORD)v10)
  {
    v9 = v11;
    *(_OWORD *)a3 = v10;
    *(_QWORD *)(a3 + 16) = v9;
  }
  else
  {
    if (v12)
      result = a1(result);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  return result;
}

uint64_t sub_2448E0C30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t *v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  _BYTE v16[9];
  uint64_t v17[2];
  char v18;
  __int128 v19;
  const char *v20;
  uint64_t v21;
  char v22;
  _OWORD v23[5];

  v1 = *(_QWORD *)(a1 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2448E25D8((unint64_t *)(v1 + 16), (unint64_t *)v23);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  v3 = *((_QWORD *)&v23[0] + 1);
  v2 = *(_QWORD *)&v23[0];
  result = swift_release();
  if (v2)
  {
    v5 = *(_QWORD *)(v2 + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
    sub_24481308C((_QWORD *)(v5 + 16), v23);
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
    v6 = swift_release();
    v7 = v23[0];
    MEMORY[0x24BDAC7A8](v6);
    sub_2448A9A50((uint64_t)sub_2448E3650, (uint64_t)v14, v7, *((uint64_t *)&v7 + 1));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    memset(v23, 0, 58);
    sub_2447E9DDC((uint64_t)v23);
    v8 = *(_QWORD *)(v3 + 16);
    if (v8)
    {
      v15 = v2;
      v17[0] = (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsF"
                        "oundation/SingleFireEvent.swift";
      v17[1] = 127;
      v18 = 2;
      v19 = xmmword_2448F8920;
      v20 = "fire(inside:)";
      v21 = 13;
      v22 = 2;
      swift_bridgeObjectRetain();
      v14[4] = v3;
      v9 = (uint64_t *)(v3 + 48);
      do
      {
        v10 = (void (*)(uint64_t))*(v9 - 2);
        v11 = *v9;
        v12 = *(_QWORD *)(*v9 + 144);
        swift_retain();
        swift_retain();
        swift_retain();
        os_unfair_lock_lock((os_unfair_lock_t)(v12 + 76));
        sub_2447E5E3C((__int128 *)(v12 + 16), (uint64_t (*)(void))nullsub_1, v17, v11, (void (*)(uint64_t, _QWORD *))sub_2447E1AC8, v16);
        os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 76));
        v13 = swift_release();
        if ((v16[0] & 1) == 0)
          v10(v13);
        swift_release();
        swift_release();
        v9 += 3;
        --v8;
      }
      while (v8);
      swift_bridgeObjectRelease();
      v2 = v15;
    }
    sub_2448E3658(v2);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_2448E0E98(void (*a1)(uint64_t (*)(), _QWORD *))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  _BYTE v15[9];
  const char *v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  const char *v20;
  uint64_t v21;
  char v22;

  v3 = *(_QWORD *)(v1 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 32));
  sub_2448E25D8((unint64_t *)(v3 + 16), (unint64_t *)&v16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 32));
  v4 = (uint64_t)v16;
  v5 = v17;
  result = swift_release();
  if (v4)
  {
    MEMORY[0x24BDAC7A8](result);
    v13[2] = v4;
    v13[3] = v1;
    swift_retain();
    swift_bridgeObjectRetain();
    a1(sub_2448E3684, v13);
    v7 = *(_QWORD *)(v5 + 16);
    if (v7)
    {
      v14 = v4;
      v16 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/Si"
            "ngleFireEvent.swift";
      v17 = 127;
      v18 = 2;
      v19 = xmmword_2448F8920;
      v20 = "fire(inside:)";
      v21 = 13;
      v22 = 2;
      swift_bridgeObjectRetain();
      v13[4] = v5;
      v8 = (uint64_t *)(v5 + 48);
      do
      {
        v9 = (void (*)(uint64_t))*(v8 - 2);
        v10 = *v8;
        v11 = *(_QWORD *)(*v8 + 144);
        swift_retain();
        swift_retain();
        swift_retain();
        os_unfair_lock_lock((os_unfair_lock_t)(v11 + 76));
        sub_2447E5E3C((__int128 *)(v11 + 16), (uint64_t (*)(void))nullsub_1, (uint64_t *)&v16, v10, (void (*)(uint64_t, _QWORD *))sub_2447E1AC8, v15);
        os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 76));
        v12 = swift_release();
        if ((v15[0] & 1) == 0)
          v9(v12);
        swift_release();
        swift_release();
        v8 += 3;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      v4 = v14;
    }
    sub_2448E3658(v4);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t SingleFireEvent.observeUntilFiredOrCanceled(_:)(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v5 = *(_QWORD *)(v2 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
  sub_2448E2998((_QWORD *)(v5 + 16), (uint64_t)a1, a2, (uint64_t)&v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
  result = swift_release();
  v7 = v8;
  if (v8)
  {
    sub_2448E1168((uint64_t)&v8);
    return sub_2447C6AE8(v7);
  }
  else if (v9)
  {
    return a1(result);
  }
  return result;
}

uint64_t sub_2448E1168(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  char v6;
  uint64_t result;
  uint64_t v8;
  _BYTE v9[9];
  uint64_t v10[2];
  char v11;
  __int128 v12;
  const char *v13;
  uint64_t v14;
  char v15;

  v2 = *(uint64_t (**)(uint64_t))a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(os_unfair_lock_s **)(v1 + 16);
  swift_retain();
  os_unfair_lock_lock(v5 + 8);
  sub_2448E2ABC((uint64_t)&v5[4], (uint64_t)v2, v3, v4, (char *)v10);
  os_unfair_lock_unlock(v5 + 8);
  v6 = v10[0];
  result = swift_release();
  if ((v6 & 1) == 0)
  {
    v10[0] = (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFou"
                      "ndation/SingleFireEvent.swift";
    v10[1] = 127;
    v11 = 2;
    v12 = xmmword_2448F8930;
    v13 = "manage(_:)";
    v14 = 10;
    v15 = 2;
    v8 = *(_QWORD *)(v4 + 144);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 76));
    sub_2447E5E3C((__int128 *)(v8 + 16), (uint64_t (*)(void))nullsub_1, v10, v4, (void (*)(uint64_t, _QWORD *))sub_2447E1AC8, v9);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 76));
    result = swift_release();
    if ((v9[0] & 1) == 0)
      return v2(result);
  }
  return result;
}

uint64_t sub_2448E12A0(uint64_t a1, void *a2, uint64_t a3, void (*a4)(void **), uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const void *v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *aBlock;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t (*v30)();
  uint64_t v31;
  _BYTE v32[72];

  v10 = sub_2448EA704();
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_2448EA734();
  v22 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2447D3184(a1, (uint64_t)v32, &qword_25738A618);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a4;
  *(_QWORD *)(v15 + 24) = a5;
  sub_2447D3184((uint64_t)v32, v15 + 32, &qword_25738A618);
  aBlock = a2;
  v27 = a3;
  swift_retain();
  sub_2448E3728(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2447D31C8);
  swift_retain();
  sub_2448E3728(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2447D31C8);
  swift_retain();
  sub_2448E3728(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2447D31C8);
  if ((ExecutionLane.isCurrentLane.getter() & 1) != 0 || !a2)
  {
    sub_2447D3184(a1, (uint64_t)&aBlock, &qword_25738A618);
    a4(&aBlock);
  }
  else
  {
    if (a2 != (void *)1)
    {
      v30 = sub_2448E36D8;
      v31 = v15;
      aBlock = (void *)MEMORY[0x24BDAC760];
      v27 = 1107296256;
      v28 = sub_2447EB164;
      v29 = &block_descriptor_15;
      v21 = (uint64_t)_Block_copy(&aBlock);
      swift_retain();
      sub_24481240C(a2);
      sub_2448EA71C();
      v25 = MEMORY[0x24BEE4AF8];
      v20[1] = sub_2447EB5DC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25738B1E8);
      sub_2447EB714(qword_25738B1F0, &qword_25738B1E8, MEMORY[0x24BEE12C8]);
      sub_2448EB6C4();
      v19 = (const void *)v21;
      MEMORY[0x249519C08](0, v14, v12, v21);
      _Block_release(v19);
      sub_24481241C(a2);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v24);
      swift_release();
      swift_release();
      goto LABEL_7;
    }
    sub_244803860();
    v21 = sub_2448EB418();
    v30 = sub_2448E36D8;
    v31 = v15;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v27 = 1107296256;
    v28 = sub_2447EB164;
    v29 = &block_descriptor_15_1;
    v16 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    sub_2448EA71C();
    aBlock = (void *)MEMORY[0x24BEE4AF8];
    sub_2447EB5DC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25738B1E8);
    sub_2447EB714(qword_25738B1F0, &qword_25738B1E8, MEMORY[0x24BEE12C8]);
    sub_2448EB6C4();
    v17 = (void *)v21;
    MEMORY[0x249519C08](0, v14, v12, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v24);
  }
  swift_release();
LABEL_7:
  swift_release();
  sub_2448E3728(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2448E33E8);
  swift_release();
  return sub_2448E3728(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_2448E33E8);
}

uint64_t sub_2448E16C8(uint64_t a1, void *a2, uint64_t a3, void (*a4)(char *), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void *v45;
  uint64_t v46;
  void *aBlock;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  uint64_t (*v51)();
  uint64_t v52;

  v45 = a2;
  v43 = sub_2448EA704();
  v41 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v40 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_2448EA734();
  v39 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v38 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A590);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v37 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v37 - v18;
  sub_2447C9300(a1, (uint64_t)&v37 - v18, &qword_25738A590);
  sub_2447C9300((uint64_t)v19, (uint64_t)v17, &qword_25738A590);
  v44 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2447C9300((uint64_t)v19, (uint64_t)v44, &qword_25738A590);
  v20 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a4;
  *(_QWORD *)(v21 + 24) = a5;
  v22 = (uint64_t)v19;
  v23 = v45;
  sub_2447D3184(v22, v21 + v20, &qword_25738A590);
  aBlock = v23;
  v48 = a3;
  swift_retain_n();
  if ((ExecutionLane.isCurrentLane.getter() & 1) != 0)
  {
    a4(v17);
    swift_release();
    swift_release();
    v24 = (uint64_t)v44;
LABEL_7:
    v25 = (uint64_t)v17;
    goto LABEL_10;
  }
  if (!v23)
  {
    v24 = (uint64_t)v44;
    a4(v44);
    swift_release();
    swift_release();
    goto LABEL_7;
  }
  v37 = a5;
  v25 = (uint64_t)v17;
  if (v23 == (void *)1)
  {
    sub_244803860();
    v26 = (void *)sub_2448EB418();
    v51 = sub_2448E38E4;
    v52 = v21;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v48 = 1107296256;
    v49 = sub_2447EB164;
    v50 = &block_descriptor_30_1;
    v27 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v28 = v38;
    sub_2448EA71C();
    aBlock = (void *)MEMORY[0x24BEE4AF8];
    sub_2447EB5DC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25738B1E8);
    sub_2447EB714(qword_25738B1F0, &qword_25738B1E8, MEMORY[0x24BEE12C8]);
    v29 = v40;
    v30 = v43;
    sub_2448EB6C4();
    MEMORY[0x249519C08](0, v28, v29, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v42);
  }
  else
  {
    v51 = sub_2448E38E4;
    v52 = v21;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v48 = 1107296256;
    v49 = sub_2447EB164;
    v50 = &block_descriptor_27;
    v31 = _Block_copy(&aBlock);
    swift_retain();
    sub_24481240C(v23);
    v32 = v38;
    sub_2448EA71C();
    v46 = MEMORY[0x24BEE4AF8];
    sub_2447EB5DC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25738B1E8);
    v33 = v23;
    sub_2447EB714(qword_25738B1F0, &qword_25738B1E8, MEMORY[0x24BEE12C8]);
    v34 = v40;
    v35 = v43;
    sub_2448EB6C4();
    MEMORY[0x249519C08](0, v32, v34, v31);
    _Block_release(v31);
    sub_24481241C(v33);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v35);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v32, v42);
    swift_release();
  }
  swift_release();
  swift_release();
  v24 = (uint64_t)v44;
LABEL_10:
  sub_2447BD180(v24, &qword_25738A590);
  swift_release();
  return sub_2447BD180(v25, &qword_25738A590);
}

uint64_t sub_2448E1BB4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A580);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2447C9300((uint64_t)a1, (uint64_t)v10, &qword_25738A580);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_2447D3184((uint64_t)v10, a4, &qword_25738A590);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A590);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a4, 0, 1, v11);
  }
  else
  {
    sub_2447BD180((uint64_t)a1, &qword_25738A580);
    v13 = (_QWORD *)*v10;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a2;
    *(_QWORD *)(v14 + 24) = a3;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_2447C2AF0(0, v13[2] + 1, 1, v13);
    v16 = v13[2];
    v15 = v13[3];
    if (v16 >= v15 >> 1)
      v13 = sub_2447C2AF0((_QWORD *)(v15 > 1), v16 + 1, 1, v13);
    v13[2] = v16 + 1;
    v17 = &v13[2 * v16];
    v17[4] = sub_24481D1FC;
    v17[5] = v14;
    *a1 = v13;
    swift_storeEnumTagMultiPayload();
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A590);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a4, 1, 1, v18);
  }
}

double sub_2448E1D80@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2448E1DAC(a1, a2, a3, (uint64_t (*)(BOOL, unint64_t, uint64_t, _QWORD *))sub_2447C2AFC, (uint64_t)sub_2448E37B0, a4);
}

double sub_2448E1DAC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(BOOL, unint64_t, uint64_t, _QWORD *)@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  uint64_t v21;
  uint64_t (*v22)(BOOL, unint64_t, uint64_t, _QWORD *);
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;

  v8 = *(_QWORD **)a1;
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 16);
    v14 = *(_QWORD *)(a1 + 24);
    v15 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)a6 = v8;
    *(_QWORD *)(a6 + 8) = v15;
    *(_QWORD *)(a6 + 16) = v13;
    *(_QWORD *)(a6 + 24) = v14;
    *(_QWORD *)(a6 + 32) = v11;
    *(_QWORD *)(a6 + 40) = v12;
    *(_QWORD *)(a6 + 48) = v9;
    *(_WORD *)(a6 + 56) = v10 | (unsigned __int16)((unsigned __int16)(v10 >> 8) << 8);
    sub_2447D3128(v8, v15, v13, v14, v11, v12, v9, v10, SBYTE1(v10));
  }
  else
  {
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a2;
    *(_QWORD *)(v21 + 24) = a3;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = (_QWORD *)a4(0, v8[2] + 1, 1, v8);
    v22 = a4;
    v24 = v8[2];
    v23 = v8[3];
    if (v24 >= v23 >> 1)
      v8 = (_QWORD *)v22(v23 > 1, v24 + 1, 1, v8);
    v8[2] = v24 + 1;
    v25 = &v8[2 * v24];
    v25[4] = a5;
    v25[5] = v21;
    *(_QWORD *)a1 = v8;
    result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 65) = 0u;
    *(_OWORD *)a6 = 0u;
    *(_OWORD *)(a6 + 16) = 0u;
    *(_OWORD *)(a6 + 32) = 0u;
    *(_QWORD *)(a6 + 48) = 0;
    *(_WORD *)(a6 + 56) = -256;
  }
  return result;
}

double sub_2448E1F10@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2448E1F44(a1, a2, a3, (void (*)(uint64_t))sub_2447D3144, (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t))sub_2447C2B08, (uint64_t)sub_2448E37B0, a4);
}

double sub_2448E1F44@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X4>, uint64_t (*a5)(BOOL, unint64_t, uint64_t, uint64_t)@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  double result;
  uint64_t v23;
  uint64_t (*v24)(BOOL, unint64_t, uint64_t, uint64_t);
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v9 = *(_QWORD *)a1;
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 16);
    v15 = *(_QWORD *)(a1 + 24);
    v16 = *(_QWORD *)(a1 + 8);
    v17 = *(_QWORD *)(a1 + 56) | ((*(_QWORD *)(a1 + 56) >> 8) << 8);
    *(_QWORD *)a7 = v9;
    *(_QWORD *)(a7 + 8) = v16;
    *(_QWORD *)(a7 + 16) = v14;
    *(_QWORD *)(a7 + 24) = v15;
    *(_QWORD *)(a7 + 32) = v12;
    *(_QWORD *)(a7 + 40) = v13;
    *(_QWORD *)(a7 + 48) = v11;
    *(_WORD *)(a7 + 56) = v17;
    a4(v9);
  }
  else
  {
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = a2;
    *(_QWORD *)(v23 + 24) = a3;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = a5(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
    v24 = a5;
    v26 = *(_QWORD *)(v9 + 16);
    v25 = *(_QWORD *)(v9 + 24);
    if (v26 >= v25 >> 1)
      v9 = v24(v25 > 1, v26 + 1, 1, v9);
    *(_QWORD *)(v9 + 16) = v26 + 1;
    v27 = v9 + 16 * v26;
    *(_QWORD *)(v27 + 32) = a6;
    *(_QWORD *)(v27 + 40) = v23;
    *(_QWORD *)a1 = v9;
    result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 65) = 0u;
    *(_OWORD *)a7 = 0u;
    *(_OWORD *)(a7 + 16) = 0u;
    *(_OWORD *)(a7 + 32) = 0u;
    *(_QWORD *)(a7 + 48) = 0;
    *(_WORD *)(a7 + 56) = -256;
  }
  return result;
}

double sub_2448E20AC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2448E1DAC(a1, a2, a3, (uint64_t (*)(BOOL, unint64_t, uint64_t, _QWORD *))sub_2447C2F9C, (uint64_t)sub_2448E37B0, a4);
}

double sub_2448E20D8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_2448E1F44(a1, a2, a3, (void (*)(uint64_t))sub_2447D3164, (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t))sub_2447C2FA8, (uint64_t)sub_2448E37B0, a4);
}

uint64_t SingleFireEvent.future.getter()
{
  return swift_retain();
}

_QWORD *SingleFireEvent.init(description:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *result;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int16 v35;
  _QWORD v36[7];
  unsigned __int16 v37;
  __int128 v38;
  char v39;
  __int128 v40;
  const char *v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  char v45;
  __int128 v46;
  const char *v47;
  uint64_t v48;
  char v49;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257392280);
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE4AF8];
  v6 = sub_2447C8FF8(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257392288);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 32) = 0;
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v5;
  *(_QWORD *)(v4 + 16) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257392290);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 32) = 0;
  *(_QWORD *)(v8 + 16) = v4;
  *(_QWORD *)(v8 + 24) = v5;
  v3[2] = v8;
  *(_QWORD *)&v44 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFound"
                    "ation/SingleFireEvent.swift";
  *((_QWORD *)&v44 + 1) = 127;
  v45 = 2;
  v46 = xmmword_2448F8940;
  v47 = "init(description:)";
  v48 = 18;
  v49 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257392298);
  v9 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573922A0);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 76) = 0;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(_QWORD *)(v10 + 64) = 0;
  *(_WORD *)(v10 + 72) = -256;
  *(_QWORD *)(v9 + 104) = v10;
  v11 = sub_2447D1A60(&v44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573922A8);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v27 = v3;
  v3[3] = v12;
  *(_QWORD *)&v38 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFound"
                    "ation/SingleFireEvent.swift";
  *((_QWORD *)&v38 + 1) = 127;
  v39 = 2;
  v40 = xmmword_2448F8950;
  v41 = "init(description:)";
  v42 = 18;
  v43 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573922B0);
  swift_allocObject();
  swift_retain_n();
  swift_retain();
  v13 = sub_2447D1A60(&v38);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = sub_2448E32FC;
  v14[5] = v13;
  v15 = *(os_unfair_lock_s **)(v11 + 88);
  swift_retain_n();
  swift_retain();
  os_unfair_lock_lock(v15 + 25);
  sub_2448E1F44((uint64_t)&v15[4], (uint64_t)sub_2448E3360, (uint64_t)v14, (void (*)(uint64_t))sub_2447D31C8, (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t))sub_2447C2334, (uint64_t)sub_2448E37B0, (uint64_t)&v28);
  os_unfair_lock_unlock(v15 + 25);
  swift_release();
  v16 = v35;
  if (HIBYTE(v35) <= 0xFEu)
  {
    v18 = v33;
    v17 = v34;
    v20 = v31;
    v19 = v32;
    v22 = v29;
    v21 = v30;
    v23 = v28;
    v36[0] = v28;
    v36[1] = v29;
    v36[2] = v30;
    v36[3] = v31;
    v36[4] = v32;
    v36[5] = v33;
    v36[6] = v34;
    v37 = v35;
    swift_retain();
    sub_2447EB754(v23, v22, v21, v20, v19, v18, v17, v16);
    sub_2447D1F5C((uint64_t)v36);
    sub_2448E33B8(v23, v22, v21, v20, v19, v18, v17, v16);
    swift_release();
    sub_2448E33B8(v23, v22, v21, v20, v19, v18, v17, v16);
  }
  swift_release();
  swift_release();
  swift_release_n();
  swift_release();
  swift_release();
  result = v27;
  v27[4] = a1;
  v27[5] = a2;
  v27[6] = v13;
  return result;
}

uint64_t SingleFireEvent.deinit()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v4[2];
  char v5;
  __int128 v6;
  const char *v7;
  uint64_t v8;
  char v9;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2448B02F8((unint64_t *)(v1 + 16), v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  v2 = v4[0];
  swift_release();
  if (v2 >= 2)
  {
    swift_release();
    swift_bridgeObjectRelease();
    v4[0] = (unint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/Pre"
                              "viewsFoundation/SingleFireEvent.swift";
    v4[1] = 127;
    v5 = 2;
    v6 = xmmword_2448F8960;
    v7 = "deinit";
    v8 = 6;
    v9 = 2;
    sub_244823F6C();
  }
  else
  {
    sub_2448B0808(v2);
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t SingleFireEvent.__deallocating_deinit()
{
  SingleFireEvent.deinit();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall SingleFireEvent.fire()()
{
  uint64_t v0;

  sub_2448E0C30(v0);
}

unint64_t *sub_2448E25D8@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t *v5;

  v3 = *result;
  if (*result >= 2)
  {
    v5 = result;
    v4 = result[1];
    swift_retain();
    swift_bridgeObjectRetain();
    result = (unint64_t *)sub_2448B0808(v3);
    *v5 = 0;
    v5[1] = 0;
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  *a2 = v3;
  a2[1] = v4;
  return result;
}

uint64_t sub_2448E2650(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _OWORD v4[4];

  v1 = *(_QWORD *)(a1 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_24481308C((_QWORD *)(v1 + 16), v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  swift_release();
  sub_2448A9A50((uint64_t)sub_2448E3A30, (uint64_t)&v3, *(uint64_t *)&v4[0], *((uint64_t *)&v4[0] + 1));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memset(v4, 0, 58);
  return sub_2447E9DDC((uint64_t)v4);
}

Swift::Void __swiftcall SingleFireEvent.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  char v10;
  __int128 v11;
  const char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15[2];
  char v16;
  __int128 v17;
  const char *v18;
  uint64_t v19;
  char v20;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2448E2914((unint64_t *)(v1 + 16), (unint64_t *)v15);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  v2 = v15[0];
  swift_release();
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
    if (v3)
    {
      v15[0] = (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsF"
                        "oundation/SingleFireEvent.swift";
      v15[1] = 127;
      v16 = 2;
      v17 = xmmword_2448F8970;
      v18 = "cancel()";
      v19 = 8;
      v20 = 2;
      swift_bridgeObjectRetain();
      v4 = (uint64_t *)(v2 + 48);
      do
      {
        v5 = (void (*)(uint64_t))*(v4 - 2);
        v6 = *v4;
        v7 = *(_QWORD *)(*v4 + 144);
        swift_retain();
        swift_retain();
        swift_retain();
        os_unfair_lock_lock((os_unfair_lock_t)(v7 + 76));
        sub_2447E5E3C((__int128 *)(v7 + 16), (uint64_t (*)(void))nullsub_1, v15, v6, (void (*)(uint64_t, _QWORD *))sub_2447E1AC8, &v9);
        os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 76));
        v8 = swift_release();
        if ((v9 & 1) == 0)
          v5(v8);
        swift_release();
        swift_release();
        v4 += 3;
        --v3;
      }
      while (v3);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&v9 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFounda"
                   "tion/SingleFireEvent.swift";
  *((_QWORD *)&v9 + 1) = 127;
  v10 = 2;
  v11 = xmmword_2448F8980;
  v12 = "cancel()";
  v13 = 8;
  v14 = 2;
  sub_2448E05E4(&v9, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, __int128 *))sub_2447EB27C, &qword_25738A618, (uint64_t (*)(uint64_t *))sub_2447D1F5C);
}

unint64_t *sub_2448E2914@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t *v5;

  v3 = *result;
  if (*result >= 2)
  {
    v5 = result;
    v4 = result[1];
    swift_retain();
    swift_bridgeObjectRetain();
    sub_2448B0808(v3);
    result = (unint64_t *)swift_release();
    *(_OWORD *)v5 = xmmword_2448ECE80;
  }
  else
  {
    v4 = 0;
  }
  *a2 = v4;
  return result;
}

double sub_2448E2998@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  double result;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  __int128 v14;
  const char *v15;
  uint64_t v16;
  char v17;

  if (*a1)
  {
    if (*a1 == 1)
    {
      *(_QWORD *)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
      *(_BYTE *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 16) = 0;
    }
    else
    {
      swift_retain();
      v7 = swift_allocObject();
      *(_QWORD *)(v7 + 16) = a2;
      *(_QWORD *)(v7 + 24) = a3;
      *(_QWORD *)&v12 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsF"
                        "oundation/SingleFireEvent.swift";
      *((_QWORD *)&v12 + 1) = 127;
      v13 = 2;
      v14 = xmmword_2448F8990;
      v15 = "observe(_:)";
      v16 = 11;
      v17 = 2;
      swift_retain();
      swift_retain();
      sub_2448E0710(&v12, (uint64_t)sub_24481D1FC, v7, (uint64_t (**)())&v10);
      swift_release_n();
      swift_release();
      v8 = v11;
      result = *(double *)&v10;
      *(_OWORD *)a4 = v10;
      *(_QWORD *)(a4 + 16) = v8;
      *(_BYTE *)(a4 + 24) = 0;
    }
  }
  else
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
    *(_BYTE *)(a4 + 24) = 1;
  }
  return result;
}

uint64_t sub_2448E2ABC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v6;
  char v7;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;

  v6 = *(_QWORD *)result;
  if (*(_QWORD *)result >= 2uLL)
  {
    v10 = (_QWORD *)result;
    v11 = *(_QWORD **)(result + 8);
    swift_retain();
    swift_retain();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_2447C2210(0, v11[2] + 1, 1, v11);
      v11 = (_QWORD *)result;
    }
    v13 = v11[2];
    v12 = v11[3];
    if (v13 >= v12 >> 1)
    {
      result = (uint64_t)sub_2447C2210((_QWORD *)(v12 > 1), v13 + 1, 1, v11);
      v11 = (_QWORD *)result;
    }
    v11[2] = v13 + 1;
    v14 = &v11[3 * v13];
    v14[4] = a2;
    v14[5] = a3;
    v14[6] = a4;
    *v10 = v6;
    v10[1] = v11;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  *a5 = v7;
  return result;
}

Swift::Void __swiftcall ObjcSingleFireEvent.fire()()
{
  uint64_t v0;

  sub_2448E0C30(*(_QWORD *)(v0 + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event));
}

Swift::Void __swiftcall ObjcSingleFireEvent.cancel()()
{
  SingleFireEvent.cancel()();
}

uint64_t ObjcSingleFireEvent.addObserver(_:)(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v5 = *(_QWORD *)(*(_QWORD *)(v2 + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event) + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
  sub_2448E2998((_QWORD *)(v5 + 16), (uint64_t)a1, a2, (uint64_t)&v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
  result = swift_release();
  v7 = v8;
  if (v8)
  {
    sub_2448E1168((uint64_t)&v8);
    return sub_2447C6AE8(v7);
  }
  else if (v9)
  {
    return a1(result);
  }
  return result;
}

BOOL ObjcSingleFireEvent.hasFired.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v4;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event) + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 32));
  sub_2448B02F8((unint64_t *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 32));
  v2 = v4;
  swift_release();
  sub_2448B0808(v2);
  return v2 == 0;
}

id ObjcSingleFireEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ObjcSingleFireEvent.init()()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_super v7;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event;
  type metadata accessor for SingleFireEvent();
  v4 = swift_allocObject();
  v5 = v1;
  SingleFireEvent.init(description:)(0, 0);
  *(_QWORD *)&v1[v3] = v4;

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id ObjcSingleFireEvent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *sub_2448E30CC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v5 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  v11 = *(unsigned __int8 *)(a2 + 56);
  v12 = *(unsigned __int8 *)(a2 + 57);
  v13 = *((unsigned __int16 *)result + 28);
  v14 = v13 >> 8;
  if (v13 >> 8 < 0xFF)
  {
    if (v14 != 2 && v12 != 2)
    {
      v16 = (void *)*result;
      v25 = (void *)result[1];
      v23 = result[3];
      v24 = result[2];
      v21 = result[5];
      v22 = result[4];
      v20 = result[6];
      v19 = *(unsigned __int8 *)(a2 + 56);
      v17 = *(_QWORD *)(a2 + 40);
      v18 = *(_QWORD *)(a2 + 48);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573923A0);
      sub_2447EB714(qword_2573923A8, &qword_2573923A0, (uint64_t)&unk_2448EE5B8);
      swift_allocError();
      *(_QWORD *)v15 = v16;
      *(_QWORD *)(v15 + 8) = v25;
      *(_QWORD *)(v15 + 16) = v24;
      *(_QWORD *)(v15 + 24) = v23;
      *(_QWORD *)(v15 + 32) = v22;
      *(_QWORD *)(v15 + 40) = v21;
      *(_QWORD *)(v15 + 48) = v20;
      *(_WORD *)(v15 + 56) = v13;
      *(_QWORD *)(v15 + 64) = v5;
      *(_QWORD *)(v15 + 72) = v4;
      *(_QWORD *)(v15 + 80) = v7;
      *(_QWORD *)(v15 + 88) = v6;
      *(_QWORD *)(v15 + 96) = v9;
      *(_QWORD *)(v15 + 104) = v17;
      *(_QWORD *)(v15 + 112) = v18;
      *(_BYTE *)(v15 + 120) = v19;
      *(_BYTE *)(v15 + 121) = v12;
      sub_2447D3164(v5, v4, v7, v6, v9, v17, v18, v19, v12);
      sub_2448E3964(v16, v25, v24, v23, v22, v21, v20, v13);
      return (_QWORD *)swift_willThrow();
    }
  }
  else
  {
    *result = v5;
    result[1] = v4;
    result[2] = v7;
    result[3] = v6;
    result[4] = v9;
    result[5] = v8;
    result[6] = v10;
    *((_WORD *)result + 28) = v11 | ((_WORD)v12 << 8);
    result = sub_2447D3164(v5, v4, v7, v6, v9, v8, v10, v11, v12);
  }
  *a3 = v14 > 0xFE;
  return result;
}

uint64_t sub_2448E32B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a3;
  v5 = a3[1];
  swift_retain();
  v6 = sub_2447F64C0(v4, v5, a2);
  sub_2447C8F84(v6);
  return swift_release();
}

uint64_t sub_2448E32FC(uint64_t a1)
{
  _BYTE v2[64];

  sub_2447D3184(a1, (uint64_t)v2, &qword_25738A618);
  return sub_2447D1F5C((uint64_t)v2);
}

uint64_t sub_2448E332C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  if ((unint64_t)v1 >= 2)

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448E3360(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(void **);
  _BYTE v7[64];

  v2 = (void *)v1[2];
  v3 = v1[3];
  v5 = (void (*)(void **))v1[4];
  v4 = v1[5];
  sub_2447D3184(a1, (uint64_t)v7, &qword_25738A618);
  return sub_2448E12A0((uint64_t)v7, v2, v3, v5, v4);
}

void sub_2448E33B8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (BYTE1(a8) != 255)
    sub_2448E33E8(a1, a2, a3, a4, a5, a6, a7, a8, SBYTE1(a8));
}

void sub_2448E33E8(id a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a9 == 1)

}

uint64_t type metadata accessor for SingleFireEvent()
{
  return objc_opt_self();
}

uint64_t method lookup function for SingleFireEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SingleFireEvent.__allocating_init(description:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for ObjcSingleFireEvent()
{
  return objc_opt_self();
}

unint64_t destroy for SingleFireEvent.State(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s20PreviewsFoundationOS15SingleFireEventC5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t *assignWithCopy for SingleFireEvent.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *a1;
  v5 = *a2;
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = v5;
      a1[1] = a2[1];
      swift_retain();
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = v5;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for SingleFireEvent.State(_QWORD *a1, uint64_t a2)
{
  if (*a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *(_QWORD *)a2;
  swift_release();
  a1[1] = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SingleFireEvent.State()
{
  return &type metadata for SingleFireEvent.State;
}

uint64_t sub_2448E3620()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2448E3644()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_2448E3650(uint64_t (**a1)(void))
{
  return sub_2448AAB1C(a1);
}

uint64_t sub_2448E3658(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2448E3684()
{
  uint64_t v0;

  return sub_2448E2650(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2448E368C()
{
  uint64_t v0;

  swift_release();
  sub_2448E33E8(*(id *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(unsigned __int8 *)(v0 + 88), *(_BYTE *)(v0 + 89));
  return swift_deallocObject();
}

uint64_t sub_2448E36D8()
{
  uint64_t v0;
  uint64_t (*v1)(_OWORD *);
  uint64_t v2;
  __int16 v3;
  __int128 v4;
  _OWORD v6[3];
  uint64_t v7;
  __int16 v8;

  v1 = *(uint64_t (**)(_OWORD *))(v0 + 16);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_WORD *)(v0 + 88);
  v4 = *(_OWORD *)(v0 + 48);
  v6[0] = *(_OWORD *)(v0 + 32);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(v0 + 64);
  v7 = v2;
  v8 = v3;
  return v1(v6);
}

uint64_t sub_2448E3728(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 57);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v4);
  return a1;
}

uint64_t block_copy_helper_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_15()
{
  return swift_release();
}

uint64_t sub_2448E378C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448E37B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25738A590) - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  swift_release();
  v3 = (id *)(v0 + v2);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {

  }
  else if (!EnumCaseMultiPayload)
  {
    v5 = sub_2448EA548();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + v2, v5);
    v6 = type metadata accessor for CrashReport(0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v7 = (char *)v3 + *(int *)(v6 + 32);
    v8 = sub_2448EA500();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t sub_2448E38E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25738A590) - 8) + 80);
  return sub_2448B1F24(*(uint64_t (**)(uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_2448E3918(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_OWORD *);
  uint64_t v3;
  __int16 v4;
  __int128 v5;
  _OWORD v7[3];
  uint64_t v8;
  __int16 v9;

  v2 = *(uint64_t (**)(_OWORD *))(v1 + 16);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_WORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  return v2(v7);
}

id sub_2448E3964(id result, void *a2, int a3, int a4, int a5, int a6, int a7, __int16 a8)
{
  if (HIBYTE(a8) != 255)
    return sub_2447D3164(result, a2, a3, a4, a5, a6, a7, a8, SHIBYTE(a8));
  return result;
}

uint64_t sub_2448E3994(void (*a1)(os_unfair_lock_s *), uint64_t a2)
{
  uint64_t v2;

  return sub_2448E0918(a1, a2, v2);
}

uint64_t sub_2448E399C(uint64_t a1)
{
  uint64_t v1;

  return sub_2448E32B0(a1, *(_QWORD *)(v1 + 16), *(uint64_t **)(v1 + 24));
}

uint64_t sub_2448E39A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448E39C8()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t (*)(), _QWORD *);
  _QWORD v3[4];

  v1 = *(uint64_t (**)(uint64_t (*)(), _QWORD *))(v0 + 16);
  v3[2] = *(_QWORD *)(v0 + 32);
  return v1(sub_2448E3A08, v3);
}

uint64_t sub_2448E3A08()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2447F6784(*(_QWORD *)(v0 + 16));
  return sub_2447C8F84(v1);
}

uint64_t CancelationToken.cancel(dsoHandle:file:line:column:function:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  char v14;
  uint64_t v15[2];
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v15[0] = a2;
  v15[1] = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v11 = *(_QWORD *)(v10 + *(int *)(a10 + 36));
  v12 = *(_QWORD *)(v11 + 144);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v12 + 76));
  sub_2447E5E3C((__int128 *)(v12 + 16), (uint64_t (*)(void))nullsub_1, v15, v11, (void (*)(uint64_t, _QWORD *))sub_2447E1AC8, &v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 76));
  result = swift_release();
  if ((v14 & 1) == 0)
    return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a10 + 24) + 8))(*(_QWORD *)(a10 + 16));
  return result;
}

__n128 CancelationToken<>.init(dsoHandle:file:line:column:function:on:_:)@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, __n128 *a8@<X8>, char a9, __n128 a10, unint64_t a11, unint64_t a12)
{
  uint64_t v13;
  __n128 result;
  __int128 v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  *(_QWORD *)&v15 = a1;
  *((_QWORD *)&v15 + 1) = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738AF78);
  swift_allocObject();
  v13 = sub_2447E5D90(&v15, 0, 0, 1, 0, 0xD000000000000011, 0x80000002448F9A50, 0x64656C65636E6163, 0xE800000000000000);
  result = a10;
  *a8 = a10;
  a8[1].n128_u64[0] = a11;
  a8[1].n128_u64[1] = a12;
  a8[2].n128_u64[0] = v13;
  return result;
}

uint64_t CancelationToken<>.init(dsoHandle:file:line:column:function:_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, _QWORD *a8@<X8>, char a9, uint64_t a10, uint64_t a11)
{
  uint64_t result;
  __int128 v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  *(_QWORD *)&v13 = a1;
  *((_QWORD *)&v13 + 1) = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738AF78);
  swift_allocObject();
  result = sub_2447E5D90(&v13, 0, 0, 1, 0, 0xD000000000000011, 0x80000002448F9A50, 0x64656C65636E6163, 0xE800000000000000);
  *a8 = a10;
  a8[1] = a11;
  a8[2] = result;
  return result;
}

Swift::Void __swiftcall IsolatedTokenCallback.invoke()()
{
  _QWORD *v0;
  void (*v1)(void);

  v1 = (void (*)(void))v0[2];
  if (*v0)
  {
    swift_getObjectType();
    Actor.verifyIsolated(_:file:line:)();
  }
  v1();
}

uint64_t sub_2448E3D28()
{
  _QWORD *v0;
  uint64_t (*v1)(void);

  v1 = (uint64_t (*)(void))v0[2];
  if (*v0)
  {
    swift_getObjectType();
    Actor.verifyIsolated(_:file:line:)();
  }
  return v1();
}

Swift::Void __swiftcall ConcurrentTokenCallback.invoke()()
{
  void (**v0)(void);

  (*v0)();
}

uint64_t sub_2448E3DB8()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t Actor.wrap(token:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t (*v13)();
  uint64_t v14;
  __int128 v16;
  char v17;
  __int128 v18;
  const char *v19;
  uint64_t v20;
  char v21;
  _OWORD v22[2];
  uint64_t v23;

  v5 = v4;
  v10 = *(_OWORD *)(a1 + 16);
  v22[0] = *(_OWORD *)a1;
  v22[1] = v10;
  v23 = *(_QWORD *)(a1 + 32);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  *(_QWORD *)(v11 + 32) = v5;
  v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v11 + 40) = *(_OWORD *)a1;
  *(_OWORD *)(v11 + 56) = v12;
  *(_QWORD *)(v11 + 72) = *(_QWORD *)(a1 + 32);
  v13 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v13 + 2) = a2;
  *((_QWORD *)v13 + 3) = a3;
  *((_QWORD *)v13 + 4) = sub_2448E4250;
  *((_QWORD *)v13 + 5) = v11;
  *((_QWORD *)v13 + 6) = v5;
  *(_QWORD *)&v16 = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFound"
                    "ation/CancelationToken.swift";
  *((_QWORD *)&v16 + 1) = 128;
  v17 = 2;
  v18 = xmmword_2448F8A40;
  v19 = "wrap(token:)";
  v20 = 12;
  v21 = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25738AF78);
  swift_allocObject();
  v14 = sub_2447E5D90(&v16, 0, 0, 1, 0, 0xD000000000000011, 0x80000002448F9A50, 0x64656C65636E6163, 0xE800000000000000);
  *a4 = sub_2448E428C;
  a4[1] = v13;
  a4[2] = (uint64_t (*)())v14;
  swift_unknownObjectRetain_n();
  return sub_2448908AC((uint64_t)v22);
}

uint64_t sub_2448E3F4C()
{
  Actor.verifyIsolated(_:file:line:)();
  return sub_2448E490C((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/CancelationToken.swift", 128, 2, 118, 25, (uint64_t)"wrap(token:)", 12, 2);
}

uint64_t sub_2448E3FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25738A208);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2448EAF74();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a4;
  v14[5] = a5;
  v14[6] = a1;
  v14[7] = a2;
  v14[8] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  sub_2447C5CB8((uint64_t)v12, (uint64_t)&unk_257392438, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_2448E40BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_2448EAF14();
  return swift_task_switch();
}

uint64_t sub_2448E4110()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t *Actor.wrap(token:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v5 = result[2];
  if (v5)
  {
    v9 = result[3];
    v8 = result[4];
    v11 = *result;
    v10 = result[1];
    swift_unknownObjectRetain();
    swift_retain();
    swift_retain();
    v12[0] = v11;
    v12[1] = v10;
    v12[2] = v5;
    v12[3] = v9;
    v12[4] = v8;
    Actor.wrap(token:)((uint64_t)v12, a2, a3, (uint64_t (**)())a4);
    return (uint64_t *)sub_244880734(v11, v10, v5);
  }
  else
  {
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
  }
  return result;
}

uint64_t sub_2448E4214()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448E4250()
{
  return sub_2448E3F4C();
}

uint64_t sub_2448E4260()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2448E428C()
{
  uint64_t *v0;

  return sub_2448E3FC8(v0[4], v0[5], v0[6], v0[2], v0[3]);
}

uint64_t dispatch thunk of CancelationTokenCallback.invoke()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2448E42A4()
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

uint64_t *sub_2448E431C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  swift_retain();
  return v4;
}

uint64_t sub_2448E43CC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_2448E440C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  return a1;
}

uint64_t sub_2448E446C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_2448E44D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2448E4534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_2448E4598(uint64_t a1, unsigned int a2, uint64_t a3)
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
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
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
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
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
    return ((uint64_t (*)(void))((char *)&loc_2448E4614 + 4 * byte_2448F8A50[v10]))();
  }
}

void sub_2448E4698(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
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
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_2448E478C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x2448E4800);
}

void sub_2448E4794(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x2448E479CLL);
  JUMPOUT(0x2448E4800);
}

void sub_2448E47DC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x2448E4800);
}

void sub_2448E47E4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x2448E4800);
}

uint64_t sub_2448E47EC(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x2448E4800);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x2448E47FCLL);
    JUMPOUT(0x2448E47F8);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t type metadata accessor for CancelationToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CancelationToken);
}

ValueMetadata *type metadata accessor for IsolatedTokenCallback()
{
  return &type metadata for IsolatedTokenCallback;
}

ValueMetadata *type metadata accessor for ConcurrentTokenCallback()
{
  return &type metadata for ConcurrentTokenCallback;
}

uint64_t sub_2448E4844()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2448E4878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 64);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_2447C62E8;
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  sub_2448EAF14();
  return swift_task_switch();
}

uint64_t sub_2448E490C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  __int128 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[16];
  uint64_t v17[2];
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v17[0] = a1;
  v17[1] = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v9 = *((_QWORD *)v8 + 4);
  v10 = *(_QWORD *)(v9 + 144);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v10 + 76));
  sub_2447E5E3C((__int128 *)(v10 + 16), (uint64_t (*)(void))nullsub_1, v17, v9, (void (*)(uint64_t, _QWORD *))sub_2447E1AC8, &v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 76));
  result = swift_release();
  if ((v14 & 1) == 0)
  {
    v12 = v8[1];
    v14 = *v8;
    v15 = v12;
    sub_2448E4A20((uint64_t)&v14, (uint64_t)v16);
    v13 = sub_2448E4A20((uint64_t)v16, (uint64_t)&v24);
    if (v24)
    {
      swift_getObjectType();
      v13 = Actor.verifyIsolated(_:file:line:)();
    }
    return ((uint64_t (*)(uint64_t))v15)(v13);
  }
  return result;
}

uint64_t sub_2448E4A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_257392440);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2448E4A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15[2];
  char v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  v14 = *(_OWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_BYTE *)(a1 + 56);
  type metadata accessor for ZipFuture(0, *(_QWORD *)(*(_QWORD *)a2 + 80), *(_QWORD *)(*(_QWORD *)a3 + 80), a4);
  v15[0] = v6;
  v15[1] = v7;
  v16 = v8;
  v17 = v14;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  swift_allocObject();
  swift_retain();
  swift_retain();
  return sub_2448E5608(v15, a2, a3, v12);
}

uint64_t sub_2448E4B24(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  swift_allocObject();
  return sub_2448E5608(a1, a2, a3, v6);
}

uint64_t static Future<A>.zip<A, B>(dsoHandle:file:line:column:function:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11)
{
  _QWORD v12[2];
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v12[0] = a2;
  v12[1] = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  return sub_2448E4A68((uint64_t)v12, a10, a11, a4);
}

uint64_t static Future<A>.zip<A, B, C>(dsoHandle:file:line:column:function:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t *a10, uint64_t *a11, uint64_t *a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t TupleTypeMetadata3;
  void *v23;
  uint64_t v24;
  __int128 v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v12 = *a10;
  v13 = *a11;
  v14 = *a12;
  *(_QWORD *)&v33 = a2;
  *((_QWORD *)&v33 + 1) = a3;
  v34 = a4;
  v35 = a5;
  v36 = a6;
  v37 = a7;
  v38 = a8;
  v39 = a9;
  *(_QWORD *)&v26 = a2;
  *((_QWORD *)&v26 + 1) = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a9;
  v15 = sub_2448E4A68((uint64_t)&v26, (uint64_t)a10, (uint64_t)a11, a4);
  sub_2448E4A68((uint64_t)&v33, v15, (uint64_t)a12, v16);
  swift_release();
  v17 = (_QWORD *)swift_allocObject();
  v18 = *(_QWORD *)(v12 + 80);
  v17[2] = v18;
  v19 = *(_QWORD *)(v13 + 80);
  v17[3] = v19;
  v20 = *(_QWORD *)(v14 + 80);
  v17[4] = v20;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = v18;
  v21[3] = v19;
  v21[4] = v20;
  v21[5] = sub_2448E4EF8;
  v21[6] = v17;
  swift_getTupleTypeMetadata2();
  swift_getTupleTypeMetadata2();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  sub_244836CF8(&v33);
  v23 = (void *)v33;
  v26 = v33;
  v24 = sub_24487B270((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/ZipFuture.swift", 121, 2, 77, 25, (uint64_t)"zip(dsoHandle:file:line:column:function:_:_:_:)", 47, 2, &v26, (uint64_t)sub_2448E501C, (uint64_t)v21, TupleTypeMetadata3);
  swift_release();
  swift_release();
  sub_24481241C(v23);
  return v24;
}

uint64_t sub_2448E4D8C(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  void (*v25)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v29 = a3;
  v30 = a6;
  v27 = a1;
  v28 = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v14 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v27 - v18;
  v20 = (char *)&v27 + *(int *)(v17 + 48) - v18;
  v21 = *(_QWORD *)(a7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))((char *)&v27 - v18, a4, a7);
  v22 = *(_QWORD *)(a8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v20, a5, a8);
  v23 = &v16[*(int *)(TupleTypeMetadata2 + 48)];
  v24 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
  v24(v16, v19, a7);
  v25 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v25(v23, v20, a8);
  v24(v27, v16, a7);
  v25(v28, v23, a8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a9 - 8) + 16))(v29, v30, a9);
}

uint64_t sub_2448E4EE8()
{
  return swift_deallocObject();
}

uint64_t sub_2448E4EF8(char *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;

  return sub_2448E4D8C(a1, a2, a3, a4, a5, a6, v6[2], v6[3], v6[4]);
}

uint64_t sub_2448E4F20@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata3;

  v6 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  v7 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  return a2(a3, a3 + *(int *)(TupleTypeMetadata3 + 48), a3 + *(int *)(TupleTypeMetadata3 + 64), a1, v6, v7);
}

uint64_t sub_2448E4FF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448E501C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2448E4F20(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 40), a2);
}

uint64_t static Future<A>.zip<A, B, C, D>(dsoHandle:file:line:column:function:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t *a10, uint64_t *a11, uint64_t *a12, uint64_t *a13)
{
  char v17;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t TupleTypeMetadata;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;

  v17 = a4;
  v34 = *a10;
  v35 = *a11;
  v36 = *a12;
  v37 = *a13;
  *(_QWORD *)&v45 = a2;
  *((_QWORD *)&v45 + 1) = a3;
  LOBYTE(v46) = a4;
  v47 = a5;
  v48 = a6;
  v49 = a7;
  v50 = a8;
  v51 = a9;
  *(_QWORD *)&v38 = a2;
  *((_QWORD *)&v38 + 1) = a3;
  v39 = a4;
  v40 = a5;
  v41 = a6;
  v42 = a7;
  v43 = a8;
  v44 = a9;
  v20 = sub_2448E4A68((uint64_t)&v38, (uint64_t)a10, (uint64_t)a11, a4);
  *(_QWORD *)&v38 = a2;
  *((_QWORD *)&v38 + 1) = a3;
  v39 = v17;
  v40 = a5;
  v41 = a6;
  v42 = a7;
  v43 = a8;
  v44 = a9;
  v22 = sub_2448E4A68((uint64_t)&v38, (uint64_t)a12, (uint64_t)a13, v21);
  sub_2448E4A68((uint64_t)&v45, v20, v22, v23);
  swift_release();
  swift_release();
  v24 = (_QWORD *)swift_allocObject();
  v25 = *(_QWORD *)(v34 + 80);
  v24[2] = v25;
  v26 = *(_QWORD *)(v35 + 80);
  v24[3] = v26;
  v27 = *(_QWORD *)(v36 + 80);
  v24[4] = v27;
  v28 = *(_QWORD *)(v37 + 80);
  v24[5] = v28;
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = v25;
  v29[3] = v26;
  v29[4] = v27;
  v29[5] = v28;
  v29[6] = sub_2448E64C0;
  v29[7] = v24;
  swift_getTupleTypeMetadata2();
  swift_getTupleTypeMetadata2();
  swift_getTupleTypeMetadata2();
  *(_QWORD *)&v45 = v25;
  *((_QWORD *)&v45 + 1) = v26;
  v46 = v27;
  v47 = v28;
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  sub_244836CF8(&v45);
  v31 = (void *)v45;
  v38 = v45;
  v32 = sub_24487B270((uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/ZipFuture.swift", 121, 2, 105, 25, (uint64_t)"zip(dsoHandle:file:line:column:function:_:_:_:_:)", 49, 2, &v38, (uint64_t)sub_2448E6510, (uint64_t)v29, TupleTypeMetadata);
  swift_release();
  swift_release();
  sub_24481241C(v31);
  return v32;
}

uint64_t sub_2448E5298(char *a1, char *a2, char *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, char *, uint64_t);
  char *v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;

  v50 = a7;
  v51 = a8;
  v55 = a3;
  v56 = a4;
  v53 = a1;
  v54 = a2;
  v57 = a11;
  v48 = a12;
  v49 = a6;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v47 = TupleTypeMetadata2;
  v14 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v52 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v44 - v16;
  v18 = swift_getTupleTypeMetadata2();
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v44 - v23;
  v45 = (char *)&v44 + *(int *)(v22 + 48) - v23;
  v25 = v45;
  v26 = *(_QWORD *)(a9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))((char *)&v44 - v23, a5, a9);
  v27 = *(_QWORD *)(a10 - 8);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v25, v49, a10);
  v28 = *(int *)(TupleTypeMetadata2 + 48);
  v29 = v17;
  v46 = v17;
  v30 = &v17[v28];
  v49 = &v17[v28];
  v31 = *(_QWORD *)(v57 - 8);
  (*(void (**)(char *, uint64_t))(v31 + 16))(v29, v50);
  v32 = *(_QWORD *)(v48 - 8);
  v33 = v30;
  v34 = v48;
  (*(void (**)(char *, uint64_t))(v32 + 16))(v33, v51);
  v35 = &v21[*(int *)(v18 + 48)];
  v36 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  v36(v21, v24, a9);
  v37 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
  v37(v35, v45, a10);
  v36(v53, v21, a9);
  v37(v54, v35, a10);
  v38 = v52;
  v39 = &v52[*(int *)(v47 + 48)];
  v40 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
  v41 = v57;
  v40(v52, v46, v57);
  v42 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
  v42(v39, v49, v34);
  v40(v55, v38, v41);
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v42)(v56, v39, v34);
}

uint64_t sub_2448E54EC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t TupleTypeMetadata2;
  uint64_t v7;
  uint64_t v8;
  int *TupleTypeMetadata;

  v5 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v7 = a1 + *(int *)(swift_getTupleTypeMetadata2() + 48);
  v8 = v7 + *(int *)(TupleTypeMetadata2 + 48);
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  return a2(a3, a3 + TupleTypeMetadata[12], a3 + TupleTypeMetadata[16], a3 + TupleTypeMetadata[20], a1, v5, v7, v8);
}

uint64_t sub_2448E5608(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  _QWORD v27[2];
  char v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v8 = type metadata accessor for ZipFuture.Activity(0, *(_QWORD *)(*v4 + 200), *(_QWORD *)(*v4 + 208), a4);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - v10;
  v12 = *a1;
  v13 = a1[1];
  v14 = *((_BYTE *)a1 + 16);
  v26 = *(_OWORD *)(a1 + 3);
  v15 = a1[5];
  v24 = a1[6];
  v25 = v15;
  v23 = *((unsigned __int8 *)a1 + 56);
  v4[14] = a2;
  v4[15] = a3;
  swift_storeEnumTagMultiPayload();
  swift_retain();
  swift_retain();
  swift_retain();
  v16 = sub_24481320C(v11, v8);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v4[13] = v16;
  swift_release();
  v27[0] = v12;
  v27[1] = v13;
  v28 = v14;
  v29 = v26;
  v30 = v25;
  v31 = v24;
  v32 = v23;
  v20 = sub_2448D24B4((uint64_t)v27, v17, v18, v19);
  swift_retain_n();
  Future.observeSuccess(_:)((uint64_t)sub_2448E7A5C, v20);
  swift_release();
  swift_retain();
  Future.observeSuccess(_:)((uint64_t)sub_2448E7A18, v20);
  swift_release();
  swift_retain();
  Future.observeFailure(_:)((uint64_t)sub_2448E7A14, v20);
  swift_release();
  swift_retain();
  Future.observeFailure(_:)((uint64_t)sub_2448E7AA0, v20);
  swift_release();
  swift_retain();
  Future.observeCancelation(_:)((uint64_t)sub_2448E79FC, v20);
  swift_release();
  swift_retain();
  Future.observeCancelation(_:)((uint64_t)sub_2448E79FC, v20);
  swift_release_n();
  swift_release();
  swift_release();
  return v20;
}

uint64_t sub_2448E582C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t TupleTypeMetadata2;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49[16];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v46 = a4;
  v47 = a2;
  v48 = a3;
  v45 = a1;
  v6 = *(_QWORD *)(*v4 + 200);
  v5 = *(_QWORD *)(*v4 + 208);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v10 = type metadata accessor for FutureTermination(0, TupleTypeMetadata2, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  v43 = v10;
  v44 = v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v42 = (char *)&v39 - v13;
  v14 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v41 = (char *)&v39 - v15;
  v16 = sub_2448EB508();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v39 - v21;
  v40 = v4;
  v53 = v4[13];
  v50 = v6;
  v51 = v5;
  v52 = v45;
  v45 = v5;
  type metadata accessor for ZipFuture.Activity(255, v6, v5, v23);
  v24 = sub_2448EA5D8();
  swift_retain();
  v25 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v24);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)((uint64_t)&dword_2447B9000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/ZipFuture.swift", 121, 2, v47, 40, v48, 14, 2, v46, (uint64_t)v49, v24, v16, v25);
  swift_release();
  v47 = v17;
  v48 = v16;
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
  v46 = v14;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v20, 1, TupleTypeMetadata2) == 1)
  {
    v26 = v48;
    v27 = *(void (**)(char *, uint64_t))(v47 + 8);
    v27(v22, v48);
    return ((uint64_t (*)(char *, uint64_t))v27)(v20, v26);
  }
  else
  {
    v29 = *(int *)(TupleTypeMetadata2 + 48);
    v30 = v41;
    v31 = &v41[v29];
    v32 = &v20[v29];
    v33 = *(_QWORD *)(v6 - 8);
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v41, v20, v6);
    v34 = v45;
    v35 = *(_QWORD *)(v45 - 8);
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v31, v32, v45);
    v36 = (uint64_t)v42;
    v37 = &v42[*(int *)(TupleTypeMetadata2 + 48)];
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v42, v30, v6);
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v37, v31, v34);
    v38 = v43;
    swift_storeEnumTagMultiPayload();
    sub_2448D2CA4(v36);
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v36, v38);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v30, TupleTypeMetadata2);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v22, v48);
  }
}

uint64_t sub_2448E5B3C(void *a1)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  id v14;
  uint64_t v15;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v5 = type metadata accessor for FutureTermination(0, TupleTypeMetadata2, v3, v4);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (uint64_t *)((char *)&v15 - v8);
  result = sub_2448E6260(v7, v10, v11, v12);
  if ((result & 1) != 0)
  {
    *v9 = a1;
    swift_storeEnumTagMultiPayload();
    v14 = a1;
    sub_2448D2CA4((uint64_t)v9);
    return (*(uint64_t (**)(_QWORD *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t sub_2448E5BF8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t TupleTypeMetadata2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
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
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;

  v2 = v1;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v7 = type metadata accessor for FutureTermination(0, TupleTypeMetadata2, v5, v6);
  v30 = *(_QWORD *)(v7 - 8);
  v31 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - v9;
  v11 = *a1;
  v12 = a1[1];
  v13 = *((_BYTE *)a1 + 16);
  v14 = a1[3];
  v32 = a1[4];
  v16 = a1[5];
  v15 = a1[6];
  v17 = *((_BYTE *)a1 + 56);
  result = sub_2448E6260(v8, v18, v19, v20);
  if ((result & 1) != 0)
  {
    v22 = *(_QWORD *)(v2 + 112);
    v33 = v11;
    v34 = v12;
    v35 = v13;
    v36 = v14;
    v37 = v32;
    v38 = v16;
    v39 = v15;
    v28 = v16;
    v29 = v15;
    v40 = v17;
    (*(void (**)(uint64_t *))(*(_QWORD *)v22 + 192))(&v33);
    v23 = *(_QWORD *)(v2 + 120);
    v33 = v11;
    v34 = v12;
    v35 = v13;
    v24 = v32;
    v36 = v14;
    v37 = v32;
    v38 = v16;
    v25 = v29;
    v39 = v29;
    v40 = v17;
    (*(void (**)(uint64_t *))(*(_QWORD *)v23 + 192))(&v33);
    *(_QWORD *)v10 = v11;
    *((_QWORD *)v10 + 1) = v12;
    v10[16] = v13;
    *((_QWORD *)v10 + 3) = v14;
    *((_QWORD *)v10 + 4) = v24;
    *((_QWORD *)v10 + 5) = v28;
    *((_QWORD *)v10 + 6) = v25;
    v10[56] = v17;
    v26 = v31;
    swift_storeEnumTagMultiPayload();
    sub_2448D2CA4((uint64_t)v10);
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v10, v26);
  }
  return result;
}

uint64_t sub_2448E5D64(__int128 *a1)
{
  char v1;
  char v2;
  __int128 v4;
  char v5;
  __int128 v6;
  __int128 v7;
  char v8;

  v1 = *((_BYTE *)a1 + 16);
  v2 = *((_BYTE *)a1 + 56);
  v4 = *a1;
  v5 = v1;
  v6 = *(__int128 *)((char *)a1 + 24);
  v7 = *(__int128 *)((char *)a1 + 40);
  v8 = v2;
  return sub_2448E5BF8((uint64_t *)&v4);
}

void sub_2448E5DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for ZipFuture.Activity(0, a3, a4, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - v7, a1, v5);
  v8 = (char *)sub_2448E5E68 + 4 * byte_2448F8B50[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2448E5E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t TupleTypeMetadata2;

  *(_QWORD *)(v4 - 144) = "/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/Preview"
                          "sFoundation/ZipFuture.swift";
  *(_QWORD *)(v4 - 136) = 121;
  *(_BYTE *)(v4 - 128) = 2;
  *(_OWORD *)(v4 - 120) = xmmword_2448F8B30;
  *(_QWORD *)(v4 - 104) = "aSucceeded(_:)";
  *(_QWORD *)(v4 - 96) = 14;
  *(_BYTE *)(v4 - 88) = 2;
  sub_244823F6C();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v0, 1, 1, TupleTypeMetadata2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v1);
}

void sub_2448E600C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for ZipFuture.Activity(0, a3, a4, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - v7, a1, v5);
  v8 = (char *)sub_2448E60BC + 4 * byte_2448F8B54[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2448E60BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t TupleTypeMetadata2;

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v5, v2);
  swift_storeEnumTagMultiPayload();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v0 + *(int *)(TupleTypeMetadata2 + 48), v4, v1);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata2 - 8) + 56))(v0, 0, 1, TupleTypeMetadata2);
}

uint64_t sub_2448E6260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;

  v5 = *v4;
  v13 = v4[13];
  v6 = *(_QWORD *)(v5 + 208);
  v11 = *(_QWORD *)(v5 + 200);
  v12 = v6;
  type metadata accessor for ZipFuture.Activity(255, v11, v6, a4);
  v7 = sub_2448EA5D8();
  swift_retain();
  v8 = MEMORY[0x24951AC70](&protocol conformance descriptor for OSAllocatedUnfairLock<A>, v7);
  SynchronousAccessProviding.syncWrite<A>(dsoHandle:file:line:column:function:_:)((uint64_t)&dword_2447B9000, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/UITestingAgent/Shared/PreviewsFoundation/Sources/PreviewsFoundation/ZipFuture.swift", 121, 2, 206, 28, (uint64_t)"checkIfRunningAndMarkFinished()", 31, 2, (uint64_t)sub_2448E79E4, (uint64_t)v10, v7, MEMORY[0x24BEE1328], v8);
  swift_release();
  return v14;
}

void sub_2448E633C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v5 = type metadata accessor for ZipFuture.Activity(0, a2, a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - v7, a1, v5);
  v8 = (char *)sub_2448E63D0 + 4 * byte_2448F8B58[swift_getEnumCaseMultiPayload()];
  __asm { BR              X11 }
}

uint64_t sub_2448E63D0()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t result;

  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v1, v2);
  v5(v3, v2);
  result = swift_storeEnumTagMultiPayload();
  *v0 = 1;
  return result;
}

uint64_t sub_2448E6434()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2448E6458()
{
  uint64_t v0;

  v0 = Future.deinit();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_2448E6494()
{
  sub_2448E6458();
  return swift_deallocClassInstance();
}

uint64_t sub_2448E64B0()
{
  return swift_deallocObject();
}

uint64_t sub_2448E64C0(char *a1, char *a2, char *a3, uint64_t a4, uint64_t a5, char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v8;

  return sub_2448E5298(a1, a2, a3, a4, a5, a6, a7, a8, v8[2], v8[3], v8[4], v8[5]);
}

uint64_t sub_2448E64EC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2448E6510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_2448E54EC(a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 48), a2);
}

uint64_t sub_2448E6520()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ZipFuture(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ZipFuture);
}

uint64_t *sub_2448E6574(uint64_t *__dst, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
    goto LABEL_8;
  v7 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  v8 = 2;
  if (v7 > 0xFFFD)
    v8 = 4;
  if (v7 <= 0xFD)
LABEL_8:
    v8 = 1;
  v9 = v8 + v6;
  v10 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v4 + 80));
  if (v10 > 7 || v9 > 0x18 || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v10 + 16) & ~v10));
    swift_retain();
    return v3;
  }
  if (v6 > 3)
    goto LABEL_18;
  v15 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v15 > 0xFFFD)
  {
    v14 = *(_DWORD *)((char *)a2 + v6);
  }
  else
  {
    if (v15 <= 0xFD)
    {
LABEL_18:
      v14 = *((unsigned __int8 *)a2 + v6);
      goto LABEL_23;
    }
    v14 = *(unsigned __int16 *)((char *)a2 + v6);
  }
LABEL_23:
  if (v14 >= 2)
  {
    if (v6 <= 3)
      v16 = v6;
    else
      v16 = 4;
    __asm { BR              X15 }
  }
  if (v14 == 1)
  {
    (*(void (**)(uint64_t *))(v5 + 16))(__dst);
    if (v6 > 3)
      goto LABEL_34;
    v18 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    if (v18 > 0xFFFD)
    {
      *(_DWORD *)((char *)v3 + v6) = 1;
      return v3;
    }
    if (v18 <= 0xFD)
LABEL_34:
      *((_BYTE *)v3 + v6) = 1;
    else
      *(_WORD *)((char *)v3 + v6) = 1;
  }
  else
  {
    (*(void (**)(uint64_t *))(v4 + 16))(__dst);
    if (v6 <= 3)
    {
      v17 = ((1 << (8 * v6)) + 1) >> (8 * v6);
      if (v17 > 0xFFFD)
      {
        *(_DWORD *)((char *)v3 + v6) = 0;
        return v3;
      }
      if (v17 > 0xFD)
      {
        *(_WORD *)((char *)v3 + v6) = 0;
        return v3;
      }
    }
    *((_BYTE *)v3 + v6) = 0;
  }
  return v3;
}

uint64_t sub_2448E6808(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(v2 - 8);
  if (*(_QWORD *)(v5 + 64) > v4)
    v4 = *(_QWORD *)(v5 + 64);
  if (v4 > 3)
    goto LABEL_4;
  v7 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v7 > 0xFFFD)
  {
    v6 = *(_DWORD *)(a1 + v4);
  }
  else
  {
    if (v7 <= 0xFD)
    {
LABEL_4:
      v6 = *(unsigned __int8 *)(a1 + v4);
      goto LABEL_9;
    }
    v6 = *(unsigned __int16 *)(a1 + v4);
  }
LABEL_9:
  if (v6 < 2)
  {
    if (v6)
      v3 = *(_QWORD *)(v2 - 8);
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    if (v4 <= 3)
      v8 = v4;
    else
      v8 = 4;
    return ((uint64_t (*)(void))((char *)&loc_2448E689C + 4 * byte_2448F8B61[v8]))();
  }
}

_BYTE *sub_2448E68FC(_BYTE *__dst, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
    goto LABEL_5;
  v8 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v8 > 0xFFFD)
  {
    v7 = *(_DWORD *)(a2 + v6);
  }
  else
  {
    if (v8 <= 0xFD)
    {
LABEL_5:
      v7 = *(unsigned __int8 *)(a2 + v6);
      goto LABEL_10;
    }
    v7 = *(unsigned __int16 *)(a2 + v6);
  }
LABEL_10:
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v9 = v6;
    else
      v9 = 4;
    __asm { BR              X15 }
  }
  if (v7 == 1)
  {
    (*(void (**)(_BYTE *))(v5 + 16))(__dst);
    if (v6 > 3)
      goto LABEL_21;
    v11 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    if (v11 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v6] = 1;
      return __dst;
    }
    if (v11 <= 0xFD)
LABEL_21:
      __dst[v6] = 1;
    else
      *(_WORD *)&__dst[v6] = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 16))(__dst);
    if (v6 <= 3)
    {
      v10 = ((1 << (8 * v6)) + 1) >> (8 * v6);
      if (v10 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v6] = 0;
        return __dst;
      }
      if (v10 > 0xFD)
      {
        *(_WORD *)&__dst[v6] = 0;
        return __dst;
      }
    }
    __dst[v6] = 0;
  }
  return __dst;
}

char *sub_2448E6AF4(char *__dst, char *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_QWORD *)(v6 - 8);
  if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
    v9 = *(_QWORD *)(v7 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64);
  if (v9 > 3)
    goto LABEL_6;
  v11 = ((1 << (8 * v9)) + 1) >> (8 * v9);
  if (v11 > 0xFFFD)
  {
    v10 = *(_DWORD *)&__dst[v9];
  }
  else
  {
    if (v11 <= 0xFD)
    {
LABEL_6:
      v10 = __dst[v9];
      goto LABEL_11;
    }
    v10 = *(unsigned __int16 *)&__dst[v9];
  }
LABEL_11:
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v12 = v9;
    else
      v12 = 4;
    __asm { BR              X12 }
  }
  v13 = *(_QWORD *)(v5 - 8);
  v14 = *(_QWORD *)(a3 + 16);
  if (v10)
  {
    v13 = *(_QWORD *)(v6 - 8);
    v14 = *(_QWORD *)(a3 + 24);
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(__dst, v14);
  if (v9 > 3)
    goto LABEL_19;
  v16 = ((1 << (8 * v9)) + 1) >> (8 * v9);
  if (v16 > 0xFFFD)
  {
    v15 = *(_DWORD *)&__src[v9];
  }
  else
  {
    if (v16 <= 0xFD)
    {
LABEL_19:
      v15 = __src[v9];
      goto LABEL_24;
    }
    v15 = *(unsigned __int16 *)&__src[v9];
  }
LABEL_24:
  if (v15 >= 2)
  {
    if (v9 <= 3)
      v17 = v9;
    else
      v17 = 4;
    __asm { BR              X12 }
  }
  if (v15 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(__dst, __src, v6);
    if (v9 > 3)
      goto LABEL_35;
    v19 = ((1 << (8 * v9)) + 1) >> (8 * v9);
    if (v19 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v9] = 1;
      return __dst;
    }
    if (v19 <= 0xFD)
LABEL_35:
      __dst[v9] = 1;
    else
      *(_WORD *)&__dst[v9] = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(__dst, __src, v5);
    if (v9 <= 3)
    {
      v18 = ((1 << (8 * v9)) + 1) >> (8 * v9);
      if (v18 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v9] = 0;
        return __dst;
      }
      if (v18 > 0xFD)
      {
        *(_WORD *)&__dst[v9] = 0;
        return __dst;
      }
    }
    __dst[v9] = 0;
  }
  return __dst;
}

_BYTE *sub_2448E6DF0(_BYTE *__dst, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  if (*(_QWORD *)(v5 + 64) <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  else
    v6 = *(_QWORD *)(v5 + 64);
  if (v6 > 3)
    goto LABEL_5;
  v8 = ((1 << (8 * v6)) + 1) >> (8 * v6);
  if (v8 > 0xFFFD)
  {
    v7 = *(_DWORD *)(a2 + v6);
  }
  else
  {
    if (v8 <= 0xFD)
    {
LABEL_5:
      v7 = *(unsigned __int8 *)(a2 + v6);
      goto LABEL_10;
    }
    v7 = *(unsigned __int16 *)(a2 + v6);
  }
LABEL_10:
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v9 = v6;
    else
      v9 = 4;
    __asm { BR              X15 }
  }
  if (v7 == 1)
  {
    (*(void (**)(_BYTE *))(v5 + 32))(__dst);
    if (v6 > 3)
      goto LABEL_21;
    v11 = ((1 << (8 * v6)) + 1) >> (8 * v6);
    if (v11 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v6] = 1;
      return __dst;
    }
    if (v11 <= 0xFD)
LABEL_21:
      __dst[v6] = 1;
    else
      *(_WORD *)&__dst[v6] = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    if (v6 <= 3)
    {
      v10 = ((1 << (8 * v6)) + 1) >> (8 * v6);
      if (v10 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v6] = 0;
        return __dst;
      }
      if (v10 > 0xFD)
      {
        *(_WORD *)&__dst[v6] = 0;
        return __dst;
      }
    }
    __dst[v6] = 0;
  }
  return __dst;
}

char *sub_2448E6FE8(char *__dst, char *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;

  if (__dst == __src)
    return __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(a3 + 24);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_QWORD *)(v6 - 8);
  if (*(_QWORD *)(v8 + 64) <= *(_QWORD *)(v7 + 64))
    v9 = *(_QWORD *)(v7 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64);
  if (v9 > 3)
    goto LABEL_6;
  v11 = ((1 << (8 * v9)) + 1) >> (8 * v9);
  if (v11 > 0xFFFD)
  {
    v10 = *(_DWORD *)&__dst[v9];
  }
  else
  {
    if (v11 <= 0xFD)
    {
LABEL_6:
      v10 = __dst[v9];
      goto LABEL_11;
    }
    v10 = *(unsigned __int16 *)&__dst[v9];
  }
LABEL_11:
  if (v10 >= 2)
  {
    if (v9 <= 3)
      v12 = v9;
    else
      v12 = 4;
    __asm { BR              X12 }
  }
  v13 = *(_QWORD *)(v5 - 8);
  v14 = *(_QWORD *)(a3 + 16);
  if (v10)
  {
    v13 = *(_QWORD *)(v6 - 8);
    v14 = *(_QWORD *)(a3 + 24);
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(__dst, v14);
  if (v9 > 3)
    goto LABEL_19;
  v16 = ((1 << (8 * v9)) + 1) >> (8 * v9);
  if (v16 > 0xFFFD)
  {
    v15 = *(_DWORD *)&__src[v9];
  }
  else
  {
    if (v16 <= 0xFD)
    {
LABEL_19:
      v15 = __src[v9];
      goto LABEL_24;
    }
    v15 = *(unsigned __int16 *)&__src[v9];
  }
LABEL_24:
  if (v15 >= 2)
  {
    if (v9 <= 3)
      v17 = v9;
    else
      v17 = 4;
    __asm { BR              X12 }
  }
  if (v15 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(__dst, __src, v6);
    if (v9 > 3)
      goto LABEL_35;
    v19 = ((1 << (8 * v9)) + 1) >> (8 * v9);
    if (v19 > 0xFFFD)
    {
      *(_DWORD *)&__dst[v9] = 1;
      return __dst;
    }
    if (v19 <= 0xFD)
LABEL_35:
      __dst[v9] = 1;
    else
      *(_WORD *)&__dst[v9] = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(__dst, __src, v5);
    if (v9 <= 3)
    {
      v18 = ((1 << (8 * v9)) + 1) >> (8 * v9);
      if (v18 > 0xFFFD)
      {
        *(_DWORD *)&__dst[v9] = 0;
        return __dst;
      }
      if (v18 > 0xFD)
      {
        *(_WORD *)&__dst[v9] = 0;
        return __dst;
      }
    }
    __dst[v9] = 0;
  }
  return __dst;
}

uint64_t sub_2448E72E4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  int v4;
  unsigned int v5;
  char v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int v12;
  unsigned int v13;
  int v14;
  int v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64) > v3)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (v3 > 3)
  {
    v4 = 3;
LABEL_7:
    v6 = 8;
    goto LABEL_8;
  }
  v5 = ((1 << (8 * v3)) + 1) >> (8 * v3);
  if (v5 > 0xFFFD)
    goto LABEL_11;
  v4 = v5 + 2;
  if (v5 <= 0xFD)
    goto LABEL_7;
  v6 = 16;
LABEL_8:
  v7 = (1 << v6) - v4;
  if ((v7 & 0x80000000) == 0)
  {
    if (v3 > 3)
      goto LABEL_15;
LABEL_12:
    v8 = ((1 << (8 * v3)) + 1) >> (8 * v3);
    v9 = 2;
    if (v8 > 0xFFFD)
      v9 = 4;
    if (v8 > 0xFD)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_11:
  v7 = 0x7FFFFFFF;
  if (v3 <= 3)
    goto LABEL_12;
LABEL_15:
  v9 = 1;
LABEL_16:
  if (!a2)
    return 0;
  if (a2 <= v7)
    goto LABEL_34;
  v10 = v9 + v3;
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v13 = ((a2 - v7 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v13))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_34;
      goto LABEL_27;
    }
    if (v13 < 2)
    {
LABEL_34:
      if (v7)
      {
        if (v3 <= 3)
        {
          v21 = ((1 << (8 * v3)) + 1) >> (8 * v3);
          if (v21 > 0xFFFD)
          {
            v17 = *(_DWORD *)(a1 + v3);
            v18 = ~v17;
LABEL_44:
            v24 = 0x7FFFFFFF;
LABEL_45:
            if (v24 > v18)
              return -v17;
            else
              return 0;
          }
          v20 = v21 + 2;
          if (v21 > 0xFD)
          {
            v23 = *(unsigned __int16 *)(a1 + v3);
            v17 = v23 | 0xFFFF0000;
            v18 = v23 ^ 0xFFFF;
            v19 = 16;
          }
          else
          {
            v22 = *(unsigned __int8 *)(a1 + v3);
            v17 = v22 | 0xFFFFFF00;
            v18 = v22 ^ 0xFF;
            v19 = 8;
          }
        }
        else
        {
          v16 = *(unsigned __int8 *)(a1 + v3);
          v17 = v16 | 0xFFFFFF00;
          v18 = v16 ^ 0xFF;
          v19 = 8;
          v20 = 3;
        }
        v24 = (1 << v19) - v20;
        if ((v24 & 0x80000000) == 0)
          goto LABEL_45;
        goto LABEL_44;
      }
      return 0;
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_34;
LABEL_27:
  v14 = (v12 - 1) << v11;
  if (v10 > 3)
    v14 = 0;
  if (!(_DWORD)v10)
    return v7 + v14 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448E7444 + 4 * byte_2448F8B84[(v10 - 1)]))();
}

void sub_2448E7528(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  int v7;
  char v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  size_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 24) - 8) + 64);
  v6 = 8 * v5;
  if (v5 <= 3)
  {
    v10 = ((1 << v6) + 1) >> v6;
    if (v10 > 0xFFFD)
      goto LABEL_12;
    v7 = v10 + 2;
    if (v10 > 0xFD)
    {
      v8 = 16;
LABEL_6:
      v9 = (1 << v8) - v7;
      if ((v9 & 0x80000000) == 0)
      {
        if (v5 > 3)
          goto LABEL_16;
LABEL_13:
        v11 = ((1 << v6) + 1) >> v6;
        v12 = 2;
        if (v11 > 0xFFFD)
          v12 = 4;
        if (v11 > 0xFD)
        {
LABEL_17:
          v13 = v12 + v5;
          if (a3 <= v9)
          {
            v14 = 0;
          }
          else if (v13 <= 3)
          {
            v16 = ((a3 - v9 + ~(-1 << (8 * v13))) >> (8 * v13)) + 1;
            if (HIWORD(v16))
            {
              v14 = 4u;
            }
            else if (v16 >= 0x100)
            {
              v14 = 2;
            }
            else
            {
              v14 = v16 > 1;
            }
          }
          else
          {
            v14 = 1u;
          }
          if (v9 < a2)
          {
            v15 = ~v9 + a2;
            if (v13 < 4)
            {
              if ((_DWORD)v13)
              {
                v17 = v15 & ~(-1 << (8 * v13));
                bzero(a1, v13);
                if ((_DWORD)v13 == 3)
                {
                  *a1 = v17;
                  *((_BYTE *)a1 + 2) = BYTE2(v17);
                }
                else if ((_DWORD)v13 == 2)
                {
                  *a1 = v17;
                }
                else
                {
                  *(_BYTE *)a1 = v17;
                }
              }
            }
            else
            {
              bzero(a1, v13);
              *(_DWORD *)a1 = v15;
            }
            __asm { BR              X10 }
          }
          __asm { BR              X12 }
        }
LABEL_16:
        v12 = 1;
        goto LABEL_17;
      }
LABEL_12:
      v9 = 0x7FFFFFFF;
      if (v5 > 3)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v7 = 3;
  }
  v8 = 8;
  goto LABEL_6;
}

uint64_t sub_2448E77AC(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 64);
  if (v2 <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64))
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (v2 > 3)
    goto LABEL_4;
  v4 = ((1 << (8 * v2)) + 1) >> (8 * v2);
  if (v4 > 0xFFFD)
  {
    v3 = *(unsigned int *)(a1 + v2);
  }
  else
  {
    if (v4 <= 0xFD)
    {
LABEL_4:
      v3 = *(unsigned __int8 *)(a1 + v2);
      goto LABEL_9;
    }
    v3 = *(unsigned __int16 *)(a1 + v2);
  }
LABEL_9:
  if (v3 < 2)
    return v3;
  if (v2 <= 3)
    v5 = v2;
  else
    v5 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448E7838 + 4 * byte_2448F8B92[v5]))();
}

_BYTE *sub_2448E7880(_BYTE *result, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int *v7;
  unsigned int v8;
  int v9;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8)
                                                                                + 64))
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 24) - 8) + 64);
  if (a2 > 1)
  {
    if (v4 < 4)
    {
      v6 = ((a2 - 2) >> (8 * v4)) + 2;
      v7 = (unsigned int *)&result[v4];
      v8 = ((1 << (8 * v4)) + 1) >> (8 * v4);
      if (v8 > 0xFFFD)
      {
        *v7 = v6;
      }
      else if (v8 > 0xFD)
      {
        *(_WORD *)v7 = v6;
      }
      else
      {
        *(_BYTE *)v7 = v6;
      }
    }
    else
    {
      result[v4] = 2;
    }
    if (v4 <= 3)
      v9 = v4;
    else
      v9 = 4;
    bzero(result, v4);
    __asm { BR              X10 }
  }
  if (v4 > 3)
    goto LABEL_6;
  v5 = ((1 << (8 * v4)) + 1) >> (8 * v4);
  if (v5 > 0xFFFD)
  {
    *(_DWORD *)&result[v4] = a2;
  }
  else
  {
    if (v5 <= 0xFD)
    {
LABEL_6:
      result[v4] = a2;
      return result;
    }
    *(_WORD *)&result[v4] = a2;
  }
  return result;
}

uint64_t type metadata accessor for ZipFuture.Activity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ZipFuture.Activity);
}

void sub_2448E79E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_2448E633C(a1, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
}

uint64_t sub_2448E79FC(__int128 *a1)
{
  return sub_2448E5D64(a1);
}

uint64_t sub_2448E7A18(uint64_t a1)
{
  return sub_2448E582C(a1, 164, (uint64_t)"bSucceeded(_:)", (uint64_t)sub_2448E7A40);
}

void sub_2448E7A40(uint64_t a1)
{
  uint64_t *v1;

  sub_2448E600C(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_2448E7A5C(uint64_t a1)
{
  return sub_2448E582C(a1, 141, (uint64_t)"aSucceeded(_:)", (uint64_t)sub_2448E7A84);
}

void sub_2448E7A84(uint64_t a1)
{
  uint64_t *v1;

  sub_2448E5DB8(a1, v1[4], v1[2], v1[3]);
}

uint64_t BinaryInteger.numberOfSetBits.getter(uint64_t a1, uint64_t a2)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t result;
  char v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v3 = a2;
  v49 = *(_QWORD *)(a2 + 24);
  v53 = *(_QWORD *)(v49 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v52 = (char *)&v44 - v6;
  v7 = *(_QWORD *)(a1 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v48 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v47 = (char *)&v44 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v46 = (char *)&v44 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v44 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v44 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v44 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v44 - v23;
  v25 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v25((char *)&v44 - v23, v2, a1);
  v26 = 0;
  v50 = v25;
  v44 = v22;
  v45 = v16;
  do
  {
    v25(v22, (uint64_t)v24, a1);
    v39 = sub_2448EB64C();
    v54 = v26;
    if ((v39 & 1) != 0)
    {
      if (sub_2448EB640() >= 64)
        goto LABEL_2;
LABEL_12:
      v43 = sub_2448EB634();
      v28 = *(void (**)(char *, uint64_t))(v7 + 8);
      goto LABEL_13;
    }
    v40 = sub_2448EB64C();
    v41 = sub_2448EB640();
    if ((v40 & 1) == 0)
    {
      if (v41 >= 64)
      {
LABEL_2:
        v55 = 0;
        sub_24481EBC8();
        sub_2448EB61C();
        v27 = sub_2448EAA64();
        v28 = *(void (**)(char *, uint64_t))(v7 + 8);
        v28(v19, a1);
        v28(v22, a1);
        if ((v27 & 1) != 0)
          goto LABEL_16;
        goto LABEL_3;
      }
      goto LABEL_12;
    }
    if (v41 > 64)
      goto LABEL_2;
    swift_getAssociatedConformanceWitness();
    sub_2448EBC4C();
    v25 = v50;
    sub_2448EBBC8();
    v42 = sub_2448EA9C8();
    v28 = *(void (**)(char *, uint64_t))(v7 + 8);
    v28(v19, a1);
    v25(v16, (uint64_t)v22, a1);
    if ((v42 & 1) == 0)
    {
      v28(v16, a1);
      v28(v22, a1);
      goto LABEL_3;
    }
    v43 = sub_2448EB634();
    v28(v16, a1);
LABEL_13:
    v28(v22, a1);
    if (!v43)
    {
LABEL_16:
      v28(v24, a1);
      return v54;
    }
LABEL_3:
    v29 = v46;
    v25(v46, (uint64_t)v24, a1);
    swift_getAssociatedConformanceWitness();
    sub_2448EBC4C();
    v30 = a1;
    v31 = v19;
    v32 = v3;
    v33 = v48;
    v25 = v50;
    sub_2448EBBC8();
    v34 = v47;
    sub_2448EB9C4();
    v35 = v33;
    v3 = v32;
    v19 = v31;
    a1 = v30;
    v28(v35, v30);
    sub_2448EB628();
    v36 = v34;
    v22 = v44;
    v28(v36, v30);
    v37 = v29;
    v16 = v45;
    v28(v37, v30);
    v28(v24, v30);
    result = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 32))(v24, v19, v30);
    v26 = v54 + 1;
  }
  while (!__OFADD__(v54, 1));
  __break(1u);
  return result;
}

uint64_t static FutureTermination.completed(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v6 = sub_2448EBD48();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v13 - v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v13 - v7, a1, v6);
  if (swift_getEnumCaseMultiPayload() == 1)
    *a3 = *v8;
  else
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, v8, a2);
  type metadata accessor for FutureTermination(0, a2, v10, v11);
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for FutureTermination(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FutureTermination);
}

uint64_t sub_2448E8090@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  MEMORY[0x24BDAC7A8](a1);
  v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_QWORD *))(v6 + 16))(v5);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a2 = *v5;
    type metadata accessor for FutureTermination(0, *(_QWORD *)(a1 + 16), v7, v8);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 16);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a2, v5, v9);
    type metadata accessor for FutureTermination(0, v9, v10, v11);
  }
  return swift_storeEnumTagMultiPayload();
}

BOOL FutureTermination.isCompleted.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload <= 1)
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  return EnumCaseMultiPayload < 2;
}

uint64_t FutureTermination.map<A>(_:)@<X0>(void (*a1)(_QWORD *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int EnumCaseMultiPayload;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  char v29;
  char v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(_QWORD *);
  _QWORD *v37;

  v35 = a2;
  v36 = a1;
  v37 = a5;
  v8 = *(_QWORD *)(a3 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v9 = sub_2448EBD48();
  v33 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v32 - v10);
  v32 = a4;
  v12 = sub_2448EBD48();
  v34 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - v14;
  v16 = *(_QWORD *)(v8 - 8);
  v17 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v21, v5, a3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v21, v8);
    (*(void (**)(_QWORD *, char *, uint64_t))(v16 + 16))(v11, v19, v8);
    swift_storeEnumTagMultiPayload();
    v36(v11);
    (*(void (**)(_QWORD *, uint64_t))(v33 + 8))(v11, v9);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v8);
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v26 = *(void **)v21;
    *v11 = *(_QWORD *)v21;
    swift_storeEnumTagMultiPayload();
    v27 = v26;
    v36(v11);

    (*(void (**)(_QWORD *, uint64_t))(v33 + 8))(v11, v9);
LABEL_5:
    sub_2448E8090(v12, v37);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v15, v12);
  }
  v29 = v21[16];
  v30 = v21[56];
  v31 = v37;
  *(_OWORD *)v37 = *(_OWORD *)v21;
  *((_BYTE *)v31 + 16) = v29;
  *(_OWORD *)(v31 + 3) = *(_OWORD *)(v21 + 24);
  *(_OWORD *)(v31 + 5) = *(_OWORD *)(v21 + 40);
  *((_BYTE *)v31 + 56) = v30;
  type metadata accessor for FutureTermination(0, v32, v24, v25);
  return swift_storeEnumTagMultiPayload();
}

uint64_t FutureTermination.succeededValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a1);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 56))(a2, 1, 1, *(_QWORD *)(a1 + 16));
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 16);
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v6, v9);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v10 + 56))(a2, 0, 1, v9);
  }
}

uint64_t FutureTermination.failedError.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int EnumCaseMultiPayload;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
      return *(_QWORD *)v4;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  return 0;
}

uint64_t FutureTermination.completedResult.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  MEMORY[0x24BDAC7A8](a1);
  v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_QWORD *))(v6 + 16))(v5);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    (*(void (**)(_QWORD *, _QWORD *, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 32))(a2, v5, *(_QWORD *)(a1 + 16));
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    v8 = sub_2448EBD48();
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    *a2 = *v5;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    v8 = sub_2448EBD48();
LABEL_5:
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a2, 0, 1, v8);
  }
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  v10 = sub_2448EBD48();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a2, 1, 1, v10);
}

uint64_t FutureTermination.description.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  _QWORD v8[2];

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (id *)((char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(id *))(v2 + 16))(v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {

      return 0x64656C696166;
    }
    else
    {
      return 0x64656C65636E6163;
    }
  }
  else
  {
    v8[0] = 0x6564656563637573;
    v8[1] = 0xEA00000000003C64;
    sub_2448EBDB4();
    sub_2448EABC0();
    swift_bridgeObjectRelease();
    sub_2448EABC0();
    v6 = v8[0];
    (*(void (**)(id *, uint64_t))(v2 + 8))(v4, a1);
  }
  return v6;
}

BOOL FutureTermination.isCanceled.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unsigned int EnumCaseMultiPayload;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload <= 1)
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  return EnumCaseMultiPayload > 1;
}

uint64_t FutureTermination.result.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return FutureTermination.resultMappingCancelation(_:)((uint64_t (*)(__int128 *))sub_2448E8D60, a1, a2);
}

uint64_t FutureTermination.mapSuccess<A>(_:)@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v24;

  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v14 + 16))(v13, v15);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      *(_QWORD *)a4 = *(_QWORD *)v13;
    }
    else
    {
      v21 = v13[16];
      v22 = v13[56];
      *(_OWORD *)a4 = *(_OWORD *)v13;
      *(_BYTE *)(a4 + 16) = v21;
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(v13 + 24);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(v13 + 40);
      *(_BYTE *)(a4 + 56) = v22;
    }
    type metadata accessor for FutureTermination(0, a3, v17, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v11, v13, v7);
    a1(v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    type metadata accessor for FutureTermination(0, a3, v19, v20);
  }
  return swift_storeEnumTagMultiPayload();
}

uint64_t FutureTermination.resultMappingCancelation(_:)@<X0>(uint64_t (*a1)(__int128 *)@<X0>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  char v12;
  char v13;
  __int128 v14;
  char v15;
  __int128 v16;
  __int128 v17;
  char v18;

  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v8 + 16))(v7, v9);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      *a3 = *(_QWORD *)v7;
      __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
      sub_2448EBD48();
      return swift_storeEnumTagMultiPayload();
    }
    else
    {
      v12 = v7[16];
      v13 = v7[56];
      v14 = *(_OWORD *)v7;
      v15 = v12;
      v16 = *(_OWORD *)(v7 + 24);
      v17 = *(_OWORD *)(v7 + 40);
      v18 = v13;
      return a1(&v14);
    }
  }
  else
  {
    (*(void (**)(_QWORD *, char *, _QWORD))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 32))(a3, v7, *(_QWORD *)(a2 + 16));
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
    sub_2448EBD48();
    return swift_storeEnumTagMultiPayload();
  }
}

uint64_t sub_2448E8C84@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;

  v6 = *a1;
  v7 = a1[1];
  v8 = *((_BYTE *)a1 + 16);
  v16 = *(_OWORD *)(a1 + 3);
  v9 = a1[5];
  v10 = a1[6];
  v11 = *((_BYTE *)a1 + 56);
  v12 = type metadata accessor for FutureTermination.FutureCanceled(0, a2, a3, a4);
  MEMORY[0x24951AC70](&unk_2448F8DF4, v12);
  v13 = swift_allocError();
  *(_QWORD *)v14 = v6;
  *(_QWORD *)(v14 + 8) = v7;
  *(_BYTE *)(v14 + 16) = v8;
  *(_OWORD *)(v14 + 24) = v16;
  *(_QWORD *)(v14 + 40) = v9;
  *(_QWORD *)(v14 + 48) = v10;
  *(_BYTE *)(v14 + 56) = v11;
  *a5 = v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25738A0A8);
  sub_2448EBD48();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2448E8D60@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;

  return sub_2448E8C84(a1, *(_QWORD *)(v4 + 16), a2, a3, a4);
}

unint64_t sub_2448E8D68()
{
  sub_2448EB79C();
  swift_bridgeObjectRelease();
  Callsite.description.getter();
  sub_2448EABC0();
  swift_bridgeObjectRelease();
  return 0xD000000000000016;
}

unint64_t sub_2448E8E28()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_2448E8E48(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x24951AC70](&unk_2448F8DD8, a1);
  return HumanReadableError.errorDescription.getter(a1, v2);
}

uint64_t sub_2448E8E7C(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x24951AC70](&unk_2448F8DD8, a1);
  return HumanReadableError.description.getter(a1, v2);
}

uint64_t FutureTermination.isFailed.getter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload != 1)
      return 0;
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  return v6;
}

uint64_t FutureTermination.detailedDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int EnumCaseMultiPayload;
  void *v10;
  uint64_t v11;
  char v12;
  char v13;
  __int128 v15;
  char v16;
  __int128 v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  unint64_t v21;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v10 = *(void **)v7;
      *(_QWORD *)&v15 = 0;
      *((_QWORD *)&v15 + 1) = 0xE000000000000000;
      sub_2448EABC0();
      v20 = (uint64_t)v10;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25738A0A8);
      sub_2448EB91C();

      return v15;
    }
    else
    {
      v12 = v7[16];
      v13 = v7[56];
      v20 = 0x64656C65636E6163;
      v21 = 0xEA0000000000203ALL;
      v15 = *(_OWORD *)v7;
      v16 = v12;
      v17 = *(_OWORD *)(v7 + 24);
      v18 = *(_OWORD *)(v7 + 40);
      v19 = v13;
      Callsite.description.getter();
      sub_2448EABC0();
      swift_bridgeObjectRelease();
      return v20;
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v5, v7, v1);
    *(_QWORD *)&v15 = 0;
    *((_QWORD *)&v15 + 1) = 0xE000000000000000;
    sub_2448EABC0();
    sub_2448EBBA4();
    v11 = v15;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return v11;
}

uint64_t Logger.logOutcome<A>(of:at:operation:)(uint64_t *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v17 = a3;
  HIDWORD(v16) = a2;
  v6 = *a1;
  v7 = sub_2448EA5FC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, v7);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = v11 + v9;
  v13 = swift_allocObject();
  v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + v13;
  *(_QWORD *)(v13 + 16) = *(_QWORD *)(v6 + 80);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v11, v10, v7);
  *(_BYTE *)(v13 + v12) = BYTE4(v16);
  *(_QWORD *)(v14 + 8) = v17;
  *(_QWORD *)(v14 + 16) = a4;
  swift_retain();
  Future.observeFinish(_:)((uint64_t)sub_2448E9564, v13);
  return swift_release();
}

void sub_2448E9270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a3;
  v9 = type metadata accessor for FutureTermination(0, a6, a3, a4);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v25 - v12;
  if ((FutureTermination.isFailed.getter(v11) & 1) != 0)
    v7 = sub_2448EB3A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  swift_retain_n();
  v14 = sub_2448EA5E4();
  v15 = v7;
  if (os_log_type_enabled(v14, v7))
  {
    v16 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    v28 = v26;
    *(_DWORD *)v16 = 136315650;
    v17 = sub_2448EBDB4();
    v25 = (uint64_t (*)(uint64_t))a4;
    v27 = sub_2447D6798(v17, v18, &v28);
    sub_2448EB598();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    v19 = FutureTermination.detailedDescription.getter(v9);
    v27 = sub_2447D6798(v19, v20, &v28);
    sub_2448EB598();
    swift_bridgeObjectRelease();
    v21 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    *(_WORD *)(v16 + 22) = 2082;
    v22 = v25(v21);
    v27 = sub_2447D6798(v22, v23, &v28);
    sub_2448EB598();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2447B9000, v14, v15, "Future<%s> %{public}s\nOperation: %{public}s", (uint8_t *)v16, 0x20u);
    v24 = v26;
    swift_arrayDestroy();
    MEMORY[0x24951AD84](v24, -1, -1);
    MEMORY[0x24951AD84](v16, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    swift_release_n();
  }
}

uint64_t sub_2448E94F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2448EA5FC();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_2448E9564(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(sub_2448EA5FC() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  sub_2448E9270(a1, v1 + v5, *(unsigned __int8 *)(v1 + v5 + *(_QWORD *)(v4 + 64)), *(_QWORD *)(((v5 + *(_QWORD *)(v4 + 64)) & 0xFFFFFFFFFFFFFFF8) + v1 + 8), *(_QWORD *)(((v5 + *(_QWORD *)(v4 + 64)) & 0xFFFFFFFFFFFFFFF8) + v1 + 16), v3);
}

uint64_t sub_2448E95C8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *sub_2448E9644(_OWORD *a1, char **a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char *v8;
  unsigned int v9;
  char *v10;
  char *v11;
  __int128 v12;

  v3 = (char *)a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x39uLL)
    v5 = 57;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *(_QWORD *)v3 = *a2;
    v3 = &v8[(unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8];
    swift_retain();
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 3)
      v9 = *(_DWORD *)a2 + 3;
    if (v9 == 2)
    {
      v12 = *((_OWORD *)a2 + 1);
      *a1 = *(_OWORD *)a2;
      a1[1] = v12;
      a1[2] = *((_OWORD *)a2 + 2);
      *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)((char *)a2 + 41);
      *((_BYTE *)a1 + v5) = 2;
    }
    else if (v9 == 1)
    {
      v10 = *a2;
      v11 = *a2;
      *(_QWORD *)v3 = v10;
      v3[v5] = 1;
    }
    else
    {
      (*(void (**)(_OWORD *))(v4 + 16))(a1);
      v3[v5] = 0;
    }
  }
  return v3;
}

void sub_2448E9738(id *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x39)
    v3 = 57;
  v4 = *((unsigned __int8 *)a1 + v3);
  if (v4 < 3)
  {
    if (v4 != 2)
    {
      if (v4 == 1)

      else
        (*(void (**)(void))(v2 + 8))();
    }
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    ((void (*)(void))((char *)&loc_2448E9780 + 4 * byte_2448F8C40[v5]))();
  }
}

_OWORD *sub_2448E97E4(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  __int128 v11;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x39uLL)
    v5 = 57;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 3)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 2)
  {
    v11 = *((_OWORD *)a2 + 1);
    *a1 = *(_OWORD *)a2;
    a1[1] = v11;
    a1[2] = *((_OWORD *)a2 + 2);
    *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)((char *)a2 + 41);
    v10 = 2;
  }
  else if (v6 == 1)
  {
    v8 = *a2;
    v9 = (id)*a2;
    *(_QWORD *)a1 = v8;
    v10 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 16))(a1);
    v10 = 0;
  }
  *((_BYTE *)a1 + v5) = v10;
  return a1;
}

uint64_t sub_2448E98F0(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  if ((__int128 *)a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x39uLL)
      v7 = 57;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 3)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 != 2)
    {
      if (v8 == 1)

      else
        (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 3)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 2)
    {
      v15 = *a2;
      v16 = a2[1];
      v17 = a2[2];
      *(_OWORD *)(a1 + 41) = *(__int128 *)((char *)a2 + 41);
      *(_OWORD *)(a1 + 16) = v16;
      *(_OWORD *)(a1 + 32) = v17;
      *(_OWORD *)a1 = v15;
      v14 = 2;
    }
    else if (v10 == 1)
    {
      v12 = *(void **)a2;
      v13 = v12;
      *(_QWORD *)a1 = v12;
      v14 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, __int128 *, uint64_t))(v6 + 16))(a1, a2, v5);
      v14 = 0;
    }
    *(_BYTE *)(a1 + v7) = v14;
  }
  return a1;
}

_OWORD *sub_2448E9AB4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x39uLL)
    v5 = 57;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 3)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 2)
  {
    v9 = a2[1];
    *a1 = *a2;
    a1[1] = v9;
    a1[2] = a2[2];
    *(_OWORD *)((char *)a1 + 41) = *(_OWORD *)((char *)a2 + 41);
    v8 = 2;
  }
  else if (v6 == 1)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    v8 = 0;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

uint64_t sub_2448E9BB0(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;
  __int128 v13;

  if ((_OWORD *)a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x39uLL)
      v7 = 57;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 3)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 != 2)
    {
      if (v8 == 1)

      else
        (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 3)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 2)
    {
      v13 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v13;
      *(_OWORD *)(a1 + 32) = a2[2];
      *(_OWORD *)(a1 + 41) = *(_OWORD *)((char *)a2 + 41);
      v12 = 2;
    }
    else if (v10 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    *(_BYTE *)(a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_2448E9D6C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 57;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x39uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448E9E30 + 4 * byte_2448F8C63[(v4 - 1)]))();
}

void sub_2448E9E7C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x39)
    v5 = 57;
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v8 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_2448EA024(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 57;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x39uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 3u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2448EA06C + 4 * byte_2448F8C71[v3]))();
}

void sub_2448EA0B4(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 0x39uLL)
    v4 = 57;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 2)
  {
    v5 = a2 - 3;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 3;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 3;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t type metadata accessor for FutureTermination.FutureCanceled(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FutureTermination.FutureCanceled);
}

void sub_2448EA188()
{
  JUMPOUT(0x24951AC70);
}

uint64_t sub_2448EA198(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x24951AC70](&unk_2448F8D90);
  result = MEMORY[0x24951AC70](&unk_2448F8D68, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2448EA1DC()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2448EA1E8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2448EA1F4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2448EA200()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2448EA20C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2448EA218()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2448EA224()
{
  return MEMORY[0x24BDCB628]();
}

uint64_t sub_2448EA230()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_2448EA23C()
{
  return MEMORY[0x24BDCB6D8]();
}

uint64_t sub_2448EA248()
{
  return MEMORY[0x24BDCB700]();
}

uint64_t sub_2448EA254()
{
  return MEMORY[0x24BDCB710]();
}

uint64_t sub_2448EA260()
{
  return MEMORY[0x24BDCB740]();
}

uint64_t sub_2448EA26C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2448EA278()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_2448EA284()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2448EA290()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_2448EA29C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2448EA2A8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2448EA2B4()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2448EA2C0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2448EA2CC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2448EA2D8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2448EA2E4()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2448EA2F0()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2448EA2FC()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2448EA308()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_2448EA314()
{
  return MEMORY[0x24BDCC728]();
}

uint64_t sub_2448EA320()
{
  return MEMORY[0x24BDCC738]();
}

uint64_t sub_2448EA32C()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_2448EA338()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_2448EA344()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_2448EA350()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_2448EA35C()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_2448EA368()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_2448EA374()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2448EA380()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2448EA38C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2448EA398()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_2448EA3A4()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2448EA3B0()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_2448EA3BC()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_2448EA3C8()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2448EA3D4()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_2448EA3E0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2448EA3EC()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_2448EA3F8()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_2448EA404()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2448EA410()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_2448EA41C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2448EA428()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_2448EA434()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2448EA440()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2448EA44C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2448EA458()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_2448EA464()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_2448EA470()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2448EA47C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2448EA488()
{
  return MEMORY[0x24BDCDD70]();
}

uint64_t sub_2448EA494()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_2448EA4A0()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t sub_2448EA4AC()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_2448EA4B8()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2448EA4C4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2448EA4D0()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_2448EA4DC()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_2448EA4E8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2448EA4F4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2448EA500()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2448EA50C()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t _s10Foundation4UUIDV08PreviewsA2OSE17propertyListValueSSvg_0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2448EA524()
{
  return MEMORY[0x24BDCE9B8]();
}

uint64_t _s20PreviewsFoundationOS11CrashReportV2IDV2eeoiySbAE_AEtFZ_0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t _s20PreviewsFoundationOS11CrashReportV2IDVAEycfC_0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2448EA548()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2448EA554()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_2448EA560()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_2448EA56C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2448EA578()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_2448EA584()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_2448EA590()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_2448EA59C()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2448EA5A8()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2448EA5B4()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_2448EA5C0()
{
  return MEMORY[0x24BEE77A0]();
}

uint64_t sub_2448EA5CC()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_2448EA5D8()
{
  return MEMORY[0x24BEE7828]();
}

uint64_t sub_2448EA5E4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2448EA5F0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2448EA5FC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2448EA608()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_2448EA614()
{
  return MEMORY[0x24BEE76D8]();
}

uint64_t sub_2448EA620()
{
  return MEMORY[0x24BEE76E0]();
}

uint64_t sub_2448EA62C()
{
  return MEMORY[0x24BDB99C8]();
}

uint64_t sub_2448EA638()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_2448EA644()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_2448EA650()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_2448EA65C()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_2448EA668()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_2448EA674()
{
  return MEMORY[0x24BDB9E38]();
}

uint64_t sub_2448EA680()
{
  return MEMORY[0x24BDB9E48]();
}

uint64_t sub_2448EA68C()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_2448EA698()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_2448EA6A4()
{
  return MEMORY[0x24BDB9FD8]();
}

uint64_t sub_2448EA6B0()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2448EA6BC()
{
  return MEMORY[0x24BDBA0D0]();
}

uint64_t sub_2448EA6C8()
{
  return MEMORY[0x24BDBA0D8]();
}

uint64_t sub_2448EA6D4()
{
  return MEMORY[0x24BDBA0F0]();
}

uint64_t sub_2448EA6E0()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2448EA6EC()
{
  return MEMORY[0x24BDBA138]();
}

uint64_t sub_2448EA6F8()
{
  return MEMORY[0x24BEE53F0]();
}

uint64_t sub_2448EA704()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2448EA710()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2448EA71C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2448EA728()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_2448EA734()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t _s20PreviewsFoundationOS17DispatchSchedulerV8DeadlineV1loiySbAE_AEtFZ_0()
{
  return MEMORY[0x24BEE5560]();
}

uint64_t _s20PreviewsFoundationOS17DispatchSchedulerV8DeadlineV2eeoiySbAE_AEtFZ_0()
{
  return MEMORY[0x24BEE5568]();
}

uint64_t _s20PreviewsFoundationOS17DispatchSchedulerV8DeadlineV3nowAEyFZ_0()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2448EA764()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2448EA770()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2448EA77C()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_2448EA788()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_2448EA794()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_2448EA7A0()
{
  return MEMORY[0x24BDC62E0]();
}

uint64_t sub_2448EA7AC()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_2448EA7B8()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_2448EA7C4()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_2448EA7D0()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_2448EA7DC()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_2448EA7E8()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_2448EA7F4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2448EA800()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2448EA80C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2448EA818()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t sub_2448EA824()
{
  return MEMORY[0x24BEE0280]();
}

uint64_t sub_2448EA830()
{
  return MEMORY[0x24BEE0290]();
}

uint64_t sub_2448EA83C()
{
  return MEMORY[0x24BEE02A0]();
}

uint64_t sub_2448EA848()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2448EA854()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_2448EA860()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t sub_2448EA86C()
{
  return MEMORY[0x24BEE0378]();
}

uint64_t sub_2448EA878()
{
  return MEMORY[0x24BEE0380]();
}

uint64_t sub_2448EA884()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_2448EA890()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t sub_2448EA89C()
{
  return MEMORY[0x24BEE0450]();
}

uint64_t sub_2448EA8A8()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_2448EA8B4()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2448EA8C0()
{
  return MEMORY[0x24BEE0480]();
}

uint64_t sub_2448EA8CC()
{
  return MEMORY[0x24BEE0490]();
}

uint64_t sub_2448EA8D8()
{
  return MEMORY[0x24BEE04A0]();
}

uint64_t sub_2448EA8E4()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2448EA8F0()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_2448EA8FC()
{
  return MEMORY[0x24BEE04B8]();
}

uint64_t sub_2448EA908()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_2448EA914()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2448EA920()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2448EA92C()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_2448EA938()
{
  return MEMORY[0x24BEE0680]();
}

uint64_t sub_2448EA944()
{
  return MEMORY[0x24BEE0688]();
}

uint64_t sub_2448EA950()
{
  return MEMORY[0x24BEE06F0]();
}

uint64_t sub_2448EA95C()
{
  return MEMORY[0x24BEE0740]();
}

uint64_t sub_2448EA968()
{
  return MEMORY[0x24BEE0780]();
}

uint64_t sub_2448EA974()
{
  return MEMORY[0x24BEE0788]();
}

uint64_t sub_2448EA980()
{
  return MEMORY[0x24BEE0790]();
}

uint64_t sub_2448EA98C()
{
  return MEMORY[0x24BEE07A0]();
}

uint64_t sub_2448EA998()
{
  return MEMORY[0x24BEE07B0]();
}

uint64_t sub_2448EA9A4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2448EA9B0()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_2448EA9BC()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_2448EA9C8()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_2448EA9D4()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_2448EA9E0()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_2448EA9EC()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_2448EA9F8()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_2448EAA04()
{
  return MEMORY[0x24BEE0830]();
}

uint64_t sub_2448EAA10()
{
  return MEMORY[0x24BEE0838]();
}

uint64_t sub_2448EAA1C()
{
  return MEMORY[0x24BEE0840]();
}

uint64_t sub_2448EAA28()
{
  return MEMORY[0x24BEE0848]();
}

uint64_t sub_2448EAA34()
{
  return MEMORY[0x24BEE0878]();
}

uint64_t sub_2448EAA40()
{
  return MEMORY[0x24BEE0888]();
}

uint64_t sub_2448EAA4C()
{
  return MEMORY[0x24BEE0898]();
}

uint64_t sub_2448EAA58()
{
  return MEMORY[0x24BEE0930]();
}

uint64_t sub_2448EAA64()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2448EAA70()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2448EAA7C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2448EAA88()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2448EAA94()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2448EAAA0()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_2448EAAAC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2448EAAB8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2448EAAC4()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2448EAAD0()
{
  return MEMORY[0x24BDCFAD8]();
}

uint64_t sub_2448EAADC()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2448EAAE8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2448EAAF4()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2448EAB00()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_2448EAB0C()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2448EAB18()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2448EAB24()
{
  return MEMORY[0x24BEE0A68]();
}

uint64_t sub_2448EAB30()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t sub_2448EAB3C()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t sub_2448EAB48()
{
  return MEMORY[0x24BEE0A90]();
}

uint64_t sub_2448EAB54()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2448EAB60()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2448EAB6C()
{
  return MEMORY[0x24BEE0B40]();
}

uint64_t sub_2448EAB78()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2448EAB84()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2448EAB90()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_2448EAB9C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2448EABA8()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_2448EABB4()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_2448EABC0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2448EABCC()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2448EABD8()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_2448EABE4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2448EABF0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2448EABFC()
{
  return MEMORY[0x24BEE0C28]();
}

uint64_t sub_2448EAC08()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2448EAC14()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2448EAC20()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2448EAC2C()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t sub_2448EAC38()
{
  return MEMORY[0x24BEE0C70]();
}

uint64_t sub_2448EAC44()
{
  return MEMORY[0x24BEE0C80]();
}

uint64_t sub_2448EAC50()
{
  return MEMORY[0x24BEE0C90]();
}

uint64_t sub_2448EAC5C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2448EAC68()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_2448EAC74()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_2448EAC80()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_2448EAC8C()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_2448EAC98()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2448EACA4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2448EACB0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2448EACBC()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_2448EACC8()
{
  return MEMORY[0x24BEE0E10]();
}

uint64_t sub_2448EACD4()
{
  return MEMORY[0x24BEE0E38]();
}

uint64_t sub_2448EACE0()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_2448EACEC()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_2448EACF8()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_2448EAD04()
{
  return MEMORY[0x24BEE0E68]();
}

uint64_t sub_2448EAD10()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2448EAD1C()
{
  return MEMORY[0x24BEE0E90]();
}

uint64_t sub_2448EAD28()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_2448EAD34()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_2448EAD40()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_2448EAD4C()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_2448EAD58()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t sub_2448EAD64()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_2448EAD70()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_2448EAD7C()
{
  return MEMORY[0x24BEE0EF0]();
}

uint64_t sub_2448EAD88()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_2448EAD94()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2448EADA0()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_2448EADAC()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_2448EADB8()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_2448EADC4()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_2448EADD0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2448EADDC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2448EADE8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2448EADF4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2448EAE00()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2448EAE0C()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_2448EAE18()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_2448EAE24()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_2448EAE30()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2448EAE3C()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_2448EAE48()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_2448EAE54()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2448EAE60()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2448EAE6C()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_2448EAE78()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2448EAE84()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_2448EAE90()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_2448EAE9C()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2448EAEA8()
{
  return MEMORY[0x24BEE1200]();
}

uint64_t sub_2448EAEB4()
{
  return MEMORY[0x24BEE1208]();
}

uint64_t sub_2448EAEC0()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_2448EAECC()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_2448EAED8()
{
  return MEMORY[0x24BEE1240]();
}

uint64_t sub_2448EAEE4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2448EAEF0()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_2448EAEFC()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_2448EAF08()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_2448EAF14()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2448EAF20()
{
  return MEMORY[0x24BEE6810]();
}

uint64_t sub_2448EAF2C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2448EAF38()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2448EAF44()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_2448EAF50()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_2448EAF5C()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2448EAF68()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2448EAF74()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2448EAF80()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_2448EAF8C()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_2448EAF98()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_2448EAFA4()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t _sScS20PreviewsFoundationOSE4SinkV5yieldScS12ContinuationV11YieldResultOyyt__GyytRszlF_0()
{
  return MEMORY[0x24BEE6A28]();
}

uint64_t sub_2448EAFBC()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_2448EAFC8()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_2448EAFD4()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_2448EAFE0()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_2448EAFEC()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_2448EAFF8()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t sub_2448EB004()
{
  return MEMORY[0x24BEE6A90]();
}

uint64_t sub_2448EB010()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_2448EB01C()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_2448EB028()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2448EB034()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2448EB040()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_2448EB04C()
{
  return MEMORY[0x24BEE6AE8]();
}

uint64_t sub_2448EB058()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_2448EB064()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_2448EB070()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_2448EB07C()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_2448EB088()
{
  return MEMORY[0x24BEE6BE0]();
}

uint64_t sub_2448EB094()
{
  return MEMORY[0x24BEE6BE8]();
}

uint64_t sub_2448EB0A0()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_2448EB0AC()
{
  return MEMORY[0x24BEE6C18]();
}

uint64_t sub_2448EB0B8()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_2448EB0C4()
{
  return MEMORY[0x24BEE1590]();
}

uint64_t sub_2448EB0D0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2448EB0DC()
{
  return MEMORY[0x24BEE15E0]();
}

uint64_t sub_2448EB0E8()
{
  return MEMORY[0x24BEE15F0]();
}

uint64_t sub_2448EB0F4()
{
  return MEMORY[0x24BEE1630]();
}

uint64_t sub_2448EB100()
{
  return MEMORY[0x24BEE1638]();
}

uint64_t sub_2448EB10C()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_2448EB118()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_2448EB124()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2448EB130()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_2448EB13C()
{
  return MEMORY[0x24BEE16B8]();
}

uint64_t sub_2448EB148()
{
  return MEMORY[0x24BEE16C0]();
}

uint64_t sub_2448EB154()
{
  return MEMORY[0x24BEE16D0]();
}

uint64_t sub_2448EB160()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_2448EB16C()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_2448EB178()
{
  return MEMORY[0x24BEE1738]();
}

uint64_t sub_2448EB184()
{
  return MEMORY[0x24BEE1850]();
}

uint64_t sub_2448EB190()
{
  return MEMORY[0x24BEE1860]();
}

uint64_t sub_2448EB19C()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t sub_2448EB1A8()
{
  return MEMORY[0x24BEE1878]();
}

uint64_t sub_2448EB1B4()
{
  return MEMORY[0x24BEE1880]();
}

uint64_t sub_2448EB1C0()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t sub_2448EB1CC()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_2448EB1D8()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t sub_2448EB1E4()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2448EB1F0()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_2448EB1FC()
{
  return MEMORY[0x24BEE18D8]();
}

uint64_t sub_2448EB208()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_2448EB214()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_2448EB220()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_2448EB22C()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_2448EB238()
{
  return MEMORY[0x24BEE1970]();
}

uint64_t sub_2448EB244()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_2448EB250()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_2448EB25C()
{
  return MEMORY[0x24BEE1988]();
}

uint64_t sub_2448EB268()
{
  return MEMORY[0x24BEE1990]();
}

uint64_t sub_2448EB274()
{
  return MEMORY[0x24BEE1998]();
}

uint64_t sub_2448EB280()
{
  return MEMORY[0x24BEE19B0]();
}

uint64_t sub_2448EB28C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_2448EB298()
{
  return MEMORY[0x24BEE19C0]();
}

uint64_t sub_2448EB2A4()
{
  return MEMORY[0x24BEE19D0]();
}

uint64_t sub_2448EB2B0()
{
  return MEMORY[0x24BEE19F8]();
}

uint64_t sub_2448EB2BC()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_2448EB2C8()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_2448EB2D4()
{
  return MEMORY[0x24BEE1A20]();
}

uint64_t sub_2448EB2E0()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_2448EB2EC()
{
  return MEMORY[0x24BEE7648]();
}

uint64_t sub_2448EB2F8()
{
  return MEMORY[0x24BEE1A48]();
}

uint64_t sub_2448EB304()
{
  return MEMORY[0x24BEE1A50]();
}

uint64_t sub_2448EB310()
{
  return MEMORY[0x24BEE1A58]();
}

uint64_t sub_2448EB31C()
{
  return MEMORY[0x24BEE1A60]();
}

uint64_t sub_2448EB328()
{
  return MEMORY[0x24BEE1A78]();
}

uint64_t sub_2448EB334()
{
  return MEMORY[0x24BEE1B10]();
}

uint64_t sub_2448EB340()
{
  return MEMORY[0x24BEE1B20]();
}

uint64_t sub_2448EB34C()
{
  return MEMORY[0x24BEE1B28]();
}

uint64_t sub_2448EB358()
{
  return MEMORY[0x24BEE1B30]();
}

uint64_t sub_2448EB364()
{
  return MEMORY[0x24BEE1B50]();
}

uint64_t sub_2448EB370()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_2448EB37C()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t sub_2448EB388()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2448EB394()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2448EB3A0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2448EB3AC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2448EB3B8()
{
  return MEMORY[0x24BDCFF78]();
}

uint64_t sub_2448EB3C4()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_2448EB3D0()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2448EB3DC()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2448EB3E8()
{
  return MEMORY[0x24BEE56D8]();
}

uint64_t sub_2448EB3F4()
{
  return MEMORY[0x24BEE56E0]();
}

uint64_t sub_2448EB400()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_2448EB40C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2448EB418()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2448EB424()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2448EB430()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2448EB43C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2448EB448()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_2448EB454()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2448EB460()
{
  return MEMORY[0x24BDD0158]();
}

uint64_t sub_2448EB46C()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_2448EB478()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2448EB484()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2448EB490()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2448EB49C()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_2448EB4A8()
{
  return MEMORY[0x24BDD0410]();
}

uint64_t sub_2448EB4B4()
{
  return MEMORY[0x24BDD0420]();
}

uint64_t sub_2448EB4C0()
{
  return MEMORY[0x24BDD0430]();
}

uint64_t sub_2448EB4CC()
{
  return MEMORY[0x24BDD0460]();
}

uint64_t sub_2448EB4D8()
{
  return MEMORY[0x24BDD0468]();
}

uint64_t sub_2448EB4E4()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2448EB4F0()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_2448EB4FC()
{
  return MEMORY[0x24BEE1C18]();
}

uint64_t sub_2448EB508()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2448EB514()
{
  return MEMORY[0x24BEE1C90]();
}

uint64_t sub_2448EB520()
{
  return MEMORY[0x24BEE1CB0]();
}

uint64_t sub_2448EB52C()
{
  return MEMORY[0x24BEE1CE8]();
}

uint64_t sub_2448EB538()
{
  return MEMORY[0x24BEE1D08]();
}

uint64_t sub_2448EB544()
{
  return MEMORY[0x24BEE1D60]();
}

uint64_t sub_2448EB550()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_2448EB55C()
{
  return MEMORY[0x24BEE1DB0]();
}

uint64_t sub_2448EB568()
{
  return MEMORY[0x24BEE1DC0]();
}

uint64_t sub_2448EB574()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_2448EB580()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_2448EB58C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2448EB598()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2448EB5A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2448EB5B0()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_2448EB5BC()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_2448EB5C8()
{
  return MEMORY[0x24BDD0518]();
}

uint64_t sub_2448EB5D4()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2448EB5E0()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2448EB5EC()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_2448EB5F8()
{
  return MEMORY[0x24BDD0608]();
}

uint64_t sub_2448EB604()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2448EB610()
{
  return MEMORY[0x24BEE1FA0]();
}

uint64_t sub_2448EB61C()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_2448EB628()
{
  return MEMORY[0x24BEE1FD8]();
}

uint64_t sub_2448EB634()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_2448EB640()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_2448EB64C()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_2448EB658()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_2448EB664()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2448EB670()
{
  return MEMORY[0x24BEE2110]();
}

uint64_t sub_2448EB67C()
{
  return MEMORY[0x24BEE2130]();
}

uint64_t sub_2448EB688()
{
  return MEMORY[0x24BEE2148]();
}

uint64_t sub_2448EB694()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_2448EB6A0()
{
  return MEMORY[0x24BEE2230]();
}

uint64_t sub_2448EB6AC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2448EB6B8()
{
  return MEMORY[0x24BEE22B8]();
}

uint64_t sub_2448EB6C4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2448EB6D0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2448EB6DC()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2448EB6E8()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2448EB6F4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2448EB700()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2448EB70C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2448EB718()
{
  return MEMORY[0x24BEE23F0]();
}

uint64_t sub_2448EB724()
{
  return MEMORY[0x24BEE2408]();
}

uint64_t sub_2448EB730()
{
  return MEMORY[0x24BEE2410]();
}

uint64_t sub_2448EB73C()
{
  return MEMORY[0x24BEE2458]();
}

uint64_t sub_2448EB748()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2448EB754()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2448EB760()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2448EB76C()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_2448EB778()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2448EB784()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_2448EB790()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_2448EB79C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2448EB7A8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2448EB7B4()
{
  return MEMORY[0x24BEE2548]();
}

uint64_t sub_2448EB7C0()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_2448EB7CC()
{
  return MEMORY[0x24BEE2588]();
}

uint64_t sub_2448EB7D8()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2448EB7E4()
{
  return MEMORY[0x24BEE2610]();
}

uint64_t sub_2448EB7F0()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_2448EB7FC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2448EB808()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_2448EB814()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_2448EB820()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2448EB82C()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_2448EB838()
{
  return MEMORY[0x24BEE2850]();
}

uint64_t sub_2448EB844()
{
  return MEMORY[0x24BEE2858]();
}

uint64_t sub_2448EB850()
{
  return MEMORY[0x24BEE28B0]();
}

uint64_t sub_2448EB85C()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_2448EB868()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2448EB874()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2448EB880()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2448EB88C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2448EB898()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2448EB8A4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2448EB8B0()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2448EB8BC()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2448EB8C8()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2448EB8D4()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_2448EB8E0()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_2448EB8EC()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_2448EB8F8()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2448EB904()
{
  return MEMORY[0x24BEE2B20]();
}

uint64_t sub_2448EB910()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_2448EB91C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2448EB928()
{
  return MEMORY[0x24BEE2C00]();
}

uint64_t sub_2448EB934()
{
  return MEMORY[0x24BEE2D50]();
}

uint64_t sub_2448EB940()
{
  return MEMORY[0x24BEE2D68]();
}

uint64_t sub_2448EB94C()
{
  return MEMORY[0x24BEE2D70]();
}

uint64_t sub_2448EB958()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2448EB964()
{
  return MEMORY[0x24BEE2E78]();
}

uint64_t sub_2448EB970()
{
  return MEMORY[0x24BEE2E90]();
}

uint64_t sub_2448EB97C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_2448EB988()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_2448EB994()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2448EB9A0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2448EB9AC()
{
  return MEMORY[0x24BEE2F60]();
}

uint64_t sub_2448EB9B8()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_2448EB9C4()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_2448EB9D0()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_2448EB9DC()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_2448EB9E8()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t sub_2448EB9F4()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_2448EBA00()
{
  return MEMORY[0x24BEE2FD8]();
}

uint64_t sub_2448EBA0C()
{
  return MEMORY[0x24BEE3038]();
}

uint64_t sub_2448EBA18()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2448EBA24()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2448EBA30()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2448EBA3C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2448EBA48()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2448EBA54()
{
  return MEMORY[0x24BEE3158]();
}

uint64_t sub_2448EBA60()
{
  return MEMORY[0x24BEE3160]();
}

uint64_t sub_2448EBA6C()
{
  return MEMORY[0x24BEE3168]();
}

uint64_t sub_2448EBA78()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2448EBA84()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2448EBA90()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_2448EBA9C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2448EBAA8()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_2448EBAB4()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2448EBAC0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2448EBACC()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2448EBAD8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2448EBAE4()
{
  return MEMORY[0x24BEE3398]();
}

uint64_t sub_2448EBAF0()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_2448EBAFC()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2448EBB08()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_2448EBB14()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2448EBB20()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_2448EBB2C()
{
  return MEMORY[0x24BEE6FC0]();
}

uint64_t sub_2448EBB38()
{
  return MEMORY[0x24BEE6FD8]();
}

uint64_t sub_2448EBB44()
{
  return MEMORY[0x24BEE6FF0]();
}

uint64_t sub_2448EBB50()
{
  return MEMORY[0x24BEE7018]();
}

uint64_t sub_2448EBB5C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2448EBB68()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_2448EBB74()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_2448EBB80()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_2448EBB8C()
{
  return MEMORY[0x24BEE3910]();
}

uint64_t sub_2448EBB98()
{
  return MEMORY[0x24BEE3920]();
}

uint64_t sub_2448EBBA4()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_2448EBBB0()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_2448EBBBC()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_2448EBBC8()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_2448EBBD4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2448EBBE0()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_2448EBBEC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2448EBBF8()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_2448EBC04()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_2448EBC10()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_2448EBC1C()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_2448EBC28()
{
  return MEMORY[0x24BEE3D38]();
}

uint64_t sub_2448EBC34()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2448EBC40()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_2448EBC4C()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_2448EBC58()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2448EBC64()
{
  return MEMORY[0x24BEE3E18]();
}

uint64_t sub_2448EBC70()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2448EBC7C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2448EBC88()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_2448EBC94()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_2448EBCA0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2448EBCAC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2448EBCB8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2448EBCC4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2448EBCD0()
{
  return MEMORY[0x24BEE41D8]();
}

uint64_t sub_2448EBCDC()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2448EBCE8()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_2448EBCF4()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2448EBD00()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2448EBD0C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2448EBD18()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2448EBD24()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2448EBD30()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2448EBD3C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2448EBD48()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_2448EBD54()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_2448EBD60()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2448EBD6C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2448EBD78()
{
  return MEMORY[0x24BEE4698]();
}

uint64_t sub_2448EBD84()
{
  return MEMORY[0x24BEE47E8]();
}

uint64_t sub_2448EBD90()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_2448EBD9C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2448EBDA8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2448EBDB4()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

uint64_t CSArchitectureGetArchitectureForName()
{
  return MEMORY[0x24BE286B0]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x24BE286D0]();
}

uint64_t CSRelease()
{
  return MEMORY[0x24BE286F8]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x24BE28720]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x24BE28728]();
}

uint64_t CSSymbolOwnerForEachStackFrameAtAddress()
{
  return MEMORY[0x24BE28788]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x24BE287B0]();
}

uint64_t CSSymbolOwnerGetSymbolWithAddress()
{
  return MEMORY[0x24BE287E0]();
}

uint64_t CSSymbolicatorCreateWithPathAndArchitecture()
{
  return MEMORY[0x24BE28848]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x24BE288E0]();
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x24BDD87E8]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x24BDD87F0](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x24BDD8828](blob, ps);
}

CFRunLoopSourceRef IOPSNotificationCreateRunLoopSource(IOPowerSourceCallbackType callback, void *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD8860](callback, context);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x24BDBCFA0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x24BDADDA0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x24BDAE0C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x24BDAF9C8](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4EB8]();
}

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x24BEE4EC0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}


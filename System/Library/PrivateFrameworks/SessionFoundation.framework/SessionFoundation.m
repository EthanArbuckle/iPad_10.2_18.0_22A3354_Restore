uint64_t sub_1A47164AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 8uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A47164F4 + 4 * byte_1A471D486[v3]))();
}

uint64_t type metadata accessor for BufferedAsyncSequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BufferedAsyncSequence);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1A4716564(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4716C6C(a1, v1);
}

uint64_t dispatch thunk of BufferedAsyncSequence.Iterator.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 232) + *(_QWORD *)(*(_QWORD *)v1 + 232));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1A47187C4;
  return v6(a1);
}

uint64_t type metadata accessor for KeepAliveTransaction()
{
  return objc_opt_self();
}

uint64_t KeepAliveTransaction.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1A4716628()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  swift_unknownObjectRelease();
  swift_getObjectType();
  return sub_1A471CDD0();
}

uint64_t sub_1A471665C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  sub_1A471CDE8();
  *v1 = v0;
  v1[1] = sub_1A4717CB8;
  return sub_1A471CE6C();
}

uint64_t sub_1A47166EC()
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

uint64_t objectdestroyTm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A471678C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1A47167AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A47167CC()
{
  uint64_t v0;

  return sub_1A47167D8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A47167D8(uint64_t a1)
{
  uint64_t v2;

  if ((byte_1EE75BA98 & 1) != 0)
  {
    *(_QWORD *)(a1 + 16) = 0;
  }
  else
  {
    sub_1A471CCB0();
    v2 = os_transaction_create();
    swift_release();
    *(_QWORD *)(a1 + 16) = v2;
  }
  return swift_unknownObjectRelease();
}

_BYTE *sub_1A4716840(_BYTE *__dst, void **a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
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
    v8 = *a2;
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 1;
    v9 = v8;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 16))(__dst);
    __dst[v5] = 0;
  }
  return __dst;
}

uint64_t BufferedAsyncSequence.makeAsyncIterator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for BufferedAsyncSequence.Iterator(0, *(_QWORD *)(a1 + 16), a3, a4);
  v4 = swift_allocObject();
  v5 = swift_retain();
  sub_1A4716980(v5);
  return v4;
}

uint64_t type metadata accessor for BufferedAsyncSequence.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BufferedAsyncSequence.Iterator);
}

_QWORD *sub_1A4716980(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  _DWORD *v4;

  type metadata accessor for UnfairLock();
  v3 = swift_allocObject();
  v4 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = 0;
  v1[2] = v3;
  v1[4] = 0;
  sub_1A471CDE8();
  v1[5] = sub_1A471CCE0();
  swift_getFunctionTypeMetadata1();
  v1[6] = sub_1A471CC98();
  v1[3] = a1;
  return v1;
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1A85A080C](a1, v6, a5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A85A0848]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A4716AB4()
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
  _QWORD *v10;
  _QWORD *v11;

  v1 = v0[4];
  if (!*(_QWORD *)(v1 + 32))
  {
    v0[2] = *(_QWORD *)(v1 + 24);
    v2 = v0[5];
    v3 = swift_allocObject();
    swift_weakInit();
    v4 = swift_allocObject();
    v5 = *(_QWORD *)(v2 + 80);
    *(_QWORD *)(v4 + 16) = v5;
    *(_QWORD *)(v4 + 24) = v3;
    v6 = swift_allocObject();
    swift_weakInit();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    *(_QWORD *)(v7 + 24) = v6;
    v8 = sub_1A471CC20();
    swift_retain();
    swift_retain();
    MEMORY[0x1A85A0860](MEMORY[0x1E0C95D90], v8);
    v9 = sub_1A471CC2C();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    *(_QWORD *)(v1 + 32) = v9;
    swift_release();
  }
  v10 = (_QWORD *)swift_task_alloc();
  v0[6] = v10;
  *v10 = v0;
  v10[1] = sub_1A47182F8;
  v11 = (_QWORD *)v0[4];
  v10[2] = v0[3];
  v10[3] = v11;
  v10[4] = *v11;
  return swift_task_switch();
}

uint64_t sub_1A4716C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  sub_1A471CDE8();
  v4 = sub_1A471CD4C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - v6, a1, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, v4);
  sub_1A4716D70((void (*)(_BYTE *))sub_1A47188D0, v9);
  return swift_release();
}

uint64_t sub_1A4716D70(void (*a1)(_BYTE *), uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  os_unfair_lock_s *v11;
  _BYTE v13[15];
  char v14;

  v3 = v2;
  v6 = *(_QWORD *)(*v3 + 80);
  v7 = sub_1A471CDE8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = &v13[-v9];
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(&v13[-v9], 1, 1, v6);
  v14 = 0;
  v11 = *(os_unfair_lock_s **)(v3[2] + 16);
  os_unfair_lock_lock(v11);
  sub_1A4716E68(v3, (uint64_t)v10, &v14, (uint64_t)a1, a2);
  os_unfair_lock_unlock(v11);
  if (v14 == 1)
    a1(v10);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1A4716E68(_QWORD *a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  char *v18;
  uint64_t (*v19)();
  _QWORD *v20;
  uint64_t v21;

  v17 = a2;
  v18 = a3;
  v8 = *(_QWORD *)(*a1 + 80);
  v9 = sub_1A471CDE8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v17 - v11;
  swift_beginAccess();
  v21 = a1[5];
  v13 = sub_1A471CD28();
  MEMORY[0x1A85A0860](MEMORY[0x1E0DEAF50], v13);
  if ((sub_1A471CD64() & 1) != 0)
  {
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v8;
    v14[3] = a4;
    v14[4] = a5;
    v19 = sub_1A4718830;
    v20 = v14;
    swift_beginAccess();
    swift_getFunctionTypeMetadata1();
    sub_1A471CD28();
    swift_retain();
    sub_1A471CCF8();
    result = swift_endAccess();
    v16 = 0;
  }
  else
  {
    swift_beginAccess();
    sub_1A471CD04();
    swift_endAccess();
    result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 40))(v17, v12, v9);
    v16 = 1;
  }
  *v18 = v16;
  return result;
}

id BSServiceConnection.init<A>(endpointedDefinedBy:instance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v15[2];
  unint64_t v16;
  unint64_t v17;

  swift_bridgeObjectRelease();
  sub_1A47171B0();
  v8 = BSServiceConnectionEndpoint.init<A>(definition:instance:)(a1, 0, 0, a4, a5);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_connectionWithEndpoint_, v8);

    if (v10)
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED1132C8);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1A471D6A0;
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    sub_1A471CE24();
    swift_bridgeObjectRelease();
    v16 = 0xD000000000000025;
    v17 = 0x80000001A471DC80;
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a5 + 24))(v15, a4, a5);
    swift_bridgeObjectRelease();
    sub_1A471CCBC();
    swift_bridgeObjectRelease();
    v12 = v16;
    v13 = v17;
    *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v11 + 32) = v12;
    *(_QWORD *)(v11 + 40) = v13;
    sub_1A471CE78();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

unint64_t sub_1A47171B0()
{
  unint64_t result;

  result = qword_1ED1136D0;
  if (!qword_1ED1136D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED1136D0);
  }
  return result;
}

id BSServiceConnectionEndpoint.init<A>(definition:instance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 24))(&v13, a4, a5);
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1A471CCA4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  v9 = (void *)sub_1A471CCA4();
  swift_bridgeObjectRelease();
  if (a3)
  {
    v10 = (void *)sub_1A471CCA4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_endpointForMachName_service_instance_, v8, v9, v10);

  return v11;
}

_QWORD *initializeWithCopy for XPCInterfaceDomain(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

uint64_t KeepAliveTransaction.init(reason:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t aBlock;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  uint64_t (*v29)();
  _QWORD *v30;

  v3 = v2;
  v6 = *v2;
  v7 = sub_1A471CC50();
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1A471CC68();
  v10 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2[2] = 0;
  v2[4] = a1;
  v2[5] = a2;
  sub_1A4717704(0, &qword_1ED1132C0);
  v13 = qword_1ED113260;
  swift_bridgeObjectRetain();
  if (v13 != -1)
    swift_once();
  v2[3] = sub_1A471CDB8();
  swift_getObjectType();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v2;
  v14[3] = a1;
  v14[4] = a2;
  v14[5] = v6;
  v29 = sub_1A471A6C8;
  v30 = v14;
  aBlock = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = (uint64_t (*)(uint64_t))sub_1A471A6D4;
  v28 = &block_descriptor;
  v15 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A471CC5C();
  sub_1A4717658();
  sub_1A471CDC4();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v22);
  swift_release();
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1A471CDDC();
  swift_unknownObjectRelease();
  v16 = qword_1ED113270;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v3;
  v17[3] = a1;
  v17[4] = a2;
  v17[5] = v6;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_1A47167CC;
  *(_QWORD *)(v18 + 24) = v17;
  v29 = sub_1A47167AC;
  v30 = (_QWORD *)v18;
  aBlock = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  v27 = sub_1A471678C;
  v28 = &block_descriptor_9;
  v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v16, v19);
  _Block_release(v19);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v19 & 1) == 0)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

uint64_t sub_1A4717658()
{
  sub_1A471CC50();
  sub_1A471777C(&qword_1ED113278, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED113280);
  sub_1A471773C((unint64_t *)&unk_1ED113288, &qword_1ED113280);
  return sub_1A471CE18();
}

uint64_t sub_1A4717704(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1A471773C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1A85A0860](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A471777C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1A85A0860](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

void sub_1A47177C4(id *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 8)
    v3 = 8;
  v4 = *((unsigned __int8 *)a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)

    else
      (*(void (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    ((void (*)(void))((char *)&loc_1A471780C + 4 * byte_1A471D455[v5]))();
  }
}

void sub_1A471786C(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8uLL)
    v4 = 8;
  else
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

id *sub_1A4717934(id *__dst, id *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)__dst + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)

    else
      (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)__src + v7);
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
      *__dst = *__src;
      *((_BYTE *)__dst + v7) = 1;
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 32))(__dst, __src, v5);
      *((_BYTE *)__dst + v7) = 0;
    }
  }
  return __dst;
}

uint64_t sub_1A4717ADC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for XPCTarget(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCTarget);
}

uint64_t BufferedAsyncSequence.init(publisher:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1A4717AF8()
{
  return swift_initClassMetadata2();
}

uint64_t dispatch thunk of KeepAliveTransaction.invalidate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

ValueMetadata *type metadata accessor for XPCInterfaceDomain()
{
  return &type metadata for XPCInterfaceDomain;
}

void static XPCInterfaceDomain.activitykit.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x80000001A471DC40;
  a1[2] = 0xD000000000000019;
  a1[3] = 0x80000001A471DC60;
}

unint64_t static NotificationName.daemonStartup.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_1A4717BCC()
{
  uint64_t v0;

  MEMORY[0x1A85A08E4](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ED113258)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ED113258);
  }
}

uint64_t sub_1A4717C4C(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_1A4716980(a1);
  return v2;
}

uint64_t sub_1A4717C88(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return swift_release();
}

uint64_t sub_1A4717C98(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch();
}

uint64_t sub_1A4717CB8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A4717D00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v5 = sub_1A471CDE8();
  v6 = sub_1A471CEA8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v17 - v9;
  v11 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v17 - v12;
  v14 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(a1, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v13, 1, 1, a3);
    sub_1A471CD4C();
    return sub_1A471CD40();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v10, a1, v5);
    swift_storeEnumTagMultiPayload();
    v16 = sub_1A471CD4C();
    sub_1A4717E88((uint64_t)v10, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

uint64_t sub_1A4717E88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v5);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1A471CEA8();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_1A471CD34();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_1A471CD40();
  }
}

void sub_1A4717FE8(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t FunctionTypeMetadata1;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v13 = 0;
  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 16) + 16);
  os_unfair_lock_lock(v3);
  sub_1A471813C(v1, a1, &v13);
  os_unfair_lock_unlock(v3);
  v4 = v13;
  if (v13)
  {
    sub_1A471CDE8();
    FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
    v6 = swift_bridgeObjectRetain();
    if (MEMORY[0x1A85A0428](v6, FunctionTypeMetadata1))
    {
      v7 = 0;
      v8 = v4 + 40;
      while (1)
      {
        v9 = sub_1A471CCEC();
        sub_1A471CCD4();
        if ((v9 & 1) == 0)
          break;
        v10 = *(void (**)(uint64_t))(v8 - 8);
        v11 = v7 + 1;
        v12 = __OFADD__(v7, 1);
        swift_retain();
        if (v12)
          goto LABEL_13;
        v10(a1);
        swift_release();
        ++v7;
        v8 += 16;
        if (v11 == MEMORY[0x1A85A0428](v4, FunctionTypeMetadata1))
          goto LABEL_10;
      }
      sub_1A471CE3C();
      __break(1u);
LABEL_13:
      __break(1u);
    }
    else
    {
LABEL_10:
      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1A471813C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[10];

  v6 = sub_1A471CDE8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v12 - v8;
  swift_beginAccess();
  v12[7] = *(_QWORD *)(a1 + 48);
  swift_getFunctionTypeMetadata1();
  v10 = sub_1A471CD28();
  MEMORY[0x1A85A0860](MEMORY[0x1E0DEAF50], v10);
  if ((sub_1A471CD64() & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    swift_beginAccess();
    sub_1A471CD28();
    sub_1A471CCF8();
  }
  else
  {
    swift_beginAccess();
    *a3 = *(_QWORD *)(a1 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_1A471CD1C();
  }
  return swift_endAccess();
}

uint64_t sub_1A47182D8(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[3] = a1;
  v2[4] = v1;
  v2[5] = *v1;
  return swift_task_switch();
}

uint64_t sub_1A47182F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A4718340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;

  v4 = sub_1A471CDE8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - v6;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(v7, 1, 1, a3);
    sub_1A4717FE8((uint64_t)v7);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_1A4718418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v5 = sub_1A471CDE8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - v7;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v10 = *(_QWORD *)(a3 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, a3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, a3);
    sub_1A4717FE8((uint64_t)v8);
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

uint64_t BufferedAsyncSequence.Iterator.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BufferedAsyncSequence.Iterator.__deallocating_deinit()
{
  BufferedAsyncSequence.Iterator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A471856C(uint64_t a1)
{
  _QWORD **v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A47185D8;
  v5[3] = a1;
  v5[4] = v4;
  v5[5] = *v4;
  return swift_task_switch();
}

uint64_t sub_1A47185D8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A4718624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  type metadata accessor for BufferedAsyncSequence.Iterator(0, *(_QWORD *)(a5 + 80), v8, v9);
  *v7 = v5;
  v7[1] = sub_1A47186BC;
  return sub_1A471CD58();
}

uint64_t sub_1A47186BC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A471870C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = BufferedAsyncSequence.makeAsyncIterator()(a1, a2, a3, a4);
  result = swift_release();
  *a5 = v6;
  return result;
}

uint64_t sub_1A4718744()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A4718768()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A471878C(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4718340(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A4718794(uint64_t a1)
{
  uint64_t v1;

  return sub_1A4718418(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A471879C()
{
  return MEMORY[0x1E0DEDD18];
}

void sub_1A47187A8()
{
  JUMPOUT(0x1A85A0860);
}

uint64_t method lookup function for BufferedAsyncSequence.Iterator()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1A47187C4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A471880C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A4718830()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_1A4718850()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A471CDE8();
  v1 = sub_1A471CD4C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1A47188D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  sub_1A471CDE8();
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1A471CD4C() - 8) + 80);
  return sub_1A4717D00(a1, v1 + ((v4 + 24) & ~v4), v3);
}

uint64_t XPCTarget.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v17;
  uint64_t v18;
  void **v19;
  uint64_t v20;
  int EnumCaseMultiPayload;
  void *v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void (*v29)(char *, _QWORD, uint64_t, uint64_t);
  _OWORD v30[2];
  __int128 v31;
  __int128 v32;

  v3 = v2;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = sub_1A471CDE8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v28 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v28 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (void **)((char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(void **, uint64_t, uint64_t))(v20 + 16))(v19, v3, a1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v22 = *v19;
      if (objc_msgSend(v22, sel_remoteTarget))
      {
        sub_1A471CE0C();
        swift_unknownObjectRelease();
        sub_1A4718C48(v30, &v31);
      }
      else
      {
        v31 = 0u;
        v32 = 0u;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1135F8);
      v25 = swift_dynamicCast();
      v26 = *(_QWORD *)(v6 - 8);
      v29 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56);
      v29(v17, v25 ^ 1u, 1, v6);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v14, v17, v7);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v14, 1, v6) == 1)
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
        objc_msgSend(v22, sel_activate);
        if (objc_msgSend(v22, sel_remoteTarget))
        {
          sub_1A471CE0C();

          swift_unknownObjectRelease();
          sub_1A4718C48(v30, &v31);
        }
        else
        {

          v31 = 0u;
          v32 = 0u;
        }
        v27 = swift_dynamicCast();
        v29(v11, v27 ^ 1u, 1, v6);
        (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v17, v11, v7);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
      }
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v17, v7);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a2, 1, 1, v6);
    }
  }
  else
  {
    v23 = *(_QWORD *)(v6 - 8);
    (*(void (**)(uint64_t, void **, uint64_t))(v23 + 32))(a2, v19, v6);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(a2, 0, 1, v6);
  }
}

_OWORD *sub_1A4718C48(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1A4718C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = *(_QWORD *)(a4 + a3 - 8);
  v6 = sub_1A471CDE8();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - v7;
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)&v14 - v7, a1);
  v12 = type metadata accessor for XPCTarget(0, v5, v10, v11);
  return XPCTarget.wrappedValue.setter((uint64_t)v8, v12);
}

uint64_t XPCTarget.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void **v6;
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
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  void *v20;
  uint64_t v22;
  char *v23;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (void **)((char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(_QWORD *)(v7 + 16);
  v9 = sub_1A471CDE8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v22 - v12;
  v14 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, v8) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v23, a2);
    v17 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v17(a1, v9);
    v17((uint64_t)v13, v9);
  }
  else
  {
    v22 = a1;
    v18 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v18(v16, v13, v8);
    v19 = v23;
    (*(void (**)(void **, char *, uint64_t))(v4 + 32))(v6, v23, a2);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = *v6;
      objc_msgSend(v20, sel_invalidate);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v22, v9);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v22, v9);
      (*(void (**)(void **, uint64_t))(v4 + 8))(v6, a2);
    }
    v18(v19, v16, v8);
  }
  return swift_storeEnumTagMultiPayload();
}

void (*XPCTarget.wrappedValue.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = sub_1A471CDE8();
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v9 = malloc(v8);
  v5[5] = v9;
  XPCTarget.wrappedValue.getter(a2, (uint64_t)v9);
  return sub_1A4718F70;
}

void sub_1A4718F70(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = (void *)(*a1)[4];
  v4 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    v5 = v2[2];
    v6 = v2[3];
    v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    XPCTarget.wrappedValue.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    XPCTarget.wrappedValue.setter((*a1)[5], *v2);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t XPCTarget.projectedValue.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (uint64_t *)((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v4 + 16))(v6);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v8 = *v6;
  }
  else
  {
    result = (*(uint64_t (**)(uint64_t *, uint64_t))(v4 + 8))(v6, a1);
    v8 = 0;
  }
  *a2 = v8;
  return result;
}

uint64_t sub_1A47190A8@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t XPCTarget.Connection.isActive.getter()
{
  id *v0;
  uint64_t v1;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;

  if (!*v0)
  {
    v4 = 0u;
    v5 = 0u;
LABEL_8:
    v1 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(*v0, sel_remoteTarget))
  {
    sub_1A471CE0C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v3, 0, sizeof(v3));
  }
  sub_1A4719188((uint64_t)v3, (uint64_t)&v4);
  if (!*((_QWORD *)&v5 + 1))
    goto LABEL_8;
  v1 = 1;
LABEL_9:
  sub_1A4719148((uint64_t)&v4);
  return v1;
}

uint64_t sub_1A4719148(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1135F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A4719188(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1135F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

Swift::Void __swiftcall XPCTarget.Connection.activate()()
{
  id *v0;

  objc_msgSend(*v0, sel_activate);
}

Swift::Void __swiftcall XPCTarget.Connection.deactivate()()
{
  id *v0;

  objc_msgSend(*v0, sel_invalidate);
}

uint64_t sub_1A47191F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;

  v5 = type metadata accessor for XPCTarget(0, *(_QWORD *)(a2 + a1 - 8), a2, a3);
  return XPCTarget.wrappedValue.getter(v5, a4);
}

uint64_t sub_1A471922C()
{
  return 8;
}

_QWORD *sub_1A4719238(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

char *sub_1A4719244(char *__dst, char **a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v3 = __dst;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 8uLL)
    v5 = 8;
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
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X14 }
    }
    if (v9 == 1)
    {
      v11 = *a2;
      *(_QWORD *)__dst = *a2;
      __dst[v5] = 1;
      v12 = v11;
    }
    else
    {
      (*(void (**)(char *))(v4 + 16))(__dst);
      v3[v5] = 0;
    }
  }
  return v3;
}

id *sub_1A4719370(id *__dst, void **__src, uint64_t a3)
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

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 8uLL)
      v7 = 8;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)__dst + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)

    else
      (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)__src + v7);
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
      v12 = *__src;
      *__dst = *__src;
      *((_BYTE *)__dst + v7) = 1;
      v13 = v12;
    }
    else
    {
      (*(void (**)(id *, void **, uint64_t))(v6 + 16))(__dst, __src, v5);
      *((_BYTE *)__dst + v7) = 0;
    }
  }
  return __dst;
}

_BYTE *sub_1A4719518(_BYTE *__dst, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
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
    *(_QWORD *)__dst = *a2;
    __dst[v5] = 1;
  }
  else
  {
    (*(void (**)(_BYTE *))(v4 + 32))(__dst);
    __dst[v5] = 0;
  }
  return __dst;
}

uint64_t sub_1A4719600(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 8uLL)
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
  return ((uint64_t (*)(void))((char *)&loc_1A47196C4 + 4 * byte_1A471D478[(v4 - 1)]))();
}

void sub_1A4719710(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0u;
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

void **sub_1A47198B8(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void sub_1A47198E4(id *a1)
{

}

void **sub_1A47198EC(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **sub_1A471992C(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_1A471995C(uint64_t *a1, unsigned int a2)
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

uint64_t sub_1A47199B8(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t type metadata accessor for XPCTarget.Connection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCTarget.Connection);
}

BOOL static TaskRequest.WakeType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TaskRequest.WakeType.hash(into:)()
{
  return sub_1A471CE90();
}

uint64_t TaskRequest.WakeType.hashValue.getter()
{
  sub_1A471CE84();
  sub_1A471CE90();
  return sub_1A471CE9C();
}

BOOL sub_1A4719A9C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1A4719AB4()
{
  sub_1A471CE84();
  sub_1A471CE90();
  return sub_1A471CE9C();
}

uint64_t sub_1A4719AF8()
{
  return sub_1A471CE90();
}

uint64_t sub_1A4719B20()
{
  sub_1A471CE84();
  sub_1A471CE90();
  return sub_1A471CE9C();
}

uint64_t TaskRequest.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1A471CBA8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t TaskRequest.wakeType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for TaskRequest();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for TaskRequest()
{
  uint64_t result;

  result = qword_1ED113240;
  if (!qword_1ED113240)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TaskRequest.explanation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TaskRequest() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TaskRequest.init(date:wakeType:explanation:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v9;
  uint64_t v10;
  uint64_t result;
  _QWORD *v12;

  v9 = *a2;
  v10 = sub_1A471CBA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a5, a1, v10);
  result = type metadata accessor for TaskRequest();
  *(_BYTE *)(a5 + *(int *)(result + 20)) = v9;
  v12 = (_QWORD *)(a5 + *(int *)(result + 24));
  *v12 = a3;
  v12[1] = a4;
  return result;
}

unint64_t sub_1A4719CBC()
{
  unint64_t result;

  result = qword_1EE75BA88;
  if (!qword_1EE75BA88)
  {
    result = MEMORY[0x1A85A0860](&protocol conformance descriptor for TaskRequest.WakeType, &type metadata for TaskRequest.WakeType);
    atomic_store(result, (unint64_t *)&qword_1EE75BA88);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for TaskRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1A471CBA8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TaskRequest(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1A471CBA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_1A471CBA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_1A471CBA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1A471CBA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for TaskRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_1A471CBA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TaskRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A4719FC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1A471CBA8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for TaskRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A471A04C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1A471CBA8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1A471A0C8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A471CBA8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TaskRequest.WakeType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TaskRequest.WakeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A471A230 + 4 * byte_1A471D505[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A471A264 + 4 * byte_1A471D500[v4]))();
}

uint64_t sub_1A471A264(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A471A26C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A471A274);
  return result;
}

uint64_t sub_1A471A280(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A471A288);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A471A28C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A471A294(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A471A2A0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1A471A2A8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TaskRequest.WakeType()
{
  return &type metadata for TaskRequest.WakeType;
}

uint64_t dispatch thunk of TaskScheduling.scheduleTask(request:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t sub_1A471A2CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_1A471CD94();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1A471CD7C();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1A471CC68();
  MEMORY[0x1E0C80A78](v6);
  sub_1A4717704(0, &qword_1ED1132B8);
  sub_1A471CC5C();
  v8[1] = MEMORY[0x1E0DEE9D8];
  sub_1A471777C(&qword_1ED1132B0, v5, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED113298);
  sub_1A471773C((unint64_t *)&unk_1ED1132A0, &qword_1ED113298);
  sub_1A471CE18();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  result = sub_1A471CDAC();
  qword_1ED113270 = result;
  return result;
}

uint64_t KeepAliveTransaction.__allocating_init(reason:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  KeepAliveTransaction.init(reason:)(a1, a2);
  return v4;
}

uint64_t sub_1A471A4E4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_1A471CBCC();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16))
  {
    sub_1A471CBC0();
    swift_bridgeObjectRetain_n();
    v11 = sub_1A471CBB4();
    v12 = sub_1A471CD70();
    if (os_log_type_enabled(v11, v12))
    {
      v17 = v6;
      v13 = swift_slowAlloc();
      v16 = a2;
      v14 = (uint8_t *)v13;
      v15 = swift_slowAlloc();
      v19 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      v18 = sub_1A471AE24(v16, a3, &v19);
      v6 = v17;
      sub_1A471CDF4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1A4715000, v11, v12, "Dropping transaction for SIGTERM: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A85A08E4](v15, -1, -1);
      MEMORY[0x1A85A08E4](v14, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    byte_1EE75BA98 = 1;
    *(_QWORD *)(a1 + 16) = 0;
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_1A471A6C8()
{
  uint64_t v0;

  return sub_1A471A4E4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1A471A6DC()
{
  return swift_deallocObject();
}

uint64_t static KeepAliveTransaction.with<A>(reason:_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  type metadata accessor for KeepAliveTransaction();
  v6 = swift_allocObject();
  swift_bridgeObjectRetain();
  v7 = KeepAliveTransaction.init(reason:)(a1, a2);
  a3(v7);
  *(_QWORD *)(v6 + 16) = 0;
  swift_unknownObjectRelease();
  swift_getObjectType();
  sub_1A471CDD0();
  return swift_release();
}

uint64_t static KeepAliveTransaction.asyncTask(reason:queue:delay:wrapping:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  double v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t aBlock;
  uint64_t v50;
  uint64_t (*v51)();
  void *v52;
  uint64_t (*v53)();
  _QWORD *v54;

  v41 = a4;
  v42 = a5;
  v43 = a3;
  v47 = a1;
  v8 = sub_1A471CC50();
  v45 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_1A471CC68();
  v44 = *(_QWORD *)(v46 - 8);
  MEMORY[0x1E0C80A78](v46);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1A471CC44();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (uint64_t *)((char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = sub_1A471CC8C();
  v17 = *(_QWORD *)(v40 - 8);
  v18 = MEMORY[0x1E0C80A78](v40);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v39 = (char *)&v36 - v21;
  type metadata accessor for KeepAliveTransaction();
  v22 = swift_allocObject();
  swift_bridgeObjectRetain();
  result = KeepAliveTransaction.init(reason:)(v47, a2);
  if (a6 <= 0.0)
  {
    v33 = (_QWORD *)swift_allocObject();
    v34 = v42;
    v33[2] = v41;
    v33[3] = v34;
    v33[4] = v22;
    v53 = sub_1A471ACC4;
    v54 = v33;
    aBlock = MEMORY[0x1E0C809B0];
    v50 = 1107296256;
    v51 = sub_1A471A6D4;
    v52 = &block_descriptor_15;
    v35 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    sub_1A471CC5C();
    v48 = MEMORY[0x1E0DEE9D8];
    sub_1A471777C(&qword_1ED113278, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED113280);
    sub_1A471773C((unint64_t *)&unk_1ED113288, &qword_1ED113280);
    sub_1A471CE18();
    MEMORY[0x1A85A04B8](0, v12, v10, v35);
    _Block_release(v35);
    swift_release();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v46);
    return swift_release();
  }
  v38 = v10;
  v47 = v8;
  v24 = a6 * 1000.0;
  if ((~COERCE__INT64(a6 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v24 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v24 < 9.22337204e18)
  {
    v25 = (uint64_t)v24;
    sub_1A471CC74();
    *v16 = v25;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF490], v13);
    v26 = v39;
    sub_1A471CC80();
    (*(void (**)(uint64_t *, uint64_t))(v14 + 8))(v16, v13);
    v37 = *(void (**)(char *, uint64_t))(v17 + 8);
    v27 = v40;
    v37(v20, v40);
    v28 = (_QWORD *)swift_allocObject();
    v29 = v42;
    v28[2] = v41;
    v28[3] = v29;
    v28[4] = v22;
    v53 = sub_1A471ACC4;
    v54 = v28;
    aBlock = MEMORY[0x1E0C809B0];
    v50 = 1107296256;
    v51 = sub_1A471A6D4;
    v52 = &block_descriptor_21;
    v30 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    sub_1A471CC5C();
    v48 = MEMORY[0x1E0DEE9D8];
    sub_1A471777C(&qword_1ED113278, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED113280);
    sub_1A471773C((unint64_t *)&unk_1ED113288, &qword_1ED113280);
    v31 = v38;
    v32 = v47;
    sub_1A471CE18();
    MEMORY[0x1A85A04A0](v26, v12, v31, v30);
    _Block_release(v30);
    swift_release();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v32);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v12, v46);
    v37(v26, v27);
    return swift_release();
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1A471AC94(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1A471ACC4()
{
  return sub_1A471AD44((uint64_t)sub_1A471AE0C);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A85A0854](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t objectdestroy_11Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A471AD44(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, uint64_t))(v1 + 16);
  v4 = *(_QWORD *)(v1 + 32);
  swift_retain();
  v3(a1, v4);
  return swift_release();
}

uint64_t sub_1A471AD94(uint64_t a1)
{
  *(_QWORD *)(a1 + 16) = 0;
  swift_unknownObjectRelease();
  swift_getObjectType();
  return sub_1A471CDD0();
}

uint64_t KeepAliveTransaction.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t method lookup function for KeepAliveTransaction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of KeepAliveTransaction.__allocating_init(reason:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1A471AE0C()
{
  uint64_t v0;

  return sub_1A471AD94(v0);
}

uint64_t sub_1A471AE24(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1A471AEF4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1A471B484((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1A471B484((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1A471AEF4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1A471CE00();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1A471B0AC(a5, a6);
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
  v8 = sub_1A471CE48();
  if (!v8)
  {
    sub_1A471CE54();
    __break(1u);
LABEL_17:
    result = sub_1A471CE60();
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

uint64_t sub_1A471B0AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1A471B140(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1A471B318(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1A471B318(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A471B140(uint64_t a1, unint64_t a2)
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
      v3 = sub_1A471B2B4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1A471CE30();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1A471CE54();
      __break(1u);
LABEL_10:
      v2 = sub_1A471CCC8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1A471CE60();
    __break(1u);
LABEL_14:
    result = sub_1A471CE54();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1A471B2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(qword_1EE75BB60);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A471B318(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_1EE75BB60);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1A471CE60();
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1A471B484(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t XPCInterfaceDomain.domain.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t XPCInterfaceDomain.machName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

SessionFoundation::XPCInterfaceDomain __swiftcall XPCInterfaceDomain.init(domain:machName:)(Swift::String domain, Swift::String machName)
{
  Swift::String *v2;
  SessionFoundation::XPCInterfaceDomain result;

  *v2 = domain;
  v2[1] = machName;
  result.machName = machName;
  result.domain = domain;
  return result;
}

Swift::Void __swiftcall BSServiceConnectionListenerConfiguring.setDomain(_:)(SessionFoundation::XPCInterfaceDomain a1)
{
  void *v1;
  id v2;

  v2 = (id)sub_1A471CCA4();
  objc_msgSend(v1, sel_setDomain_, v2);

}

uint64_t initializeBufferWithCopyOfBuffer for XPCInterfaceDomain(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for XPCInterfaceDomain()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for XPCInterfaceDomain(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

_QWORD *assignWithTake for XPCInterfaceDomain(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCInterfaceDomain(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for XPCInterfaceDomain(uint64_t result, int a2, int a3)
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

uint64_t dispatch thunk of static XPCInterfaceDefinition.domain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static XPCInterfaceDefinition.serviceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

unint64_t static NotificationName.stuckClient.getter()
{
  return 0xD000000000000021;
}

ValueMetadata *type metadata accessor for NotificationName()
{
  return &type metadata for NotificationName;
}

uint64_t Publisher.catchAndConsume(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v11 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v11 + 16))(v13, v5);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a5, v13, a3);
  v15 = (_QWORD *)(a5 + *(int *)(type metadata accessor for CatchAndConsume(0, a3, a4, v14) + 36));
  *v15 = a1;
  v15[1] = a2;
  return swift_retain();
}

uint64_t CatchAndConsume.init(upstream:errorHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(a6, a1, a4);
  result = type metadata accessor for CatchAndConsume(0, a4, a5, v11);
  v13 = (_QWORD *)(a6 + *(int *)(result + 36));
  *v13 = a2;
  v13[1] = a3;
  return result;
}

uint64_t type metadata accessor for CatchAndConsume(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CatchAndConsume);
}

uint64_t CatchAndConsume.upstream.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t CatchAndConsume.errorHandler.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  swift_retain();
  return v2;
}

void CatchAndConsume.receive<A>(subscriber:)(uint64_t a1)
{
  MEMORY[0x1E0C80A78](a1);
  type metadata accessor for CatchAndConsume.Inner();
}

void sub_1A471B944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;

  MEMORY[0x1E0C80A78](a1);
  v14 = (char *)&a9 - v13;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v11, *(_QWORD *)(v12 - 128), v9);
  swift_retain();
  sub_1A471BA20(v11, v9, (uint64_t)v14);
}

uint64_t sub_1A471B9BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x1A85A0860](&unk_1A471D8B8, v1);
  sub_1A471CC38();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void type metadata accessor for CatchAndConsume.Inner()
{
  JUMPOUT(0x1A85A080CLL);
}

void sub_1A471BA20(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for CatchAndConsume.Inner();
}

uint64_t sub_1A471BA84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + *(int *)(a1 + 52));
  *v4 = v2;
  v4[1] = v1;
  return sub_1A471CBD8();
}

void sub_1A471BAB8(_QWORD *a1@<X8>)
{
  a1[3] = MEMORY[0x1E0DEA968];
  *a1 = 0x646E416863746143;
  a1[1] = 0xEF656D75736E6F43;
}

uint64_t sub_1A471BAEC()
{
  return sub_1A471CBFC();
}

uint64_t sub_1A471BAFC()
{
  return sub_1A471CC08();
}

uint64_t sub_1A471BB0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE v16[16];

  v3 = v2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v7 = sub_1A471CC14();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = &v16[-v10];
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](v9);
  v14 = &v16[-v13];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v11, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 32))(v14, v11, AssociatedTypeWitness);
    (*(void (**)(_BYTE *))(v3 + *(int *)(a2 + 52)))(v14);
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, AssociatedTypeWitness);
  }
  v16[15] = 1;
  return sub_1A471CBF0();
}

uint64_t sub_1A471BCB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 56);
  v5 = sub_1A471CBE4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

void sub_1A471BCF0(uint64_t a1)
{
  CatchAndConsume.receive<A>(subscriber:)(a1);
}

uint64_t sub_1A471BD04()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1A471BD0C()
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

uint64_t *sub_1A471BD84(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v11 = v10[1];
    v12 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v12 = *v10;
    v12[1] = v11;
  }
  swift_retain();
  return v4;
}

uint64_t sub_1A471BE34(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
  return swift_release();
}

uint64_t sub_1A471BE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  return a1;
}

uint64_t sub_1A471BED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A471BF40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_1A471BF9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_1A471C000(uint64_t a1, unsigned int a2, uint64_t a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A471C07C + 4 * byte_1A471D780[v10]))();
  }
}

void sub_1A471C100(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
    v9 = 0u;
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

void sub_1A471C1F4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x1A471C26CLL);
}

void sub_1A471C1FC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x1A471C204);
  JUMPOUT(0x1A471C26CLL);
}

void sub_1A471C244()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x1A471C26CLL);
}

void sub_1A471C24C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x1A471C26CLL);
}

uint64_t sub_1A471C254(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x1A471C26CLL);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x1A471C268);
    JUMPOUT(0x1A471C260);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t sub_1A471C284()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1A471C28C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = sub_1A471CBE4();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1A471C320(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = sub_1A471CBE4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || (((v10 + ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v10) + *(_QWORD *)(v9 + 64) <= 0x18
      ? (v12 = v11 > 7)
      : (v12 = 1),
        v12))
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + (((v11 | 7) + 16) & ~(unint64_t)(v11 | 7)));
    swift_retain();
  }
  else
  {
    v13 = v8;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v14 = (_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    v15 = (_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = ((unint64_t)v14 + v10 + 16) & ~v10;
    v18 = ((unint64_t)v15 + v10 + 16) & ~v10;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    swift_retain();
    v19(v17, v18, v13);
  }
  return a1;
}

uint64_t sub_1A471C44C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  v5 = sub_1A471CBE4();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((v4 + *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80), v5);
}

uint64_t sub_1A471C4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = sub_1A471CBE4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = ((unint64_t)v7 + v12 + 16) & ~v12;
  v14 = ((unint64_t)v8 + v12 + 16) & ~v12;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  swift_retain();
  v15(v13, v14, v10);
  return a1;
}

uint64_t sub_1A471C55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  v10 = sub_1A471CBE4();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

uint64_t sub_1A471C5F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = sub_1A471CBE4();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 32))(((unint64_t)v7 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_1A471C684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  swift_release();
  v9 = sub_1A471CBE4();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v10 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80), v9);
  return a1;
}

uint64_t sub_1A471C718(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v17;
  unsigned int v19;
  int v20;
  int v21;
  unint64_t *v22;
  unint64_t v23;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = sub_1A471CBE4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v7 <= v10)
    v11 = *(_DWORD *)(v9 + 84);
  else
    v11 = v7;
  if (v11 <= 0x7FFFFFFF)
    v12 = 0x7FFFFFFF;
  else
    v12 = v11;
  if (!a2)
    return 0;
  v13 = *(_QWORD *)(v6 + 64);
  v14 = *(unsigned __int8 *)(v9 + 80);
  if (a2 <= v12)
    goto LABEL_27;
  v15 = ((v14 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v14) + *(_QWORD *)(v9 + 64);
  v16 = 8 * v15;
  if (v15 <= 3)
  {
    v19 = ((a2 - v12 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      v17 = *(_DWORD *)(a1 + v15);
      if (!v17)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      v17 = *(unsigned __int16 *)(a1 + v15);
      if (!*(_WORD *)(a1 + v15))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_27:
      if ((_DWORD)v7 == v12)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, v7, v5);
      v22 = (unint64_t *)((a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((v11 & 0x80000000) != 0)
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(((unint64_t)v22 + v14 + 16) & ~v14, v10, v8);
      v23 = *v22;
      if (v23 >= 0xFFFFFFFF)
        LODWORD(v23) = -1;
      return (v23 + 1);
    }
  }
  v17 = *(unsigned __int8 *)(a1 + v15);
  if (!*(_BYTE *)(a1 + v15))
    goto LABEL_27;
LABEL_18:
  v20 = (v17 - 1) << v16;
  if (v15 > 3)
    v20 = 0;
  if ((_DWORD)v15)
  {
    if (v15 <= 3)
      v21 = v15;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  return v12 + v20 + 1;
}

void sub_1A471C8F0(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  size_t v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(sub_1A471CBE4() - 8);
  if (v8 <= *(_DWORD *)(v9 + 84))
    v10 = *(_DWORD *)(v9 + 84);
  else
    v10 = v8;
  if (v10 <= 0x7FFFFFFF)
    v11 = 0x7FFFFFFF;
  else
    v11 = v10;
  v12 = ((*(unsigned __int8 *)(v9 + 80) + ((*(_QWORD *)(v7 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
      + *(_QWORD *)(v9 + 64);
  if (a3 <= v11)
  {
    v13 = 0u;
  }
  else if (v12 <= 3)
  {
    v15 = ((a3 - v11 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v13 = 4u;
    }
    else if (v15 >= 0x100)
    {
      v13 = 2;
    }
    else
    {
      v13 = v15 > 1;
    }
  }
  else
  {
    v13 = 1u;
  }
  if (v11 < a2)
  {
    v14 = ~v11 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        v16 = v14 & ~(-1 << (8 * v12));
        bzero(a1, v12);
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v12);
      *(_DWORD *)a1 = v14;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

void sub_1A471CB54()
{
  JUMPOUT(0x1A85A0860);
}

uint64_t sub_1A471CB64()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_1A471CB84()
{
  return 0x646E416863746143;
}

uint64_t sub_1A471CBA8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A471CBB4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A471CBC0()
{
  return MEMORY[0x1E0DF2250]();
}

uint64_t sub_1A471CBCC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A471CBD8()
{
  return MEMORY[0x1E0C95658]();
}

uint64_t sub_1A471CBE4()
{
  return MEMORY[0x1E0C95660]();
}

uint64_t sub_1A471CBF0()
{
  return MEMORY[0x1E0C95CD8]();
}

uint64_t sub_1A471CBFC()
{
  return MEMORY[0x1E0C95CE0]();
}

uint64_t sub_1A471CC08()
{
  return MEMORY[0x1E0C95CE8]();
}

uint64_t sub_1A471CC14()
{
  return MEMORY[0x1E0C95D20]();
}

uint64_t sub_1A471CC20()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1A471CC2C()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1A471CC38()
{
  return MEMORY[0x1E0C963D8]();
}

uint64_t sub_1A471CC44()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1A471CC50()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A471CC5C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A471CC68()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A471CC74()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1A471CC80()
{
  return MEMORY[0x1E0DEF6A0]();
}

uint64_t sub_1A471CC8C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1A471CC98()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1A471CCA4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A471CCB0()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1A471CCBC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A471CCC8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A471CCD4()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1A471CCE0()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A471CCEC()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1A471CCF8()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1A471CD04()
{
  return MEMORY[0x1E0DEAE90]();
}

uint64_t sub_1A471CD10()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1A471CD1C()
{
  return MEMORY[0x1E0DEAEB8]();
}

uint64_t sub_1A471CD28()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A471CD34()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1A471CD40()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1A471CD4C()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1A471CD58()
{
  return MEMORY[0x1E0DF06B8]();
}

uint64_t sub_1A471CD64()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1A471CD70()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A471CD7C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1A471CD88()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1A471CD94()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1A471CDA0()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A471CDAC()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1A471CDB8()
{
  return MEMORY[0x1E0DEF988]();
}

uint64_t sub_1A471CDC4()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1A471CDD0()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1A471CDDC()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1A471CDE8()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A471CDF4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A471CE00()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A471CE0C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A471CE18()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A471CE24()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A471CE30()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A471CE3C()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1A471CE48()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A471CE54()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A471CE60()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A471CE6C()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1A471CE78()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1A471CE84()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A471CE90()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A471CE9C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A471CEA8()
{
  return MEMORY[0x1E0DEE030]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
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

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}


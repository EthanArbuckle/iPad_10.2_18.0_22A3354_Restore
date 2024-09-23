uint64_t sub_243BD8184(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 88) = a1;
  swift_task_dealloc();
  swift_release();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_243BD8208()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE *v5;

  v1 = *(_QWORD **)(v0 + 88);
  if (v1[2] == 1)
  {
    v2 = v1[4];
    v3 = v1[5];
    sub_243B7FBDC(v2, v3);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v2, v3);
  }
  else
  {
    sub_243B9A688();
    swift_allocError();
    *v5 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t PhotosXPC.sendMessage(request:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_243BFD82C();
  v3[5] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v3[6] = sub_243BFD9F4();
  v3[7] = v4;
  return swift_task_switch();
}

uint64_t sub_243BD8388()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(char, uint64_t, uint64_t);

  v1 = v0[3];
  v2 = v0[2];
  swift_bridgeObjectRetain();
  v3 = sub_243BD788C(v2, v1);
  v5 = v4;
  v0[8] = v3;
  v0[9] = v4;
  v8 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2572EF9B0 + dword_2572EF9B0);
  v6 = (_QWORD *)swift_task_alloc();
  v0[10] = v6;
  *v6 = v0;
  v6[1] = sub_243BD8420;
  return v8(0, v3, v5);
}

uint64_t sub_243BD8420(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t (__cdecl *v10)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 72);
  v6 = *(_QWORD *)(*v2 + 64);
  v7 = *v2;
  swift_task_dealloc();
  sub_243B7FCC0(v6, v5);
  if (v1)
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v7 + 8))();
  }
  else
  {
    *(_QWORD *)(v4 + 88) = a1;
    v10 = (uint64_t (__cdecl *)())((char *)&dword_2572EF9B8 + dword_2572EF9B8);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v4 + 96) = v9;
    *v9 = v7;
    v9[1] = sub_243BD84E8;
    return v10();
  }
}

uint64_t sub_243BD84E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 104) = a1;
  swift_task_dealloc();
  swift_release();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_243BD8574()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;

  v1 = *(_QWORD **)(v0 + 104);
  if (v1[2] == 1)
  {
    v2 = v1[4];
    v3 = v1[5];
    sub_243B7FBDC(v2, v3);
    swift_bridgeObjectRelease();
    sub_243BFD820();
    result = sub_243BFD814();
    if (v5)
    {
      v6 = result;
      v7 = v5;
      sub_243B7FCC0(v2, v3);
      swift_task_dealloc();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v6, v7);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_243B9A688();
    swift_allocError();
    *v8 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t PhotosXPC.trackFace<A>(type:request:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 48) = a5;
  *(_QWORD *)(v6 + 56) = v5;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 40) = a4;
  *(_BYTE *)(v6 + 112) = a2;
  *(_QWORD *)(v6 + 24) = a1;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v6 + 64) = sub_243BFD9F4();
  *(_QWORD *)(v6 + 72) = v7;
  return swift_task_switch();
}

uint64_t sub_243BD8734()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(char, uint64_t, uint64_t);
  char v11[9];

  v1 = *(_BYTE *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 40);
  v11[0] = 2;
  v4 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v2 + 8) + 16))(v11, v3);
  *(_QWORD *)(v0 + 80) = v4;
  *(_QWORD *)(v0 + 88) = v5;
  v6 = v4;
  v7 = v5;
  v10 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2572EF9B0 + dword_2572EF9B0);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v8;
  *v8 = v0;
  v8[1] = sub_243BD8818;
  return v10(0x80D03u >> (8 * v1), v6, v7);
}

uint64_t sub_243BD8818(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *v2;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 88);
  if (v1)
  {
    sub_243B7FCC0(v5, v6);
    return (*(uint64_t (**)(void))(v4 + 8))();
  }
  else
  {
    *(_QWORD *)(v4 + 104) = a1;
    sub_243B7FCC0(v5, v6);
    return swift_task_switch();
  }
}

uint64_t sub_243BD889C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
  type metadata accessor for StoredPhoto(0);
  sub_243B9A6CC(&qword_2572EDD40, &qword_2572EDD38, (uint64_t)&protocol conformance descriptor for AsyncThrowingChannel<A, B>);
  sub_243BFE0C0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.untrackFace(type:request:)(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = v2;
  *(_BYTE *)(v3 + 56) = a1;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  sub_243BFD9F4();
  return swift_task_switch();
}

uint64_t sub_243BD89EC()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(char, uint64_t, uint64_t);

  v1 = 0x90E04u >> (8 * *(_BYTE *)(v0 + 56));
  v2 = UUID.serialized(version:)();
  v4 = v3;
  *(_QWORD *)(v0 + 32) = v2;
  *(_QWORD *)(v0 + 40) = v3;
  v7 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2572EF9B0 + dword_2572EF9B0);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  *v5 = v0;
  v5[1] = sub_243BD8A94;
  return v7(v1, v2, v4);
}

uint64_t sub_243BD8A94()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  sub_243B7FCC0(*(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
  if (!v0)
    swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t PhotosXPC.fetchFaceList<A>(type:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 16) = a2;
  *(_BYTE *)(v4 + 96) = a1;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v4 + 40) = sub_243BFD9F4();
  *(_QWORD *)(v4 + 48) = v5;
  return swift_task_switch();
}

uint64_t sub_243BD8BA4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  char *v4;

  v1 = 0xA0F05u >> (8 * *(_BYTE *)(v0 + 96));
  v4 = (char *)&dword_2572EF9B0 + dword_2572EF9B0;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_243BD8C28;
  return ((uint64_t (*)(uint64_t, _QWORD, unint64_t))v4)(v1, 0, 0xC000000000000000);
}

uint64_t sub_243BD8C28(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  uint64_t (__cdecl *v8)();

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 64) = a1;
  v8 = (uint64_t (__cdecl *)())((char *)&dword_2572EF9B8 + dword_2572EF9B8);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 72) = v7;
  *v7 = v5;
  v7[1] = sub_243BD8CCC;
  return v8();
}

uint64_t sub_243BD8CCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_243BD8D50()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _BYTE *v9;
  char v10[9];

  v1 = *(_QWORD **)(v0 + 80);
  if (v1[2] == 1)
  {
    v2 = *(_QWORD *)(v0 + 88);
    v3 = *(_QWORD *)(v0 + 16);
    v4 = *(_QWORD *)(v0 + 24);
    v5 = v1[4];
    v6 = v1[5];
    sub_243B7FBDC(v5, v6);
    swift_bridgeObjectRelease();
    v10[0] = 2;
    v7 = Array<A>.init(serialized:version:)(v5, v6, v10, v3, *(_QWORD *)(v4 + 8));
    if (!v2)
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  else
  {
    sub_243B9A688();
    swift_allocError();
    *v9 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.fetchFace(type:request:)(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 40) = v3;
  *(_BYTE *)(v4 + 112) = a2;
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 48) = type metadata accessor for FetchFaceRequestProto(0);
  *(_QWORD *)(v4 + 56) = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v4 + 64) = sub_243BFD9F4();
  *(_QWORD *)(v4 + 72) = v5;
  return swift_task_switch();
}

uint64_t sub_243BD8F18()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(char, uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v2;
  *(_BYTE *)(v4 + 24) = 2;
  sub_243B88508(&qword_2572ED610, type metadata accessor for FetchFaceRequestProto, (uint64_t)&protocol conformance descriptor for FetchFaceRequestProto);
  sub_243BFD4CC();
  swift_task_dealloc();
  v5 = sub_243BFD4A8();
  v7 = v6;
  *(_QWORD *)(v0 + 80) = v5;
  *(_QWORD *)(v0 + 88) = v6;
  sub_243B7FA20(v3, type metadata accessor for FetchFaceRequestProto);
  v10 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2572EF9B0 + dword_2572EF9B0);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v8;
  *v8 = v0;
  v8[1] = sub_243BD9084;
  return v10(0xB1006u >> (8 * v1), v5, v7);
}

uint64_t sub_243BD9084(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *v2;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 88);
  if (v1)
  {
    sub_243B7FCC0(v5, v6);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v4 + 8))();
  }
  else
  {
    *(_QWORD *)(v4 + 104) = a1;
    sub_243B7FCC0(v5, v6);
    return swift_task_switch();
  }
}

uint64_t sub_243BD9110()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
  type metadata accessor for StoredPhoto(0);
  sub_243B9A6CC(&qword_2572EDD40, &qword_2572EDD38, (uint64_t)&protocol conformance descriptor for AsyncThrowingChannel<A, B>);
  sub_243BFE0C0();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.provideAssetList<A>(type:id:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = v4;
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  *(_BYTE *)(v5 + 120) = a1;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v5 + 48) = sub_243BFD9F4();
  *(_QWORD *)(v5 + 56) = v6;
  return swift_task_switch();
}

uint64_t sub_243BD9270()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(char, uint64_t, uint64_t);
  char v10[9];

  v1 = *(_BYTE *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 24);
  v10[0] = 2;
  v4 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v2 + 8) + 16))(v10, v3);
  v6 = v5;
  *(_QWORD *)(v0 + 64) = v5;
  *(_QWORD *)(v0 + 72) = v4;
  v9 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2572EF9B0 + dword_2572EF9B0);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v7;
  *v7 = v0;
  v7[1] = sub_243BD9348;
  return v9(v1 + 18, v4, v6);
}

uint64_t sub_243BD9348(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t (__cdecl *v10)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 72);
  v6 = *(_QWORD *)(*v2 + 64);
  v7 = *v2;
  swift_task_dealloc();
  sub_243B7FCC0(v5, v6);
  if (v1)
    return (*(uint64_t (**)(void))(v7 + 8))();
  *(_QWORD *)(v4 + 88) = a1;
  v10 = (uint64_t (__cdecl *)())((char *)&dword_2572EF9B8 + dword_2572EF9B8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 96) = v9;
  *v9 = v7;
  v9[1] = sub_243BD9408;
  return v10();
}

uint64_t sub_243BD9408(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 104) = a1;
  *(_QWORD *)(v3 + 112) = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_243BD948C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _BYTE *v7;

  v1 = *(_QWORD **)(v0 + 104);
  if (v1[2] == 1)
  {
    v2 = *(_QWORD *)(v0 + 112);
    v3 = v1[4];
    v4 = v1[5];
    sub_243B7FBDC(v3, v4);
    swift_bridgeObjectRelease();
    v5 = sub_243BE5444(v3, v4);
    if (!v2)
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
  }
  else
  {
    sub_243B9A688();
    swift_allocError();
    *v7 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.fetchFaceByDay(type:request:)(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 24) = a2;
  *(_QWORD *)(v3 + 32) = v2;
  *(_BYTE *)(v3 + 144) = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFA08);
  *(_QWORD *)(v3 + 40) = v4;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 56) = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v3 + 64) = sub_243BFD9F4();
  *(_QWORD *)(v3 + 72) = v5;
  return swift_task_switch();
}

uint64_t sub_243BD9634()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(char, uint64_t, uint64_t);

  v1 = 0xC1107u >> (8 * *(_BYTE *)(v0 + 144));
  v2 = UUID.serialized(version:)();
  v4 = v3;
  *(_QWORD *)(v0 + 80) = v2;
  *(_QWORD *)(v0 + 88) = v3;
  v7 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2572EF9B0 + dword_2572EF9B0);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v5;
  *v5 = v0;
  v5[1] = sub_243BD96DC;
  return v7(v1, v2, v4);
}

uint64_t sub_243BD96DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD **)v2;
  *(_QWORD *)(*(_QWORD *)v2 + 104) = v1;
  swift_task_dealloc();
  v5 = v4[10];
  v6 = v4[11];
  if (!v1)
    v4[14] = a1;
  sub_243B7FCC0(v5, v6);
  return swift_task_switch();
}

uint64_t sub_243BD975C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v0[2] = v0[14];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
  sub_243B9A6CC(&qword_2572EDD40, &qword_2572EDD38, (uint64_t)&protocol conformance descriptor for AsyncThrowingChannel<A, B>);
  sub_243BFE0C0();
  v3 = (uint64_t (*)(void))((char *)&dword_2572EFA18 + dword_2572EFA18);
  v1 = (_QWORD *)swift_task_alloc();
  v0[15] = v1;
  *v1 = v0;
  v1[1] = sub_243BD9828;
  return v3();
}

uint64_t sub_243BD9828(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[16] = a1;
  v3[17] = v1;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v3[6] + 8))(v3[7], v3[5]);
  return swift_task_switch();
}

uint64_t sub_243BD98A0()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_243B7CE08(0, v2, 0);
    v3 = v16;
    v4 = *(_QWORD *)(v16 + 16);
    v5 = 16 * v4;
    v6 = (uint64_t *)(v1 + 40);
    do
    {
      v8 = *(v6 - 1);
      v7 = *v6;
      v16 = v3;
      v9 = v4 + 1;
      v10 = *(_QWORD *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v4 >= v10 >> 1)
      {
        sub_243B7CE08(v10 > 1, v9, 1);
        v3 = v16;
      }
      *(_QWORD *)(v3 + 16) = v9;
      v11 = v3 + v5;
      *(_QWORD *)(v11 + 32) = v8;
      *(_QWORD *)(v11 + 40) = v7;
      v5 += 16;
      v6 += 2;
      ++v4;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v3 + 16))
      goto LABEL_7;
  }
  else
  {
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    {
LABEL_7:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED108);
      v12 = sub_243BFDFDC();
      goto LABEL_10;
    }
  }
  v12 = MEMORY[0x24BEE4B00];
LABEL_10:
  v13 = *(_QWORD *)(v0 + 136);
  v16 = v12;
  sub_243BE5728(v3, 1, &v16);
  swift_bridgeObjectRelease();
  if (v13)
    return swift_release();
  v15 = v16;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
}

uint64_t sub_243BD9A40()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BD9A74()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BD9AA8(uint64_t a1, unint64_t a2, int a3)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t *v25;
  uint64_t v26;
  int64_t v27;
  unint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  unint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  int v59;
  char *v60;
  uint64_t v61;
  unint64_t *v62;
  int64_t v63;
  char *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;

  v59 = a3;
  v5 = sub_243BFD280();
  v56 = *(_QWORD *)(v5 - 8);
  v57 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v58 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = type metadata accessor for AlbumIDProto();
  MEMORY[0x24BDAC7A8](v61);
  v60 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v62 = (unint64_t *)((char *)&v48 - v9);
  v55 = type metadata accessor for AlbumID();
  v10 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v48 - v14;
  v16 = sub_243BFD3AC();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v20 = type metadata accessor for GenericListProto(0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = 0;
  v66 = 0u;
  v67 = 0u;
  sub_243B7FBDC(a1, a2);
  sub_243BFD3A0();
  sub_243B88508((unint64_t *)&qword_2572EE3F0, type metadata accessor for GenericListProto, (uint64_t)&protocol conformance descriptor for GenericListProto);
  v23 = v20;
  v24 = v65;
  sub_243BFD49C();
  if (v24)
  {
    sub_243B7FCC0(a1, a2);
  }
  else
  {
    v53 = v10;
    v54 = v18;
    v64 = v15;
    v52 = v12;
    v25 = v62;
    v26 = *(_QWORD *)v22;
    v27 = *(_QWORD *)(*(_QWORD *)v22 + 16);
    if (v27)
    {
      v65 = 0;
      v49 = v22;
      v50 = a1;
      v51 = a2;
      v69 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      v63 = v27;
      sub_243B7CDEC(0, v27, 0);
      v48 = v26;
      v28 = (unint64_t *)(v26 + 40);
      v29 = (uint64_t)v25;
      v30 = (uint64_t *)v60;
      v31 = v61;
      while (1)
      {
        v32 = *(v28 - 1);
        v33 = *v28;
        v62 = v28;
        v68 = 0;
        v66 = 0u;
        v67 = 0u;
        sub_243B7FBDC(v32, v33);
        sub_243B7FBDC(v32, v33);
        sub_243B7FBDC(v32, v33);
        sub_243BFD3A0();
        sub_243B88508(&qword_2572ED918, (uint64_t (*)(uint64_t))type metadata accessor for AlbumIDProto, (uint64_t)&protocol conformance descriptor for AlbumIDProto);
        v23 = v31;
        v34 = v65;
        sub_243BFD49C();
        if (v34)
          break;
        sub_243B6F8F0(v29, (uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for AlbumIDProto);
        v35 = v29;
        v36 = v30[2];
        v37 = v30[3];
        LOBYTE(v66) = v59;
        sub_243B7FBDC(v36, v37);
        v38 = v58;
        UUID.init(serialized:version:)(v36, v37);
        v65 = 0;
        v40 = *v30;
        v39 = v30[1];
        swift_bridgeObjectRetain();
        sub_243B7FA20((uint64_t)v30, (uint64_t (*)(_QWORD))type metadata accessor for AlbumIDProto);
        v41 = (uint64_t)v52;
        (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v52, v38, v57);
        sub_243B7FCC0(v32, v33);
        v42 = (_QWORD *)(v41 + *(int *)(v55 + 20));
        *v42 = v40;
        v42[1] = v39;
        sub_243B7FA20(v35, (uint64_t (*)(_QWORD))type metadata accessor for AlbumIDProto);
        sub_243B6F934(v41, (uint64_t)v64, (uint64_t (*)(_QWORD))type metadata accessor for AlbumID);
        sub_243B7FCC0(v32, v33);
        v23 = v69;
        v29 = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_243B7CDEC(0, *(_QWORD *)(v23 + 16) + 1, 1);
          v23 = v69;
        }
        v31 = v61;
        v43 = v62;
        v44 = v53;
        v46 = *(_QWORD *)(v23 + 16);
        v45 = *(_QWORD *)(v23 + 24);
        v30 = (uint64_t *)v60;
        if (v46 >= v45 >> 1)
        {
          sub_243B7CDEC(v45 > 1, v46 + 1, 1);
          v44 = v53;
          v23 = v69;
        }
        v28 = v43 + 2;
        *(_QWORD *)(v23 + 16) = v46 + 1;
        sub_243B6F934((uint64_t)v64, v23+ ((*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80))+ *(_QWORD *)(v44 + 72) * v46, (uint64_t (*)(_QWORD))type metadata accessor for AlbumID);
        if (!--v63)
        {
          swift_bridgeObjectRelease();
          sub_243B7FCC0(v50, v51);
          v22 = v49;
          goto LABEL_14;
        }
      }
      v65 = v34;
      sub_243B7FCC0(v32, v33);
      sub_243B7FCC0(v32, v33);
      swift_release();
      sub_243B7FCC0(v50, v51);
      swift_bridgeObjectRelease();
      sub_243B7FA20((uint64_t)v49, type metadata accessor for GenericListProto);
    }
    else
    {
      sub_243B7FCC0(a1, a2);
      v23 = MEMORY[0x24BEE4AF8];
LABEL_14:
      sub_243B7FA20((uint64_t)v22, type metadata accessor for GenericListProto);
    }
  }
  return v23;
}

uint64_t sub_243BDA040(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v3;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  char v48;
  uint64_t v49;
  int *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD v56[2];
  char *v57;
  uint64_t v58;
  unint64_t v59;
  int64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  int *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;

  LODWORD(v3) = a3;
  v69 = sub_243BFD280();
  v6 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v74 = (char *)v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = type metadata accessor for ShuffleIDProto();
  MEMORY[0x24BDAC7A8](v70);
  v73 = (uint64_t)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v75 = (uint64_t)v56 - v10;
  v11 = type metadata accessor for ShuffleID();
  v67 = *(_QWORD *)(v11 - 8);
  v68 = (int *)v11;
  MEMORY[0x24BDAC7A8](v11);
  v66 = (char *)v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v65 = (uint64_t)v56 - v14;
  v15 = sub_243BFD3AC();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v19 = type metadata accessor for GenericListProto(0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = 0;
  v77 = 0u;
  v78 = 0u;
  sub_243B7FBDC(a1, a2);
  sub_243BFD3A0();
  sub_243B88508((unint64_t *)&qword_2572EE3F0, type metadata accessor for GenericListProto, (uint64_t)&protocol conformance descriptor for GenericListProto);
  v22 = v19;
  v23 = v72;
  sub_243BFD49C();
  v24 = v23;
  if (v23)
  {
    sub_243B7FCC0(a1, a2);
  }
  else
  {
    v25 = a2;
    v64 = v17;
    v26 = *(_QWORD *)v21;
    v27 = *(_QWORD *)(*(_QWORD *)v21 + 16);
    if (v27)
    {
      v57 = v21;
      v59 = v25;
      v80 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_243B7CC80(0, v27, 0);
      v56[1] = v26;
      v28 = v26 + 32;
      v29 = 0;
      v63 = v28;
      v58 = a1;
      v30 = v70;
      v62 = v3;
      v61 = v6;
      v60 = v27;
      while (1)
      {
        v72 = v29;
        v31 = (uint64_t *)(v63 + 16 * v29);
        v33 = *v31;
        v32 = v31[1];
        v79 = 0;
        v77 = 0u;
        v78 = 0u;
        sub_243B7FBDC(v33, v32);
        sub_243B7FBDC(v33, v32);
        sub_243B7FBDC(v33, v32);
        sub_243BFD3A0();
        sub_243B88508(&qword_2572ED968, (uint64_t (*)(uint64_t))type metadata accessor for ShuffleIDProto, (uint64_t)&protocol conformance descriptor for ShuffleIDProto);
        v34 = v75;
        v22 = v30;
        sub_243BFD49C();
        if (v24)
          break;
        v35 = v34;
        v36 = v73;
        sub_243B6F8F0(v35, v73, (uint64_t (*)(_QWORD))type metadata accessor for ShuffleIDProto);
        v37 = *(_QWORD *)v36;
        v38 = *(_QWORD *)(v36 + 8);
        LOBYTE(v77) = v3;
        sub_243B7FBDC(v37, v38);
        UUID.init(serialized:version:)(v37, v38);
        v39 = *(_QWORD *)(v36 + 16);
        swift_bridgeObjectRetain();
        v40 = sub_243BFDB8C();
        v76 = v40;
        v41 = *(_QWORD *)(v39 + 16);
        v71 = 0;
        if (v41)
        {
          v42 = (uint64_t *)(v39 + 40);
          do
          {
            v43 = *(v42 - 1);
            v44 = *v42;
            swift_bridgeObjectRetain();
            sub_243BE44B4((uint64_t *)&v77, v43, v44);
            swift_bridgeObjectRelease();
            v42 += 2;
            --v41;
          }
          while (v41);
          swift_bridgeObjectRelease();
          v45 = v76;
          v36 = v73;
        }
        else
        {
          v45 = v40;
          swift_bridgeObjectRelease();
        }
        v46 = *(_BYTE *)(v36 + 24);
        v47 = *(_BYTE *)(v36 + 25);
        v48 = *(_BYTE *)(v36 + 26);
        sub_243B7FA20(v36, (uint64_t (*)(_QWORD))type metadata accessor for ShuffleIDProto);
        v49 = (uint64_t)v66;
        (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v66, v74, v69);
        sub_243B7FCC0(v33, v32);
        v50 = v68;
        *(_QWORD *)(v49 + v68[5]) = v45;
        *(_BYTE *)(v49 + v50[6]) = v46;
        *(_BYTE *)(v49 + v50[7]) = v47;
        *(_BYTE *)(v49 + v50[8]) = v48;
        sub_243B7FA20(v75, (uint64_t (*)(_QWORD))type metadata accessor for ShuffleIDProto);
        v51 = v65;
        sub_243B6F934(v49, v65, (uint64_t (*)(_QWORD))type metadata accessor for ShuffleID);
        sub_243B7FCC0(v33, v32);
        v22 = v80;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_243B7CC80(0, *(_QWORD *)(v22 + 16) + 1, 1);
          v22 = v80;
        }
        v30 = v70;
        v24 = v71;
        v52 = v67;
        v3 = *(_QWORD *)(v22 + 16);
        v53 = *(_QWORD *)(v22 + 24);
        if (v3 >= v53 >> 1)
        {
          sub_243B7CC80(v53 > 1, v3 + 1, 1);
          v22 = v80;
        }
        v54 = v72 + 1;
        *(_QWORD *)(v22 + 16) = v3 + 1;
        v29 = v54;
        sub_243B6F934(v51, v22+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(_QWORD *)(v52 + 72) * v3, (uint64_t (*)(_QWORD))type metadata accessor for ShuffleID);
        LOBYTE(v3) = v62;
        if (v29 == v60)
        {
          swift_bridgeObjectRelease();
          sub_243B7FCC0(v58, v59);
          v21 = v57;
          goto LABEL_19;
        }
      }
      sub_243B7FCC0(v33, v32);
      sub_243B7FCC0(v33, v32);
      swift_release();
      sub_243B7FCC0(v58, v59);
      swift_bridgeObjectRelease();
      sub_243B7FA20((uint64_t)v57, type metadata accessor for GenericListProto);
    }
    else
    {
      sub_243B7FCC0(a1, v25);
      v22 = MEMORY[0x24BEE4AF8];
LABEL_19:
      sub_243B7FA20((uint64_t)v21, type metadata accessor for GenericListProto);
    }
  }
  return v22;
}

uint64_t sub_243BDA6C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_243BDA6DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + 16);
  v0[5] = v2;
  v3 = *(_QWORD *)(v1 + 24);
  v0[6] = v3;
  swift_retain();
  swift_retain();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2572EFDF8 + dword_2572EFDF8);
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  *v4 = v0;
  v4[1] = sub_243BDA774;
  return v6((uint64_t)(v0 + 2), v2, v3);
}

uint64_t sub_243BDA774()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[9] = MEMORY[0x24BEE4AF8];
    v2[10] = v0;
  }
  else
  {
    v2[8] = MEMORY[0x24BEE4AF8];
  }
  return swift_task_switch();
}

uint64_t sub_243BDA7E4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  if (v1 >> 60 == 15)
  {
    swift_release();
    swift_release();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64));
  }
  else
  {
    sub_243B7FBDC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v5 = *(_QWORD **)(v0 + 64);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v5 = sub_243B6E500(0, v5[2] + 1, 1, v5);
    v7 = v5[2];
    v6 = v5[3];
    if (v7 >= v6 >> 1)
      v5 = sub_243B6E500((_QWORD *)(v6 > 1), v7 + 1, 1, v5);
    *(_QWORD *)(v0 + 88) = v5;
    v5[2] = v7 + 1;
    v8 = &v5[2 * v7];
    v8[4] = v2;
    v8[5] = v1;
    sub_243B924F0(v2, v1);
    v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2572EFDF8 + dword_2572EFDF8);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v9;
    *v9 = v0;
    v9[1] = sub_243BDA96C;
    return v10(v0 + 16, *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  }
}

uint64_t sub_243BDA924()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDA96C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  v3 = v2[11];
  if (v0)
  {
    v2[9] = v3;
    v2[10] = v0;
  }
  else
  {
    v2[8] = v3;
  }
  return swift_task_switch();
}

uint64_t sub_243BDA9D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[4] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFA08);
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFC18);
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_243BDAA68()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[6] + 16))(v0[7], v0[4], v0[5]);
  sub_243B9A6CC(&qword_2572EFC20, &qword_2572EFA08, MEMORY[0x24BEE7090]);
  sub_243BFDB14();
  v0[11] = sub_243B9A6CC(&qword_2572EFC28, &qword_2572EFC18, MEMORY[0x24BEE7070]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[12] = v1;
  *v1 = v0;
  v1[1] = sub_243BDAB40;
  return sub_243BFDA30();
}

uint64_t sub_243BDAB40()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[14] = v0;
    v4 = v2[9];
    v3 = v2[10];
    v5 = v2[8];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[13] = MEMORY[0x24BEE4AF8];
  }
  return swift_task_switch();
}

uint64_t sub_243BDABDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  if (v1)
  {
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v4 = *(_QWORD **)(v0 + 104);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v4 = sub_243B6E60C(0, v4[2] + 1, 1, v4);
    v6 = v4[2];
    v5 = v4[3];
    if (v6 >= v5 >> 1)
      v4 = sub_243B6E60C((_QWORD *)(v5 > 1), v6 + 1, 1, v4);
    *(_QWORD *)(v0 + 120) = v4;
    v4[2] = v6 + 1;
    v7 = &v4[2 * v6];
    v7[4] = v2;
    v7[5] = v1;
    swift_bridgeObjectRelease();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v8;
    *v8 = v0;
    v8[1] = sub_243BDAD5C;
    return sub_243BFDA30();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 104));
  }
}

uint64_t sub_243BDAD1C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDAD5C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[14] = v0;
    v4 = v2[9];
    v3 = v2[10];
    v5 = v2[8];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[13] = v2[15];
  }
  return swift_task_switch();
}

uint64_t sub_243BDADEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_243BDAE08()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void *, _QWORD);

  v3 = (uint64_t (*)(void *, _QWORD))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_243BDAE6C;
  return v3(&unk_2572EFCA0, *(_QWORD *)(v0 + 40));
}

uint64_t sub_243BDAE6C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BDAED0()
{
  uint64_t v0;

  sub_243BFA8D0(0, *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 40) + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDAF08()
{
  uint64_t v0;
  void *v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t j;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;

  v1 = *(void **)(v0 + 56);
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) + 16) + 64);
  v3 = v1;
  os_unfair_lock_lock(v2);
  v4 = sub_243BE8E88(v1);
  v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    v7 = *(_QWORD *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)(v4 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v10 = *(_QWORD *)(v6 + 16);
    v11 = *(void **)(v0 + 56);
    if (v10)
    {
      v12 = v11;
      swift_bridgeObjectRetain();
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)(v6 + 8 * j + 32))
        {
          v17 = *(void **)(v0 + 56);
          *(_QWORD *)(v0 + 16) = v17;
          v18 = v17;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
          v19 = sub_243BFE0CC();
          if (v19)
          {
            v14 = v19;

          }
          else
          {
            v14 = swift_allocError();
            *v15 = *(_QWORD *)(v0 + 16);
          }
          swift_allocError();
          *v16 = v14;
          swift_continuation_throwingResumeWithError();
        }
      }
      v11 = *(void **)(v0 + 56);
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = v11;
    }
    sub_243B6A1DC(v4);

    v9 = *(void **)(v0 + 56);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(void **)(v0 + 56);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDB104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_243BDB120()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void *, _QWORD);

  v3 = (uint64_t (*)(void *, _QWORD))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_243BDB184;
  return v3(&unk_2572EFB30, *(_QWORD *)(v0 + 40));
}

uint64_t sub_243BDB184()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BDB1E8()
{
  uint64_t v0;

  sub_243BFAB94(0, *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 40) + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDB220()
{
  uint64_t v0;
  void *v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t j;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;

  v1 = *(void **)(v0 + 56);
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 40) + 16) + 64);
  v3 = v1;
  os_unfair_lock_lock(v2);
  v4 = sub_243BE916C(v1);
  v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    v7 = *(_QWORD *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)(v4 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    v10 = *(_QWORD *)(v6 + 16);
    v11 = *(void **)(v0 + 56);
    if (v10)
    {
      v12 = v11;
      swift_bridgeObjectRetain();
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)(v6 + 8 * j + 32))
        {
          v17 = *(void **)(v0 + 56);
          *(_QWORD *)(v0 + 16) = v17;
          v18 = v17;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
          v19 = sub_243BFE0CC();
          if (v19)
          {
            v14 = v19;

          }
          else
          {
            v14 = swift_allocError();
            *v15 = *(_QWORD *)(v0 + 16);
          }
          swift_allocError();
          *v16 = v14;
          swift_continuation_throwingResumeWithError();
        }
      }
      v11 = *(void **)(v0 + 56);
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = v11;
    }
    sub_243B6A1DC(v4);

    v9 = *(void **)(v0 + 56);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(void **)(v0 + 56);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDB41C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_243BDB434()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char *v6;

  v1 = v0[3];
  v3 = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 24);
  v6 = (char *)&dword_2572EFE40 + dword_2572EFE40;
  v4 = (_QWORD *)swift_task_alloc();
  v0[4] = v4;
  *v4 = v0;
  v4[1] = sub_243BDB4A8;
  return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v6)(v0[2], v3, v2);
}

uint64_t sub_243BDB4A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

PhotosFace::XPCRequestType_optional __swiftcall XPCRequestType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 3;
  switch(rawValue)
  {
    case 0:
      goto LABEL_4;
    case 1:
      v2 = 1;
      goto LABEL_4;
    case 2:
      v2 = 2;
LABEL_4:
      v3 = v2;
      goto LABEL_5;
    case 10:
LABEL_5:
      *v1 = v3;
      break;
    case 11:
      *v1 = 4;
      break;
    case 12:
      *v1 = 5;
      break;
    case 13:
      *v1 = 6;
      break;
    case 14:
      *v1 = 7;
      break;
    case 21:
      *v1 = 8;
      break;
    case 22:
      *v1 = 9;
      break;
    case 23:
      *v1 = 10;
      break;
    case 24:
      *v1 = 11;
      break;
    case 25:
      *v1 = 12;
      break;
    case 31:
      *v1 = 13;
      break;
    case 32:
      *v1 = 14;
      break;
    case 33:
      *v1 = 15;
      break;
    case 34:
      *v1 = 16;
      break;
    case 35:
      *v1 = 17;
      break;
    case 36:
      *v1 = 18;
      break;
    case 37:
      *v1 = 19;
      break;
    case 38:
      *v1 = 20;
      break;
    default:
      *v1 = 21;
      break;
  }
  return (PhotosFace::XPCRequestType_optional)rawValue;
}

uint64_t XPCRequestType.rawValue.getter()
{
  char *v0;

  return qword_243C044D0[*v0];
}

BOOL sub_243BDB620(char *a1, char *a2)
{
  return qword_243C044D0[*a1] == qword_243C044D0[*a2];
}

uint64_t sub_243BDB644()
{
  sub_243BFE1A4();
  sub_243BFE1B0();
  return sub_243BFE1E0();
}

uint64_t sub_243BDB690()
{
  return sub_243BFE1B0();
}

uint64_t sub_243BDB6C4()
{
  sub_243BFE1A4();
  sub_243BFE1B0();
  return sub_243BFE1E0();
}

PhotosFace::XPCRequestType_optional sub_243BDB70C(Swift::Int *a1)
{
  return XPCRequestType.init(rawValue:)(*a1);
}

void sub_243BDB714(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_243C044D0[*v1];
}

uint64_t PhotosXPC.init(messageCenter:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t PhotosXPC.activate()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  sub_243BFD9F4();
  return swift_task_switch();
}

uint64_t sub_243BDB7DC()
{
  uint64_t v0;

  sub_243BDF6E0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerGeneratePhoto(callback:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = &unk_2572EFA30;
  *(_QWORD *)(v7 + 24) = v6;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *(_QWORD *)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFA38, v7, 1, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 48) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDB904(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 136) = a5;
  *(_QWORD *)(v6 + 144) = a6;
  *(_QWORD *)(v6 + 120) = a2;
  *(_QWORD *)(v6 + 128) = a3;
  *(_QWORD *)(v6 + 112) = a1;
  *(_BYTE *)(v6 + 192) = *a4;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v6 + 152) = sub_243BFD9F4();
  *(_QWORD *)(v6 + 160) = v7;
  return swift_task_switch();
}

uint64_t sub_243BDB9B8()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  _QWORD *v5;
  int *v7;

  v2 = v0[15];
  v1 = v0[16];
  sub_243B7FBDC(v2, v1);
  sub_243BB0FD8(v2, v1, v0 + 12);
  v3 = (int *)v0[17];
  v4 = v0[12];
  v0[21] = v4;
  v0[13] = v4;
  v7 = (int *)((char *)v3 + *v3);
  v5 = (_QWORD *)swift_task_alloc();
  v0[22] = v5;
  *v5 = v0;
  v5[1] = sub_243BDBA94;
  return ((uint64_t (*)(_QWORD *, _QWORD *))v7)(v0 + 2, v0 + 13);
}

uint64_t sub_243BDBA94()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_243BDBB08()
{
  uint64_t v0;
  char v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_BYTE *)(v0 + 192);
  v2 = *(uint64_t **)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v3);
  AsyncSequence.generic.getter(v3, v4, v0 + 56);
  *(_BYTE *)(swift_allocObject() + 16) = v1;
  v2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB88);
  v2[4] = sub_243B9A6CC(&qword_2572EFB90, &qword_2572EFB88, MEMORY[0x24BEE7090]);
  __swift_allocate_boxed_opaque_existential_1(v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB98);
  sub_243B9A6CC(&qword_2572EFBA0, &qword_2572EFB98, (uint64_t)&protocol conformance descriptor for WrapperSequence<A, B>);
  sub_243BFE0C0();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDBC30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDBC3C(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 + 48) = a3;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = type metadata accessor for GeneratePhotoResponseProto(0);
  v5 = swift_task_alloc();
  v6 = *a2;
  *(_QWORD *)(v3 + 32) = v5;
  *(_QWORD *)(v3 + 40) = v6;
  return swift_task_switch();
}

uint64_t sub_243BDBCA4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_BYTE *)(v0 + 48);
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v1;
  *(_BYTE *)(v3 + 24) = v2;
  sub_243B88508(&qword_2572ED720, type metadata accessor for GeneratePhotoResponseProto, (uint64_t)&protocol conformance descriptor for GeneratePhotoResponseProto);
  sub_243BFD4CC();
  swift_task_dealloc();
  v4 = sub_243BFD4A8();
  v6 = v5;
  v7 = *(uint64_t **)(v0 + 16);
  sub_243B7FA20(*(_QWORD *)(v0 + 32), type metadata accessor for GeneratePhotoResponseProto);
  *v7 = v4;
  v7[1] = v6;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.generatePhoto(request:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[3] = a1;
  v3[4] = v2;
  v3[5] = type metadata accessor for GeneratePhotoRequestProto(0);
  v5 = swift_task_alloc();
  v6 = *a2;
  v3[6] = v5;
  v3[7] = v6;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v3[8] = sub_243BFD9F4();
  v3[9] = v7;
  return swift_task_switch();
}

uint64_t sub_243BDBE84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(char, uint64_t, uint64_t);

  v2 = v0[6];
  v1 = v0[7];
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v1;
  *(_BYTE *)(v3 + 24) = 2;
  sub_243B88508(&qword_2572ED718, type metadata accessor for GeneratePhotoRequestProto, (uint64_t)&protocol conformance descriptor for GeneratePhotoRequestProto);
  sub_243BFD4CC();
  swift_task_dealloc();
  v4 = sub_243BFD4A8();
  v6 = v5;
  v0[10] = v4;
  v0[11] = v5;
  sub_243B7FA20(v2, type metadata accessor for GeneratePhotoRequestProto);
  v9 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2572EF9B0 + dword_2572EF9B0);
  v7 = (_QWORD *)swift_task_alloc();
  v0[12] = v7;
  *v7 = v0;
  v7[1] = sub_243BDBFD0;
  return v9(1, v4, v6);
}

uint64_t sub_243BDBFD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *v2;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 88);
  if (v1)
  {
    sub_243B7FCC0(v5, v6);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v4 + 8))();
  }
  else
  {
    *(_QWORD *)(v4 + 104) = a1;
    sub_243B7FCC0(v5, v6);
    return swift_task_switch();
  }
}

uint64_t sub_243BDC05C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 104);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
  sub_243B9A6CC(&qword_2572EDD40, &qword_2572EDD38, (uint64_t)&protocol conformance descriptor for AsyncThrowingChannel<A, B>);
  sub_243BFE0C0();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDC108(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  sub_243BFD3AC();
  *(_QWORD *)(v2 + 24) = swift_task_alloc();
  *(_QWORD *)(v2 + 32) = type metadata accessor for GeneratePhotoResponseProto(0);
  *(_QWORD *)(v2 + 40) = swift_task_alloc();
  *(_QWORD *)(v2 + 48) = swift_task_alloc();
  *(_OWORD *)(v2 + 56) = *a2;
  return swift_task_switch();
}

uint64_t sub_243BDC1A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _OWORD v7[2];
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  sub_243B7FBDC(v1, v2);
  sub_243BFD3A0();
  sub_243B88508(&qword_2572ED720, type metadata accessor for GeneratePhotoResponseProto, (uint64_t)&protocol conformance descriptor for GeneratePhotoResponseProto);
  sub_243BFD49C();
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD **)(v0 + 16);
  sub_243B6F8F0(v4, v3, type metadata accessor for GeneratePhotoResponseProto);
  LOBYTE(v7[0]) = 2;
  GeneratePhotoResponse.init(protobuf:version:)(v3, (unsigned __int8 *)v7, v5);
  sub_243B7FA20(v4, type metadata accessor for GeneratePhotoResponseProto);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerGenerateMask(callback:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = &unk_2572EFA58;
  *(_QWORD *)(v7 + 24) = v6;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *(_QWORD *)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFA60, v7, 2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 48) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDC3D4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 40) = a5;
  *(_QWORD *)(v6 + 48) = a6;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBF48);
  *(_QWORD *)(v6 + 56) = swift_task_alloc();
  *(_BYTE *)(v6 + 64) = *a4;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  sub_243BFD9F4();
  return swift_task_switch();
}

uint64_t sub_243BDC4B0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
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
  _QWORD *v21;

  v1 = *(_BYTE *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v7 = *(uint64_t **)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v3;
  *(_QWORD *)(v8 + 32) = v6;
  *(_QWORD *)(v8 + 40) = v4;
  *(_BYTE *)(v8 + 48) = v1;
  v7[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
  v7[4] = sub_243B9A6CC(&qword_2572EDD40, &qword_2572EDD38, (uint64_t)&protocol conformance descriptor for AsyncThrowingChannel<A, B>);
  v9 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ECD98);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 24) = 0;
  *(_QWORD *)(v10 + 16) = 0;
  swift_retain();
  sub_243B7FBDC(v6, v4);
  v11 = MEMORY[0x24BEE4AF8];
  v12 = sub_243BE2D00(MEMORY[0x24BEE4AF8]);
  v14 = v13;
  v15 = sub_243BE2B60(v11);
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB68);
  v18 = swift_allocObject();
  *(_DWORD *)(v18 + 64) = 0;
  *(_QWORD *)(v18 + 16) = v12;
  *(_QWORD *)(v18 + 24) = v14;
  v19 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v18 + 32) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v18 + 40) = v15;
  *(_QWORD *)(v18 + 48) = v17;
  *(_QWORD *)(v18 + 56) = v19;
  *(_QWORD *)(v9 + 16) = v18;
  *(_QWORD *)(v9 + 24) = v10;
  v20 = sub_243BFDA60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v2, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_2572EFB60;
  v21[5] = v8;
  v21[6] = v9;
  swift_retain();
  swift_retain();
  sub_243BD73EC(v2, (uint64_t)&unk_2572EFB70, (uint64_t)v21);
  swift_release();
  swift_release();
  *v7 = v9;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDC698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v7 + 161) = a7;
  *(_QWORD *)(v7 + 64) = a5;
  *(_QWORD *)(v7 + 72) = a6;
  *(_QWORD *)(v7 + 48) = a3;
  *(_QWORD *)(v7 + 56) = a4;
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  v8 = sub_243BFD280();
  *(_QWORD *)(v7 + 80) = v8;
  *(_QWORD *)(v7 + 88) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 96) = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v7 + 104) = sub_243BFD9F4();
  *(_QWORD *)(v7 + 112) = v9;
  return swift_task_switch();
}

uint64_t sub_243BDC770()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  int *v6;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  sub_243B7FBDC(v2, v1);
  UUID.init(serialized:version:)(v2, v1);
  v3 = *(int **)(v0 + 48);
  *(_BYTE *)(v0 + 160) = *(_BYTE *)(v0 + 161);
  v6 = (int *)((char *)v3 + *v3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v4;
  *v4 = v0;
  v4[1] = sub_243BDC83C;
  return ((uint64_t (*)(_QWORD, uint64_t))v6)(*(_QWORD *)(v0 + 96), v0 + 160);
}

uint64_t sub_243BDC83C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v6;
  int *v8;
  _QWORD *v9;
  uint64_t (*v10)(_QWORD *);

  v6 = (_QWORD *)*v3;
  v6[16] = a1;
  v6[17] = a2;
  v6[18] = v2;
  swift_task_dealloc();
  if (v2)
  {
    (*(void (**)(_QWORD, _QWORD))(v6[11] + 8))(v6[12], v6[10]);
    return swift_task_switch();
  }
  else
  {
    v8 = (int *)v6[4];
    (*(void (**)(_QWORD, _QWORD))(v6[11] + 8))(v6[12], v6[10]);
    v6[2] = a1;
    v6[3] = a2;
    v10 = (uint64_t (*)(_QWORD *))((char *)v8 + *v8);
    v9 = (_QWORD *)swift_task_alloc();
    v6[19] = v9;
    *v9 = v6;
    v9[1] = sub_243BDC91C;
    return v10(v6 + 2);
  }
}

uint64_t sub_243BDC91C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  sub_243B7FCC0(*(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 136));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_243BDC990()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerTrackFace<A, B>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v14;
  unsigned int v15;
  _QWORD *v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;

  v14 = *(_QWORD *)(v7 + 16);
  v15 = 0x80D03u >> (8 * a1);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a4;
  v16[3] = a5;
  v16[4] = a6;
  v16[5] = a7;
  v16[6] = a2;
  v16[7] = a3;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = &unk_2572EFA70;
  *(_QWORD *)(v17 + 24) = v16;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v20 = *(_QWORD *)(v14 + 48);
  *(_QWORD *)(v14 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFA78, v17, v15, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v14 + 48) = v20;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDCAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v8[9] = v11;
  v8[10] = v12;
  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  v8[11] = *(_QWORD *)(a7 - 8);
  v8[12] = swift_task_alloc();
  v8[13] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v8[14] = sub_243BFD9F4();
  v8[15] = v9;
  return swift_task_switch();
}

uint64_t sub_243BDCBE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, unint64_t, char *, uint64_t, uint64_t);
  _QWORD *v7;
  uint64_t (*v9)(_QWORD, _QWORD);
  char v10[9];

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v10[0] = 2;
  v5 = *(_QWORD *)(v1 + 8);
  v6 = *(void (**)(uint64_t, unint64_t, char *, uint64_t, uint64_t))(v5 + 8);
  sub_243B7FBDC(v4, v3);
  v6(v4, v3, v10, v2, v5);
  v9 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0 + 40) + *(_QWORD *)(v0 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v7;
  *v7 = v0;
  v7[1] = sub_243BDCCE8;
  return v9(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 96));
}

uint64_t sub_243BDCCE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_243BDCD70()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(v0 + 16);
  v2 = sub_243BFE0B4();
  v1[3] = v2;
  v1[4] = MEMORY[0x249502B6C](MEMORY[0x24BEE7090], v2);
  __swift_allocate_boxed_opaque_existential_1(v1);
  sub_243BFDB20();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDCE2C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDCE68(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  v2[4] = type metadata accessor for StoredPhotoProto(0);
  v2[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_243BDCEC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 24) = 2;
  sub_243B88508(&qword_2572ED710, type metadata accessor for StoredPhotoProto, (uint64_t)&protocol conformance descriptor for StoredPhotoProto);
  sub_243BFD4CC();
  swift_task_dealloc();
  v3 = sub_243BFD4A8();
  v5 = v4;
  v6 = *(uint64_t **)(v0 + 16);
  sub_243B7FA20(*(_QWORD *)(v0 + 40), type metadata accessor for StoredPhotoProto);
  *v6 = v3;
  v6[1] = v5;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDCFD4(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  sub_243BFD3AC();
  *(_QWORD *)(v2 + 24) = swift_task_alloc();
  *(_QWORD *)(v2 + 32) = type metadata accessor for StoredPhotoProto(0);
  *(_QWORD *)(v2 + 40) = swift_task_alloc();
  *(_QWORD *)(v2 + 48) = swift_task_alloc();
  *(_OWORD *)(v2 + 56) = *a2;
  return swift_task_switch();
}

uint64_t sub_243BDD06C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[2];
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  sub_243B7FBDC(v1, v2);
  sub_243BFD3A0();
  sub_243B88508(&qword_2572ED710, type metadata accessor for StoredPhotoProto, (uint64_t)&protocol conformance descriptor for StoredPhotoProto);
  sub_243BFD49C();
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 16);
  sub_243B6F8F0(v4, v3, type metadata accessor for StoredPhotoProto);
  LOBYTE(v7[0]) = 2;
  StoredPhoto.init(protobuf:version:)(v3, (unsigned __int8 *)v7, v5);
  sub_243B7FA20(v4, type metadata accessor for StoredPhotoProto);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerUntrackFace(type:callback:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  v6 = *(_QWORD *)(v3 + 16);
  v7 = 0x90E04u >> (8 * a1);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = &unk_2572EFA88;
  *(_QWORD *)(v9 + 24) = v8;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *(_QWORD *)(v6 + 48);
  *(_QWORD *)(v6 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFA90, v9, v7, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v6 + 48) = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDD2B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a2;
  v6[4] = a3;
  v6[2] = a1;
  v7 = sub_243BFD280();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v6[10] = sub_243BFD9F4();
  v6[11] = v8;
  return swift_task_switch();
}

uint64_t sub_243BDD388()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  sub_243B7FBDC(v2, v1);
  UUID.init(serialized:version:)(v2, v1);
  v5 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 40) + *(_QWORD *)(v0 + 40));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v3;
  *v3 = v0;
  v3[1] = sub_243BDD444;
  return v5(*(_QWORD *)(v0 + 72));
}

uint64_t sub_243BDD444()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_243BDD4CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 + 16);
  v1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB38);
  v1[4] = sub_243B9A6CC(&qword_2572EFB40, &qword_2572EFB38, (uint64_t)&protocol conformance descriptor for MakeThrowingSequence<A>);
  *v1 = MEMORY[0x24BEE4AF8];
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerFetchFaceList<A>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  unsigned int v11;
  _QWORD *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;

  v10 = *(_QWORD *)(v5 + 16);
  v11 = 0xA0F05u >> (8 * a1);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a2;
  v12[5] = a3;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_2572EFAA0;
  *(_QWORD *)(v13 + 24) = v12;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *(_QWORD *)(v10 + 48);
  *(_QWORD *)(v10 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFAA8, v13, v11, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v10 + 48) = v16;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDD668(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a1;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v8[7] = sub_243BFD9F4();
  v8[8] = v9;
  return swift_task_switch();
}

uint64_t sub_243BDD714()
{
  _QWORD *v0;
  int *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = (int *)v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED078);
  v2 = swift_allocObject();
  v0[9] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_243BFFAC0;
  v5 = (uint64_t (*)(void))((char *)v1 + *v1);
  v3 = (_QWORD *)swift_task_alloc();
  v0[10] = v3;
  *v3 = v0;
  v3[1] = sub_243BDD794;
  return v5();
}

uint64_t sub_243BDD794(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_243BDD808()
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
  _QWORD *v9;
  char v11[9];

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v11[0] = 2;
  v5 = Array<A>.serialized(version:)(v11, v2, v3, *(_QWORD *)(v4 + 8));
  v7 = v6;
  swift_bridgeObjectRelease();
  if (v1)
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 72) + 16) = 0;
    swift_release();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD **)(v0 + 16);
    *(_QWORD *)(v8 + 32) = v5;
    *(_QWORD *)(v8 + 40) = v7;
    v9[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB38);
    v9[4] = sub_243B9A6CC(&qword_2572EFB40, &qword_2572EFB38, (uint64_t)&protocol conformance descriptor for MakeThrowingSequence<A>);
    *v9 = v8;
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDD8D0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 72) + 16) = 0;
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerFetchFace<A>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  unsigned int v11;
  _QWORD *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;

  v10 = *(_QWORD *)(v5 + 16);
  v11 = 0xB1006u >> (8 * a1);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a2;
  v12[5] = a3;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_2572EFAB8;
  *(_QWORD *)(v13 + 24) = v12;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *(_QWORD *)(v10 + 48);
  *(_QWORD *)(v10 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFAC0, v13, v11, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v10 + 48) = v16;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDDA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  type metadata accessor for FetchFaceRequest();
  v8[9] = swift_task_alloc();
  v8[10] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v8[11] = sub_243BFD9F4();
  v8[12] = v9;
  return swift_task_switch();
}

uint64_t sub_243BDDB10()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  sub_243B7FBDC(v3, v2);
  sub_243BB11A0(v3, v2, 2, v1);
  v6 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0 + 40) + *(_QWORD *)(v0 + 40));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v4;
  *v4 = v0;
  v4[1] = sub_243BDDBD4;
  return v6(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 72));
}

uint64_t sub_243BDDBD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  sub_243B7FA20(v2, (uint64_t (*)(_QWORD))type metadata accessor for FetchFaceRequest);
  return swift_task_switch();
}

uint64_t sub_243BDDC50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(v0 + 16);
  v2 = sub_243BFE0B4();
  v1[3] = v2;
  v1[4] = MEMORY[0x249502B6C](MEMORY[0x24BEE7090], v2);
  __swift_allocate_boxed_opaque_existential_1(v1);
  sub_243BFDB20();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDDD08()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDDD44(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  v2[4] = type metadata accessor for StoredPhotoProto(0);
  v2[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_243BDDDA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v1;
  *(_BYTE *)(v2 + 24) = 2;
  sub_243B88508(&qword_2572ED710, type metadata accessor for StoredPhotoProto, (uint64_t)&protocol conformance descriptor for StoredPhotoProto);
  sub_243BFD4CC();
  swift_task_dealloc();
  v3 = sub_243BFD4A8();
  v5 = v4;
  v6 = *(uint64_t **)(v0 + 16);
  sub_243B7FA20(*(_QWORD *)(v0 + 40), type metadata accessor for StoredPhotoProto);
  *v6 = v3;
  v6[1] = v5;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDDEB0(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = *a2;
  return swift_task_switch();
}

uint64_t sub_243BDDED0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  sub_243B7FBDC(v1, v2);
  sub_243BB1434(v1, v2, 2, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerFetchFaceByDay(type:callback:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;

  v6 = *(_QWORD *)(v3 + 16);
  v7 = 0xC1107u >> (8 * a1);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = &unk_2572EFAD0;
  *(_QWORD *)(v9 + 24) = v8;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *(_QWORD *)(v6 + 48);
  *(_QWORD *)(v6 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFAD8, v9, v7, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v6 + 48) = v12;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDE044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a2;
  v6[4] = a3;
  v6[2] = a1;
  v7 = sub_243BFD280();
  v6[7] = v7;
  v6[8] = *(_QWORD *)(v7 - 8);
  v6[9] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v6[10] = sub_243BFD9F4();
  v6[11] = v8;
  return swift_task_switch();
}

uint64_t sub_243BDE118()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  sub_243B7FBDC(v2, v1);
  UUID.init(serialized:version:)(v2, v1);
  v5 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 40) + *(_QWORD *)(v0 + 40));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v3;
  *v3 = v0;
  v3[1] = sub_243BDE1D4;
  return v5(*(_QWORD *)(v0 + 72));
}

uint64_t sub_243BDE1D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *v2;
  v6 = *(_QWORD *)(*v2 + 64);
  v5 = *(_QWORD *)(*v2 + 72);
  v7 = *(_QWORD *)(*v2 + 56);
  *(_QWORD *)(*v2 + 104) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (!v1)
    *(_QWORD *)(v4 + 112) = a1;
  return swift_task_switch();
}

uint64_t sub_243BDE268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = sub_243BD7538(*(_QWORD *)(v0 + 112));
  swift_bridgeObjectRelease();
  if (!v1)
  {
    v3 = *(uint64_t **)(v0 + 16);
    v3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB38);
    v3[4] = sub_243B9A6CC(&qword_2572EFB40, &qword_2572EFB38, (uint64_t)&protocol conformance descriptor for MakeThrowingSequence<A>);
    *v3 = v2;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDE318()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDE34C(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  sub_243BFD3AC();
  *(_QWORD *)(v2 + 24) = swift_task_alloc();
  *(_QWORD *)(v2 + 32) = type metadata accessor for FetchByDayResponseProto(0);
  *(_QWORD *)(v2 + 40) = swift_task_alloc();
  *(_OWORD *)(v2 + 48) = *a2;
  return swift_task_switch();
}

uint64_t sub_243BDE3D4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unsigned int *v3;
  _QWORD *v4;
  _OWORD v6[2];
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 56);
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  sub_243B7FBDC(v1, v2);
  sub_243BFD3A0();
  sub_243B88508(&qword_2572ED618, type metadata accessor for FetchByDayResponseProto, (uint64_t)&protocol conformance descriptor for FetchByDayResponseProto);
  sub_243BFD49C();
  v3 = *(unsigned int **)(v0 + 40);
  v4 = *(_QWORD **)(v0 + 16);
  LOBYTE(v6[0]) = 2;
  FetchByDayResponse.init(protobuf:version:)(v3, (unsigned __int8 *)v6, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDE4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  v4[9] = *(_QWORD *)(type metadata accessor for StoredPhoto(0) - 8);
  v4[10] = swift_task_alloc();
  v4[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB18);
  v4[12] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFCA8);
  v4[13] = v5;
  v4[14] = *(_QWORD *)(v5 - 8);
  v4[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_243BDE58C()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[2] = v0[7];
  swift_bridgeObjectRetain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[16] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_243BDE5FC;
  return PhotosXPC.generatePhoto(request:)(v0[12], v0 + 2);
}

uint64_t sub_243BDE5FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_243BDE668()
{
  uint64_t v0;
  _QWORD *v1;

  sub_243B9A6CC(&qword_2572EFB10, &qword_2572EFB18, MEMORY[0x24BEE7090]);
  sub_243BFDB14();
  *(_QWORD *)(v0 + 144) = sub_243B9A6CC(&qword_2572EFCB0, &qword_2572EFCA8, MEMORY[0x24BEE7070]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v1;
  *v1 = v0;
  v1[1] = sub_243BDE740;
  return sub_243BFDA3C();
}

uint64_t sub_243BDE740()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BDE7A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int *v6;
  _QWORD *v7;
  _QWORD *v9;
  uint64_t (*v10)(_QWORD);

  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 160) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 16);
    *(_QWORD *)(v0 + 168) = v2;
    if (v2)
    {
      v4 = *(_QWORD *)(v0 + 72);
      v3 = *(_QWORD *)(v0 + 80);
      v5 = *(_DWORD *)(v4 + 80);
      *(_DWORD *)(v0 + 216) = v5;
      *(_QWORD *)(v0 + 176) = *(_QWORD *)(v4 + 72);
      *(_QWORD *)(v0 + 184) = 0;
      v6 = *(int **)(v0 + 40);
      sub_243B6F8F0(v1 + ((v5 + 32) & ~(unint64_t)v5), v3, type metadata accessor for StoredPhoto);
      v10 = (uint64_t (*)(_QWORD))((char *)v6 + *v6);
      v7 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 192) = v7;
      *v7 = v0;
      v7[1] = sub_243BDE904;
      return v10(*(_QWORD *)(v0 + 80));
    }
    else
    {
      swift_bridgeObjectRelease();
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 208) = v9;
      *v9 = v0;
      v9[1] = sub_243BDEA98;
      return sub_243BFDA3C();
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_243BDE904()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_243BDE970()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD);

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 184) + 1;
  sub_243B7FA20(*(_QWORD *)(v0 + 80), type metadata accessor for StoredPhoto);
  if (v2 == v1)
  {
    swift_bridgeObjectRelease();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v3;
    *v3 = v0;
    v3[1] = sub_243BDEA98;
    return sub_243BFDA3C();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 176);
    v6 = *(_QWORD *)(v0 + 184) + 1;
    *(_QWORD *)(v0 + 184) = v6;
    v7 = *(int **)(v0 + 40);
    sub_243B6F8F0(*(_QWORD *)(v0 + 160)+ ((*(unsigned __int8 *)(v0 + 216) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 216))+ v5 * v6, *(_QWORD *)(v0 + 80), type metadata accessor for StoredPhoto);
    v9 = (uint64_t (*)(_QWORD))((char *)v7 + *v7);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v8;
    *v8 = v0;
    v8[1] = sub_243BDE904;
    return v9(*(_QWORD *)(v0 + 80));
  }
}

uint64_t sub_243BDEA98()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BDEAFC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDEB58()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDEBBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  sub_243B7FA20(*(_QWORD *)(v0 + 80), type metadata accessor for StoredPhoto);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDEC38()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BDEC64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_243B6A428;
  return sub_243BDE4D8(a1, a2, v7, v6);
}

uint64_t PhotosXPC.registerProvideAssetList<A>(type:callback:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;

  v10 = *(_QWORD *)(v5 + 16);
  v11 = a1 + 18;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a2;
  v12[5] = a3;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = &unk_2572EFAE8;
  *(_QWORD *)(v13 + 24) = v12;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *(_QWORD *)(v10 + 48);
  *(_QWORD *)(v10 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFAF0, v13, v11, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v10 + 48) = v16;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDEDD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[7] = a7;
  v8[8] = a8;
  v8[5] = a5;
  v8[6] = a6;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  v8[9] = *(_QWORD *)(a7 - 8);
  v8[10] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v8[11] = sub_243BFD9F4();
  v8[12] = v9;
  return swift_task_switch();
}

uint64_t sub_243BDEEA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, unint64_t, char *, uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD);
  char v12[9];

  v2 = v0[7];
  v1 = v0[8];
  v4 = v0[3];
  v3 = v0[4];
  v12[0] = 2;
  v5 = *(_QWORD *)(v1 + 8);
  v6 = *(void (**)(uint64_t, unint64_t, char *, uint64_t, uint64_t))(v5 + 8);
  sub_243B7FBDC(v4, v3);
  v6(v4, v3, v12, v2, v5);
  v7 = (int *)v0[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED078);
  v8 = swift_allocObject();
  v0[13] = v8;
  *(_OWORD *)(v8 + 16) = xmmword_243BFFAC0;
  v11 = (uint64_t (*)(_QWORD))((char *)v7 + *v7);
  v9 = (_QWORD *)swift_task_alloc();
  v0[14] = v9;
  *v9 = v0;
  v9[1] = sub_243BDEFC0;
  return v11(v0[10]);
}

uint64_t sub_243BDEFC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 120) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 128) = a1;
  return swift_task_switch();
}

uint64_t sub_243BDF034()
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
  _QWORD *v12;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = sub_243BE6294(*(_QWORD *)(v0 + 128));
  v4 = v3;
  swift_bridgeObjectRelease();
  if (v1)
  {
    v6 = *(_QWORD *)(v0 + 72);
    v5 = *(_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(*(_QWORD *)(v0 + 104) + 16) = 0;
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 104);
    v9 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 80);
    v11 = *(_QWORD *)(v0 + 56);
    v12 = *(_QWORD **)(v0 + 16);
    *(_QWORD *)(v8 + 32) = v2;
    *(_QWORD *)(v8 + 40) = v4;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    v12[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB38);
    v12[4] = sub_243B9A6CC(&qword_2572EFB40, &qword_2572EFB38, (uint64_t)&protocol conformance descriptor for MakeThrowingSequence<A>);
    *v12 = v8;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDF124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(*(_QWORD *)(v0 + 104) + 16) = 0;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.registerSendMessage(callback:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = &unk_2572EFB00;
  *(_QWORD *)(v7 + 24) = v6;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *(_QWORD *)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0x8000000000000000;
  sub_243BA2BA4((uint64_t)&unk_2572EFB08, v7, 0, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 48) = v10;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_243BDF278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[5] = a5;
  v6[6] = a6;
  v6[3] = a2;
  v6[4] = a3;
  v6[2] = a1;
  sub_243BFD82C();
  v6[7] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v6[8] = sub_243BFD9F4();
  v6[9] = v7;
  return swift_task_switch();
}

uint64_t sub_243BDF344()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t, uint64_t);

  sub_243B7FBDC(v0[3], v0[4]);
  sub_243BFD820();
  result = sub_243BFD814();
  v0[10] = v2;
  if (v2)
  {
    v3 = result;
    v4 = v2;
    v5 = (int *)v0[5];
    sub_243B7FCC0(v0[3], v0[4]);
    v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
    v6 = (_QWORD *)swift_task_alloc();
    v0[11] = v6;
    *v6 = v0;
    v6[1] = sub_243BDF3F4;
    return v7(v3, v4);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_243BDF3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 96) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v6 + 104) = a2;
    *(_QWORD *)(v6 + 112) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_243BDF474()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(uint64_t **)(v0 + 16);
  v2 = sub_243BD788C(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 104));
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED078);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_243BFFAC0;
  *(_QWORD *)(v5 + 32) = v2;
  *(_QWORD *)(v5 + 40) = v4;
  v1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB38);
  v1[4] = sub_243B9A6CC(&qword_2572EFB40, &qword_2572EFB38, (uint64_t)&protocol conformance descriptor for MakeThrowingSequence<A>);
  *v1 = v5;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BDF530()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PhotosXPC.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t PhotosXPC.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_243BDF5B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  id v4;

  v1 = sub_243BFD5D4();
  MEMORY[0x24BDAC7A8](v1);
  result = 0;
  if (*(_BYTE *)(v0 + 64) == 1)
  {
    if (!*(_QWORD *)(v0 + 40))
    {
      sub_243BFD5F8();
      v3 = qword_2543CE220;
      swift_bridgeObjectRetain();
      if (v3 != -1)
        swift_once();
      v4 = (id)qword_2543CE210;
      sub_243BFD5C8();
      *(_QWORD *)(v0 + 40) = sub_243BFD5BC();
      swift_release();
    }
    return swift_retain();
  }
  return result;
}

void sub_243BDF6E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = sub_243BFD610();
  MEMORY[0x24BDAC7A8](v1);
  if ((*(_BYTE *)(v0 + 64) & 1) == 0)
  {
    v2 = qword_2543CE220;
    swift_bridgeObjectRetain();
    if (v2 != -1)
      swift_once();
    v3 = (void *)qword_2543CE210;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543CE488);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_243BFFAC0;
    v4 = v3;
    sub_243BFD604();
    sub_243B88508((unint64_t *)&unk_2543CE430, (uint64_t (*)(uint64_t))MEMORY[0x24BEE65F0], MEMORY[0x24BEE6600]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE448);
    sub_243B9A6CC(&qword_2543CE450, &qword_2543CE448, MEMORY[0x24BEE12C8]);
    sub_243BFDDC0();
    swift_allocObject();
    swift_weakInit();
    sub_243BFD664();
    swift_allocObject();
    *(_QWORD *)(v0 + 32) = sub_243BFD64C();
    swift_release();
  }
  if (*(_QWORD *)(v0 + 32))
  {
    swift_retain();
    sub_243BFD658();
    swift_release();
  }
}

uint64_t sub_243BDF914()
{
  char v1;

  sub_243BFD61C();
  if (v1 != 1)
    return sub_243BFD634();
  swift_retain();
  sub_243BFD628();
  return swift_release();
}

uint64_t sub_243BDF9C8(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 16) = a2;
  *(_BYTE *)(v4 + 48) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBF48);
  *(_QWORD *)(v4 + 40) = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  sub_243BFD9F4();
  return swift_task_switch();
}

uint64_t sub_243BDFA98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
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
  _QWORD *v19;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v5 = *(_BYTE *)(v0 + 48);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v2;
  *(_BYTE *)(v6 + 24) = v5;
  *(_QWORD *)(v6 + 32) = v4;
  *(_QWORD *)(v6 + 40) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
  v7 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ECD98);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 16) = 0;
  swift_retain();
  sub_243B7FBDC(v4, v3);
  v9 = MEMORY[0x24BEE4AF8];
  v10 = sub_243BE2D00(MEMORY[0x24BEE4AF8]);
  v12 = v11;
  v13 = sub_243BE2B60(v9);
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB68);
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 64) = 0;
  *(_QWORD *)(v16 + 16) = v10;
  *(_QWORD *)(v16 + 24) = v12;
  v17 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v16 + 32) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v16 + 40) = v13;
  *(_QWORD *)(v16 + 48) = v15;
  *(_QWORD *)(v16 + 56) = v17;
  *(_QWORD *)(v7 + 16) = v16;
  *(_QWORD *)(v7 + 24) = v8;
  v18 = sub_243BFDA60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v1, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2572EFC48;
  v19[5] = v6;
  v19[6] = v7;
  swift_retain();
  swift_retain();
  sub_243BD73EC(v1, (uint64_t)&unk_2572EFC50, (uint64_t)v19);
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t sub_243BDFC48(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 112) = a5;
  *(_QWORD *)(v6 + 120) = a6;
  *(_BYTE *)(v6 + 41) = a4;
  *(_QWORD *)(v6 + 96) = a2;
  *(_QWORD *)(v6 + 104) = a3;
  *(_QWORD *)(v6 + 88) = a1;
  sub_243BFD5D4();
  *(_QWORD *)(v6 + 128) = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  *(_QWORD *)(v6 + 136) = type metadata accessor for CommunicationActor();
  *(_QWORD *)(v6 + 144) = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v6 + 152) = sub_243BFD9F4();
  *(_QWORD *)(v6 + 160) = v7;
  return swift_task_switch();
}

uint64_t sub_243BDFD20()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = qword_243C044D0[*(char *)(v0 + 41)];
  sub_243B7FBDC(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v2;
  *v2 = v0;
  v2[1] = sub_243BDFD8C;
  return sub_243BE0770(v1, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), 0);
}

uint64_t sub_243BDFD8C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 176) = a1;
  *(_QWORD *)(v5 + 184) = a2;
  *(_BYTE *)(v5 + 42) = a3;
  *(_QWORD *)(v5 + 192) = v3;
  swift_task_dealloc();
  sub_243B7FCC0(*(_QWORD *)(v5 + 112), *(_QWORD *)(v5 + 120));
  if (!v3)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_243BDFE14()
{
  uint64_t v0;
  char v1;
  unint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_BYTE *)(v0 + 42);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 176);
    v2 = *(_QWORD *)(v0 + 184);
    sub_243B9A688();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    sub_243BE6C44(v3, v2, v1);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = *(unsigned int *)(v0 + 176);
    *(_BYTE *)(v0 + 43) = *(_BYTE *)(*(_QWORD *)(v0 + 104) + 64);
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 32) = 0;
    *(_QWORD *)(v0 + 16) = v6;
    *(_BYTE *)(v0 + 40) = 1;
    *(_QWORD *)(v0 + 200) = sub_243BFD9F4();
    *(_QWORD *)(v0 + 208) = v7;
    return swift_task_switch();
  }
}

uint64_t sub_243BDFF00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(v0 + 43) == 1)
  {
    v1 = *(_QWORD *)(v0 + 104);
    v2 = *(_QWORD *)(v0 + 192);
    *(int8x16_t *)(v0 + 216) = vextq_s8(*(int8x16_t *)(v0 + 200), *(int8x16_t *)(v0 + 200), 8uLL);
    v3 = *(_QWORD *)(v1 + 40);
    if (v3)
    {
LABEL_3:
      *(_QWORD *)(v0 + 232) = v3;
      v4 = swift_task_alloc();
      *(_QWORD *)(v0 + 240) = v4;
      *(_QWORD *)(v4 + 16) = v3;
      *(_QWORD *)(v4 + 24) = v0 + 16;
      swift_retain();
      v5 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 248) = v5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
      *v5 = v0;
      v5[1] = sub_243BE0128;
      return sub_243BFE114();
    }
    sub_243BFD5F8();
    v7 = qword_2543CE220;
    swift_bridgeObjectRetain();
    if (v7 != -1)
      swift_once();
    v8 = (id)qword_2543CE210;
    sub_243BFD5C8();
    v9 = sub_243BFD5BC();
    if (v2)
      return swift_unexpectedError();
    v10 = *(_QWORD *)(v0 + 104);
    *(_QWORD *)(v10 + 40) = v9;
    swift_release();
    v3 = *(_QWORD *)(v10 + 40);
    if (v3)
      goto LABEL_3;
  }
  return sub_243BFDF70();
}

uint64_t sub_243BE0128()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE0194()
{
  uint64_t v0;

  swift_release();
  *(_OWORD *)(v0 + 264) = *(_OWORD *)(v0 + 48);
  *(_BYTE *)(v0 + 44) = *(_BYTE *)(v0 + 64);
  return swift_task_switch();
}

void sub_243BE01E0()
{
  __asm { BR              X10 }
}

uint64_t sub_243BE021C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _BYTE *v3;

  v2 = *(_QWORD *)(v0 + 176);
  v1 = *(_QWORD *)(v0 + 184);
  sub_243B9A688();
  swift_allocError();
  *v3 = 1;
  swift_willThrow();
  sub_243BE6C44(v2, v1, 0);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE0300()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v1 = v0[33];
  v2 = v0[34];
  v3 = (int *)v0[11];
  v0[9] = v1;
  v0[10] = v2;
  sub_243B7FBDC(v1, v2);
  v6 = (uint64_t (*)(_QWORD *))((char *)v3 + *v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[35] = v4;
  *v4 = v0;
  v4[1] = sub_243BE03E8;
  return v6(v0 + 9);
}

uint64_t sub_243BE0368()
{
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE03A8()
{
  uint64_t v0;

  sub_243BE6C44(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184), 0);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE03E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE0448()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(unsigned int *)(v0 + 176);
  sub_243BE6C44(v1, v2, 1);
  sub_243BE6C44(v1, v2, 1);
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 16) = v3;
  *(_BYTE *)(v0 + 40) = 1;
  *(_QWORD *)(v0 + 296) = sub_243BFD9F4();
  *(_QWORD *)(v0 + 304) = v4;
  return swift_task_switch();
}

uint64_t sub_243BE04E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[37];
  v2 = v0[36];
  v0[27] = v0[38];
  v0[28] = v1;
  v3 = *(_QWORD *)(v0[13] + 40);
  if (v3)
    goto LABEL_2;
  sub_243BFD5F8();
  v7 = qword_2543CE220;
  swift_bridgeObjectRetain();
  if (v7 != -1)
    swift_once();
  v8 = (id)qword_2543CE210;
  sub_243BFD5C8();
  v9 = sub_243BFD5BC();
  if (v2)
    return swift_unexpectedError();
  v10 = v0[13];
  *(_QWORD *)(v10 + 40) = v9;
  swift_release();
  v3 = *(_QWORD *)(v10 + 40);
  if (v3)
  {
LABEL_2:
    v0[29] = v3;
    v4 = swift_task_alloc();
    v0[30] = v4;
    *(_QWORD *)(v4 + 16) = v3;
    *(_QWORD *)(v4 + 24) = v0 + 2;
    swift_retain();
    v5 = (_QWORD *)swift_task_alloc();
    v0[31] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
    *v5 = v0;
    v5[1] = sub_243BE0128;
    return sub_243BFE114();
  }
  return sub_243BFDF70();
}

uint64_t sub_243BE06FC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 184);
  sub_243BE6C44(v1, v2, 1);
  sub_243BE6C44(v1, v2, 1);
  sub_243BE6C44(v4, v3, 0);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE0770(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 + 72) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_BYTE *)(v5 + 40) = a4 & 1;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  *(_QWORD *)(v5 + 80) = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v5 + 88) = sub_243BFD9F4();
  *(_QWORD *)(v5 + 96) = v6;
  return swift_task_switch();
}

uint64_t sub_243BE0828()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = sub_243BDF5B0();
  v0[13] = v1;
  if (!v1)
    return sub_243BFDF70();
  v2 = v1;
  v3 = swift_task_alloc();
  v0[14] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v0 + 2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[15] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
  *v4 = v0;
  v4[1] = sub_243BE0964;
  return sub_243BFE114();
}

uint64_t sub_243BE0964()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE09D0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(unsigned __int8 *)(v0 + 64));
}

uint64_t sub_243BE0A0C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE0A48(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;

  v2 = sub_243BFD688();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBF48);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBA8);
  sub_243B9A6CC(&qword_2572EFBB0, &qword_2572EFBA8, (uint64_t)&unk_243C04910);
  sub_243BFD67C();
  v45 = v8;
  v46 = v10;
  v47 = a1;
  v48 = v7;
  v11 = v53;
  if (v56 == 1)
  {
    v12 = sub_243BFDA60();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v48, 1, 1, v12);
    v13 = v2;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v47, v2);
    v14 = qword_2543CE238;
    v15 = v49;
    swift_retain();
    if (v14 != -1)
      swift_once();
    v16 = off_2543CE228;
    v17 = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
    v18 = (*(unsigned __int8 *)(v3 + 80) + 44) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v16;
    *(_QWORD *)(v19 + 24) = v17;
    *(_QWORD *)(v19 + 32) = v15;
    *(_DWORD *)(v19 + 40) = v11;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v19 + v18, (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    swift_retain();
    sub_243BD73EC((uint64_t)v48, (uint64_t)&unk_2572EFBD0, v19);
    swift_release();
  }
  else
  {
    v44 = v53;
    v21 = v54;
    v20 = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
    v22 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ECD98);
    v23 = swift_allocObject();
    *(_DWORD *)(v23 + 24) = 0;
    *(_QWORD *)(v23 + 16) = 0;
    sub_243B7FBDC(v21, v20);
    v24 = MEMORY[0x24BEE4AF8];
    v25 = sub_243BE2D00(MEMORY[0x24BEE4AF8]);
    v27 = v26;
    v28 = sub_243BE2B60(v24);
    v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB68);
    v31 = swift_allocObject();
    *(_DWORD *)(v31 + 64) = 0;
    *(_QWORD *)(v31 + 16) = v25;
    *(_QWORD *)(v31 + 24) = v27;
    v32 = MEMORY[0x24BEE4B08];
    *(_QWORD *)(v31 + 32) = MEMORY[0x24BEE4B08];
    *(_QWORD *)(v31 + 40) = v28;
    v33 = v20;
    *(_QWORD *)(v31 + 48) = v30;
    *(_QWORD *)(v31 + 56) = v32;
    *(_QWORD *)(v22 + 16) = v31;
    *(_QWORD *)(v22 + 24) = v23;
    v34 = v49;
    swift_retain();
    v35 = v46;
    sub_243BEA19C(v22, v46);
    swift_release();
    v36 = *(unsigned int *)((char *)v35 + *(int *)(v45 + 32));
    v37 = sub_243BFDA60();
    v38 = (uint64_t)v48;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v48, 1, 1, v37);
    swift_retain();
    sub_243B7FBDC(v21, v33);
    v39 = qword_2543CE238;
    swift_retain();
    if (v39 != -1)
      swift_once();
    v40 = off_2543CE228;
    v41 = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = v40;
    *(_QWORD *)(v42 + 24) = v41;
    *(_QWORD *)(v42 + 32) = v44;
    *(_DWORD *)(v42 + 40) = v36;
    *(_QWORD *)(v42 + 48) = v34;
    *(_QWORD *)(v42 + 56) = v21;
    *(_QWORD *)(v42 + 64) = v33;
    *(_QWORD *)(v42 + 72) = v22;
    swift_retain();
    sub_243BD73EC(v38, (uint64_t)&unk_2572EFBE0, v42);
    swift_release();
    v50 = v36;
    v51 = 0;
    v52 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
    sub_243B9A6CC(&qword_2572EFBF0, &qword_2572EFBE8, (uint64_t)&unk_243C048C0);
    sub_243BFD670();
    swift_release();
    sub_243B7FCC0(v21, v33);
    sub_243B6F978((uint64_t)v35, &qword_2572EBA10);
  }
  return sub_243BE6930(v53, v54, v55, v56);
}

uint64_t sub_243BE0F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  *(_QWORD *)(v8 + 304) = a8;
  *(_QWORD *)(v8 + 312) = v11;
  *(_QWORD *)(v8 + 288) = a6;
  *(_QWORD *)(v8 + 296) = a7;
  *(_DWORD *)(v8 + 444) = a5;
  *(_QWORD *)(v8 + 280) = a4;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  *(_QWORD *)(v8 + 320) = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v8 + 328) = sub_243BFD9F4();
  *(_QWORD *)(v8 + 336) = v9;
  return swift_task_switch();
}

uint64_t sub_243BE1038()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  char *v38;
  os_unfair_lock_s *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  id v47;
  uint64_t j;
  uint64_t v49;
  uint64_t *v50;
  id v51;
  uint64_t v52;
  _QWORD *v53;
  id v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  uint64_t v58[2];

  XPCRequestType.init(rawValue:)(*(_QWORD *)(v0 + 280));
  v1 = v58[0];
  v56 = (_QWORD *)(v0 + 248);
  if (LOBYTE(v58[0]) == 21)
  {
    if (qword_2543CD828 != -1)
      swift_once();
    v2 = sub_243BFD598();
    __swift_project_value_buffer(v2, (uint64_t)qword_2543CE350);
    v3 = sub_243BFD580();
    v4 = sub_243BFDCA0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = *(_DWORD *)(v0 + 444);
      v6 = *(_QWORD *)(v0 + 280);
      v7 = swift_slowAlloc();
      v8 = swift_slowAlloc();
      v58[0] = v8;
      *(_DWORD *)v7 = 67109378;
      *(_DWORD *)(v0 + 432) = v5;
      sub_243BFDD54();
      *(_WORD *)(v7 + 8) = 2080;
      *(_QWORD *)(v0 + 272) = v6;
      v9 = sub_243BFD838();
      *(_QWORD *)(v0 + 256) = sub_243B739A8(v9, v10, v58);
      sub_243BFDD54();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243B4B000, v3, v4, "XPC %u: Invalid message type: %s", (uint8_t *)v7, 0x12u);
      v11 = 1;
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v8, -1, -1);
      MEMORY[0x249502C5C](v7, -1, -1);

    }
    else
    {

      v11 = 1;
    }
    goto LABEL_19;
  }
  v12 = *(_QWORD *)(v0 + 288);
  swift_beginAccess();
  v13 = *(_QWORD *)(v12 + 48);
  if (!*(_QWORD *)(v13 + 16) || (v14 = sub_243B7D074(v58[0]), (v15 & 1) == 0))
  {
    if (qword_2543CD828 != -1)
      swift_once();
    v29 = sub_243BFD598();
    __swift_project_value_buffer(v29, (uint64_t)qword_2543CE350);
    v30 = sub_243BFD580();
    v31 = sub_243BFDCA0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = *(_DWORD *)(v0 + 444);
      v33 = swift_slowAlloc();
      v34 = swift_slowAlloc();
      v58[0] = v34;
      *(_DWORD *)v33 = 67109378;
      *(_DWORD *)(v0 + 436) = v32;
      sub_243BFDD54();
      *(_WORD *)(v33 + 8) = 2080;
      *(_BYTE *)(v0 + 449) = v1;
      v35 = sub_243BFD838();
      *(_QWORD *)(v0 + 224) = sub_243B739A8(v35, v36, v58);
      sub_243BFDD54();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243B4B000, v30, v31, "XPC %u: Couldn't find a registry for type: %s", (uint8_t *)v33, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v34, -1, -1);
      MEMORY[0x249502C5C](v33, -1, -1);
    }

    v11 = 2;
LABEL_19:
    sub_243BE6A34();
    v37 = (void *)swift_allocError();
    *v38 = v11;
    swift_willThrow();
    v39 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 312) + 16) + 64);
    v40 = v37;
    os_unfair_lock_lock(v39);
    v41 = sub_243BE916C(v37);
    v43 = v42;
    os_unfair_lock_unlock(v39);
    if (!v41)
    {
LABEL_37:

      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v55 = v0;
    v44 = *(_QWORD *)(v41 + 16);
    if (v44)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)(v41 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      v46 = *(_QWORD *)(v43 + 16);
      if (v46)
        goto LABEL_26;
    }
    else
    {
      swift_bridgeObjectRetain();
      v46 = *(_QWORD *)(v43 + 16);
      if (v46)
      {
LABEL_26:
        v47 = v37;
        swift_bridgeObjectRetain();
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)(v43 + 8 * j + 32))
          {
            *v56 = v37;
            v51 = v37;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
            v52 = sub_243BFE0CC();
            if (v52)
            {
              v49 = v52;

            }
            else
            {
              v49 = swift_allocError();
              *v53 = *v56;
            }
            swift_allocError();
            *v50 = v49;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
    }
    v54 = v37;
LABEL_36:
    sub_243B6A1DC(v41);

    swift_bridgeObjectRelease();
    v0 = v55;
    goto LABEL_37;
  }
  v16 = *(_QWORD *)(v13 + 56) + 16 * v14;
  v17 = *(int **)v16;
  *(_QWORD *)(v0 + 344) = *(_QWORD *)(v16 + 8);
  v18 = qword_2543CD828;
  swift_retain();
  if (v18 != -1)
    swift_once();
  v19 = sub_243BFD598();
  *(_QWORD *)(v0 + 352) = __swift_project_value_buffer(v19, (uint64_t)qword_2543CE350);
  v20 = sub_243BFD580();
  v21 = sub_243BFDC94();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = *(_DWORD *)(v0 + 444);
    v23 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v58[0] = v24;
    *(_DWORD *)v23 = 67109378;
    *(_DWORD *)(v0 + 440) = v22;
    sub_243BFDD54();
    *(_WORD *)(v23 + 8) = 2080;
    *(_BYTE *)(v0 + 448) = v1;
    v25 = sub_243BFD838();
    *(_QWORD *)(v0 + 240) = sub_243B739A8(v25, v26, v58);
    sub_243BFDD54();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243B4B000, v20, v21, "XPC %u: Starting to process request %s", (uint8_t *)v23, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x249502C5C](v24, -1, -1);
    MEMORY[0x249502C5C](v23, -1, -1);
  }

  *(_OWORD *)(v0 + 192) = *(_OWORD *)(v0 + 296);
  v57 = (uint64_t (*)(uint64_t, uint64_t))((char *)v17 + *v17);
  v27 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v27;
  *v27 = v0;
  v27[1] = sub_243BE1798;
  return v57(v0 + 16, v0 + 192);
}

uint64_t sub_243BE1798()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_243BE1804()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v0[29] = 0;
  v1 = v0[5];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[10] = swift_getAssociatedTypeWitness();
  v0[11] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  sub_243BFDB14();
  swift_task_dealloc();
  swift_beginAccess();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v0[10]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[47] = v5;
  *v5 = v0;
  v5[1] = sub_243BE1B80;
  return sub_243BFDA3C();
}

uint64_t sub_243BE1984()
{
  uint64_t v0;
  void *v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t j;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  swift_release();
  v1 = *(void **)(v0 + 368);
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 312) + 16) + 64);
  v3 = v1;
  os_unfair_lock_lock(v2);
  v4 = sub_243BE916C(v1);
  v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    v7 = *(_QWORD *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)(v4 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
        goto LABEL_8;
    }
    else
    {
      swift_bridgeObjectRetain();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        v20 = v0;
        v10 = (_QWORD *)(v0 + 248);
        v11 = v1;
        swift_bridgeObjectRetain();
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)(v6 + 8 * j + 32))
          {
            *v10 = v1;
            v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
            v17 = sub_243BFE0CC();
            if (v17)
            {
              v13 = v17;

            }
            else
            {
              v13 = swift_allocError();
              *v14 = *v10;
            }
            swift_allocError();
            *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        v0 = v20;
        goto LABEL_18;
      }
    }
    v18 = v1;
LABEL_18:
    sub_243B6A1DC(v4);

    swift_bridgeObjectRelease();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE1B80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_243BE1BE4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 392) = *(_QWORD *)(v0 + 144);
  *(_QWORD *)(v0 + 400) = v1;
  if (v1 >> 60 == 15)
  {
    v2 = *(_QWORD *)(v0 + 312);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    sub_243BFAB94(0, *(os_unfair_lock_s **)(v2 + 16));
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    (*(void (**)(void))(v0 + 8))();
  }
  else
  {
    v3 = (_QWORD *)(v0 + 232);
    v4 = sub_243BFD580();
    v5 = sub_243BFDC94();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = *(_DWORD *)(v0 + 444);
      v7 = swift_slowAlloc();
      *(_DWORD *)v7 = 67109376;
      *(_DWORD *)(v7 + 4) = v6;
      *(_WORD *)(v7 + 8) = 2048;
      *(_QWORD *)(v7 + 10) = *(_QWORD *)(v0 + 232);
      _os_log_impl(&dword_243B4B000, v4, v5, "XPC %u: Enqueuing message %ld", (uint8_t *)v7, 0x12u);
      MEMORY[0x249502C5C](v7, -1, -1);
    }

    if (__OFADD__(*v3, 1))
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v0 + 232) = *v3 + 1;
      swift_task_switch();
    }
  }
}

uint64_t sub_243BE1D24()
{
  uint64_t v0;
  void *v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t j;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v1 = *(void **)(v0 + 264);
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 312) + 16) + 64);
  v3 = v1;
  os_unfair_lock_lock(v2);
  v4 = sub_243BE916C(v1);
  v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    v7 = *(_QWORD *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)(v4 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
        goto LABEL_8;
    }
    else
    {
      swift_bridgeObjectRetain();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        v20 = v0;
        v10 = (_QWORD *)(v0 + 248);
        v11 = v1;
        swift_bridgeObjectRetain();
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)(v6 + 8 * j + 32))
          {
            *v10 = v1;
            v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
            v17 = sub_243BFE0CC();
            if (v17)
            {
              v13 = v17;

            }
            else
            {
              v13 = swift_allocError();
              *v14 = *v10;
            }
            swift_allocError();
            *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        v0 = v20;
        goto LABEL_18;
      }
    }
    v18 = v1;
LABEL_18:
    sub_243B6A1DC(v4);

    swift_bridgeObjectRelease();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE1F2C()
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
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  *(_OWORD *)(v0 + 160) = *(_OWORD *)(v0 + 392);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  v4 = *(_QWORD *)(v2 + 48);
  if (v4 < 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
    return swift_task_switch();
  }
  if (!*(_QWORD *)(v4 + 16))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
LABEL_13:
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
    v18 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v18 + 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v19;
    v19[2] = v2;
    v19[3] = v3;
    v19[4] = v0 + 160;
    v19[5] = v18;
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v20;
    v20[2] = v2;
    v20[3] = v3;
    v20[4] = v18;
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 424) = v21;
    *v21 = v0;
    v21[1] = sub_243BE214C;
    return sub_243BFE0FC();
  }
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = *(_QWORD *)(v2 + 32);
  v7 = *(_QWORD *)(v2 + 40);
  v9 = *(_QWORD *)(v2 + 56);
  *(_QWORD *)(v0 + 208) = v7;
  *(_QWORD *)(v0 + 216) = v4;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_11;
  }
  v10 = v9;
  v11 = *(_QWORD *)(v0 + 384);
  result = sub_243BFA7A4(v7 + 16, v7 + 32, v4, 0);
  if (!v11)
  {
    v13 = result;
    v9 = v10;
LABEL_11:
    sub_243BF54C8(0, v13);
    v15 = v14;
    v16 = *(_QWORD *)(v0 + 208);
    v17 = *(_QWORD *)(v0 + 216);
    *(_QWORD *)(v2 + 16) = v5;
    *(_QWORD *)(v2 + 24) = v6;
    *(_QWORD *)(v2 + 32) = v8;
    *(_QWORD *)(v2 + 40) = v16;
    *(_QWORD *)(v2 + 48) = v17;
    *(_QWORD *)(v2 + 56) = v9;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
    if (v15)
    {
      if (v15 == 1)
        goto LABEL_13;
      v22 = *(_QWORD *)(v0 + 160);
      v23 = *(_QWORD *)(v0 + 168);
      *(_QWORD *)(v0 + 176) = v22;
      *(_QWORD *)(v0 + 184) = v23;
      sub_243B7FBDC(v22, v23);
      sub_243B6F9B4(v0 + 176, *(_QWORD *)(*(_QWORD *)(v15 + 64) + 40), &qword_2572EFC08);
      swift_continuation_throwingResume();
    }
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_243BE214C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE21B4()
{
  return swift_task_switch();
}

uint64_t sub_243BE21C4()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_243B924F0(v0[49], v0[50]);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), v0[10]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[47] = v1;
  *v1 = v0;
  v1[1] = sub_243BE1B80;
  return sub_243BFDA3C();
}

uint64_t sub_243BE2274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)(v6 + 60) = a5;
  *(_QWORD *)(v6 + 136) = a4;
  *(_QWORD *)(v6 + 144) = a6;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v6 + 152) = sub_243BFD9F4();
  *(_QWORD *)(v6 + 160) = v7;
  return swift_task_switch();
}

uint64_t sub_243BE231C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, int);

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_DWORD *)(v0 + 60);
  swift_retain();
  v3 = sub_243BEA458(v2);
  swift_release();
  if (qword_2543CD828 != -1)
    swift_once();
  v4 = sub_243BFD598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2543CE350);
  v5 = sub_243BFD580();
  v6 = sub_243BFDC94();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_DWORD *)(v0 + 60);
    v8 = swift_slowAlloc();
    *(_DWORD *)v8 = 67109376;
    *(_DWORD *)(v0 + 36) = v7;
    sub_243BFDD54();
    *(_WORD *)(v8 + 8) = 2048;
    *(_QWORD *)(v0 + 128) = v3;
    sub_243BFDD54();
    _os_log_impl(&dword_243B4B000, v5, v6, "XPC %u: Reading message %ld", (uint8_t *)v8, 0x12u);
    MEMORY[0x249502C5C](v8, -1, -1);
  }

  *(_QWORD *)(v0 + 168) = *(_QWORD *)(v1 + 56);
  v11 = (uint64_t (*)(uint64_t, int))((char *)&dword_2572EFDF0 + dword_2572EFDF0);
  swift_retain();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v9;
  *v9 = v0;
  v9[1] = sub_243BE24E4;
  return v11(v0 + 88, *(_DWORD *)(v0 + 60));
}

uint64_t sub_243BE24E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_243BE2550()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 96);
  if (v1 >> 60 == 15)
  {
    *(_QWORD *)(v0 + 16) = 0;
    *(_QWORD *)(v0 + 24) = 0;
    *(_BYTE *)(v0 + 32) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
    sub_243B9A6CC(&qword_2572EFBF0, &qword_2572EFBE8, (uint64_t)&unk_243C048C0);
    sub_243BFD670();
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 40) = v2;
    *(_QWORD *)(v0 + 48) = v1;
    *(_BYTE *)(v0 + 56) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
    sub_243B9A6CC(&qword_2572EFBF0, &qword_2572EFBE8, (uint64_t)&unk_243C048C0);
    sub_243BFD670();
    sub_243B924F0(v2, v1);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE2648()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 184);
  swift_release();
  *(_QWORD *)(v0 + 104) = 0;
  *(_QWORD *)(v0 + 112) = 0xE000000000000000;
  *(_QWORD *)(v0 + 120) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
  sub_243BFDF40();
  v2 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 72) = v2;
  *(_BYTE *)(v0 + 80) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
  sub_243B9A6CC(&qword_2572EFBF0, &qword_2572EFBE8, (uint64_t)&unk_243C048C0);
  sub_243BFD670();

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE273C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_243B613CC;
  return v6(a1);
}

uint64_t sub_243BE27A0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_243BFD8B0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x249501C48](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_243BE2818(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_243BE2E88();
  v4 = sub_243BE315C(&v11, a1, 0, 1, v3, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_243B6E2C0);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = v11;
  if (v11 == v5)
    return v4;
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 < v11)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    v9 = sub_243B930D4(a1, v1, 0, (2 * v6) | 1);
    goto LABEL_9;
  }
  v1 = a1 + 32;
  sub_243BFE108();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
  }
  v8 = *(_QWORD *)(v7 + 16);
  swift_release();
  if (v8 != v6)
    goto LABEL_14;
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  result = swift_bridgeObjectRelease();
  v12 = v4;
  v13 = v9;
  if (*(_QWORD *)(a1 + 16) >= v5)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_243BE37C8(a1, v1, v6, (2 * v5) | 1, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_243B7CD7C, (uint64_t (*)(_QWORD *, uint64_t, _QWORD, uint64_t))sub_243BF3918);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE29B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = sub_243BE2E88();
  v4 = sub_243BE2E90(&v12, a1, 0, 1, v3);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = v12;
  if (v12 == v5)
    return v4;
  if ((v12 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 < v12)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    v10 = sub_243B930E0(a1, v1, 0, (2 * v6) | 1);
    goto LABEL_9;
  }
  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090) - 8) + 80);
  v1 = a1 + ((v7 + 32) & ~v7);
  sub_243BFE108();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v8 = swift_dynamicCastClass();
  if (!v8)
  {
    swift_bridgeObjectRelease();
    v8 = MEMORY[0x24BEE4AF8];
  }
  v9 = *(_QWORD *)(v8 + 16);
  swift_release();
  if (v9 != v6)
    goto LABEL_14;
  v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  result = swift_bridgeObjectRelease();
  v13 = v4;
  v14 = v10;
  if (*(_QWORD *)(a1 + 16) >= v5)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_243BE34E0(a1, v1, v6, (2 * v5) | 1);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE2B60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_243BE2E88();
  v4 = sub_243BE315C(&v11, a1, 0, 1, v3, (uint64_t (*)(_QWORD, _QWORD, _QWORD))sub_243B6E2E0);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = v11;
  if (v11 == v5)
    return v4;
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 < v11)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    v9 = sub_243B932B0(a1, v1, 0, (2 * v6) | 1);
    goto LABEL_9;
  }
  v1 = a1 + 32;
  sub_243BFE108();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
  }
  v8 = *(_QWORD *)(v7 + 16);
  swift_release();
  if (v8 != v6)
    goto LABEL_14;
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  result = swift_bridgeObjectRelease();
  v12 = v4;
  v13 = v9;
  if (*(_QWORD *)(a1 + 16) >= v5)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_243BE37C8(a1, v1, v6, (2 * v5) | 1, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_243B7CDD0, (uint64_t (*)(_QWORD *, uint64_t, _QWORD, uint64_t))sub_243BF3918);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE2D00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_243BE2E88();
  v4 = sub_243BE3320(&v11, a1, 0, 1, v3);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = v11;
  if (v11 == v5)
    return v4;
  if ((v11 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v5 < v11)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    swift_bridgeObjectRelease();
    v9 = sub_243B93420(a1, v1, 0, (2 * v6) | 1);
    goto LABEL_9;
  }
  v1 = a1 + 32;
  sub_243BFE108();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  v7 = swift_dynamicCastClass();
  if (!v7)
  {
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
  }
  v8 = *(_QWORD *)(v7 + 16);
  swift_release();
  if (v8 != v6)
    goto LABEL_14;
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  result = swift_bridgeObjectRelease();
  v12 = v4;
  v13 = v9;
  if (*(_QWORD *)(a1 + 16) >= v5)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_243BE3B64(a1, v1, v6, (2 * v5) | 1);
    swift_bridgeObjectRelease_n();
    swift_release();
    return v12;
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE2E88()
{
  return 0;
}

uint64_t sub_243BE2E90(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (uint64_t *)((char *)&v36 - v15);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (uint64_t *)((char *)&v36 - v19);
  v21 = *(_QWORD *)(a2 + 16);
  v22 = MEMORY[0x2495016E4](v21, v18);
  if ((a4 & 1) != 0)
    v23 = 0;
  else
    v23 = a3;
  if (v23 <= v22)
    v23 = v22;
  if (v23 <= a5)
    v24 = a5;
  else
    v24 = v23;
  if (v24 > 4)
  {
    v25 = MEMORY[0x2495016F0]();
    sub_243BE3F60(&v41, a2, (_QWORD *)(v25 + 16), v25 + 32);
    *a1 = v41;
  }
  else if (v21 >= 2)
  {
    result = sub_243B6E2CC(0, v21, 0, MEMORY[0x24BEE4AF8]);
    v27 = result;
    v28 = 0;
    v40 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v38 = v21;
    v39 = a2 + v40;
    v29 = *(_QWORD *)(v11 + 72);
    v36 = v13;
    v37 = a1;
    while (1)
    {
      if (v28 == v21)
      {
        __break(1u);
        return result;
      }
      sub_243BE6E08(v39 + v29 * v28, (uint64_t)v20);
      v30 = *(_QWORD *)(v27 + 16);
      if (v30)
        break;
LABEL_20:
      sub_243BE6E08((uint64_t)v20, (uint64_t)v13);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v27 = sub_243B6E2CC(0, *(_QWORD *)(v27 + 16) + 1, 1, v27);
      v35 = *(_QWORD *)(v27 + 16);
      v34 = *(_QWORD *)(v27 + 24);
      if (v35 >= v34 >> 1)
        v27 = sub_243B6E2CC(v34 > 1, v35 + 1, 1, v27);
      ++v28;
      *(_QWORD *)(v27 + 16) = v35 + 1;
      sub_243B6F9B4((uint64_t)v13, v27 + v40 + v35 * v29, &qword_2572ED090);
      result = sub_243B6F978((uint64_t)v20, &qword_2572ED090);
      v21 = v38;
      if (v28 == v38)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    v31 = v27 + v40;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_243BE6E08(v31, (uint64_t)v16);
      v32 = *v16;
      v33 = *v20;
      sub_243B6F978((uint64_t)v16, &qword_2572ED090);
      if (v32 == v33)
        break;
      v31 += v29;
      if (!--v30)
      {
        swift_bridgeObjectRelease();
        v13 = v36;
        a1 = v37;
        goto LABEL_20;
      }
    }
    swift_bridgeObjectRelease();
    sub_243B6F978((uint64_t)v20, &qword_2572ED090);
    swift_bridgeObjectRelease();
    v25 = 0;
    *v37 = v28;
  }
  else
  {
LABEL_11:
    v25 = 0;
    *a1 = v21;
  }
  return v25;
}

uint64_t sub_243BE315C(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t (*a6)(_QWORD, _QWORD, _QWORD))
{
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  __int128 v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  unint64_t v28;

  v12 = *(_QWORD *)(a2 + 16);
  v13 = MEMORY[0x2495016E4](v12);
  if ((a4 & 1) != 0)
    v14 = 0;
  else
    v14 = a3;
  if (v14 <= v13)
    v14 = v13;
  if (v14 <= a5)
    v15 = a5;
  else
    v15 = v14;
  if (v15 > 4)
  {
    v16 = MEMORY[0x2495016F0]();
    sub_243BE41EC(&v28, a2, (_QWORD *)(v16 + 16));
    *a1 = v28;
    return v16;
  }
  if (v12 < 2)
  {
LABEL_11:
    v16 = 0;
    *a1 = v12;
    return v16;
  }
  result = ((uint64_t (*)(_QWORD, unint64_t, _QWORD, _QWORD))a6)(0, v12, 0, MEMORY[0x24BEE4AF8]);
  v18 = (_QWORD *)result;
  v19 = 0;
  v20 = a2 + 32;
  while (v19 != v12)
  {
    v21 = *(_OWORD *)(v20 + 16 * v19);
    v22 = v18[2];
    if (v22)
    {
      if (v18[4] == (_QWORD)v21)
        goto LABEL_28;
      if (v22 != 1)
      {
        if (v18[6] == (_QWORD)v21)
        {
LABEL_28:
          swift_bridgeObjectRelease();
          v16 = 0;
          *a1 = v19;
          return v16;
        }
        if (v22 != 2)
        {
          v23 = v18 + 8;
          v24 = 2;
          while (1)
          {
            v25 = v24 + 1;
            if (__OFADD__(v24, 1))
              break;
            if (*v23 == (_QWORD)v21)
              goto LABEL_28;
            ++v24;
            v23 += 2;
            if (v25 == v22)
              goto LABEL_24;
          }
          __break(1u);
          break;
        }
      }
    }
LABEL_24:
    v26 = v18[3];
    if (v22 >= v26 >> 1)
    {
      v27 = *(_OWORD *)(v20 + 16 * v19);
      result = a6(v26 > 1, v22 + 1, 1);
      v21 = v27;
      v18 = (_QWORD *)result;
    }
    ++v19;
    v18[2] = v22 + 1;
    *(_OWORD *)&v18[2 * v22 + 4] = v21;
    if (v19 == v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE3320(unint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  __int128 v28;
  unint64_t v29;

  v10 = *(_QWORD *)(a2 + 16);
  v11 = MEMORY[0x2495016E4](v10);
  if ((a4 & 1) != 0)
    v12 = 0;
  else
    v12 = a3;
  if (v12 <= v11)
    v12 = v11;
  if (v12 <= a5)
    v13 = a5;
  else
    v13 = v12;
  if (v13 > 4)
  {
    v14 = MEMORY[0x2495016F0]();
    sub_243BE4350(&v29, a2, (_QWORD *)(v14 + 16));
    *a1 = v29;
  }
  else if (v10 >= 2)
  {
    result = (uint64_t)sub_243B6E3F4(0, v10, 0, MEMORY[0x24BEE4AF8]);
    v16 = (_QWORD *)result;
    v17 = 0;
    v18 = a2 + 32;
    while (1)
    {
      if (v17 == v10)
      {
        __break(1u);
        return result;
      }
      v19 = v18 + 32 * v17;
      v20 = *(_OWORD *)v19;
      v21 = *(_QWORD *)(v19 + 16);
      v22 = *(_QWORD *)(v19 + 24);
      v23 = v16[2];
      if (v23)
        break;
LABEL_19:
      v28 = v20;
      sub_243B924DC(v21, v22);
      sub_243B924DC(v21, v22);
      v26 = v16[2];
      v25 = v16[3];
      if (v26 >= v25 >> 1)
        v16 = sub_243B6E3F4((_QWORD *)(v25 > 1), v26 + 1, 1, v16);
      v16[2] = v26 + 1;
      v27 = &v16[4 * v26];
      *((_OWORD *)v27 + 2) = v28;
      ++v17;
      v27[6] = v21;
      v27[7] = v22;
      result = sub_243B924F0(v21, v22);
      if (v17 == v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    v24 = 4;
    while (v16[v24] != (_QWORD)v20)
    {
      v24 += 4;
      if (!--v23)
        goto LABEL_19;
    }
    swift_bridgeObjectRelease();
    v14 = 0;
    *a1 = v17;
  }
  else
  {
LABEL_11:
    v14 = 0;
    *a1 = v10;
  }
  return v14;
}

void sub_243BE34E0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;

  v5 = v4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (_QWORD *)((char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v14);
  v16 = (_QWORD *)((char *)v39 - v15);
  v17 = a4 >> 1;
  if (v17 == a3)
    return;
  v39[1] = a1;
  swift_unknownObjectRetain();
  v43 = a2;
  v40 = v5;
  v42 = v11;
  v41 = v17;
  while (a3 < v17)
  {
    v18 = *(_QWORD *)(v11 + 72);
    sub_243BE6E08(a2 + v18 * a3, (uint64_t)v16);
    v20 = *v5;
    v19 = v5[1];
    v21 = v19 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    if (*v5)
    {
      sub_243BFE1A4();
      sub_243BFE1D4();
      v22 = sub_243BFE1E0();
      v23 = 1 << *(_QWORD *)(v20 + 16);
      v24 = __OFSUB__(v23, 1);
      v25 = v23 - 1;
      if (v24)
        goto LABEL_22;
      v26 = v25 & v22;
      v27 = sub_243BFD2C8();
      *(_QWORD *)&v52 = v20 + 16;
      *((_QWORD *)&v52 + 1) = v20 + 32;
      *(_QWORD *)&v53 = v26;
      *((_QWORD *)&v53 + 1) = v27;
      *(_QWORD *)&v54 = v28;
      *((_QWORD *)&v54 + 1) = v29;
      v55 = 0;
      v30 = sub_243BFD2EC();
      v32 = v31;
      v44 = v52;
      v45 = v53;
      v46 = v54;
      v47 = v55;
      swift_retain();
      if ((v32 & 1) == 0)
      {
        v5 = v40;
        while (1)
        {
          sub_243BE6E08(v21 + v30 * v18, (uint64_t)v13);
          v33 = *v13;
          v34 = *v16;
          sub_243B6F978((uint64_t)v13, &qword_2572ED090);
          if (v33 == v34)
            break;
          sub_243BFD304();
          v48 = v44;
          v49 = v45;
          v50 = v46;
          v51 = v47;
          v30 = sub_243BFD2EC();
          if ((v35 & 1) != 0)
            goto LABEL_3;
        }
        swift_release();
        goto LABEL_5;
      }
LABEL_3:
      swift_release();
      v5 = v40;
    }
    else
    {
      v36 = *(_QWORD *)(v19 + 16);
      if (v36)
      {
        do
        {
          sub_243BE6E08(v21, (uint64_t)v13);
          v37 = *v13;
          v38 = *v16;
          sub_243B6F978((uint64_t)v13, &qword_2572ED090);
          if (v37 == v38)
            goto LABEL_5;
          v21 += v18;
        }
        while (--v36);
      }
    }
    sub_243BF325C((uint64_t)v16);
LABEL_5:
    ++a3;
    sub_243B6F978((uint64_t)v16, &qword_2572ED090);
    v17 = v41;
    a2 = v43;
    v11 = v42;
    if (a3 == v41)
    {
      swift_unknownObjectRelease();
      return;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
}

uint64_t sub_243BE37C8(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(BOOL, uint64_t, uint64_t), uint64_t (*a6)(_QWORD *, uint64_t, _QWORD, uint64_t))
{
  uint64_t *v6;
  int64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  char v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  __int128 v34;

  v7 = a4 >> 1;
  if (a4 >> 1 == a3)
    return result;
  v8 = v6;
  v9 = a3;
  v10 = v6 + 1;
  result = swift_unknownObjectRetain();
  while (v9 < v7)
  {
    v14 = *(_OWORD *)(a2 + 16 * v9);
    v16 = *v8;
    v15 = (_QWORD *)v8[1];
    v17 = v15 + 4;
    if (*v8)
    {
      v34 = *(_OWORD *)(a2 + 16 * v9);
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      if (__OFSUB__(1 << *(_QWORD *)(v16 + 16), 1))
        goto LABEL_49;
      sub_243BFD2C8();
      result = sub_243BFD2EC();
      if ((v18 & 1) == 0)
      {
        while (v17[2 * result] != (_QWORD)v34)
        {
          sub_243BFD304();
          result = sub_243BFD2EC();
          if ((v19 & 1) != 0)
            goto LABEL_23;
        }
        goto LABEL_7;
      }
    }
    else
    {
      v20 = v15[2];
      if (v20)
      {
        if (*v17 == (_QWORD)v14)
          goto LABEL_7;
        if (v20 != 1)
        {
          if (v15[6] == (_QWORD)v14)
            goto LABEL_7;
          if (v20 != 2)
          {
            if (v15[8] == (_QWORD)v14)
              goto LABEL_7;
            if (v20 != 3)
            {
              if (v15[10] == (_QWORD)v14)
                goto LABEL_7;
              v28 = v20 - 4;
              if (v28)
              {
                if (v15[12] == (_QWORD)v14)
                  goto LABEL_7;
                v29 = v15 + 14;
                while (--v28)
                {
                  v30 = *v29;
                  v29 += 2;
                  if (v30 == (_QWORD)v14)
                    goto LABEL_7;
                }
              }
            }
          }
        }
      }
      v34 = *(_OWORD *)(a2 + 16 * v9);
    }
LABEL_23:
    result = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v15;
    if ((result & 1) == 0)
    {
      result = a5(0, v15[2] + 1, 1);
      v15 = (_QWORD *)*v10;
    }
    v21 = v34;
    v23 = v15[2];
    v22 = v15[3];
    if (v23 >= v22 >> 1)
    {
      result = a5(v22 > 1, v23 + 1, 1);
      v21 = v34;
      v15 = (_QWORD *)*v10;
    }
    v15[2] = v23 + 1;
    *(_OWORD *)&v15[2 * v23 + 4] = v21;
    v8[1] = (uint64_t)v15;
    v24 = v15[2];
    v25 = *v8;
    if (*v8)
    {
      swift_beginAccess();
      if (MEMORY[0x2495016C0](*(_QWORD *)(v25 + 16) & 0x3FLL) >= (uint64_t)v24)
      {
        result = swift_isUniquelyReferenced_native();
        v27 = *v8;
        if ((result & 1) == 0)
        {
          if (!v27)
            goto LABEL_51;
          v27 = sub_243BFD328();
          result = swift_release();
          *v8 = v27;
        }
        if (!v27)
          goto LABEL_50;
        result = sub_243BFD2E0();
      }
      else
      {
        v26 = *(_QWORD *)(v25 + 24) & 0x3FLL;
        if (v24 > 0xF || v26)
          goto LABEL_3;
        result = swift_release();
        *v8 = 0;
      }
    }
    else if (v24 > 0xF)
    {
      v26 = 0;
LABEL_3:
      v11 = MEMORY[0x2495016E4](v24);
      if (v26 <= v11)
        v12 = v11;
      else
        v12 = v26;
      v13 = a6(v15, v12, 0, v26);
      result = swift_release();
      *v8 = v13;
    }
LABEL_7:
    if (++v9 == v7)
      return swift_unknownObjectRelease();
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
  return result;
}

uint64_t sub_243BE3B64(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v37;
  __int128 v38;

  if (a4 >> 1 == a3)
    return result;
  v5 = v4;
  v6 = a3;
  v7 = v4 + 1;
  v35 = a4 >> 1;
  result = swift_unknownObjectRetain();
  v8 = v35;
  v37 = v5;
  while (v6 < v8)
  {
    v12 = (__int128 *)(a2 + 32 * v6);
    v13 = *v12;
    v14 = *((_QWORD *)v12 + 2);
    v15 = *((_QWORD *)v12 + 3);
    v17 = *v5;
    v16 = (_QWORD *)v5[1];
    v18 = v16 + 4;
    if (*v5)
    {
      v38 = *v12;
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      if (__OFSUB__(1 << *(_QWORD *)(v17 + 16), 1))
        goto LABEL_53;
      sub_243BFD2C8();
      result = sub_243BFD2EC();
      v5 = v37;
      if ((v19 & 1) == 0)
      {
        while (v18[4 * result] != (_QWORD)v38)
        {
          sub_243BFD304();
          result = sub_243BFD2EC();
          if ((v20 & 1) != 0)
            goto LABEL_26;
        }
        v8 = v35;
        goto LABEL_8;
      }
      goto LABEL_26;
    }
    v21 = v16[2];
    if (!v21)
    {
      v38 = *v12;
LABEL_26:
      v22 = v15;
      goto LABEL_27;
    }
    if (*v18 == (_QWORD)v13)
      goto LABEL_8;
    v22 = *((_QWORD *)v12 + 3);
    if (v21 != 1)
    {
      if (v16[8] == (_QWORD)v13)
        goto LABEL_8;
      if (v21 != 2)
      {
        if (v16[12] == (_QWORD)v13)
          goto LABEL_8;
        if (v21 != 3)
        {
          if (v16[16] == (_QWORD)v13)
            goto LABEL_8;
          v32 = v21 - 4;
          if (v32)
          {
            if (v16[20] == (_QWORD)v13)
              goto LABEL_8;
            v33 = v16 + 24;
            while (--v32)
            {
              v34 = *v33;
              v33 += 4;
              if (v34 == (_QWORD)v13)
                goto LABEL_8;
            }
          }
        }
      }
    }
    v38 = *v12;
LABEL_27:
    sub_243B924DC(v14, v22);
    sub_243B924DC(v14, v22);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v7 = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_243B7CDB4(0, v16[2] + 1, 1);
      v16 = (_QWORD *)*v7;
    }
    v24 = v38;
    v26 = v16[2];
    v25 = v16[3];
    if (v26 >= v25 >> 1)
    {
      sub_243B7CDB4(v25 > 1, v26 + 1, 1);
      v24 = v38;
      v16 = (_QWORD *)*v7;
    }
    v16[2] = v26 + 1;
    v27 = &v16[4 * v26];
    *((_OWORD *)v27 + 2) = v24;
    v27[6] = v14;
    v27[7] = v22;
    v5 = v37;
    v37[1] = (uint64_t)v16;
    v28 = v16[2];
    v29 = *v37;
    if (*v37)
    {
      swift_beginAccess();
      if (MEMORY[0x2495016C0](*(_QWORD *)(v29 + 16) & 0x3FLL) >= (uint64_t)v28)
      {
        result = swift_isUniquelyReferenced_native();
        v31 = *v37;
        if ((result & 1) == 0)
        {
          if (!v31)
            goto LABEL_55;
          v31 = sub_243BFD328();
          result = swift_release();
          *v37 = v31;
        }
        if (!v31)
          goto LABEL_54;
        sub_243BFD2E0();
        goto LABEL_7;
      }
      v30 = *(_QWORD *)(v29 + 24) & 0x3FLL;
      if (v28 > 0xF || v30)
        goto LABEL_3;
      swift_release();
      v5 = v37;
      *v37 = 0;
    }
    else if (v28 > 0xF)
    {
      v30 = 0;
LABEL_3:
      v9 = MEMORY[0x2495016E4](v28);
      if (v30 <= v9)
        v10 = v9;
      else
        v10 = v30;
      v11 = sub_243BF391C((uint64_t)v16, v10, 0, v30);
      swift_release();
      v5 = v37;
      *v37 = v11;
    }
LABEL_7:
    result = sub_243B924F0(v14, v22);
    v8 = v35;
LABEL_8:
    if (++v6 == v8)
      return swift_unknownObjectRelease();
  }
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
  return result;
}

unint64_t sub_243BE3F60(unint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t result;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t *v35;
  _QWORD *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;

  v39 = a4;
  v35 = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v12 = (uint64_t *)((char *)&v35 - v11);
  v13 = *(_QWORD *)(a2 + 16);
  if (v13)
  {
    v14 = 0;
    v15 = a2 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v16 = *(_QWORD *)(v10 + 72);
    v36 = a3;
    v38 = v15;
    v37 = v13;
    while (1)
    {
      v40 = v14;
      v19 = v15 + v16 * v14;
      sub_243BE6E08(v19, (uint64_t)v12);
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      v21 = 1 << *a3;
      v22 = __OFSUB__(v21, 1);
      v23 = v21 - 1;
      if (v22)
        break;
      v24 = v23 & result;
      v25 = v39;
      v26 = sub_243BFD2C8();
      v27 = v16;
      v29 = v28;
      v31 = v30;
      sub_243B6F978((uint64_t)v12, &qword_2572ED090);
      *(_QWORD *)&v41 = a3;
      *((_QWORD *)&v41 + 1) = v25;
      v15 = v38;
      *(_QWORD *)&v42 = v24;
      *((_QWORD *)&v42 + 1) = v26;
      *(_QWORD *)&v43 = v29;
      *((_QWORD *)&v43 + 1) = v31;
      v16 = v27;
      v13 = v37;
      v44 = 0;
      v48 = 0;
      v45 = v41;
      v46 = v42;
      v47 = v43;
      while (1)
      {
        result = sub_243BFD2EC();
        if ((v32 & 1) != 0)
          break;
        if (result >= v13)
        {
          __break(1u);
          goto LABEL_14;
        }
        sub_243BE6E08(v15 + result * v27, (uint64_t)v12);
        sub_243BE6E08(v19, (uint64_t)v8);
        v33 = *v12;
        v34 = *v8;
        sub_243B6F978((uint64_t)v8, &qword_2572ED090);
        sub_243B6F978((uint64_t)v12, &qword_2572ED090);
        if (v33 == v34)
        {
          result = 0;
          *v35 = v40;
          return result;
        }
        sub_243BFD304();
        v45 = v41;
        v46 = v42;
        v47 = v43;
        v48 = v44;
      }
      v17 = v40 + 1;
      sub_243BFD2F8();
      v14 = v17;
      v18 = v17 == v13;
      a3 = v36;
      if (v18)
        goto LABEL_11;
    }
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    *v35 = v13;
    return 1;
  }
  return result;
}

unint64_t sub_243BE41EC(unint64_t *a1, uint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  unint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;

  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    v6 = 0;
    v7 = a2 + 32;
    while (1)
    {
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      if (__OFSUB__(1 << *a3, 1))
        break;
      sub_243BFD2C8();
      while (1)
      {
        result = sub_243BFD2EC();
        if ((v9 & 1) != 0)
          break;
        if (result >= v4)
        {
          __break(1u);
          goto LABEL_14;
        }
        if (*(_QWORD *)(v7 + 16 * result) == *(_QWORD *)(v7 + 16 * v6))
        {
          result = 0;
          *a1 = v6;
          return result;
        }
        sub_243BFD304();
      }
      sub_243BFD2F8();
      if (++v6 == v4)
        goto LABEL_11;
    }
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    *a1 = v4;
    return 1;
  }
  return result;
}

unint64_t sub_243BE4350(unint64_t *a1, uint64_t a2, _QWORD *a3)
{
  unint64_t v4;
  unint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;

  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    v6 = 0;
    v7 = a2 + 32;
    while (1)
    {
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      if (__OFSUB__(1 << *a3, 1))
        break;
      sub_243BFD2C8();
      while (1)
      {
        result = sub_243BFD2EC();
        if ((v9 & 1) != 0)
          break;
        if (result >= v4)
        {
          __break(1u);
          goto LABEL_14;
        }
        if (*(_QWORD *)(v7 + 32 * result) == *(_QWORD *)(v7 + 32 * v6))
        {
          result = 0;
          *a1 = v6;
          return result;
        }
        sub_243BFD304();
      }
      sub_243BFD2F8();
      if (++v6 == v4)
        goto LABEL_11;
    }
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    *a1 = v4;
    return 1;
  }
  return result;
}

uint64_t sub_243BE44B4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_243BFE1A4();
  swift_bridgeObjectRetain();
  sub_243BFD850();
  v8 = sub_243BFE1E0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_243BFE0F0() & 1) != 0)
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
      if (v19 || (sub_243BFE0F0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_243BE4660(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_243BE4660(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_243BF8220();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_243BF6FE4();
      goto LABEL_22;
    }
    sub_243BF7708();
  }
  v11 = *v4;
  sub_243BFE1A4();
  sub_243BFD850();
  result = sub_243BFE1E0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_243BFE0F0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_243BFE12C();
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
          result = sub_243BFE0F0();
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

void sub_243BE47F8()
{
  __asm { BR              X11 }
}

_QWORD *sub_243BE4858@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_243BE4AE8@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_243BC7224(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_243BE519C((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_243BE5214((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_243BE4B5C(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_243BE4BC0(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_243BFD0B8();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_243BFD0DC();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_243BFD0D0();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_243BE4C70@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_243BFDE50();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE4CF8(_OWORD *a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  *(_OWORD *)(v2 + 24) = *a1;
  return swift_task_switch();
}

uint64_t sub_243BE4D18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char *v6;

  v1 = v0[2];
  v3 = *(_QWORD *)(v1 + 16);
  v2 = *(_QWORD *)(v1 + 24);
  v6 = (char *)&dword_2572EFDB8 + dword_2572EFDB8;
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_243BE4D8C;
  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))v6)(v0[3], v0[4], v3, v2);
}

uint64_t sub_243BE4D8C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_243BE4DD8(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  char v12;
  _QWORD *v13;

  v12 = *a4;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_243B4D7A0;
  return sub_243BDFC48(a1, a2, a3, v12, a5, a6);
}

uint64_t sub_243BE4E5C(uint64_t a1, uint64_t a2, __int128 *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  __int128 v14;
  uint64_t v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFC70);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = *((_QWORD *)a3 + 2);
  v9 = *((_BYTE *)a3 + 24);
  v14 = *a3;
  v15 = v8;
  v16 = v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v10 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v11 + v10, (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFBE8);
  sub_243B9A6CC(&qword_2572EFC78, &qword_2572EFBA8, (uint64_t)&unk_243C04898);
  sub_243B9A6CC(&qword_2572EFC80, &qword_2572EFBE8, (uint64_t)&unk_243C04870);
  sub_243BFD5E0();
  return swift_release();
}

uint64_t sub_243BE4FE4(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)a1;
  if (*(_BYTE *)(a1 + 17) == 1)
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFC70);
    return sub_243BFDA00();
  }
  else
  {
    sub_243BE6D14((uint64_t)v2, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFC70);
    return sub_243BFDA0C();
  }
}

uint64_t sub_243BE506C@<X0>(uint64_t a1@<X1>, BOOL *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  v5 = result;
  if (result)
  {
    sub_243BE0A48(a1);
    result = swift_release();
  }
  *a2 = v5 == 0;
  return result;
}

uint64_t sub_243BE50EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v16;
  _QWORD *v17;

  v16 = *a4;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v17;
  *v17 = v8;
  v17[1] = sub_243B6A428;
  return sub_243BE0F7C(a1, a2, a3, v16, a5, a6, a7, a8);
}

uint64_t sub_243BE519C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_243BFD0E8();
  swift_allocObject();
  result = sub_243BFD0AC();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_243BFD1B4();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_243BE5214(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_243BFD0E8();
  swift_allocObject();
  result = sub_243BFD0AC();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_243BE5294(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_243BC7224(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_243BE519C((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_243BE5214((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_243BE52F8(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_243BFD0E8();
      swift_allocObject();
      sub_243BFD0C4();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_243BFD1B4();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_243BE5394(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFCB8);
  v10 = sub_243B9A6CC((unint64_t *)&unk_2572EFCC0, &qword_2572EFCB8, MEMORY[0x24BDCFBE0]);
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_243BE4AE8(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

uint64_t sub_243BE5444(uint64_t a1, unint64_t a2)
{
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
  int64_t v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v4 = sub_243BFD280();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_243BFD3AC();
  MEMORY[0x24BDAC7A8](v8);
  v9 = type metadata accessor for GenericListProto(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  sub_243B7FBDC(a1, a2);
  sub_243BFD3A0();
  sub_243B88508((unint64_t *)&qword_2572EE3F0, type metadata accessor for GenericListProto, (uint64_t)&protocol conformance descriptor for GenericListProto);
  v12 = v24;
  sub_243BFD49C();
  if (v12)
  {
    sub_243B7FCC0(a1, a2);
  }
  else
  {
    v24 = a1;
    v13 = *(_QWORD *)v11;
    v14 = *(_QWORD *)(*(_QWORD *)v11 + 16);
    if (v14)
    {
      v22 = v11;
      v23 = a2;
      *(_QWORD *)&v25 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_243B7CCB8(0, v14, 0);
      v9 = v25;
      v21 = v13;
      v15 = (unint64_t *)(v13 + 40);
      do
      {
        v17 = *(v15 - 1);
        v16 = *v15;
        sub_243B7FBDC(v17, *v15);
        sub_243B7FBDC(v17, v16);
        UUID.init(serialized:version:)(v17, v16);
        sub_243B7FCC0(v17, v16);
        *(_QWORD *)&v25 = v9;
        v19 = *(_QWORD *)(v9 + 16);
        v18 = *(_QWORD *)(v9 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_243B7CCB8(v18 > 1, v19 + 1, 1);
          v9 = v25;
        }
        v15 += 2;
        *(_QWORD *)(v9 + 16) = v19 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v19, v7, v4);
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease();
      sub_243B7FCC0(v24, v23);
      v11 = v22;
    }
    else
    {
      sub_243B7FCC0(v24, a2);
      v9 = MEMORY[0x24BEE4AF8];
    }
    sub_243B7FA20((uint64_t)v11, type metadata accessor for GenericListProto);
  }
  return v9;
}

uint64_t sub_243BE5728(uint64_t result, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v6 = swift_bridgeObjectRetain();
    v8 = *(_QWORD *)(v6 + 32);
    v7 = *(_QWORD *)(v6 + 40);
    v45 = v6;
    v9 = (_QWORD *)*a3;
    v10 = sub_243B7CED0(v8);
    v12 = v9[2];
    v13 = (v11 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v15 = v10;
    v16 = v11;
    v17 = v9[3];
    swift_bridgeObjectRetain();
    if (v17 < v14)
    {
      sub_243BA1BDC(v14, a2 & 1);
      v18 = sub_243B7CED0(v8);
      if ((v16 & 1) != (v19 & 1))
      {
LABEL_28:
        result = sub_243BFE138();
        __break(1u);
        return result;
      }
      v15 = v18;
      v20 = (_QWORD *)*a3;
      if ((v16 & 1) == 0)
        goto LABEL_12;
LABEL_9:
      v46 = *(_QWORD *)(v20[7] + 8 * v15);
      swift_bridgeObjectRetain();
      sub_243B7C62C(v7);
      v21 = v20[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 8 * v15) = v46;
      v22 = v3 - 1;
      if (!v22)
        return swift_bridgeObjectRelease();
LABEL_16:
      for (i = (uint64_t *)(v45 + 56); ; i += 2)
      {
        v30 = *(i - 1);
        v29 = *i;
        v31 = (_QWORD *)*a3;
        v32 = sub_243B7CED0(v30);
        v34 = v31[2];
        v35 = (v33 & 1) == 0;
        v36 = v34 + v35;
        if (__OFADD__(v34, v35))
          break;
        v37 = v32;
        v38 = v33;
        v39 = v31[3];
        swift_bridgeObjectRetain();
        if (v39 < v36)
        {
          sub_243BA1BDC(v36, 1);
          v40 = sub_243B7CED0(v30);
          if ((v38 & 1) != (v41 & 1))
            goto LABEL_28;
          v37 = v40;
        }
        v42 = (_QWORD *)*a3;
        if ((v38 & 1) != 0)
        {
          v47 = *(_QWORD *)(v42[7] + 8 * v37);
          swift_bridgeObjectRetain();
          sub_243B7C62C(v29);
          v28 = v42[7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v28 + 8 * v37) = v47;
        }
        else
        {
          v42[(v37 >> 6) + 8] |= 1 << v37;
          *(_QWORD *)(v42[6] + 8 * v37) = v30;
          *(_QWORD *)(v42[7] + 8 * v37) = v29;
          v43 = v42[2];
          v25 = __OFADD__(v43, 1);
          v44 = v43 + 1;
          if (v25)
            goto LABEL_27;
          v42[2] = v44;
        }
        if (!--v22)
          return swift_bridgeObjectRelease();
      }
      goto LABEL_26;
    }
    if ((a2 & 1) != 0)
    {
      v20 = (_QWORD *)*a3;
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_243BF9FCC();
      v20 = (_QWORD *)*a3;
      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
LABEL_12:
    v20[(v15 >> 6) + 8] |= 1 << v15;
    v23 = 8 * v15;
    *(_QWORD *)(v20[6] + v23) = v8;
    *(_QWORD *)(v20[7] + v23) = v7;
    v24 = v20[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v20[2] = v26;
    v22 = v3 - 1;
    if (!v22)
      return swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_243BE59CC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v11 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v12;
  *v12 = v5;
  v12[1] = sub_243B6A428;
  return sub_243BDB904(a1, a2, a3, a4, v11, v10);
}

uint64_t sub_243BE5A50(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_243B6A428;
  return sub_243BEFA50(a1, a2, v6);
}

uint64_t sub_243BE5ABC(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v11 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v12;
  *v12 = v5;
  v12[1] = sub_243B6A428;
  return sub_243BDC3D4(a1, a2, a3, a4, v11, v10);
}

uint64_t sub_243BE5B40()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BE5B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v9 = v4[2];
  v10 = v4[3];
  v12 = v4[6];
  v11 = v4[7];
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v13;
  *v13 = v5;
  v13[1] = sub_243B6A428;
  return sub_243BDCAF4(a1, a2, a3, a4, v12, v11, v9, v10);
}

uint64_t sub_243BE5C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v11 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v12;
  *v12 = v5;
  v12[1] = sub_243B6A428;
  return sub_243BDD2B4(a1, a2, a3, a4, v11, v10);
}

uint64_t sub_243BE5C90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BE5CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v10 = v4[2];
  v11 = v4[3];
  v13 = v4[4];
  v12 = v4[5];
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v14;
  *v14 = v5;
  v14[1] = sub_243B6A428;
  return sub_243BDD668(a1, a2, a3, a4, v13, v12, v10, v11);
}

uint64_t sub_243BE5D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v10 = v4[2];
  v11 = v4[3];
  v13 = v4[4];
  v12 = v4[5];
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v14;
  *v14 = v5;
  v14[1] = sub_243B4D7A0;
  return sub_243BDDA24(a1, a2, a3, a4, v13, v12, v10, v11);
}

uint64_t sub_243BE5DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v11 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v12;
  *v12 = v5;
  v12[1] = sub_243B6A428;
  return sub_243BDE044(a1, a2, a3, a4, v11, v10);
}

uint64_t sub_243BE5E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v10 = v4[2];
  v11 = v4[3];
  v13 = v4[4];
  v12 = v4[5];
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v14;
  *v14 = v5;
  v14[1] = sub_243B6A428;
  return sub_243BDEDD8(a1, a2, a3, a4, v13, v12, v10, v11);
}

uint64_t sub_243BE5F00()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BE5F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v11 = *(_QWORD *)(v4 + 16);
  v10 = *(_QWORD *)(v4 + 24);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v12;
  *v12 = v5;
  v12[1] = sub_243B6A428;
  return sub_243BDF278(a1, a2, a3, a4, v11, v10);
}

unint64_t sub_243BE5FAC()
{
  unint64_t result;

  result = qword_2543CDEE8[0];
  if (!qword_2543CDEE8[0])
  {
    result = MEMORY[0x249502B6C](&protocol conformance descriptor for XPCRequestType, &type metadata for XPCRequestType);
    atomic_store(result, qword_2543CDEE8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for XPCRequestType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEC)
    goto LABEL_17;
  if (a2 + 20 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 20) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 20;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 20;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 20;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x15;
  v8 = v6 - 21;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCRequestType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 20 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 20) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEB)
    return ((uint64_t (*)(void))((char *)&loc_243BE60CC + 4 * byte_243C04390[v4]))();
  *a1 = a2 + 20;
  return ((uint64_t (*)(void))((char *)sub_243BE6100 + 4 * byte_243C0438B[v4]))();
}

uint64_t sub_243BE6100(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BE6108(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x243BE6110);
  return result;
}

uint64_t sub_243BE611C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x243BE6124);
  *(_BYTE *)result = a2 + 20;
  return result;
}

uint64_t sub_243BE6128(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BE6130(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCRequestType()
{
  return &type metadata for XPCRequestType;
}

uint64_t type metadata accessor for PhotosXPC()
{
  return objc_opt_self();
}

uint64_t method lookup function for PhotosXPC()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosXPC.__allocating_init(messageCenter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_243BE6180()
{
  return sub_243B9A6CC(&qword_2572EFB10, &qword_2572EFB18, MEMORY[0x24BEE7090]);
}

uint64_t sub_243BE61AC()
{
  return sub_243B9A6CC(&qword_2572EDD68, &qword_2572EDD60, MEMORY[0x24BEE7090]);
}

uint64_t sub_243BE61D8()
{
  return sub_243B9A6CC(&qword_2572EDD68, &qword_2572EDD60, MEMORY[0x24BEE7090]);
}

uint64_t sub_243BE6204()
{
  return sub_243B9A6CC(&qword_2572EDD30, &qword_2572ED9F0, (uint64_t)&protocol conformance descriptor for AsyncThrowingChannel<A, B>);
}

uint64_t sub_243BE6230(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_243B6A428;
  return ((uint64_t (*)(_OWORD *, uint64_t))((char *)&dword_2572EFB28 + dword_2572EFB28))(a1, v1);
}

uint64_t sub_243BE6294(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = sub_243BFD280();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = type metadata accessor for GenericListProto(0);
  MEMORY[0x24BDAC7A8](v28);
  v27 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v41 = MEMORY[0x24BEE4AF8];
    sub_243B7CCF0(0, v8, 0);
    v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v11 = *(_QWORD *)(v3 + 72);
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v30 = v11;
    v31 = v3;
    do
    {
      v29(v5, v10, v2);
      v32 = sub_243BFD268();
      v33 = v12;
      v34 = v13;
      v35 = v14;
      v36 = v15;
      v37 = v16;
      v38 = v17;
      v39 = v18;
      v40 = v19;
      sub_243BFD268();
      sub_243BFD0E8();
      swift_allocObject();
      v20 = sub_243BFD0AC();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v9 = v41;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = sub_243B7CCF0(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v41;
      }
      v22 = *(_QWORD *)(v9 + 16);
      v21 = *(_QWORD *)(v9 + 24);
      if (v22 >= v21 >> 1)
      {
        isUniquelyReferenced_nonNull_native = sub_243B7CCF0(v21 > 1, v22 + 1, 1);
        v9 = v41;
      }
      *(_QWORD *)(v9 + 16) = v22 + 1;
      v23 = v9 + 16 * v22;
      *(_QWORD *)(v23 + 32) = 0x1000000000;
      *(_QWORD *)(v23 + 40) = v20 | 0x4000000000000000;
      v3 = v31;
      v10 += v30;
      --v8;
    }
    while (v8);
  }
  MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  *(&v27 - 2) = (char *)v9;
  sub_243B88508((unint64_t *)&qword_2572EE3F0, type metadata accessor for GenericListProto, (uint64_t)&protocol conformance descriptor for GenericListProto);
  v24 = (uint64_t)v27;
  sub_243BFD4CC();
  swift_bridgeObjectRelease();
  v25 = sub_243BFD4A8();
  sub_243B7FA20(v24, type metadata accessor for GenericListProto);
  return v25;
}

uint64_t sub_243BE65D0(_QWORD *a1)
{
  uint64_t v1;

  return sub_243BC6F80(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_243BE65E8()
{
  uint64_t v0;

  swift_release();
  sub_243B7FCC0(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_243BE6614(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = *(_QWORD *)(v2 + 24);
  v8 = *(_QWORD *)(v2 + 32);
  v9 = *(_QWORD *)(v2 + 40);
  v10 = *(_BYTE *)(v2 + 48);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_243B6A428;
  return sub_243BDC698(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_243BE66A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_243B6A428;
  *(_QWORD *)(v3 + 40) = v2;
  *(_OWORD *)(v3 + 24) = v4;
  return swift_task_switch();
}

uint64_t sub_243BE670C()
{
  return swift_deallocObject();
}

uint64_t sub_243BE671C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  _QWORD *v7;

  v6 = *(_BYTE *)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_243B6A428;
  return sub_243BDBC3C(a1, a2, v6);
}

uint64_t sub_243BE6784()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_243BE67A8()
{
  return sub_243BDF914();
}

double sub_243BE67B0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  _QWORD v4[6];

  v4[3] = a1;
  sub_243BE9EC0((void (*)(uint64_t *__return_ptr))sub_243BE6800, (uint64_t)v4);
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_243BE6800@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return sub_243BE506C(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_243BE6818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_243BFD688();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 44) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_243BE6894(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_243BFD688() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 32);
  v8 = *(_DWORD *)(v1 + 40);
  v9 = v1 + ((v4 + 44) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_243B4D7A0;
  return sub_243BE2274(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_243BE6930(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) == 0)
    return sub_243B7FCC0(a2, a3);
  return result;
}

uint64_t sub_243BE6944()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_243B7FCC0(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  swift_release();
  return swift_deallocObject();
}

void sub_243BE6980()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_243B6A428;
  __asm { BR              X9; sub_243BE50EC }
}

unint64_t sub_243BE6A34()
{
  unint64_t result;

  result = qword_2572EFC00;
  if (!qword_2572EFC00)
  {
    result = MEMORY[0x249502B6C](&unk_243C014E4, &type metadata for MessageError);
    atomic_store(result, (unint64_t *)&qword_2572EFC00);
  }
  return result;
}

uint64_t sub_243BE6A78(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = (_OWORD *)v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_243B6A428;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _OWORD *, uint64_t))((char *)&dword_2572EFD98
                                                                               + dword_2572EFD98))(a1, v4, v5, v7, v6);
}

void sub_243BE6AFC()
{
  uint64_t v0;

  sub_243BE9AB4(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

_QWORD *sub_243BE6B08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_243BE4B5C((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_243BE6B64, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_243BE6B64@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_243BE4C70(a1, a2);
}

uint64_t sub_243BE6B80()
{
  uint64_t v0;

  swift_release();
  sub_243B7FCC0(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_243BE6BAC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = (char *)(v2 + 3);
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_243B6A428;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))((char *)&dword_2572EFC40
                                                                                      + dword_2572EFC40))(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_243BE6C44(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 2)
    return swift_bridgeObjectRelease();
  if (a3 == 1)
    return sub_243B7FCC0(result, a2);
  return result;
}

uint64_t sub_243BE6C68(uint64_t a1)
{
  uint64_t v1;

  return sub_243BE4E5C(a1, *(_QWORD *)(v1 + 16), *(__int128 **)(v1 + 24));
}

uint64_t sub_243BE6C70()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFC70);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_243BE6CD4(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFC70);
  return sub_243BE4FE4(a1);
}

uint64_t sub_243BE6D14(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 2)
    return swift_bridgeObjectRetain();
  if (a3 == 1)
    return sub_243B7FBDC(result, a2);
  return result;
}

uint64_t sub_243BE6D38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_243B6A428;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2572EFC88 + dword_2572EFC88))(a1, v4);
}

uint64_t sub_243BE6DA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_243B6A428;
  v4[2] = a1;
  v4[3] = v1;
  return swift_task_switch();
}

uint64_t sub_243BE6E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t static XPCConstants.serviceName.getter()
{
  return 0xD000000000000014;
}

unint64_t static XPCConstants.entitlementName.getter()
{
  return 0xD000000000000014;
}

ValueMetadata *type metadata accessor for XPCConstants()
{
  return &type metadata for XPCConstants;
}

uint64_t XPCEventStream.__allocating_init()()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  _QWORD v4[6];

  v0 = swift_allocObject();
  if (qword_2543CE220 != -1)
    swift_once();
  v1 = qword_2543CE210;
  v4[4] = sub_243BE72A4;
  v4[5] = v0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1107296256;
  v4[2] = sub_243BE72AC;
  v4[3] = &block_descriptor;
  v2 = _Block_copy(v4);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v2);
  _Block_release(v2);
  return v0;
}

uint64_t XPCEventStream.init()()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  _QWORD v4[6];

  if (qword_2543CE220 != -1)
    swift_once();
  v1 = qword_2543CE210;
  v4[4] = sub_243BE72A4;
  v4[5] = v0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1107296256;
  v4[2] = sub_243BE72AC;
  v4[3] = &block_descriptor_4;
  v2 = _Block_copy(v4);
  swift_retain();
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v2);
  _Block_release(v2);
  return v0;
}

void sub_243BE7094(void *a1, uint64_t a2)
{
  const char *v4;
  const char *string;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD v14[7];
  uint64_t v15;

  v4 = (const char *)sub_243BFD5B0();
  string = xpc_dictionary_get_string(a1, v4);
  if (string)
  {
    MEMORY[0x24BDAC7A8](string);
    v14[2] = a2;
    v14[3] = v6;
    sub_243BEA030((void (*)(void))sub_243BE7358, (uint64_t)v14);
  }
  else
  {
    if (qword_2543CD828 != -1)
      swift_once();
    v7 = sub_243BFD598();
    __swift_project_value_buffer(v7, (uint64_t)qword_2543CE350);
    swift_unknownObjectRetain_n();
    v8 = sub_243BFD580();
    v9 = sub_243BFDCA0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v15 = v11;
      *(_DWORD *)v10 = 136315138;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572EFD30);
      v12 = sub_243BFD838();
      v14[6] = sub_243B739A8(v12, v13, &v15);
      sub_243BFDD54();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243B4B000, v8, v9, "Unknown name for field: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v11, -1, -1);
      MEMORY[0x249502C5C](v10, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

void sub_243BE72A4(void *a1)
{
  uint64_t v1;

  sub_243BE7094(a1, v1);
}

uint64_t sub_243BE72AC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
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

uint64_t XPCEventStream.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t XPCEventStream.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for XPCEventStream()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCEventStream()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCEventStream.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_243BE7358()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_243BFD868();
  sub_243BE7390(v0, v1);
  return swift_bridgeObjectRelease();
}

void sub_243BE7390(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_2543CD828 != -1)
    swift_once();
  v4 = sub_243BFD598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2543CE350);
  swift_bridgeObjectRetain_n();
  v5 = sub_243BFD580();
  v6 = sub_243BFDCB8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v9 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_243B739A8(a1, a2, &v9);
    sub_243BFDD54();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_243B4B000, v5, v6, "Got XPC Event Stream with object %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249502C5C](v8, -1, -1);
    MEMORY[0x249502C5C](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_243BE7534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD50);
  v3[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_243BE7594()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;

  v1 = *(os_unfair_lock_s **)(v0 + 24);
  v2 = (uint64_t *)&v1[4];
  v3 = v1 + 16;
  os_unfair_lock_lock(v1 + 16);
  v4 = sub_243BE9934(v2, sub_243BF6CD8);
  os_unfair_lock_unlock(v3);
  if (v4)
  {
    if (v4 == 1)
    {
      v6 = *(_QWORD *)(v0 + 24);
      v5 = *(_QWORD *)(v0 + 32);
      v7 = *(_QWORD *)(v0 + 16);
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
      v8 = *(_QWORD *)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v8 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 48) = v9;
      v9[2] = v6;
      v9[3] = v5;
      v9[4] = v7;
      v9[5] = v8;
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 56) = v10;
      v10[2] = v6;
      v10[3] = v5;
      v10[4] = v8;
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 64) = v11;
      *v11 = v0;
      v11[1] = sub_243BE774C;
      return sub_243BFE0FC();
    }
    v13 = *(_QWORD *)(v0 + 40);
    sub_243B6F8F0(*(_QWORD *)(v0 + 16), v13, type metadata accessor for StoredPhoto);
    v14 = type metadata accessor for StoredPhoto(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 0, 1, v14);
    sub_243B6F9B4(v13, *(_QWORD *)(*(_QWORD *)(v4 + 64) + 40), &qword_2572EDD50);
    swift_continuation_throwingResume();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE774C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE77B4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE77E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_243BE7804()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t *v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v12;
  unint64_t v13;

  v1 = *(os_unfair_lock_s **)(v0 + 64);
  v2 = (uint64_t *)&v1[4];
  v3 = v1 + 16;
  os_unfair_lock_lock(v1 + 16);
  v4 = sub_243BE9934(v2, sub_243BF6D18);
  os_unfair_lock_unlock(v3);
  if (v4)
  {
    if (v4 == 1)
    {
      v6 = *(_QWORD *)(v0 + 64);
      v5 = *(_QWORD *)(v0 + 72);
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
      v7 = *(_QWORD *)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v7 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 80) = v8;
      v8[2] = v6;
      v8[3] = v5;
      v8[4] = v0 + 16;
      v8[5] = v7;
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v9;
      v9[2] = v6;
      v9[3] = v5;
      v9[4] = v7;
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 96) = v10;
      *v10 = v0;
      v10[1] = sub_243BE7988;
      return sub_243BFE0FC();
    }
    v12 = *(_QWORD *)(v0 + 48);
    v13 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(v0 + 32) = v12;
    *(_QWORD *)(v0 + 40) = v13;
    sub_243B7FBDC(v12, v13);
    sub_243B6F9B4(v0 + 32, *(_QWORD *)(*(_QWORD *)(v4 + 64) + 40), &qword_2572EFC08);
    swift_continuation_throwingResume();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE7988()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE79F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE79F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return swift_task_switch();
}

uint64_t sub_243BE7A14()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  id v13;
  _QWORD *v14;
  uint64_t (*v15)(void);
  _QWORD *v16;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)(v0 + 72) + 64);
  os_unfair_lock_lock(v1);
  sub_243BE9418(v0 + 16);
  os_unfair_lock_unlock(v1);
  v3 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 88) = v2;
  *(_QWORD *)(v0 + 96) = v4;
  v5 = *(_BYTE *)(v0 + 40);
  *(_BYTE *)(v0 + 41) = v5;
  if (v3)
  {
    if (v3 == 1)
    {
      v7 = *(_QWORD *)(v0 + 72);
      v6 = *(_QWORD *)(v0 + 80);
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
      v8 = *(_QWORD *)(v6 + 16);
      *(_QWORD *)(v6 + 16) = v8 + 1;
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v9;
      v9[2] = v7;
      v9[3] = v6;
      v9[4] = v8;
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v10;
      v10[2] = v7;
      v10[3] = v6;
      v10[4] = v8;
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFC08);
      *v11 = v0;
      v11[1] = sub_243BE7C94;
      return sub_243BFE0FC();
    }
    sub_243BFBB74(v2, v4, v5 & 1);
    swift_continuation_throwingResume();
    if ((v5 & 1) == 0)
      goto LABEL_8;
LABEL_5:
    *(_QWORD *)(v0 + 48) = v2;
    v13 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
    swift_willThrowTypedImpl();
    *(_QWORD *)(v0 + 56) = v2;
    if (sub_243BFE0CC())
    {
      sub_243BFBB80(v2, v4, 1);
      sub_243BFBB80(v2, v4, 1);
    }
    else
    {
      swift_allocError();
      *v16 = *(_QWORD *)(v0 + 56);
      sub_243BFBB80(v2, v4, 1);
      v3 = *(_QWORD *)(v0 + 16);
      v2 = *(void **)(v0 + 24);
      v4 = *(_QWORD *)(v0 + 32);
      v5 = *(_BYTE *)(v0 + 40);
    }
    sub_243BFBB8C(v3, v2, v4, v5);
    v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
  sub_243BFBB74(v2, v4, v5 & 1);
  if ((v5 & 1) != 0)
    goto LABEL_5;
LABEL_8:
  v14 = *(_QWORD **)(v0 + 64);
  sub_243BFBB8C(v3, v2, v4, v5);
  *v14 = v2;
  v14[1] = v4;
  v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_243BE7C94()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BE7D14()
{
  uint64_t v0;

  sub_243BFBB8C(1, *(void **)(v0 + 88), *(_QWORD *)(v0 + 96), *(_BYTE *)(v0 + 41));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE7D50()
{
  uint64_t v0;

  sub_243BFBB8C(1, *(void **)(v0 + 88), *(_QWORD *)(v0 + 96), *(_BYTE *)(v0 + 41));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BE7D8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
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
  char isUniquelyReferenced_nonNull_native;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t result;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  char v111;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE58);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15);
  v18 = (unint64_t *)((char *)&v88 - v17);
  v19 = v3[4];
  if (v19 < 0)
    return 1;
  v92 = v10;
  v20 = a2;
  v22 = (void *)*v3;
  v21 = v3[1];
  v24 = v3[2];
  v23 = v3[3];
  v94 = v3[5];
  v106 = v22;
  v107 = v21;
  v90 = v21;
  v104 = v23;
  v105 = v19;
  v91 = v16;
  v25 = *(int *)(v16 + 48);
  v93 = v19;
  v26 = (char *)v18 + v25;
  sub_243B6F8F0(v20, (uint64_t)v18 + v25, type metadata accessor for StoredPhoto);
  v27 = type metadata accessor for StoredPhoto(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v26, 0, 1, v27);
  *v18 = a3;
  v18[1] = a1;
  v95 = v18;
  sub_243BFE1A4();
  sub_243BFE1D4();
  v28 = sub_243BFE1E0();
  v29 = -1 << *(_BYTE *)(v24 + 32);
  v30 = v28 & ~v29;
  v31 = v24 + 56;
  if (((*(_QWORD *)(v24 + 56 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8)) >> v30) & 1) != 0)
  {
    v89 = v4;
    v32 = v12;
    v33 = ~v29;
    sub_243B62FEC(v22, v90, v24, v23, v93);
    v90 = v32;
    v34 = *(_QWORD *)(v32 + 72);
    v88 = v23;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    v35 = v24;
    while (1)
    {
      v36 = v35;
      v37 = *(_QWORD *)(v35 + 48);
      v35 = v34 * v30;
      sub_243B50168(v37 + v34 * v30, (uint64_t)v14, &qword_2572ED090);
      v38 = *v14;
      v39 = *v95;
      sub_243B6F978((uint64_t)v14, &qword_2572ED090);
      if (v38 == v39)
        break;
      v30 = (v30 + 1) & v33;
      v35 = v36;
      if (((*(_QWORD *)(v31 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8)) >> v30) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v4 = v89;
        v12 = v90;
        v40 = v93;
        v30 = v88;
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v100 = v36;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_14;
    goto LABEL_37;
  }
  v40 = v93;
  sub_243B62FEC(v22, v90, v24, v23, v93);
  swift_retain();
  swift_retain();
  v35 = v24;
  v30 = v23;
LABEL_9:
  v42 = (uint64_t)v92;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v92, 1, 1, v91);
  sub_243B6F978(v42, &qword_2572EFE58);
  v43 = *(_QWORD *)(v40 + 16);
  swift_release();
  swift_release();
  if (v43)
  {
    if (!*(_QWORD *)(v105 + 16))
    {
      __break(1u);
LABEL_37:
      sub_243BF7194();
      v36 = v100;
LABEL_14:
      v46 = *(_QWORD *)(v36 + 48) + v35;
      v47 = (uint64_t)v92;
      sub_243B6F9B4(v46, (uint64_t)v92, &qword_2572ED090);
      sub_243BF8E00(v30);
      v48 = v100;
      swift_bridgeObjectRelease();
      v41 = 1;
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v90 + 56))(v47, 0, 1, v91);
      sub_243B6F978((uint64_t)v95, &qword_2572ED090);
      swift_release();
      swift_release();
      sub_243B6F978(v47, &qword_2572EFE58);
      v49 = v106;
      v50 = v107;
      v51 = v104;
      v52 = v105;
      v53 = v89;
      sub_243B63074((id)*v89, v89[1], v89[2], v89[3], v89[4]);
      *v53 = v49;
      v53[1] = v50;
      v53[2] = v48;
      v53[3] = v51;
      v54 = v94;
      v53[4] = v52;
      v53[5] = v54;
      return v41;
    }
    if (v104)
      v44 = sub_243BFA7B8(v104 + 16, v104 + 32, v105, 0);
    else
      v44 = 0;
    sub_243BF54D4(0, v44, sub_243BF6CD8);
    v41 = v75;
    sub_243B6F978((uint64_t)v95, &qword_2572ED090);
    v76 = v106;
    v77 = v107;
    v78 = v104;
    v79 = v105;
    sub_243B63074((id)*v4, v4[1], v4[2], v4[3], v4[4]);
    *v4 = v76;
    v4[1] = v77;
    v4[2] = v35;
    v4[3] = v78;
    v4[4] = v79;
LABEL_32:
    v4[5] = v94;
    return v41;
  }
  v55 = v106;
  v56 = v107;
  v57 = v12;
  v58 = v107 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  if (!v106)
  {
    v80 = *(_QWORD *)(v107 + 16);
    if (v80)
    {
      v81 = v4;
      v82 = *(_QWORD *)(v57 + 72);
      while (1)
      {
        sub_243B50168(v58, (uint64_t)v14, &qword_2572ED090);
        v83 = *v14;
        v84 = *v95;
        sub_243B6F978((uint64_t)v14, &qword_2572ED090);
        if (v83 == v84)
          break;
        v58 += v82;
        if (!--v80)
        {
          v4 = v81;
          goto LABEL_30;
        }
      }
      v55 = 0;
      v4 = v81;
      v85 = v95;
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  sub_243BFE1A4();
  sub_243BFE1D4();
  result = sub_243BFE1E0();
  v60 = 1 << v55[2];
  v61 = __OFSUB__(v60, 1);
  v62 = v60 - 1;
  if (!v61)
  {
    v63 = v62 & result;
    v64 = sub_243BFD2C8();
    *(_QWORD *)&v100 = v55 + 2;
    *((_QWORD *)&v100 + 1) = v55 + 4;
    *(_QWORD *)&v101 = v63;
    *((_QWORD *)&v101 + 1) = v64;
    *(_QWORD *)&v102 = v65;
    *((_QWORD *)&v102 + 1) = v66;
    v103 = 0;
    v67 = sub_243BFD2EC();
    v69 = v68;
    v96 = v100;
    v97 = v101;
    v98 = v102;
    v99 = v103;
    swift_retain();
    if ((v69 & 1) == 0)
    {
      v92 = (char *)v56;
      v93 = v35;
      v70 = *(_QWORD *)(v57 + 72);
      v71 = v95;
      while (1)
      {
        sub_243B50168(v58 + v70 * v67, (uint64_t)v14, &qword_2572ED090);
        v72 = *v14;
        v73 = *v71;
        sub_243B6F978((uint64_t)v14, &qword_2572ED090);
        if (v72 == v73)
          break;
        sub_243BFD304();
        v108 = v96;
        v109 = v97;
        v110 = v98;
        v111 = v99;
        v67 = sub_243BFD2EC();
        if ((v74 & 1) != 0)
        {
          v35 = v93;
          goto LABEL_22;
        }
      }
      swift_release();
      v85 = v71;
      v35 = v93;
      v56 = (uint64_t)v92;
      goto LABEL_31;
    }
LABEL_22:
    swift_release();
LABEL_30:
    v85 = v95;
    sub_243BF325C((uint64_t)v95);
    v55 = v106;
    v56 = v107;
LABEL_31:
    sub_243B6F978((uint64_t)v85, &qword_2572ED090);
    v86 = v104;
    v87 = v105;
    sub_243B63074((id)*v4, v4[1], v4[2], v4[3], v4[4]);
    *v4 = v55;
    v4[1] = v56;
    v4[2] = v35;
    v4[3] = v86;
    v41 = 2;
    v4[4] = v87;
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE84CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;

  v5 = v4[4];
  if (v5 < 0)
    return 1;
  v6 = v4;
  v8 = (void *)*v4;
  v7 = v4[1];
  v13 = v4[2];
  v12 = v4[3];
  v14 = v4[5];
  v49 = v8;
  v50 = v7;
  v47 = v5;
  v48 = v13;
  v46 = v12;
  swift_retain();
  sub_243B7FBDC(a2, a3);
  v38 = v8;
  v39 = (_QWORD *)v7;
  v37 = v13;
  v41 = v14;
  sub_243B62FEC(v8, v7, v13, v12, v5);
  swift_retain();
  v15 = a4;
  sub_243BF6D44(a4, (uint64_t)&v42);
  v16 = v43;
  if (v43 != 1)
  {
    v22 = v44;
    v21 = v45;
    v23 = v42;
    sub_243B7FCC0(a2, a3);
    swift_release();
    swift_release();
    sub_243BFBA60(v23, v16, v22, v21);
    sub_243B63074(v38, (uint64_t)v39, v37, v12, v5);
    v24 = v48;
    *v6 = v38;
    v6[1] = v39;
    v6[2] = v24;
    v6[3] = v12;
    v6[4] = v5;
    v6[5] = v41;
    return 1;
  }
  v17 = v39;
  v18 = *(_QWORD *)(v5 + 16);
  v19 = v5;
  swift_release();
  swift_release();
  if (v18)
  {
    if (v12)
      v20 = sub_243BFA7B8(v12 + 16, v12 + 32, v5, 0);
    else
      v20 = 0;
    sub_243BF54D4(0, v20, sub_243BF6D18);
    v25 = v31;
    sub_243B7FCC0(a2, a3);
    sub_243B63074(v38, (uint64_t)v39, v13, v12, v5);
    v33 = v47;
    v32 = v48;
    v34 = v46;
    *v6 = v38;
    v6[1] = v39;
    v6[2] = v32;
    v6[3] = v34;
    v6[4] = v33;
    v6[5] = v41;
  }
  else
  {
    v26 = v15;
    v27 = v15;
    v28 = v38;
    sub_243BF3034(v27, a1, a2, a3, (uint64_t)v38, v39);
    if ((v29 & 1) != 0)
    {
      sub_243BF3440(v26, a1, a2, a3);
      sub_243B7FCC0(a2, a3);
      v30 = v12;
      sub_243B63074(v38, (uint64_t)v39, v13, v12, v19);
      v28 = v49;
      v17 = (_QWORD *)v50;
    }
    else
    {
      sub_243B7FCC0(a2, a3);
      v30 = v12;
      sub_243B63074(v38, (uint64_t)v39, v13, v12, v19);
    }
    v35 = v48;
    *v6 = v28;
    v6[1] = v17;
    v6[2] = v35;
    v6[3] = v30;
    v6[4] = v19;
    v6[5] = v41;
    return 2;
  }
  return v25;
}

uint64_t sub_243BE87A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
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
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  char v76;
  _QWORD *v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  char v82;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE58);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  v18 = (uint64_t *)((char *)&v61 - v17);
  v19 = *(_QWORD *)(v2 + 32);
  if (v19 < 0)
    return 1;
  v62 = v16;
  v63 = v15;
  v64 = v6;
  v20 = *(_QWORD **)v2;
  v21 = *(_QWORD *)(v2 + 8);
  v66 = *(_QWORD *)(v2 + 16);
  v67 = *(_QWORD *)(v2 + 24);
  v68 = *(_QWORD *)(v2 + 40);
  v77 = v20;
  v78 = v21;
  v22 = (char *)v18 + *(int *)(v14 + 48);
  v23 = type metadata accessor for StoredPhoto(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *v18 = a1;
  v18[1] = 0;
  v24 = v21 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v65 = v19;
  if (!v20)
  {
    v41 = *(_QWORD *)(v21 + 16);
    if (v41)
    {
      v42 = *(_QWORD *)(v8 + 72);
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      v33 = 0;
      while (1)
      {
        sub_243B50168(v24, (uint64_t)v10, &qword_2572ED090);
        v43 = *v10;
        v44 = *v18;
        sub_243B6F978((uint64_t)v10, &qword_2572ED090);
        if (v43 == v44)
          break;
        ++v33;
        v24 += v42;
        if (v41 == v33)
          goto LABEL_17;
      }
      v45 = 0;
      goto LABEL_19;
    }
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  sub_243BFE1A4();
  sub_243BFE1D4();
  result = sub_243BFE1E0();
  v26 = 1 << v20[2];
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (!v27)
  {
    v29 = v28 & result;
    v30 = sub_243BFD2C8();
    *(_QWORD *)&v73 = v20 + 2;
    *((_QWORD *)&v73 + 1) = v20 + 4;
    *(_QWORD *)&v74 = v29;
    *((_QWORD *)&v74 + 1) = v30;
    *(_QWORD *)&v75 = v31;
    *((_QWORD *)&v75 + 1) = v32;
    v76 = 0;
    v33 = sub_243BFD2EC();
    v35 = v34;
    v69 = v73;
    v70 = v74;
    v71 = v75;
    v72 = v76;
    sub_243B62FEC(v20, v21, v66, v67, v65);
    swift_retain();
    if ((v35 & 1) == 0)
    {
      v36 = *(_QWORD *)(v8 + 72);
      while (1)
      {
        sub_243B50168(v24 + v36 * v33, (uint64_t)v10, &qword_2572ED090);
        v37 = *v10;
        v38 = *v18;
        sub_243B6F978((uint64_t)v10, &qword_2572ED090);
        if (v37 == v38)
          break;
        sub_243BFD304();
        v79 = v69;
        v80 = v70;
        v81 = v71;
        v82 = v72;
        v33 = sub_243BFD2EC();
        if ((v39 & 1) != 0)
          goto LABEL_8;
      }
      v45 = v70;
      swift_release();
LABEL_19:
      v54 = v65;
      v55 = v62;
      sub_243BF5210(v33, v45, v62);
      sub_243B6F978((uint64_t)v18, &qword_2572ED090);
      v56 = v63;
      sub_243B6F9B4(v55, v63, &qword_2572ED090);
      v57 = v77;
      v58 = v78;
      sub_243B63074(*(id *)v2, *(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
      *(_QWORD *)v2 = v57;
      *(_QWORD *)(v2 + 8) = v58;
      v59 = v67;
      *(_QWORD *)(v2 + 16) = v66;
      *(_QWORD *)(v2 + 24) = v59;
      v60 = v68;
      *(_QWORD *)(v2 + 32) = v54;
      *(_QWORD *)(v2 + 40) = v60;
      v40 = *(_QWORD *)(v56 + 8);
      sub_243B6F978(v56, &qword_2572ED090);
      return v40;
    }
LABEL_8:
    swift_release();
LABEL_17:
    sub_243B50168((uint64_t)v18, (uint64_t)v10, &qword_2572ED090);
    v46 = v66;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v69 = v46;
    v48 = (uint64_t)v64;
    sub_243BF93A4(v10, isUniquelyReferenced_nonNull_native, (uint64_t)v64);
    v49 = v69;
    swift_bridgeObjectRelease();
    sub_243B6F978(v48, &qword_2572EFE58);
    sub_243B6F978((uint64_t)v18, &qword_2572ED090);
    v50 = v77;
    v51 = v78;
    sub_243B63074(*(id *)v2, *(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
    *(_QWORD *)v2 = v50;
    *(_QWORD *)(v2 + 8) = v51;
    v52 = v67;
    *(_QWORD *)(v2 + 16) = v49;
    *(_QWORD *)(v2 + 24) = v52;
    v40 = 1;
    v53 = v68;
    *(_QWORD *)(v2 + 32) = v65;
    *(_QWORD *)(v2 + 40) = v53;
    return v40;
  }
  __break(1u);
  return result;
}

uint64_t sub_243BE8CCC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  _QWORD *v26;

  v2 = v1[4];
  if (v2 < 0)
    return 1;
  v3 = v1;
  v6 = (id)*v1;
  v5 = (_QWORD *)v1[1];
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[5];
  v25 = v6;
  v26 = v5;
  v10 = sub_243BF3034(a1, 0, 0, 0xF000000000000000, (uint64_t)v6, v5);
  if ((v12 & 1) != 0)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_243BF96F4(a1, 0, 0, 0xF000000000000000, isUniquelyReferenced_nonNull_native, (uint64_t)&v22);
    swift_bridgeObjectRelease();
    sub_243BFBA60(v22, *((uint64_t *)&v22 + 1), v23, v24);
    sub_243B924F0(0, 0xF000000000000000);
    sub_243B63074((id)*v1, v1[1], v1[2], v1[3], v1[4]);
    *v1 = v6;
    v1[1] = v5;
    v1[2] = v7;
    v1[3] = v8;
    v15 = 1;
  }
  else
  {
    v13 = v11;
    v14 = v10;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_243BF5380(v14, v13, &v22);
    v15 = *((_QWORD *)&v22 + 1);
    v16 = v23;
    v17 = v24;
    v20 = v26;
    v21 = v25;
    sub_243B63074(v6, (uint64_t)v5, v7, v8, v2);
    sub_243B924F0(v16, v17);
    *v3 = v21;
    v3[1] = v20;
    v3[2] = v7;
    v3[3] = v8;
  }
  v3[4] = v2;
  v3[5] = v9;
  return v15;
}

uint64_t sub_243BE8E88(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = *(_QWORD *)(v1 + 32);
  if (v2 < 0)
    return 0;
  v4 = *(id *)v1;
  v5 = *(_QWORD *)(v1 + 8);
  v7 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (a1 && !*(_QWORD *)(v2 + 16))
  {
    v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
    v10 = sub_243BFE0CC();
    if (v10)
    {
      v11 = v10;

    }
    else
    {
      v11 = swift_allocError();
      *v12 = a1;
    }
    sub_243B63074(*(id *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
    *(_QWORD *)v1 = v11;
    *(_QWORD *)(v1 + 16) = 0;
    *(_QWORD *)(v1 + 24) = 0;
    *(_QWORD *)(v1 + 8) = 0;
  }
  else
  {
    sub_243B63074(v4, v5, v7, v6, v2);
    *(_OWORD *)v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
  }
  *(_OWORD *)(v1 + 32) = xmmword_243BFF600;
  v13 = *(_QWORD *)(v5 + 16);
  v8 = MEMORY[0x24BEE4AF8];
  v28 = v2;
  if (v13)
  {
    v29 = MEMORY[0x24BEE4AF8];
    sub_243B7CD44(0, v13, 0);
    v8 = v29;
    result = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
    v15 = 0;
    v16 = *(_QWORD *)(result - 8);
    v17 = *(_QWORD *)(v5 + 16);
    v18 = v5 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80)) + 8;
    while (v17 != v15)
    {
      v19 = *(_QWORD *)(v18 + *(_QWORD *)(v16 + 72) * v15);
      v21 = *(_QWORD *)(v29 + 16);
      v20 = *(_QWORD *)(v29 + 24);
      if (v21 >= v20 >> 1)
        result = sub_243B7CD44(v20 > 1, v21 + 1, 1);
      ++v15;
      *(_QWORD *)(v29 + 16) = v21 + 1;
      *(_QWORD *)(v29 + 8 * v21 + 32) = v19;
      if (v13 == v15)
      {
        v2 = v28;
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_26;
  }
LABEL_17:
  v22 = *(_QWORD *)(v2 + 16);
  if (!v22)
  {
LABEL_23:
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return v8;
  }
  v30 = MEMORY[0x24BEE4AF8];
  result = sub_243B7CD28(0, v22, 0);
  v23 = *(_QWORD *)(v2 + 16);
  v24 = (uint64_t *)(v2 + 40);
  while (v23)
  {
    v25 = *v24;
    v27 = *(_QWORD *)(v30 + 16);
    v26 = *(_QWORD *)(v30 + 24);
    if (v27 >= v26 >> 1)
      result = sub_243B7CD28(v26 > 1, v27 + 1, 1);
    *(_QWORD *)(v30 + 16) = v27 + 1;
    *(_QWORD *)(v30 + 8 * v27 + 32) = v25;
    --v23;
    v24 += 2;
    if (!--v22)
      goto LABEL_23;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_243BE916C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *(_QWORD *)(v1 + 32);
  if (v2 < 0)
    return 0;
  v4 = *(id *)v1;
  v5 = *(_QWORD *)(v1 + 8);
  v7 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (a1 && !*(_QWORD *)(v2 + 16))
  {
    v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
    v10 = sub_243BFE0CC();
    if (v10)
    {
      v11 = v10;

    }
    else
    {
      v11 = swift_allocError();
      *v12 = a1;
    }
    sub_243B63074(*(id *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
    *(_QWORD *)v1 = v11;
    *(_QWORD *)(v1 + 16) = 0;
    *(_QWORD *)(v1 + 24) = 0;
    *(_QWORD *)(v1 + 8) = 0;
  }
  else
  {
    sub_243B63074(v4, v5, v7, v6, v2);
    *(_OWORD *)v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
  }
  *(_OWORD *)(v1 + 32) = xmmword_243BFF600;
  v13 = *(_QWORD *)(v5 + 16);
  v8 = MEMORY[0x24BEE4AF8];
  if (v13)
  {
    v26 = MEMORY[0x24BEE4AF8];
    result = sub_243B7CD44(0, v13, 0);
    v8 = v26;
    v15 = *(_QWORD *)(v5 + 16);
    v16 = (uint64_t *)(v5 + 40);
    while (v15)
    {
      v17 = *v16;
      v19 = *(_QWORD *)(v26 + 16);
      v18 = *(_QWORD *)(v26 + 24);
      if (v19 >= v18 >> 1)
        result = sub_243B7CD44(v18 > 1, v19 + 1, 1);
      *(_QWORD *)(v26 + 16) = v19 + 1;
      *(_QWORD *)(v26 + 8 * v19 + 32) = v17;
      --v15;
      v16 += 4;
      if (!--v13)
        goto LABEL_16;
    }
    __break(1u);
    goto LABEL_25;
  }
LABEL_16:
  v20 = *(_QWORD *)(v2 + 16);
  if (!v20)
  {
LABEL_22:
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    return v8;
  }
  v27 = MEMORY[0x24BEE4AF8];
  result = sub_243B7CD98(0, v20, 0);
  v21 = *(_QWORD *)(v2 + 16);
  v22 = (uint64_t *)(v2 + 40);
  while (v21)
  {
    v23 = *v22;
    v25 = *(_QWORD *)(v27 + 16);
    v24 = *(_QWORD *)(v27 + 24);
    if (v25 >= v24 >> 1)
      result = sub_243B7CD98(v24 > 1, v25 + 1, 1);
    *(_QWORD *)(v27 + 16) = v25 + 1;
    *(_QWORD *)(v27 + 8 * v25 + 32) = v23;
    --v21;
    v22 += 2;
    if (!--v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_243BE9418(uint64_t a1@<X8>)
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
  unint64_t v11;
  char v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = *v1;
  v4 = v1[4];
  if (v4 < 0)
  {
    if (v3)
    {
      *(_OWORD *)v1 = 0u;
      *((_OWORD *)v1 + 1) = 0u;
      *((_OWORD *)v1 + 2) = xmmword_243BFF600;
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = v3;
      *(_QWORD *)(a1 + 16) = 0;
      *(_BYTE *)(a1 + 24) = 1;
      return;
    }
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    v11 = 0xF000000000000000;
    goto LABEL_11;
  }
  v5 = v1[3];
  v6 = v1[1];
  if (*(_QWORD *)(v6 + 16))
  {
    v7 = v1[2];
    v8 = v1[5];
    v15 = *v1;
    v16 = v6;
    if (v3)
      v9 = sub_243BFAE0C(v3 + 16, v3 + 32, v6, 0);
    else
      v9 = 0;
    sub_243BF5380(0, v9, &v12);
    v10 = v16;
    *v1 = v15;
    v1[1] = v10;
    v1[2] = v7;
    v1[3] = v5;
    v1[4] = v4;
    v1[5] = v8;
    v11 = v14;
    *(_OWORD *)a1 = v13;
LABEL_11:
    *(_QWORD *)(a1 + 16) = v11;
    goto LABEL_12;
  }
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 1;
LABEL_12:
  *(_BYTE *)(a1 + 24) = 0;
}

void sub_243BE953C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = v3;
  v5 = (void *)*v3;
  v6 = v3[4];
  if (v6 < 0)
  {
    if (v5)
    {
      *(_OWORD *)v3 = 0u;
      *((_OWORD *)v3 + 1) = 0u;
      *((_OWORD *)v3 + 2) = xmmword_243BFF600;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)a3 = v5;
      *(_BYTE *)(a3 + 24) = 1;
      return;
    }
    v17 = xmmword_243C00A50;
    goto LABEL_10;
  }
  v25 = a3;
  v10 = v3[1];
  v9 = v3[2];
  v11 = v3[3];
  v12 = v3[5];
  v32 = *v3;
  v33 = v10;
  v30 = v11;
  v31 = v6;
  v29 = v12;
  swift_retain();
  sub_243B62FEC(v5, v10, v9, v11, v6);
  swift_retain();
  sub_243BF6E8C(a2);
  if (v13 != 1)
  {
    swift_release();
    swift_release();
    sub_243B63074(v5, v10, v9, v11, v6);
    v16 = v29;
    *v3 = v5;
    v3[1] = v10;
    v3[2] = v9;
    v3[3] = v11;
    v3[4] = v6;
    v3[5] = v16;
    v17 = xmmword_243C00A50;
    a3 = v25;
LABEL_10:
    *(_OWORD *)a3 = v17;
    *(_BYTE *)(a3 + 24) = 0;
    return;
  }
  v14 = *(_QWORD *)(v10 + 16);
  swift_release();
  swift_release();
  if (v14)
  {
    if (v5)
      v15 = sub_243BFAE0C((uint64_t)v5 + 16, (uint64_t)v5 + 32, v10, 0);
    else
      v15 = 0;
    sub_243BF5380(0, v15, &v26);
    sub_243B63074(v5, v10, v9, v11, v6);
    v19 = v33;
    v20 = v29;
    *v4 = v32;
    v4[1] = v19;
    v4[2] = v9;
    v4[3] = v11;
    v4[4] = v6;
    v4[5] = v20;
    v21 = v28;
    v22 = v25;
    *(_OWORD *)v25 = v27;
    *(_QWORD *)(v25 + 16) = v21;
    v23 = 2;
  }
  else
  {
    sub_243BF3148(a2, a1, v11, (_QWORD *)v6);
    if ((v18 & 1) != 0)
    {
      sub_243BF35D8(a2, a1);
      sub_243B63074(v5, v10, v9, v11, v6);
      v11 = v30;
      v6 = v31;
    }
    else
    {
      sub_243B63074(v5, v10, v9, v11, v6);
    }
    v22 = v25;
    v24 = v29;
    *v4 = v5;
    v4[1] = v10;
    v4[2] = v9;
    v4[3] = v11;
    v4[4] = v6;
    v4[5] = v24;
    *(_QWORD *)(v25 + 8) = 0;
    *(_QWORD *)(v25 + 16) = 0;
    *(_QWORD *)v25 = 0;
    v23 = -1;
  }
  *(_BYTE *)(v22 + 24) = v23;
}

uint64_t sub_243BE97A8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;

  v2 = v1[4];
  if (v2 < 0)
    return 1;
  v3 = v1;
  v6 = (void *)*v1;
  v5 = v1[1];
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[5];
  v10 = sub_243BF3148(a1, 0, v8, (_QWORD *)v2);
  if ((v12 & 1) != 0)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_243BF999C(a1, 0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    sub_243B63074(v6, v5, v7, v8, v2);
    *v1 = v6;
    v1[1] = v5;
    v1[2] = v7;
    v1[3] = v8;
    v16 = 1;
  }
  else
  {
    v13 = v11;
    v14 = v10;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_243BF54D4(v14, v13, sub_243BF6D18);
    v16 = v15;
    sub_243B63074(v6, v5, v7, v8, v2);
    *v3 = v6;
    v3[1] = v5;
    v3[2] = v7;
    v3[3] = v8;
  }
  v3[4] = v2;
  v3[5] = v9;
  return v16;
}

uint64_t sub_243BE9934(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v2 = a1[4];
  if (v2 < 0)
    return 0;
  v4 = *a1;
  v5 = a1[3];
  if (*(_QWORD *)(v2 + 16))
  {
    v7 = a1[1];
    v8 = a1[2];
    v9 = a1[5];
    v13 = a1[3];
    if (v5)
      v10 = sub_243BFA7B8(v5 + 16, v5 + 32, v2, 0);
    else
      v10 = 0;
    sub_243BF54D4(0, v10, a2);
    result = v12;
    *a1 = v4;
    a1[1] = v7;
    a1[2] = v8;
    a1[3] = v13;
    a1[4] = v2;
    a1[5] = v9;
  }
  else
  {
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    swift_release();
    swift_release();
    return 1;
  }
  return result;
}

uint64_t sub_243BE9A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a2;
  return swift_task_switch();
}

uint64_t sub_243BE9A50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;

  v2 = v0[11];
  v1 = v0[12];
  v3 = (os_unfair_lock_s *)v0[10];
  v0[2] = v0;
  v0[3] = sub_243B69494;
  v4 = swift_continuation_init();
  sub_243BFAF24(v4, v3, v2, v1);
  return swift_continuation_await();
}

void sub_243BE9AB4(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3)
{
  sub_243BE9AC0(a1, a2, a3, sub_243BE8CCC);
}

void sub_243BE9AC0(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  os_unfair_lock_s *v6;
  unint64_t v7;

  v6 = a1 + 16;
  os_unfair_lock_lock(a1 + 16);
  v7 = a4(a3);
  os_unfair_lock_unlock(v6);
  if (v7 >= 2)
    swift_continuation_throwingResume();
}

uint64_t sub_243BE9B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[13] = a2;
  v4[14] = a4;
  v4[12] = a1;
  return swift_task_switch();
}

uint64_t sub_243BE9B44()
{
  _QWORD *v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v2 = (os_unfair_lock_s *)v0[13];
  v1 = v0[14];
  v0[7] = v0 + 10;
  v0[2] = v0;
  v0[3] = sub_243BE9BA8;
  v3 = swift_continuation_init();
  sub_243BFB12C(v3, v2, v1);
  return swift_continuation_await();
}

uint64_t sub_243BE9BA8()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
    swift_willThrow();
  else
    *(_OWORD *)*(_QWORD *)(v1 + 96) = *(_OWORD *)(v1 + 80);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_243BE9C0C(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3)
{
  os_unfair_lock_s *v4;
  unint64_t v5;
  __int128 v6;

  v4 = a1 + 16;
  os_unfair_lock_lock(a1 + 16);
  v5 = sub_243BE97A8(a3);
  os_unfair_lock_unlock(v4);
  if (v5 >= 2)
  {
    v6 = xmmword_243C00A50;
    sub_243B6F9B4((uint64_t)&v6, *(_QWORD *)(*(_QWORD *)(v5 + 64) + 40), &qword_2572EFC08);
    swift_continuation_throwingResume();
  }
}

uint64_t sub_243BE9C90(uint64_t a1, unsigned int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDC8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, double))(v10 + 48))(a1, 1, v9, v11) == 1)
  {
    sub_243B6F978(a1, &qword_2572EFDC8);
    v14 = sub_243B7D040(a2);
    if ((v15 & 1) != 0)
    {
      v16 = v14;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v18 = *v3;
      v23 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_243BFA16C();
        v18 = v23;
      }
      sub_243B6F9B4(*(_QWORD *)(v18 + 56) + *(_QWORD *)(v10 + 72) * v16, (uint64_t)v8, &qword_2572EBA10);
      sub_243BFA544(v16, v18);
      *v3 = v18;
      swift_bridgeObjectRelease();
      v19 = 0;
    }
    else
    {
      v19 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v19, 1, v9);
    return sub_243B6F978((uint64_t)v8, &qword_2572EFDC8);
  }
  else
  {
    sub_243B6F9B4(a1, (uint64_t)v13, &qword_2572EBA10);
    v20 = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v3;
    *v3 = 0x8000000000000000;
    sub_243BA2A78((uint64_t)v13, a2, v20);
    *v3 = v23;
    return swift_bridgeObjectRelease();
  }
}

uint64_t XPCMessageCenter.__allocating_init(serviceName:client:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  XPCMessageCenter.init(serviceName:client:)(a1, a2, a3);
  return v6;
}

uint64_t sub_243BE9EC0(void (*a1)(uint64_t *__return_ptr), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  char isEscapingClosureAtFileLocation;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_243BFD6AC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_2543CE238 != -1)
    swift_once();
  v9 = (void *)*((_QWORD *)off_2543CE228 + 2);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5610], v5);
  v10 = v9;
  LOBYTE(v9) = sub_243BFD6B8();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) != 0)
  {
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a1;
    *(_QWORD *)(v12 + 24) = a2;
    a1(&v15);
    if (v2)
    {
      swift_release();
      return a2;
    }
    a2 = v15;
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return a2;
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_243BEA030(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  char isEscapingClosureAtFileLocation;
  uint64_t v14;

  v5 = sub_243BFD6AC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_2543CE238 != -1)
    swift_once();
  v9 = (void *)*((_QWORD *)off_2543CE228 + 2);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5610], v5);
  v10 = v9;
  LOBYTE(v9) = sub_243BFD6B8();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  a1();
  if (v2)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    goto LABEL_9;
  return result;
}

void sub_243BEA19C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  int *v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20[3];

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDC8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_DWORD *)(v3 + 32);
  if (v9 == -1)
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(v3 + 32) = v9 + 1;
    v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
    swift_retain();
    sub_243BFDEEC();
    v11 = (_QWORD *)((char *)a2 + v10[9]);
    *v11 = 0;
    v11[1] = 0;
    *(_QWORD *)((char *)a2 + v10[10]) = 0;
    *a2 = a1;
    *(_DWORD *)((char *)a2 + v10[8]) = v9;
    sub_243B50168((uint64_t)a2, (uint64_t)v8, &qword_2572EBA10);
    (*(void (**)(char *, _QWORD, uint64_t, int *))(*((_QWORD *)v10 - 1) + 56))(v8, 0, 1, v10);
    swift_beginAccess();
    sub_243BE9C90((uint64_t)v8, v9);
    swift_endAccess();
    if (qword_2543CE380 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v12 = sub_243BFD598();
  __swift_project_value_buffer(v12, (uint64_t)qword_2543CE368);
  swift_retain();
  v13 = sub_243BFD580();
  v14 = sub_243BFDC94();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v20[0] = v16;
    *(_DWORD *)v15 = 136315394;
    v17 = *(_QWORD *)(v3 + 16);
    v18 = *(_QWORD *)(v3 + 24);
    swift_bridgeObjectRetain();
    v19 = sub_243B739A8(v17, v18, v20);
    sub_243BFDD54();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 1024;
    LODWORD(v19) = v9;
    sub_243BFDD54();
    _os_log_impl(&dword_243B4B000, v13, v14, "%s: Inserted request %u", (uint8_t *)v15, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x249502C5C](v16, -1, -1);
    MEMORY[0x249502C5C](v15, -1, -1);

  }
  else
  {

    swift_release();
  }
  sub_243BEB5E0();
}

uint64_t sub_243BEA458(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDC8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v10 = *(_QWORD *)(v1 + 40);
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_243B7D040(a1), (v12 & 1) != 0))
  {
    sub_243B50168(*(_QWORD *)(v10 + 56) + *(_QWORD *)(v4 + 72) * v11, (uint64_t)v9, &qword_2572EBA10);
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, v13, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_243B6F978((uint64_t)v9, &qword_2572EFDC8);
    return 0;
  }
  else
  {
    sub_243B50168((uint64_t)v9, (uint64_t)v6, &qword_2572EBA10);
    sub_243B6F978((uint64_t)v9, &qword_2572EFDC8);
    v14 = *(_QWORD *)&v6[*(int *)(v3 + 40)];
    sub_243B6F978((uint64_t)v6, &qword_2572EBA10);
  }
  return v14;
}

uint64_t sub_243BEA5D8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)(v3 + 212) = a2;
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDC8);
  *(_QWORD *)(v3 + 128) = swift_task_alloc();
  *(_QWORD *)(v3 + 136) = swift_task_alloc();
  *(_QWORD *)(v3 + 144) = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v3 + 152) = sub_243BFD9F4();
  *(_QWORD *)(v3 + 160) = v4;
  return swift_task_switch();
}

uint64_t sub_243BEA6C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  int v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  _BYTE *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + 120);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 40);
  if (*(_QWORD *)(v2 + 16))
  {
    v3 = sub_243B7D040(*(_DWORD *)(v0 + 212));
    v4 = *(_QWORD *)(v0 + 144);
    if ((v5 & 1) != 0)
    {
      v6 = v3;
      v7 = *(_QWORD *)(v2 + 56);
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
      v9 = *(_QWORD *)(v8 - 8);
      sub_243B50168(v7 + *(_QWORD *)(v9 + 72) * v6, v4, &qword_2572EBA10);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
    }
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 144);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  v13 = *(_QWORD *)(v0 + 136);
  sub_243B50168(*(_QWORD *)(v0 + 144), v13, &qword_2572EFDC8);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  *(_QWORD *)(v0 + 168) = v14;
  v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48);
  v16 = v15(v13, 1, v14);
  sub_243B6F978(v13, &qword_2572EFDC8);
  if (v16 == 1)
  {
    if (qword_2543CE380 != -1)
      swift_once();
    v17 = sub_243BFD598();
    __swift_project_value_buffer(v17, (uint64_t)qword_2543CE368);
    swift_retain();
    v18 = sub_243BFD580();
    v19 = sub_243BFDCA0();
    v20 = os_log_type_enabled(v18, v19);
    v21 = *(_QWORD *)(v0 + 120);
    if (v20)
    {
      v29 = *(_DWORD *)(v0 + 212);
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v30 = v23;
      *(_DWORD *)v22 = 136315394;
      v24 = *(_QWORD *)(v21 + 16);
      v25 = *(_QWORD *)(v21 + 24);
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 104) = sub_243B739A8(v24, v25, &v30);
      sub_243BFDD54();
      swift_bridgeObjectRelease();
      swift_release();
      *(_WORD *)(v22 + 12) = 1024;
      *(_DWORD *)(v0 + 208) = v29;
      sub_243BFDD54();
      _os_log_impl(&dword_243B4B000, v18, v19, "%s: Received response for non-existent request %u", (uint8_t *)v22, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v23, -1, -1);
      MEMORY[0x249502C5C](v22, -1, -1);
    }
    else
    {
      swift_release();
    }

    sub_243BAF448();
    swift_allocError();
    *v27 = 2;
    v28 = *(_QWORD *)(v0 + 144);
    swift_willThrow();
    sub_243B6F978(v28, &qword_2572EFDC8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    result = v15(*(_QWORD *)(v0 + 144), 1, v14);
    if ((_DWORD)result == 1)
      __break(1u);
    else
      return swift_task_switch();
  }
  return result;
}

uint64_t sub_243BEAA74()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);

  v1 = (uint64_t *)v0[18];
  v2 = (uint64_t *)((char *)v1 + *(int *)(v0[21] + 36));
  v3 = *v2;
  if (*v2)
  {
    v4 = v2[1];
  }
  else
  {
    v5 = *v1;
    v3 = *(_QWORD *)(v5 + 16);
    v4 = *(_QWORD *)(v5 + 24);
    *v2 = v3;
    v2[1] = v4;
    swift_retain();
    swift_retain();
  }
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2572EFDF8 + dword_2572EFDF8);
  v6 = (_QWORD *)swift_task_alloc();
  v0[22] = v6;
  *v6 = v0;
  v6[1] = sub_243BEAB24;
  return v8((uint64_t)(v0 + 11), v3, v4);
}

uint64_t sub_243BEAB24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BEAB88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(int *)(*(_QWORD *)(v0 + 168) + 40);
  v3 = *(_QWORD *)(v1 + v2);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + v2) = v5;
    *(_OWORD *)(v0 + 192) = *(_OWORD *)(v0 + 88);
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_243BEABC0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 200);
  if (v1 >> 60 == 15)
  {
    v2 = *(_QWORD *)(v0 + 128);
    v3 = *(_DWORD *)(v0 + 212);
    swift_beginAccess();
    sub_243BEAD68(v3, v2);
    sub_243B6F978(v2, &qword_2572EFDC8);
    swift_endAccess();
    v1 = *(_QWORD *)(v0 + 200);
  }
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD **)(v0 + 112);
  *v5 = *(_QWORD *)(v0 + 192);
  v5[1] = v1;
  sub_243B6F978(v4, &qword_2572EFDC8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BEAC90()
{
  return swift_task_switch();
}

uint64_t sub_243BEACA0()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_DWORD *)(v0 + 212);
  swift_beginAccess();
  sub_243BEAD68(v2, v1);
  sub_243B6F978(v1, &qword_2572EFDC8);
  swift_endAccess();
  v3 = *(_QWORD *)(v0 + 144);
  swift_willThrow();
  sub_243B6F978(v3, &qword_2572EFDC8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BEAD68@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v5 = sub_243B7D040(a1);
  if ((v6 & 1) != 0)
  {
    v7 = v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v2;
    v15 = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_243BFA16C();
      v9 = v15;
    }
    v10 = *(_QWORD *)(v9 + 56);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
    v12 = *(_QWORD *)(v11 - 8);
    sub_243B6F9B4(v10 + *(_QWORD *)(v12 + 72) * v7, a2, &qword_2572EBA10);
    sub_243BFA544(v7, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v11);
  }
  else
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a2, 1, 1, v14);
  }
}

uint64_t sub_243BEAE68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BYTE *v19;
  os_unfair_lock_s *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  id v28;
  uint64_t j;
  uint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  id v33;
  uint64_t v34;
  id v35;
  unsigned int v36;
  uint64_t *v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char v53[16];
  uint64_t v54;
  uint64_t v55;
  void *v56;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDC8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (uint64_t *)(v1 + 40);
  swift_beginAccess();
  v11 = *(_QWORD *)(v1 + 40);
  v54 = a1;
  swift_bridgeObjectRetain();
  sub_243BEB2A8((uint64_t (*)(char *))sub_243BFBB24, (uint64_t)v53, v11);
  v13 = v12;
  v51 = *(_QWORD *)(v12 + 16);
  if (!v51)
    return v13;
  v48 = v12 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  result = swift_bridgeObjectRetain();
  v15 = 0;
  v46 = v9;
  v47 = v7;
  v44 = v6;
  v45 = v5;
  v49 = v13;
  v50 = v10;
  while (v15 < *(_QWORD *)(v13 + 16))
  {
    v52 = *(_QWORD *)(v7 + 72);
    sub_243B50168(v48 + v52 * v15, (uint64_t)v9, &qword_2572EBA10);
    v17 = *v9;
    sub_243BAF448();
    v18 = (void *)swift_allocError();
    *v19 = 1;
    v20 = (os_unfair_lock_s *)(*(_QWORD *)(v17 + 16) + 64);
    v21 = v18;
    os_unfair_lock_lock(v20);
    v22 = sub_243BE916C(v18);
    v24 = v23;
    os_unfair_lock_unlock(v20);
    if (v22)
    {
      v25 = *(_QWORD *)(v22 + 16);
      if (v25)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)(v22 + 8 * i + 32))
            swift_continuation_throwingResume();
        }
        swift_bridgeObjectRelease();
        v27 = *(_QWORD *)(v24 + 16);
        if (v27)
        {
LABEL_13:
          v28 = v18;
          swift_bridgeObjectRetain();
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)(v24 + 8 * j + 32))
            {
              v56 = v18;
              v33 = v18;
              __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
              v34 = sub_243BFE0CC();
              if (v34)
              {
                v30 = v34;

              }
              else
              {
                v30 = swift_allocError();
                *v31 = v56;
              }
              swift_allocError();
              *v32 = v30;
              swift_continuation_throwingResumeWithError();
            }
          }
          swift_bridgeObjectRelease();
          v6 = v44;
          v5 = v45;
          goto LABEL_23;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        v27 = *(_QWORD *)(v24 + 16);
        if (v27)
          goto LABEL_13;
      }
      v35 = v18;
LABEL_23:
      v9 = v46;
      v7 = v47;
      sub_243B6A1DC(v22);

      swift_bridgeObjectRelease();
    }

    v36 = *(_DWORD *)((char *)v9 + *(int *)(v6 + 32));
    v37 = v50;
    swift_beginAccess();
    v38 = sub_243B7D040(v36);
    if ((v39 & 1) != 0)
    {
      v40 = v38;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v42 = *v37;
      v55 = *v37;
      *v37 = 0x8000000000000000;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_243BFA16C();
        v42 = v55;
      }
      sub_243B6F9B4(*(_QWORD *)(v42 + 56) + v40 * v52, (uint64_t)v5, &qword_2572EBA10);
      sub_243BFA544(v40, v42);
      *v37 = v42;
      swift_bridgeObjectRelease();
      v16 = 0;
    }
    else
    {
      v16 = 1;
    }
    ++v15;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v16, 1, v6);
    sub_243B6F978((uint64_t)v5, &qword_2572EFDC8);
    swift_endAccess();
    result = sub_243B6F978((uint64_t)v9, &qword_2572EBA10);
    v13 = v49;
    if (v15 == v51)
    {
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  __break(1u);
  return result;
}

void sub_243BEB2A8(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t (*v37)(char *);
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v37 = a1;
  v38 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v33 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - v9;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - v12;
  v14 = 0;
  v39 = a3;
  v15 = *(_QWORD *)(a3 + 64);
  v35 = a3 + 64;
  v16 = 1 << *(_BYTE *)(a3 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v34 = MEMORY[0x24BEE4AF8];
  v40 = MEMORY[0x24BEE4AF8];
  v18 = v17 & v15;
  v36 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v14++, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v14 >= v36)
      goto LABEL_32;
    v22 = *(_QWORD *)(v35 + 8 * v14);
    if (!v22)
      break;
LABEL_18:
    v18 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v14 << 6);
LABEL_19:
    v24 = *(_QWORD *)(v6 + 72);
    sub_243B50168(*(_QWORD *)(v39 + 56) + v24 * v20, (uint64_t)v10, &qword_2572EBA10);
    sub_243B6F9B4((uint64_t)v10, (uint64_t)v13, &qword_2572EBA10);
    v25 = v37(v13);
    if (v3)
    {
      sub_243B6F978((uint64_t)v13, &qword_2572EBA10);
      swift_release();
LABEL_32:
      swift_release();
      return;
    }
    if ((v25 & 1) != 0)
    {
      sub_243B6F9B4((uint64_t)v13, v33, &qword_2572EBA10);
      v26 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_243B7CE5C(0, *(_QWORD *)(v26 + 16) + 1, 1);
      v27 = v40;
      v29 = *(_QWORD *)(v40 + 16);
      v28 = *(_QWORD *)(v40 + 24);
      v30 = v29 + 1;
      if (v29 >= v28 >> 1)
      {
        v34 = v29 + 1;
        v32 = v29;
        sub_243B7CE5C(v28 > 1, v29 + 1, 1);
        v30 = v34;
        v29 = v32;
        v27 = v40;
      }
      *(_QWORD *)(v27 + 16) = v30;
      v31 = *(unsigned __int8 *)(v6 + 80);
      v34 = v27;
      sub_243B6F9B4(v33, v27 + ((v31 + 32) & ~v31) + v29 * v24, &qword_2572EBA10);
    }
    else
    {
      sub_243B6F978((uint64_t)v13, &qword_2572EBA10);
    }
  }
  v23 = v14 + 1;
  if (v14 + 1 >= v36)
    goto LABEL_32;
  v22 = *(_QWORD *)(v35 + 8 * v23);
  if (v22)
    goto LABEL_17;
  v23 = v14 + 2;
  if (v14 + 2 >= v36)
    goto LABEL_32;
  v22 = *(_QWORD *)(v35 + 8 * v23);
  if (v22)
    goto LABEL_17;
  v23 = v14 + 3;
  if (v14 + 3 >= v36)
    goto LABEL_32;
  v22 = *(_QWORD *)(v35 + 8 * v23);
  if (v22)
    goto LABEL_17;
  v23 = v14 + 4;
  if (v14 + 4 >= v36)
    goto LABEL_32;
  v22 = *(_QWORD *)(v35 + 8 * v23);
  if (v22)
  {
LABEL_17:
    v14 = v23;
    goto LABEL_18;
  }
  while (1)
  {
    v14 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v14 >= v36)
      goto LABEL_32;
    v22 = *(_QWORD *)(v35 + 8 * v14);
    ++v23;
    if (v22)
      goto LABEL_18;
  }
LABEL_34:
  __break(1u);
}

void sub_243BEB5E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBF48);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(v0 + 72))
  {
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)(v0 + 40) + 16))
    {
      if (*(_BYTE *)(v0 + 64) != 1)
      {
        v4 = *(_QWORD *)(v0 + 48);
        v5 = *(_QWORD *)(v0 + 56);
        v6 = sub_243BFDA60();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v3, 1, 1, v6);
        v7 = qword_2543CE238;
        swift_retain();
        if (v7 != -1)
          swift_once();
        v8 = off_2543CE228;
        v9 = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
        v10 = (_QWORD *)swift_allocObject();
        v10[2] = v8;
        v10[3] = v9;
        v10[4] = v0;
        v10[5] = v4;
        v10[6] = v5;
        swift_retain();
        *(_QWORD *)(v0 + 72) = sub_243BD73EC((uint64_t)v3, (uint64_t)&unk_2572EFDD8, (uint64_t)v10);
        swift_release();
      }
    }
  }
}

uint64_t sub_243BEB758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[13] = a5;
  v6[14] = a6;
  v6[12] = a4;
  v7 = sub_243BFDF10();
  v6[15] = v7;
  v6[16] = *(_QWORD *)(v7 - 8);
  v6[17] = swift_task_alloc();
  v6[18] = swift_task_alloc();
  v8 = sub_243BFDF28();
  v6[19] = v8;
  v6[20] = *(_QWORD *)(v8 - 8);
  v6[21] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v6[22] = sub_243BFD9F4();
  v6[23] = v9;
  return swift_task_switch();
}

uint64_t sub_243BEB860()
{
  uint64_t v0;

  swift_beginAccess();
  sub_243BFDF1C();
  *(_OWORD *)(v0 + 64) = xmmword_243C01280;
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_BYTE *)(v0 + 56) = 1;
  return swift_task_switch();
}

uint64_t sub_243BEB8CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v2 = v0[16];
  v1 = v0[17];
  v3 = v0[15];
  sub_243B88508(&qword_2572EE298, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_243BFE144();
  sub_243B88508(&qword_2572EE2A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_243BFDF34();
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[24] = v4;
  v4(v1, v3);
  v5 = (_QWORD *)swift_task_alloc();
  v0[25] = v5;
  *v5 = v0;
  v5[1] = sub_243BEB9D8;
  return sub_243BFE150();
}

uint64_t sub_243BEB9D8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 192))(*(_QWORD *)(v2 + 144), *(_QWORD *)(v2 + 120));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 160);
    v3 = *(_QWORD *)(v2 + 168);
    v5 = *(_QWORD *)(v2 + 152);
    (*(void (**)(_QWORD, _QWORD))(v2 + 192))(*(_QWORD *)(v2 + 144), *(_QWORD *)(v2 + 120));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_243BEBA7C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 40) + 16))
  {
    sub_243BEBE34(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
    sub_243BFDF1C();
    *(_OWORD *)(v0 + 64) = xmmword_243C01280;
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0;
    *(_BYTE *)(v0 + 56) = 1;
    return swift_task_switch();
  }
  else
  {
    *(_QWORD *)(v1 + 72) = 0;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_243BEBB34()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD))(v0[20] + 8))(v0[21], v0[19]);
  return swift_task_switch();
}

uint64_t sub_243BEBB74()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  NSObject *log;
  _QWORD *v17;
  os_log_type_t type;
  uint64_t v19;
  uint64_t v20;

  if (qword_2543CE380 != -1)
    swift_once();
  v1 = *(void **)(v0 + 208);
  v2 = sub_243BFD598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2543CE368);
  swift_retain();
  v3 = v1;
  swift_retain();
  v4 = v1;
  v5 = sub_243BFD580();
  v6 = sub_243BFDCB8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 208);
  v9 = *(_QWORD *)(v0 + 96);
  if (v7)
  {
    type = v6;
    v10 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = v19;
    *(_DWORD *)v10 = 136315394;
    log = v5;
    v11 = *(_QWORD *)(v9 + 16);
    v12 = *(_QWORD *)(v9 + 24);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 80) = sub_243B739A8(v11, v12, &v20);
    sub_243BFDD54();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v10 + 12) = 2112;
    v13 = v8;
    v14 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 88) = v14;
    sub_243BFDD54();
    *v17 = v14;

    _os_log_impl(&dword_243B4B000, log, type, "%s: Failed to sleep during timeout task: %@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED240);
    swift_arrayDestroy();
    MEMORY[0x249502C5C](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x249502C5C](v19, -1, -1);
    MEMORY[0x249502C5C](v10, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  *(_QWORD *)(*(_QWORD *)(v0 + 96) + 72) = 0;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_243BEBE34(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  NSObject *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v3 = v2;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  v6 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_243BFDF10();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v54 - v14;
  swift_beginAccess();
  if (*(_QWORD *)(v3[5] + 16))
  {
    v61 = v10;
    if (qword_2543CE380 != -1)
      swift_once();
    v16 = sub_243BFD598();
    v17 = __swift_project_value_buffer(v16, (uint64_t)qword_2543CE368);
    swift_retain();
    v60 = v17;
    v18 = sub_243BFD580();
    v19 = sub_243BFDC94();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v58 = a1;
      v21 = v20;
      v55 = swift_slowAlloc();
      v64 = v55;
      *(_DWORD *)v21 = 136315394;
      v56 = v9;
      v57 = v6;
      v59 = a2;
      v22 = v3[2];
      v23 = v3[3];
      swift_bridgeObjectRetain();
      v63 = sub_243B739A8(v22, v23, &v64);
      sub_243BFDD54();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      v24 = sub_243BFE21C();
      v63 = sub_243B739A8(v24, v25, &v64);
      v6 = v57;
      sub_243BFDD54();
      v9 = v56;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243B4B000, v18, v19, "%s: Checking for timeout requests that are over %s old.", (uint8_t *)v21, 0x16u);
      v26 = v55;
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v26, -1, -1);
      MEMORY[0x249502C5C](v21, -1, -1);

    }
    else
    {

      swift_release();
    }
    sub_243BFDEEC();
    v34 = sub_243BFE234();
    v35 = MEMORY[0x2495025D8](v34);
    MEMORY[0x2495022B4](v35);
    v36 = *(void (**)(char *, uint64_t))(v61 + 8);
    v36(v12, v9);
    v37 = sub_243BEAE68((uint64_t)v15);
    v36(v15, v9);
    if (*(_QWORD *)(v37 + 16))
    {
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      v38 = sub_243BFD580();
      v39 = sub_243BFDCB8();
      if (os_log_type_enabled(v38, (os_log_type_t)v39))
      {
        v40 = swift_slowAlloc();
        v61 = swift_slowAlloc();
        v64 = v61;
        *(_DWORD *)v40 = 136315650;
        v41 = v3[2];
        v42 = v3[3];
        swift_bridgeObjectRetain();
        v63 = sub_243B739A8(v41, v42, &v64);
        sub_243BFDD54();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 12) = 2048;
        v43 = *(_QWORD *)(v37 + 16);
        swift_bridgeObjectRelease();
        v63 = v43;
        sub_243BFDD54();
        swift_bridgeObjectRelease();
        *(_WORD *)(v40 + 22) = 2080;
        if (v43)
        {
          LODWORD(v58) = v39;
          v59 = v40;
          v60 = v38;
          v63 = MEMORY[0x24BEE4AF8];
          sub_243B7CE40(0, v43, 0);
          v44 = v37 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
          v45 = *(_QWORD *)(v6 + 72);
          v46 = v63;
          do
          {
            sub_243B50168(v44, (uint64_t)v8, &qword_2572EBA10);
            v47 = *(_DWORD *)&v8[*(int *)(v62 + 32)];
            sub_243B6F978((uint64_t)v8, &qword_2572EBA10);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_243B7CE40(0, *(_QWORD *)(v46 + 16) + 1, 1);
              v46 = v63;
            }
            v49 = *(_QWORD *)(v46 + 16);
            v48 = *(_QWORD *)(v46 + 24);
            if (v49 >= v48 >> 1)
            {
              sub_243B7CE40(v48 > 1, v49 + 1, 1);
              v46 = v63;
            }
            *(_QWORD *)(v46 + 16) = v49 + 1;
            *(_DWORD *)(v46 + 4 * v49 + 32) = v47;
            v44 += v45;
            --v43;
          }
          while (v43);
          swift_bridgeObjectRelease();
          v40 = v59;
          v38 = v60;
          LOBYTE(v39) = v58;
        }
        else
        {
          swift_bridgeObjectRelease();
          v46 = MEMORY[0x24BEE4AF8];
        }
        v50 = MEMORY[0x249501D08](v46, MEMORY[0x24BEE44F0]);
        v52 = v51;
        swift_bridgeObjectRelease();
        v63 = sub_243B739A8(v50, v52, &v64);
        sub_243BFDD54();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_243B4B000, v38, (os_log_type_t)v39, "%s: Timed out %ld requests: %s", (uint8_t *)v40, 0x20u);
        v53 = v61;
        swift_arrayDestroy();
        MEMORY[0x249502C5C](v53, -1, -1);
        MEMORY[0x249502C5C](v40, -1, -1);

      }
      else
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (qword_2543CE380 != -1)
      swift_once();
    v27 = sub_243BFD598();
    __swift_project_value_buffer(v27, (uint64_t)qword_2543CE368);
    swift_retain();
    v28 = sub_243BFD580();
    v29 = sub_243BFDC94();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v64 = v31;
      *(_DWORD *)v30 = 136315138;
      v32 = v3[2];
      v33 = v3[3];
      swift_bridgeObjectRetain();
      v63 = sub_243B739A8(v32, v33, &v64);
      sub_243BFDD54();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243B4B000, v28, v29, "%s: Checked timeout requests, is empty, returning.", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v31, -1, -1);
      MEMORY[0x249502C5C](v30, -1, -1);

    }
    else
    {

      swift_release();
    }
  }
}

uint64_t sub_243BEC5A0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7165527472617473 && a2 == 0xEC00000074736575;
  if (v2 || (sub_243BFE0F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x78654E6863746566 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_243BFE0F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_243BEC6B4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x78654E6863746566;
  else
    return 0x7165527472617473;
}

uint64_t sub_243BEC6F8(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4)
{
  return sub_243BEE948(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243B51D98);
}

uint64_t sub_243BEC708(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_243BEE99C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243B51DA8);
}

uint64_t sub_243BEC714(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_243BEE9C4(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243B51DA8);
}

uint64_t sub_243BEC720(_QWORD *a1, uint64_t a2)
{
  return sub_243BEEA28(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BEC6B4);
}

uint64_t sub_243BEC72C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_243BEEBA0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BEC5A0, a4);
}

uint64_t sub_243BEC738()
{
  return 0;
}

uint64_t sub_243BEC744@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_243BEEBE4(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BD5B58, a2);
}

uint64_t sub_243BEC750(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05278, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEC784(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05278, a1);
  return sub_243BFE24C();
}

uint64_t sub_243BEC7B8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_243BFE0F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_243BFE0F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_243BEC878(char a1)
{
  if ((a1 & 1) != 0)
    return 12639;
  else
    return 12383;
}

void sub_243BEC890()
{
  type metadata accessor for XPCMessageCenter.XPCRequest.FetchNextCodingKeys();
}

void sub_243BEC8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = MEMORY[0x249502B6C](&unk_243C05318, a1);
  *(_QWORD *)(v14 - 216) = a1;
  *(_QWORD *)(v14 - 232) = v16;
  v17 = sub_243BFE090();
  *(_QWORD *)(v14 - 208) = v17;
  *(_QWORD *)(v14 - 264) = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v14 - 224) = (char *)&a9 - v18;
  *(_QWORD *)(v14 - 128) = v11;
  *(_QWORD *)(v14 - 120) = v9;
  *(_QWORD *)(v14 - 112) = v13;
  *(_QWORD *)(v14 - 104) = v10;
  *(_QWORD *)(v14 - 96) = v12;
  type metadata accessor for XPCMessageCenter.XPCRequest.StartRequestCodingKeys();
}

void sub_243BEC960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t AssociatedTypeWitness;
  uint64_t v19;
  uint64_t v20;

  *(_QWORD *)(v14 - 248) = MEMORY[0x249502B6C](&unk_243C052C8, a1);
  *(_QWORD *)(v14 - 240) = a1;
  v16 = sub_243BFE090();
  *(_QWORD *)(v14 - 200) = v16;
  *(_QWORD *)(v14 - 272) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v14 - 136) = (char *)&a9 - v17;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v14 - 256) = AssociatedTypeWitness;
  *(_QWORD *)(v14 - 152) = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  *(_QWORD *)(v14 - 160) = (char *)&a9 - v19;
  MEMORY[0x24BDAC7A8](v20);
  *(_QWORD *)(v14 - 128) = v11;
  *(_QWORD *)(v14 - 120) = v9;
  *(_QWORD *)(v14 - 112) = v13;
  *(_QWORD *)(v14 - 104) = v10;
  *(_QWORD *)(v14 - 192) = v12;
  *(_QWORD *)(v14 - 96) = v12;
  type metadata accessor for XPCMessageCenter.XPCRequest.CodingKeys();
}

uint64_t sub_243BECA5C(uint64_t a1)
{
  _QWORD *v1;
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
  uint64_t v13;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  MEMORY[0x249502B6C](&unk_243C05278, a1);
  v6 = sub_243BFE090();
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 - 184) = v6;
  *(_QWORD *)(v5 - 176) = v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - v8;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_243BFE210();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v3, *(_QWORD *)(v5 - 144), v2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = *(_QWORD *)(v5 - 264);
    *(_BYTE *)(v5 - 128) = 1;
    v11 = *(_QWORD *)(v5 - 224);
    v12 = *(_QWORD *)(v5 - 184);
    sub_243BFE060();
    v13 = *(_QWORD *)(v5 - 208);
    sub_243BFE084();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v13);
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 176) + 8))(v9, v12);
  }
  else
  {
    v15 = *(_QWORD *)(v5 - 256);
    v16 = (uint64_t *)(v3 + *(int *)(swift_getTupleTypeMetadata2() + 48));
    v18 = *v16;
    v17 = v16[1];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 152) + 32))(*(_QWORD *)(v5 - 160), v3, v15);
    *(_BYTE *)(v5 - 128) = 0;
    v19 = *(_QWORD *)(v5 - 184);
    sub_243BFE060();
    *(_BYTE *)(v5 - 128) = 0;
    v20 = *(_QWORD *)(v5 - 200);
    v21 = *(_QWORD *)(v5 - 168);
    sub_243BFE078();
    if (v21)
    {
      sub_243B7FCC0(v18, v17);
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v5 - 272) + 8))(*(_QWORD *)(v5 - 136), v20);
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v5 - 152) + 8))(*(_QWORD *)(v5 - 160), v15);
      return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 176) + 8))(v9, v19);
    }
    else
    {
      *(_QWORD *)(v5 - 128) = v18;
      *(_QWORD *)(v5 - 120) = v17;
      *(_BYTE *)(v5 - 65) = 1;
      sub_243BFCC2C();
      sub_243BFE078();
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v5 - 272) + 8))(*(_QWORD *)(v5 - 136), v20);
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v5 - 152) + 8))(*(_QWORD *)(v5 - 160), v15);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 176) + 8))(v9, v19);
      return sub_243B7FCC0(v18, v17);
    }
  }
}

void sub_243BECD08()
{
  type metadata accessor for XPCMessageCenter.XPCRequest.FetchNextCodingKeys();
}

void sub_243BECD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v14 - 232) = MEMORY[0x249502B6C](&unk_243C05318, a1);
  *(_QWORD *)(v14 - 224) = a1;
  v16 = sub_243BFE054();
  *(_QWORD *)(v14 - 296) = v16;
  *(_QWORD *)(v14 - 304) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v14 - 216) = (char *)&a9 - v17;
  *(_QWORD *)(v14 - 128) = v13;
  *(_QWORD *)(v14 - 120) = v11;
  *(_QWORD *)(v14 - 112) = v12;
  *(_QWORD *)(v14 - 104) = v10;
  *(_QWORD *)(v14 - 96) = v9;
  type metadata accessor for XPCMessageCenter.XPCRequest.StartRequestCodingKeys();
}

void sub_243BECDE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v14 - 248) = MEMORY[0x249502B6C](&unk_243C052C8, a1);
  *(_QWORD *)(v14 - 240) = a1;
  v16 = sub_243BFE054();
  *(_QWORD *)(v14 - 264) = v16;
  *(_QWORD *)(v14 - 288) = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)(v14 - 192) = (char *)&a9 - v17;
  *(_QWORD *)(v14 - 128) = v13;
  *(_QWORD *)(v14 - 120) = v11;
  *(_QWORD *)(v14 - 112) = v12;
  *(_QWORD *)(v14 - 104) = v10;
  *(_QWORD *)(v14 - 96) = v9;
  type metadata accessor for XPCMessageCenter.XPCRequest.CodingKeys();
}

void sub_243BECE5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 - 176) = MEMORY[0x249502B6C](&unk_243C05278, a1);
  v7 = sub_243BFE054();
  *(_QWORD *)(v6 - 184) = v7;
  *(_QWORD *)(v6 - 208) = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  *(_QWORD *)(v6 - 280) = v5;
  *(_QWORD *)(v6 - 128) = v5;
  *(_QWORD *)(v6 - 120) = v3;
  *(_QWORD *)(v6 - 272) = v4;
  *(_QWORD *)(v6 - 112) = v4;
  *(_QWORD *)(v6 - 104) = v2;
  *(_QWORD *)(v6 - 256) = v2;
  *(_QWORD *)(v6 - 96) = v1;
  type metadata accessor for XPCMessageCenter.XPCRequest();
}

uint64_t sub_243BECEE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  void (*v39)(uint64_t, _DWORD *, uint64_t);
  _DWORD *v40;
  uint64_t v41;
  _BYTE v42[96];

  *(_QWORD *)(v2 - 200) = a1;
  *(_QWORD *)(v2 - 320) = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = &v42[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v42[-v6];
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v42[-v9];
  v11 = *(_QWORD **)(v2 - 72);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v12 = *(_QWORD *)(v2 - 168);
  sub_243BFE204();
  if (v12)
    goto LABEL_8;
  *(_QWORD *)(v2 - 336) = v4;
  *(_QWORD *)(v2 - 328) = v7;
  v14 = *(_QWORD *)(v2 - 200);
  v13 = *(_QWORD *)(v2 - 192);
  *(_QWORD *)(v2 - 176) = v10;
  *(_QWORD *)(v2 - 168) = v1;
  v15 = *(_QWORD *)(v2 - 184);
  *(_QWORD *)(v2 - 160) = sub_243BFE048();
  v16 = sub_243BFD9DC();
  MEMORY[0x249502B6C](MEMORY[0x24BEE12C8], v16);
  *(_QWORD *)(v2 - 128) = sub_243BFDDB4();
  *(_QWORD *)(v2 - 120) = v17;
  *(_QWORD *)(v2 - 112) = v18;
  *(_QWORD *)(v2 - 104) = v19;
  v20 = sub_243BFDDA8();
  MEMORY[0x249502B6C](MEMORY[0x24BEE2190], v20);
  sub_243BFDC40();
  v21 = *(unsigned __int8 *)(v2 - 160);
  if (v21 == 2
    || (v23 = *(_OWORD *)(v2 - 128),
        v22 = *(_OWORD *)(v2 - 112),
        *(_OWORD *)(v2 - 352) = v23,
        *(_OWORD *)(v2 - 160) = v23,
        *(_OWORD *)(v2 - 144) = v22,
        (sub_243BFDC64() & 1) == 0))
  {
    v26 = sub_243BFDE8C();
    swift_allocError();
    v27 = v15;
    v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572F0000);
    *v29 = v14;
    v30 = *(_QWORD *)(v2 - 168);
    sub_243BFE018();
    sub_243BFDE80();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v29, *MEMORY[0x24BEE26D0], v26);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 208) + 8))(v30, v27);
    v11 = *(_QWORD **)(v2 - 72);
LABEL_8:
    v34 = (uint64_t)v11;
    return __swift_destroy_boxed_opaque_existential_0(v34);
  }
  if ((v21 & 1) != 0)
  {
    *(_BYTE *)(v2 - 160) = 1;
    v31 = *(_QWORD *)(v2 - 216);
    v32 = *(_QWORD *)(v2 - 168);
    sub_243BFE00C();
    v33 = *(_QWORD *)(v2 - 296);
    v37 = sub_243BFE03C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 304) + 8))(v31, v33);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 208) + 8))(v32, v15);
    v38 = *(_DWORD **)(v2 - 336);
    *v38 = v37;
  }
  else
  {
    *(_BYTE *)(v2 - 160) = 0;
    v24 = *(_QWORD *)(v2 - 168);
    sub_243BFE00C();
    swift_getAssociatedTypeWitness();
    *(_BYTE *)(v2 - 160) = 0;
    v25 = *(_QWORD *)(v2 - 264);
    sub_243BFE030();
    swift_getTupleTypeMetadata2();
    *(_BYTE *)(v2 - 160) = 1;
    sub_243BFCBA0();
    sub_243BFE030();
    v36 = *(_QWORD *)(v2 - 208);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 288) + 8))(v13, v25);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, _QWORD))(v36 + 8))(v24, *(_QWORD *)(v2 - 184));
    v38 = *(_DWORD **)(v2 - 328);
  }
  swift_storeEnumTagMultiPayload();
  v39 = *(void (**)(uint64_t, _DWORD *, uint64_t))(*(_QWORD *)(v2 - 320) + 32);
  v40 = *(_DWORD **)(v2 - 176);
  v39((uint64_t)v40, v38, v14);
  v41 = *(_QWORD *)(v2 - 72);
  v39(*(_QWORD *)(v2 - 312), v40, v14);
  v34 = v41;
  return __swift_destroy_boxed_opaque_existential_0(v34);
}

BOOL sub_243BED428(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_243BED438()
{
  return sub_243BFE1B0();
}

uint64_t sub_243BED45C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7274537472617473 && a2 == 0xEB000000006D6165;
  if (v2 || (sub_243BFE0F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1954047342 && a2 == 0xE400000000000000 || (sub_243BFE0F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6563637553646E65 && a2 == 0xEA00000000007373 || (sub_243BFE0F0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x726F727245646E65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_243BFE0F0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_243BED628()
{
  sub_243BFE1A4();
  sub_243BFE1B0();
  return sub_243BFE1E0();
}

uint64_t sub_243BED66C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_243BED6A8 + 4 * byte_243C045D0[a1]))(0x7274537472617473, 0xEB000000006D6165);
}

uint64_t sub_243BED6A8()
{
  return 1954047342;
}

uint64_t sub_243BED6B8()
{
  return 0x6563637553646E65;
}

uint64_t sub_243BED6D4()
{
  return 0x726F727245646E65;
}

uint64_t sub_243BED6EC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_243BFE0F0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_243BED758()
{
  type metadata accessor for XPCMessageCenter.XPCResponse.EndErrorCodingKeys();
}

void sub_243BED7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = MEMORY[0x249502B6C](&unk_243C051D8, a1);
  *(_QWORD *)(v14 - 232) = a1;
  *(_QWORD *)(v14 - 248) = v16;
  v17 = sub_243BFE090();
  *(_QWORD *)(v14 - 200) = v17;
  *(_QWORD *)(v14 - 216) = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v14 - 224) = (char *)&a9 - v18;
  *(_QWORD *)(v14 - 128) = v13;
  *(_QWORD *)(v14 - 120) = v12;
  *(_QWORD *)(v14 - 112) = v10;
  *(_QWORD *)(v14 - 104) = v9;
  *(_QWORD *)(v14 - 96) = v11;
  type metadata accessor for XPCMessageCenter.XPCResponse.EndSuccessCodingKeys();
}

void sub_243BED82C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = MEMORY[0x249502B6C](&unk_243C05188, a1);
  *(_QWORD *)(v14 - 256) = a1;
  *(_QWORD *)(v14 - 264) = v16;
  v17 = sub_243BFE090();
  *(_QWORD *)(v14 - 272) = v17;
  *(_QWORD *)(v14 - 280) = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v14 - 296) = (char *)&a9 - v18;
  *(_QWORD *)(v14 - 128) = v13;
  *(_QWORD *)(v14 - 120) = v12;
  *(_QWORD *)(v14 - 112) = v10;
  *(_QWORD *)(v14 - 104) = v9;
  *(_QWORD *)(v14 - 96) = v11;
  type metadata accessor for XPCMessageCenter.XPCResponse.NextCodingKeys();
}

void sub_243BED8B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = MEMORY[0x249502B6C](&unk_243C05138, a1);
  *(_QWORD *)(v14 - 320) = a1;
  *(_QWORD *)(v14 - 328) = v16;
  v17 = sub_243BFE090();
  *(_QWORD *)(v14 - 288) = v17;
  *(_QWORD *)(v14 - 304) = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  *(_QWORD *)(v14 - 312) = (char *)&a9 - v18;
  *(_QWORD *)(v14 - 128) = v13;
  *(_QWORD *)(v14 - 120) = v12;
  *(_QWORD *)(v14 - 112) = v10;
  *(_QWORD *)(v14 - 104) = v9;
  *(_QWORD *)(v14 - 96) = v11;
  type metadata accessor for XPCMessageCenter.XPCResponse.StartStreamCodingKeys();
}

void sub_243BED940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v14 - 360) = MEMORY[0x249502B6C](&unk_243C050E8, a1);
  v15 = sub_243BFE090();
  *(_QWORD *)(v14 - 336) = v15;
  *(_QWORD *)(v14 - 344) = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  *(_QWORD *)(v14 - 352) = (char *)&a9 - v16;
  *(_QWORD *)(v14 - 128) = v13;
  *(_QWORD *)(v14 - 120) = v12;
  *(_QWORD *)(v14 - 240) = v10;
  *(_QWORD *)(v14 - 112) = v10;
  *(_QWORD *)(v14 - 104) = v9;
  *(_QWORD *)(v14 - 208) = v9;
  *(_QWORD *)(v14 - 96) = v11;
  type metadata accessor for XPCMessageCenter.XPCResponse.CodingKeys();
}

uint64_t sub_243BED9CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  MEMORY[0x249502B6C](&unk_243C05098, a1);
  v11 = sub_243BFE090();
  *(_QWORD *)(v10 - 160) = v11;
  *(_QWORD *)(v10 - 176) = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&a9 - v12;
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  *(_QWORD *)(v10 - 168) = v13;
  v14 = sub_243BFE210();
  return ((uint64_t (*)(uint64_t))((char *)sub_243BEDA80
                                          + 4 * byte_243C045D4[*(_QWORD *)(v10 - 72)]))(v14);
}

uint64_t sub_243BEDA80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v0 - 128) = 0;
  v1 = *(_QWORD *)(v0 - 352);
  v2 = *(_QWORD *)(v0 - 160);
  v3 = *(_QWORD *)(v0 - 168);
  sub_243BFE060();
  v4 = *(_QWORD *)(v0 - 336);
  sub_243BFE084();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 344) + 8))(v1, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 176) + 8))(v3, v2);
}

void sub_243BEDD0C()
{
  type metadata accessor for XPCMessageCenter.XPCResponse.EndErrorCodingKeys();
}

void sub_243BEE2D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 - 128) = 1;
  v4 = *(_QWORD *)(v3 - 312);
  sub_243BFE00C();
  if (!v0)
  {
    sub_243BFCBA0();
    v5 = *(_QWORD *)(v3 - 344);
    sub_243BFE030();
    v6 = *(_QWORD *)(v3 - 184);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 352) + 8))(v4, v5);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v1);
    __swift_destroy_boxed_opaque_existential_0(*(_QWORD *)(v3 - 72));
    JUMPOUT(0x243BEE2A8);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x243BEE29CLL);
}

void sub_243BEE374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 - 128) = 2;
  v4 = *(_QWORD *)(v3 - 304);
  sub_243BFE00C();
  if (!v0)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 336) + 8))(v4, *(_QWORD *)(v3 - 328));
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 184) + 8))(v2, v1);
    __swift_destroy_boxed_opaque_existential_0(*(_QWORD *)(v3 - 72));
    JUMPOUT(0x243BEE2A8);
  }
  swift_unknownObjectRelease();
  JUMPOUT(0x243BEE29CLL);
}

void sub_243BEE3F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 - 128) = 3;
  sub_243BFE00C();
  if (v1)
    JUMPOUT(0x243BEE41CLL);
  *(_QWORD *)(v5 - 128) = *(_QWORD *)(v5 - 224);
  *(_QWORD *)(v5 - 120) = v3;
  *(_QWORD *)(v5 - 112) = v2;
  *(_QWORD *)(v5 - 104) = v4;
  *(_QWORD *)(v5 - 96) = v0;
  type metadata accessor for XPCMessageCenter.XPCErrorResponse();
}

void sub_243BEE45C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x249502B6C](&unk_243C04808, a1);
  v5 = *(_QWORD *)(v4 - 320);
  v6 = *(_QWORD *)(v4 - 296);
  sub_243BFE030();
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v5);
    swift_unknownObjectRelease();
    JUMPOUT(0x243BEE29CLL);
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v5);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 184) + 8))(v2, *(_QWORD *)(v4 - 376));
  JUMPOUT(0x243BEE588);
}

uint64_t sub_243BEE594(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_243BFE0F0();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_243BEE618()
{
  type metadata accessor for XPCMessageCenter.XPCErrorResponse.CodingKeys();
}

uint64_t sub_243BEE65C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  MEMORY[0x249502B6C](&unk_243C05228, a1);
  v2 = sub_243BFE090();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - v4;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_243BFE210();
  sub_243BFE06C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_243BEE730()
{
  type metadata accessor for XPCMessageCenter.XPCErrorResponse.CodingKeys();
}

uint64_t sub_243BEE770(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  MEMORY[0x249502B6C](&unk_243C05228, a1);
  v3 = sub_243BFE054();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - v5;
  v7 = (uint64_t)__swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_243BFE204();
  if (!v2)
  {
    v7 = sub_243BFE024();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v1);
  return v7;
}

uint64_t sub_243BEE884()
{
  return 1;
}

uint64_t sub_243BEE890()
{
  return sub_243BFE1B0();
}

uint64_t sub_243BEE8B8()
{
  return 12383;
}

uint64_t sub_243BEE8C8@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_243BEEFF8(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BEE884, a2);
}

uint64_t sub_243BEE8D4(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05318, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEE908(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05318, a1);
  return sub_243BFE24C();
}

uint64_t sub_243BEE93C(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4)
{
  return sub_243BEE948(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BFD08C);
}

uint64_t sub_243BEE948(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*a1, *a2, a3[2], a3[3], a3[4], a3[5], a3[6]);
}

uint64_t sub_243BEE968()
{
  return sub_243B51DCC();
}

uint64_t sub_243BEE990(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_243BEE99C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BFD084);
}

uint64_t sub_243BEE99C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;

  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5], a2[6]);
}

uint64_t sub_243BEE9B8(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_243BEE9C4(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BFD084);
}

uint64_t sub_243BEE9C4(uint64_t a1, _QWORD *a2, uint64_t a3, void (*a4)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;
  _BYTE v8[72];

  sub_243BFE1A4();
  a4(v8, *v4, a2[2], a2[3], a2[4], a2[5], a2[6]);
  return sub_243BFE1E0();
}

uint64_t sub_243BEEA1C(_QWORD *a1, uint64_t a2)
{
  return sub_243BEEA28(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BEC878);
}

uint64_t sub_243BEEA28(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v3;

  return a3(*v3, a1[2], a1[3], a1[4], a1[5], a1[6]);
}

uint64_t sub_243BEEA44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_243BEEBA0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BEC7B8, a4);
}

uint64_t sub_243BEEA50(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C052C8, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEEA84(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C052C8, a1);
  return sub_243BFE24C();
}

void sub_243BEEAB8()
{
  sub_243BECD08();
}

void sub_243BEEADC()
{
  sub_243BEC890();
}

BOOL sub_243BEEAF0(char *a1, char *a2)
{
  return sub_243BED428(*a1, *a2);
}

uint64_t sub_243BEEB0C()
{
  return sub_243BED628();
}

uint64_t sub_243BEEB20()
{
  return sub_243BED438();
}

uint64_t sub_243BEEB34()
{
  sub_243BFE1A4();
  sub_243BED438();
  return sub_243BFE1E0();
}

uint64_t sub_243BEEB80()
{
  unsigned __int8 *v0;

  return sub_243BED66C(*v0);
}

uint64_t sub_243BEEB94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_243BEEBA0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BED45C, a4);
}

uint64_t sub_243BEEBA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6]);
  *a5 = result;
  return result;
}

uint64_t sub_243BEEBD8@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_243BEEBE4(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_243BFB308, a2);
}

uint64_t sub_243BEEBE4@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5], a1[6]);
  *a3 = result;
  return result;
}

uint64_t sub_243BEEC1C(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05098, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEEC50(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05098, a1);
  return sub_243BFE24C();
}

uint64_t sub_243BEEC84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_243BED6EC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_243BEECBC(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C051D8, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEECF0(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C051D8, a1);
  return sub_243BFE24C();
}

uint64_t sub_243BEED24()
{
  return 0;
}

uint64_t sub_243BEED30@<X0>(_BYTE *a1@<X8>)
{
  char v2;
  uint64_t result;

  v2 = sub_243BEE884();
  result = swift_bridgeObjectRelease();
  *a1 = v2 & 1;
  return result;
}

uint64_t sub_243BEED80(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05188, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEEDB4(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05188, a1);
  return sub_243BFE24C();
}

uint64_t sub_243BEEDE8(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05138, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEEE1C(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05138, a1);
  return sub_243BFE24C();
}

uint64_t sub_243BEEE50(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C050E8, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEEE84(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C050E8, a1);
  return sub_243BFE24C();
}

void sub_243BEEEB8()
{
  sub_243BEDD0C();
}

uint64_t sub_243BEEEDC(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  if (!v4)
  {
    *(_QWORD *)v3 = result;
    *(_QWORD *)(v3 + 8) = a2;
    *(_BYTE *)(v3 + 16) = a3;
  }
  return result;
}

void sub_243BEEEF4()
{
  sub_243BED758();
}

uint64_t sub_243BEEF2C()
{
  sub_243BFE1A4();
  sub_243BFE1B0();
  return sub_243BFE1E0();
}

uint64_t sub_243BEEF6C()
{
  sub_243BFE1A4();
  sub_243BFE1B0();
  return sub_243BFE1E0();
}

uint64_t sub_243BEEFA8()
{
  return 0x6567617373656DLL;
}

uint64_t sub_243BEEFC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_243BEE594(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_243BEEFF8@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5], a1[6]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_243BEF034(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05228, a1);
  return sub_243BFE240();
}

uint64_t sub_243BEF068(uint64_t a1)
{
  MEMORY[0x249502B6C](&unk_243C05228, a1);
  return sub_243BFE24C();
}

void sub_243BEF09C()
{
  sub_243BEE730();
}

uint64_t sub_243BEF0C0(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  if (!v3)
  {
    *v2 = result;
    v2[1] = a2;
  }
  return result;
}

void sub_243BEF0D4()
{
  sub_243BEE618();
}

uint64_t sub_243BEF0FC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return swift_release();
}

uint64_t sub_243BEF10C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return swift_release();
}

uint64_t XPCMessageCenter.init(serviceName:client:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;

  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543CE468);
  swift_getTupleTypeMetadata2();
  sub_243BFD97C();
  *(_QWORD *)(v3 + 48) = sub_243BFD748();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  *(_BYTE *)(v3 + 64) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE348);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 32) = 0;
  *(_QWORD *)(v7 + 40) = sub_243B4FEB4(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v7 + 72) = 0;
  *(_OWORD *)(v7 + 48) = xmmword_243C00A00;
  *(_BYTE *)(v7 + 64) = 0;
  *(_QWORD *)(v7 + 16) = 0xD000000000000010;
  *(_QWORD *)(v7 + 24) = 0x8000000243C054B0;
  *(_QWORD *)(v3 + 56) = v7;
  return v3;
}

uint64_t XPCMessageCenter.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
  {
    swift_retain();
    sub_243BFD5EC();
    swift_release();
  }
  if (*(_QWORD *)(v0 + 32))
  {
    swift_retain();
    sub_243BFD640();
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t XPCMessageCenter.__deallocating_deinit()
{
  XPCMessageCenter.deinit();
  return swift_deallocClassInstance();
}

void sub_243BEF2D4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0;
  v2 = *v0;
  v3 = sub_243BFD610();
  MEMORY[0x24BDAC7A8](v3);
  if ((v0[8] & 1) == 0)
  {
    v4 = qword_2543CE220;
    swift_bridgeObjectRetain();
    if (v4 != -1)
      swift_once();
    v5 = (void *)qword_2543CE210;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543CE488);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_243BFFAC0;
    v6 = v5;
    sub_243BFD604();
    sub_243B88508((unint64_t *)&unk_2543CE430, (uint64_t (*)(uint64_t))MEMORY[0x24BEE65F0], MEMORY[0x24BEE6600]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE448);
    sub_243B9A6CC(&qword_2543CE450, &qword_2543CE448, MEMORY[0x24BEE12C8]);
    sub_243BFDDC0();
    v7 = swift_allocObject();
    swift_weakInit();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = *(_QWORD *)(v2 + 80);
    *(_QWORD *)(v8 + 24) = *(_QWORD *)(v2 + 88);
    *(_OWORD *)(v8 + 32) = *(_OWORD *)(v2 + 96);
    *(_QWORD *)(v8 + 48) = *(_QWORD *)(v2 + 112);
    *(_QWORD *)(v8 + 56) = v7;
    sub_243BFD664();
    swift_allocObject();
    v1[4] = sub_243BFD64C();
    swift_release();
  }
  if (v1[4])
  {
    swift_retain();
    sub_243BFD658();
    swift_release();
  }
}

uint64_t sub_243BEF544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v13;
  char v15;

  sub_243BFD61C();
  if (v15 != 1)
    return sub_243BFD634();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = a7;
  v13[7] = a2;
  swift_retain();
  sub_243BFD628();
  return swift_release();
}

void sub_243BEF648(char *a1@<X8>)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL value;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_copy_entitlement_for_token();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = MEMORY[0x249502D88]();
    if (v4 == sub_243BFD5A4())
    {
      value = xpc_BOOL_get_value(v3);
      swift_unknownObjectRelease();
      if (value)
      {
        v6 = 1;
        goto LABEL_15;
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  v15 = a1;
  if (qword_2543CD828 != -1)
    swift_once();
  v7 = sub_243BFD598();
  __swift_project_value_buffer(v7, (uint64_t)qword_2543CE350);
  v8 = sub_243BFD580();
  v9 = sub_243BFDCB8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v16[0] = v11;
    *(_DWORD *)v10 = 136315138;
    if (xpc_copy_code_signing_identity_for_token())
    {
      v12 = sub_243BFD868();
      v14 = v13;
    }
    else
    {
      v14 = 0xE300000000000000;
      v12 = 4144959;
    }
    sub_243B739A8(v12, v14, v16);
    sub_243BFDD54();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243B4B000, v8, v9, "Rejecting Request from %s: Missing Entitlement", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249502C5C](v11, -1, -1);
    MEMORY[0x249502C5C](v10, -1, -1);

    v6 = 0;
  }
  else
  {

    v6 = 0;
  }
  a1 = v15;
LABEL_15:
  *a1 = v6;
}

uint64_t sub_243BEF8D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
    sub_243BF0C10();
  *a1 = 1;
  return result;
}

uint64_t sub_243BEF958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[6];

  v5 = MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, double))(v7 + 16))((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v10[4] = &unk_2572EFA38;
  v10[5] = v8;
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543CE468);
  sub_243BFD778();
  sub_243BFD790();
  return swift_endAccess();
}

uint64_t sub_243BEFA50(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);

  v5 = *a2;
  v6 = a2[1];
  *(_BYTE *)(v3 + 32) = 2;
  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_243BEFADC;
  return v9(a1, v5, v6, v3 + 32);
}

uint64_t sub_243BEFADC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 24) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_243BEFB48()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BEFB54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = *v4;
  v5[7] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBF48);
  v5[8] = swift_task_alloc();
  v7 = *(_QWORD *)(v6 + 80);
  v5[9] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[10] = v8;
  v5[11] = *(_QWORD *)(v8 + 64);
  v5[12] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  sub_243BFD9F4();
  return swift_task_switch();
}

uint64_t sub_243BEFC54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
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
  _QWORD *v24;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 48);
  v26 = *(_QWORD *)(v0 + 40);
  v27 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 32);
  v28 = *(uint64_t **)(v0 + 16);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v2, *(_QWORD *)(v0 + 24), v3);
  v8 = (*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v9 = (v1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v3;
  *(_QWORD *)(v10 + 24) = *(_QWORD *)(v5 + 88);
  *(_OWORD *)(v10 + 32) = *(_OWORD *)(v5 + 96);
  *(_QWORD *)(v10 + 48) = *(_QWORD *)(v5 + 112);
  *(_QWORD *)(v10 + 56) = v6;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v10 + v8, v2, v3);
  v11 = (uint64_t *)(v10 + v9);
  *v11 = v7;
  v11[1] = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
  v12 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ECD98);
  v13 = swift_allocObject();
  *(_DWORD *)(v13 + 24) = 0;
  *(_QWORD *)(v13 + 16) = 0;
  swift_retain();
  sub_243B7FBDC(v7, v26);
  v14 = MEMORY[0x24BEE4AF8];
  v15 = sub_243BE2D00(MEMORY[0x24BEE4AF8]);
  v17 = v16;
  v18 = sub_243BE2B60(v14);
  v20 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB68);
  v21 = swift_allocObject();
  *(_DWORD *)(v21 + 64) = 0;
  *(_QWORD *)(v21 + 16) = v15;
  *(_QWORD *)(v21 + 24) = v17;
  v22 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v21 + 32) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v21 + 40) = v18;
  *(_QWORD *)(v21 + 48) = v20;
  *(_QWORD *)(v21 + 56) = v22;
  *(_QWORD *)(v12 + 16) = v21;
  *(_QWORD *)(v12 + 24) = v13;
  v23 = sub_243BFDA60();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v27, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_2572EFD58;
  v24[5] = v10;
  v24[6] = v12;
  swift_retain();
  swift_retain();
  sub_243BD73EC(v27, (uint64_t)&unk_2572EFB70, (uint64_t)v24);
  swift_release();
  swift_release();
  *v28 = v12;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_243BEFE84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6[18] = a5;
  v6[19] = a6;
  v6[16] = a3;
  v6[17] = a4;
  v6[14] = a1;
  v6[15] = a2;
  v7 = *(_QWORD **)a3;
  v8 = *(_QWORD *)(*(_QWORD *)a3 + 80);
  v6[2] = v8;
  v6[20] = v8;
  v9 = v7[11];
  v6[21] = v9;
  v10 = v7[12];
  v6[22] = v10;
  v11 = v7[13];
  v6[23] = v11;
  v12 = v7[14];
  v6[24] = v12;
  v6[3] = v9;
  v6[4] = v10;
  v6[5] = v11;
  v6[6] = v12;
  type metadata accessor for XPCMessageCenter.XPCRequest();
}

uint64_t sub_243BEFEEC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[23] = a1;
  v1[24] = *(_QWORD *)(a1 - 8);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v2 + 232) = sub_243BFD9F4();
  *(_QWORD *)(v2 + 240) = v3;
  return swift_task_switch();
}

uint64_t sub_243BEFFA8()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  _QWORD *v5;

  v1 = v0[28];
  v2 = v0[19];
  v3 = v0[18];
  swift_getAssociatedTypeWitness();
  v4 = (uint64_t *)(v1 + *(int *)(swift_getTupleTypeMetadata2() + 48));
  sub_243BFD928();
  *v4 = v3;
  v4[1] = v2;
  swift_storeEnumTagMultiPayload();
  sub_243B7FBDC(v3, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[31] = v5;
  *v5 = v0;
  v5[1] = sub_243BF0098;
  return sub_243BF062C(v0[28]);
}

uint64_t sub_243BF0098(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v5 = *v4;
  *(_QWORD *)(v5 + 256) = a1;
  *(_QWORD *)(v5 + 264) = a2;
  *(_BYTE *)(v5 + 336) = a3;
  *(_QWORD *)(v5 + 272) = v3;
  swift_task_dealloc();
  v6 = *(_QWORD *)(v5 + 224);
  v7 = *(_QWORD *)(v5 + 200);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 + 208) + 8);
  if (!v3)
    *(_QWORD *)(v5 + 280) = v8;
  v8(v6, v7);
  return swift_task_switch();
}

uint64_t sub_243BF0124()
{
  uint64_t v0;
  char v1;
  unint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _QWORD *v6;

  v1 = *(_BYTE *)(v0 + 336);
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 256);
    v2 = *(_QWORD *)(v0 + 264);
    sub_243B9A688();
    swift_allocError();
    *v4 = 0;
    swift_willThrow();
    sub_243BE6C44(v3, v2, v1);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    **(_DWORD **)(v0 + 216) = *(_QWORD *)(v0 + 256);
    swift_storeEnumTagMultiPayload();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 288) = v6;
    *v6 = v0;
    v6[1] = sub_243BF0214;
    return sub_243BF062C(*(_QWORD *)(v0 + 216));
  }
}

uint64_t sub_243BF0214(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v6 = *v4;
  *(_QWORD *)(v6 + 296) = a1;
  *(_QWORD *)(v6 + 304) = a2;
  *(_QWORD *)(v6 + 312) = v3;
  swift_task_dealloc();
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 280);
  v8 = *(_QWORD *)(v6 + 216);
  v9 = *(_QWORD *)(v6 + 200);
  if (!v3)
    *(_BYTE *)(v6 + 337) = a3;
  v7(v8, v9);
  return swift_task_switch();
}

void sub_243BF02A8()
{
  __asm { BR              X10 }
}

uint64_t sub_243BF02E0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _BYTE *v3;

  v2 = *(_QWORD *)(v0 + 256);
  v1 = *(_QWORD *)(v0 + 264);
  sub_243B9A688();
  swift_allocError();
  *v3 = 1;
  swift_willThrow();
  sub_243BE6C44(v2, v1, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BF03DC()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD *);

  v1 = v0[37];
  v2 = v0[38];
  v3 = (int *)v0[14];
  v0[12] = v1;
  v0[13] = v2;
  sub_243B7FBDC(v1, v2);
  v6 = (uint64_t (*)(_QWORD *))((char *)v3 + *v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[40] = v4;
  *v4 = v0;
  v4[1] = sub_243BF0440;
  return v6(v0 + 12);
}

uint64_t sub_243BF0440()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BF04A0()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  v1 = v0[37];
  v2 = v0[38];
  sub_243BE6C44(v1, v2, 1);
  sub_243BE6C44(v1, v2, 1);
  *(_DWORD *)v0[27] = v0[32];
  swift_storeEnumTagMultiPayload();
  v3 = (_QWORD *)swift_task_alloc();
  v0[36] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_243BF0214;
  return sub_243BF062C(v0[27]);
}

uint64_t sub_243BF052C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 264);
  sub_243BE6C44(v1, v2, 1);
  sub_243BE6C44(v1, v2, 1);
  sub_243BE6C44(v4, v3, 0);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BF05A8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BF05E4()
{
  uint64_t v0;

  sub_243BE6C44(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 264), 0);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BF062C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2[10] = a1;
  v2[11] = v1;
  v2[12] = *v1;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  v2[13] = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v2[14] = sub_243BFD9F4();
  v2[15] = v3;
  return swift_task_switch();
}

uint64_t sub_243BF06DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = sub_243BDF5B0();
  v0[16] = v1;
  if (v1)
  {
    v2 = v1;
    v3 = (_QWORD *)v0[12];
    v4 = v0[10];
    v5 = (_QWORD *)swift_task_alloc();
    v0[17] = v5;
    v6 = v3[10];
    v5[2] = v6;
    v7 = v3[11];
    v5[3] = v7;
    v8 = v3[12];
    v5[4] = v8;
    v9 = v3[13];
    v5[5] = v9;
    v10 = v3[14];
    v5[6] = v10;
    v5[7] = v2;
    v5[8] = v4;
    v0[18] = swift_task_alloc();
    v0[2] = v6;
    v0[3] = v7;
    v0[4] = v8;
    v0[5] = v9;
    v0[6] = v10;
    type metadata accessor for XPCMessageCenter.XPCResponse();
  }
  return sub_243BFDF70();
}

uint64_t sub_243BF0858()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BF08C4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(unsigned __int8 *)(v0 + 72));
}

uint64_t sub_243BF0900()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_243BF093C()
{
  type metadata accessor for XPCMessageCenter.XPCResponse();
}

void sub_243BF0990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  double v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t, double);
  unint64_t v22;
  char *v23;

  *(_QWORD *)(v15 - 152) = a1;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543CE498);
  v16 = sub_243BFDA18();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&a9 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t, double))(v17 + 16);
  *(_QWORD *)(v15 - 160) = v9;
  v21(v20, v9, v16, v18);
  v22 = (*(unsigned __int8 *)(v17 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v23 = (char *)swift_allocObject();
  *((_QWORD *)v23 + 2) = v14;
  *((_QWORD *)v23 + 3) = v13;
  *((_QWORD *)v23 + 4) = v12;
  *((_QWORD *)v23 + 5) = v11;
  *((_QWORD *)v23 + 6) = v10;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(&v23[v22], v20, v16);
  *(_QWORD *)(v15 - 120) = v14;
  *(_QWORD *)(v15 - 112) = v13;
  *(_QWORD *)(v15 - 104) = v12;
  *(_QWORD *)(v15 - 96) = v11;
  *(_QWORD *)(v15 - 88) = v10;
  type metadata accessor for XPCMessageCenter.XPCRequest();
}

uint64_t sub_243BF0A60(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x249502B6C](&unk_243C04898, a1);
  MEMORY[0x249502B6C](&unk_243C04870, *(_QWORD *)(v1 - 152));
  sub_243BFD5E0();
  return swift_release();
}

void sub_243BF0AFC(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)a1;
  if (*(_BYTE *)(a1 + 17) == 1)
  {
    v3 = v2;
    type metadata accessor for XPCMessageCenter.XPCResponse();
  }
  sub_243BE6D14((uint64_t)v2, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  type metadata accessor for XPCMessageCenter.XPCResponse();
}

void sub_243BF0BC4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543CE498);
  sub_243BFDA18();
  sub_243BFDA0C();
  JUMPOUT(0x243BF0BF8);
}

void sub_243BF0C10()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[11];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t AssociatedTypeWitness;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = (_QWORD *)*v0;
  v2 = sub_243BFD688();
  v3 = *(_QWORD *)(v2 - 8);
  v17 = v2;
  v18 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v15[9] = v4;
  v15[10] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBF48);
  MEMORY[0x24BDAC7A8](v5);
  v23 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1[12];
  v9 = v1[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(_QWORD *)(v21 + 64);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v19 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v12 = v1[11];
  v14 = v1[13];
  v13 = v1[14];
  v27 = v9;
  v28 = v12;
  v24 = v12;
  v25 = v14;
  v29 = v8;
  v30 = v14;
  v26 = v13;
  v31 = v13;
  type metadata accessor for XPCMessageCenter.XPCRequest();
}

uint64_t sub_243BF0DA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int EnumCaseMultiPayload;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, _DWORD *, uint64_t);
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
  _QWORD *v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  _BYTE v72[96];

  v8 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v10 = &v72[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = &v72[-v13];
  MEMORY[0x249502B6C](&unk_243C04910, a1, v12);
  *(_QWORD *)(v6 - 168) = v1;
  sub_243BFD67C();
  v15 = *(_QWORD *)(v6 - 248);
  *(_QWORD *)(v6 - 312) = v3;
  v16 = *(_QWORD *)(v6 - 224);
  v17 = *(_QWORD *)(v6 - 208);
  *(_QWORD *)(v6 - 304) = v2;
  *(_QWORD *)(v6 - 288) = v4;
  (*(void (**)(_DWORD *, _BYTE *, uint64_t))(v8 + 16))(v10, v14, a1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *(_QWORD *)(v6 - 296) = v14;
  if (EnumCaseMultiPayload != 1)
  {
    *(_QWORD *)(v6 - 272) = a1;
    *(_QWORD *)(v6 - 256) = v8;
    v33 = v17;
    v34 = (_QWORD *)((char *)v10 + *(int *)(swift_getTupleTypeMetadata2() + 48));
    v35 = v34[1];
    *(_QWORD *)(v6 - 248) = *v34;
    v36 = v16;
    v37 = *(void (**)(uint64_t, _DWORD *, uint64_t))(v16 + 32);
    *(_QWORD *)(v6 - 328) = v37;
    v37(v5, v10, v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD38);
    v38 = swift_allocObject();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ECD98);
    v39 = swift_allocObject();
    *(_DWORD *)(v39 + 24) = 0;
    *(_QWORD *)(v39 + 16) = 0;
    v40 = MEMORY[0x24BEE4AF8];
    v41 = sub_243BE2D00(MEMORY[0x24BEE4AF8]);
    v43 = v42;
    v44 = sub_243BE2B60(v40);
    v46 = v45;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFB68);
    v47 = swift_allocObject();
    *(_DWORD *)(v47 + 64) = 0;
    *(_QWORD *)(v47 + 16) = v41;
    *(_QWORD *)(v47 + 24) = v43;
    v48 = MEMORY[0x24BEE4B08];
    *(_QWORD *)(v47 + 32) = MEMORY[0x24BEE4B08];
    *(_QWORD *)(v47 + 40) = v44;
    *(_QWORD *)(v47 + 48) = v46;
    *(_QWORD *)(v47 + 56) = v48;
    *(_QWORD *)(v38 + 16) = v47;
    *(_QWORD *)(v38 + 24) = v39;
    swift_retain();
    v49 = *(_QWORD **)(v6 - 232);
    sub_243BEA19C(v38, v49);
    swift_release();
    *(_QWORD *)(v6 - 336) = *(unsigned int *)((char *)v49 + *(int *)(*(_QWORD *)(v6 - 264) + 32));
    v50 = sub_243BFDA60();
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(*(_QWORD *)(v6 - 200), 1, 1, v50);
    v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16);
    v52 = *(_QWORD *)(v6 - 240);
    *(_QWORD *)(v6 - 264) = v5;
    v51(v52, v5, v33);
    swift_retain();
    v53 = *(_QWORD *)(v6 - 248);
    *(_QWORD *)(v6 - 280) = v35;
    sub_243B7FBDC(v53, v35);
    v54 = qword_2543CE238;
    *(_QWORD *)(v6 - 320) = v38;
    swift_retain();
    v55 = *(_QWORD *)(v6 - 288);
    if (v54 != -1)
      swift_once();
    v56 = off_2543CE228;
    *(_QWORD *)(v6 - 344) = off_2543CE228;
    v57 = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
    v58 = (*(unsigned __int8 *)(v36 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    v59 = (*(_QWORD *)(v6 - 312) + v58 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    v60 = (v59 + 11) & 0xFFFFFFFFFFFFFFF8;
    v61 = (v60 + 15) & 0xFFFFFFFFFFFFFFF8;
    v62 = (v61 + 23) & 0xFFFFFFFFFFFFFFF8;
    v63 = (char *)swift_allocObject();
    *((_QWORD *)v63 + 2) = v56;
    *((_QWORD *)v63 + 3) = v57;
    v64 = *(_QWORD *)(v6 - 304);
    v65 = *(_QWORD *)(v6 - 192);
    *((_QWORD *)v63 + 4) = v64;
    *((_QWORD *)v63 + 5) = v65;
    *((_QWORD *)v63 + 6) = v55;
    v67 = *(_QWORD *)(v6 - 184);
    v66 = *(_QWORD *)(v6 - 176);
    *((_QWORD *)v63 + 7) = v67;
    *((_QWORD *)v63 + 8) = v66;
    (*(void (**)(char *, _QWORD, _QWORD))(v6 - 328))(&v63[v58], *(_QWORD *)(v6 - 240), *(_QWORD *)(v6 - 208));
    v68 = *(_QWORD *)(v6 - 336);
    *(_DWORD *)&v63[v59] = v68;
    *(_QWORD *)&v63[v60] = *(_QWORD *)(v6 - 216);
    v69 = &v63[v61];
    v70 = *(_QWORD *)(v6 - 280);
    *(_QWORD *)v69 = *(_QWORD *)(v6 - 248);
    *((_QWORD *)v69 + 1) = v70;
    *(_QWORD *)&v63[v62] = *(_QWORD *)(v6 - 320);
    swift_retain();
    sub_243BD73EC(*(_QWORD *)(v6 - 200), (uint64_t)&unk_2572EFD90, (uint64_t)v63);
    swift_release();
    *(_QWORD *)(v6 - 160) = v68;
    *(_QWORD *)(v6 - 152) = 0;
    *(_BYTE *)(v6 - 144) = 0;
    *(_QWORD *)(v6 - 128) = v64;
    *(_QWORD *)(v6 - 120) = v65;
    *(_QWORD *)(v6 - 112) = *(_QWORD *)(v6 - 288);
    *(_QWORD *)(v6 - 104) = v67;
    *(_QWORD *)(v6 - 96) = v66;
    type metadata accessor for XPCMessageCenter.XPCResponse();
  }
  *(_DWORD *)(v6 - 208) = *v10;
  v19 = sub_243BFDA60();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(*(_QWORD *)(v6 - 200), 1, 1, v19);
  v20 = *(_QWORD *)(v6 - 272);
  v21 = *(_QWORD *)(v6 - 256);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 16))(v20, *(_QWORD *)(v6 - 168), v21);
  v22 = qword_2543CE238;
  v23 = *(_QWORD *)(v6 - 216);
  swift_retain();
  v24 = *(_QWORD *)(v6 - 288);
  if (v22 != -1)
    swift_once();
  v25 = off_2543CE228;
  v26 = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  v27 = (*(unsigned __int8 *)(v15 + 80) + 84) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v28 = swift_allocObject();
  v29 = v15;
  v30 = v28;
  *(_QWORD *)(v28 + 16) = v25;
  *(_QWORD *)(v28 + 24) = v26;
  v31 = *(_QWORD *)(v6 - 192);
  *(_QWORD *)(v28 + 32) = *(_QWORD *)(v6 - 304);
  *(_QWORD *)(v28 + 40) = v31;
  v32 = *(_QWORD *)(v6 - 184);
  *(_QWORD *)(v28 + 48) = v24;
  *(_QWORD *)(v28 + 56) = v32;
  *(_QWORD *)(v28 + 64) = *(_QWORD *)(v6 - 176);
  *(_QWORD *)(v28 + 72) = v23;
  *(_DWORD *)(v28 + 80) = *(_DWORD *)(v6 - 208);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v29 + 32))(v28 + v27, v20, v21);
  swift_retain();
  sub_243BD73EC(*(_QWORD *)(v6 - 200), (uint64_t)&unk_2572EFD80, v30);
  swift_release();
  return (*(uint64_t (**)(_QWORD, uint64_t))(v8 + 8))(*(_QWORD *)(v6 - 296), a1);
}

uint64_t sub_243BF1420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  *(_QWORD *)(v8 + 312) = a8;
  *(_QWORD *)(v8 + 320) = v15;
  *(_QWORD *)(v8 + 296) = a6;
  *(_QWORD *)(v8 + 304) = a7;
  *(_DWORD *)(v8 + 588) = a5;
  *(_QWORD *)(v8 + 288) = a4;
  v9 = *a6;
  *(_QWORD *)(v8 + 328) = *a6;
  *(_QWORD *)(v8 + 336) = *(_QWORD *)(v9 + 96);
  v10 = *(_QWORD *)(v9 + 80);
  *(_QWORD *)(v8 + 344) = v10;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v8 + 352) = AssociatedTypeWitness;
  *(_QWORD *)(v8 + 360) = *(_QWORD *)(AssociatedTypeWitness - 8);
  *(_QWORD *)(v8 + 368) = swift_task_alloc();
  *(_QWORD *)(v8 + 376) = swift_task_alloc();
  v12 = sub_243BFDD0C();
  *(_QWORD *)(v8 + 384) = v12;
  *(_QWORD *)(v8 + 392) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 400) = swift_task_alloc();
  *(_QWORD *)(v8 + 408) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 416) = swift_task_alloc();
  *(_QWORD *)(v8 + 424) = swift_task_alloc();
  *(_QWORD *)(v8 + 432) = swift_task_alloc();
  *(_QWORD *)(v8 + 440) = swift_task_alloc();
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  *(_QWORD *)(v8 + 448) = sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v8 + 456) = sub_243BFD9F4();
  *(_QWORD *)(v8 + 464) = v13;
  return swift_task_switch();
}

uint64_t sub_243BF15B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
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
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void *v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t);
  NSObject *v53;
  os_log_type_t v54;
  BOOL v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  _QWORD *v65;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  os_unfair_lock_s *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t i;
  uint64_t v77;
  id v78;
  uint64_t j;
  _QWORD *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t *v83;
  id v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  uint64_t v95[2];

  v1 = (_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 408);
  v4 = *(_QWORD *)(v0 + 344);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 360) + 16);
  v5(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 288), *(_QWORD *)(v0 + 352));
  sub_243BFD934();
  v93 = (_QWORD *)(v0 + 256);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v4) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 392) + 8))(*(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 384));
    if (qword_2543CD828 != -1)
      swift_once();
    v6 = *(_QWORD *)(v0 + 368);
    v7 = *(_QWORD *)(v0 + 352);
    v8 = *(_QWORD *)(v0 + 288);
    v9 = sub_243BFD598();
    __swift_project_value_buffer(v9, (uint64_t)qword_2543CE350);
    v5(v6, v8, v7);
    v10 = sub_243BFD580();
    v11 = sub_243BFDCA0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = *(_QWORD *)(v0 + 376);
      v88 = *(_QWORD *)(v0 + 368);
      v13 = *(_QWORD *)(v0 + 352);
      v90 = *(_QWORD *)(v0 + 360);
      v14 = *(_DWORD *)(v0 + 588);
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v95[0] = v16;
      *(_DWORD *)v15 = 67109378;
      *(_DWORD *)(v0 + 584) = v14;
      sub_243BFDD54();
      *(_WORD *)(v15 + 8) = 2080;
      v5(v12, v88, v13);
      v17 = sub_243BFD838();
      *(_QWORD *)(v0 + 272) = sub_243B739A8(v17, v18, v95);
      sub_243BFDD54();
      swift_bridgeObjectRelease();
      v19 = v13;
      v1 = (_QWORD *)(v0 + 256);
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v88, v19);
      _os_log_impl(&dword_243B4B000, v10, v11, "XPC %u: Invalid message type: %s", (uint8_t *)v15, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v16, -1, -1);
      MEMORY[0x249502C5C](v15, -1, -1);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 360) + 8))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 352));
    }

    sub_243BE6A34();
    v45 = (void *)swift_allocError();
    *v46 = 1;
    swift_willThrow();
    goto LABEL_21;
  }
  v20 = *(_QWORD *)(v0 + 440);
  v21 = *(_QWORD *)(v0 + 344);
  v22 = *(_QWORD *)(v0 + 328);
  v23 = *(_QWORD *)(v0 + 296);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 408) + 32))(v20, *(_QWORD *)(v0 + 400), v21);
  swift_beginAccess();
  v24 = *(_QWORD *)(v23 + 48);
  swift_bridgeObjectRetain();
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE468);
  MEMORY[0x249501B34](v20, v24, v21, v25, *(_QWORD *)(v22 + 88));
  swift_bridgeObjectRelease();
  v26 = *(int **)(v0 + 144);
  v27 = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 472) = v26;
  *(_QWORD *)(v0 + 480) = v27;
  if (!v26)
  {
    if (qword_2543CD828 != -1)
      swift_once();
    v48 = *(_QWORD *)(v0 + 432);
    v47 = *(_QWORD *)(v0 + 440);
    v49 = *(_QWORD *)(v0 + 408);
    v50 = *(_QWORD *)(v0 + 344);
    v51 = sub_243BFD598();
    __swift_project_value_buffer(v51, (uint64_t)qword_2543CE350);
    v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16);
    v52(v48, v47, v50);
    v53 = sub_243BFD580();
    v54 = sub_243BFDCA0();
    v55 = os_log_type_enabled(v53, v54);
    v56 = *(_QWORD *)(v0 + 432);
    if (v55)
    {
      v57 = *(_QWORD *)(v0 + 416);
      v91 = *(_QWORD *)(v0 + 408);
      v58 = *(_QWORD *)(v0 + 344);
      v59 = *(_DWORD *)(v0 + 588);
      v60 = swift_slowAlloc();
      v61 = swift_slowAlloc();
      v95[0] = v61;
      *(_DWORD *)v60 = 67109378;
      *(_DWORD *)(v0 + 576) = v59;
      sub_243BFDD54();
      *(_WORD *)(v60 + 8) = 2080;
      v52(v57, v56, v58);
      v62 = sub_243BFD838();
      *(_QWORD *)(v0 + 248) = sub_243B739A8(v62, v63, v95);
      v1 = (_QWORD *)(v0 + 256);
      sub_243BFDD54();
      swift_bridgeObjectRelease();
      v64 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
      v64(v56, v58);
      _os_log_impl(&dword_243B4B000, v53, v54, "XPC %u: Couldn't find a registry for type: %s", (uint8_t *)v60, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x249502C5C](v61, -1, -1);
      MEMORY[0x249502C5C](v60, -1, -1);
    }
    else
    {
      v64 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 408) + 8);
      v64(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 344));
    }

    v67 = *(_QWORD *)(v0 + 440);
    v68 = *(_QWORD *)(v0 + 344);
    sub_243BE6A34();
    v45 = (void *)swift_allocError();
    *v69 = 2;
    swift_willThrow();
    v64(v67, v68);
LABEL_21:
    v92 = v0;
    v70 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 320) + 16) + 64);
    v71 = v45;
    os_unfair_lock_lock(v70);
    v72 = sub_243BE916C(v45);
    v74 = v73;
    os_unfair_lock_unlock(v70);
    if (!v72)
    {
LABEL_39:

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v92 + 8))();
    }
    v75 = *(_QWORD *)(v72 + 16);
    if (v75)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)(v72 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      v77 = *(_QWORD *)(v74 + 16);
      if (v77)
        goto LABEL_28;
    }
    else
    {
      swift_bridgeObjectRetain();
      v77 = *(_QWORD *)(v74 + 16);
      if (v77)
      {
LABEL_28:
        v78 = v45;
        swift_bridgeObjectRetain();
        for (j = 0; j != v77; ++j)
        {
          if (*(_QWORD *)(v74 + 8 * j + 32))
          {
            *v1 = v45;
            v84 = v45;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
            v85 = sub_243BFE0CC();
            if (v85)
            {
              v81 = v85;

            }
            else
            {
              v80 = v1;
              v81 = swift_allocError();
              *v82 = *v80;
            }
            swift_allocError();
            *v83 = v81;
            swift_continuation_throwingResumeWithError();
            v1 = v93;
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
    }
    v86 = v45;
LABEL_38:
    sub_243B6A1DC(v72);

    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  if (qword_2543CD828 != -1)
    swift_once();
  v28 = *(_QWORD *)(v0 + 440);
  v29 = *(_QWORD *)(v0 + 424);
  v30 = *(_QWORD *)(v0 + 408);
  v31 = *(_QWORD *)(v0 + 344);
  v32 = sub_243BFD598();
  *(_QWORD *)(v0 + 488) = __swift_project_value_buffer(v32, (uint64_t)qword_2543CE350);
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
  v33(v29, v28, v31);
  v34 = sub_243BFD580();
  v35 = sub_243BFDC94();
  v36 = os_log_type_enabled(v34, v35);
  v37 = *(_QWORD *)(v0 + 424);
  if (v36)
  {
    v38 = *(_QWORD *)(v0 + 416);
    v87 = *(_QWORD *)(v0 + 408);
    v39 = *(_QWORD *)(v0 + 344);
    v40 = *(_DWORD *)(v0 + 588);
    v41 = swift_slowAlloc();
    v89 = swift_slowAlloc();
    v95[0] = v89;
    *(_DWORD *)v41 = 67109378;
    *(_DWORD *)(v0 + 580) = v40;
    sub_243BFDD54();
    *(_WORD *)(v41 + 8) = 2080;
    v33(v38, v37, v39);
    v42 = sub_243BFD838();
    *(_QWORD *)(v0 + 280) = sub_243B739A8(v42, v43, v95);
    sub_243BFDD54();
    swift_bridgeObjectRelease();
    v44 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
    v44(v37, v39);
    _os_log_impl(&dword_243B4B000, v34, v35, "XPC %u: Starting to process request %s", (uint8_t *)v41, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x249502C5C](v89, -1, -1);
    MEMORY[0x249502C5C](v41, -1, -1);
  }
  else
  {
    v44 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 408) + 8);
    v44(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 344));
  }

  *(_QWORD *)(v0 + 496) = v44;
  *(_OWORD *)(v0 + 208) = *(_OWORD *)(v0 + 304);
  v94 = (uint64_t (*)(uint64_t, uint64_t))((char *)v26 + *v26);
  v65 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 504) = v65;
  *v65 = v0;
  v65[1] = sub_243BF1F40;
  return v94(v0 + 56, v0 + 208);
}

uint64_t sub_243BF1F40()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 512) = v0;
  swift_task_dealloc();
  sub_243BFBA2C(*(_QWORD *)(v2 + 472));
  return swift_task_switch();
}

uint64_t sub_243BF1FA8()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v0[30] = 0;
  v1 = v0[10];
  v2 = __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[5] = swift_getAssociatedTypeWitness();
  v0[6] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  sub_243BFDB14();
  swift_task_dealloc();
  swift_beginAccess();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[65] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_243BF2378;
  return sub_243BFDA3C();
}

uint64_t sub_243BF2128()
{
  uint64_t v0;
  void *v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t j;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  id v18;

  (*(void (**)(_QWORD, _QWORD))(v0 + 496))(*(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 344));
  v1 = *(void **)(v0 + 512);
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 320) + 16) + 64);
  v3 = v1;
  os_unfair_lock_lock(v2);
  v4 = sub_243BE916C(v1);
  v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    v7 = *(_QWORD *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)(v4 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
        goto LABEL_8;
    }
    else
    {
      swift_bridgeObjectRetain();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        v10 = (_QWORD *)(v0 + 256);
        v11 = v1;
        swift_bridgeObjectRetain();
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)(v6 + 8 * j + 32))
          {
            *v10 = v1;
            v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
            v17 = sub_243BFE0CC();
            if (v17)
            {
              v13 = v17;

            }
            else
            {
              v13 = swift_allocError();
              *v14 = *v10;
            }
            swift_allocError();
            *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    v18 = v1;
LABEL_18:
    sub_243B6A1DC(v4);

    swift_bridgeObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BF2378()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 528) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_243BF23DC()
{
  uint64_t v0;
  unint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 232);
  *(_QWORD *)(v0 + 536) = *(_QWORD *)(v0 + 224);
  *(_QWORD *)(v0 + 544) = v1;
  if (v1 >> 60 == 15)
  {
    v2 = *(void (**)(uint64_t, uint64_t))(v0 + 496);
    v3 = *(_QWORD *)(v0 + 440);
    v4 = *(_QWORD *)(v0 + 344);
    v5 = *(_QWORD *)(v0 + 320);
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    sub_243BFAB94(0, *(os_unfair_lock_s **)(v5 + 16));
    v2(v3, v4);
    __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = (_QWORD *)(v0 + 240);
    v7 = sub_243BFD580();
    v8 = sub_243BFDC94();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = *(_DWORD *)(v0 + 588);
      v10 = swift_slowAlloc();
      *(_DWORD *)v10 = 67109376;
      *(_DWORD *)(v10 + 4) = v9;
      *(_WORD *)(v10 + 8) = 2048;
      *(_QWORD *)(v10 + 10) = *(_QWORD *)(v0 + 240);
      _os_log_impl(&dword_243B4B000, v7, v8, "XPC %u: Enqueuing message %ld", (uint8_t *)v10, 0x12u);
      MEMORY[0x249502C5C](v10, -1, -1);
    }

    if (__OFADD__(*v6, 1))
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v0 + 240) = *v6 + 1;
      swift_task_switch();
    }
  }
}

uint64_t sub_243BF257C()
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
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 536);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  v4 = *(_QWORD *)(v2 + 48);
  if (v4 < 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
    return swift_task_switch();
  }
  if (!*(_QWORD *)(v4 + 16))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
LABEL_13:
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
    v18 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v18 + 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 552) = v19;
    v19[2] = v2;
    v19[3] = v3;
    v19[4] = v0 + 176;
    v19[5] = v18;
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 560) = v20;
    v20[2] = v2;
    v20[3] = v3;
    v20[4] = v18;
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 568) = v21;
    *v21 = v0;
    v21[1] = sub_243BF27A4;
    return sub_243BFE0FC();
  }
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = *(_QWORD *)(v2 + 32);
  v7 = *(_QWORD *)(v2 + 40);
  v9 = *(_QWORD *)(v2 + 56);
  *(_QWORD *)(v0 + 192) = v7;
  *(_QWORD *)(v0 + 200) = v4;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_11;
  }
  v10 = v9;
  v11 = *(_QWORD *)(v0 + 528);
  result = sub_243BFA7B8(v7 + 16, v7 + 32, v4, 0);
  if (!v11)
  {
    v13 = result;
    v9 = v10;
LABEL_11:
    sub_243BF54D4(0, v13, sub_243BF6D18);
    v15 = v14;
    v16 = *(_QWORD *)(v0 + 192);
    v17 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v2 + 16) = v5;
    *(_QWORD *)(v2 + 24) = v6;
    *(_QWORD *)(v2 + 32) = v8;
    *(_QWORD *)(v2 + 40) = v16;
    *(_QWORD *)(v2 + 48) = v17;
    *(_QWORD *)(v2 + 56) = v9;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
    if (v15)
    {
      if (v15 == 1)
        goto LABEL_13;
      v22 = *(_QWORD *)(v0 + 176);
      v23 = *(_QWORD *)(v0 + 184);
      *(_QWORD *)(v0 + 160) = v22;
      *(_QWORD *)(v0 + 168) = v23;
      sub_243B7FBDC(v22, v23);
      sub_243B6F9B4(v0 + 160, *(_QWORD *)(*(_QWORD *)(v15 + 64) + 40), &qword_2572EFC08);
      swift_continuation_throwingResume();
    }
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_243BF27A4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_243BF2810()
{
  return swift_task_switch();
}

uint64_t sub_243BF2820()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_243B924F0(v0[67], v0[68]);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 2), v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[65] = v1;
  *v1 = v0;
  v1[1] = sub_243BF2378;
  return sub_243BFDA3C();
}

uint64_t sub_243BF28D4()
{
  uint64_t v0;
  void *v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t j;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  id v18;

  (*(void (**)(_QWORD, _QWORD))(v0 + 496))(*(_QWORD *)(v0 + 440), *(_QWORD *)(v0 + 344));
  v1 = *(void **)(v0 + 264);
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(*(_QWORD *)(v0 + 320) + 16) + 64);
  v3 = v1;
  os_unfair_lock_lock(v2);
  v4 = sub_243BE916C(v1);
  v6 = v5;
  os_unfair_lock_unlock(v2);
  if (v4)
  {
    v7 = *(_QWORD *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)(v4 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
        goto LABEL_8;
    }
    else
    {
      swift_bridgeObjectRetain();
      v9 = *(_QWORD *)(v6 + 16);
      if (v9)
      {
LABEL_8:
        v10 = (_QWORD *)(v0 + 256);
        v11 = v1;
        swift_bridgeObjectRetain();
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)(v6 + 8 * j + 32))
          {
            *v10 = v1;
            v16 = v1;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
            v17 = sub_243BFE0CC();
            if (v17)
            {
              v13 = v17;

            }
            else
            {
              v13 = swift_allocError();
              *v14 = *v10;
            }
            swift_allocError();
            *v15 = v13;
            swift_continuation_throwingResumeWithError();
          }
        }
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    v18 = v1;
LABEL_18:
    sub_243B6A1DC(v4);

    swift_bridgeObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243BF2B3C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, int a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)(v6 + 180) = a5;
  *(_QWORD *)(v6 + 256) = a4;
  *(_QWORD *)(v6 + 264) = a6;
  *(_QWORD *)(v6 + 272) = *a4;
  if (qword_2543CE238 != -1)
    swift_once();
  type metadata accessor for CommunicationActor();
  sub_243B88508(qword_2543CE240, (uint64_t (*)(uint64_t))type metadata accessor for CommunicationActor, (uint64_t)&protocol conformance descriptor for CommunicationActor);
  *(_QWORD *)(v6 + 280) = sub_243BFD9F4();
  *(_QWORD *)(v6 + 288) = v7;
  return swift_task_switch();
}

uint64_t sub_243BF2BEC()
{
  uint64_t v0;
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, int);

  v1 = *(_DWORD *)(v0 + 180);
  v2 = *(_QWORD *)(v0 + 256);
  swift_retain();
  v3 = sub_243BEA458(v1);
  swift_release();
  if (qword_2543CD828 != -1)
    swift_once();
  v4 = sub_243BFD598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2543CE350);
  v5 = sub_243BFD580();
  v6 = sub_243BFDC94();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_DWORD *)(v0 + 180);
    v8 = swift_slowAlloc();
    *(_DWORD *)v8 = 67109376;
    *(_DWORD *)(v0 + 156) = v7;
    sub_243BFDD54();
    *(_WORD *)(v8 + 8) = 2048;
    *(_QWORD *)(v0 + 248) = v3;
    sub_243BFDD54();
    _os_log_impl(&dword_243B4B000, v5, v6, "XPC %u: Reading message %ld", (uint8_t *)v8, 0x12u);
    MEMORY[0x249502C5C](v8, -1, -1);
  }

  *(_QWORD *)(v0 + 296) = *(_QWORD *)(v2 + 56);
  v11 = (uint64_t (*)(uint64_t, int))((char *)&dword_2572EFDF0 + dword_2572EFDF0);
  swift_retain();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v9;
  *v9 = v0;
  v9[1] = sub_243BF2DB4;
  return v11(v0 + 208, *(_DWORD *)(v0 + 180));
}

uint64_t sub_243BF2DB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

void sub_243BF2E20()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 272);
  if (v1 >> 60 == 15)
  {
    *(_OWORD *)(v0 + 96) = *(_OWORD *)(v2 + 80);
    *(_QWORD *)(v0 + 136) = 0;
    *(_QWORD *)(v0 + 144) = 0;
    *(_BYTE *)(v0 + 152) = 3;
    v3 = *(_QWORD *)(v2 + 112);
    *(_OWORD *)(v0 + 112) = *(_OWORD *)(v2 + 96);
    *(_QWORD *)(v0 + 128) = v3;
    type metadata accessor for XPCMessageCenter.XPCResponse();
  }
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v2 + 80);
  *(_QWORD *)(v0 + 160) = *(_QWORD *)(v0 + 208);
  *(_QWORD *)(v0 + 168) = v1;
  *(_BYTE *)(v0 + 176) = 1;
  v4 = *(_QWORD *)(v2 + 112);
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v2 + 96);
  *(_QWORD *)(v0 + 48) = v4;
  type metadata accessor for XPCMessageCenter.XPCResponse();
}

void sub_243BF2EEC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  MEMORY[0x249502B6C](&unk_243C048C0, a1);
  sub_243BFD670();
  sub_243B924F0(v2, v1);
  JUMPOUT(0x243BF2F1CLL);
}

void sub_243BF2F38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 272);
  swift_release();
  *(_QWORD *)(v0 + 224) = 0;
  *(_QWORD *)(v0 + 232) = 0xE000000000000000;
  *(_QWORD *)(v0 + 240) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
  sub_243BFDF40();
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v2 + 112);
  v5 = *(_OWORD *)(v2 + 80);
  v6 = *(_OWORD *)(v2 + 96);
  *(_QWORD *)(v0 + 184) = *(_QWORD *)(v0 + 224);
  *(_QWORD *)(v0 + 192) = v3;
  *(_BYTE *)(v0 + 200) = 2;
  *(_OWORD *)(v0 + 56) = v5;
  *(_OWORD *)(v0 + 72) = v6;
  *(_QWORD *)(v0 + 88) = v4;
  type metadata accessor for XPCMessageCenter.XPCResponse();
}

uint64_t sub_243BF2FE4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x249502B6C](&unk_243C048C0, a1);
  sub_243BFD670();

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_243BF3034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a6 + 4;
  v9 = a6[2];
  if (a5)
    return sub_243BF4F98(a1, a2, a3, a4, (uint64_t)v8, v9, (_QWORD *)(a5 + 16));
  if (!v9)
    return 0;
  if (*v8 == a1)
    return 0;
  if (v9 == 1)
    return 0;
  if (a6[8] == a1)
    return 1;
  if (v9 == 2)
    return 0;
  if (a6[12] == a1)
    return 2;
  if (v9 == 3)
    return 0;
  if (a6[16] == a1)
    return 3;
  v11 = a6 + 20;
  v12 = 4;
  while (v9 != v12)
  {
    v13 = *v11;
    v11 += 4;
    ++v12;
    if (v13 == a1)
      return v12 - 1;
  }
  return 0;
}

uint64_t sub_243BF3148(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4 + 4;
  v7 = a4[2];
  if (a3)
    return sub_243BF50D4(a1, a2, (uint64_t)v6, v7, (_QWORD *)(a3 + 16));
  if (!v7)
    return 0;
  if (*v6 == a1)
    return 0;
  if (v7 == 1)
    return 0;
  if (a4[6] == a1)
    return 1;
  if (v7 == 2)
    return 0;
  if (a4[8] == a1)
    return 2;
  if (v7 == 3)
    return 0;
  if (a4[10] == a1)
    return 3;
  v9 = a4 + 12;
  v10 = 4;
  while (v7 != v10)
  {
    v11 = *v9;
    v9 += 2;
    ++v10;
    if (v11 == a1)
      return v10 - 1;
  }
  return 0;
}

uint64_t sub_243BF325C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_243B50168(a1, (uint64_t)v7, &qword_2572ED090);
  v8 = v2 + 1;
  v9 = v2[1];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v2[1] = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_243B7CD60(0, *(_QWORD *)(v9 + 16) + 1, 1);
    v9 = *v8;
  }
  v12 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    sub_243B7CD60(v11 > 1, v12 + 1, 1);
    v9 = *v8;
  }
  *(_QWORD *)(v9 + 16) = v12 + 1;
  result = sub_243B6F9B4((uint64_t)v7, v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v12, &qword_2572ED090);
  v2[1] = v9;
  v14 = *(_QWORD *)(v9 + 16);
  v15 = *v2;
  if (*v2)
  {
    swift_beginAccess();
    if (MEMORY[0x2495016C0](*(_QWORD *)(v15 + 16) & 0x3FLL) >= v14)
    {
      result = swift_isUniquelyReferenced_native();
      v16 = *v2;
      if (!(_DWORD)result)
      {
        if (!v16)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        v16 = sub_243BFD328();
        result = swift_release();
        *v2 = v16;
      }
      if (v16)
        return sub_243BFD2E0();
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v14 < 0x10)
  {
    return result;
  }
  return sub_243BF3748((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_243BF3894);
}

uint64_t sub_243BF3440(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = v4;
  v12 = v4[1];
  v10 = v4 + 1;
  v11 = v12;
  sub_243B924DC(a3, a4);
  result = swift_isUniquelyReferenced_nonNull_native();
  *v10 = v12;
  if ((result & 1) == 0)
  {
    result = sub_243B7CDB4(0, *(_QWORD *)(v11 + 16) + 1, 1);
    v11 = *v10;
  }
  v15 = *(_QWORD *)(v11 + 16);
  v14 = *(_QWORD *)(v11 + 24);
  if (v15 >= v14 >> 1)
  {
    result = sub_243B7CDB4(v14 > 1, v15 + 1, 1);
    v11 = *v10;
  }
  *(_QWORD *)(v11 + 16) = v15 + 1;
  v16 = (_QWORD *)(v11 + 32 * v15);
  v16[4] = a1;
  v16[5] = a2;
  v16[6] = a3;
  v16[7] = a4;
  v5[1] = v11;
  v17 = *(_QWORD *)(v11 + 16);
  v18 = *v5;
  if (*v5)
  {
    swift_beginAccess();
    if (MEMORY[0x2495016C0](*(_QWORD *)(v18 + 16) & 0x3FLL) >= v17)
    {
      result = swift_isUniquelyReferenced_native();
      v19 = *v5;
      if (!(_DWORD)result)
      {
        if (!v19)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        v19 = sub_243BFD328();
        result = swift_release();
        *v5 = v19;
      }
      if (v19)
        return sub_243BFD2E0();
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v17 < 0x10)
  {
    return result;
  }
  return sub_243BF3748((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_243BF391C);
}

uint64_t sub_243BF35D8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v8 = v2[1];
  v6 = v2 + 1;
  v7 = v8;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v6 = v8;
  if ((result & 1) == 0)
  {
    result = sub_243B7CDD0(0, *(_QWORD *)(v7 + 16) + 1, 1);
    v7 = *v6;
  }
  v11 = *(_QWORD *)(v7 + 16);
  v10 = *(_QWORD *)(v7 + 24);
  if (v11 >= v10 >> 1)
  {
    result = sub_243B7CDD0(v10 > 1, v11 + 1, 1);
    v7 = *v6;
  }
  *(_QWORD *)(v7 + 16) = v11 + 1;
  v12 = v7 + 16 * v11;
  *(_QWORD *)(v12 + 32) = a1;
  *(_QWORD *)(v12 + 40) = a2;
  v3[1] = v7;
  v13 = *(_QWORD *)(v7 + 16);
  v14 = *v3;
  if (*v3)
  {
    swift_beginAccess();
    if (MEMORY[0x2495016C0](*(_QWORD *)(v14 + 16) & 0x3FLL) >= v13)
    {
      result = swift_isUniquelyReferenced_native();
      v15 = *v3;
      if (!(_DWORD)result)
      {
        if (!v15)
        {
LABEL_16:
          __break(1u);
          return result;
        }
        v15 = sub_243BFD328();
        result = swift_release();
        *v3 = v15;
      }
      if (v15)
        return sub_243BFD2E0();
      __break(1u);
      goto LABEL_16;
    }
  }
  else if ((unint64_t)v13 < 0x10)
  {
    return result;
  }
  return sub_243BF37F4();
}

uint64_t sub_243BF3748(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v3 = *v1;
  v4 = v1[1];
  if (*v1)
  {
    swift_beginAccess();
    v5 = *(_QWORD *)(v3 + 24) & 0x3FLL;
    v6 = *(_QWORD *)(v4 + 16);
    if (v5)
      goto LABEL_7;
  }
  else
  {
    v5 = 0;
    v6 = *(_QWORD *)(v4 + 16);
  }
  if (v6 < 0x10)
  {
    v7 = 0;
    goto LABEL_11;
  }
LABEL_7:
  v8 = MEMORY[0x2495016E4](v6);
  if (v5 <= v8)
    v9 = v8;
  else
    v9 = v5;
  v7 = a1(v4, v9, 0, v5);
LABEL_11:
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_243BF37F4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess();
    v3 = *(_QWORD *)(v1 + 24) & 0x3FLL;
    v4 = *(_QWORD *)(v2 + 16);
    if (v3)
      goto LABEL_7;
  }
  else
  {
    v3 = 0;
    v4 = *(_QWORD *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  v6 = MEMORY[0x2495016E4](v4);
  if (v3 <= v6)
    v7 = v6;
  else
    v7 = v3;
  v5 = sub_243BF39AC(v2, v7, 0, v3);
LABEL_11:
  result = swift_release();
  *v0 = v5;
  return result;
}

uint64_t sub_243BF3894(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = MEMORY[0x2495016E4](*(_QWORD *)(a1 + 16));
  v9 = 0;
  if ((a3 & 1) != 0)
    v10 = 0;
  else
    v10 = a2;
  if (v10 <= v8)
    v10 = v8;
  if (v10 <= a4)
    v11 = a4;
  else
    v11 = v10;
  if (v11 >= 5)
  {
    v9 = MEMORY[0x2495016F0]();
    sub_243BF3C3C(a1, (_QWORD *)(v9 + 16), v9 + 32);
  }
  return v9;
}

uint64_t sub_243BF391C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = MEMORY[0x2495016E4](*(_QWORD *)(a1 + 16));
  v9 = 0;
  if ((a3 & 1) != 0)
    v10 = 0;
  else
    v10 = a2;
  if (v10 <= v8)
    v10 = v8;
  if (v10 <= a4)
    v11 = a4;
  else
    v11 = v10;
  if (v11 >= 5)
  {
    v9 = MEMORY[0x2495016F0]();
    sub_243BF3A3C(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

uint64_t sub_243BF39AC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = MEMORY[0x2495016E4](*(_QWORD *)(a1 + 16));
  v9 = 0;
  if ((a3 & 1) != 0)
    v10 = 0;
  else
    v10 = a2;
  if (v10 <= v8)
    v10 = v8;
  if (v10 <= a4)
    v11 = a4;
  else
    v11 = v10;
  if (v11 >= 5)
  {
    v9 = MEMORY[0x2495016F0]();
    sub_243BF3B3C(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

uint64_t sub_243BF3A3C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    v4 = (_QWORD *)result;
    v5 = 0;
    while (1)
    {
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      if (__OFSUB__(1 << *v4, 1))
        break;
      if (sub_243BFD2C8())
      {
        while (1)
          sub_243BFD304();
      }
      result = sub_243BFD2F8();
      if (++v5 == v3)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_243BF3B3C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    v4 = (_QWORD *)result;
    v5 = 0;
    while (1)
    {
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      if (__OFSUB__(1 << *v4, 1))
        break;
      if (sub_243BFD2C8())
      {
        while (1)
          sub_243BFD304();
      }
      result = sub_243BFD2F8();
      if (++v5 == v3)
        return result;
    }
    __break(1u);
  }
  return result;
}

void sub_243BF3C3C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
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
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *(_QWORD *)(a1 + 16);
  if (v24)
  {
    v10 = 0;
    v23 = a1 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v11 = *(_QWORD *)(v7 + 72);
    while (1)
    {
      sub_243B50168(v23 + v11 * v10, (uint64_t)v9, &qword_2572ED090);
      sub_243BFE1A4();
      sub_243BFE1D4();
      v12 = sub_243BFE1E0();
      v13 = 1 << *a2;
      v14 = __OFSUB__(v13, 1);
      v15 = v13 - 1;
      if (v14)
        break;
      v16 = v15 & v12;
      v17 = sub_243BFD2C8();
      v19 = v18;
      v21 = v20;
      sub_243B6F978((uint64_t)v9, &qword_2572ED090);
      v25 = a2;
      v26 = a3;
      v27 = v16;
      v28 = v17;
      v29 = v19;
      v30 = v21;
      v31 = 0;
      while (v28)
        sub_243BFD304();
      sub_243BFD2F8();
      if (++v10 == v24)
        return;
    }
    __break(1u);
  }
}

uint64_t sub_243BF3DB4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED068);
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
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF3F1C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4DB8(a1, a2, a3, a4, &qword_2572ED0B8, &qword_2572ED0C0);
}

uint64_t sub_243BF3F30(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4DB8(a1, a2, a3, a4, &qword_2572EFE70, &qword_2572EBA28);
}

uint64_t sub_243BF3F44(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4DB8(a1, a2, a3, a4, &qword_2572ED128, &qword_2572ED120);
}

uint64_t sub_243BF3F58(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4A68(a1, a2, a3, a4, &qword_2572ED098, type metadata accessor for StoredPhoto);
}

uint64_t sub_243BF3F6C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4DB8(a1, a2, a3, a4, qword_2572EFE78, &qword_2572ED390);
}

uint64_t sub_243BF3F80(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4DB8(a1, a2, a3, a4, &qword_2572ED0E8, &qword_2572ED0F0);
}

uint64_t sub_243BF3F94(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED0D0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED0D8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF411C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4A68(a1, a2, a3, a4, &qword_2572ED0C8, (uint64_t (*)(_QWORD))type metadata accessor for ShuffleID);
}

uint64_t sub_243BF4130(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4A68(a1, a2, a3, a4, &qword_2572ED0E0, (uint64_t (*)(_QWORD))type metadata accessor for DatabaseBinding);
}

uint64_t sub_243BF4144(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4A68(a1, a2, a3, a4, &qword_2572ED0B0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_243BF4158(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4A68(a1, a2, a3, a4, &qword_2572EFE20, type metadata accessor for StoredPhotoProto);
}

uint64_t sub_243BF416C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED078);
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
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF42D4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED9B0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF4430(char a1, int64_t a2, char a3, char *a4)
{
  return sub_243BF4474(a1, a2, a3, a4, &qword_2572EFE38);
}

uint64_t sub_243BF443C(char a1, int64_t a2, char a3, char *a4)
{
  return sub_243BF4474(a1, a2, a3, a4, &qword_2572EFDB0);
}

uint64_t sub_243BF4448(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4DB8(a1, a2, a3, a4, &qword_2572ED088, &qword_2572ED090);
}

uint64_t sub_243BF445C(char a1, int64_t a2, char a3, char *a4)
{
  return sub_243BF4760(a1, a2, a3, a4, &qword_2572ED080);
}

uint64_t sub_243BF4468(char a1, int64_t a2, char a3, char *a4)
{
  return sub_243BF4474(a1, a2, a3, a4, &qword_2572EFDA8);
}

uint64_t sub_243BF4474(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v9] || v14 >= &v15[8 * v9])
  {
    memcpy(v14, v15, 8 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF45CC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED058);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 32 * v8)
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 32 * v8 || v13 >= v14 + 32 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED060);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF4754(char a1, int64_t a2, char a3, char *a4)
{
  return sub_243BF4760(a1, a2, a3, a4, &qword_2572ED050);
}

uint64_t sub_243BF4760(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v9])
      memmove(v14, v15, 16 * v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v9] || v14 >= &v15[16 * v9])
  {
    memcpy(v14, v15, 16 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF48B8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4A68(a1, a2, a3, a4, &qword_2572ED148, (uint64_t (*)(_QWORD))type metadata accessor for AlbumID);
}

uint64_t sub_243BF48CC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE28);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8)
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE30);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF4A54(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4A68(a1, a2, a3, a4, &qword_2572EFE68, type metadata accessor for StoredPhotoLayoutProto);
}

uint64_t sub_243BF4A68(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF4C48(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDE0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF4DA4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_243BF4DB8(a1, a2, a3, a4, &qword_2572EFDE8, &qword_2572EBA10);
}

uint64_t sub_243BF4DB8(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF4F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t result;
  char v11;
  char v12;

  sub_243BFE1A4();
  sub_243BFE1D4();
  result = sub_243BFE1E0();
  if (__OFSUB__(1 << *a7, 1))
  {
    __break(1u);
  }
  else
  {
    sub_243BFD2C8();
    result = sub_243BFD2EC();
    if ((v11 & 1) == 0 && *(_QWORD *)(a5 + 32 * result) != a1)
    {
      do
      {
        sub_243BFD304();
        result = sub_243BFD2EC();
      }
      while ((v12 & 1) == 0 && *(_QWORD *)(a5 + 32 * result) != a1);
    }
  }
  return result;
}

uint64_t sub_243BF50D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  char v9;
  char v10;

  sub_243BFE1A4();
  sub_243BFE1D4();
  result = sub_243BFE1E0();
  if (__OFSUB__(1 << *a5, 1))
  {
    __break(1u);
  }
  else
  {
    sub_243BFD2C8();
    result = sub_243BFD2EC();
    if ((v9 & 1) == 0 && *(_QWORD *)(a3 + 16 * result) != a1)
    {
      do
      {
        sub_243BFD304();
        result = sub_243BFD2EC();
      }
      while ((v10 & 1) == 0 && *(_QWORD *)(a3 + 16 * result) != a1);
    }
  }
  return result;
}

unint64_t sub_243BF5210@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(v3[1] + 16);
  v7 = *v3;
  if (!*v3)
  {
    if (!v6)
      goto LABEL_16;
    return sub_243BF562C(a1, a3);
  }
  swift_beginAccess();
  if ((*(_QWORD *)(v7 + 16) & 0x3FLL) == (*(_QWORD *)(v7 + 24) & 0x3FLL))
  {
    if (!v6)
      goto LABEL_16;
  }
  else if (v6 <= sub_243BFD31C())
  {
LABEL_16:
    sub_243BF562C(a1, a3);
    return sub_243BF3748((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_243BF3894);
  }
  result = swift_isUniquelyReferenced_native();
  v10 = *v3;
  if (!(_DWORD)result)
  {
    if (!v10)
      goto LABEL_20;
    v10 = sub_243BFD328();
    result = swift_release();
    *v3 = v10;
  }
  if (v10)
  {
    swift_retain();
    result = sub_243BF5C94(a2, (_QWORD *)(v10 + 16), v10 + 32, (uint64_t)v3);
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (a1 + 1 >= a1)
    {
      v11 = v3[1];
      swift_retain();
      sub_243BF5F18(a1, a1 + 1, v11, (_QWORD *)(v10 + 16), v10 + 32);
      swift_release();
      swift_release();
      return sub_243BF562C(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_243BF5380@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(v3[1] + 16);
  v7 = *v3;
  if (!*v3)
  {
    if (!v6)
      goto LABEL_16;
    return sub_243BF5770(a1, a3);
  }
  swift_beginAccess();
  if ((*(_QWORD *)(v7 + 16) & 0x3FLL) == (*(_QWORD *)(v7 + 24) & 0x3FLL))
  {
    if (!v6)
      goto LABEL_16;
  }
  else if (v6 <= sub_243BFD31C())
  {
LABEL_16:
    sub_243BF5770(a1, a3);
    return sub_243BF3748((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_243BF391C);
  }
  result = swift_isUniquelyReferenced_native();
  v10 = *v3;
  if (!(_DWORD)result)
  {
    if (!v10)
      goto LABEL_20;
    v10 = sub_243BFD328();
    result = swift_release();
    *v3 = v10;
  }
  if (v10)
  {
    result = sub_243BF5ADC(a2, (_QWORD *)(v10 + 16), v10 + 32, (uint64_t)v3);
    v11 = a1 + 1;
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (v11 >= a1)
    {
      sub_243BF6420(a1, v11, v3[1], (_QWORD *)(v10 + 16));
      return sub_243BF5770(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

unint64_t sub_243BF54C8(int64_t a1, uint64_t a2)
{
  return sub_243BF54D4(a1, a2, sub_243BF6D18);
}

unint64_t sub_243BF54D4(int64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(v3[1] + 16);
  v7 = *v3;
  if (!*v3)
  {
    if (!v6)
      goto LABEL_16;
    return sub_243BF5848(a1, a3);
  }
  swift_beginAccess();
  if ((*(_QWORD *)(v7 + 16) & 0x3FLL) == (*(_QWORD *)(v7 + 24) & 0x3FLL))
  {
    if (!v6)
      goto LABEL_16;
  }
  else if (v6 <= sub_243BFD31C())
  {
LABEL_16:
    v12 = sub_243BF5848(a1, a3);
    sub_243BF37F4();
    return v12;
  }
  result = swift_isUniquelyReferenced_native();
  v10 = *v3;
  if (!(_DWORD)result)
  {
    if (!v10)
      goto LABEL_21;
    v10 = sub_243BFD328();
    result = swift_release();
    *v3 = v10;
  }
  if (v10)
  {
    result = sub_243BF5924(a2, (_QWORD *)(v10 + 16), v10 + 32, (uint64_t)v3);
    v11 = a1 + 1;
    if (__OFADD__(a1, 1))
    {
      __break(1u);
    }
    else if (v11 >= a1)
    {
      sub_243BF6858(a1, v11, v3[1], (_QWORD *)(v10 + 16));
      return sub_243BF5848(a1, a3);
    }
    __break(1u);
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_243BF562C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = (_QWORD *)sub_243BF6CA4(v5);
  v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
    goto LABEL_15;
  }
  v7 = v6 - 1;
  v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090) - 8);
  v9 = *(_QWORD *)(v8 + 72);
  v10 = (unint64_t)v5
      + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
      + v9 * a1;
  result = sub_243B6F9B4(v10, a2, &qword_2572ED090);
  if ((uint64_t)(v7 - a1) < 0)
  {
LABEL_15:
    result = sub_243BFDFE8();
    __break(1u);
    return result;
  }
  if (v9 > 0 || v10 >= v10 + v9 + v9 * (v7 - a1))
  {
    result = swift_arrayInitWithTakeFrontToBack();
  }
  else if (v9)
  {
    result = swift_arrayInitWithTakeBackToFront();
  }
  v5[2] = v7;
  *v2 = v5;
  return result;
}

uint64_t sub_243BF5770@<X0>(unint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  _QWORD **v2;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = (_QWORD *)sub_243BF6D04(v5);
  v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = &v5[4 * a1];
    v9 = *((_OWORD *)v7 + 2);
    v10 = *((_OWORD *)v7 + 3);
    v8 = v7 + 4;
    v11 = v6 - 1;
    *a2 = v9;
    a2[1] = v10;
    v12 = v6 - 1 - a1;
    if (v12 >= 0)
    {
      result = (uint64_t)memmove(v8, v8 + 4, 32 * v12);
      v5[2] = v11;
      *v2 = v5;
      return result;
    }
  }
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

uint64_t sub_243BF5848(unint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = a2(v5);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 16 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 48), 16 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      *v2 = v5;
      return v10;
    }
  }
  result = sub_243BFDFE8();
  __break(1u);
  return result;
}

unint64_t sub_243BF5924(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = a1;
  v14 = sub_243BFD2C8();
  sub_243BFD304();
  if (!v14)
    return sub_243BFD2E0();
  v7 = a1;
  v8 = sub_243BFD2D4();
  while (1)
  {
    result = sub_243BFD2EC();
    if ((v10 & 1) != 0)
      break;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      break;
    }
    if (result >= *(_QWORD *)(*(_QWORD *)(a4 + 8) + 16))
      goto LABEL_16;
    sub_243BFE1A4();
    sub_243BFE1D4();
    result = sub_243BFE1E0();
    v11 = 1 << *a2;
    if (__OFSUB__(v11, 1))
      goto LABEL_17;
    v12 = (v11 - 1) & result;
    if (v6 >= v8)
    {
      if (v12 < v8)
        goto LABEL_3;
LABEL_12:
      if (v6 < v12)
        goto LABEL_3;
      goto LABEL_13;
    }
    if (v12 < v8)
      goto LABEL_12;
LABEL_13:
    sub_243BFD2EC();
    sub_243BFD2E0();
    v6 = v7;
LABEL_3:
    sub_243BFD304();
    v7 = a1;
  }
  __break(1u);
  return result;
}

unint64_t sub_243BF5ADC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v6 = a1;
  v14 = sub_243BFD2C8();
  sub_243BFD304();
  if (!v14)
    return sub_243BFD2E0();
  v7 = a1;
  v8 = sub_243BFD2D4();
  while (1)
  {
    result = sub_243BFD2EC();
    if ((v10 & 1) != 0)
      break;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      break;
    }
    if (result >= *(_QWORD *)(*(_QWORD *)(a4 + 8) + 16))
      goto LABEL_16;
    sub_243BFE1A4();
    sub_243BFE1D4();
    result = sub_243BFE1E0();
    v11 = 1 << *a2;
    if (__OFSUB__(v11, 1))
      goto LABEL_17;
    v12 = (v11 - 1) & result;
    if (v6 >= v8)
    {
      if (v12 < v8)
        goto LABEL_3;
LABEL_12:
      if (v6 < v12)
        goto LABEL_3;
      goto LABEL_13;
    }
    if (v12 < v8)
      goto LABEL_12;
LABEL_13:
    sub_243BFD2EC();
    sub_243BFD2E0();
    v6 = v7;
LABEL_3:
    sub_243BFD304();
    v7 = a1;
  }
  __break(1u);
  return result;
}

unint64_t sub_243BF5C94(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t result;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v30 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_243BFD2C8();
  *(_QWORD *)&v31 = a2;
  *((_QWORD *)&v31 + 1) = a3;
  v32 = a1;
  v33 = v11;
  v34 = v12;
  v35 = v13;
  v36 = 0;
  sub_243BFD304();
  v14 = v33;
  if (!v33)
    return sub_243BFD2E0();
  v15 = v36;
  v17 = v34;
  v16 = v35;
  v18 = v32;
  v28 = v31;
  v29 = a3;
  v19 = sub_243BFD2D4();
  v20 = v28;
  v21 = v19;
  while (1)
  {
    v37 = v20;
    v38 = v18;
    v39 = v14;
    v40 = v17;
    v41 = v16;
    v42 = v15 & 1;
    result = sub_243BFD2EC();
    if ((v23 & 1) != 0)
      break;
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      break;
    }
    v24 = *(_QWORD *)(v30 + 8);
    if (result >= *(_QWORD *)(v24 + 16))
      goto LABEL_17;
    sub_243B50168(v24+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * result, (uint64_t)v10, &qword_2572ED090);
    sub_243BFE1A4();
    sub_243BFE1D4();
    v25 = sub_243BFE1E0();
    result = sub_243B6F978((uint64_t)v10, &qword_2572ED090);
    v26 = 1 << *a2;
    if (__OFSUB__(v26, 1))
      goto LABEL_18;
    v27 = (v26 - 1) & v25;
    if (a1 >= v21)
    {
      if (v27 < v21)
        goto LABEL_3;
    }
    else if (v27 >= v21)
    {
      goto LABEL_13;
    }
    if (a1 >= v27)
    {
LABEL_13:
      sub_243BFD2EC();
      sub_243BFD2E0();
      a1 = v18;
    }
LABEL_3:
    sub_243BFD304();
    v20 = v31;
    v18 = v32;
    v14 = v33;
    v17 = v34;
    v16 = v35;
    v15 = v36;
    if (!v33)
      return sub_243BFD2E0();
  }
  __break(1u);
  return result;
}

void sub_243BF5F18(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  char v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  char v78;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.n128_f64[0] = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v67 - v16;
  v18 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  if (v18 >= 1)
  {
    v19 = *(_QWORD *)(a3 + 16);
    v20 = v19 - v18;
    if ((uint64_t)v19 < v18)
      ++v20;
    if (a1 >= v20 >> 1)
    {
      v68 = a3;
      if (__OFSUB__(v19, a2))
      {
LABEL_61:
        __break(1u);
        goto LABEL_62;
      }
      if ((uint64_t)(v19 - a2) >= MEMORY[0x2495016C0](*a4 & 0x3FLL, v15) / 3)
      {
LABEL_49:
        v61 = sub_243BFD2C8();
        v62 = 0;
        *(_QWORD *)&v74 = a4;
        *((_QWORD *)&v74 + 1) = a5;
        v75 = 0;
        *(_QWORD *)&v76 = v61;
        *((_QWORD *)&v76 + 1) = v63;
        v77 = v64;
        v78 = 0;
        while (1)
        {
          v69 = v74;
          v70 = v62;
          v71 = v76;
          v72 = v77;
          v73 = v78;
          v65 = sub_243BFD2EC();
          if ((v66 & 1) == 0 && v65 >= a2)
          {
            if (__OFSUB__(v65, v18))
              goto LABEL_57;
            sub_243BFD2F8();
          }
          sub_243BFD304();
          v62 = v75;
          if (!v75)
            return;
        }
      }
      if ((uint64_t)v19 < a2)
        goto LABEL_66;
      if (a2 < 0)
      {
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      if (v19 != a2)
      {
        if (v19 <= a2)
        {
LABEL_68:
          __break(1u);
          return;
        }
        v41 = v68 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
        v42 = *(_QWORD *)(v11 + 72);
        swift_retain();
        while (1)
        {
          sub_243B50168(v41 + v42 * a2, (uint64_t)v13, &qword_2572ED090);
          sub_243BFE1A4();
          sub_243BFE1D4();
          v43 = sub_243BFE1E0();
          v44 = 1 << *a4;
          v26 = __OFSUB__(v44, 1);
          v45 = v44 - 1;
          if (v26)
            goto LABEL_58;
          v46 = v45 & v43;
          v47 = sub_243BFD2C8();
          *(_QWORD *)&v69 = a4;
          *((_QWORD *)&v69 + 1) = a5;
          v70 = v46;
          *(_QWORD *)&v71 = v47;
          *((_QWORD *)&v71 + 1) = v48;
          v72 = v49;
          v73 = 0;
          if (v47)
          {
            v50 = 0;
            v51 = a4;
            v52 = a5;
            do
            {
              *(_QWORD *)&v74 = v51;
              *((_QWORD *)&v74 + 1) = v52;
              v75 = v46;
              *(_QWORD *)&v76 = v47;
              *((_QWORD *)&v76 + 1) = v48;
              v77 = v49;
              v78 = v50 & 1;
              v53 = sub_243BFD2EC();
              if ((v54 & 1) == 0 && v53 == a2)
                break;
              sub_243BFD304();
              v52 = *((_QWORD *)&v69 + 1);
              v51 = (_QWORD *)v69;
              v46 = v70;
              v48 = *((_QWORD *)&v71 + 1);
              v47 = v71;
              v49 = v72;
              v50 = v73;
            }
            while ((_QWORD)v71);
          }
          if (__OFSUB__(a2, v18))
            goto LABEL_59;
          ++a2;
          sub_243BFD2F8();
          sub_243B6F978((uint64_t)v13, &qword_2572ED090);
          if (a2 == v19)
          {
            swift_release();
            return;
          }
        }
      }
    }
    else
    {
      if (MEMORY[0x2495016C0](*a4 & 0x3FLL, v15) / 3 <= a1)
      {
        v55 = sub_243BFD2C8();
        v56 = 0;
        *(_QWORD *)&v74 = a4;
        *((_QWORD *)&v74 + 1) = a5;
        v75 = 0;
        *(_QWORD *)&v76 = v55;
        *((_QWORD *)&v76 + 1) = v57;
        v77 = v58;
        v78 = 0;
        while (1)
        {
          v69 = v74;
          v70 = v56;
          v71 = v76;
          v72 = v77;
          v73 = v78;
          v59 = sub_243BFD2EC();
          if ((v60 & 1) == 0 && v59 < a1)
          {
            if (__OFADD__(v59, v18))
            {
              __break(1u);
              goto LABEL_49;
            }
            sub_243BFD2F8();
          }
          sub_243BFD304();
          v56 = v75;
          if (!v75)
            goto LABEL_20;
        }
      }
      if (a1 < 0)
        goto LABEL_64;
      if (v19 < a1)
      {
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      if (a1)
      {
        v21 = a3 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
        v22 = *(_QWORD *)(v11 + 72);
        v68 = a3;
        swift_retain();
        v23 = 0;
        while (1)
        {
          sub_243B50168(v21 + v22 * v23, (uint64_t)v17, &qword_2572ED090);
          sub_243BFE1A4();
          sub_243BFE1D4();
          v24 = sub_243BFE1E0();
          v25 = 1 << *a4;
          v26 = __OFSUB__(v25, 1);
          v27 = v25 - 1;
          if (v26)
            break;
          v28 = v27 & v24;
          v29 = sub_243BFD2C8();
          *(_QWORD *)&v69 = a4;
          *((_QWORD *)&v69 + 1) = a5;
          v70 = v28;
          *(_QWORD *)&v71 = v29;
          *((_QWORD *)&v71 + 1) = v30;
          v72 = v31;
          v73 = 0;
          if (v29)
          {
            v32 = 0;
            v33 = a4;
            v34 = a5;
            do
            {
              *(_QWORD *)&v74 = v33;
              *((_QWORD *)&v74 + 1) = v34;
              v75 = v28;
              *(_QWORD *)&v76 = v29;
              *((_QWORD *)&v76 + 1) = v30;
              v77 = v31;
              v78 = v32 & 1;
              v35 = sub_243BFD2EC();
              if ((v36 & 1) == 0 && v35 == v23)
                break;
              sub_243BFD304();
              v34 = *((_QWORD *)&v69 + 1);
              v33 = (_QWORD *)v69;
              v28 = v70;
              v30 = *((_QWORD *)&v71 + 1);
              v29 = v71;
              v31 = v72;
              v32 = v73;
            }
            while ((_QWORD)v71);
          }
          if (__OFADD__(v23, v18))
            goto LABEL_56;
          ++v23;
          sub_243BFD2F8();
          sub_243B6F978((uint64_t)v17, &qword_2572ED090);
          if (v23 == a1)
          {
            swift_release();
            goto LABEL_20;
          }
        }
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
LABEL_59:
        __break(1u);
        goto LABEL_60;
      }
LABEL_20:
      v37 = a4[1];
      if (__OFSUB__(v37 >> 6, v18))
      {
LABEL_62:
        __break(1u);
        goto LABEL_63;
      }
      v38 = 1 << *a4;
      v26 = __OFSUB__(v38, 1);
      v39 = v38 - 1;
      if (v26)
      {
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      v40 = (v39 & (((v37 >> 6) - v18) >> 63)) + (v37 >> 6) - v18;
      if (v40 < v39)
        v39 = 0;
      a4[1] = a4[1] & 0x3FLL | ((v40 - v39) << 6);
    }
  }
}

uint64_t sub_243BF6420(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;

  v5 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v5 >= 1)
  {
    v7 = result;
    v8 = *(_QWORD *)(a3 + 16);
    v9 = v8 - v5;
    if ((uint64_t)v8 < v5)
      ++v9;
    if (result < v9 >> 1)
    {
      result = MEMORY[0x2495016C0](*a4 & 0x3FLL);
      if (result / 3 > v7)
      {
        if (v7 < 0)
        {
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        if (v8 < v7)
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v7)
        {
          v10 = 0;
          while (1)
          {
            sub_243BFE1A4();
            sub_243BFE1D4();
            result = sub_243BFE1E0();
            if (__OFSUB__(1 << *a4, 1))
              break;
            if (sub_243BFD2C8())
            {
              while (1)
              {
                v11 = sub_243BFD2EC();
                if ((v12 & 1) == 0 && v11 == v10)
                  break;
                sub_243BFD304();
              }
            }
            result = v10 + v5;
            if (__OFADD__(v10, v5))
              goto LABEL_53;
            ++v10;
            result = sub_243BFD2F8();
            if (v10 == v7)
              goto LABEL_19;
          }
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        goto LABEL_19;
      }
      sub_243BFD2C8();
      v21 = sub_243BFD2EC();
      if ((v22 & 1) != 0 || v21 >= v7)
      {
LABEL_40:
        result = sub_243BFD304();
LABEL_19:
        v13 = a4[1];
        if (__OFSUB__(v13 >> 6, v5))
        {
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        v14 = 1 << *a4;
        v15 = __OFSUB__(v14, 1);
        v16 = v14 - 1;
        if (v15)
        {
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
        v17 = (v16 & (((v13 >> 6) - v5) >> 63)) + (v13 >> 6) - v5;
        if (v17 < v16)
          v16 = 0;
        a4[1] = a4[1] & 0x3FLL | ((v17 - v16) << 6);
        return result;
      }
      if (!__OFADD__(v21, v5))
      {
        sub_243BFD2F8();
        goto LABEL_40;
      }
      __break(1u);
LABEL_46:
      sub_243BFD2C8();
      v23 = sub_243BFD2EC();
      if ((v24 & 1) == 0 && v23 >= v4)
      {
        v15 = __OFSUB__(v23, v5);
        result = v23 - v5;
        if (v15)
        {
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        sub_243BFD2F8();
      }
      return sub_243BFD304();
    }
    v4 = a2;
    v18 = v8 - a2;
    if (__OFSUB__(v8, a2))
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    result = MEMORY[0x2495016C0](*a4 & 0x3FLL);
    if (v18 >= result / 3)
      goto LABEL_46;
    if ((uint64_t)v8 < v4)
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (v4 < 0)
    {
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    if (v8 != v4)
    {
      if (v8 <= v4)
      {
LABEL_65:
        __break(1u);
        return result;
      }
      while (1)
      {
        sub_243BFE1A4();
        sub_243BFE1D4();
        result = sub_243BFE1E0();
        if (__OFSUB__(1 << *a4, 1))
          goto LABEL_55;
        if (sub_243BFD2C8())
        {
          while (1)
          {
            v19 = sub_243BFD2EC();
            if ((v20 & 1) == 0 && v19 == v4)
              break;
            sub_243BFD304();
          }
        }
        result = v4 - v5;
        if (__OFSUB__(v4, v5))
          goto LABEL_56;
        ++v4;
        result = sub_243BFD2F8();
        if (v4 == v8)
          return result;
      }
    }
  }
  return result;
}

uint64_t sub_243BF6858(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;

  v5 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (v5 >= 1)
  {
    v7 = result;
    v8 = *(_QWORD *)(a3 + 16);
    v9 = v8 - v5;
    if ((uint64_t)v8 < v5)
      ++v9;
    if (result < v9 >> 1)
    {
      result = MEMORY[0x2495016C0](*a4 & 0x3FLL);
      if (result / 3 > v7)
      {
        if (v7 < 0)
        {
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        if (v8 < v7)
        {
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v7)
        {
          v10 = 0;
          while (1)
          {
            sub_243BFE1A4();
            sub_243BFE1D4();
            result = sub_243BFE1E0();
            if (__OFSUB__(1 << *a4, 1))
              break;
            if (sub_243BFD2C8())
            {
              while (1)
              {
                v11 = sub_243BFD2EC();
                if ((v12 & 1) == 0 && v11 == v10)
                  break;
                sub_243BFD304();
              }
            }
            result = v10 + v5;
            if (__OFADD__(v10, v5))
              goto LABEL_53;
            ++v10;
            result = sub_243BFD2F8();
            if (v10 == v7)
              goto LABEL_19;
          }
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }
        goto LABEL_19;
      }
      sub_243BFD2C8();
      v21 = sub_243BFD2EC();
      if ((v22 & 1) != 0 || v21 >= v7)
      {
LABEL_40:
        result = sub_243BFD304();
LABEL_19:
        v13 = a4[1];
        if (__OFSUB__(v13 >> 6, v5))
        {
LABEL_59:
          __break(1u);
          goto LABEL_60;
        }
        v14 = 1 << *a4;
        v15 = __OFSUB__(v14, 1);
        v16 = v14 - 1;
        if (v15)
        {
LABEL_60:
          __break(1u);
          goto LABEL_61;
        }
        v17 = (v16 & (((v13 >> 6) - v5) >> 63)) + (v13 >> 6) - v5;
        if (v17 < v16)
          v16 = 0;
        a4[1] = a4[1] & 0x3FLL | ((v17 - v16) << 6);
        return result;
      }
      if (!__OFADD__(v21, v5))
      {
        sub_243BFD2F8();
        goto LABEL_40;
      }
      __break(1u);
LABEL_46:
      sub_243BFD2C8();
      v23 = sub_243BFD2EC();
      if ((v24 & 1) == 0 && v23 >= v4)
      {
        v15 = __OFSUB__(v23, v5);
        result = v23 - v5;
        if (v15)
        {
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }
        sub_243BFD2F8();
      }
      return sub_243BFD304();
    }
    v4 = a2;
    v18 = v8 - a2;
    if (__OFSUB__(v8, a2))
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    result = MEMORY[0x2495016C0](*a4 & 0x3FLL);
    if (v18 >= result / 3)
      goto LABEL_46;
    if ((uint64_t)v8 < v4)
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if (v4 < 0)
    {
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
    if (v8 != v4)
    {
      if (v8 <= v4)
      {
LABEL_65:
        __break(1u);
        return result;
      }
      while (1)
      {
        sub_243BFE1A4();
        sub_243BFE1D4();
        result = sub_243BFE1E0();
        if (__OFSUB__(1 << *a4, 1))
          goto LABEL_55;
        if (sub_243BFD2C8())
        {
          while (1)
          {
            v19 = sub_243BFD2EC();
            if ((v20 & 1) == 0 && v19 == v4)
              break;
            sub_243BFD304();
          }
        }
        result = v4 - v5;
        if (__OFSUB__(v4, v5))
          goto LABEL_56;
        ++v4;
        result = sub_243BFD2F8();
        if (v4 == v8)
          return result;
      }
    }
  }
  return result;
}

uint64_t sub_243BF6C90(uint64_t a1)
{
  return sub_243BF3DB4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_243BF6CA4(_QWORD *a1)
{
  return sub_243BF4DB8(0, a1[2], 0, a1, &qword_2572ED088, &qword_2572ED090);
}

uint64_t sub_243BF6CD8(uint64_t a1)
{
  return sub_243BF4760(0, *(_QWORD *)(a1 + 16), 0, (char *)a1, &qword_2572ED080);
}

uint64_t sub_243BF6D04(_QWORD *a1)
{
  return sub_243BF45CC(0, a1[2], 0, a1);
}

uint64_t sub_243BF6D18(uint64_t a1)
{
  return sub_243BF4760(0, *(_QWORD *)(a1 + 16), 0, (char *)a1, &qword_2572ED050);
}

double sub_243BF6D44@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  double result;
  uint64_t v16;

  v5 = *v2;
  sub_243BFE1A4();
  sub_243BFE1D4();
  v6 = sub_243BFE1E0();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_9:
    result = 0.0;
    *(_OWORD *)a2 = xmmword_243C009F0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)(a2 + 24) = 0;
    return result;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 32 * v8) != a1)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_9;
    }
    while (*(_QWORD *)(v9 + 32 * v8) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v2;
  v16 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_243BF73BC();
    v12 = v16;
  }
  v13 = (_OWORD *)(*(_QWORD *)(v12 + 48) + 32 * v8);
  v14 = v13[1];
  *(_OWORD *)a2 = *v13;
  *(_OWORD *)(a2 + 16) = v14;
  sub_243BF904C(v8);
  *v2 = v16;
  swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_243BF6E8C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = *v1;
  sub_243BFE1A4();
  sub_243BFE1D4();
  v4 = sub_243BFE1E0();
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = v4 & ~v5;
  v7 = v3 + 56;
  if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(v3 + 48);
  if (*(_QWORD *)(v8 + 16 * v6) != a1)
  {
    v12 = ~v5;
    v6 = (v6 + 1) & v12;
    if (((*(_QWORD *)(v7 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
    {
      while (*(_QWORD *)(v8 + 16 * v6) != a1)
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v7 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          return 0;
      }
      goto LABEL_3;
    }
    return 0;
  }
LABEL_3:
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v1;
  v14 = *v1;
  *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_243BF7574();
    v10 = v14;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v6);
  sub_243BF91F8(v6);
  *v1 = v14;
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_243BF6FE4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED388);
  v2 = *v0;
  v3 = sub_243BFDE08();
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

void *sub_243BF7194()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE60);
  v6 = *v0;
  v7 = sub_243BFDE08();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_27:
    *v1 = v8;
    return result;
  }
  v24 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 56);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v20 >= v16)
      goto LABEL_25;
    v21 = *(_QWORD *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      v12 = v20 + 1;
      if (v20 + 1 >= v16)
        goto LABEL_25;
      v21 = *(_QWORD *)(v10 + 8 * v12);
      if (!v21)
      {
        v12 = v20 + 2;
        if (v20 + 2 >= v16)
          goto LABEL_25;
        v21 = *(_QWORD *)(v10 + 8 * v12);
        if (!v21)
          break;
      }
    }
LABEL_24:
    v15 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    sub_243B50168(*(_QWORD *)(v6 + 48) + v19, (uint64_t)v5, &qword_2572ED090);
    result = (void *)sub_243B6F9B4((uint64_t)v5, *(_QWORD *)(v8 + 48) + v19, &qword_2572ED090);
  }
  v22 = v20 + 3;
  if (v22 >= v16)
  {
LABEL_25:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_27;
  }
  v21 = *(_QWORD *)(v10 + 8 * v22);
  if (v21)
  {
    v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    v12 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v12 >= v16)
      goto LABEL_25;
    v21 = *(_QWORD *)(v10 + 8 * v12);
    ++v22;
    if (v21)
      goto LABEL_24;
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_243BF73BC()
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDA0);
  v2 = *v0;
  v3 = sub_243BFDE08();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_28;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
      {
        v9 = v21 + 2;
        if (v21 + 2 >= v13)
          goto LABEL_28;
        v22 = *(_QWORD *)(v6 + 8 * v9);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v18 = *(_QWORD *)(v17 + 16);
    v19 = *(_QWORD *)(v17 + 24);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    *(_OWORD *)v20 = *(_OWORD *)v17;
    *(_QWORD *)(v20 + 16) = v18;
    *(_QWORD *)(v20 + 24) = v19;
    result = (void *)sub_243B924DC(v18, v19);
  }
  v23 = v21 + 3;
  if (v23 >= v13)
    goto LABEL_28;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_243BF7574()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE18);
  v2 = *v0;
  v3 = sub_243BFDE08();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_243BF7708()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED388);
  v3 = sub_243BFDE14();
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
    sub_243BFE1A4();
    swift_bridgeObjectRetain();
    sub_243BFD850();
    result = sub_243BFE1E0();
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

uint64_t sub_243BF79B4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v32 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE60);
  result = sub_243BFDE14();
  v7 = result;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v7;
    return result;
  }
  v29 = v0;
  v8 = 0;
  v9 = *(_QWORD *)(v5 + 56);
  v30 = v5 + 56;
  v10 = 1 << *(_BYTE *)(v5 + 32);
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v12 = v11 & v9;
  v31 = (unint64_t)(v10 + 63) >> 6;
  v13 = result + 56;
  while (1)
  {
    if (v12)
    {
      v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v16 = v15 | (v8 << 6);
      goto LABEL_24;
    }
    v17 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v17 >= v31)
      goto LABEL_33;
    v18 = *(_QWORD *)(v30 + 8 * v17);
    ++v8;
    if (!v18)
    {
      v8 = v17 + 1;
      if (v17 + 1 >= v31)
        goto LABEL_33;
      v18 = *(_QWORD *)(v30 + 8 * v8);
      if (!v18)
      {
        v8 = v17 + 2;
        if (v17 + 2 >= v31)
          goto LABEL_33;
        v18 = *(_QWORD *)(v30 + 8 * v8);
        if (!v18)
          break;
      }
    }
LABEL_23:
    v12 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v8 << 6);
LABEL_24:
    v20 = *(_QWORD *)(v32 + 72);
    sub_243B50168(*(_QWORD *)(v5 + 48) + v20 * v16, (uint64_t)v4, &qword_2572ED090);
    sub_243BFE1A4();
    sub_243BFE1D4();
    result = sub_243BFE1E0();
    v21 = -1 << *(_BYTE *)(v7 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v13 + 8 * v23);
      }
      while (v27 == -1);
      v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    result = sub_243B6F9B4((uint64_t)v4, *(_QWORD *)(v7 + 48) + v14 * v20, &qword_2572ED090);
    ++*(_QWORD *)(v7 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v31)
  {
LABEL_33:
    result = swift_release();
    v1 = v29;
    goto LABEL_35;
  }
  v18 = *(_QWORD *)(v30 + 8 * v19);
  if (v18)
  {
    v8 = v19;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v8 >= v31)
      goto LABEL_33;
    v18 = *(_QWORD *)(v30 + 8 * v8);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_243BF7CC0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDA0);
  result = sub_243BFDE14();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v29 = v2 + 56;
  v6 = 1 << *(_BYTE *)(v2 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v30 = (unint64_t)(v6 + 63) >> 6;
  v9 = result + 56;
  while (1)
  {
    if (v8)
    {
      v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v13 = v12 | (v5 << 6);
      goto LABEL_24;
    }
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v30)
      goto LABEL_33;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_33;
      v15 = *(_QWORD *)(v29 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_33;
        v15 = *(_QWORD *)(v29 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v8 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v13);
    v18 = *v17;
    v19 = v17[1];
    v20 = v17[2];
    v21 = v17[3];
    sub_243BFE1A4();
    sub_243BFE1D4();
    result = sub_243BFE1E0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v10 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
      v10 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    v11 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v10);
    *v11 = v18;
    v11[1] = v19;
    v11[2] = v20;
    v11[3] = v21;
    ++*(_QWORD *)(v4 + 16);
    result = sub_243B924DC(v20, v21);
  }
  v16 = v14 + 3;
  if (v16 >= v30)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v29 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v30)
      goto LABEL_33;
    v15 = *(_QWORD *)(v29 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_243BF7F88()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE18);
  result = sub_243BFDE14();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v28 = (unint64_t)(v7 + 63) >> 6;
  v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v28)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v28)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v14);
    v19 = *v18;
    v20 = v18[1];
    sub_243BFE1A4();
    sub_243BFE1D4();
    result = sub_243BFE1E0();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v11);
    *v12 = v19;
    v12[1] = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_243BF8220()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED388);
  v3 = sub_243BFDE14();
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
      sub_243BFE1A4();
      sub_243BFD850();
      result = sub_243BFE1E0();
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

uint64_t sub_243BF84FC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  int64_t v31;
  _QWORD *v32;
  uint64_t v33;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v33 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE60);
  result = sub_243BFDE14();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v30 = v0;
    v8 = 0;
    v9 = *(_QWORD *)(v5 + 56);
    v32 = (_QWORD *)(v5 + 56);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & v9;
    v31 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 56;
    while (1)
    {
      if (v12)
      {
        v15 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v31)
          goto LABEL_33;
        v18 = v32[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v31)
            goto LABEL_33;
          v18 = v32[v8];
          if (!v18)
          {
            v8 = v17 + 2;
            if (v17 + 2 >= v31)
              goto LABEL_33;
            v18 = v32[v8];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v31)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v5 + 32);
                if (v28 > 63)
                  bzero(v32, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v28;
                v1 = v30;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v18 = v32[v19];
              if (!v18)
              {
                while (1)
                {
                  v8 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_39;
                  if (v8 >= v31)
                    goto LABEL_33;
                  v18 = v32[v8];
                  ++v19;
                  if (v18)
                    goto LABEL_23;
                }
              }
              v8 = v19;
            }
          }
        }
LABEL_23:
        v12 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_QWORD *)(v33 + 72);
      sub_243B6F9B4(*(_QWORD *)(v5 + 48) + v20 * v16, (uint64_t)v4, &qword_2572ED090);
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      v21 = -1 << *(_BYTE *)(v7 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v23);
        }
        while (v27 == -1);
        v14 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      result = sub_243B6F9B4((uint64_t)v4, *(_QWORD *)(v7 + 48) + v14 * v20, &qword_2572ED090);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_243BF883C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFDA0);
  result = sub_243BFDE14();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v32 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v31 = (unint64_t)(v6 + 63) >> 6;
    v9 = result + 56;
    while (1)
    {
      if (v8)
      {
        v12 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v13 = v12 | (v5 << 6);
      }
      else
      {
        v14 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v31)
          goto LABEL_33;
        v15 = v32[v14];
        ++v5;
        if (!v15)
        {
          v5 = v14 + 1;
          if (v14 + 1 >= v31)
            goto LABEL_33;
          v15 = v32[v5];
          if (!v15)
          {
            v5 = v14 + 2;
            if (v14 + 2 >= v31)
              goto LABEL_33;
            v15 = v32[v5];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v31)
              {
LABEL_33:
                v30 = 1 << *(_BYTE *)(v2 + 32);
                if (v30 > 63)
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v30;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v32[v16];
              if (!v15)
              {
                while (1)
                {
                  v5 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v5 >= v31)
                    goto LABEL_33;
                  v15 = v32[v5];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v5 = v16;
            }
          }
        }
LABEL_23:
        v8 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v5 << 6);
      }
      v17 = v2;
      v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v13);
      v20 = *v18;
      v19 = v18[1];
      v22 = v18[2];
      v21 = v18[3];
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      v23 = -1 << *(_BYTE *)(v4 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6))) != 0)
      {
        v10 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v9 + 8 * v25);
        }
        while (v29 == -1);
        v10 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v9 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
      v11 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v10);
      *v11 = v20;
      v11[1] = v19;
      v11[2] = v22;
      v11[3] = v21;
      ++*(_QWORD *)(v4 + 16);
      v2 = v17;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_243BF8B34()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE18);
  result = sub_243BFDE14();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v29 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v6 + 63) >> 6;
    v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9)
          goto LABEL_33;
        v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v9)
            goto LABEL_33;
          v16 = v29[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v9)
              goto LABEL_33;
            v16 = v29[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v28;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v9)
                    goto LABEL_33;
                  v16 = v29[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v8 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v14);
      v20 = *v18;
      v19 = v18[1];
      sub_243BFE1A4();
      sub_243BFE1D4();
      result = sub_243BFE1E0();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v11);
      *v12 = v20;
      v12[1] = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

void sub_243BF8E00(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = *v1 + 56;
  v8 = -1 << *(_BYTE *)(*v1 + 32);
  v9 = (a1 + 1) & ~v8;
  if (((1 << v9) & *(_QWORD *)(v7 + 8 * (v9 >> 6))) != 0)
  {
    v22 = v1;
    v10 = ~v8;
    swift_retain();
    v11 = sub_243BFDDCC();
    v24 = v7;
    if ((*(_QWORD *)(v7 + 8 * (v9 >> 6)) & (1 << v9)) != 0)
    {
      v12 = (v11 + 1) & v10;
      v13 = *(_QWORD *)(v3 + 72);
      while (1)
      {
        v14 = v13 * v9;
        sub_243B50168(*(_QWORD *)(v6 + 48) + v13 * v9, (uint64_t)v5, &qword_2572ED090);
        sub_243BFE1A4();
        sub_243BFE1D4();
        v15 = sub_243BFE1E0();
        sub_243B6F978((uint64_t)v5, &qword_2572ED090);
        v16 = v15 & v10;
        if ((uint64_t)a1 >= (uint64_t)v12)
          break;
        if (v16 < v12)
          goto LABEL_11;
LABEL_12:
        v17 = v13 * a1;
        if ((uint64_t)(v13 * a1) < v14 || *(_QWORD *)(v6 + 48) + v13 * a1 >= *(_QWORD *)(v6 + 48) + v14 + v13)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v9;
          if (v17 == v14)
            goto LABEL_6;
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v9;
LABEL_6:
        v9 = (v9 + 1) & v10;
        if (((*(_QWORD *)(v24 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          goto LABEL_16;
      }
      if (v16 < v12)
        goto LABEL_6;
LABEL_11:
      if ((uint64_t)a1 < (uint64_t)v16)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_16:
    *(_QWORD *)(v24 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    swift_release();
    v1 = v22;
  }
  else
  {
    *(_QWORD *)(v7 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v18 = *v1;
  v19 = *(_QWORD *)(*v1 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v18 + 16) = v21;
    ++*(_DWORD *)(v18 + 36);
  }
}

unint64_t sub_243BF904C(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_243BFDDCC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_243BFE1A4();
        sub_243BFE1D4();
        v11 = sub_243BFE1E0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 32 * v2);
          v14 = (_OWORD *)(v12 + 32 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 2))
          {
            v10 = v14[1];
            *v13 = *v14;
            v13[1] = v10;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_243BF91F8(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_243BFDDCC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_243BFE1A4();
        sub_243BFE1D4();
        v10 = sub_243BFE1E0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9)
            goto LABEL_5;
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(v3 + 48);
          v12 = (_OWORD *)(v11 + 16 * v2);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v12 >= v13 + 1))
          {
            *v12 = *v13;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v14 = *(_QWORD *)(v3 + 16);
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_243BF93A4@<X0>(uint64_t *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  _BOOL4 v18;
  _QWORD *v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
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
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t *v49;

  LODWORD(v48) = a2;
  v46 = a3;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED090);
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v7 = (uint64_t *)((char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v47 = v3;
  v8 = *v3;
  sub_243BFE1A4();
  v49 = a1;
  v9 = *a1;
  sub_243BFE1D4();
  v10 = sub_243BFE1E0();
  v11 = -1 << *(_BYTE *)(v8 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    v13 = ~v11;
    v14 = v5;
    v15 = *(_QWORD *)(v5 + 72);
    do
    {
      sub_243B50168(*(_QWORD *)(v8 + 48) + v15 * v12, (uint64_t)v7, &qword_2572ED090);
      v16 = *v7;
      sub_243B6F978((uint64_t)v7, &qword_2572ED090);
      v17 = v16 == v9;
      v18 = v16 == v9;
      if (v17)
        break;
      v12 = (v12 + 1) & v13;
    }
    while (((*(_QWORD *)(v8 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
  }
  else
  {
    v14 = v5;
    v18 = 0;
  }
  v19 = v47;
  v20 = *(_QWORD *)(*v47 + 16);
  v21 = !v18;
  v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(*v47 + 24);
  if (v23 >= v22 && (v48 & 1) != 0)
  {
    if (v18)
    {
LABEL_11:
      v24 = *(_QWORD *)(v14 + 72) * v12;
      v25 = v46;
LABEL_28:
      v41 = *v19;
      sub_243B6F9B4(*(_QWORD *)(*v19 + 48) + v24, v25, &qword_2572ED090);
      sub_243B6F9B4((uint64_t)v49, *(_QWORD *)(v41 + 48) + v24, &qword_2572ED090);
      v40 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v25, v40, 1, v45);
    }
    goto LABEL_16;
  }
  if ((v48 & 1) != 0)
  {
    sub_243BF84FC();
  }
  else
  {
    if (v23 >= v22)
    {
      sub_243BF7194();
      if (v18)
        goto LABEL_11;
LABEL_16:
      v26 = v12 >> 6;
      v27 = 1 << v12;
      v25 = v46;
LABEL_25:
      v36 = *v19;
      *(_QWORD *)(*v19 + 8 * v26 + 56) |= v27;
      sub_243B6F9B4((uint64_t)v49, *(_QWORD *)(v36 + 48) + *(_QWORD *)(v14 + 72) * v12, &qword_2572ED090);
      v37 = *(_QWORD *)(v36 + 16);
      v38 = __OFADD__(v37, 1);
      v39 = v37 + 1;
      if (!v38)
      {
        *(_QWORD *)(v36 + 16) = v39;
        v40 = 1;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v25, v40, 1, v45);
      }
      goto LABEL_31;
    }
    sub_243BF79B4();
  }
  v28 = *v19;
  sub_243BFE1A4();
  sub_243BFE1D4();
  v29 = sub_243BFE1E0();
  v30 = -1 << *(_BYTE *)(v28 + 32);
  v12 = v29 & ~v30;
  v48 = v28;
  v31 = v28 + 56;
  v26 = v12 >> 6;
  v27 = 1 << v12;
  if (((1 << v12) & *(_QWORD *)(v31 + 8 * (v12 >> 6))) != 0)
  {
    v32 = ~v30;
    v44 = v14;
    v33 = *(_QWORD *)(v14 + 72);
    while (1)
    {
      v24 = v33 * v12;
      sub_243B50168(*(_QWORD *)(v48 + 48) + v33 * v12, (uint64_t)v7, &qword_2572ED090);
      v34 = *v7;
      v35 = *v49;
      sub_243B6F978((uint64_t)v7, &qword_2572ED090);
      if (v34 == v35)
        break;
      v12 = (v12 + 1) & v32;
      v26 = v12 >> 6;
      v27 = 1 << v12;
      if ((*(_QWORD *)(v31 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
      {
        v25 = v46;
        v19 = v47;
        v14 = v44;
        if (!v18)
          goto LABEL_25;
        goto LABEL_32;
      }
    }
    v25 = v46;
    v19 = v47;
    v14 = v44;
    if (!v18)
      goto LABEL_32;
    goto LABEL_28;
  }
  v25 = v46;
  if (!v18)
    goto LABEL_25;
LABEL_32:
  result = sub_243BFE12C();
  __break(1u);
  return result;
}

uint64_t sub_243BF96F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t *v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;

  v12 = *v6;
  sub_243BFE1A4();
  sub_243BFE1D4();
  v13 = sub_243BFE1E0();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  v15 = v13 & ~v14;
  v16 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
    goto LABEL_9;
  v17 = *(_QWORD *)(v12 + 48);
  if (*(_QWORD *)(v17 + 32 * v15) == a1)
  {
    v18 = 0;
    v19 = 1;
    goto LABEL_10;
  }
  v20 = ~v14;
  v15 = (v15 + 1) & ~v14;
  if (((*(_QWORD *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
  {
    v18 = 1;
    while (1)
    {
      v21 = *(_QWORD *)(v17 + 32 * v15);
      v19 = v21 == a1;
      if (v21 == a1)
        break;
      v15 = (v15 + 1) & v20;
      if (((*(_QWORD *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
        goto LABEL_10;
    }
    v18 = 0;
  }
  else
  {
LABEL_9:
    v19 = 0;
    v18 = 1;
  }
LABEL_10:
  v22 = *(_QWORD *)(v12 + 16);
  result = v22 + v18;
  if (__OFADD__(v22, v18))
  {
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v24 = *(_QWORD *)(v12 + 24);
  if (v24 >= result && (a5 & 1) != 0)
  {
    if (!v19)
      goto LABEL_29;
    goto LABEL_27;
  }
  if ((a5 & 1) != 0)
  {
    sub_243BF883C();
  }
  else
  {
    if (v24 >= result)
    {
      result = (uint64_t)sub_243BF73BC();
      if (!v19)
      {
LABEL_29:
        v31 = *v6;
        *(_QWORD *)(*v6 + 8 * (v15 >> 6) + 56) |= 1 << v15;
        v32 = (_QWORD *)(*(_QWORD *)(v31 + 48) + 32 * v15);
        *v32 = a1;
        v32[1] = a2;
        v32[2] = a3;
        v32[3] = a4;
        v33 = *(_QWORD *)(v31 + 16);
        v34 = __OFADD__(v33, 1);
        v35 = v33 + 1;
        if (!v34)
        {
          *(_QWORD *)(v31 + 16) = v35;
          *(_OWORD *)a6 = xmmword_243C009F0;
          *(_QWORD *)(a6 + 16) = 0;
          *(_QWORD *)(a6 + 24) = 0;
          return result;
        }
        goto LABEL_33;
      }
LABEL_27:
      v29 = *(_QWORD *)(*v6 + 48) + 32 * v15;
      v30 = *(_OWORD *)(v29 + 16);
      *(_OWORD *)a6 = *(_OWORD *)v29;
      *(_OWORD *)(a6 + 16) = v30;
      *(_QWORD *)v29 = a1;
      *(_QWORD *)(v29 + 8) = a2;
      *(_QWORD *)(v29 + 16) = a3;
      *(_QWORD *)(v29 + 24) = a4;
      return result;
    }
    sub_243BF7CC0();
  }
  v25 = *v6;
  sub_243BFE1A4();
  sub_243BFE1D4();
  result = sub_243BFE1E0();
  v26 = -1 << *(_BYTE *)(v25 + 32);
  v15 = result & ~v26;
  if (((*(_QWORD *)(v25 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
    goto LABEL_28;
  v27 = *(_QWORD *)(v25 + 48);
  if (*(_QWORD *)(v27 + 32 * v15) != a1)
  {
    v28 = ~v26;
    while (1)
    {
      v15 = (v15 + 1) & v28;
      if (((*(_QWORD *)(v25 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
        break;
      if (*(_QWORD *)(v27 + 32 * v15) == a1)
        goto LABEL_26;
    }
LABEL_28:
    if (!v19)
      goto LABEL_29;
    goto LABEL_34;
  }
LABEL_26:
  if (v19)
    goto LABEL_27;
LABEL_34:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED060);
  result = sub_243BFE12C();
  __break(1u);
  return result;
}

uint64_t sub_243BF999C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
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
  uint64_t *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v7 = *v3;
  sub_243BFE1A4();
  sub_243BFE1D4();
  v8 = sub_243BFE1E0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  v11 = v7 + 56;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    goto LABEL_9;
  v12 = *(_QWORD *)(v7 + 48);
  if (*(_QWORD *)(v12 + 16 * v10) == a1)
  {
    v13 = 0;
    v14 = 1;
    goto LABEL_10;
  }
  v15 = ~v9;
  v10 = (v10 + 1) & ~v9;
  if (((*(_QWORD *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v13 = 1;
    while (1)
    {
      v16 = *(_QWORD *)(v12 + 16 * v10);
      v14 = v16 == a1;
      if (v16 == a1)
        break;
      v10 = (v10 + 1) & v15;
      if (((*(_QWORD *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_10;
    }
    v13 = 0;
  }
  else
  {
LABEL_9:
    v14 = 0;
    v13 = 1;
  }
LABEL_10:
  v17 = *(_QWORD *)(v7 + 16);
  v18 = v17 + v13;
  if (__OFADD__(v17, v13))
  {
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v19 = *(_QWORD *)(v7 + 24);
  if (v19 >= v18 && (a3 & 1) != 0)
  {
    if (!v14)
      goto LABEL_29;
    goto LABEL_27;
  }
  if ((a3 & 1) != 0)
  {
    sub_243BF8B34();
  }
  else
  {
    if (v19 >= v18)
    {
      sub_243BF7574();
      if (!v14)
      {
LABEL_29:
        v27 = *v3;
        *(_QWORD *)(*v3 + 8 * (v10 >> 6) + 56) |= 1 << v10;
        v28 = (uint64_t *)(*(_QWORD *)(v27 + 48) + 16 * v10);
        *v28 = a1;
        v28[1] = a2;
        v29 = *(_QWORD *)(v27 + 16);
        v30 = __OFADD__(v29, 1);
        v31 = v29 + 1;
        if (!v30)
        {
          result = 0;
          *(_QWORD *)(v27 + 16) = v31;
          return result;
        }
        goto LABEL_33;
      }
LABEL_27:
      v25 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      result = *v25;
      *v25 = a1;
      v25[1] = a2;
      return result;
    }
    sub_243BF7F88();
  }
  v20 = *v3;
  sub_243BFE1A4();
  sub_243BFE1D4();
  v21 = sub_243BFE1E0();
  v22 = -1 << *(_BYTE *)(v20 + 32);
  v10 = v21 & ~v22;
  if (((*(_QWORD *)(v20 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    goto LABEL_28;
  v23 = *(_QWORD *)(v20 + 48);
  if (*(_QWORD *)(v23 + 16 * v10) != a1)
  {
    v24 = ~v22;
    while (1)
    {
      v10 = (v10 + 1) & v24;
      if (((*(_QWORD *)(v20 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      if (*(_QWORD *)(v23 + 16 * v10) == a1)
        goto LABEL_26;
    }
LABEL_28:
    if (!v14)
      goto LABEL_29;
    goto LABEL_34;
  }
LABEL_26:
  if (v14)
    goto LABEL_27;
LABEL_34:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EFE10);
  result = sub_243BFE12C();
  __break(1u);
  return result;
}

void *sub_243BF9C14()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  uint64_t v9;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v1 = v0;
  v2 = type metadata accessor for StoredPhotoLayout(0);
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572EBA30);
  v5 = *v0;
  v6 = sub_243BFDFC4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_26:
    *v1 = v7;
    return result;
  }
  v25 = v1;
  result = (void *)(v6 + 64);
  v9 = v5 + 64;
  v10 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v5 + 64), 8 * v10);
  v12 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v13 = 1 << *(_BYTE *)(v5 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v5 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v12++, 1))
      goto LABEL_28;
    if (v12 >= v16)
    {
LABEL_24:
      result = (void *)swift_release();
      v1 = v25;
      goto LABEL_26;
    }
    v23 = *(_QWORD *)(v9 + 8 * v12);
    if (!v23)
      break;
LABEL_23:
    v15 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v12 << 6);
LABEL_12:
    v19 = 8 * v18;
    v20 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v18);
    v21 = *(_QWORD *)(v26 + 72) * v18;
    sub_243B6F8F0(*(_QWORD *)(v5 + 56) + v21, (uint64_t)v4, type metadata accessor for StoredPhotoLayout);
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v20;
    result = (void *)sub_243B501AC((uint64_t)v4, *(_QWORD *)(v7 + 56) + v21);
  }
  v24 = v12 + 1;
  if (v12 + 1 >= v16)
    goto LABEL_24;
  v23 = *(_QWORD *)(v9 + 8 * v24);
  if (v23)
  {
    ++v12;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v12 >= v16)
      goto LABEL_24;
    v23 = *(_QWORD *)(v9 + 8 * v12);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void *sub_243BF9E18()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2572EBA18);
  v2 = *v0;
  v3 = sub_243BFDFC4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_243BF9FCC()
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572ED108);
  v2 = *v0;
  v3 = sub_243BFDFC4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_243BFA16C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  v26 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA08);
  v5 = *v0;
  v6 = sub_243BFDFC4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_25:
    *v1 = v7;
    return result;
  }
  v24 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v10 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v11 = 1 << *(_BYTE *)(v5 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v5 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v14)
      goto LABEL_23;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v10;
    if (!v21)
    {
      v10 = v20 + 1;
      if (v20 + 1 >= v14)
        goto LABEL_23;
      v21 = *(_QWORD *)(v25 + 8 * v10);
      if (!v21)
        break;
    }
LABEL_22:
    v13 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_9:
    v17 = 4 * v16;
    v18 = *(_DWORD *)(*(_QWORD *)(v5 + 48) + 4 * v16);
    v19 = *(_QWORD *)(v26 + 72) * v16;
    sub_243B50168(*(_QWORD *)(v5 + 56) + v19, (uint64_t)v4, &qword_2572EBA10);
    *(_DWORD *)(*(_QWORD *)(v7 + 48) + v17) = v18;
    result = (void *)sub_243B6F9B4((uint64_t)v4, *(_QWORD *)(v7 + 56) + v19, &qword_2572EBA10);
  }
  v22 = v20 + 2;
  if (v22 >= v14)
  {
LABEL_23:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_25;
  }
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v10 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v10 >= v14)
      goto LABEL_23;
    v21 = *(_QWORD *)(v25 + 8 * v10);
    ++v22;
    if (v21)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_243BFA3A0()
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
  __int128 v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE480);
  v2 = *v0;
  v3 = sub_243BFDFC4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15) = v16;
    result = (void *)swift_retain();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
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
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_243BFA544(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_243BFDDCC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_DWORD *)(v9 + 4 * v6);
        result = MEMORY[0x24950253C](*(_QWORD *)(a2 + 40), *v10, 4);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_DWORD *)(v9 + 4 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_243BFA714(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 80) = a2;
  *(_QWORD *)(v5 + 88) = a5;
  *(_OWORD *)(v5 + 96) = *a4;
  return swift_task_switch();
}

uint64_t sub_243BFA734()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  v2 = v0[12];
  v1 = v0[13];
  v4 = (os_unfair_lock_s *)v0[10];
  v3 = v0[11];
  v0[2] = v0;
  v0[3] = sub_243B69494;
  v5 = swift_continuation_init();
  sub_243BFB054(v5, v4, v2, v1, v3);
  return swift_continuation_await();
}

uint64_t sub_243BFA7A4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return sub_243BFA7B8(a1, a2, a3, a4);
}

uint64_t sub_243BFA7B8(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(_QWORD *)(a3 + 16) <= a4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v5 = (_QWORD *)result;
  sub_243BFE1A4();
  sub_243BFE1D4();
  result = sub_243BFE1E0();
  v6 = 1 << *v5;
  v7 = __OFSUB__(v6, 1);
  v8 = v6 - 1;
  if (v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v9 = v8 & result;
  result = sub_243BFD2C8();
  v12 = v9;
  v13 = result;
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  while (1)
  {
    v10 = sub_243BFD2EC();
    if ((v11 & 1) == 0 && v10 == a4)
      return v9;
    sub_243BFD304();
    v9 = v12;
    result = v13;
    if (!v13)
      goto LABEL_13;
  }
}

void sub_243BFA8D0(void *a1, os_unfair_lock_s *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  uint64_t j;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD50);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  v8 = sub_243BE8E88(a1);
  v10 = v9;
  os_unfair_lock_unlock(v7);
  if (v8)
  {
    v11 = *(_QWORD *)(v8 + 16);
    if (v11)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)(v8 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      if (a1)
        goto LABEL_8;
    }
    else
    {
      swift_bridgeObjectRetain();
      if (a1)
      {
LABEL_8:
        v13 = *(_QWORD *)(v10 + 16);
        if (v13)
        {
          swift_bridgeObjectRetain();
          v14 = a1;
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)(v10 + 8 * j + 32))
            {
              v27 = a1;
              v19 = a1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
              v20 = sub_243BFE0CC();
              if (v20)
              {
                v16 = v20;

              }
              else
              {
                v16 = swift_allocError();
                *v17 = v27;
              }
              swift_allocError();
              *v18 = v16;
              swift_continuation_throwingResumeWithError();
            }
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          v25 = a1;
        }
        sub_243B6A1DC(v8);

LABEL_26:
        swift_bridgeObjectRelease();
        return;
      }
    }
    v21 = *(_QWORD *)(v10 + 16);
    if (!v21)
    {
      sub_243B6A1DC(v8);
      swift_bridgeObjectRelease();
      return;
    }
    swift_bridgeObjectRetain();
    for (k = 0; k != v21; ++k)
    {
      v23 = *(_QWORD *)(v10 + 8 * k + 32);
      if (v23)
      {
        v24 = type metadata accessor for StoredPhoto(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v6, 1, 1, v24);
        sub_243B6F9B4((uint64_t)v6, *(_QWORD *)(*(_QWORD *)(v23 + 64) + 40), &qword_2572EDD50);
        swift_continuation_throwingResume();
      }
    }
    swift_bridgeObjectRelease();
    sub_243B6A1DC(v8);
    goto LABEL_26;
  }
}

void sub_243BFAB94(void *a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t j;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  uint64_t v19;
  id v20;
  __int128 v21;

  v3 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  v4 = sub_243BE916C(a1);
  v6 = v5;
  os_unfair_lock_unlock(v3);
  if (v4)
  {
    v7 = *(_QWORD *)(v4 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)(v4 + 8 * i + 32))
          swift_continuation_throwingResume();
      }
      swift_bridgeObjectRelease();
      if (a1)
        goto LABEL_8;
    }
    else
    {
      swift_bridgeObjectRetain();
      if (a1)
      {
LABEL_8:
        v9 = *(_QWORD *)(v6 + 16);
        if (v9)
        {
          swift_bridgeObjectRetain();
          v10 = a1;
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)(v6 + 8 * j + 32))
            {
              *(_QWORD *)&v21 = a1;
              v15 = a1;
              __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
              v16 = sub_243BFE0CC();
              if (v16)
              {
                v12 = v16;

              }
              else
              {
                v12 = swift_allocError();
                *v13 = v21;
              }
              swift_allocError();
              *v14 = v12;
              swift_continuation_throwingResumeWithError();
            }
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          v20 = a1;
        }
        sub_243B6A1DC(v4);

LABEL_26:
        swift_bridgeObjectRelease();
        return;
      }
    }
    v17 = *(_QWORD *)(v6 + 16);
    if (!v17)
    {
      sub_243B6A1DC(v4);
      swift_bridgeObjectRelease();
      return;
    }
    swift_bridgeObjectRetain();
    for (k = 0; k != v17; ++k)
    {
      v19 = *(_QWORD *)(v6 + 8 * k + 32);
      if (v19)
      {
        v21 = xmmword_243C00A50;
        sub_243B6F9B4((uint64_t)&v21, *(_QWORD *)(*(_QWORD *)(v19 + 64) + 40), &qword_2572EFC08);
        swift_continuation_throwingResume();
      }
    }
    swift_bridgeObjectRelease();
    sub_243B6A1DC(v4);
    goto LABEL_26;
  }
}

uint64_t sub_243BFAE0C(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  if ((a4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(_QWORD *)(a3 + 16) <= a4)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v5 = (_QWORD *)result;
  sub_243BFE1A4();
  sub_243BFE1D4();
  result = sub_243BFE1E0();
  v6 = 1 << *v5;
  v7 = __OFSUB__(v6, 1);
  v8 = v6 - 1;
  if (v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v9 = v8 & result;
  result = sub_243BFD2C8();
  v12 = v9;
  v13 = result;
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  while (1)
  {
    v10 = sub_243BFD2EC();
    if ((v11 & 1) == 0 && v10 == a4)
      return v9;
    sub_243BFD304();
    v9 = v12;
    result = v13;
    if (!v13)
      goto LABEL_13;
  }
}

void sub_243BFAF24(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572EDD50);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  os_unfair_lock_lock(a2);
  v11 = sub_243BE7D8C(a1, a3, a4);
  os_unfair_lock_unlock(a2);
  if (v11 == 1)
  {
    swift_continuation_throwingResume();
  }
  else if (v11 != 2)
  {
    swift_continuation_throwingResume();
    if (v11)
    {
      sub_243B6F8F0(a3, (uint64_t)v10, type metadata accessor for StoredPhoto);
      v12 = type metadata accessor for StoredPhoto(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
      sub_243B6F9B4((uint64_t)v10, *(_QWORD *)(*(_QWORD *)(v11 + 64) + 40), &qword_2572EDD50);
      swift_continuation_throwingResume();
    }
  }
}

void sub_243BFB054(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  os_unfair_lock_s *v9;
  uint64_t v10;
  _QWORD v11[2];

  v9 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  v10 = sub_243BE84CC(a1, a3, a4, a5);
  os_unfair_lock_unlock(v9);
  if (v10 == 1)
  {
    swift_continuation_throwingResume();
  }
  else if (v10 != 2)
  {
    swift_continuation_throwingResume();
    if (v10)
    {
      v11[0] = a3;
      v11[1] = a4;
      sub_243B7FBDC(a3, a4);
      sub_243B6F9B4((uint64_t)v11, *(_QWORD *)(*(_QWORD *)(v10 + 64) + 40), &qword_2572EFC08);
      swift_continuation_throwingResume();
    }
  }
}

void sub_243BFB12C(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  os_unfair_lock_s *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;

  v5 = a2 + 16;
  os_unfair_lock_lock(a2 + 16);
  sub_243BE953C(a1, a3, (uint64_t)&v12);
  os_unfair_lock_unlock(v5);
  v7 = v12;
  v6 = v13;
  v8 = v14;
  if (v15 > 1u)
  {
    if (v15 == 2)
    {
      if (v12)
      {
        sub_243BFBC2C(v12, v13, v14, 2);
        swift_continuation_throwingResume();
      }
      else
      {
        sub_243BFBC2C(0, v13, v14, 2);
      }
      v10 = v6;
      v11 = v8;
      sub_243B6F9B4((uint64_t)&v10, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40), &qword_2572EFC08);
      swift_continuation_throwingResume();
      sub_243BFBC5C(v7, v6, v8, 2);
    }
  }
  else if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543CE498);
    swift_allocError();
    *v9 = v7;
    sub_243BFBC2C(v7, v6, v8, 1);
    swift_continuation_throwingResumeWithError();
    sub_243BFBC5C(v12, v13, v14, v15);
  }
  else
  {
    v10 = (uint64_t)v12;
    v11 = v13;
    sub_243B6F9B4((uint64_t)&v10, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 40), &qword_2572EFC08);
    swift_continuation_throwingResume();
  }
}

uint64_t sub_243BFB2B0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_243BFB2D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BFB2F8(uint64_t a1)
{
  uint64_t *v1;

  return sub_243BEF544(a1, v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_243BFB308()
{
  return 4;
}

uint64_t sub_243BFB310()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BFB334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  sub_243B7FCC0(*(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8));
  return swift_deallocObject();
}

void sub_243BFB3C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v6 = *(_QWORD *)(*(_QWORD *)(v2 + 16) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v2 + 56);
  v9 = v2 + v7;
  v10 = (uint64_t *)(v2 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  v11 = *v10;
  v12 = v10[1];
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v13;
  *v13 = v3;
  v13[1] = sub_243B6A428;
  sub_243BEFE84(a1, a2, v8, v9, v11, v12);
}

uint64_t sub_243BFB468()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BFB49C()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for XPCMessageCenter()
{
  JUMPOUT(0x249502AF4);
}

uint64_t method lookup function for XPCMessageCenter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCMessageCenter.__allocating_init(serviceName:client:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of XPCMessageCenter.activate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of XPCMessageCenter.registerData(request:callback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of XPCMessageCenter.sendData(request:data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 296)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 296));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_243B6A428;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_243BFB5D0()
{
  return sub_243B9A6CC(&qword_2572EDD40, &qword_2572EDD38, (uint64_t)&protocol conformance descriptor for AsyncThrowingChannel<A, B>);
}

uint64_t storeEnumTagSinglePayload for XPCError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_243BFB648 + 4 * byte_243C045E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_243BFB67C + 4 * byte_243C045E0[v4]))();
}

uint64_t sub_243BFB67C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFB684(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x243BFB68CLL);
  return result;
}

uint64_t sub_243BFB698(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x243BFB6A0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_243BFB6A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFB6AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

unint64_t sub_243BFB6CC()
{
  unint64_t result;

  result = qword_2572EFD70;
  if (!qword_2572EFD70)
  {
    result = MEMORY[0x249502B6C](&unk_243C0470C, &type metadata for XPCError);
    atomic_store(result, &qword_2572EFD70);
  }
  return result;
}

void type metadata accessor for XPCMessageCenter.XPCRequest()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCErrorResponse()
{
  JUMPOUT(0x249502AF4);
}

uint64_t sub_243BFB728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_243BFD688();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 84) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_243BFB7A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_243BFD688() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD **)(v1 + 72);
  v8 = *(_DWORD *)(v1 + 80);
  v9 = v1 + ((v4 + 84) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_243B4D7A0;
  return sub_243BF2B3C(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_243BFB840()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((*(_QWORD *)(v2 + 64) + v3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 11) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);
  swift_release();
  sub_243B7FCC0(*(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BFB91C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v7 = (v6 + 11) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = *(_DWORD *)(v1 + v6);
  v13 = *(uint64_t **)(v1 + v7);
  v14 = *(_QWORD *)(v1 + v8);
  v15 = *(_QWORD *)(v1 + v8 + 8);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_243B6A428;
  return sub_243BF1420(a1, v9, v10, v11, v12, v13, v14, v15);
}

void type metadata accessor for XPCMessageCenter.XPCResponse()
{
  JUMPOUT(0x249502AF4);
}

uint64_t sub_243BFBA2C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_243BFBA3C()
{
  uint64_t v0;

  sub_243BE9AC0(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), sub_243BE8CCC);
}

uint64_t sub_243BFBA60(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t result;

  if (a2 != 1)
    return sub_243B924F0(a3, a4);
  return result;
}

uint64_t sub_243BFBA78()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_243BFBAA4(uint64_t a1)
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
  v9[1] = sub_243B6A428;
  return sub_243BEB758(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_243BFBB24()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EBA10);
  return sub_243BFDEF8() & 1;
}

id sub_243BFBB74(id a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)sub_243B924DC((uint64_t)a1, a2);
}

void sub_243BFBB80(id a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    sub_243B924F0((uint64_t)a1, a2);
}

void sub_243BFBB8C(uint64_t a1, void *a2, unint64_t a3, char a4)
{
  if (a1 != 1)
    sub_243BFBB80(a2, a3, a4 & 1);
}

uint64_t sub_243BFBBAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_243B4D7A0;
  v6[13] = v4;
  v6[14] = v5;
  v6[12] = a1;
  return swift_task_switch();
}

void sub_243BFBC20()
{
  uint64_t v0;

  sub_243BE9C0C(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

id sub_243BFBC2C(id result, uint64_t a2, unint64_t a3, char a4)
{
  switch(a4)
  {
    case 2:
      return (id)sub_243B924DC(a2, a3);
    case 1:
      return result;
    case 0:
      return (id)sub_243B924DC((uint64_t)result, a2);
  }
  return result;
}

void sub_243BFBC5C(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  if (a4 != -1)
    sub_243BFBC70(a1, a2, a3, a4);
}

void sub_243BFBC70(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  switch(a4)
  {
    case 2:
      sub_243B924F0(a2, a3);
      break;
    case 1:

      break;
    case 0:
      sub_243B924F0((uint64_t)a1, a2);
      break;
  }
}

void sub_243BFBCA0()
{
  sub_243BF093C();
}

void sub_243BFBCB4()
{
  type metadata accessor for XPCMessageCenter.XPCResponse();
}

uint64_t sub_243BFBCE4()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543CE498);
  v1 = sub_243BFDA18();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_243BFBD5C()
{
  type metadata accessor for XPCMessageCenter.XPCResponse();
}

void sub_243BFBDA0()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2543CE498);
  sub_243BFDA18();
  sub_243BF0AFC(v0);
}

double sub_243BFBE10@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _OWORD *v2;
  __int128 v4;
  double result;
  _OWORD v6[4];
  uint64_t v7;

  v4 = v2[2];
  v6[1] = v2[1];
  v6[2] = v4;
  v6[3] = v2[3];
  v7 = a1;
  sub_243BE9EC0((void (*)(uint64_t *__return_ptr))sub_243BFBE70, (uint64_t)v6);
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_243BFBE70@<X0>(_BYTE *a1@<X8>)
{
  return sub_243BEF8D8(a1);
}

uint64_t sub_243BFBE94()
{
  return swift_deallocObject();
}

uint64_t sub_243BFBEA4()
{
  return swift_deallocObject();
}

uint64_t sub_243BFBEB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v4 = v0[4];
  v3 = v0[5];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_243B6A428;
  v5[11] = v4;
  v5[12] = v3;
  v5[10] = v2;
  return swift_task_switch();
}

void sub_243BFBF24()
{
  uint64_t v0;

  sub_243BE9AC0(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), sub_243BE87A4);
}

uint64_t sub_243BFBF4C(uint64_t a1)
{
  return sub_243BE6C44(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_243BFBF5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_243BE6D14(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_243BFBFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_243BE6D14(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_243BE6C44(v6, v7, v8);
  return a1;
}

uint64_t sub_243BFBFF8(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_243BE6C44(v4, v5, v6);
  return a1;
}

uint64_t sub_243BFC03C(uint64_t a1, unsigned int a2)
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

uint64_t sub_243BFC084(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_243BFC0C8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_243BFC0E0(uint64_t result, unsigned int a2)
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

uint64_t sub_243BFC0F8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_243BFC100()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[4] = v2;
    v2[5] = MEMORY[0x24BEE0170] + 64;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_243BFC19C(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v10;
  unsigned int v11;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 4;
  else
    v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *(_DWORD *)(v5 + 80);
  if ((v8 & 0x1000F8) != 0 || (v7 | 1) > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    v11 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v11 >= 2)
      v11 = *(_DWORD *)a2 + 2;
    if (v11 == 1)
    {
      *(_DWORD *)a1 = *(_DWORD *)a2;
      *((_BYTE *)a1 + v7) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      v13 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v14 = (uint64_t *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v15 = *v14;
      v16 = v14[1];
      sub_243B7FBDC(*v14, v16);
      *v13 = v15;
      v13[1] = v16;
      *((_BYTE *)a1 + v7) = 0;
    }
  }
  return a1;
}

uint64_t sub_243BFC2C8(_DWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;

  result = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(result - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = 4;
  if (((v4 + 7) & 0xFFFFFFFFFFFFFFF8) != 0xFFFFFFFFFFFFFFF0)
    v5 = ((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v6 = *((unsigned __int8 *)a1 + v5);
  v7 = v5 & 0xFFFFFFFC;
  if (v6 >= 2 && v7 != 0)
    v6 = *a1 + 2;
  if (v6 != 1)
  {
    (*(void (**)(_DWORD *, uint64_t))(v3 + 8))(a1, result);
    return sub_243B7FCC0(*(_QWORD *)(((unint64_t)a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)((((unint64_t)a1 + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
  }
  return result;
}

_DWORD *sub_243BFC374(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  char v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 4;
  else
    v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    *a1 = *a2;
    v10 = 1;
  }
  else
  {
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    v11 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v12 = (uint64_t *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    v13 = *v12;
    v14 = v12[1];
    sub_243B7FBDC(*v12, v14);
    v10 = 0;
    *v11 = v13;
    v11[1] = v14;
  }
  *((_BYTE *)a1 + v7) = v10;
  return a1;
}

_DWORD *sub_243BFC460(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v10;
  char v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
      v7 = 4;
    else
      v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0)
      v8 = *a1 + 2;
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      sub_243B7FCC0(*(_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
    }
    v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v10 >= 2)
      v10 = *a2 + 2;
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      v13 = (_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v14 = (uint64_t *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      v15 = *v14;
      v16 = v14[1];
      sub_243B7FBDC(*v14, v16);
      v12 = 0;
      *v13 = v15;
      v13[1] = v16;
    }
    *((_BYTE *)a1 + v7) = v12;
  }
  return a1;
}

_DWORD *sub_243BFC5A4(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  char v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 4;
  else
    v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0)
    v8 = *a2 + 2;
  if (v8 == 1)
  {
    *a1 = *a2;
    v10 = 1;
  }
  else
  {
    (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    v10 = 0;
    *(_OWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
  }
  *((_BYTE *)a1 + v7) = v10;
  return a1;
}

_DWORD *sub_243BFC67C(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v10;
  char v12;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    if (((v6 + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
      v7 = 4;
    else
      v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFFC) != 0)
      v8 = *a1 + 2;
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      sub_243B7FCC0(*(_QWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8), *(_QWORD *)((((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
    }
    v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFFC) != 0 && v10 >= 2)
      v10 = *a2 + 2;
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      v12 = 0;
      *(_OWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    }
    *((_BYTE *)a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_243BFC7B4(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v5;
  uint64_t v6;
  char v7;
  unsigned int v8;
  int v9;
  int v11;
  int v12;
  unsigned int v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v5 = 4;
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_20;
  v6 = v5 | 1;
  v7 = 8 * (v5 | 1);
  if ((v5 | 1) <= 3)
  {
    v8 = (a2 + ~(-1 << v7) - 254) >> v7;
    if (v8 > 0xFFFE)
    {
      v9 = *(_DWORD *)&a1[v6];
      if (!v9)
        goto LABEL_20;
      goto LABEL_13;
    }
    if (v8 > 0xFE)
    {
      v9 = *(unsigned __int16 *)&a1[v6];
      if (!*(_WORD *)&a1[v6])
        goto LABEL_20;
      goto LABEL_13;
    }
    if (!v8)
      goto LABEL_20;
  }
  v9 = a1[v6];
  if (!a1[v6])
  {
LABEL_20:
    v13 = a1[v5];
    if (v13 >= 2)
      return (v13 ^ 0xFF) + 1;
    else
      return 0;
  }
LABEL_13:
  v11 = (v9 - 1) << v7;
  if (v6 >= 4)
    v11 = 0;
  if ((_DWORD)v6 == 1)
    v12 = *a1;
  else
    v12 = *(_DWORD *)a1;
  return (v12 | v11) + 255;
}

void sub_243BFC8C0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v7 = 4;
  v8 = v7 | 1;
  if (a3 < 0xFF)
  {
    v9 = 0;
  }
  else if (v8 <= 3)
  {
    v11 = (a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8);
    if (v11 > 0xFFFE)
    {
      v9 = 4u;
    }
    else if (v11 >= 0xFF)
    {
      v9 = 2;
    }
    else
    {
      v9 = v11 != 0;
    }
  }
  else
  {
    v9 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v10 = a2 - 255;
  if (v8 < 4)
  {
    v10 &= ~(-1 << (8 * v8));
    bzero(a1, v8);
    if ((_DWORD)v8 == 1)
    {
      *a1 = v10;
      goto LABEL_18;
    }
  }
  else
  {
    bzero(a1, v7 | 1);
  }
  *(_DWORD *)a1 = v10;
LABEL_18:
  __asm { BR              X10 }
}

uint64_t sub_243BFCA74(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v3 = 4;
  result = *((unsigned __int8 *)a1 + v3);
  v5 = v3 & 0xFFFFFFFC;
  if (result >= 2 && v5 != 0)
    return (*a1 + 2);
  return result;
}

void sub_243BFCAEC(unsigned int *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  size_t v5;
  char v6;
  unsigned int v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0)
    v5 = 4;
  else
    v5 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
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
    *((_BYTE *)a1 + v5) = v6;
    bzero(a1, v5);
    *a1 = v7;
  }
  else
  {
    *((_BYTE *)a1 + v5) = a2;
  }
}

void type metadata accessor for XPCMessageCenter.XPCRequest.FetchNextCodingKeys()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCRequest.StartRequestCodingKeys()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCRequest.CodingKeys()
{
  JUMPOUT(0x249502AF4);
}

unint64_t sub_243BFCBA0()
{
  unint64_t result;

  result = qword_2572F0008;
  if (!qword_2572F0008)
  {
    result = MEMORY[0x249502B6C](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2572F0008);
  }
  return result;
}

void type metadata accessor for XPCMessageCenter.XPCErrorResponse.CodingKeys()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCResponse.EndErrorCodingKeys()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCResponse.EndSuccessCodingKeys()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCResponse.NextCodingKeys()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCResponse.StartStreamCodingKeys()
{
  JUMPOUT(0x249502AF4);
}

void type metadata accessor for XPCMessageCenter.XPCResponse.CodingKeys()
{
  JUMPOUT(0x249502AF4);
}

unint64_t sub_243BFCC2C()
{
  unint64_t result;

  result = qword_2572F0010[0];
  if (!qword_2572F0010[0])
  {
    result = MEMORY[0x249502B6C](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, qword_2572F0010);
  }
  return result;
}

uint64_t sub_243BFCC70(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_243BFCCBC + 4 * byte_243C045F9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_243BFCCF0 + 4 * byte_243C045F4[v4]))();
}

uint64_t sub_243BFCCF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFCCF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x243BFCD00);
  return result;
}

uint64_t sub_243BFCD0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x243BFCD14);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_243BFCD18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFCD20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFCD38()
{
  return 0;
}

uint64_t sub_243BFCD48(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_243BFCD94 + 4 * byte_243C04603[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_243BFCDC8 + 4 * byte_243C045FE[v4]))();
}

uint64_t sub_243BFCDC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFCDD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x243BFCDD8);
  return result;
}

uint64_t sub_243BFCDE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x243BFCDECLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_243BFCDF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFCDF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243BFCE04(unsigned int *a1, int a2)
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

uint64_t sub_243BFCE54(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_243BFCE94 + 4 * byte_243C04608[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_243BFCEB4 + 4 * byte_243C0460D[v4]))();
}

_BYTE *sub_243BFCE94(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_243BFCEB4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_243BFCEBC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_243BFCEC4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_243BFCECC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_243BFCED4(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_243BFCEE0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCEF0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF00()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF10()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF20()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF30()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF40()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF50()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF60()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF70()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF80()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCF90()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCFA0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCFB0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCFC0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCFD0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCFE0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFCFF0()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD000()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD010()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD020()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD030()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD040()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD050()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD060()
{
  JUMPOUT(0x249502B6CLL);
}

void sub_243BFD070()
{
  JUMPOUT(0x249502B6CLL);
}

uint64_t sub_243BFD0A0()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_243BFD0AC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_243BFD0B8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_243BFD0C4()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_243BFD0D0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_243BFD0DC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_243BFD0E8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_243BFD0F4()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_243BFD100()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_243BFD10C()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_243BFD118()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_243BFD124()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_243BFD130()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_243BFD13C()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_243BFD148()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_243BFD154()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_243BFD160()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_243BFD16C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_243BFD178()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_243BFD184()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_243BFD190()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_243BFD19C()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_243BFD1A8()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_243BFD1B4()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_243BFD1C0()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_243BFD1CC()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_243BFD1D8()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_243BFD1E4()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_243BFD1F0()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_243BFD1FC()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_243BFD208()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_243BFD214()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_243BFD220()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_243BFD22C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_243BFD238()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_243BFD244()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_243BFD250()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_243BFD25C()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_243BFD268()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_243BFD274()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_243BFD280()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_243BFD28C()
{
  return MEMORY[0x24BE18AF8]();
}

uint64_t sub_243BFD298()
{
  return MEMORY[0x24BE18B08]();
}

uint64_t sub_243BFD2A4()
{
  return MEMORY[0x24BE18B20]();
}

uint64_t sub_243BFD2B0()
{
  return MEMORY[0x24BE18B28]();
}

uint64_t sub_243BFD2BC()
{
  return MEMORY[0x24BE18B58]();
}

uint64_t sub_243BFD2C8()
{
  return MEMORY[0x24BE18B90]();
}

uint64_t sub_243BFD2D4()
{
  return MEMORY[0x24BE18B98]();
}

uint64_t sub_243BFD2E0()
{
  return MEMORY[0x24BE18BA0]();
}

uint64_t sub_243BFD2EC()
{
  return MEMORY[0x24BE18BA8]();
}

uint64_t sub_243BFD2F8()
{
  return MEMORY[0x24BE18BB0]();
}

uint64_t sub_243BFD304()
{
  return MEMORY[0x24BE18BB8]();
}

uint64_t sub_243BFD310()
{
  return MEMORY[0x24BE18BC0]();
}

uint64_t sub_243BFD31C()
{
  return MEMORY[0x24BE18BC8]();
}

uint64_t sub_243BFD328()
{
  return MEMORY[0x24BE18BD0]();
}

uint64_t sub_243BFD334()
{
  return MEMORY[0x24BE18BD8]();
}

uint64_t sub_243BFD340()
{
  return MEMORY[0x24BE18BE0]();
}

uint64_t sub_243BFD34C()
{
  return MEMORY[0x24BE18D20]();
}

uint64_t sub_243BFD358()
{
  return MEMORY[0x24BE18D30]();
}

uint64_t sub_243BFD364()
{
  return MEMORY[0x24BE18D48]();
}

uint64_t sub_243BFD370()
{
  return MEMORY[0x24BE18D58]();
}

uint64_t sub_243BFD37C()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_243BFD388()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_243BFD394()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_243BFD3A0()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_243BFD3AC()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_243BFD3B8()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_243BFD3C4()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_243BFD3D0()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_243BFD3DC()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_243BFD3E8()
{
  return MEMORY[0x24BE5C060]();
}

uint64_t sub_243BFD3F4()
{
  return MEMORY[0x24BE5C068]();
}

uint64_t sub_243BFD400()
{
  return MEMORY[0x24BE5C078]();
}

uint64_t sub_243BFD40C()
{
  return MEMORY[0x24BE5C080]();
}

uint64_t sub_243BFD418()
{
  return MEMORY[0x24BE5C0A8]();
}

uint64_t sub_243BFD424()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_243BFD430()
{
  return MEMORY[0x24BE5C108]();
}

uint64_t sub_243BFD43C()
{
  return MEMORY[0x24BE5C118]();
}

uint64_t sub_243BFD448()
{
  return MEMORY[0x24BE5C120]();
}

uint64_t sub_243BFD454()
{
  return MEMORY[0x24BE5C128]();
}

uint64_t sub_243BFD460()
{
  return MEMORY[0x24BE5C130]();
}

uint64_t sub_243BFD46C()
{
  return MEMORY[0x24BE5C138]();
}

uint64_t sub_243BFD478()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_243BFD484()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_243BFD490()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_243BFD49C()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_243BFD4A8()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_243BFD4B4()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_243BFD4C0()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_243BFD4CC()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_243BFD4D8()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_243BFD4E4()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_243BFD4F0()
{
  return MEMORY[0x24BE5C280]();
}

uint64_t sub_243BFD4FC()
{
  return MEMORY[0x24BE5C298]();
}

uint64_t sub_243BFD508()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_243BFD514()
{
  return MEMORY[0x24BE5C2D8]();
}

uint64_t sub_243BFD520()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_243BFD52C()
{
  return MEMORY[0x24BE5C2F0]();
}

uint64_t sub_243BFD538()
{
  return MEMORY[0x24BE5C2F8]();
}

uint64_t sub_243BFD544()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_243BFD550()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_243BFD55C()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_243BFD568()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_243BFD574()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_243BFD580()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_243BFD58C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_243BFD598()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_243BFD5A4()
{
  return MEMORY[0x24BEE6440]();
}

uint64_t sub_243BFD5B0()
{
  return MEMORY[0x24BEE64A8]();
}

uint64_t sub_243BFD5BC()
{
  return MEMORY[0x24BEE64E8]();
}

uint64_t sub_243BFD5C8()
{
  return MEMORY[0x24BEE6520]();
}

uint64_t sub_243BFD5D4()
{
  return MEMORY[0x24BEE6530]();
}

uint64_t sub_243BFD5E0()
{
  return MEMORY[0x24BEE6568]();
}

uint64_t sub_243BFD5EC()
{
  return MEMORY[0x24BEE6578]();
}

uint64_t sub_243BFD5F8()
{
  return MEMORY[0x24BEE65A8]();
}

uint64_t sub_243BFD604()
{
  return MEMORY[0x24BEE65E8]();
}

uint64_t sub_243BFD610()
{
  return MEMORY[0x24BEE65F0]();
}

uint64_t sub_243BFD61C()
{
  return MEMORY[0x24BEE6608]();
}

uint64_t sub_243BFD628()
{
  return MEMORY[0x24BEE6610]();
}

uint64_t sub_243BFD634()
{
  return MEMORY[0x24BEE6620]();
}

uint64_t sub_243BFD640()
{
  return MEMORY[0x24BEE6638]();
}

uint64_t sub_243BFD64C()
{
  return MEMORY[0x24BEE6640]();
}

uint64_t sub_243BFD658()
{
  return MEMORY[0x24BEE6648]();
}

uint64_t sub_243BFD664()
{
  return MEMORY[0x24BEE6658]();
}

uint64_t sub_243BFD670()
{
  return MEMORY[0x24BEE6748]();
}

uint64_t sub_243BFD67C()
{
  return MEMORY[0x24BEE6750]();
}

uint64_t sub_243BFD688()
{
  return MEMORY[0x24BEE6760]();
}

uint64_t sub_243BFD694()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_243BFD6A0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_243BFD6AC()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_243BFD6B8()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_243BFD6C4()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_243BFD6D0()
{
  return MEMORY[0x24BDC62E0]();
}

uint64_t sub_243BFD6DC()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_243BFD6E8()
{
  return MEMORY[0x24BDC6AD8]();
}

uint64_t sub_243BFD6F4()
{
  return MEMORY[0x24BDC6AF0]();
}

uint64_t sub_243BFD700()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_243BFD70C()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_243BFD718()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_243BFD724()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_243BFD730()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_243BFD73C()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t sub_243BFD748()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_243BFD754()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_243BFD760()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t sub_243BFD76C()
{
  return MEMORY[0x24BEE0440]();
}

uint64_t sub_243BFD778()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_243BFD784()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_243BFD790()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_243BFD79C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_243BFD7A8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_243BFD7B4()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_243BFD7C0()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_243BFD7CC()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_243BFD7D8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_243BFD7E4()
{
  return MEMORY[0x24BDCF870]();
}

uint64_t sub_243BFD7F0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_243BFD7FC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_243BFD808()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_243BFD814()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_243BFD820()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_243BFD82C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_243BFD838()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_243BFD844()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_243BFD850()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_243BFD85C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_243BFD868()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_243BFD874()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_243BFD880()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_243BFD88C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_243BFD898()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_243BFD8A4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_243BFD8B0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_243BFD8BC()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_243BFD8C8()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_243BFD8D4()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_243BFD8E0()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_243BFD8EC()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_243BFD8F8()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_243BFD904()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t sub_243BFD910()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_243BFD91C()
{
  return MEMORY[0x24BEE0FB0]();
}

uint64_t sub_243BFD928()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_243BFD934()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_243BFD940()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_243BFD94C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_243BFD958()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_243BFD964()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_243BFD970()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_243BFD97C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_243BFD988()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_243BFD994()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_243BFD9A0()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_243BFD9AC()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_243BFD9B8()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_243BFD9C4()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_243BFD9D0()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_243BFD9DC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_243BFD9E8()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_243BFD9F4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_243BFDA00()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_243BFDA0C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_243BFDA18()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_243BFDA24()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_243BFDA30()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_243BFDA3C()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_243BFDA48()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_243BFDA54()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_243BFDA60()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_243BFDA6C()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_243BFDA78()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_243BFDA84()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_243BFDA90()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_243BFDA9C()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_243BFDAA8()
{
  return MEMORY[0x24BEE6A68]();
}

uint64_t sub_243BFDAB4()
{
  return MEMORY[0x24BEE6A78]();
}

uint64_t sub_243BFDAC0()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_243BFDACC()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_243BFDAD8()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_243BFDAE4()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_243BFDAF0()
{
  return MEMORY[0x24BEE6B58]();
}

uint64_t sub_243BFDAFC()
{
  return MEMORY[0x24BEE6BA0]();
}

uint64_t sub_243BFDB08()
{
  return MEMORY[0x24BEE6BE8]();
}

uint64_t sub_243BFDB14()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_243BFDB20()
{
  return MEMORY[0x24BEE6C28]();
}

uint64_t sub_243BFDB2C()
{
  return MEMORY[0x24BEE6C40]();
}

uint64_t sub_243BFDB38()
{
  return MEMORY[0x24BEE6C80]();
}

uint64_t sub_243BFDB44()
{
  return MEMORY[0x24BEE6CA8]();
}

uint64_t sub_243BFDB50()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_243BFDB5C()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_243BFDB68()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_243BFDB74()
{
  return MEMORY[0x24BEE6D28]();
}

uint64_t sub_243BFDB80()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_243BFDB8C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_243BFDB98()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_243BFDBA4()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_243BFDBB0()
{
  return MEMORY[0x24BEE1660]();
}

uint64_t sub_243BFDBBC()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_243BFDBC8()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_243BFDBD4()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t sub_243BFDBE0()
{
  return MEMORY[0x24BEE1878]();
}

uint64_t sub_243BFDBEC()
{
  return MEMORY[0x24BEE1880]();
}

uint64_t sub_243BFDBF8()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t sub_243BFDC04()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_243BFDC10()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t sub_243BFDC1C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_243BFDC28()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_243BFDC34()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_243BFDC40()
{
  return MEMORY[0x24BEE1930]();
}

uint64_t sub_243BFDC4C()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_243BFDC58()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_243BFDC64()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_243BFDC70()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_243BFDC7C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_243BFDC88()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_243BFDC94()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_243BFDCA0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_243BFDCAC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_243BFDCB8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_243BFDCC4()
{
  return MEMORY[0x24BE72398]();
}

uint64_t sub_243BFDCD0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_243BFDCDC()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_243BFDCE8()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_243BFDCF4()
{
  return MEMORY[0x24BEE59A0]();
}

uint64_t sub_243BFDD00()
{
  return MEMORY[0x24BEE1C00]();
}

uint64_t sub_243BFDD0C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_243BFDD18()
{
  return MEMORY[0x24BEE1C90]();
}

uint64_t sub_243BFDD24()
{
  return MEMORY[0x24BEE1CB0]();
}

uint64_t sub_243BFDD30()
{
  return MEMORY[0x24BEE1CE8]();
}

uint64_t sub_243BFDD3C()
{
  return MEMORY[0x24BEE1D08]();
}

uint64_t sub_243BFDD48()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_243BFDD54()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_243BFDD60()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_243BFDD6C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_243BFDD78()
{
  return MEMORY[0x24BEE2030]();
}

uint64_t sub_243BFDD84()
{
  return MEMORY[0x24BEE2048]();
}

uint64_t sub_243BFDD90()
{
  return MEMORY[0x24BEE20A0]();
}

uint64_t sub_243BFDD9C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_243BFDDA8()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_243BFDDB4()
{
  return MEMORY[0x24BEE2168]();
}

uint64_t sub_243BFDDC0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_243BFDDCC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_243BFDDD8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_243BFDDE4()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_243BFDDF0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_243BFDDFC()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_243BFDE08()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_243BFDE14()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_243BFDE20()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_243BFDE2C()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_243BFDE38()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_243BFDE44()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_243BFDE50()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_243BFDE5C()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_243BFDE68()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_243BFDE74()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_243BFDE80()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_243BFDE8C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_243BFDE98()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_243BFDEA4()
{
  return MEMORY[0x24BEE27B0]();
}

uint64_t sub_243BFDEB0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_243BFDEBC()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_243BFDEC8()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_243BFDED4()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_243BFDEE0()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_243BFDEEC()
{
  return MEMORY[0x24BEE6D88]();
}

uint64_t sub_243BFDEF8()
{
  return MEMORY[0x24BEE6DA0]();
}

uint64_t sub_243BFDF04()
{
  return MEMORY[0x24BEE6DB8]();
}

uint64_t sub_243BFDF10()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_243BFDF1C()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_243BFDF28()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_243BFDF34()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_243BFDF40()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_243BFDF4C()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_243BFDF58()
{
  return MEMORY[0x24BEE2DA8]();
}

uint64_t sub_243BFDF64()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_243BFDF70()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_243BFDF7C()
{
  return MEMORY[0x24BEE2F88]();
}

uint64_t sub_243BFDF88()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_243BFDF94()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_243BFDFA0()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t sub_243BFDFAC()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_243BFDFB8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_243BFDFC4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_243BFDFD0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_243BFDFDC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_243BFDFE8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_243BFDFF4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_243BFE000()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_243BFE00C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_243BFE018()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_243BFE024()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_243BFE030()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_243BFE03C()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_243BFE048()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_243BFE054()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_243BFE060()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_243BFE06C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_243BFE078()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_243BFE084()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_243BFE090()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_243BFE09C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_243BFE0A8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_243BFE0B4()
{
  return MEMORY[0x24BEE7078]();
}

uint64_t sub_243BFE0C0()
{
  return MEMORY[0x24BEE7088]();
}

uint64_t sub_243BFE0CC()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_243BFE0D8()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_243BFE0E4()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_243BFE0F0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_243BFE0FC()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_243BFE108()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_243BFE114()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_243BFE120()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_243BFE12C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_243BFE138()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_243BFE144()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_243BFE150()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_243BFE15C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_243BFE168()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_243BFE174()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_243BFE180()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_243BFE18C()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_243BFE198()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_243BFE1A4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_243BFE1B0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_243BFE1BC()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_243BFE1C8()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_243BFE1D4()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_243BFE1E0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_243BFE1EC()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_243BFE1F8()
{
  return MEMORY[0x24BDD0810]();
}

uint64_t sub_243BFE204()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_243BFE210()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_243BFE21C()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t sub_243BFE228()
{
  return MEMORY[0x24BEE4878]();
}

uint64_t sub_243BFE234()
{
  return MEMORY[0x24BEE4898]();
}

uint64_t sub_243BFE240()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_243BFE24C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_243BFE258()
{
  return MEMORY[0x24BEE4A98]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x24BEE4B50]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x24BEDE110](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x24BEDE120](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x24BEE4E80]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

sysdir_search_path_enumeration_state sysdir_get_next_search_path_enumeration(sysdir_search_path_enumeration_state state, char *path)
{
  return MEMORY[0x24BDB0110](*(_QWORD *)&state, path);
}

uint64_t sysdir_start_search_path_enumeration_private()
{
  return MEMORY[0x24BDB0120]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return MEMORY[0x24BDB0810]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}


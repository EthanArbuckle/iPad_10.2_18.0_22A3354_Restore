uint64_t sub_100001E70()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  Swift::String v6;
  Swift::String v7;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_connection);
  v2 = objc_msgSend(v1, "description");
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = v4;

  v6._countAndFlagsBits = v3;
  v6._object = v5;
  String.append(_:)(v6);

  swift_bridgeObjectRelease(v5);
  v7._countAndFlagsBits = 41;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  return 0x6576726553435058;
}

uint64_t sub_100002050(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  return swift_task_switch(sub_1000020A4, 0, 0);
}

uint64_t sub_1000020A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000217FC);
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_100002100;
  return sub_100004594(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100002100()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(*v1 + 40);
  v3 = *v1;
  *(_QWORD *)(v3 + 48) = v0;
  swift_task_dealloc(v2);
  if (v0)
    return swift_task_switch(sub_1000021A0, 0, 0);
  v6 = *(void **)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);

  (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  _Block_release(*(const void **)(v3 + 32));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1000021A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);

  v4 = (void *)_convertErrorToNSError(_:)(v1);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  _Block_release(*(const void **)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000234C(void *a1, uint64_t a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  uint64_t v8;
  id v9;
  id v10;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  if (a2)
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for String);
  else
    v8 = 0;
  v4[5] = v8;
  v9 = a1;
  v10 = a4;
  return swift_task_switch(sub_1000023CC, 0, 0);
}

uint64_t sub_1000023CC()
{
  uint64_t *v0;
  uint64_t **v1;

  v1 = (uint64_t **)swift_task_alloc(dword_10002180C);
  v0[6] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = (uint64_t *)sub_10000242C;
  return sub_100007BE4(v0[2], v0[5]);
}

uint64_t sub_10000242C()
{
  uint64_t *v0;
  uint64_t v1;
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  uint64_t v6;

  v1 = *(_QWORD *)(*v0 + 40);
  v3 = *(void **)(*v0 + 24);
  v2 = *(void (***)(_QWORD, _QWORD))(*v0 + 32);
  v4 = *(void **)(*v0 + 16);
  v6 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 48));

  swift_bridgeObjectRelease(v1);
  v2[2](v2, 0);
  _Block_release(v2);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1000025DC(uint64_t a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v3[4] = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v3[5] = v6;
  v7 = a3;
  return swift_task_switch(sub_100002638, 0, 0);
}

uint64_t sub_100002638()
{
  uint64_t *v0;
  uint64_t **v1;

  v1 = (uint64_t **)swift_task_alloc(dword_100021814);
  v0[6] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = (uint64_t *)sub_100002694;
  return sub_100008280(v0[4], v0[5]);
}

uint64_t sub_100002694()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*v1 + 48);
  v3 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  swift_task_dealloc(v2);
  if (v0)
    return swift_task_switch(sub_100002738, 0, 0);
  v5 = *(_QWORD *)(v3 + 40);
  v6 = *(_QWORD *)(v3 + 24);

  swift_bridgeObjectRelease(v5);
  (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_100002738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);

  swift_bridgeObjectRelease(v2);
  v4 = (void *)_convertErrorToNSError(_:)(v1);
  swift_errorRelease(v1);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000028E0(uint64_t a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v3[4] = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v3[5] = v6;
  v7 = a3;
  return swift_task_switch(sub_10000293C, 0, 0);
}

uint64_t sub_10000293C()
{
  uint64_t *v0;
  uint64_t **v1;

  v1 = (uint64_t **)swift_task_alloc(dword_10002181C);
  v0[6] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = (uint64_t *)sub_100002998;
  return sub_100008A4C(v0[4], v0[5]);
}

uint64_t sub_100002998()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*v1 + 48);
  v3 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  swift_task_dealloc(v2);
  if (v0)
    return swift_task_switch(sub_100003DE0, 0, 0);
  v5 = *(_QWORD *)(v3 + 40);
  v6 = *(_QWORD *)(v3 + 24);

  swift_bridgeObjectRelease(v5);
  (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_100002A3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  return swift_task_switch(sub_100002A5C, 0, 0);
}

uint64_t sub_100002A5C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100021824);
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_100002AB0;
  return sub_100009684();
}

uint64_t sub_100002AB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 56);
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100002BC4;
  }
  else
  {
    *(_QWORD *)(v4 + 72) = a1;
    v6 = sub_100002B24;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100002B24()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void (*v5)(void *, _QWORD);
  id v6;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain(v3);
  v4 = sub_1000039B8(v1, v2, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v1);
  v5 = *(void (**)(void *, _QWORD))(v0 + 40);
  if (v4)
  {
    v6 = v4;
    v5(v4, 0);

  }
  else
  {
    v5(0, 0);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002BC4()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD, uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(void (**)(_QWORD, uint64_t))(v0 + 40);
  swift_errorRetain(v1);
  v2(0, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100003660(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10001CA98, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100021600, v16);
}

void sub_100002EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_100003024(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch(sub_10000306C, 0, 0);
}

uint64_t sub_10000306C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100021824);
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_1000030C0;
  return sub_100009684();
}

uint64_t sub_1000030C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 32);
  *(_QWORD *)(*v2 + 40) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_1000031AC;
  }
  else
  {
    *(_QWORD *)(v4 + 48) = a1;
    v6 = sub_100003134;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100003134()
{
  uint64_t v0;
  uint64_t v1;
  Class isa;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 48);

  sub_1000037E4();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v1);
  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 24);
  ((void (**)(_QWORD, Class, _QWORD))v3)[2](v3, isa, 0);

  _Block_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000031AC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 40);

  v2 = (void *)_convertErrorToNSError(_:)(v1);
  swift_errorRelease(v1);
  v3 = *(void (***)(_QWORD, _QWORD, _QWORD))(v0 + 24);
  ((void (**)(_QWORD, _QWORD, void *))v3)[2](v3, 0, v2);

  _Block_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100003218()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KCSharingMessagingdXPCServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for KCSharingMessagingdXPCServer()
{
  return objc_opt_self(_TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer);
}

uint64_t sub_1000032A0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000032E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000330C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_1000215AC);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_100003DE4;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1000215A8 + dword_1000215A8))(v2, v3);
}

uint64_t sub_100003370(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_100003DE4;
  return v6();
}

uint64_t sub_1000033C8()
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
  v5 = (_QWORD *)swift_task_alloc(dword_1000215BC);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100003DE4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000215B8 + dword_1000215B8))(v2, v3, v4);
}

uint64_t sub_100003440(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_100003DE4;
  return v7();
}

uint64_t sub_100003498(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_1000215CC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100003DE4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000215C8 + dword_1000215C8))(a1, v4, v5, v6);
}

uint64_t sub_10000351C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_100003660(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10001CA20, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000215E0, v16);
}

uint64_t sub_100003660(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000032A0(&qword_1000215A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000036A0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100003704;
  return v6(a1);
}

uint64_t sub_100003704()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100003750()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100003774(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000215DC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100003DE4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000215D8 + dword_1000215D8))(a1, v4);
}

unint64_t sub_1000037E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000215E8;
  if (!qword_1000215E8)
  {
    v1 = objc_opt_self(KCSharingGroupInvite);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_1000215E8);
  }
  return result;
}

uint64_t sub_100003820()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100003844(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100002EB0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10000384C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100003888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc(dword_1000215F4);
  v6 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_100003DE4;
  *(_QWORD *)(v5 + 48) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = v3;
  return swift_task_switch(sub_100002A5C, 0, 0);
}

uint64_t sub_100003900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000218CC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100003970;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000218C8 + dword_1000218C8))(a1, v4);
}

uint64_t sub_100003970()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void *sub_1000039B8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
    goto LABEL_21;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v8)
  {
    v23 = v4;
    v24 = v7;
    v25 = v7 & 0xC000000000000001;
    v4 = 4;
    while (1)
    {
      v9 = v4 - 4;
      if (!v25)
        break;
      v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v7);
      v11 = v4 - 3;
      if (__OFADD__(v9, 1))
        goto LABEL_20;
LABEL_9:
      v12 = v8;
      v13 = v10;
      v14 = a3;
      v15 = objc_msgSend(v10, "groupID", v23);
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v18 = v17;

      a3 = v14;
      v19 = v16 == a2 && v18 == v14;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
LABEL_19:
        swift_bridgeObjectRelease(a3);
        return v13;
      }
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, a2, v14, 0);
      swift_bridgeObjectRelease(v18);
      if ((v20 & 1) != 0)
      {
        a3 = v24;
        goto LABEL_19;
      }

      ++v4;
      v8 = v12;
      v19 = v11 == v12;
      v7 = v24;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
        return 0;
      }
    }
    v10 = *(id *)(v7 + 8 * v4);
    v11 = v4 - 3;
    if (!__OFADD__(v9, 1))
      goto LABEL_9;
LABEL_20:
    __break(1u);
LABEL_21:
    if (v7 < 0)
      v21 = v7;
    else
      v21 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v8 = _CocoaArrayWrapper.endIndex.getter(v21);
  }
  swift_bridgeObjectRelease(v7);
  return 0;
}

uint64_t sub_100003B60()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10002160C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100003DE4;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100021608 + dword_100021608))(v2, v3, v4);
}

uint64_t sub_100003BD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10002162C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100003DE4;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_100021628 + dword_100021628))(v2, v3, v4);
}

uint64_t sub_100003C4C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100003C88()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc(dword_10002164C);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_100003DE4;
  return ((uint64_t (*)(void *, uint64_t, void *, void *))((char *)&dword_100021648 + dword_100021648))(v2, v3, v5, v4);
}

uint64_t sub_100003D0C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100003D40()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10002166C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100003970;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100021668 + dword_100021668))(v2, v3, v4);
}

uint64_t sub_100003DB4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

void sub_100003DEC()
{
  qword_1000216F0 = 0x444970756F7267;
  qword_1000216F8 = 0xE700000000000000;
}

void sub_100003E10()
{
  qword_100021700 = 0x4C52556572616873;
  qword_100021708 = 0xE800000000000000;
}

void sub_100003E34()
{
  qword_100021710 = 0x6974617469766E69;
  qword_100021718 = 0xEF6E656B6F546E6FLL;
}

void sub_100003E64()
{
  strcpy((char *)&qword_100021720, "inviteeHandle");
  HIWORD(qword_100021728) = -4864;
}

void sub_100003E94()
{
  qword_100021730 = 0x656D6954746E6573;
  qword_100021738 = 0xE800000000000000;
}

void sub_100003EB8()
{
  qword_100021740 = 0x6D614E70756F7267;
  qword_100021748 = 0xE900000000000065;
}

char *sub_100003EE0()
{
  id v0;
  id v1;
  char *result;

  v0 = objc_msgSend((id)objc_opt_self(KCSharingDaemonConnection), "sharedInvitationNotifier");
  v1 = objc_allocWithZone((Class)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate());
  result = sub_100004178(v0);
  qword_100021D30 = (uint64_t)result;
  return result;
}

void sub_100003F38()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;

  v1 = v0;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue;
  sub_100011154(0, (unint64_t *)&qword_100021828, OS_dispatch_queue_ptr);
  static DispatchQoS.unspecified.getter();
  v18 = _swiftEmptyArrayStorage;
  v12 = sub_10000D32C((unint64_t *)&qword_100021830, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v13 = sub_1000032A0(&qword_100021838);
  v14 = sub_10000C524();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v18, v13, v14, v6, v12);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  v15 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000003DLL, 0x8000000100016E50, v11, v8, v5, 0);
  *(_QWORD *)&v1[v17] = v15;
  v16 = &v1[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_schemaIdentifier];
  *(_QWORD *)v16 = 0xD000000000000023;
  *((_QWORD *)v16 + 1) = 0x8000000100016E90;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x616C696176616E75, 0xEB00000000656C62, "keychainsharingmessagingd/KCSharingMessagingdInvitationManagerDelegate.swift", 76, 2, 29, 0);
  __break(1u);
}

char *sub_100004178(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  id v24;
  NSString v25;
  id v26;
  void *v27;
  id v28;
  objc_class *v29;
  char *v30;
  void *v31;
  void *v32;
  char *v33;
  id v34;
  id v35;
  _QWORD v37[2];
  uint64_t v38;
  void *v39;
  uint64_t v40;
  objc_super v41;
  _QWORD *v42;

  v39 = a1;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue;
  v37[0] = sub_100011154(0, (unint64_t *)&qword_100021828, OS_dispatch_queue_ptr);
  v12 = v1;
  static DispatchQoS.unspecified.getter(v12);
  v42 = _swiftEmptyArrayStorage;
  v13 = sub_10000D32C((unint64_t *)&qword_100021830, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v14 = sub_1000032A0(&qword_100021838);
  v15 = sub_10000C524();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v42, v14, v15, v6, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  v16 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000003DLL, 0x8000000100016E50, v11, v8, v5, 0);
  *(_QWORD *)(v37[1] + v38) = v16;
  v17 = &v12[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_schemaIdentifier];
  *(_QWORD *)v17 = 0xD000000000000023;
  *((_QWORD *)v17 + 1) = 0x8000000100016E90;
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v18 = type metadata accessor for Logger(0);
  v19 = sub_10000D078(v18, (uint64_t)qword_100021D50);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = (_QWORD *)swift_slowAlloc(32, -1);
    v42 = v23;
    *(_DWORD *)v22 = 136315138;
    v40 = sub_100013D14(0xD000000000000028, 0x8000000100016EC0, (uint64_t *)&v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v40, &v41, v22 + 4, v22 + 12);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "initing IDSInvitationManager with service name %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }

  v24 = objc_allocWithZone((Class)IDSInvitationManager);
  v25 = String._bridgeToObjectiveC()();
  v26 = objc_msgSend(v24, "initWithServiceIdentifier:", v25);

  *(_QWORD *)&v12[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager] = v26;
  v27 = v39;
  *(_QWORD *)&v12[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection] = v39;
  v28 = v27;

  v29 = (objc_class *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate();
  v41.receiver = v12;
  v41.super_class = v29;
  v30 = (char *)objc_msgSendSuper2(&v41, "init");
  v31 = *(void **)&v30[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
  v32 = *(void **)&v30[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue];
  v33 = v30;
  v34 = v31;
  v35 = v32;
  objc_msgSend(v34, "setDelegate:queue:", v33, v35);

  return v33;
}

uint64_t sub_100004594(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2[10] = a1;
  v2[11] = v1;
  v3 = sub_1000032A0(&qword_1000218F0);
  v2[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v2[13] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[14] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[15] = swift_task_alloc(v6);
  v2[16] = swift_task_alloc(v6);
  return swift_task_switch(sub_100004628, 0, 0);
}

uint64_t sub_100004628()
{
  _QWORD *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  _QWORD *v18;
  void *v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  id v43;
  NSString v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68[14];

  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v0 = (_QWORD *)(v67 + 72);
  v1 = (id *)(v67 + 80);
  v2 = *(void **)(v67 + 80);
  v3 = type metadata accessor for Logger(0);
  *(_QWORD *)(v67 + 136) = sub_10000D078(v3, (uint64_t)qword_100021D50);
  v4 = Logger.logObject.getter(v2);
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v67 + 80);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v66 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    *v0 = v7;
    v9 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0, v1, v8 + 4, v8 + 12);
    *v66 = v7;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "sending new invites for group %@", v8, 0xCu);
    v10 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v66, 1, v10);
    swift_slowDealloc(v66, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {

  }
  v11 = objc_msgSend(*v1, "shareURL");
  if (v11)
  {
    v12 = v11;
    v14 = *(_QWORD *)(v67 + 112);
    v13 = *(_QWORD *)(v67 + 120);
    v16 = *(_QWORD *)(v67 + 96);
    v15 = *(_QWORD *)(v67 + 104);
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32);
    v17(v16, v13, v15);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v16, 0, 1, v15);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v15) != 1)
    {
      v18 = (_QWORD *)(v67 + 40);
      v19 = *(void **)(v67 + 80);
      v20 = *(char **)(v67 + 88);
      v17(*(_QWORD *)(v67 + 128), *(_QWORD *)(v67 + 96), *(_QWORD *)(v67 + 104));
      v21 = objc_msgSend(v19, "groupID");
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      v25 = objc_msgSend(*(id *)&v20[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager], "pendingInvitations");
      v26 = sub_100011154(0, &qword_100021960, IDSSentInvitation_ptr);
      v27 = sub_100010940(&qword_100021968, &qword_100021960, IDSSentInvitation_ptr);
      v28 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v25, v26, v27);

      v29 = v20;
      sub_10000FB5C(v28, (uint64_t)v29, v22, v24);
      v31 = v30;
      *(_QWORD *)(v67 + 144) = v30;

      swift_bridgeObjectRelease(v24);
      *(_QWORD *)(v67 + 40) = &_swiftEmptySetSingleton;
      if ((unint64_t)v31 >> 62)
      {
        if (v31 < 0)
          v48 = v31;
        else
          v48 = v31 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v31);
        result = _CocoaArrayWrapper.endIndex.getter(v48);
        v32 = result;
        if (result)
          goto LABEL_10;
      }
      else
      {
        v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
        result = swift_bridgeObjectRetain(v31);
        if (v32)
        {
LABEL_10:
          if (v32 < 1)
          {
            __break(1u);
            return result;
          }
          v34 = 0;
          do
          {
            if ((v31 & 0xC000000000000001) != 0)
              v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v34, v31);
            else
              v35 = *(id *)(v31 + 8 * v34 + 32);
            v36 = v35;
            ++v34;
            v37 = objc_msgSend(v35, "destination");
            v38 = sub_100005008();
            swift_unknownObjectRelease(v37);
            sub_100005098(v38);

          }
          while (v32 != v34);
        }
      }
      v49 = swift_bridgeObjectRelease(v31);
      v50 = Logger.logObject.getter(v49);
      v51 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc(12, -1);
        v53 = swift_slowAlloc(32, -1);
        v68[0] = v53;
        *(_DWORD *)v52 = 136315138;
        swift_beginAccess(v18, v67 + 16, 0, 0);
        v54 = *v18;
        v55 = swift_bridgeObjectRetain(*v18);
        v56 = Set.description.getter(v55, &type metadata for String, &protocol witness table for String);
        v58 = v57;
        swift_bridgeObjectRelease(v54);
        *(_QWORD *)(v67 + 64) = sub_100013D14(v56, v58, v68);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v67 + 64, v67 + 72, v52 + 4, v52 + 12);
        swift_bridgeObjectRelease(v58);
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "all pending URIs: %s", v52, 0xCu);
        swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v53, -1, -1);
        swift_slowDealloc(v52, -1, -1);
      }

      v59 = *(_QWORD *)(v67 + 128);
      v61 = *(_QWORD *)(v67 + 80);
      v60 = *(_QWORD *)(v67 + 88);
      v62 = sub_1000032A0(&qword_100021980);
      v63 = sub_1000032A0(&qword_100021988);
      v64 = (_QWORD *)swift_task_alloc(64);
      *(_QWORD *)(v67 + 152) = v64;
      v64[2] = v61;
      v64[3] = v18;
      v64[4] = v31;
      v64[5] = v60;
      v64[6] = v59;
      v65 = (_QWORD *)swift_task_alloc(async function pointer to withTaskGroup<A, B>(of:returning:isolation:body:)[1]);
      *(_QWORD *)(v67 + 160) = v65;
      *v65 = v67;
      v65[1] = sub_100004D30;
      v68[12] = v63;
      return withTaskGroup<A, B>(of:returning:isolation:body:)(v67 + 48, v62, v63, 0, 0, &unk_100021998, v64, v62);
    }
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v67 + 112) + 56))(*(_QWORD *)(v67 + 96), 1, 1, *(_QWORD *)(v67 + 104));
  }
  v39 = sub_100010EC8(*(_QWORD *)(v67 + 96), &qword_1000218F0);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "missing group shareURL", v42, 2u);
    swift_slowDealloc(v42, -1, -1);
  }

  v43 = objc_allocWithZone((Class)NSError);
  v44 = String._bridgeToObjectiveC()();
  objc_msgSend(v43, "initWithDomain:code:userInfo:", v44, 3, 0);

  swift_willThrow(v45);
  v46 = *(_QWORD *)(v67 + 120);
  v47 = *(_QWORD *)(v67 + 96);
  swift_task_dealloc(*(_QWORD *)(v67 + 128));
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  return (*(uint64_t (**)(void))(v67 + 8))();
}

uint64_t sub_100004D30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 152);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 144);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 160));
  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100004D98, 0, 0);
}

uint64_t sub_100004D98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v1 = v0[6];
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = swift_bridgeObjectRetain_n(v0[6], 2);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(12, -1);
      v6 = swift_slowAlloc(32, -1);
      v25 = v6;
      *(_DWORD *)v5 = 136315138;
      v7 = sub_100011154(0, &qword_1000219A0, NSError_ptr);
      v8 = swift_bridgeObjectRetain(v1);
      v9 = Dictionary.description.getter(v8, &type metadata for String, v7, &protocol witness table for String);
      v11 = v10;
      swift_bridgeObjectRelease(v1);
      v0[7] = sub_100013D14(v9, v11, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 7, v0 + 8, v5 + 4, v5 + 12);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease_n(v1, 2);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "collected errors %s", v5, 0xCu);
      swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v6, -1, -1);
      swift_slowDealloc(v5, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v1, 2);
    }

    v18 = v0[16];
    v19 = v0[13];
    v20 = v0[14];
    sub_1000158DC(v1);
    v21 = swift_bridgeObjectRelease(v1);
    swift_willThrow(v21);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    swift_bridgeObjectRelease(v0[5]);
    v22 = v0[15];
    v23 = v0[12];
    swift_task_dealloc(v0[16]);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    v17 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v13 = v0[15];
    v12 = v0[16];
    v14 = v0[13];
    v15 = v0[14];
    v16 = v0[12];
    swift_bridgeObjectRelease(v0[6]);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v12, v14);
    swift_bridgeObjectRelease(v0[5]);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    swift_task_dealloc(v16);
    v17 = (uint64_t (*)(void))v0[1];
  }
  return v17();
}

uint64_t sub_100005008()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, "destinationURIs");
  v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for String, &protocol witness table for String);

  v3 = sub_100009C7C(v2);
  swift_bridgeObjectRelease(v2);
  v4 = sub_100010090(v3);
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_100005098(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16[2];

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release(v1);
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release(v1);
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release(v1);
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release(v1);
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    swift_bridgeObjectRetain(v12);
    sub_10000D36C(v16, v11, v12);
    result = swift_bridgeObjectRelease(v16[1]);
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release(v1);
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release(v1);
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_100005204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7[15] = a6;
  v7[16] = a7;
  v7[13] = a4;
  v7[14] = a5;
  v7[11] = a2;
  v7[12] = a3;
  v7[10] = a1;
  v8 = sub_1000032A0(&qword_1000215A0);
  v7[17] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v7[18] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[19] = v10;
  v7[20] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for URL(0);
  v7[21] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v7[22] = v12;
  v7[23] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000032A0(&qword_100021948);
  v7[24] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  v7[25] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v7[26] = v15;
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[27] = swift_task_alloc(v16);
  v7[28] = swift_task_alloc(v16);
  v17 = sub_1000032A0(&qword_1000219B8);
  v7[29] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v7[30] = v18;
  v7[31] = swift_task_alloc((*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100005344, 0, 0);
}

void sub_100005344()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  os_log_type_t v18;
  const char *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  NSObject **v37;
  uint64_t v38;
  NSObject **v39;
  uint64_t v40;
  os_log_type_t v41;
  uint64_t v42;
  NSObject *v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  id v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  NSObject *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  NSObject **v63;
  uint64_t v64;
  NSObject **v65;
  NSObject *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  NSObject **v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  Class isa;
  NSString v103;
  id v104;
  uint64_t v105;
  _QWORD *v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  NSObject **v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int *v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  _QWORD *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  void *v143;

  v1 = (_QWORD *)v0;
  v2 = objc_msgSend(*(id *)(v0 + 96), "participants");
  v3 = sub_100011154(0, &qword_1000219C0, KCSharingParticipant_ptr);
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v111 = v4;
    else
      v111 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v5 = _CocoaArrayWrapper.endIndex.getter(v111);
    swift_bridgeObjectRelease(v4);
    if (v5)
      goto LABEL_3;
LABEL_60:
    swift_bridgeObjectRelease(v4);
    v112 = *(_QWORD *)v1[11];
    v113 = sub_1000032A0(&qword_100021980);
    TaskGroup.makeAsyncIterator()(v112, v113);
    v1[33] = _swiftEmptyDictionarySingleton;
    v114 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
    v1[32] = v114;
    *v114 = v1;
    v114[1] = sub_10000606C;
    TaskGroup.Iterator.next(isolation:)(v1 + 5, 0, 0, v1[29]);
    return;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    goto LABEL_60;
LABEL_3:
  if (v5 < 1)
    goto LABEL_63;
  v6 = *(_QWORD *)(v0 + 112);
  v116 = (NSObject **)(v0 + 72);
  v117 = OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager;
  v118 = *(_QWORD *)(v0 + 120);
  v125 = v118
       + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_schemaIdentifier;
  v124 = *(_QWORD *)(v0 + 216);
  v121 = *(_QWORD *)(v0 + 208);
  v126 = *(int **)(v0 + 200);
  v138 = *(_QWORD *)(v0 + 176);
  v123 = *(_QWORD *)(v0 + 152);
  v7 = v4 & 0xC000000000000001;
  swift_beginAccess(*(_QWORD *)(v0 + 104), v0 + 16, 0, 0);
  v142 = 0;
  v8 = 0;
  v122 = v6 & 0xC000000000000001;
  v119 = v6 + 32;
  v120 = v6 & 0xFFFFFFFFFFFFFF8;
  v115 = v0 + 80;
  v127 = v4;
  v128 = v4 & 0xC000000000000001;
  v129 = v5;
  while (1)
  {
    v9 = v7 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v4) : *(id *)(v4 + 8 * v8 + 32);
    v10 = v9;
    if (objc_msgSend(v9, "inviteStatus") == (id)1)
      break;
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v20 = type metadata accessor for Logger(0);
    sub_10000D078(v20, (uint64_t)qword_100021D50);
    v12 = v10;
    v13 = Logger.logObject.getter(v12);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v21))
    {
      v15 = swift_slowAlloc(12, -1);
      v16 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)(v15 + 4) = v12;
      *v16 = v12;
      v17 = v13;
      v18 = v21;
      v19 = "Skipping participant %@ because they're not pending";
      goto LABEL_20;
    }
LABEL_5:

LABEL_6:
    if (v5 == ++v8)
      goto LABEL_60;
  }
  if ((objc_msgSend(v10, "isCurrentUser") & 1) != 0)
  {
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v11 = type metadata accessor for Logger(0);
    sub_10000D078(v11, (uint64_t)qword_100021D50);
    v12 = v10;
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc(12, -1);
      v16 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)(v15 + 4) = v12;
      *v16 = v12;
      v17 = v13;
      v18 = v14;
      v19 = "Skipping participant %@ because they're us";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v19, (uint8_t *)v15, 0xCu);
      v22 = sub_1000032A0(&qword_1000218C0);
      swift_arrayDestroy(v16, 1, v22);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v15, -1, -1);

      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v23 = objc_msgSend(v10, "sharingInvitationData");
  if (!v23)
  {
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v40 = type metadata accessor for Logger(0);
    sub_10000D078(v40, (uint64_t)qword_100021D50);
    v12 = v10;
    v13 = Logger.logObject.getter(v12);
    v41 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v41))
    {
      v15 = swift_slowAlloc(12, -1);
      v16 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)(v15 + 4) = v12;
      *v16 = v12;
      v17 = v13;
      v18 = v41;
      v19 = "missing invitationData for participant %@, can't (re)invite them";
      goto LABEL_20;
    }
    goto LABEL_5;
  }
  v24 = v23;
  v25 = (uint64_t *)v1[13];
  v140 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v141 = v26;

  v27 = *v25;
  v28 = v10;
  v29 = swift_bridgeObjectRetain(v27);
  v30 = v142;
  v31 = sub_10001118C(v29, v28);
  swift_bridgeObjectRelease(v27);

  v139 = v28;
  if ((v31 & 1) == 0)
    goto LABEL_48;
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v32 = type metadata accessor for Logger(0);
  sub_10000D078(v32, (uint64_t)qword_100021D50);
  v33 = v28;
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc(12, -1);
    v37 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v36 = 138412290;
    *(_QWORD *)(v36 + 4) = v33;
    *v37 = v33;
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Participant %@ already has a pending invite", (uint8_t *)v36, 0xCu);
    v38 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v37, 1, v38);
    v39 = v37;
    v4 = v127;
    swift_slowDealloc(v39, -1, -1);
    swift_slowDealloc(v36, -1, -1);
  }
  else
  {

    v34 = v33;
  }
  v42 = v1[14];

  v43 = v33;
  v44 = sub_100011468(v42, v43);
  LOBYTE(v42) = v45;

  if ((v42 & 1) != 0)
  {
    v49 = Logger.logObject.getter(v46);
    v50 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Unable to find existing invitation, which we know we do have..? Skipping participant which has unknown pending invitation", v51, 2u);
      swift_slowDealloc(v51, -1, -1);

      sub_10000E320(v140, v141);
    }
    else
    {

      sub_10000E320(v140, v141);
    }
    goto LABEL_52;
  }
  if (v122)
  {
    v47 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v44, v1[14]);
    goto LABEL_37;
  }
  if ((v44 & 0x8000000000000000) == 0)
  {
    if (v44 >= *(_QWORD *)(v120 + 16))
      goto LABEL_62;
    v47 = *(id *)(v119 + 8 * v44);
LABEL_37:
    v48 = v47;
    sub_10000A97C(v47, (uint64_t *)v1[24]);
    v52 = v1[28];
    v53 = v1[24];
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v121 + 56))(v53, 0, 1, v1[25]);
    sub_100010F04(v53, v52);
    v54 = (uint64_t *)(v52 + v126[6]);
    v56 = *v54;
    v55 = v54[1];
    sub_1000108B8(*v54, v55);
    sub_100011690(v56, v55);
    v58 = v57;
    sub_10000E320(v56, v55);
    if ((v58 & 1) != 0)
    {
      v59 = v43;
      v60 = Logger.logObject.getter(v59);
      v61 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v60, v61))
      {
        v62 = swift_slowAlloc(12, -1);
        v63 = (NSObject **)swift_slowAlloc(8, -1);
        *(_DWORD *)v62 = 138412290;
        *(_QWORD *)(v62 + 4) = v59;
        *v63 = v59;

        _os_log_impl((void *)&_mh_execute_header, v60, v61, "Skipping participant %@ because their pending invite seems fine", (uint8_t *)v62, 0xCu);
        v64 = sub_1000032A0(&qword_1000218C0);
        swift_arrayDestroy(v63, 1, v64);
        v65 = v63;
        v4 = v127;
        swift_slowDealloc(v65, -1, -1);
        swift_slowDealloc(v62, -1, -1);
      }
      else
      {

      }
      v7 = v128;
      v5 = v129;
      v110 = v1[28];

      sub_10000E320(v140, v141);
      sub_1000106FC(v110);
      v142 = 0;
      goto LABEL_6;
    }
    sub_1000106FC(v1[28]);
    v143 = v48;
    v66 = v43;
    v67 = Logger.logObject.getter(v66);
    v68 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc(12, -1);
      v70 = (NSObject **)swift_slowAlloc(8, -1);
      *(_DWORD *)v69 = 138412290;
      *v116 = v66;
      v137 = v1;
      v71 = v66;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v116, v115, v69 + 4, v69 + 12);
      *v70 = v66;

      v1 = v137;
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "Invitation data for %@ has changed. Canceling existing invite and resending", v69, 0xCu);
      v72 = sub_1000032A0(&qword_1000218C0);
      swift_arrayDestroy(v70, 1, v72);
      swift_slowDealloc(v70, -1, -1);
      swift_slowDealloc(v69, -1, -1);
    }
    else
    {

      v67 = v66;
    }
    v28 = v139;

    objc_msgSend(*(id *)(v118 + v117), "cancelInvitation:serverAcknowledgedBlock:", v143, 0);
    v30 = 0;
LABEL_48:
    v142 = v30;
    v73 = v1[23];
    v74 = v1[21];
    v75 = v1[16];
    v76 = v1;
    v77 = (void *)v1[12];
    v78 = objc_msgSend(v77, "groupID");
    v79 = static String._unconditionallyBridgeFromObjectiveC(_:)(v78);
    v132 = v80;
    v133 = v79;

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v138 + 16))(v73, v75, v74);
    v81 = objc_msgSend(v28, "handle");
    v82 = static String._unconditionallyBridgeFromObjectiveC(_:)(v81);
    v130 = v83;
    v131 = v82;

    Date.init()();
    v84 = objc_msgSend(v77, "displayName");
    if (v84)
    {
      v85 = v84;
      v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(v84);
      v88 = v87;

    }
    else
    {
      v86 = 0;
      v88 = 0;
    }
    v1 = v76;
    v89 = (char *)v76[27];
    v90 = v76[23];
    v93 = v76 + 20;
    v92 = v76[20];
    v91 = v93[1];
    v94 = v1[18];
    v134 = v1[17];
    v135 = (void *)v1[15];
    v136 = (void *)v1[12];
    *(_QWORD *)v89 = v133;
    *(_QWORD *)(v124 + 8) = v132;
    (*(void (**)(char *, uint64_t, uint64_t))(v138 + 32))(&v89[v126[5]], v90, v91);
    v95 = (uint64_t *)&v89[v126[6]];
    *v95 = v140;
    v95[1] = v141;
    v96 = (uint64_t *)&v89[v126[7]];
    *v96 = v131;
    v96[1] = v130;
    (*(void (**)(char *, uint64_t, uint64_t))(v123 + 32))(&v89[v126[8]], v92, v94);
    v97 = (uint64_t *)&v89[v126[9]];
    *v97 = v86;
    v97[1] = v88;
    sub_1000108B8(v140, v141);
    v98 = sub_100006478();
    v99 = sub_1000067C0(v98);
    swift_bridgeObjectRelease(v98);
    v100 = *(_QWORD *)(v125 + 8);
    v101 = objc_allocWithZone((Class)IDSDictionaryInvitationContext);
    swift_bridgeObjectRetain(v100);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v99);
    v103 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v100);
    v104 = objc_msgSend(v101, "initWithDictionary:schema:", isa, v103);

    v105 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56))(v134, 1, 1, v105);
    v106 = (_QWORD *)swift_allocObject(&unk_10001CDC0, 64, 7);
    v106[2] = 0;
    v106[3] = 0;
    v106[4] = v139;
    v106[5] = v135;
    v106[6] = v104;
    v106[7] = v136;
    v107 = v139;
    v108 = v135;
    v109 = v136;
    sub_1000076FC(v134, (uint64_t)&unk_1000219D0, (uint64_t)v106);
    sub_10000E320(v140, v141);

    sub_100010EC8(v134, &qword_1000215A0);
    sub_1000106FC((uint64_t)v89);
    v4 = v127;
LABEL_52:
    v7 = v128;
    v5 = v129;
    goto LABEL_6;
  }
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
}

uint64_t sub_10000606C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 256));
  return swift_task_switch(sub_1000060C0, 0, 0);
}

unint64_t sub_1000060C0()
{
  uint64_t v0;
  char v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t result;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  BOOL v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;

  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  if (!v3)
  {
    v16 = *(_QWORD *)(v0 + 264);
    v17 = *(_QWORD *)(v0 + 248);
    v18 = *(_QWORD *)(v0 + 224);
    v19 = *(_QWORD *)(v0 + 216);
    v21 = *(_QWORD *)(v0 + 184);
    v20 = *(_QWORD *)(v0 + 192);
    v22 = *(_QWORD *)(v0 + 160);
    v23 = *(_QWORD *)(v0 + 136);
    v24 = *(_QWORD **)(v0 + 80);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(v17, *(_QWORD *)(v0 + 232));
    *v24 = v16;
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    swift_task_dealloc(v19);
    swift_task_dealloc(v20);
    swift_task_dealloc(v21);
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = *(void **)(v0 + 56);
  if (!v5)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
LABEL_17:
    v32 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
    *(_QWORD *)(v0 + 256) = v32;
    *v32 = v0;
    v32[1] = sub_10000606C;
    return TaskGroup.Iterator.next(isolation:)(v0 + 40, 0, 0, *(_QWORD *)(v0 + 232));
  }
  v6 = *(_QWORD *)(v0 + 264);
  v7 = v5;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
  *(_QWORD *)(v0 + 64) = v6;
  result = sub_10000E274(v4, v3);
  v11 = *(_QWORD *)(v6 + 16);
  v12 = (v10 & 1) == 0;
  v13 = __OFADD__(v11, v12);
  v14 = v11 + v12;
  if (v13)
  {
    __break(1u);
    goto LABEL_13;
  }
  v1 = v10;
  v2 = (_QWORD *)(v0 + 64);
  if (*(_QWORD *)(*(_QWORD *)(v0 + 264) + 24) >= v14)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_10;
LABEL_13:
    v28 = result;
    sub_10000F6D8();
    result = v28;
    v25 = (_QWORD *)*v2;
    if ((v1 & 1) != 0)
      goto LABEL_11;
    goto LABEL_14;
  }
  sub_10000EB0C(v14, isUniquelyReferenced_nonNull_native);
  result = sub_10000E274(v4, v3);
  if ((v1 & 1) != (v15 & 1))
    return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
LABEL_10:
  v25 = (_QWORD *)*v2;
  if ((v1 & 1) != 0)
  {
LABEL_11:
    v26 = v25[7];
    v27 = 8 * result;

    *(_QWORD *)(v26 + v27) = v7;
LABEL_16:
    swift_bridgeObjectRelease(0x8000000000000000);
    swift_bridgeObjectRelease(v3);

    *(_QWORD *)(v0 + 264) = v25;
    goto LABEL_17;
  }
LABEL_14:
  v25[(result >> 6) + 8] |= 1 << result;
  v29 = (uint64_t *)(v25[6] + 16 * result);
  *v29 = v4;
  v29[1] = v3;
  *(_QWORD *)(v25[7] + 8 * result) = v7;
  v30 = v25[2];
  v13 = __OFADD__(v30, 1);
  v31 = v30 + 1;
  if (!v13)
  {
    v25[2] = v31;
    swift_bridgeObjectRetain(v3);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v20[9];

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(_QWORD *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = v11[1];
      v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0) & 1) != 0)
        return 1;
      v15 = ~v7;
      v16 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
      {
        while (1)
        {
          v17 = (_QWORD *)(v10 + 16 * v16);
          v18 = v17[1];
          v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
            break;
          result = 0;
          v16 = (v16 + 1) & v15;
          if (((*(_QWORD *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

unint64_t sub_100006478()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v33;
  _OWORD v35[2];
  __int128 v36;
  void *v37;
  char v38[272];
  unint64_t v39;

  v1 = v0;
  v2 = sub_1000032A0(&qword_1000219F0);
  inited = swift_initStackObject(v2, v38);
  *(_OWORD *)(inited + 16) = xmmword_1000184A0;
  if (qword_1000214B0 != -1)
    swift_once(&qword_1000214B0, sub_100003DEC);
  v4 = qword_1000216F8;
  *(_QWORD *)(inited + 32) = qword_1000216F0;
  *(_QWORD *)(inited + 40) = v4;
  v5 = *v0;
  v6 = v0[1];
  *(_QWORD *)(inited + 72) = &type metadata for String;
  *(_QWORD *)(inited + 48) = v5;
  *(_QWORD *)(inited + 56) = v6;
  v7 = qword_1000214B8;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  if (v7 != -1)
    swift_once(&qword_1000214B8, sub_100003E10);
  v8 = qword_100021708;
  *(_QWORD *)(inited + 80) = qword_100021700;
  *(_QWORD *)(inited + 88) = v8;
  v9 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  v10 = swift_bridgeObjectRetain(v8);
  v11 = URL.absoluteString.getter(v10);
  *(_QWORD *)(inited + 120) = &type metadata for String;
  *(_QWORD *)(inited + 96) = v11;
  *(_QWORD *)(inited + 104) = v12;
  if (qword_1000214C0 != -1)
    swift_once(&qword_1000214C0, sub_100003E34);
  v13 = qword_100021718;
  *(_QWORD *)(inited + 128) = qword_100021710;
  *(_QWORD *)(inited + 136) = v13;
  v14 = (_QWORD *)((char *)v1 + v9[6]);
  v15 = *v14;
  v16 = v14[1];
  *(_QWORD *)(inited + 168) = &type metadata for Data;
  *(_QWORD *)(inited + 144) = v15;
  *(_QWORD *)(inited + 152) = v16;
  swift_bridgeObjectRetain(v13);
  sub_1000108B8(v15, v16);
  if (qword_1000214C8 != -1)
    swift_once(&qword_1000214C8, sub_100003E64);
  v17 = qword_100021728;
  *(_QWORD *)(inited + 176) = qword_100021720;
  *(_QWORD *)(inited + 184) = v17;
  v18 = (_QWORD *)((char *)v1 + v9[7]);
  v19 = *v18;
  v20 = v18[1];
  *(_QWORD *)(inited + 216) = &type metadata for String;
  *(_QWORD *)(inited + 192) = v19;
  *(_QWORD *)(inited + 200) = v20;
  v21 = qword_1000214D0;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v20);
  if (v21 != -1)
    swift_once(&qword_1000214D0, sub_100003E94);
  v22 = qword_100021738;
  *(_QWORD *)(inited + 224) = qword_100021730;
  *(_QWORD *)(inited + 232) = v22;
  v23 = (char *)v1 + v9[8];
  v24 = type metadata accessor for Date(0);
  *(_QWORD *)(inited + 264) = v24;
  v25 = sub_100011954((_QWORD *)(inited + 240));
  (*(void (**)(_QWORD *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v25, v23, v24);
  swift_bridgeObjectRetain(v22);
  v26 = sub_100008630(inited);
  v39 = v26;
  if (qword_1000214D8 != -1)
    swift_once(&qword_1000214D8, sub_100003EB8);
  v28 = qword_100021740;
  v27 = qword_100021748;
  v29 = (_QWORD *)((char *)v1 + v9[9]);
  v30 = v29[1];
  if (v30)
  {
    v31 = *v29;
    v37 = &type metadata for String;
    *(_QWORD *)&v36 = v31;
    *((_QWORD *)&v36 + 1) = v30;
    sub_100011000(&v36, v35);
    swift_bridgeObjectRetain(v27);
    swift_bridgeObjectRetain(v30);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v26);
    sub_10000EFEC(v35, v28, v27, isUniquelyReferenced_nonNull_native);
    v33 = v26;
    swift_bridgeObjectRelease(0x8000000000000000);
    swift_bridgeObjectRelease(v27);
  }
  else
  {
    swift_bridgeObjectRetain(qword_100021748);
    sub_10000E40C(v28, v27, &v36);
    swift_bridgeObjectRelease(v27);
    sub_100010EC8((uint64_t)&v36, &qword_1000218F8);
    return v39;
  }
  return v33;
}

uint64_t sub_1000067C0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1000032A0(&qword_100021950);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = _swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = v3 + 8;
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_37;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_37;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_37;
          v15 = *(_QWORD *)(v29 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_10000E3A0(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(_QWORD *)&v40 = v20;
    *((_QWORD *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v20;
    *((_QWORD *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_100011000(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_100011000(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_100011000(v37, v38);
    sub_100011000(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~v7[v22 >> 6]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~v7[v22 >> 6])) | v22 & 0x7FFFFFFFFFFFFFC0;
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
        v27 = v7[v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)((char *)v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_100011000(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10001194C(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100006B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return swift_task_switch(sub_100006BA4, 0, 0);
}

uint64_t sub_100006BA4()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = swift_task_alloc(48);
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 64) = v3;
  v4 = sub_1000032A0(&qword_100021980);
  *v3 = v0;
  v3[1] = sub_100006C4C;
  return withCheckedContinuation<A>(isolation:function:_:)(*(_QWORD *)(v0 + 16), 0, 0, 0xD000000000000018, 0x80000001000170B0, sub_10001186C, v1, v4);
}

uint64_t sub_100006C4C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(*v0 + 56);
  v3 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 64));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void sub_100006C9C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  void *v31;
  NSString v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t aBlock[5];
  uint64_t v53;

  v10 = sub_1000032A0(&qword_1000219E8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v50 = v12;
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v14 = type metadata accessor for Logger(0);
  sub_10000D078(v14, (uint64_t)qword_100021D50);
  v15 = a2;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v46 = a1;
    v18 = swift_slowAlloc(12, -1);
    v45 = a3;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc(32, -1);
    v49 = a5;
    v44 = v20;
    aBlock[0] = v20;
    v47 = v13;
    *(_DWORD *)v19 = 136315138;
    v43 = v19 + 4;
    v21 = objc_msgSend(v15, "handle");
    v22 = v10;
    v23 = a4;
    v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    v48 = v11;
    v26 = v25;

    a1 = v46;
    v27 = v24;
    a4 = v23;
    v10 = v22;
    v51 = sub_100013D14(v27, v26, aBlock);
    v13 = v47;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, aBlock, v43, v19 + 12);

    v28 = v26;
    v11 = v48;
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Sending invite to participant %s", v19, 0xCu);
    v29 = v44;
    swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
    a5 = v49;
    swift_slowDealloc(v29, -1, -1);
    v30 = v19;
    a3 = v45;
    swift_slowDealloc(v30, -1, -1);

  }
  else
  {

  }
  v31 = *(void **)(a3 + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager);
  v32 = objc_msgSend(v15, "handle");
  if (!v32)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v34 = v33;
    v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v35 = *(unsigned __int8 *)(v11 + 80);
  v36 = (v35 + 32) & ~v35;
  v37 = swift_allocObject(&unk_10001CE10, v36 + v50, v35 | 7);
  *(_QWORD *)(v37 + 16) = v15;
  *(_QWORD *)(v37 + 24) = a5;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v37 + v36, v13, v10);
  aBlock[4] = (uint64_t)sub_1000118F8;
  v53 = v37;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100007688;
  aBlock[3] = (uint64_t)&unk_10001CE28;
  v38 = _Block_copy(aBlock);
  v39 = v53;
  v40 = v15;
  v41 = a5;
  swift_release(v39);
  objc_msgSend(v31, "sendInvitationToDestination:expirationDate:context:serverAcknowledgedBlock:", v32, 0, a4, v38);
  _Block_release(v38);

}

uint64_t sub_10000700C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  __objc2_prot_list *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  os_log_type_t type;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;

  if (a1)
  {
    v7 = objc_msgSend(a1, "description");
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v10 = v9;

    if (a2)
    {
LABEL_3:
      swift_errorRetain(a2);
      if (qword_1000214F0 != -1)
        swift_once(&qword_1000214F0, sub_100013054);
      v11 = type metadata accessor for Logger(0);
      sub_10000D078(v11, (uint64_t)qword_100021D50);
      v12 = a4;
      swift_errorRetain(a2);
      v13 = a3;
      v14 = v12;
      swift_bridgeObjectRetain(v10);
      swift_errorRetain(a2);
      v15 = v13;
      v16 = Logger.logObject.getter(v15);
      v17 = static os_log_type_t.default.getter();
      v18 = &KCSharingMessagingdXPCServer;
      if (os_log_type_enabled(v16, v17))
      {
        type = v17;
        v19 = swift_slowAlloc(42, -1);
        v54 = (uint64_t *)swift_slowAlloc(8, -1);
        v56 = swift_slowAlloc(96, -1);
        v59 = v56;
        *(_DWORD *)v19 = 136315906;
        swift_bridgeObjectRetain(v10);
        v58 = sub_100013D14(v8, v10, &v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v19 + 4, v19 + 12);
        swift_bridgeObjectRelease_n(v10, 3);
        *(_WORD *)(v19 + 12) = 2080;
        v20 = objc_msgSend(v15, "handle");
        v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
        v23 = v22;

        v58 = sub_100013D14(v21, v23, &v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v19 + 14, v19 + 22);

        swift_bridgeObjectRelease(v23);
        *(_WORD *)(v19 + 22) = 2080;
        v24 = objc_msgSend(v14, "groupID");
        v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        v27 = v26;

        v28 = v25;
        v18 = &KCSharingMessagingdXPCServer;
        v58 = sub_100013D14(v28, v27, &v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v19 + 24, v19 + 32);

        swift_bridgeObjectRelease(v27);
        *(_WORD *)(v19 + 32) = 2112;
        swift_errorRetain(a2);
        v29 = _swift_stdlib_bridgeErrorToNSError(a2);
        v58 = v29;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v19 + 34, v19 + 42);
        *v54 = v29;
        swift_errorRelease(a2);
        swift_errorRelease(a2);
        _os_log_impl((void *)&_mh_execute_header, v16, type, "IDS reports error sending invitation %s to %s for %s: %@", (uint8_t *)v19, 0x2Au);
        v30 = sub_1000032A0(&qword_1000218C0);
        swift_arrayDestroy(v54, 1, v30);
        swift_slowDealloc(v54, -1, -1);
        swift_arrayDestroy(v56, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v56, -1, -1);
        swift_slowDealloc(v19, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n(v10, 2);
        swift_errorRelease(a2);
        swift_errorRelease(a2);
      }

      v41 = objc_msgSend(v15, (SEL)v18[500].count);
      v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
      v44 = v43;

      v45 = (void *)_convertErrorToNSError(_:)(a2);
      v59 = v42;
      v60 = v44;
      v61 = v45;
      swift_bridgeObjectRetain(v44);
      v46 = v45;
      v47 = sub_1000032A0(&qword_1000219E8);
      CheckedContinuation.resume(returning:)(&v59, v47);
      swift_errorRelease(a2);

      return swift_bridgeObjectRelease(v44);
    }
  }
  else
  {
    v10 = 0xE500000000000000;
    v8 = 0x3E6C696E3CLL;
    if (a2)
      goto LABEL_3;
  }
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v31 = type metadata accessor for Logger(0);
  sub_10000D078(v31, (uint64_t)qword_100021D50);
  v32 = a4;
  v33 = swift_bridgeObjectRetain(v10);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc(22, -1);
    v57 = swift_slowAlloc(64, -1);
    v59 = v57;
    *(_DWORD *)v36 = 136315394;
    swift_bridgeObjectRetain(v10);
    v58 = sub_100013D14(v8, v10, &v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v36 + 4, v36 + 12);
    swift_bridgeObjectRelease_n(v10, 3);
    *(_WORD *)(v36 + 12) = 2080;
    v37 = objc_msgSend(v32, "groupID");
    v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
    v40 = v39;

    v58 = sub_100013D14(v38, v40, &v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v36 + 14, v36 + 22);

    swift_bridgeObjectRelease(v40);
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "IDS acknowledges sending %s for %s", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy(v57, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1, -1);
    swift_slowDealloc(v36, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v10, 2);
  }
  v49 = objc_msgSend(a3, "handle");
  v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
  v52 = v51;

  v59 = v50;
  v60 = v52;
  v61 = 0;
  v53 = sub_1000032A0(&qword_1000219E8);
  return CheckedContinuation.resume(returning:)(&v59, v53);
}

void sub_100007688(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

uint64_t sub_1000076FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v28[3];
  _QWORD v29[4];

  v4 = v3;
  v8 = sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin(v8);
  v10 = (char *)&v28[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011110(a1, (uint64_t)v10, &qword_1000215A0);
  v11 = type metadata accessor for TaskPriority(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_100010EC8((uint64_t)v10, &qword_1000215A0);
    v13 = 12544;
    v14 = *(_QWORD *)(a3 + 16);
    if (v14)
    {
LABEL_3:
      v15 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v14);
      swift_unknownObjectRetain(v14);
      v17 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v15);
      v19 = v18;
      swift_unknownObjectRelease(v14);
      goto LABEL_6;
    }
  }
  else
  {
    v20 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    v13 = v20 | 0x3100;
    v14 = *(_QWORD *)(a3 + 16);
    if (v14)
      goto LABEL_3;
  }
  v17 = 0;
  v19 = 0;
LABEL_6:
  v21 = *v4;
  v22 = swift_allocObject(&unk_10001CDE8, 32, 7);
  *(_QWORD *)(v22 + 16) = a2;
  *(_QWORD *)(v22 + 24) = a3;
  v23 = sub_1000032A0(&qword_100021980);
  v24 = (_QWORD *)(v19 | v17);
  if (v19 | v17)
  {
    v29[0] = 0;
    v29[1] = 0;
    v24 = v29;
    v29[2] = v17;
    v29[3] = v19;
  }
  v28[0] = 1;
  v28[1] = v24;
  v28[2] = v21;
  v25 = swift_task_create(v13, v28, v23, &unk_1000219E0, v22);
  return swift_release(v25);
}

uint64_t sub_1000078B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch(sub_1000078C8, 0, 0);
}

uint64_t sub_1000078C8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t i;
  id v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;

  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v1 = *(void **)(v0 + 24);
  v2 = type metadata accessor for Logger(0);
  sub_10000D078(v2, (uint64_t)qword_100021D50);
  v3 = Logger.logObject.getter(v1);
  v4 = static os_log_type_t.default.getter();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 24);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v29 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412290;
    *(_QWORD *)(v0 + 16) = v6;
    v8 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
    *v29 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Canceling pending invites for group %@", v7, 0xCu);
    v9 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v29, 1, v9);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {

  }
  v10 = *(char **)(v0 + 32);
  v11 = objc_msgSend(*(id *)(v0 + 24), "groupID");
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  v15 = *(void **)&v10[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
  v16 = objc_msgSend(v15, "pendingInvitations");
  v17 = sub_100011154(0, &qword_100021960, IDSSentInvitation_ptr);
  v18 = sub_100010940(&qword_100021968, &qword_100021960, IDSSentInvitation_ptr);
  v19 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v16, v17, v18);

  v20 = v10;
  sub_10000FB5C(v19, (uint64_t)v20, v12, v14);
  v22 = v21;

  result = swift_bridgeObjectRelease(v14);
  if (!((unint64_t)v22 >> 62))
  {
    v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v24)
      goto LABEL_8;
LABEL_20:
    swift_bridgeObjectRelease(v22);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (v22 < 0)
    v28 = v22;
  else
    v28 = v22 & 0xFFFFFFFFFFFFFF8;
  result = _CocoaArrayWrapper.endIndex.getter(v28);
  v24 = result;
  if (!result)
    goto LABEL_20;
LABEL_8:
  if (v24 >= 1)
  {
    for (i = 0; i != v24; ++i)
    {
      if ((v22 & 0xC000000000000001) != 0)
        v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v22);
      else
        v26 = *(id *)(v22 + 8 * i + 32);
      v27 = v26;
      if (objc_msgSend(v26, "state") == (id)1)
        objc_msgSend(v15, "cancelInvitation:serverAcknowledgedBlock:", v27, 0);

    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_100007BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return swift_task_switch(sub_100007C00, 0, 0);
}

uint64_t sub_100007C00()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  __objc2_prot_list *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  id v62;
  id v63;
  uint64_t v64[2];

  v1 = *(_QWORD *)(v0 + 40);
  if (!v1)
  {
    v16 = (_QWORD *)swift_task_alloc(dword_100021804);
    *(_QWORD *)(v0 + 56) = v16;
    *v16 = v0;
    v16[1] = sub_100008238;
    v17 = *(_QWORD *)(v0 + 48);
    v16[3] = *(_QWORD *)(v0 + 32);
    v16[4] = v17;
    return swift_task_switch(sub_1000078C8, 0, 0);
  }
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v3 = v0 + 32;
  v2 = *(void **)(v0 + 32);
  v4 = type metadata accessor for Logger(0);
  sub_10000D078(v4, (uint64_t)qword_100021D50);
  swift_bridgeObjectRetain_n(v1, 2);
  v5 = Logger.logObject.getter(v2);
  v6 = static os_log_type_t.default.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 32);
  v54 = v0;
  v59 = v1;
  if (v7)
  {
    v57 = (uint64_t *)(v0 + 16);
    v9 = swift_slowAlloc(22, -1);
    v60 = (_QWORD *)swift_slowAlloc(8, -1);
    v62 = (id)swift_slowAlloc(32, -1);
    v64[0] = (uint64_t)v62;
    *(_DWORD *)v9 = 136315394;
    v10 = swift_bridgeObjectRetain(v1);
    v11 = Array.description.getter(v10, &type metadata for String);
    v13 = v12;
    swift_bridgeObjectRelease(v1);
    *v57 = sub_100013D14(v11, v13, v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v57, v54 + 24, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease_n(v1, 2);
    swift_bridgeObjectRelease(v13);
    *(_WORD *)(v9 + 12) = 2112;
    *(_QWORD *)(v54 + 24) = v8;
    v14 = v8;
    v0 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v54 + 24, v3, v9 + 14, v9 + 22);
    *v60 = v8;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Canceling pending invites for participants %s in group %@", (uint8_t *)v9, 0x16u);
    v15 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v60, 1, v15);
    swift_slowDealloc(v60, -1, -1);
    swift_arrayDestroy(v62, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v62, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v1, 2);
  }
  v19 = *(char **)(v0 + 48);
  v20 = objc_msgSend(*(id *)(v0 + 32), "groupID", v54);
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  v23 = v22;

  v63 = *(id *)&v19[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
  v24 = objc_msgSend(v63, "pendingInvitations");
  v25 = sub_100011154(0, &qword_100021960, IDSSentInvitation_ptr);
  v26 = sub_100010940(&qword_100021968, &qword_100021960, IDSSentInvitation_ptr);
  v27 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v24, v25, v26);

  v28 = v19;
  sub_10000FB5C(v27, (uint64_t)v28, v21, v23);
  v30 = v29;

  result = swift_bridgeObjectRelease(v23);
  if (!((unint64_t)v30 >> 62))
  {
    v31 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
    v32 = v59;
    if (v31)
      goto LABEL_10;
LABEL_26:
    swift_bridgeObjectRelease(v30);
    return (*(uint64_t (**)(void))(v55 + 8))();
  }
  if (v30 < 0)
    v53 = v30;
  else
    v53 = v30 & 0xFFFFFFFFFFFFFF8;
  result = _CocoaArrayWrapper.endIndex.getter(v53);
  v31 = result;
  v32 = v59;
  if (!result)
    goto LABEL_26;
LABEL_10:
  if (v31 >= 1)
  {
    v33 = 0;
    v34 = v30 & 0xC000000000000001;
    v35 = &KCSharingMessagingdXPCServer;
    v56 = v30 & 0xC000000000000001;
    v58 = v31;
    do
    {
      if (v34)
        v36 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v33, v30);
      else
        v36 = *(id *)(v30 + 8 * v33 + 32);
      v37 = v36;
      if (objc_msgSend(v36, (SEL)v35[493].count) == (id)1)
      {
        v38 = objc_msgSend(v37, "destination");
        v39 = sub_100005008();
        swift_unknownObjectRelease(v38);
        LOBYTE(v38) = sub_10000F888(v32, v39);
        swift_bridgeObjectRelease(v39);
        if ((v38 & 1) == 0)
        {
          v40 = v37;
          v41 = Logger.logObject.getter(v40);
          v42 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v41, v42))
          {
            v43 = swift_slowAlloc(12, -1);
            v61 = swift_slowAlloc(32, -1);
            v64[0] = v61;
            *(_DWORD *)v43 = 136315138;
            v44 = objc_msgSend(v40, "destination");
            v45 = sub_100005008();
            swift_unknownObjectRelease(v44);
            v46 = Set.description.getter(v45, &type metadata for String, &protocol witness table for String);
            v47 = v30;
            v49 = v48;
            v50 = v45;
            v32 = v59;
            swift_bridgeObjectRelease(v50);
            *(_QWORD *)(v43 + 4) = sub_100013D14(v46, v49, v64);

            v51 = v49;
            v30 = v47;
            v31 = v58;
            swift_bridgeObjectRelease(v51);
            _os_log_impl((void *)&_mh_execute_header, v41, v42, "Canceling pending invite for %s", (uint8_t *)v43, 0xCu);
            swift_arrayDestroy(v61, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v61, -1, -1);
            v52 = v43;
            v34 = v56;
            swift_slowDealloc(v52, -1, -1);

          }
          else
          {

          }
          objc_msgSend(v63, "cancelInvitation:serverAcknowledgedBlock:", v40, 0);
          v35 = &KCSharingMessagingdXPCServer;
        }
      }
      ++v33;

    }
    while (v31 != v33);
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_100008238()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 56));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100008280(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch(sub_10000829C, 0, 0);
}

uint64_t sub_10000829C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  Class isa;
  NSString v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  id v21;
  NSString v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(char **)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager], "receivedInvitations");
  v5 = sub_100011154(0, &qword_100021908, IDSReceivedInvitation_ptr);
  v6 = sub_100010940(&qword_100021910, &qword_100021908, IDSReceivedInvitation_ptr);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v4, v5, v6);

  v8 = v2;
  swift_bridgeObjectRetain(v1);
  sub_100010124(v7, (uint64_t)v8, v3, v1);
  v10 = v9;
  *(_QWORD *)(v0 + 40) = v9;
  swift_bridgeObjectRelease(v7);

  swift_bridgeObjectRelease(v1);
  if (v10)
  {
    v11 = *(_QWORD *)(v0 + 32);
    v12 = sub_100008764((uint64_t)_swiftEmptyArrayStorage);
    v13 = *(_QWORD *)(v11
                    + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_schemaIdentifier
                    + 8);
    v14 = objc_allocWithZone((Class)IDSDictionaryInvitationContext);
    swift_bridgeObjectRetain(v13);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v13);
    v17 = objc_msgSend(v14, "initWithDictionary:schema:", isa, v16);
    *(_QWORD *)(v0 + 48) = v17;

    v18 = (_QWORD *)swift_task_alloc(48);
    *(_QWORD *)(v0 + 56) = v18;
    v18[2] = v11;
    v18[3] = v10;
    v18[4] = v17;
    v19 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 64) = v19;
    *v19 = v0;
    v19[1] = sub_100008548;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)();
  }
  else
  {
    v21 = objc_allocWithZone((Class)NSError);
    v22 = String._bridgeToObjectiveC()();
    objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 8, 0);

    swift_willThrow(v23);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100008548()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 64);
  *(_QWORD *)(*v1 + 72) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_1000085EC;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 56));
    v4 = sub_1000085B4;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000085B4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000085EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void **)(v0 + 40);

  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_100008630(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000032A0(&qword_1000219A8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100011110(v7, (uint64_t)&v16, &qword_1000219B0);
    v8 = v16;
    v9 = v17;
    result = sub_10000E274(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100011000(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100008764(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000032A0(&qword_100021950);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100011110(v7, (uint64_t)v16, &qword_100021958);
    result = sub_10000E3DC((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_100011000(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_1000088A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[5];
  uint64_t v17;

  v8 = sub_1000032A0(&qword_100021940);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v11 = *(void **)(a2 + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v12 = *(unsigned __int8 *)(v9 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = swift_allocObject(&unk_10001CD70, v13 + v10, v12 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_100010EAC;
  v17 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000089F8;
  aBlock[3] = &unk_10001CD88;
  v15 = _Block_copy(aBlock);
  swift_release(v17);
  objc_msgSend(v11, "acceptInvitation:withContext:serverAcknowledgedBlock:", a3, a4, v15);
  _Block_release(v15);
}

void sub_1000089F8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

uint64_t sub_100008A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch(sub_100008A68, 0, 0);
}

uint64_t sub_100008A68()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(char **)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager], "receivedInvitations");
  v5 = sub_100011154(0, &qword_100021908, IDSReceivedInvitation_ptr);
  v6 = sub_100010940(&qword_100021910, &qword_100021908, IDSReceivedInvitation_ptr);
  v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v4, v5, v6);

  v8 = v2;
  swift_bridgeObjectRetain(v1);
  sub_100010124(v7, (uint64_t)v8, v3, v1);
  v10 = v9;
  *(_QWORD *)(v0 + 40) = v9;
  swift_bridgeObjectRelease(v7);

  swift_bridgeObjectRelease(v1);
  if (!v10)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v11 = *(_QWORD *)(v0 + 32);
  v12 = swift_task_alloc(32);
  *(_QWORD *)(v0 + 48) = v12;
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v10;
  v13 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)
                                   + 1));
  *(_QWORD *)(v0 + 56) = v13;
  *v13 = v0;
  v13[1] = sub_100008C00;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)();
}

uint64_t sub_100008C00()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 56);
  *(_QWORD *)(*v1 + 64) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_100008CA0;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 48));
    v4 = sub_100008C6C;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100008C6C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008CA0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);

  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100008CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[5];
  uint64_t v15;

  v6 = sub_1000032A0(&qword_100021940);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  v9 = *(void **)(a2 + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = (v10 + 16) & ~v10;
  v12 = swift_allocObject(&unk_10001CD20, v11 + v8, v10 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_100010EAC;
  v15 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000089F8;
  aBlock[3] = &unk_10001CD38;
  v13 = _Block_copy(aBlock);
  swift_release(v15);
  objc_msgSend(v9, "declineInvitation:serverAcknowledgedBlock:", a3, v13);
  _Block_release(v13);
}

uint64_t sub_100008E20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v4 = a1;
    swift_errorRetain(a1);
    v1 = sub_1000032A0(&qword_100021940);
    return CheckedContinuation.resume(throwing:)(&v4, v1);
  }
  else
  {
    v3 = sub_1000032A0(&qword_100021940);
    return CheckedContinuation.resume(returning:)(v3, v3);
  }
}

uint64_t sub_100008E80(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  char *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  id v41;
  id v42;
  uint64_t v43;
  _QWORD *v45;
  id v46;
  uint64_t v47;
  os_log_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v5 = v4;
  v51 = a3;
  sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin();
  v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for UUID(0);
  v52 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin();
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v14 = type metadata accessor for Logger(0);
  sub_10000D078(v14, (uint64_t)qword_100021D50);
  v15 = a1;
  swift_bridgeObjectRetain_n(a4, 2);
  v16 = a2;
  v17 = v15;
  v18 = v16;
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.error.getter();
  v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    v22 = swift_slowAlloc(42, -1);
    v50 = v5;
    v23 = v22;
    v45 = (_QWORD *)swift_slowAlloc(16, -1);
    v49 = swift_slowAlloc(64, -1);
    v54 = v49;
    *(_DWORD *)v23 = 136315906;
    v48 = v19;
    swift_bridgeObjectRetain(a4);
    v53 = sub_100013D14(v51, a4, &v54);
    v47 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v23 + 4, v23 + 12);
    swift_bridgeObjectRelease_n(a4, 3);
    LODWORD(v51) = v21;
    *(_WORD *)(v23 + 12) = 2112;
    v53 = (uint64_t)v17;
    v24 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v23 + 14, v23 + 22);
    v25 = v45;
    *v45 = v17;

    *(_WORD *)(v23 + 22) = 2112;
    v46 = v17;
    v26 = v13;
    v53 = (uint64_t)v18;
    v27 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v23 + 24, v23 + 32);
    v25[1] = v18;

    *(_WORD *)(v23 + 32) = 2080;
    v28 = objc_msgSend(v24, "uniqueID");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v29 = sub_10000D32C(&qword_1000218D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
    v30 = v47;
    v31 = dispatch thunk of CustomStringConvertible.description.getter(v47, v29);
    v33 = v32;
    v34 = v26;
    v17 = v46;
    (*(void (**)(char *, uint64_t))(v52 + 8))(v34, v30);
    v53 = sub_100013D14(v31, v33, &v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v23 + 34, v23 + 42);
    swift_bridgeObjectRelease(v33);

    v19 = v48;
    _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v51, "Found duplicate invite for %s:\n%@\n%@, will decline %s", (uint8_t *)v23, 0x2Au);
    v35 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v25, 2, v35);
    swift_slowDealloc(v25, -1, -1);
    v36 = v49;
    swift_arrayDestroy(v49, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    v37 = v23;
    v5 = v50;
    swift_slowDealloc(v37, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(a4, 2);

  }
  v38 = os_transaction_create("com.apple.keychainsharingmessagingd.invitation.dupereject");
  static TaskPriority.background.getter();
  v39 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v10, 0, 1, v39);
  v40 = (_QWORD *)swift_allocObject(&unk_10001CCF8, 56, 7);
  v40[2] = 0;
  v40[3] = 0;
  v40[4] = v38;
  v40[5] = v17;
  v40[6] = v5;
  v41 = v17;
  swift_unknownObjectRetain(v38);
  v42 = v5;
  v43 = sub_1000094EC((uint64_t)v10, (uint64_t)&unk_100021938, (uint64_t)v40);
  swift_release(v43);
  swift_unknownObjectRelease(v38);
  return sub_100010EC8((uint64_t)v10, &qword_1000215A0);
}

uint64_t sub_10000931C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 24) = a5;
  *(_QWORD *)(v6 + 32) = a6;
  return swift_task_switch(sub_100009334, 0, 0);
}

uint64_t sub_100009334()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  _QWORD *v11;

  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v1 = *(void **)(v0 + 24);
  v2 = type metadata accessor for Logger(0);
  sub_10000D078(v2, (uint64_t)qword_100021D50);
  v3 = Logger.logObject.getter(v1);
  v4 = static os_log_type_t.default.getter();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 24);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412290;
    *(_QWORD *)(v0 + 16) = v6;
    v8 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
    *v11 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Declining duplicate invite %@", v7, 0xCu);
    v9 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v11, 1, v9);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {

  }
  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 32)+ OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager), "declineInvitation:serverAcknowledgedBlock:", *(_QWORD *)(v0 + 24), 0);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000094EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin();
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011110(a1, (uint64_t)v7, &qword_1000215A0);
  v8 = type metadata accessor for TaskPriority(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100010EC8((uint64_t)v7, &qword_1000215A0);
    v10 = 4096;
    v11 = *(_QWORD *)(a3 + 16);
    if (v11)
    {
LABEL_3:
      v12 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v11);
      swift_unknownObjectRetain(v11);
      v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
      v16 = v15;
      swift_unknownObjectRelease(v11);
      goto LABEL_6;
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    v10 = v17 | 0x1000;
    v11 = *(_QWORD *)(a3 + 16);
    if (v11)
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v18 = swift_allocObject(&unk_10001CCD0, 32, 7);
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0;
    v21[1] = 0;
    v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }
  else
  {
    v19 = 0;
  }
  return swift_task_create(v10, v19, (char *)&type metadata for () + 8, &unk_100021600, v18);
}

uint64_t sub_100009684()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1[3] = v0;
  v2 = type metadata accessor for Date(0);
  v1[4] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[5] = v3;
  v4 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[6] = swift_task_alloc(v4);
  v1[7] = swift_task_alloc(v4);
  return swift_task_switch(sub_1000096F4, 0, 0);
}

uint64_t sub_1000096F4()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  char v35;
  void (*v36)(uint64_t, uint64_t);
  id v37;
  uint64_t v38;
  unint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v47;
  unint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  char v54;
  uint64_t *v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v64;
  __int128 *v65;
  id v66;
  void *v67;
  uint64_t v68;
  __int128 v69;

  if (qword_1000214F0 != -1)
    goto LABEL_29;
  while (1)
  {
    v1 = type metadata accessor for Logger(0);
    v2 = sub_10000D078(v1, (uint64_t)qword_100021D50);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "fetching all received invites", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }
    v6 = (char *)*((_QWORD *)v0 + 3);

    v7 = objc_msgSend(*(id *)&v6[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager], "receivedInvitations");
    v8 = sub_100011154(0, &qword_100021908, IDSReceivedInvitation_ptr);
    v9 = sub_100010940(&qword_100021910, &qword_100021908, IDSReceivedInvitation_ptr);
    v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v7, v8, v9);

    v11 = v6;
    sub_100010A70(v10);
    v13 = v12;
    swift_bridgeObjectRelease(v10);

    v14 = *(_QWORD *)(v13 + 16);
    v65 = v0;
    if (!v14)
      break;
    v64 = *((_QWORD *)v0 + 5);
    v0 = (__int128 *)(v13 + 32);
    while (1)
    {
      v68 = v14;
      v69 = *v0;
      v18 = *(id *)v0;
      v19 = *((id *)&v69 + 1);
      v20 = objc_msgSend(v19, "groupID");
      v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
      v23 = v22;

      if (_swiftEmptyDictionarySingleton[2])
      {
        v24 = sub_10000E274(v21, v23);
        if ((v25 & 1) != 0)
        {
          v67 = v18;
          v26 = *((_QWORD *)v65 + 6);
          v27 = *((_QWORD *)v65 + 7);
          v28 = *((_QWORD *)v65 + 4);
          v29 = _swiftEmptyDictionarySingleton[7] + 16 * v24;
          v30 = *(void **)(v29 + 8);
          v66 = *(id *)v29;
          v31 = v30;
          swift_bridgeObjectRelease(v23);
          v32 = objc_msgSend(v19, "sentTime");
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          v33 = objc_msgSend(v31, "sentTime");
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          v34 = sub_10000D32C(&qword_100021918, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
          v35 = dispatch thunk of static Comparable.< infix(_:_:)(v26, v27, v28, v34);
          v36 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
          v36(v26, v28);
          v36(v27, v28);
          v37 = objc_msgSend(v19, "groupID");
          v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
          v23 = v39;

          if ((v35 & 1) == 0)
          {
            sub_100008E80(v67, v66, v38, v23);

            v17 = v23;
            goto LABEL_8;
          }
          v18 = v67;
          sub_100008E80(v66, v67, v38, v23);

        }
      }
      swift_bridgeObjectRelease(v23);
      v40 = objc_msgSend(v19, "groupID");
      v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
      v43 = v42;

      v44 = v18;
      v45 = v19;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
      v48 = sub_10000E274(v41, v43);
      v49 = _swiftEmptyDictionarySingleton[2];
      v50 = (v47 & 1) == 0;
      v51 = v49 + v50;
      if (__OFADD__(v49, v50))
        break;
      v52 = v47;
      if (_swiftEmptyDictionarySingleton[3] >= v51)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v47 & 1) == 0)
            goto LABEL_20;
        }
        else
        {
          sub_10000F328();
          if ((v52 & 1) == 0)
            goto LABEL_20;
        }
      }
      else
      {
        sub_10000E4FC(v51, isUniquelyReferenced_nonNull_native);
        v53 = sub_10000E274(v41, v43);
        if ((v52 & 1) != (v54 & 1))
          return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
        v48 = v53;
        if ((v52 & 1) == 0)
        {
LABEL_20:
          _swiftEmptyDictionarySingleton[(v48 >> 6) + 8] |= 1 << v48;
          v55 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 16 * v48);
          *v55 = v41;
          v55[1] = v43;
          *(_OWORD *)(_swiftEmptyDictionarySingleton[7] + 16 * v48) = v69;
          v56 = _swiftEmptyDictionarySingleton[2];
          v57 = __OFADD__(v56, 1);
          v58 = v56 + 1;
          if (v57)
            goto LABEL_28;
          _swiftEmptyDictionarySingleton[2] = v58;
          swift_bridgeObjectRetain(v43);
          goto LABEL_7;
        }
      }
      v15 = _swiftEmptyDictionarySingleton[7] + 16 * v48;
      v16 = *(void **)v15;

      *(_OWORD *)v15 = v69;
LABEL_7:

      swift_bridgeObjectRelease(v43);
      v17 = 0x8000000000000000;
LABEL_8:
      swift_bridgeObjectRelease(v17);
      ++v0;
      v14 = v68 - 1;
      if (v68 == 1)
        goto LABEL_25;
    }
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_once(&qword_1000214F0, sub_100013054);
  }
LABEL_25:
  v59 = *((_QWORD *)v65 + 6);
  v60 = *((_QWORD *)v65 + 7);
  swift_bridgeObjectRelease(v13);
  v61 = swift_bridgeObjectRetain(_swiftEmptyDictionarySingleton);
  v62 = sub_100009EC4(v61);
  swift_bridgeObjectRelease_n(_swiftEmptyDictionarySingleton, 2);
  swift_task_dealloc(v60);
  swift_task_dealloc(v59);
  return (*((uint64_t (**)(void *))v65 + 1))(v62);
}

uint64_t sub_100009C7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  uint64_t v11;
  NSString v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;

  v2 = a1 + 56;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 56);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v8 = 0;
  v23 = _swiftEmptyArrayStorage;
  if (!v5)
    goto LABEL_7;
LABEL_4:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (i = v9 | (v8 << 6); ; i = __clz(__rbit64(v15)) + (v8 << 6))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * i + 8);
    swift_bridgeObjectRetain(v11);
    v12 = String._bridgeToObjectiveC()();
    v13 = objc_msgSend(v12, "_stripFZIDPrefix");

    if (v13)
    {
      v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      v22 = v18;
      swift_bridgeObjectRelease(v11);

      result = swift_isUniquelyReferenced_nonNull_native(v23);
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_10000D090(0, v23[2] + 1, 1, v23);
        v23 = (_QWORD *)result;
      }
      v20 = v23[2];
      v19 = v23[3];
      if (v20 >= v19 >> 1)
      {
        result = (uint64_t)sub_10000D090((_QWORD *)(v19 > 1), v20 + 1, 1, v23);
        v23 = (_QWORD *)result;
      }
      v23[2] = v20 + 1;
      v21 = &v23[2 * v20];
      v21[4] = v17;
      v21[5] = v22;
      if (v5)
        goto LABEL_4;
    }
    else
    {
      result = swift_bridgeObjectRelease(v11);
      if (v5)
        goto LABEL_4;
    }
LABEL_7:
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v14 >= v6)
      goto LABEL_29;
    v15 = *(_QWORD *)(v2 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v6)
        goto LABEL_29;
      v15 = *(_QWORD *)(v2 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v6)
          goto LABEL_29;
        v15 = *(_QWORD *)(v2 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v6)
            goto LABEL_29;
          v15 = *(_QWORD *)(v2 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v5 = (v15 - 1) & v15;
  }
  v16 = v14 + 4;
  if (v16 >= v6)
  {
LABEL_29:
    swift_release(a1);
    return (uint64_t)v23;
  }
  v15 = *(_QWORD *)(v2 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v6)
      goto LABEL_29;
    v15 = *(_QWORD *)(v2 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

void *sub_100009EC4(uint64_t a1)
{
  uint64_t v2;
  void *result;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 16);
  result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v2);
    result = (void *)sub_10000FA14(a1);
    v4 = (uint64_t)result;
    v6 = v5;
    v7 = 0;
    v8 = a1 + 64;
    v19 = v2;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(_BYTE *)(a1 + 32))
    {
      v10 = (unint64_t)v4 >> 6;
      if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0)
        goto LABEL_22;
      if (*(_DWORD *)(a1 + 36) != v6)
        goto LABEL_23;
      v20 = v7;
      v11 = *(id *)(*(_QWORD *)(a1 + 56) + 16 * v4 + 8);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      v12 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v12);
      v13 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v11);
      result = (void *)specialized ContiguousArray._endMutation()(v13);
      v9 = 1 << *(_BYTE *)(a1 + 32);
      if (v4 >= v9)
        goto LABEL_24;
      v14 = *(_QWORD *)(v8 + 8 * v10);
      if ((v14 & (1 << v4)) == 0)
        goto LABEL_25;
      if (*(_DWORD *)(a1 + 36) != v6)
        goto LABEL_26;
      v15 = v14 & (-2 << (v4 & 0x3F));
      if (v15)
      {
        v9 = __clz(__rbit64(v15)) | v4 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        v16 = v10 + 1;
        v17 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v17)
        {
          v18 = *(_QWORD *)(v8 + 8 * v16);
          if (v18)
          {
LABEL_18:
            v9 = __clz(__rbit64(v18)) + (v16 << 6);
          }
          else
          {
            while (v17 - 2 != v10)
            {
              v18 = *(_QWORD *)(a1 + 80 + 8 * v10++);
              if (v18)
              {
                v16 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      v7 = v20 + 1;
      v4 = v9;
      if (v20 + 1 == v19)
        return &_swiftEmptyArrayStorage;
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

void sub_10000A0A4(void *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  int *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint8_t *v27;
  int *v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  NSString v41;
  _QWORD *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  int *v46;
  uint64_t *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  int *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  _QWORD *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  int *v80;
  uint64_t *v81;
  id v82;
  NSString v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  int *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  int *v102;
  uint64_t v103;

  v3 = v1;
  v5 = (_QWORD *)type metadata accessor for Logger(0);
  v6 = *(v5 - 1);
  __chkstk_darwin(v5);
  v8 = (char *)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v88 = *(_QWORD *)(v9 - 8);
  v89 = v9;
  __chkstk_darwin(v9);
  v90 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for URL(0);
  v92 = *(_QWORD *)(v11 - 8);
  v93 = v11;
  __chkstk_darwin(v11);
  v97 = (uint64_t *)((char *)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v98 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  __chkstk_darwin(v98);
  v14 = (uint64_t *)((char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v15 = sub_10000D078((uint64_t)v5, (uint64_t)qword_100021D50);
  v16 = a1;
  v96 = v15;
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.info.getter();
  v19 = os_log_type_enabled(v17, v18);
  v94 = v8;
  v95 = v6;
  if (v19)
  {
    v91 = v5;
    v20 = swift_slowAlloc(12, -1);
    v87 = v3;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc(8, -1);
    v99 = v14;
    v86 = (_QWORD *)v22;
    *(_DWORD *)v21 = 138412290;
    v102 = v16;
    v23 = v16;
    v5 = v91;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v102, &v103, v21 + 4, v21 + 12);
    v24 = v86;
    *v86 = v16;

    _os_log_impl((void *)&_mh_execute_header, v17, v18, "creating KCSharingGroup object from invite %@", v21, 0xCu);
    v25 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v24, 1, v25);
    v26 = v24;
    v14 = v99;
    swift_slowDealloc(v26, -1, -1);
    v27 = v21;
    v3 = v87;
    swift_slowDealloc(v27, -1, -1);
  }
  else
  {

  }
  sub_10000A97C(v16, v14);
  if (!v2)
  {
    v28 = v16;
    v29 = v98[7];
    v99 = v14;
    v30 = (uint64_t *)((char *)v14 + v29);
    v32 = *v30;
    v31 = v30[1];
    v33 = v3;
    v34 = *(void **)&v3[OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager];
    swift_bridgeObjectRetain(v31);
    v35 = objc_msgSend(v34, "internal");
    v36 = objc_msgSend(v35, "aliases");

    if (v36)
    {
      v37 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v36, &type metadata for String, &protocol witness table for String);

      swift_bridgeObjectRetain(v31);
      v38 = sub_10001054C(v37, v32, v31);
      swift_bridgeObjectRelease(v31);
      swift_bridgeObjectRelease(v37);
      if ((v38 & 1) == 0)
      {
        v65 = v34;
        v66 = v32;
        v67 = (uint64_t)v94;
        v68 = v95;
        (*(void (**)(char *, uint64_t, _QWORD *))(v95 + 16))(v94, v96, v5);
        v69 = v33;
        swift_bridgeObjectRetain(v31);
        v70 = v5;
        v5 = v69;
        v71 = Logger.logObject.getter(v5);
        v72 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v71, v72))
        {
          v91 = v70;
          v73 = swift_slowAlloc(22, -1);
          v98 = (int *)swift_slowAlloc(64, -1);
          v102 = v98;
          *(_DWORD *)v73 = 136315394;
          swift_bridgeObjectRetain(v31);
          v100 = sub_100013D14(v66, v31, (uint64_t *)&v102);
          v97 = &v101;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v73 + 4, v73 + 12);
          swift_bridgeObjectRelease_n(v31, 3);
          *(_WORD *)(v73 + 12) = 2080;
          v74 = objc_msgSend(v65, "internal");
          v75 = objc_msgSend(v74, "aliases");

          if (!v75)
          {
LABEL_24:

            __break(1u);
            return;
          }
          v76 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v75, &type metadata for String, &protocol witness table for String);

          v77 = Set.description.getter(v76, &type metadata for String, &protocol witness table for String);
          v79 = v78;
          swift_bridgeObjectRelease(v76);
          v100 = sub_100013D14(v77, v79, (uint64_t *)&v102);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, v97, v73 + 14, v73 + 22);
          swift_bridgeObjectRelease(v79);

          _os_log_impl((void *)&_mh_execute_header, v71, v72, "received invitee handle %s is not a valid alias for this account. all aliases: %s", (uint8_t *)v73, 0x16u);
          v80 = v98;
          swift_arrayDestroy(v98, 2, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v80, -1, -1);
          swift_slowDealloc(v73, -1, -1);

          (*(void (**)(char *, _QWORD *))(v95 + 8))(v94, v91);
        }
        else
        {
          swift_bridgeObjectRelease_n(v31, 2);

          (*(void (**)(uint64_t, _QWORD *))(v68 + 8))(v67, v70);
        }
        v81 = v99;
        v82 = objc_allocWithZone((Class)NSError);
        v83 = String._bridgeToObjectiveC()();
        objc_msgSend(v82, "initWithDomain:code:userInfo:", v83, 6, 0);

        swift_willThrow(v84);
        sub_1000106FC((uint64_t)v81);
        return;
      }
      v39 = v99;
      v40 = v99[1];
      v94 = (char *)*v99;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v92 + 16))(v97, (uint64_t)v99 + v98[5], v93);
      v93 = v40;
      swift_bridgeObjectRetain(v40);
      v41 = objc_msgSend(v28, "fromID");
      if (!v41)
      {
        ((void (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
        v5 = v42;
        v41 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v5);
      }
      v95 = v32;
      v43 = objc_msgSend(v41, "_stripFZIDPrefix");

      if (v43)
      {
        v92 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
        v45 = v44;

        v46 = v98;
        v47 = (uint64_t *)((char *)v39 + v98[6]);
        v48 = *v47;
        v49 = v47[1];
        v50 = (uint64_t)v90;
        (*(void (**)(char *, char *, uint64_t))(v88 + 16))(v90, (char *)v39 + v98[8], v89);
        v51 = (uint64_t *)((char *)v39 + v46[9]);
        v52 = *v51;
        v53 = v51[1];
        v54 = objc_allocWithZone((Class)KCSharingGroupInvite);
        sub_1000108B8(v48, v49);
        swift_bridgeObjectRetain(v53);
        v55 = sub_100010738((uint64_t)v94, v93, (uint64_t)v97, v92, v45, v95, v31, v48, v49, v50, v52, v53);
        sub_10000E320(v48, v49);
        v56 = v55;
        v57 = Logger.logObject.getter(v56);
        v58 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v57, v58))
        {
          v59 = (uint8_t *)swift_slowAlloc(12, -1);
          v98 = (int *)swift_slowAlloc(32, -1);
          v102 = v98;
          *(_DWORD *)v59 = 136315138;
          v97 = (uint64_t *)(v59 + 4);
          v60 = objc_msgSend(v56, "groupID");
          v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
          v63 = v62;

          v100 = sub_100013D14(v61, v63, (uint64_t *)&v102);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, &v101, v97, v59 + 12);
          swift_bridgeObjectRelease(v63);

          _os_log_impl((void *)&_mh_execute_header, v57, v58, "Created group invite for %s", v59, 0xCu);
          v64 = v98;
          swift_arrayDestroy(v98, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v64, -1, -1);
          swift_slowDealloc(v59, -1, -1);

        }
        else
        {

        }
        sub_1000106FC((uint64_t)v99);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_24;
  }
}

uint64_t sub_10000A97C@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  id v37;
  NSString v38;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  int v48;
  os_log_t v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[3];
  char v53[8];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v4 = v2;
  v7 = sub_1000032A0(&qword_1000215A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a1, "context");
  v11 = objc_opt_self(IDSDictionaryInvitationContext);
  v12 = (void *)swift_dynamicCastObjCClass(v10, v11);
  if (v12)
  {
    v13 = objc_msgSend(v12, "dictionary");
    v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000AE88(v14, a2);
    if (v3)
    {
      if (qword_1000214F0 != -1)
        swift_once(&qword_1000214F0, sub_100013054);
      v15 = type metadata accessor for Logger(0);
      sub_10000D078(v15, (uint64_t)qword_100021D50);
      v16 = a1;
      swift_errorRetain(v3);
      v17 = v16;
      v18 = swift_errorRetain(v3);
      v19 = Logger.logObject.getter(v18);
      v20 = static os_log_type_t.error.getter();
      v21 = v20;
      if (os_log_type_enabled(v19, v20))
      {
        v22 = swift_slowAlloc(22, -1);
        v51 = v4;
        v23 = v22;
        v47 = (_QWORD *)swift_slowAlloc(8, -1);
        v50 = swift_slowAlloc(32, -1);
        v56 = v50;
        *(_DWORD *)v23 = 138412546;
        v49 = v19;
        v54 = (uint64_t)v17;
        v24 = v17;
        v48 = v21;
        v25 = v24;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v23 + 4, v23 + 12);
        v26 = v47;
        *v47 = v17;

        *(_WORD *)(v23 + 12) = 2080;
        swift_getErrorValue(v3, v53, v52);
        v27 = Error.localizedDescription.getter(v52[1], v52[2]);
        v29 = v28;
        v54 = sub_100013D14(v27, v28, &v56);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v23 + 14, v23 + 22);
        swift_bridgeObjectRelease(v29);
        swift_errorRelease(v3);
        swift_errorRelease(v3);
        v19 = v49;
        _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v48, "Failed to extract payload for invitation %@: %s", (uint8_t *)v23, 0x16u);
        v30 = sub_1000032A0(&qword_1000218C0);
        swift_arrayDestroy(v26, 1, v30);
        swift_slowDealloc(v26, -1, -1);
        v31 = v50;
        swift_arrayDestroy(v50, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v31, -1, -1);
        v32 = v23;
        v4 = v51;
        swift_slowDealloc(v32, -1, -1);
      }
      else
      {

        swift_errorRelease(v3);
        swift_errorRelease(v3);
      }

      v40 = os_transaction_create("com.apple.keychainsharingmessagingd.invitation.autoreject");
      static TaskPriority.background.getter();
      v41 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v9, 0, 1, v41);
      v42 = (_QWORD *)swift_allocObject(&unk_10001CCA8, 56, 7);
      v42[2] = 0;
      v42[3] = 0;
      v42[4] = v40;
      v42[5] = v17;
      v42[6] = v4;
      v43 = v17;
      swift_unknownObjectRetain(v40);
      v44 = v4;
      v45 = sub_1000094EC((uint64_t)v9, (uint64_t)&unk_1000218B8, (uint64_t)v42);
      swift_release(v45);
      v46 = sub_100010EC8((uint64_t)v9, &qword_1000215A0);
      swift_willThrow(v46);
      swift_unknownObjectRelease(v40);
    }
    return swift_unknownObjectRelease(v10);
  }
  else
  {
    swift_unknownObjectRelease(v10);
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v33 = type metadata accessor for Logger(0);
    sub_10000D078(v33, (uint64_t)qword_100021D50);
    v34 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v35 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "early return failed cast", v36, 2u);
      swift_slowDealloc(v36, -1, -1);
    }

    v37 = objc_allocWithZone((Class)NSError);
    v38 = String._bridgeToObjectiveC()();
    objc_msgSend(v37, "initWithDomain:code:userInfo:", v38, 9, 0);

    return ((uint64_t (*)(void))swift_willThrow)();
  }
}

uint64_t sub_10000AE88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  id v56;
  NSString v57;
  uint64_t result;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  id v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  id v83;
  NSString v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  uint8_t *v88;
  id v89;
  NSString v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  id v95;
  NSString v96;
  int v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t *v100;
  unint64_t v101;
  int *v102;
  _QWORD *v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t v106;
  void (*v107)(char *, char *, uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t *v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;

  v116 = a2;
  sub_1000032A0(&qword_1000218E0);
  ((void (*)(void))__chkstk_darwin)();
  v4 = (char *)&v106 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = type metadata accessor for Date(0);
  v119 = *(_QWORD *)(v124 - 8);
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v118 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v117 = (char *)&v106 - v7;
  v8 = sub_1000032A0(&qword_1000218E8);
  __chkstk_darwin(v8);
  v10 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000032A0(&qword_1000218F0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v106 - v16;
  v18 = type metadata accessor for URL(0);
  v19 = __chkstk_darwin(v18);
  __chkstk_darwin(v19);
  v23 = (char *)&v106 - v20;
  if (qword_1000214B0 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_3;
LABEL_31:
    v122 = 0u;
    v123 = 0u;
    goto LABEL_32;
  }
  v112 = v22;
  v113 = (char *)&v106 - v20;
  v115 = v21;
  swift_once(&qword_1000214B0, sub_100003DEC);
  v22 = v112;
  v23 = v113;
  v21 = v115;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_31;
LABEL_3:
  v112 = v22;
  v113 = v23;
  v114 = v18;
  v115 = v21;
  v24 = qword_1000216F8;
  v25 = qword_1000216F0;
  swift_bridgeObjectRetain(qword_1000216F8);
  v26 = sub_10000E274(v25, v24);
  if ((v27 & 1) == 0)
  {
    v122 = 0u;
    v123 = 0u;
    swift_bridgeObjectRelease(v24);
    goto LABEL_32;
  }
  sub_10000E3A0(*(_QWORD *)(a1 + 56) + 32 * v26, (uint64_t)&v122);
  swift_bridgeObjectRelease(v24);
  if (!*((_QWORD *)&v123 + 1))
  {
LABEL_32:
    swift_bridgeObjectRelease(a1);
    sub_100010EC8((uint64_t)&v122, &qword_1000218F8);
    goto LABEL_33;
  }
  if ((swift_dynamicCast(&v120, &v122, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
    swift_bridgeObjectRelease(a1);
LABEL_33:
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v52 = type metadata accessor for Logger(0);
    sub_10000D078(v52, (uint64_t)qword_100021D50);
    v53 = Logger.logObject.getter();
    v54 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v55 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Invitation lacks GroupID", v55, 2u);
      swift_slowDealloc(v55, -1, -1);
    }

    v56 = objc_allocWithZone((Class)NSError);
    v57 = String._bridgeToObjectiveC()();
    objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 2, 0);
    goto LABEL_38;
  }
  v28 = v120;
  v111 = v121;
  if (qword_1000214B8 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_8;
LABEL_49:
    v122 = 0u;
    v123 = 0u;
LABEL_50:
    sub_100010EC8((uint64_t)&v122, &qword_1000218F8);
    goto LABEL_51;
  }
  swift_once(&qword_1000214B8, sub_100003E10);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_49;
LABEL_8:
  v110 = v28;
  v29 = qword_100021708;
  v30 = qword_100021700;
  swift_bridgeObjectRetain(qword_100021708);
  v31 = sub_10000E274(v30, v29);
  if ((v32 & 1) != 0)
  {
    sub_10000E3A0(*(_QWORD *)(a1 + 56) + 32 * v31, (uint64_t)&v122);
  }
  else
  {
    v122 = 0u;
    v123 = 0u;
  }
  swift_bridgeObjectRelease(v29);
  if (!*((_QWORD *)&v123 + 1))
    goto LABEL_50;
  if ((swift_dynamicCast(&v120, &v122, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
LABEL_51:
    v36 = v114;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_52;
  }
  v33 = v120;
  v34 = v121;
  swift_bridgeObjectRetain(v121);
  URL.init(string:)(v33, v34);
  swift_bridgeObjectRelease(v34);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  swift_bridgeObjectRelease(v34);
  v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  v36 = v114;
  if (v35 == 1)
  {
LABEL_52:
    v39 = &qword_1000218E8;
    v40 = (uint64_t)v10;
    goto LABEL_53;
  }
  sub_10000E2D8((uint64_t)v10, (uint64_t)v15);
  v37 = v115;
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v115 + 48);
  if (v38(v15, 1, v36) == 1)
  {
    v39 = &qword_1000218F0;
    v40 = (uint64_t)v15;
LABEL_53:
    sub_100010EC8(v40, v39);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v115 + 56))(v17, 1, 1, v36);
    goto LABEL_54;
  }
  v41 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  v41(v17, v15, v36);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v17, 0, 1, v36);
  if (v38(v17, 1, v36) == 1)
  {
LABEL_54:
    swift_bridgeObjectRelease(a1);
    swift_bridgeObjectRelease(v111);
    sub_100010EC8((uint64_t)v17, &qword_1000218F0);
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v64 = type metadata accessor for Logger(0);
    sub_10000D078(v64, (uint64_t)qword_100021D50);
    v65 = Logger.logObject.getter();
    v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v67 = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Invitation lacks ShareURL", v67, 2u);
      swift_slowDealloc(v67, -1, -1);
    }

    v68 = objc_allocWithZone((Class)NSError);
    v57 = String._bridgeToObjectiveC()();
    objc_msgSend(v68, "initWithDomain:code:userInfo:", v57, 3, 0);
LABEL_38:

    return swift_willThrow();
  }
  v41(v113, v17, v36);
  if (qword_1000214C0 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_21;
LABEL_69:
    v122 = 0u;
    v123 = 0u;
LABEL_70:
    swift_bridgeObjectRelease(a1);
    swift_bridgeObjectRelease(v111);
    sub_100010EC8((uint64_t)&v122, &qword_1000218F8);
    goto LABEL_71;
  }
  swift_once(&qword_1000214C0, sub_100003E34);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_69;
LABEL_21:
  v42 = qword_100021718;
  v43 = qword_100021710;
  swift_bridgeObjectRetain(qword_100021718);
  v44 = sub_10000E274(v43, v42);
  if ((v45 & 1) != 0)
  {
    sub_10000E3A0(*(_QWORD *)(a1 + 56) + 32 * v44, (uint64_t)&v122);
  }
  else
  {
    v122 = 0u;
    v123 = 0u;
  }
  swift_bridgeObjectRelease(v42);
  if (!*((_QWORD *)&v123 + 1))
    goto LABEL_70;
  if ((swift_dynamicCast(&v120, &v122, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) == 0)
  {
    swift_bridgeObjectRelease(a1);
    swift_bridgeObjectRelease(v111);
LABEL_71:
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v79 = type metadata accessor for Logger(0);
    sub_10000D078(v79, (uint64_t)qword_100021D50);
    v80 = Logger.logObject.getter();
    v81 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v82 = 0;
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "Invitation lacks invitation data", v82, 2u);
      swift_slowDealloc(v82, -1, -1);
    }

    v83 = objc_allocWithZone((Class)NSError);
    v84 = String._bridgeToObjectiveC()();
    objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 4, 0);

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v115 + 8))(v113, v36);
  }
  v47 = v120;
  v46 = v121;
  if (qword_1000214C8 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_28;
LABEL_78:
    v122 = 0u;
    v123 = 0u;
LABEL_79:
    swift_bridgeObjectRelease(a1);
    swift_bridgeObjectRelease(v111);
    sub_100010EC8((uint64_t)&v122, &qword_1000218F8);
    goto LABEL_80;
  }
  swift_once(&qword_1000214C8, sub_100003E64);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_78;
LABEL_28:
  v48 = qword_100021728;
  v49 = qword_100021720;
  swift_bridgeObjectRetain(qword_100021728);
  v50 = sub_10000E274(v49, v48);
  if ((v51 & 1) != 0)
  {
    sub_10000E3A0(*(_QWORD *)(a1 + 56) + 32 * v50, (uint64_t)&v122);
  }
  else
  {
    v122 = 0u;
    v123 = 0u;
  }
  swift_bridgeObjectRelease(v48);
  if (!*((_QWORD *)&v123 + 1))
    goto LABEL_79;
  if ((swift_dynamicCast(&v120, &v122, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0)
  {
    swift_bridgeObjectRelease(a1);
    swift_bridgeObjectRelease(v111);
LABEL_80:
    if (qword_1000214F0 != -1)
      swift_once(&qword_1000214F0, sub_100013054);
    v85 = type metadata accessor for Logger(0);
    sub_10000D078(v85, (uint64_t)qword_100021D50);
    v86 = Logger.logObject.getter();
    v87 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v86, v87))
    {
      v88 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v88 = 0;
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "Invitation lacks inviteeHandle", v88, 2u);
      swift_slowDealloc(v88, -1, -1);
    }

    v89 = objc_allocWithZone((Class)NSError);
    v90 = String._bridgeToObjectiveC()();
    objc_msgSend(v89, "initWithDomain:code:userInfo:", v90, 5, 0);

    swift_willThrow();
    sub_10000E320(v47, v46);
    return (*(uint64_t (**)(char *, uint64_t))(v115 + 8))(v113, v36);
  }
  v59 = v121;
  v108 = v120;
  v109 = v47;
  if (qword_1000214D0 == -1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_45;
LABEL_86:
    v122 = 0u;
    v123 = 0u;
LABEL_87:
    sub_100010EC8((uint64_t)&v122, &qword_1000218F8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v119 + 56))(v4, 1, 1, v124);
    goto LABEL_88;
  }
  swift_once(&qword_1000214D0, sub_100003E94);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_86;
LABEL_45:
  v60 = qword_100021738;
  v61 = qword_100021730;
  swift_bridgeObjectRetain(qword_100021738);
  v62 = sub_10000E274(v61, v60);
  if ((v63 & 1) != 0)
  {
    sub_10000E3A0(*(_QWORD *)(a1 + 56) + 32 * v62, (uint64_t)&v122);
  }
  else
  {
    v122 = 0u;
    v123 = 0u;
  }
  swift_bridgeObjectRelease(v60);
  if (!*((_QWORD *)&v123 + 1))
    goto LABEL_87;
  v69 = v124;
  v70 = swift_dynamicCast(v4, &v122, (char *)&type metadata for Any + 8, v124, 6);
  v71 = v119;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v119 + 56))(v4, v70 ^ 1u, 1, v69);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v4, 1, v69) != 1)
  {
    v72 = v119;
    v73 = v117;
    v74 = v124;
    v107 = *(void (**)(char *, char *, uint64_t))(v119 + 32);
    v107(v117, v4, v124);
    (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v112, v113, v114);
    (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v118, v73, v74);
    if (qword_1000214D8 == -1)
    {
      if (*(_QWORD *)(a1 + 16))
      {
LABEL_64:
        v75 = qword_100021748;
        v76 = qword_100021740;
        swift_bridgeObjectRetain(qword_100021748);
        v77 = sub_10000E274(v76, v75);
        if ((v78 & 1) != 0)
        {
          sub_10000E3A0(*(_QWORD *)(a1 + 56) + 32 * v77, (uint64_t)&v122);
        }
        else
        {
          v122 = 0u;
          v123 = 0u;
        }
        swift_bridgeObjectRelease(v75);
LABEL_95:
        swift_bridgeObjectRelease(a1);
        (*(void (**)(char *, uint64_t))(v119 + 8))(v117, v124);
        (*(void (**)(char *, uint64_t))(v115 + 8))(v113, v114);
        if (*((_QWORD *)&v123 + 1))
        {
          v97 = swift_dynamicCast(&v120, &v122, (char *)&type metadata for Any + 8, &type metadata for String, 6);
          if (v97)
            v98 = v120;
          else
            v98 = 0;
          if (v97)
            v99 = v121;
          else
            v99 = 0;
        }
        else
        {
          sub_100010EC8((uint64_t)&v122, &qword_1000218F8);
          v98 = 0;
          v99 = 0;
        }
        v100 = v116;
        v101 = v111;
        *v116 = v110;
        v100[1] = v101;
        v102 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
        v41((char *)v100 + v102[5], v112, v114);
        v103 = (uint64_t *)((char *)v100 + v102[6]);
        *v103 = v109;
        v103[1] = v46;
        v104 = (uint64_t *)((char *)v100 + v102[7]);
        *v104 = v108;
        v104[1] = v59;
        result = ((uint64_t (*)(char *, char *, uint64_t))v107)((char *)v100 + v102[8], v118, v124);
        v105 = (uint64_t *)((char *)v100 + v102[9]);
        *v105 = v98;
        v105[1] = v99;
        return result;
      }
    }
    else
    {
      swift_once(&qword_1000214D8, sub_100003EB8);
      if (*(_QWORD *)(a1 + 16))
        goto LABEL_64;
    }
    v122 = 0u;
    v123 = 0u;
    goto LABEL_95;
  }
LABEL_88:
  swift_bridgeObjectRelease(v59);
  swift_bridgeObjectRelease(a1);
  swift_bridgeObjectRelease(v111);
  sub_100010EC8((uint64_t)v4, &qword_1000218E0);
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v91 = type metadata accessor for Logger(0);
  sub_10000D078(v91, (uint64_t)qword_100021D50);
  v92 = Logger.logObject.getter();
  v93 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v92, v93))
  {
    v94 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v94 = 0;
    _os_log_impl((void *)&_mh_execute_header, v92, v93, "Invitation lacks sentTime", v94, 2u);
    swift_slowDealloc(v94, -1, -1);
  }

  v95 = objc_allocWithZone((Class)NSError);
  v96 = String._bridgeToObjectiveC()();
  objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 7, 0);

  swift_willThrow();
  sub_10000E320(v109, v46);
  return (*(uint64_t (**)(char *, uint64_t))(v115 + 8))(v113, v114);
}

uint64_t sub_10000BDD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[4] = a5;
  v6[5] = a6;
  v7 = type metadata accessor for UUID(0);
  v6[6] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[7] = v8;
  v6[8] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000BE30, 0, 0);
}

uint64_t sub_10000BE30()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  char **v42;
  id v43;
  void *v44;
  uint64_t v46;
  uint64_t v47;
  os_log_type_t type;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v2 = (id *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = objc_opt_self(IDSReceivedInvitation);
  v4 = swift_dynamicCastObjCClass(v1, v3);
  v5 = *(void **)(v0 + 32);
  if (v4)
  {
    v6 = (void *)v4;
    v7 = qword_1000214F0;
    v8 = v5;
    if (v7 == -1)
    {
      v9 = v8;
    }
    else
    {
      swift_once(&qword_1000214F0, sub_100013054);
      v9 = *v2;
    }
    v10 = type metadata accessor for Logger(0);
    sub_10000D078(v10, (uint64_t)qword_100021D50);
    v11 = Logger.logObject.getter(v9);
    v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      type = v12;
      v13 = *(_QWORD *)(v0 + 64);
      v46 = *(_QWORD *)(v0 + 56);
      v14 = *(_QWORD *)(v0 + 48);
      v49 = *(void **)(v0 + 32);
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v51 = swift_slowAlloc(32, -1);
      v53 = v51;
      *(_DWORD *)v15 = 136315138;
      v16 = objc_msgSend(v6, "uniqueID");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v17 = sub_10000D32C(&qword_1000218D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v18 = dispatch thunk of CustomStringConvertible.description.getter(v14, v17);
      v19 = v6;
      v21 = v20;
      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v13, v14);
      *(_QWORD *)(v0 + 24) = sub_100013D14(v18, v21, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v15 + 4, v15 + 12);
      v22 = v21;
      v6 = v19;
      swift_bridgeObjectRelease(v22);

      _os_log_impl((void *)&_mh_execute_header, v11, type, "Auto-declining received invite for which we can't extract the payload: %s", v15, 0xCu);
      swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v51, -1, -1);
      swift_slowDealloc(v15, -1, -1);
    }
    else
    {
      v41 = *v2;

    }
    v42 = &selRef_declineInvitation_serverAcknowledgedBlock_;
LABEL_15:
    v44 = *(void **)(v0 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(v0 + 40)+ OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager), *v42, v6, 0);

    goto LABEL_16;
  }
  v23 = objc_opt_self(IDSSentInvitation);
  v24 = swift_dynamicCastObjCClass(v5, v23);
  if (v24)
  {
    v6 = (void *)v24;
    v25 = qword_1000214F0;
    v26 = *v2;
    if (v25 == -1)
    {
      v27 = v26;
    }
    else
    {
      swift_once(&qword_1000214F0, sub_100013054);
      v27 = *v2;
    }
    v28 = type metadata accessor for Logger(0);
    sub_10000D078(v28, (uint64_t)qword_100021D50);
    v29 = Logger.logObject.getter(v27);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = *(_QWORD *)(v0 + 64);
      v47 = *(_QWORD *)(v0 + 56);
      v32 = *(_QWORD *)(v0 + 48);
      v50 = *(void **)(v0 + 32);
      v33 = (uint8_t *)swift_slowAlloc(12, -1);
      v52 = swift_slowAlloc(32, -1);
      v53 = v52;
      *(_DWORD *)v33 = 136315138;
      v34 = objc_msgSend(v6, "uniqueID");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v35 = sub_10000D32C(&qword_1000218D8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
      v36 = dispatch thunk of CustomStringConvertible.description.getter(v32, v35);
      v37 = v6;
      v39 = v38;
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v31, v32);
      *(_QWORD *)(v0 + 16) = sub_100013D14(v36, v39, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v33 + 4, v33 + 12);
      v40 = v39;
      v6 = v37;
      swift_bridgeObjectRelease(v40);

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Auto-canceling sent invite for which we can't extract the payload: %s", v33, 0xCu);
      swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1, -1);
      swift_slowDealloc(v33, -1, -1);
    }
    else
    {
      v43 = *v2;

    }
    v42 = &selRef_cancelInvitation_serverAcknowledgedBlock_;
    goto LABEL_15;
  }
LABEL_16:
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10000C478()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for KCSharingMessagingdInvitationManagerDelegate()
{
  return objc_opt_self(_TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate);
}

unint64_t sub_10000C524()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021840;
  if (!qword_100021840)
  {
    v1 = sub_10000C570(&qword_100021838);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021840);
  }
  return result;
}

uint64_t sub_10000C570(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000C5B4()
{
  uint64_t *v0;
  uint64_t v1;
  Swift::String v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  void *object;
  Swift::String v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  Swift::String v12;
  void *v13;
  Swift::String v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  Swift::String v22;
  void *v23;
  Swift::String v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  Swift::String v29;
  uint64_t v31;

  _StringGuts.grow(_:)(17);
  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  swift_bridgeObjectRelease(0xE000000000000000);
  v31 = v1;
  v2._countAndFlagsBits = 32;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  v3 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  v4 = type metadata accessor for URL(0);
  v5 = sub_10000D32C(&qword_100021AE8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v4, v5);
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  v8._countAndFlagsBits = 32;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  v9 = (uint64_t *)((char *)v0 + v3[6]);
  v10 = *v9;
  v11 = v9[1];
  sub_1000108B8(*v9, v11);
  v12._countAndFlagsBits = Data.description.getter(v10, v11);
  v13 = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v13);
  sub_10000E320(v10, v11);
  v14._countAndFlagsBits = 32;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  v15 = (uint64_t *)((char *)v0 + v3[7]);
  v16 = *v15;
  v17 = (void *)v15[1];
  swift_bridgeObjectRetain(v17);
  v18._countAndFlagsBits = v16;
  v18._object = v17;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v17);
  v19._countAndFlagsBits = 32;
  v19._object = (void *)0xE100000000000000;
  String.append(_:)(v19);
  v20 = type metadata accessor for Date(0);
  v21 = sub_10000D32C(&qword_100021AF0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v20, v21);
  v23 = v22._object;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(v23);
  v24._countAndFlagsBits = 32;
  v24._object = (void *)0xE100000000000000;
  String.append(_:)(v24);
  v25 = (uint64_t *)((char *)v0 + v3[9]);
  v26 = v25[1];
  if (v26)
  {
    v27 = *v25;
    v28 = (void *)v25[1];
  }
  else
  {
    v28 = (void *)0xE90000000000003ELL;
    v27 = 0x656D616E206F6E3CLL;
  }
  swift_bridgeObjectRetain(v26);
  v29._countAndFlagsBits = v27;
  v29._object = v28;
  String.append(_:)(v29);
  swift_bridgeObjectRelease(v28);
  return v31;
}

uint64_t sub_10000C7D8(char a1)
{
  return *(_QWORD *)&aGroupid_2[8 * a1];
}

BOOL sub_10000C7F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000C80C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000C850()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000C878(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000C8B8()
{
  char *v0;

  return sub_10000C7D8(*v0);
}

uint64_t sub_10000C8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100012D50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000C8E4()
{
  return 0;
}

void sub_10000C8F0(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_10000C8FC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000129C8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C924(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000129C8();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C94C(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  char v30;
  __int128 v31;

  v3 = v1;
  v5 = sub_1000032A0(&qword_100021AC8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000129A4(a1, v9);
  v11 = sub_1000129C8();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys, &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v13 = v3[1];
  LOBYTE(v31) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v31, v5);
  if (!v2)
  {
    v14 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
    v15 = (char *)v3 + v14[5];
    LOBYTE(v31) = 1;
    v16 = type metadata accessor for URL(0);
    v17 = sub_10000D32C(&qword_100021AD0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v15, &v31, v5, v16, v17);
    v31 = *(_OWORD *)((char *)v3 + v14[6]);
    v30 = 2;
    v18 = sub_100012AB4();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v31, &v30, v5, &type metadata for Data, v18);
    v19 = (uint64_t *)((char *)v3 + v14[7]);
    v20 = *v19;
    v21 = v19[1];
    LOBYTE(v31) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v20, v21, &v31, v5);
    v22 = (char *)v3 + v14[8];
    LOBYTE(v31) = 4;
    v23 = type metadata accessor for Date(0);
    v24 = sub_10000D32C(&qword_100021AE0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v22, &v31, v5, v23, v24);
    v25 = (uint64_t *)((char *)v3 + v14[9]);
    v26 = *v25;
    v27 = v25[1];
    LOBYTE(v31) = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v26, v27, &v31, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000CBA8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char *v39;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  _QWORD *v49;
  uint64_t v50;
  __int128 v51;
  char v52;

  v42 = a2;
  v3 = type metadata accessor for Date(0);
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  __chkstk_darwin(v3);
  v43 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1000032A0(&qword_100021AA0);
  v8 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v47);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  __chkstk_darwin(v11);
  v13 = (uint64_t *)((char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = a1[3];
  v14 = a1[4];
  v49 = a1;
  sub_1000129A4(a1, v15);
  v16 = sub_1000129C8();
  v48 = v10;
  v17 = v50;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys, &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys, v16, v15, v14);
  if (v17)
    return sub_100012A0C(v49);
  v18 = v8;
  LOBYTE(v51) = 0;
  v19 = v47;
  v20 = (uint64_t)v13;
  *v13 = KeyedDecodingContainer.decode(_:forKey:)(&v51, v47);
  v13[1] = v21;
  LOBYTE(v51) = 1;
  v22 = sub_10000D32C(&qword_100021AB0, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  v23 = v19;
  v24 = v46;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v46, &v51, v23, v46, v22);
  v25 = v11;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v20 + v11[5], v7, v24);
  v52 = 2;
  v26 = sub_100012A2C();
  v27 = v47;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v52, v47, &type metadata for Data, v26);
  *(_OWORD *)(v20 + v11[6]) = v51;
  LOBYTE(v51) = 3;
  v28 = KeyedDecodingContainer.decode(_:forKey:)(&v51, v27);
  v50 = 0;
  v29 = (uint64_t *)(v20 + v11[7]);
  *v29 = v28;
  v29[1] = v30;
  LOBYTE(v51) = 4;
  v31 = sub_10000D32C(&qword_100021AC0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v32 = v43;
  v33 = v45;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v45, &v51, v27, v45, v31);
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v20 + v25[8], v32, v33);
  LOBYTE(v51) = 5;
  v34 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v51, v27);
  v43 = v35;
  v36 = v34;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v48, v27);
  v37 = (uint64_t *)(v20 + v25[9]);
  v38 = v42;
  v39 = v43;
  *v37 = v36;
  v37[1] = (uint64_t)v39;
  sub_100012A70(v20, v38);
  sub_100012A0C(v49);
  return sub_1000106FC(v20);
}

uint64_t sub_10000D04C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10000CBA8(a1, a2);
}

uint64_t sub_10000D060(_QWORD *a1)
{
  return sub_10000C94C(a1);
}

uint64_t sub_10000D078(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *sub_10000D090(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000032A0(&qword_100021978);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10000FFA0(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_10000D19C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000032A0(&qword_100021928);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100010980(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000D2AC(uint64_t a1)
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
  v9 = (_QWORD *)swift_task_alloc(dword_100021854);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100003970;
  return sub_10000BDD0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10000D32C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000D36C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_10000D7F4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_10000D518(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000032A0(&qword_100021970);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10000D7F4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_10000D518(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_10000D98C();
      goto LABEL_22;
    }
    sub_10000DB3C(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

void *sub_10000D98C()
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
  sub_1000032A0(&qword_100021970);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
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
    result = (void *)swift_bridgeObjectRetain(v18);
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

Swift::Int sub_10000DB3C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000032A0(&qword_100021970);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_10000DDE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_10000DE48(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x10000E02CLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_10000E050(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_10000E0AC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_10000DDE8((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_10000E320(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

unint64_t sub_10000E274(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000F184(a1, a2, v5);
}

uint64_t sub_10000E2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000032A0(&qword_1000218F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E320(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(uint64_t a1)
{
  uint64_t result;

  result = qword_100021A58;
  if (!qword_100021A58)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload);
  return result;
}

uint64_t sub_10000E3A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000E3DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10000F264(a1, v4);
}

double sub_10000E40C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  double result;
  uint64_t v15;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_10000E274(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v12 = *v4;
    v15 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000F4F4();
      v12 = v15;
    }
    swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v9 + 8));
    sub_100011000((_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v9), a3);
    sub_10000EE18(v9, v12);
    v13 = *v4;
    *v4 = v12;
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

Swift::Int sub_10000E4FC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  __int128 v41;
  _QWORD v42[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000032A0(&qword_100021920);
  v7 = a2;
  v8 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v9 = v8;
  if (*(_QWORD *)(v5 + 16))
  {
    v38 = v3;
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v40 = (_QWORD *)(v5 + 64);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v39 = (unint64_t)(v10 + 63) >> 6;
    v13 = v8 + 64;
    result = swift_retain(v5);
    v15 = 0;
    while (1)
    {
      if (v12)
      {
        v22 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v23 = v22 | (v15 << 6);
      }
      else
      {
        v24 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v24 >= v39)
          goto LABEL_36;
        v25 = v40[v24];
        ++v15;
        if (!v25)
        {
          v15 = v24 + 1;
          if (v24 + 1 >= v39)
            goto LABEL_36;
          v25 = v40[v15];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v39)
            {
LABEL_36:
              swift_release(v5);
              v3 = v38;
              if ((v7 & 1) != 0)
              {
                v37 = 1 << *(_BYTE *)(v5 + 32);
                if (v37 >= 64)
                  bzero(v40, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v40 = -1 << v37;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v25 = v40[v26];
            if (!v25)
            {
              while (1)
              {
                v15 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_43;
                if (v15 >= v39)
                  goto LABEL_36;
                v25 = v40[v15];
                ++v26;
                if (v25)
                  goto LABEL_33;
              }
            }
            v15 = v26;
          }
        }
LABEL_33:
        v12 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      v31 = 16 * v23;
      v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
      v34 = *v32;
      v33 = v32[1];
      v41 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v31);
      if ((v7 & 1) == 0)
      {
        swift_bridgeObjectRetain(v33);
        v35 = (id)v41;
        v36 = *((id *)&v41 + 1);
      }
      Hasher.init(_seed:)(v42, *(_QWORD *)(v9 + 40));
      String.hash(into:)(v42, v34, v33);
      result = Hasher._finalize()();
      v16 = -1 << *(_BYTE *)(v9 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v29 = v18 == v28;
          if (v18 == v28)
            v18 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v13 + 8 * v18);
        }
        while (v30 == -1);
        v19 = __clz(__rbit64(~v30)) + (v18 << 6);
      }
      *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = 16 * v19;
      v21 = (_QWORD *)(*(_QWORD *)(v9 + 48) + v20);
      *v21 = v34;
      v21[1] = v33;
      *(_OWORD *)(*(_QWORD *)(v9 + 56) + v20) = v41;
      ++*(_QWORD *)(v9 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v9;
  return result;
}

uint64_t sub_10000E810(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  _QWORD v37[9];
  _OWORD v38[2];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000032A0(&qword_1000219A8);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v18 = v17 | (v14 << 6);
      }
      else
      {
        v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        if (v19 >= v35)
          goto LABEL_37;
        v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          v14 = v19 + 1;
          if (v19 + 1 >= v35)
            goto LABEL_37;
          v20 = v36[v14];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              v3 = v34;
              if ((a2 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                v14 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_44;
                if (v14 >= v35)
                  goto LABEL_37;
                v20 = v36[v14];
                ++v21;
                if (v20)
                  goto LABEL_24;
              }
            }
            v14 = v21;
          }
        }
LABEL_24:
        v11 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
      v24 = *v22;
      v23 = v22[1];
      v25 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_100011000(v25, v38);
      }
      else
      {
        sub_10000E3A0((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }
      Hasher.init(_seed:)(v37, *(_QWORD *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      result = Hasher._finalize()();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15);
      *v16 = v24;
      v16[1] = v23;
      result = (uint64_t)sub_100011000(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v15));
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_10000EB0C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000032A0(&qword_1000219F8);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_36;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v37)
              goto LABEL_36;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      v34 = v33;
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_10000EE18(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _QWORD v27[9];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v10 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v11 = *v10;
        v12 = v10[1];
        Hasher.init(_seed:)(v27, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v27, v11, v12);
        v13 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v12);
        v14 = v13 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v14 < v8)
            goto LABEL_5;
        }
        else if (v14 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v14)
        {
LABEL_11:
          v15 = *(_QWORD *)(a2 + 48);
          v16 = (_OWORD *)(v15 + 16 * v3);
          v17 = (_OWORD *)(v15 + 16 * v6);
          if (v3 != v6 || v16 >= v17 + 1)
            *v16 = *v17;
          v18 = *(_QWORD *)(a2 + 56);
          v19 = (_OWORD *)(v18 + 32 * v3);
          v20 = (_OWORD *)(v18 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v19 >= v20 + 2))
          {
            v9 = v20[1];
            *v19 = *v20;
            v19[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
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

_OWORD *sub_10000EFEC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_10000E274(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_QWORD *)(v18[7] + 32 * v12);
        sub_100012A0C(v19);
        return sub_100011000(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10000F4F4();
      goto LABEL_7;
    }
    sub_10000E810(v15, a4 & 1);
    v21 = sub_10000E274(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10000F11C(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain(a3);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

_OWORD *sub_10000F11C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_100011000(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_10000F184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10000F264(uint64_t a1, uint64_t a2)
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
      sub_100011010(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10001104C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_10000F328()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  __int128 v26;

  v1 = v0;
  sub_1000032A0(&qword_100021920);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    v5 = *(_QWORD *)(v2 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v4 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v17);
    v20 = *v18;
    v19 = v18[1];
    v26 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v17);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v17);
    *v21 = v20;
    v21[1] = v19;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v17) = v26;
    swift_bridgeObjectRetain(v19);
    v22 = (id)v26;
    result = *((id *)&v26 + 1);
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000F4F4()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  sub_1000032A0(&qword_1000219A8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release(v2);
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
      goto LABEL_30;
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_10000E3A0(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_100011000(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release(v2);
    v1 = v25;
    goto LABEL_28;
  }
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
LABEL_30:
  __break(1u);
  return result;
}

id sub_10000F6D8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_1000032A0(&qword_1000219F8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = v20;
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

uint64_t sub_10000F888(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t i;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t j;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v25;
  _QWORD v26[9];

  if (!*(_QWORD *)(a2 + 16))
    return 1;
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 1;
  v25 = a1 + 32;
  v4 = a2 + 56;
  swift_bridgeObjectRetain(a1);
  for (i = 0; i != v2; ++i)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = (uint64_t *)(v25 + 16 * i);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v26, v8, v7);
      v9 = Hasher._finalize()();
      v10 = -1 << *(_BYTE *)(a2 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
      {
        v12 = *(_QWORD *)(a2 + 48);
        v13 = (_QWORD *)(v12 + 16 * v11);
        v14 = v13[1];
        v15 = *v13 == v8 && v14 == v7;
        if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v13, v14, v8, v7, 0) & 1) != 0)
        {
LABEL_22:
          swift_bridgeObjectRelease(a1);
          v22 = 0;
          goto LABEL_23;
        }
        v16 = ~v10;
        for (j = v11 + 1; ; j = v18 + 1)
        {
          v18 = j & v16;
          if (((*(_QWORD *)(v4 + (((j & v16) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v16)) & 1) == 0)
            break;
          v19 = (_QWORD *)(v12 + 16 * v18);
          v20 = v19[1];
          v21 = *v19 == v8 && v20 == v7;
          if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, v8, v7, 0) & 1) != 0)
            goto LABEL_22;
        }
      }
      swift_bridgeObjectRelease(v7);
    }
  }
  v22 = 1;
  v7 = a1;
LABEL_23:
  swift_bridgeObjectRelease(v7);
  return v22;
}

uint64_t sub_10000FA14(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_10000FA9C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 40) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 48) = v3;
  *v3 = v2;
  v3[1] = sub_10000FB04;
  return v5(v2 + 16);
}

uint64_t sub_10000FB04()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 40);
  v5 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 48));
  v3 = *(_QWORD *)(v1 + 32);
  *(_OWORD *)v2 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v3;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

void sub_10000FB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t v32;
  int64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  _QWORD v54[5];
  _QWORD *v55;

  v5 = v4;
  v46 = a4;
  v47 = a3;
  v51 = a2;
  v7 = sub_1000032A0(&qword_100021948);
  __chkstk_darwin(v7);
  v9 = (uint64_t *)((char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  v49 = *(_QWORD *)(v10 - 8);
  v50 = v10;
  v11 = (_QWORD *)__chkstk_darwin(v10);
  v48 = (uint64_t *)((char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v55 = _swiftEmptyArrayStorage;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    v14 = __CocoaSet.makeIterator()(v13);
    v15 = sub_100011154(0, &qword_100021960, IDSSentInvitation_ptr);
    v16 = sub_100010940(&qword_100021968, &qword_100021960, IDSSentInvitation_ptr);
    v11 = Set.Iterator.init(_cocoa:)(v54, v14, v15, v16);
    a1 = v54[0];
    v45 = v54[1];
    v17 = v54[2];
    v18 = v54[3];
    v19 = v54[4];
  }
  else
  {
    v18 = 0;
    v20 = -1 << *(_BYTE *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 56);
    v45 = a1 + 56;
    v22 = ~v20;
    v23 = -v20;
    if (v23 < 64)
      v24 = ~(-1 << v23);
    else
      v24 = -1;
    v19 = v24 & v21;
    v17 = v22;
  }
  v41 = v17;
  v43 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v44 = (unint64_t)(v17 + 64) >> 6;
  v42 = (char *)&type metadata for Swift.AnyObject + 8;
  while (a1 < 0)
  {
    v28 = __CocoaSet.Iterator.next()(v11);
    if (!v28)
      goto LABEL_44;
    v29 = v28;
    v52 = v28;
    v30 = sub_100011154(0, &qword_100021960, IDSSentInvitation_ptr);
    swift_unknownObjectRetain(v29);
    swift_dynamicCast(&v53, &v52, v42, v30, 7);
    v31 = v53;
    swift_unknownObjectRelease(v29);
    v27 = v18;
    v25 = v19;
    if (!v31)
      goto LABEL_44;
LABEL_31:
    sub_10000A97C(v31, v9);
    if (v5)
    {
      swift_errorRelease(v5);
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v9, 1, 1, v50);
      sub_100010EC8((uint64_t)v9, &qword_100021948);

      v5 = 0;
      goto LABEL_12;
    }
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v9, 0, 1, v50);
    v34 = v48;
    sub_100010F04((uint64_t)v9, (uint64_t)v48);
    v35 = v34[1];
    if (*v34 == v47 && v35 == v46)
    {
      v36 = sub_1000106FC((uint64_t)v48);
LABEL_36:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v36);
      v38 = v55[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v38);
      v39 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v38, v31);
      v11 = (_QWORD *)specialized ContiguousArray._endMutation()(v39);
      goto LABEL_12;
    }
    v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v47, v46, *v34, v35, 0);
    v36 = sub_1000106FC((uint64_t)v48);
    if ((v37 & 1) != 0)
      goto LABEL_36;

LABEL_12:
    v18 = v27;
    v19 = v25;
  }
  if (v19)
  {
    v25 = (v19 - 1) & v19;
    v26 = __clz(__rbit64(v19)) | (v18 << 6);
    v27 = v18;
LABEL_30:
    v31 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v26);
    if (!v31)
      goto LABEL_44;
    goto LABEL_31;
  }
  v27 = v18 + 1;
  if (!__OFADD__(v18, 1))
  {
    if (v27 >= v44)
      goto LABEL_44;
    v32 = *(_QWORD *)(v45 + 8 * v27);
    if (!v32)
    {
      v33 = v18 + 2;
      if (v18 + 2 >= v44)
        goto LABEL_44;
      v32 = *(_QWORD *)(v45 + 8 * v33);
      if (v32)
        goto LABEL_28;
      v33 = v18 + 3;
      if (v18 + 3 >= v44)
        goto LABEL_44;
      v32 = *(_QWORD *)(v45 + 8 * v33);
      if (v32)
        goto LABEL_28;
      v33 = v18 + 4;
      if (v18 + 4 >= v44)
        goto LABEL_44;
      v32 = *(_QWORD *)(v45 + 8 * v33);
      if (v32)
      {
LABEL_28:
        v27 = v33;
      }
      else
      {
        v27 = v18 + 5;
        if (v18 + 5 >= v44)
          goto LABEL_44;
        v32 = *(_QWORD *)(v45 + 8 * v27);
        if (!v32)
        {
          v40 = v18 + 6;
          while (v44 != v40)
          {
            v32 = *(_QWORD *)(v45 + 8 * v40++);
            if (v32)
            {
              v27 = v40 - 1;
              goto LABEL_29;
            }
          }
LABEL_44:
          sub_10001194C(a1);
          return;
        }
      }
    }
LABEL_29:
    v25 = (v32 - 1) & v32;
    v26 = __clz(__rbit64(v32)) + (v27 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

uint64_t sub_10000FFA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_100010090(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_10000D36C(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void sub_100010124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  unint64_t v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;
  char v37;
  int64_t v38;
  _QWORD v39[2];
  uint64_t v40;
  char *v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[5];
  void *v52;

  v5 = v4;
  v45 = a4;
  v49 = a2;
  v8 = sub_1000032A0(&qword_100021948);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  v47 = *(_QWORD *)(v11 - 8);
  v48 = v11;
  __chkstk_darwin(v11);
  v46 = (_QWORD *)((char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = a3;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v14 = __CocoaSet.makeIterator()(v13);
    v15 = sub_100011154(0, &qword_100021908, IDSReceivedInvitation_ptr);
    v16 = sub_100010940(&qword_100021910, &qword_100021908, IDSReceivedInvitation_ptr);
    v17 = Set.Iterator.init(_cocoa:)(v51, v14, v15, v16);
    a1 = v51[0];
    v44 = v51[1];
    v18 = v51[2];
    v19 = v51[3];
    v20 = v51[4];
  }
  else
  {
    v21 = -1 << *(_BYTE *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 56);
    v44 = a1 + 56;
    v23 = ~v21;
    v24 = -v21;
    if (v24 < 64)
      v25 = ~(-1 << v24);
    else
      v25 = -1;
    v20 = v25 & v22;
    v17 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v18 = v23;
    v19 = 0;
  }
  v39[1] = v18;
  v42 = a1 & 0x7FFFFFFFFFFFFFFFLL;
  v43 = (unint64_t)(v18 + 64) >> 6;
  v41 = (char *)&type metadata for Swift.AnyObject + 8;
  while (a1 < 0)
  {
    v29 = __CocoaSet.Iterator.next()(v17);
    if (!v29)
      goto LABEL_44;
    v30 = v29;
    v50 = v29;
    v31 = sub_100011154(0, &qword_100021908, IDSReceivedInvitation_ptr);
    swift_unknownObjectRetain(v30);
    swift_dynamicCast(&v52, &v50, v41, v31, 7);
    v32 = v52;
    swift_unknownObjectRelease(v30);
    v28 = v19;
    v26 = v20;
    if (!v32)
      goto LABEL_44;
LABEL_31:
    sub_10000A97C(v32, v10);
    if (v5)
    {
      swift_errorRelease(v5);
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v10, 1, 1, v48);
      sub_100010EC8((uint64_t)v10, &qword_100021948);
      v5 = 0;
    }
    else
    {
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v10, 0, 1, v48);
      v35 = v46;
      sub_100010F04((uint64_t)v10, (uint64_t)v46);
      v36 = v35[1];
      if (*v35 == v40 && v36 == v45)
      {
        sub_1000106FC((uint64_t)v46);
LABEL_44:
        sub_10001194C(a1);
        return;
      }
      v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v45, *v35, v36, 0);
      sub_1000106FC((uint64_t)v46);
      if ((v37 & 1) != 0)
        goto LABEL_44;
    }

    v19 = v28;
    v20 = v26;
  }
  if (v20)
  {
    v26 = (v20 - 1) & v20;
    v27 = __clz(__rbit64(v20)) | (v19 << 6);
    v28 = v19;
LABEL_30:
    v32 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * v27);
    if (!v32)
      goto LABEL_44;
    goto LABEL_31;
  }
  v28 = v19 + 1;
  if (!__OFADD__(v19, 1))
  {
    if (v28 >= v43)
      goto LABEL_44;
    v33 = *(_QWORD *)(v44 + 8 * v28);
    if (!v33)
    {
      v34 = v19 + 2;
      if (v19 + 2 >= v43)
        goto LABEL_44;
      v33 = *(_QWORD *)(v44 + 8 * v34);
      if (v33)
        goto LABEL_28;
      v34 = v19 + 3;
      if (v19 + 3 >= v43)
        goto LABEL_44;
      v33 = *(_QWORD *)(v44 + 8 * v34);
      if (v33)
        goto LABEL_28;
      v34 = v19 + 4;
      if (v19 + 4 >= v43)
        goto LABEL_44;
      v33 = *(_QWORD *)(v44 + 8 * v34);
      if (v33)
      {
LABEL_28:
        v28 = v34;
      }
      else
      {
        v28 = v19 + 5;
        if (v19 + 5 >= v43)
          goto LABEL_44;
        v33 = *(_QWORD *)(v44 + 8 * v28);
        if (!v33)
        {
          v38 = v19 + 6;
          while (v43 != v38)
          {
            v33 = *(_QWORD *)(v44 + 8 * v38++);
            if (v33)
            {
              v28 = v38 - 1;
              goto LABEL_29;
            }
          }
          goto LABEL_44;
        }
      }
    }
LABEL_29:
    v26 = (v33 - 1) & v33;
    v27 = __clz(__rbit64(v33)) + (v28 << 6);
    goto LABEL_30;
  }
  __break(1u);
}

uint64_t sub_10001054C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  _QWORD v23[4];

  v6 = a1 + 56;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v12 = 0;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    v19 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v19 >= v10)
      goto LABEL_24;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      v12 = v19 + 1;
      if (v19 + 1 >= v10)
        goto LABEL_24;
      v20 = *(_QWORD *)(v6 + 8 * v12);
      if (!v20)
      {
        v12 = v19 + 2;
        if (v19 + 2 >= v10)
          goto LABEL_24;
        v20 = *(_QWORD *)(v6 + 8 * v12);
        if (!v20)
        {
          v12 = v19 + 3;
          if (v19 + 3 >= v10)
            goto LABEL_24;
          v20 = *(_QWORD *)(v6 + 8 * v12);
          if (!v20)
          {
            v21 = v19 + 4;
            if (v21 >= v10)
            {
LABEL_24:
              v22 = 0;
              goto LABEL_25;
            }
            v20 = *(_QWORD *)(v6 + 8 * v21);
            if (!v20)
            {
              while (1)
              {
                v12 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_27;
                if (v12 >= v10)
                  goto LABEL_24;
                v20 = *(_QWORD *)(v6 + 8 * v12);
                ++v21;
                if (v20)
                  goto LABEL_22;
              }
            }
            v12 = v21;
          }
        }
      }
    }
LABEL_22:
    v9 = (v20 - 1) & v20;
    v14 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_5:
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v14);
    v17 = *v15;
    v16 = v15[1];
    v23[2] = v17;
    v23[3] = v16;
    v23[0] = a2;
    v23[1] = a3;
    v18 = sub_1000108FC();
    result = StringProtocol.contains<A>(_:)(v23, &type metadata for String, &type metadata for String, v18, v18);
    if ((result & 1) != 0)
    {
      v22 = 1;
LABEL_25:
      swift_release(a1);
      return v22;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1000106FC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100010738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  NSString v16;
  NSURL *v17;
  void *v18;
  void *v19;
  NSString v20;
  NSString v21;
  NSData v22;
  NSDate v23;
  NSString v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  uint64_t v30;

  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v30 = a3;
  URL._bridgeToObjectiveC()(v17);
  v19 = v18;
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a5);
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a7);
  v22.super.isa = Data._bridgeToObjectiveC()().super.isa;
  v23.super.isa = Date._bridgeToObjectiveC()().super.isa;
  if (a12)
  {
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a12);
  }
  else
  {
    v24 = 0;
  }
  v25 = objc_msgSend(v29, "initWithGroupID:shareURL:senderHandle:inviteeHandle:inviteToken:sentTime:displayName:", v16, v19, v20, v21, v22.super.isa, v23.super.isa, v24);

  v26 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(a10, v26);
  v27 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v30, v27);
  return v25;
}

uint64_t sub_1000108B8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_1000108FC()
{
  unint64_t result;

  result = qword_100021900;
  if (!qword_100021900)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100021900);
  }
  return result;
}

uint64_t sub_100010940(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_100011154(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100010980(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

void sub_100010A70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  int64_t v29;
  _QWORD *v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  void *v35;

  v2 = v1;
  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v5 = __CocoaSet.makeIterator()(v4);
    v6 = sub_100011154(0, &qword_100021908, IDSReceivedInvitation_ptr);
    v7 = sub_100010940(&qword_100021910, &qword_100021908, IDSReceivedInvitation_ptr);
    isUniquelyReferenced_nonNull_native = (uint64_t)Set.Iterator.init(_cocoa:)(v34, v5, v6, v7);
    v3 = v34[0];
    v32 = v34[1];
    v9 = v34[2];
    v10 = v34[3];
    v11 = v34[4];
  }
  else
  {
    v12 = -1 << *(_BYTE *)(a1 + 32);
    v32 = a1 + 56;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v11 = v14 & *(_QWORD *)(a1 + 56);
    isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain(a1);
    v10 = 0;
  }
  v30 = _swiftEmptyArrayStorage;
  v31 = (unint64_t)(v9 + 64) >> 6;
  while (1)
  {
    v15 = v10;
    if ((v3 & 0x8000000000000000) == 0)
      break;
    v18 = __CocoaSet.Iterator.next()(isUniquelyReferenced_nonNull_native);
    if (!v18)
      goto LABEL_42;
    v19 = v18;
    v33 = v18;
    v20 = sub_100011154(0, &qword_100021908, IDSReceivedInvitation_ptr);
    swift_unknownObjectRetain(v19);
    swift_dynamicCast(&v35, &v33, (char *)&type metadata for Swift.AnyObject + 8, v20, 7);
    v21 = v35;
    swift_unknownObjectRelease(v19);
    if (!v21)
      goto LABEL_42;
LABEL_29:
    sub_10000A0A4(v21);
    if (v2)
    {
      swift_errorRelease(v2);

      v2 = 0;
    }
    else
    {
      v25 = v24;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v30);
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_10000D19C(0, v30[2] + 1, 1, v30);
        v30 = (_QWORD *)isUniquelyReferenced_nonNull_native;
      }
      v27 = v30[2];
      v26 = v30[3];
      if (v27 >= v26 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_10000D19C((_QWORD *)(v26 > 1), v27 + 1, 1, v30);
        v30 = (_QWORD *)isUniquelyReferenced_nonNull_native;
      }
      v30[2] = v27 + 1;
      v28 = &v30[2 * v27];
      v28[4] = v21;
      v28[5] = v25;
    }
  }
  if (v11)
  {
    v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v17 = v16 | (v10 << 6);
LABEL_28:
    v21 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    if (!v21)
      goto LABEL_42;
    goto LABEL_29;
  }
  ++v10;
  if (!__OFADD__(v15, 1))
  {
    if (v10 >= v31)
      goto LABEL_42;
    v22 = *(_QWORD *)(v32 + 8 * v10);
    if (!v22)
    {
      v23 = v15 + 2;
      if (v15 + 2 >= v31)
        goto LABEL_42;
      v22 = *(_QWORD *)(v32 + 8 * v23);
      if (v22)
        goto LABEL_26;
      v23 = v15 + 3;
      if (v15 + 3 >= v31)
        goto LABEL_42;
      v22 = *(_QWORD *)(v32 + 8 * v23);
      if (v22)
        goto LABEL_26;
      v23 = v15 + 4;
      if (v15 + 4 >= v31)
        goto LABEL_42;
      v22 = *(_QWORD *)(v32 + 8 * v23);
      if (v22)
      {
LABEL_26:
        v10 = v23;
      }
      else
      {
        v10 = v15 + 5;
        if (v15 + 5 >= v31)
          goto LABEL_42;
        v22 = *(_QWORD *)(v32 + 8 * v10);
        if (!v22)
        {
          v29 = v15 + 6;
          while (v31 != v29)
          {
            v22 = *(_QWORD *)(v32 + 8 * v29++);
            if (v22)
            {
              v10 = v29 - 1;
              goto LABEL_27;
            }
          }
LABEL_42:
          sub_10001194C(v3);
          return;
        }
      }
    }
LABEL_27:
    v11 = (v22 - 1) & v22;
    v17 = __clz(__rbit64(v22)) + (v10 << 6);
    goto LABEL_28;
  }
  __break(1u);
}

uint64_t sub_100010E04()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100010E40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc(dword_100021934);
  v3 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_100003DE4;
  *(_OWORD *)(v2 + 24) = v3;
  return swift_task_switch(sub_100009334, 0, 0);
}

void sub_100010EA0(uint64_t a1)
{
  uint64_t v1;

  sub_100008CDC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_100010EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010EC0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100010EC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000032A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100010F04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100010F48(uint64_t a1)
{
  uint64_t *v1;

  sub_1000088A4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100010F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000032A0(&qword_100021940);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100010FBC(uint64_t a1)
{
  sub_1000032A0(&qword_100021940);
  return sub_100008E20(a1);
}

_OWORD *sub_100011000(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100011010(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10001104C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100011080(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc(dword_100021994);
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_100003DE4;
  return sub_100005204(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_100011110(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000032A0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100011154(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10001118C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  int64_t v24;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v24 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v18 = v8 + 1;
    if (__OFADD__(v8, 1))
      break;
    if (v18 >= v24)
      goto LABEL_24;
    v19 = *(_QWORD *)(v22 + 8 * v18);
    ++v8;
    if (!v19)
    {
      v8 = v18 + 1;
      if (v18 + 1 >= v24)
        goto LABEL_24;
      v19 = *(_QWORD *)(v22 + 8 * v8);
      if (!v19)
      {
        v8 = v18 + 2;
        if (v18 + 2 >= v24)
          goto LABEL_24;
        v19 = *(_QWORD *)(v22 + 8 * v8);
        if (!v19)
        {
          v8 = v18 + 3;
          if (v18 + 3 >= v24)
            goto LABEL_24;
          v19 = *(_QWORD *)(v22 + 8 * v8);
          if (!v19)
          {
            v20 = v18 + 4;
            if (v20 >= v24)
            {
LABEL_24:
              v21 = 0;
              goto LABEL_25;
            }
            v19 = *(_QWORD *)(v22 + 8 * v20);
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_27;
                if (v8 >= v24)
                  goto LABEL_24;
                v19 = *(_QWORD *)(v22 + 8 * v8);
                ++v20;
                if (v19)
                  goto LABEL_22;
              }
            }
            v8 = v20;
          }
        }
      }
    }
LABEL_22:
    v6 = (v19 - 1) & v19;
    v10 = __clz(__rbit64(v19)) + (v8 << 6);
LABEL_5:
    v11 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = v11[1];
    v23[2] = *v11;
    v23[3] = v12;
    swift_bridgeObjectRetain(v12);
    v13 = objc_msgSend(a2, "handle");
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v16 = v15;

    v23[0] = v14;
    v23[1] = v16;
    v17 = sub_1000108FC();
    LOBYTE(v13) = StringProtocol.contains<A>(_:)(v23, &type metadata for String, &type metadata for String, v17, v17);
    swift_bridgeObjectRelease(v12);
    result = swift_bridgeObjectRelease(v16);
    if ((v13 & 1) != 0)
    {
      v21 = 1;
LABEL_25:
      swift_release(a1);
      return v21;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1000113B8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000113FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = swift_task_alloc(dword_1000219CC);
  v5 = *(_OWORD *)(v1 + 32);
  v6 = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100003DE4;
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch(sub_100006BA4, 0, 0);
}

uint64_t sub_100011468(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!((unint64_t)a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
    return 0;
  }
LABEL_13:
  if (a1 < 0)
    v14 = a1;
  else
    v14 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a1);
  v3 = _CocoaArrayWrapper.endIndex.getter(v14);
  swift_bridgeObjectRelease(a1);
  if (!v3)
    return 0;
LABEL_3:
  for (i = 0; ; ++i)
  {
    v5 = (a1 & 0xC000000000000001) != 0
       ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1)
       : *(id *)(a1 + 8 * i + 32);
    v6 = v5;
    v7 = objc_msgSend(v5, "destination");
    v8 = sub_100005008();
    swift_unknownObjectRelease(v7);
    v9 = objc_msgSend(a2, "handle");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

    LOBYTE(v9) = sub_100006344(v10, v12, v8);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v8);
    if ((v9 & 1) != 0)
      break;
    v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    if (v13 == v3)
      return 0;
  }
  return i;
}

uint64_t sub_1000115DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_10000DDE8(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_100011690(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1000116D4()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_100011708 + *((int *)qword_1000117C8 + (v0 >> 62))))();
}

uint64_t sub_100011718@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_1000108B8(v2, v1);
      sub_10000E050(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_1000117D8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000117FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000219DC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100003970;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000219D8 + dword_1000219D8))(a1, v4);
}

void sub_10001186C(uint64_t a1)
{
  uint64_t v1;

  sub_100006C9C(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_100011878()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000032A0(&qword_1000219E8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000118F8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000032A0(&qword_1000219E8);
  return sub_10000700C(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10001194C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_QWORD *sub_100011954(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

void sub_100011990(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[2];

  v2 = v1;
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v4 = type metadata accessor for Logger(0);
  sub_10000D078(v4, (uint64_t)qword_100021D50);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc(22, -1);
    v20 = (_QWORD *)swift_slowAlloc(8, -1);
    v21 = swift_slowAlloc(32, -1);
    v23 = (uint64_t)v5;
    v24[0] = v21;
    *(_DWORD *)v8 = 138412546;
    v22 = v2;
    v9 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v8 + 4, v8 + 12);
    *v20 = v5;

    *(_WORD *)(v8 + 12) = 2080;
    v10 = objc_msgSend(v9, "context");
    v11 = objc_msgSend(v10, "payload");
    swift_unknownObjectRelease(v10);
    v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v11, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v13 = Dictionary.description.getter(v12, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v15 = v14;
    swift_bridgeObjectRelease(v12);
    v16 = v13;
    v2 = v22;
    v23 = sub_100013D14(v16, v15, v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v8 + 14, v8 + 22);
    swift_bridgeObjectRelease(v15);

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "incoming invitation %@ %s", (uint8_t *)v8, 0x16u);
    v17 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v20, 1, v17);
    swift_slowDealloc(v20, -1, -1);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {

  }
  sub_10000A0A4(v5);
  v19 = v18;
  objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection), "receivedGroupInvitation:", v18);

}

id sub_100011D0C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  id v13;
  uint64_t v14;

  v2 = v1;
  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v4 = type metadata accessor for Logger(0);
  sub_10000D078(v4, (uint64_t)qword_100021D50);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v13 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v8 + 4, v8 + 12);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "sender did cancel invite %@", v8, 0xCu);
    v11 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection), "groupInvitationWasCancelled");
}

void sub_100011EBC(void *a1, const char *a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;

  if (qword_1000214F0 != -1)
    swift_once(&qword_1000214F0, sub_100013054);
  v4 = type metadata accessor for Logger(0);
  sub_10000D078(v4, (uint64_t)qword_100021D50);
  v11 = a1;
  v5 = Logger.logObject.getter(v11);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412290;
    v12 = v11;
    v9 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v7 + 4, v7 + 12);
    *v8 = v11;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, a2, v7, 0xCu);
    v10 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v8, 1, v10);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
}

_QWORD *initializeBufferWithCopyOfBuffer for KCSharingMessagingdInvitationManagerDelegate.BothTypes(_QWORD *a1, uint64_t a2)
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

void destroy for KCSharingMessagingdInvitationManagerDelegate.BothTypes(id *a1)
{

}

uint64_t assignWithCopy for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t a1, uint64_t a2)
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

__n128 initializeWithTake for KCSharingMessagingdInvitationManagerDelegate.BothTypes(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.BothTypes(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.BothTypes()
{
  return &type metadata for KCSharingMessagingdInvitationManagerDelegate.BothTypes;
}

uint64_t *sub_100012204(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v31);
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for URL(0);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain(v7);
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = *v15;
    v17 = v15[1];
    sub_1000108B8(*v15, v17);
    *v14 = v16;
    v14[1] = v17;
    v18 = a3[7];
    v19 = a3[8];
    v20 = (uint64_t *)((char *)v4 + v18);
    v21 = (uint64_t *)((char *)a2 + v18);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = (char *)v4 + v19;
    v24 = (char *)a2 + v19;
    v25 = type metadata accessor for Date(0);
    v26 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16);
    swift_bridgeObjectRetain(v22);
    v26(v23, v24, v25);
    v27 = a3[9];
    v28 = (uint64_t *)((char *)v4 + v27);
    v29 = (uint64_t *)((char *)a2 + v27);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    swift_bridgeObjectRetain(v30);
  }
  return v4;
}

uint64_t sub_100012330(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = a1 + a2[5];
  v5 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  sub_10000E320(*(_QWORD *)(a1 + a2[6]), *(_QWORD *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[7] + 8));
  v6 = a1 + a2[8];
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[9] + 8));
}

_QWORD *sub_1000123D4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL(0);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  sub_1000108B8(*v14, v16);
  *v13 = v15;
  v13[1] = v16;
  v17 = a3[7];
  v18 = a3[8];
  v19 = (_QWORD *)((char *)a1 + v17);
  v20 = (_QWORD *)((char *)a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (char *)a1 + v18;
  v23 = (char *)a2 + v18;
  v24 = type metadata accessor for Date(0);
  v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
  swift_bridgeObjectRetain(v21);
  v25(v22, v23, v24);
  v26 = a3[9];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  swift_bridgeObjectRetain(v29);
  return a1;
}

_QWORD *sub_1000124D4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[6];
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  sub_1000108B8(*v14, v16);
  v17 = *v13;
  v18 = v13[1];
  *v13 = v15;
  v13[1] = v16;
  sub_10000E320(v17, v18);
  v19 = a3[7];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  *v20 = *v21;
  v22 = v21[1];
  v23 = v20[1];
  v20[1] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  v24 = a3[8];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v27 - 8) + 24))(v25, v26, v27);
  v28 = a3[9];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v31 = v30[1];
  v32 = v29[1];
  v29[1] = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v32);
  return a1;
}

_OWORD *sub_100012604(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  v11 = a3[8];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  return a1;
}

_QWORD *sub_1000126BC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[6];
  v13 = *(_QWORD *)((char *)a1 + v12);
  v14 = *(_QWORD *)((char *)a1 + v12 + 8);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  sub_10000E320(v13, v14);
  v15 = a3[7];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  v20 = v16[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease(v20);
  v21 = a3[8];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  v25 = a3[9];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (_QWORD *)((char *)a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  v30 = v26[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease(v30);
  return a1;
}

uint64_t sub_1000127AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000127B8);
}

uint64_t sub_1000127B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = type metadata accessor for Date(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_100012858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012864);
}

uint64_t sub_100012864(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = type metadata accessor for URL(0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for Date(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_100012900(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[6];

  v5[0] = &unk_100018528;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v5[1] = *(_QWORD *)(result - 8) + 64;
    v5[2] = &unk_100018540;
    v5[3] = &unk_100018528;
    result = type metadata accessor for Date(319);
    if (v4 <= 0x3F)
    {
      v5[4] = *(_QWORD *)(result - 8) + 64;
      v5[5] = &unk_100018558;
      swift_initStructMetadata(a1, 256, 6, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

_QWORD *sub_1000129A4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000129C8()
{
  unint64_t result;

  result = qword_100021AA8;
  if (!qword_100021AA8)
  {
    result = swift_getWitnessTable(&unk_1000186AC, &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021AA8);
  }
  return result;
}

uint64_t sub_100012A0C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100012A2C()
{
  unint64_t result;

  result = qword_100021AB8;
  if (!qword_100021AB8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100021AB8);
  }
  return result;
}

uint64_t sub_100012A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100012AB4()
{
  unint64_t result;

  result = qword_100021AD8;
  if (!qword_100021AD8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100021AD8);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100012BE4 + 4 * byte_1000184B5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100012C18 + 4 * byte_1000184B0[v4]))();
}

uint64_t sub_100012C18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012C20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100012C28);
  return result;
}

uint64_t sub_100012C34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100012C3CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_100012C40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012C48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012C54(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100012C60(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys()
{
  return &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys;
}

unint64_t sub_100012C7C()
{
  unint64_t result;

  result = qword_100021AF8;
  if (!qword_100021AF8)
  {
    result = swift_getWitnessTable(&unk_100018684, &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021AF8);
  }
  return result;
}

unint64_t sub_100012CC4()
{
  unint64_t result;

  result = qword_100021B00;
  if (!qword_100021B00)
  {
    result = swift_getWitnessTable(&unk_1000185F4, &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021B00);
  }
  return result;
}

unint64_t sub_100012D0C()
{
  unint64_t result;

  result = qword_100021B08;
  if (!qword_100021B08)
  {
    result = swift_getWitnessTable(&unk_10001861C, &type metadata for KCSharingMessagingdInvitationManagerDelegate.InvitationPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021B08);
  }
  return result;
}

uint64_t sub_100012D50(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x444970756F7267 && a2 == 0xE700000000000000;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x444970756F7267, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else if (a1 == 0x4C52556572616873 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x4C52556572616873, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1;
  }
  else if (a1 == 0x6974617469766E69 && a2 == 0xEF6E656B6F546E6FLL
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6974617469766E69, 0xEF6E656B6F546E6FLL, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2;
  }
  else if (a1 == 0x4865657469766E69 && a2 == 0xED0000656C646E61
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x4865657469766E69, 0xED0000656C646E61, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3;
  }
  else if (a1 == 0x656D6954746E6573 && a2 == 0xE800000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656D6954746E6573, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 4;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease(0xEB00000000656D61);
    return 5;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x4E79616C70736964, 0xEB00000000656D61, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_100013000(uint64_t a1)
{
  return sub_100013068(a1, qword_100021D38, 6516856);
}

uint64_t *sub_100013014(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_100013054(uint64_t a1)
{
  return sub_100013068(a1, qword_100021D50, 5456969);
}

uint64_t sub_100013068(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = type metadata accessor for Logger(0);
  sub_100013014(v5, a2);
  sub_10000D078(v5, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000023, 0x8000000100017150, a3, 0xE300000000000000);
}

uint64_t sub_1000130D8()
{
  uint64_t result;

  sub_100013694();
  result = static OS_dispatch_source.makeSignalSource(signal:queue:)(15, 0);
  qword_100021D68 = result;
  return result;
}

uint64_t sub_100013110()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_1000214E8 != -1)
    swift_once(&qword_1000214E8, sub_100013000);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_10000D078(v0, (uint64_t)qword_100021D38);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Received SIGTERM, will exit when clean", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  return xpc_transaction_exit_clean();
}

uint64_t sub_1000131DC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v5;

  v0 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = _swiftEmptyArrayStorage;
  v1 = sub_100013600();
  v2 = sub_1000032A0(&qword_100021B88);
  v3 = sub_100013648();
  return dispatch thunk of SetAlgebra.init<A>(_:)(&v5, v2, v3, v0, v1);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t MainExecutor;
  uint64_t v5;
  uint64_t v6;
  int result;

  v3 = swift_task_create(2048, 0, (char *)&type metadata for () + 8, &unk_100021B70, 0);
  MainExecutor = swift_task_getMainExecutor();
  v6 = swift_job_run(v3, MainExecutor, v5);
  result = swift_task_asyncMainDrainQueue(v6);
  __break(1u);
  return result;
}

uint64_t sub_1000132B0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v0[2] = type metadata accessor for MainActor(0);
  v0[3] = static MainActor.shared.getter();
  v3 = (uint64_t (__cdecl *)())((char *)&dword_100021B78 + dword_100021B78);
  v1 = (_QWORD *)swift_task_alloc(unk_100021B7C);
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_100013320;
  return v3();
}

uint64_t sub_100013320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100013390, v2, v3);
}

void sub_100013390()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  exit(0);
}

uint64_t sub_1000133B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v0[8] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[9] = v2;
  v0[10] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DispatchQoS(0);
  v0[11] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v0[12] = v4;
  v0[13] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MainActor(0);
  static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_100013468, v6, v7);
}

void sub_100013468()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (__cdecl *v12)(int);
  uint64_t v13;

  if (qword_1000214F8 != -1)
    swift_once(&qword_1000214F8, sub_1000130D8);
  v2 = v0[12];
  v1 = v0[13];
  v4 = v0[10];
  v3 = v0[11];
  v5 = v0[8];
  v6 = v0[9];
  v7 = qword_100021D68;
  ObjectType = swift_getObjectType(qword_100021D68);
  v0[6] = sub_100013110;
  v0[7] = 0;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_1000136D0;
  v0[5] = &unk_10001D018;
  v9 = _Block_copy(v0 + 2);
  v10 = swift_unknownObjectRetain(v7);
  static DispatchQoS.unspecified.getter(v10);
  sub_1000131DC();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)(v1, v4, v9, ObjectType);
  _Block_release(v9);
  swift_unknownObjectRelease(v7);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v12 = (void (__cdecl *)(int))SIG_IGN.getter(v11);
  signal(15, v12);
  v13 = qword_100021D68;
  swift_getObjectType(qword_100021D68);
  swift_unknownObjectRetain(v13);
  OS_dispatch_source.activate()();
  swift_unknownObjectRelease(v13);
  if (qword_100021500 == -1)
    dispatch_main();
  swift_once(&qword_100021500, sub_1000136FC);
  dispatch_main();
}

uint64_t sub_1000135E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000135F8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100013600()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021B80;
  if (!qword_100021B80)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100021B80);
  }
  return result;
}

unint64_t sub_100013648()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021B90;
  if (!qword_100021B90)
  {
    v1 = sub_10000C570(&qword_100021B88);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021B90);
  }
  return result;
}

unint64_t sub_100013694()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021B98;
  if (!qword_100021B98)
  {
    v1 = objc_opt_self(OS_dispatch_source);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021B98);
  }
  return result;
}

uint64_t sub_1000136D0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_1000136FC()
{
  id v0;
  NSString v1;
  id v2;
  id v3;
  id v4;
  char *v5;
  void *v6;

  v0 = objc_allocWithZone((Class)NSXPCListener);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithMachServiceName:", v1);

  v3 = objc_allocWithZone((Class)type metadata accessor for KCSharingMessagingdXPCListenerDelegate());
  v4 = v2;
  v5 = (char *)sub_1000144A8(v4);

  v6 = *(void **)&v5[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_listener];
  objc_msgSend(v6, "setDelegate:", v5);
  objc_msgSend(v6, "_setQueue:", *(_QWORD *)&v5[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue]);
  objc_msgSend(v6, "resume");

  qword_100021D70 = (uint64_t)v5;
}

void sub_1000137E0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v1 = v0;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue;
  v12 = sub_1000156BC();
  static DispatchQoS.unspecified.getter(v12);
  v18 = _swiftEmptyArrayStorage;
  v13 = sub_1000156F8();
  v14 = sub_1000032A0(&qword_100021838);
  v15 = sub_10000C524();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v18, v14, v15, v6, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  v16 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000037, 0x8000000100017480, v11, v8, v5, 0);
  *(_QWORD *)&v1[v17] = v16;
  *(_QWORD *)&v1[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections] = _swiftEmptyArrayStorage;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x616C696176616E75, 0xEB00000000656C62, "keychainsharingmessagingd/KCSharingMessagingdXPCListenerDelegate.swift", 70, 2, 20, 0);
  __break(1u);
}

void sub_100013A40(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;

  v2 = v1;
  if (qword_1000214E8 != -1)
    swift_once(&qword_1000214E8, sub_100013000);
  v4 = type metadata accessor for Logger(0);
  sub_10000D078(v4, (uint64_t)qword_100021D38);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v18 = v5;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v8 + 4, v8 + 12);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "connection invalidated %@", v8, 0xCu);
    v11 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v12 = (uint64_t *)(v2
                  + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections);
  swift_beginAccess(v2 + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections, &v18, 33, 0);
  v13 = v5;
  v14 = sub_100014F6C(v12, (uint64_t)v13);

  v15 = *v12;
  if ((unint64_t)*v12 >> 62)
  {
    if (v15 < 0)
      v17 = *v12;
    else
      v17 = v15 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v12);
    v16 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(v15);
    if (v16 >= v14)
      goto LABEL_8;
  }
  else
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v16 >= v14)
    {
LABEL_8:
      sub_100015284(v14, v16);
      swift_endAccess(&v18);
      return;
    }
  }
  __break(1u);
}

id sub_100013C7C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KCSharingMessagingdXPCListenerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for KCSharingMessagingdXPCListenerDelegate()
{
  return objc_opt_self(_TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate);
}

uint64_t sub_100013D14(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100013DE4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000E3A0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10000E3A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100012A0C(v12);
  return v7;
}

uint64_t sub_100013DE4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100013F9C(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100013F9C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100014030(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100014208(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100014208(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100014030(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000141A4(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000141A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000032A0(&qword_100021C40);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100014208(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000032A0(&qword_100021C40);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100014354(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_1000143BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  if ((unint64_t)a1 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
        swift_unknownObjectRelease(v6);
        if (v6 == a2)
          return v5;
      }
      else if (*(_QWORD *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1))
        break;
      if (++v5 == v4)
        return 0;
    }
    __break(1u);
LABEL_13:
    if (a1 < 0)
      v8 = a1;
    else
      v8 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v8);
    swift_bridgeObjectRelease(a1);
  }
  return 0;
}

id sub_1000144A8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_class *v19;
  _QWORD v21[3];
  uint64_t v22;
  void *v23;
  objc_super v24;
  _QWORD *v25;

  v23 = a1;
  v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue;
  v21[1] = sub_1000156BC();
  v12 = v1;
  static DispatchQoS.unspecified.getter();
  v25 = _swiftEmptyArrayStorage;
  v13 = sub_1000156F8();
  v14 = sub_1000032A0(&qword_100021838);
  v15 = sub_10000C524();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v14, v15, v6, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  v16 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000037, 0x8000000100017480, v11, v8, v5, 0);
  *(_QWORD *)(v21[2] + v22) = v16;
  *(_QWORD *)&v12[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections] = _swiftEmptyArrayStorage;
  v17 = v23;
  *(_QWORD *)&v12[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_listener] = v23;
  v18 = v17;

  v19 = (objc_class *)type metadata accessor for KCSharingMessagingdXPCListenerDelegate();
  v24.receiver = v12;
  v24.super_class = v19;
  return objc_msgSendSuper2(&v24, "init");
}

uint64_t sub_10001469C(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  NSString v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  objc_class *v21;
  char *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  id v35;
  char *v36;
  id v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  __int128 aBlock;
  __int128 v52;
  void (*v53)();
  uint64_t v54;
  objc_super v55;
  uint64_t v56;
  _BYTE v57[32];

  v2 = v1;
  if (qword_1000214E8 != -1)
    swift_once(&qword_1000214E8, sub_100013000);
  v4 = type metadata accessor for Logger(0);
  sub_10000D078(v4, (uint64_t)qword_100021D38);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_QWORD *)&aBlock = v5;
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 8, v8 + 4, v8 + 12);
    *v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "handling incoming connection %@", v8, 0xCu);
    v11 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v9, 1, v11);
    v12 = v9;
    v2 = v1;
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  if (qword_1000214E0 != -1)
    v13 = swift_once(&qword_1000214E0, sub_100003EE0);
  if (!qword_100021D30)
  {
    v17 = Logger.logObject.getter(v13);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "keychainsharingmessagingd disabled. refusing new XPC connection", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    return 0;
  }
  v14 = (id)qword_100021D30;
  v15 = String._bridgeToObjectiveC()();
  v16 = objc_msgSend(v5, "valueForEntitlement:", v15);

  if (v16)
  {
    _bridgeAnyObjectToAny(_:)(&aBlock, v16);
    swift_unknownObjectRelease(v16);
  }
  else
  {
    aBlock = 0u;
    v52 = 0u;
  }
  sub_10001557C((uint64_t)&aBlock, (uint64_t)v57);
  sub_1000155C4((uint64_t)v57, (uint64_t)&aBlock);
  if (!*((_QWORD *)&v52 + 1))
  {
    sub_10001560C((uint64_t)&aBlock);
    goto LABEL_22;
  }
  if ((swift_dynamicCast(&v56, &aBlock, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) == 0
    || (v56 & 1) == 0)
  {
LABEL_22:
    v42 = v5;
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = swift_slowAlloc(22, -1);
      v46 = (_QWORD *)swift_slowAlloc(8, -1);
      v47 = swift_slowAlloc(32, -1);
      *(_QWORD *)&aBlock = v47;
      *(_DWORD *)v45 = 138412546;
      v56 = (uint64_t)v42;
      v50 = v14;
      v48 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57, v45 + 4, v45 + 12);
      *v46 = v42;

      *(_WORD *)(v45 + 12) = 2080;
      v56 = sub_100013D14(0xD000000000000037, 0x8000000100017260, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57, v45 + 14, v45 + 22);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Rejected connection %@ lacks entitlement %s", (uint8_t *)v45, 0x16u);
      v49 = sub_1000032A0(&qword_1000218C0);
      swift_arrayDestroy(v46, 1, v49);
      swift_slowDealloc(v46, -1, -1);
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1, -1);
      swift_slowDealloc(v45, -1, -1);

    }
    else
    {

    }
    sub_10001560C((uint64_t)v57);
    return 0;
  }
  v20 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL___KCSharingMessagingdXPCServerProtocol);
  objc_msgSend(v5, "setExportedInterface:", v20);
  v21 = (objc_class *)type metadata accessor for KCSharingMessagingdXPCServer();
  v22 = (char *)objc_allocWithZone(v21);
  *(_QWORD *)&v22[OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_connection] = v5;
  *(_QWORD *)&v22[OBJC_IVAR____TtC25keychainsharingmessagingd28KCSharingMessagingdXPCServer_invitationManagerDelegate] = v14;
  v55.receiver = v22;
  v55.super_class = v21;
  v23 = v5;
  v24 = v14;
  v25 = objc_msgSendSuper2(&v55, "init");
  objc_msgSend(v23, "setExportedObject:", v25);
  v26 = swift_allocObject(&unk_10001D050, 32, 7);
  *(_QWORD *)(v26 + 16) = v2;
  *(_QWORD *)(v26 + 24) = v25;
  v53 = sub_100015678;
  v54 = v26;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v52 = sub_1000136D0;
  *((_QWORD *)&v52 + 1) = &unk_10001D068;
  v27 = _Block_copy(&aBlock);
  v28 = v54;
  v29 = v2;
  v30 = v25;
  swift_release(v28);
  objc_msgSend(v23, "setInterruptionHandler:", v27);
  _Block_release(v27);
  v31 = swift_allocObject(&unk_10001D0A0, 32, 7);
  *(_QWORD *)(v31 + 16) = v29;
  *(_QWORD *)(v31 + 24) = v30;
  v53 = sub_100015698;
  v54 = v31;
  *(_QWORD *)&aBlock = _NSConcreteStackBlock;
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v52 = sub_1000136D0;
  *((_QWORD *)&v52 + 1) = &unk_10001D0B8;
  v32 = _Block_copy(&aBlock);
  v33 = v54;
  v34 = (char *)v29;
  v35 = v30;
  swift_release(v33);
  objc_msgSend(v23, "setInvalidationHandler:", v32);
  _Block_release(v32);
  v36 = &v34[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections];
  swift_beginAccess(&v34[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_clientConnections], &aBlock, 33, 0);
  v37 = v35;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  v39 = *(_QWORD *)((*(_QWORD *)v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v38 = *(_QWORD *)((*(_QWORD *)v36 & 0xFFFFFFFFFFFFFF8) + 0x18);
  if (v39 >= v38 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1);
  v40 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v39, v37);
  specialized Array._endMutation()(v40);
  swift_endAccess(&aBlock);
  objc_msgSend(v23, "_setQueue:", *(_QWORD *)&v34[OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue]);
  objc_msgSend(v23, "resume");

  sub_10001560C((uint64_t)v57);
  return 1;
}

void sub_100014DBC(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  if (qword_1000214E8 != -1)
    swift_once(&qword_1000214E8, sub_100013000);
  v2 = type metadata accessor for Logger(0);
  sub_10000D078(v2, (uint64_t)qword_100021D38);
  v9 = a1;
  v3 = Logger.logObject.getter(v9);
  v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    v10 = v9;
    v7 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);
    *v6 = v9;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "connection interrupted %@", v5, 0xCu);
    v8 = sub_1000032A0(&qword_1000218C0);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_100014F6C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t i;
  unint64_t v12;
  id v13;
  id v14;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v5 = *a1;
  v6 = swift_bridgeObjectRetain(*a1);
  v7 = sub_1000143BC(v6, a2);
  v9 = v8;
  swift_bridgeObjectRelease(v5);
  if (v2)
    return v7;
  if ((v9 & 1) == 0)
  {
    v10 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_57;
    v9 = *a1;
    if ((unint64_t)*a1 >> 62)
    {
LABEL_58:
      if ((v9 & 0x8000000000000000) != 0)
        v27 = v9;
      else
        v27 = v9 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v9);
      v28 = _CocoaArrayWrapper.endIndex.getter(v27);
      swift_bridgeObjectRelease(v9);
      if (v10 != v28)
        goto LABEL_6;
    }
    else if (v10 != *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:
      for (i = v7 + 5; ; ++i)
      {
        v9 = i - 4;
        v12 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
          break;
        if ((v9 & 0x8000000000000000) != 0)
        {
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          goto LABEL_58;
        }
        if (v9 >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_48;
        if (*(_QWORD *)(v12 + 8 * i) != a2)
          goto LABEL_11;
LABEL_31:
        v10 = i - 3;
        if (__OFADD__(v9, 1))
          goto LABEL_49;
        v21 = *a1;
        if ((unint64_t)*a1 >> 62)
        {
          if (v21 < 0)
            v24 = *a1;
          else
            v24 = v21 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(*a1);
          v22 = _CocoaArrayWrapper.endIndex.getter(v24);
          swift_bridgeObjectRelease(v21);
        }
        else
        {
          v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v10 == v22)
          return v7;
      }
      v23 = specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, v12);
      swift_unknownObjectRelease(v23);
      if (v23 == a2)
        goto LABEL_31;
LABEL_11:
      if (v9 == v7)
      {
LABEL_30:
        if (__OFADD__(v7++, 1))
          goto LABEL_50;
        goto LABEL_31;
      }
      v10 = *a1;
      if ((*a1 & 0xC000000000000001) != 0)
      {
        v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, *a1);
        v10 = *a1;
        if ((*a1 & 0xC000000000000001) == 0)
        {
LABEL_16:
          if ((v9 & 0x8000000000000000) != 0)
            goto LABEL_53;
          if (v9 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_54;
          v14 = *(id *)(v10 + 8 * i);
          goto LABEL_19;
        }
      }
      else
      {
        if ((v7 & 0x8000000000000000) != 0)
          goto LABEL_51;
        if (v7 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_52;
        v13 = *(id *)(v10 + 8 * v7 + 32);
        if ((v10 & 0xC000000000000001) == 0)
          goto LABEL_16;
      }
      v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, v10);
      v10 = *a1;
LABEL_19:
      isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v10);
      *a1 = v10;
      if (!isUniquelyReferenced_nonNull_bridgeObject || v10 < 0 || (v10 & 0x4000000000000000) != 0)
      {
        v10 = sub_100014354(v10);
        *a1 = v10;
      }
      v16 = *(void **)((v10 & 0xFFFFFFFFFFFFFF8) + 8 * v7 + 0x20);
      *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 8 * v7 + 0x20) = v14;

      specialized Array._endMutation()();
      v10 = *a1;
      v17 = swift_isUniquelyReferenced_nonNull_bridgeObject(*a1);
      *a1 = v10;
      if (!v17 || v10 < 0 || (v10 & 0x4000000000000000) != 0)
      {
        v10 = sub_100014354(v10);
        *a1 = v10;
      }
      if ((v9 & 0x8000000000000000) != 0)
        goto LABEL_55;
      v18 = v10 & 0xFFFFFFFFFFFFFF8;
      if (v9 >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_56;
      v19 = *(void **)(v18 + 8 * i);
      *(_QWORD *)(v18 + 8 * i) = v13;

      specialized Array._endMutation()();
      goto LABEL_30;
    }
    return v7;
  }
  v25 = *a1;
  if (!((unint64_t)v25 >> 62))
    return *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v25 < 0)
    v29 = v25;
  else
    v29 = v25 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v25);
  v30 = _CocoaArrayWrapper.endIndex.getter(v29);
  swift_bridgeObjectRelease(v25);
  return v30;
}

uint64_t sub_100015284(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    v5 = *v3;
    if (!((unint64_t)*v3 >> 62))
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v7 >= a2)
        goto LABEL_4;
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
  }
  if (v5 < 0)
    v26 = v5;
  else
    v26 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v7 = _CocoaArrayWrapper.endIndex.getter(v26);
  swift_bridgeObjectRelease(v5);
  if (v7 < v2)
    goto LABEL_34;
LABEL_4:
  v5 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v5))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v7 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = v8 - v5;
    if (!__OFADD__(v8, v6))
      goto LABEL_8;
LABEL_42:
    __break(1u);
LABEL_43:
    if (v7 < 0)
      v28 = v7;
    else
      v28 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v12 = _CocoaArrayWrapper.endIndex.getter(v28);
    swift_bridgeObjectRelease(v7);
    v7 = *v3;
    goto LABEL_15;
  }
LABEL_37:
  if (v7 < 0)
    v27 = v7;
  else
    v27 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v27);
  swift_bridgeObjectRelease(v7);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
    goto LABEL_42;
LABEL_8:
  v7 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v3);
  *v3 = v7;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v11 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v8 = 1;
  }
  if ((unint64_t)v7 >> 62)
    goto LABEL_43;
  v12 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9)
    v12 = v9;
  swift_bridgeObjectRetain(v7);
  v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v8, v12, 1, v7);
  v14 = *v3;
  *v3 = v13;
  swift_bridgeObjectRelease(v14);
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v15 = v11 + 32;
  v16 = (char *)(v11 + 32 + 8 * v4);
  v17 = type metadata accessor for KCSharingMessagingdXPCServer();
  v18 = (void *)swift_arrayDestroy(v16, v5, v17);
  if (!v6)
    return specialized Array._endMutation()(v18);
  v19 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    v21 = v20 - v2;
    if (!__OFSUB__(v20, v2))
      goto LABEL_21;
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v19 < 0)
    v29 = *v3;
  else
    v29 = v19 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v3);
  v30 = _CocoaArrayWrapper.endIndex.getter(v29);
  v18 = (void *)swift_bridgeObjectRelease(v19);
  v21 = v30 - v2;
  if (__OFSUB__(v30, v2))
    goto LABEL_52;
LABEL_21:
  if ((v21 & 0x8000000000000000) == 0)
  {
    v22 = (char *)(v15 + 8 * v2);
    if (v4 != v2 || v16 >= &v22[8 * v21])
      v18 = memmove(v16, v22, 8 * v21);
    v2 = *v3;
    if (!((unint64_t)*v3 >> 62))
    {
      v23 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      v24 = v23 + v6;
      if (!__OFADD__(v23, v6))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v24;
        return specialized Array._endMutation()(v18);
      }
      goto LABEL_58;
    }
LABEL_53:
    if (v2 < 0)
      v31 = v2;
    else
      v31 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v32 = _CocoaArrayWrapper.endIndex.getter(v31);
    v18 = (void *)swift_bridgeObjectRelease(v2);
    v24 = v32 + v6;
    if (!__OFADD__(v32, v6))
      goto LABEL_27;
LABEL_58:
    __break(1u);
  }
  v33 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v33, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001557C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000032A0(&qword_1000218F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000155C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000032A0(&qword_1000218F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001560C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000032A0(&qword_1000218F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001564C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100015678()
{
  uint64_t v0;

  sub_100014DBC(*(void **)(v0 + 24));
}

uint64_t sub_100015680(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015690(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100015698()
{
  uint64_t v0;

  sub_100013A40(*(void **)(v0 + 24));
}

unint64_t sub_1000156BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021828;
  if (!qword_100021828)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021828);
  }
  return result;
}

unint64_t sub_1000156F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021830;
  if (!qword_100021830)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_100021830);
  }
  return result;
}

id sub_100015888()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MessagingError();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MessagingError()
{
  return objc_opt_self(_TtC25keychainsharingmessagingd14MessagingError);
}

id sub_1000158DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t inited;
  unint64_t v4;
  id v5;
  NSString v6;
  Class isa;
  id v8;
  uint64_t v10;

  v2 = sub_1000032A0(&qword_1000219F0);
  inited = swift_initStackObject(v2, &v10);
  *(_OWORD *)(inited + 16) = xmmword_100018790;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x8000000100017560;
  *(_QWORD *)(inited + 72) = sub_1000032A0(&qword_100021988);
  *(_QWORD *)(inited + 48) = a1;
  swift_bridgeObjectRetain(a1);
  v4 = sub_100008630(inited);
  v5 = objc_allocWithZone((Class)NSError);
  v6 = String._bridgeToObjectiveC()();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  v8 = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 0, isa);

  return v8;
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupID");
}

id objc_msgSend_inviteToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteToken");
}

id objc_msgSend_inviteeHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteeHandle");
}

id objc_msgSend_senderHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderHandle");
}

id objc_msgSend_sentTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentTime");
}

id objc_msgSend_shareURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareURL");
}

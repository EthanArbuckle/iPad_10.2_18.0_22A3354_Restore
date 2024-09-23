int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v12;

  sub_100002FF8(&qword_100008010);
  __chkstk_darwin();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Daemon(0);
  sub_100003038(v5, qword_100008040);
  sub_100003078(v5, (uint64_t)qword_100008040);
  v6 = objc_autoreleasePoolPush();
  Daemon.init()();
  objc_autoreleasePoolPop(v6);
  TaskPriority.init(rawValue:)(21);
  v7 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 0, 1, v7);
  v8 = swift_allocObject(&unk_100004160, 32, 7);
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  v9 = sub_1000033E4((uint64_t)v4, (uint64_t)&unk_100008020, v8);
  swift_release(v9);
  sub_10000356C((uint64_t)v4);
  v10 = objc_msgSend((id)objc_opt_self(NSRunLoop), "currentRunLoop");
  objc_msgSend(v10, "run");

  return 0;
}

uint64_t sub_100002FF8(uint64_t *a1)
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

uint64_t *sub_100003038(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003078(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100003090()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = type metadata accessor for Logger(0);
  v0[3] = v1;
  v2 = *(_QWORD *)(v1 - 8);
  v0[4] = v2;
  v0[5] = swift_task_alloc((*(_QWORD *)(v2 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Daemon(0);
  sub_100003078(v3, (uint64_t)qword_100008040);
  v4 = (_QWORD *)swift_task_alloc(async function pointer to Daemon.start()[1]);
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_100003118;
  return Daemon.start()();
}

uint64_t sub_100003118()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*v1 + 48);
  v3 = *v1;
  *(_QWORD *)(v3 + 56) = v0;
  swift_task_dealloc(v2);
  if (v0)
    return swift_task_switch(sub_10000318C, 0, 0);
  swift_task_dealloc(*(_QWORD *)(v3 + 40));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_10000318C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 56);
  static AISLogger.daemon.getter();
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 56);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 16) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to start daemon: %@", v6, 0xCu);
    v9 = sub_100002FF8(&qword_100008038);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    swift_errorRelease(v5);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 56);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    swift_errorRelease(v10);

  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003334()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100003358()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10000801C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000339C;
  return sub_100003090();
}

uint64_t sub_10000339C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000033E4(uint64_t a1, uint64_t a2, uint64_t a3)
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

  sub_100002FF8(&qword_100008010);
  __chkstk_darwin();
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000035AC(a1, (uint64_t)v7);
  v8 = type metadata accessor for TaskPriority(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10000356C((uint64_t)v7);
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
  v18 = swift_allocObject(&unk_100004298, 32, 7);
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
  return swift_task_create(v10, v19, (char *)&type metadata for () + 8, &unk_100008030, v18);
}

uint64_t sub_10000356C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002FF8(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000035AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002FF8(&qword_100008010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000035F4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100003658;
  return v6(a1);
}

uint64_t sub_100003658()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000036A4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000036C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10000802C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000339C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100008028 + dword_100008028))(a1, v4);
}

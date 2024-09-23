int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  v3 = objc_autoreleasePoolPush();
  v4 = type metadata accessor for AskToDaemon();
  swift_allocObject(v4, 40, 7);
  v5 = sub_10000F7B0();
  qword_1000418A8 = v4;
  unk_1000418B0 = &off_10003D7A0;
  qword_100041890[0] = v5;
  objc_autoreleasePoolPop(v3);
  v6 = objc_autoreleasePoolPush();
  sub_100003680(qword_100041890, qword_1000418A8);
  sub_10000FAB8();
  objc_autoreleasePoolPop(v6);
  v7 = objc_msgSend((id)objc_opt_self(NSRunLoop), "currentRunLoop");
  objc_msgSend(v7, "run");

  if (qword_1000418C8 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_1000036A4(v8, (uint64_t)qword_100043EF8);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Daemon runloop completed", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  return 0;
}

_QWORD *sub_100003680(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000036A4(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for STAskForTimeAnswer()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100041990)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10003D088);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100041990);
  }
}

BOOL sub_100003710(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100003728()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000376C()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100003794(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000037D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  return swift_task_switch(sub_1000037F0, 0, 0);
}

uint64_t sub_1000037F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v1 = *(_QWORD *)(v0 + 88);
  swift_beginAccess(v1 + 24, v0 + 16, 0, 0);
  v2 = *(_QWORD *)(v1 + 24);
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = *(_QWORD *)(v0 + 72);
    v3 = *(_QWORD *)(v0 + 80);
    swift_bridgeObjectRetain(v3);
    swift_bridgeObjectRetain(v2);
    v5 = sub_1000276E8(v4, v3);
    v6 = *(_QWORD *)(v0 + 80);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v5);
      swift_retain(v8);
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v2);
      sub_1000174C0();
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
    }
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 80));
    swift_bridgeObjectRelease(v2);
  }
  v10 = *(_QWORD *)(v0 + 88);
  v11 = *(_BYTE *)(v10 + 16);
  v12 = type metadata accessor for AppExtensionConnection();
  swift_allocObject(v12, 96, 7);
  v13 = dword_1000424F4;
  swift_retain(v10);
  v14 = (_QWORD *)swift_task_alloc(v13);
  *(_QWORD *)(v0 + 96) = v14;
  *v14 = v0;
  v14[1] = sub_100003A6C;
  return sub_100017958(v11, (uint64_t)sub_100006B74, *(_QWORD *)(v0 + 88));
}

uint64_t sub_100003A6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 96);
  *(_QWORD *)(*v2 + 104) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100003D70;
  }
  else
  {
    swift_release(*(_QWORD *)(v4 + 88));
    *(_QWORD *)(v4 + 112) = a1;
    v6 = sub_100003AE8;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100003AE8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  uint64_t v21;

  v1 = *(_QWORD **)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 72);
  v1[4] = &off_10003D128;
  swift_unknownObjectWeakAssign(v1 + 3, v3);
  v5 = swift_allocObject(&unk_10003D208, 24, 7);
  swift_weakInit(v5 + 16, v3);
  v6 = (_QWORD *)swift_allocObject(&unk_10003D230, 40, 7);
  v6[2] = v5;
  v6[3] = v4;
  v6[4] = v2;
  v7 = v1[8];
  v8 = v1[9];
  v1[8] = sub_100006C18;
  v1[9] = v6;
  swift_bridgeObjectRetain(v2);
  sub_100006BB4(v7, v8);
  v9 = swift_allocObject(&unk_10003D208, 24, 7);
  swift_weakInit(v9 + 16, v3);
  v10 = (_QWORD *)swift_allocObject(&unk_10003D258, 40, 7);
  v10[2] = v9;
  v10[3] = v4;
  v10[4] = v2;
  v11 = v1[10];
  v12 = v1[11];
  v1[10] = sub_100006BF4;
  v1[11] = v10;
  swift_bridgeObjectRetain(v2);
  sub_100006BB4(v11, v12);
  swift_beginAccess(v3 + 24, v0 + 40, 33, 0);
  swift_bridgeObjectRetain(v2);
  swift_retain(v1);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(_QWORD *)(v3 + 24));
  v21 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0x8000000000000000;
  sub_100024ED0((uint64_t)v1, v4, v2, isUniquelyReferenced_nonNull_native);
  v14 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v21;
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v14);
  swift_endAccess(v0 + 40);
  v16 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 112);
  sub_1000174C0();
  if (!v16)
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
  *(_QWORD *)(v0 + 64) = v16;
  swift_errorRetain(v16);
  v17 = sub_100005FF0(&qword_100041C88);
  if (swift_dynamicCast(v0 + 120, v0 + 64, v17, &type metadata for ExtensionConnectionError, 0))
  {
    if (*(_BYTE *)(v0 + 120) == 5)
    {
      swift_errorRelease(v16);
      v18 = sub_100006934();
      swift_allocError(&type metadata for ExtensionConnectionError, v18, 0, 0);
      *v19 = 5;
      swift_willThrow();
    }
  }
  swift_release(v15);
  swift_errorRelease(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003D70()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 88));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_100003DA4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __objc2_prot **v5;
  __objc2_prot *v6;
  void *v7;
  __objc2_prot *v8;
  id v9;

  v5 = &protocolRef__TtP9AskToCore25AskToExtensionXPCProtocol_;
  if (!*(_BYTE *)(a4 + 16))
    v5 = &protocolRef__TtP6People32PeopleLegacyExtensionXPCProtocol_;
  v6 = *v5;
  v7 = (void *)objc_opt_self(NSXPCInterface);
  v8 = v6;
  v9 = objc_msgSend(v7, "interfaceWithProtocol:", v8);
  objc_msgSend(a1, "setRemoteObjectInterface:", v9);

}

uint64_t sub_100003E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];
  _BYTE v10[24];

  v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  result = swift_weakLoadStrong(v5);
  if (result)
  {
    v7 = result;
    swift_beginAccess(result + 24, v9, 33, 0);
    v8 = sub_10002BE7C(a2, a3);
    swift_endAccess(v9);
    swift_release(v7);
    return swift_release(v8);
  }
  return result;
}

uint64_t sub_100003EE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[23] = a2;
  v3[24] = v2;
  v3[22] = a1;
  return swift_task_switch(sub_100003EFC, 0, 0);
}

uint64_t sub_100003EFC()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 192) + 16);
  *(_BYTE *)(v0 + 256) = v1;
  if (v1)
    v2 = 0xD00000000000002ALL;
  else
    v2 = 0xD000000000000033;
  if (v1)
    v3 = 0x80000001000314A0;
  else
    v3 = 0x80000001000314D0;
  v4 = (_QWORD *)swift_task_alloc(dword_100041B4C);
  *(_QWORD *)(v0 + 200) = v4;
  *v4 = v0;
  v4[1] = sub_100003FA4;
  v5 = *(_QWORD *)(v0 + 192);
  v4[10] = v3;
  v4[11] = v5;
  v4[9] = v2;
  return swift_task_switch(sub_1000037F0, 0, 0);
}

uint64_t sub_100003FA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  char v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t (*v11)();
  uint64_t v12;

  v4 = *(_QWORD *)(*v2 + 200);
  v5 = *v2;
  *(_QWORD *)(v5 + 208) = a1;
  *(_QWORD *)(v5 + 216) = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v6 = sub_100004270;
  }
  else
  {
    v7 = *(_BYTE *)(v5 + 256);
    if (v7)
      v8 = 0x80000001000314A0;
    else
      v8 = 0x80000001000314D0;
    swift_bridgeObjectRelease(v8);
    if ((v7 & 1) != 0)
    {
      v9 = (_QWORD *)swift_task_alloc(dword_100041C7C);
      *(_QWORD *)(v5 + 240) = v9;
      *v9 = v5;
      v9[1] = sub_100004178;
      v10 = *(_QWORD *)(v5 + 184);
      v9[18] = a1;
      v9[19] = v10;
      v9[17] = v5 + 16;
      v11 = sub_100006094;
    }
    else
    {
      v12 = swift_task_alloc(dword_100041B5C);
      *(_QWORD *)(v5 + 224) = v12;
      *(_QWORD *)v12 = v5;
      *(_QWORD *)(v12 + 8) = sub_1000040B4;
      *(_OWORD *)(v12 + 152) = *(_OWORD *)(v5 + 184);
      *(_QWORD *)(v12 + 136) = v5 + 96;
      *(_QWORD *)(v12 + 144) = a1;
      v11 = sub_10000431C;
    }
    v6 = v11;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_1000040B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 224);
  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_1000042CC;
  else
    v3 = sub_100004118;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100004118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 176);
  swift_release(*(_QWORD *)(v0 + 208));
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_OWORD *)(v0 + 136);
  v5 = *(_OWORD *)(v0 + 112);
  v6 = *(_OWORD *)(v0 + 152);
  *(_OWORD *)v1 = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v1 + 16) = v5;
  *(_QWORD *)(v1 + 32) = v3;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(_QWORD *)(v1 + 72) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004178()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 240);
  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_10000423C;
  else
    v3 = sub_1000041DC;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_1000041DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 176);
  swift_release(*(_QWORD *)(v0 + 208));
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_OWORD *)(v0 + 56);
  v5 = *(_OWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v5;
  *(_QWORD *)(v1 + 32) = v3;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(_QWORD *)(v1 + 72) = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000423C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 208));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004270()
{
  uint64_t v0;
  unint64_t v1;

  if (*(_BYTE *)(v0 + 256))
    v1 = 0x80000001000314A0;
  else
    v1 = 0x80000001000314D0;
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000042CC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 208));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[19] = a3;
  v4[20] = v3;
  v4[17] = a1;
  v4[18] = a2;
  return swift_task_switch(sub_10000431C, 0, 0);
}

uint64_t sub_10000431C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v6;
  _BYTE *v7;

  sub_10001766C();
  v1 = sub_100005FF0(&qword_100041C68);
  if (swift_dynamicCast(v0 + 128, v0 + 96, (char *)&type metadata for Any + 8, v1, 6))
  {
    v2 = *(_QWORD *)(v0 + 128);
    *(_QWORD *)(v0 + 168) = v2;
    v3 = swift_task_alloc(48);
    *(_QWORD *)(v0 + 176) = v3;
    *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 152);
    *(_QWORD *)(v3 + 32) = v2;
    v4 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 184) = v4;
    *v4 = v0;
    v4[1] = sub_10000445C;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD000000000000040, 0x8000000100031410, sub_100006978, v3, &type metadata for MessagesPayload);
  }
  else
  {
    v6 = sub_100006934();
    swift_allocError(&type metadata for ExtensionConnectionError, v6, 0, 0);
    *v7 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000445C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 184);
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_100004528;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 176));
    v4 = sub_1000044C8;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000044C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 136);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 168));
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_OWORD *)(v0 + 56);
  v5 = *(_OWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v5;
  *(_QWORD *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(_QWORD *)(v1 + 72) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004528()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 176);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004564(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSString v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSURL *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84[24];
  uint64_t aBlock[5];
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;

  v76 = a4;
  v79 = a3;
  v82 = a1;
  v83 = sub_100005FF0(&qword_100041C70);
  v81 = *(_QWORD *)(v83 - 8);
  v5 = *(_QWORD *)(v81 + 64);
  __chkstk_darwin(v83);
  v80 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v77 = v6;
  v78 = v7;
  __chkstk_darwin(v6);
  v75 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005FF0(&qword_100041C58);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v14);
  v19 = (char *)&v68 - v18;
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v68 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v68 - v23;
  v25 = (void *)a2;
  static ATURL.create(using:)(a2);
  v72 = v12;
  v73 = v10;
  v74 = v9;
  v69 = v16;
  v70 = v5;
  sub_100006030((uint64_t)v24, (uint64_t)v19);
  sub_100005300((uint64_t)v19, a2, (uint64_t)v22);
  sub_1000068A0((uint64_t)v19, &qword_100041C58);
  sub_100006984((uint64_t)v22, (uint64_t)v24);
  if (qword_1000418D8 != -1)
    swift_once(&qword_1000418D8, sub_100025C4C);
  v26 = v74;
  v27 = sub_1000036A4(v74, (uint64_t)qword_100043F28);
  v28 = v73;
  v29 = v72;
  v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 16))(v72, v27, v26);
  v31 = Logger.logObject.getter(v30);
  v32 = static os_log_type_t.default.getter();
  v33 = os_log_type_enabled(v31, v32);
  v71 = v24;
  if (v33)
  {
    v68 = v25;
    v34 = (uint8_t *)swift_slowAlloc(12, -1);
    v35 = swift_slowAlloc(32, -1);
    aBlock[0] = v35;
    *(_DWORD *)v34 = 136315138;
    swift_beginAccess(v24, v84, 0, 0);
    v36 = v77;
    v37 = v78;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v78 + 48))(v24, 1, v77))
    {
      v38 = 0xE300000000000000;
      v39 = 7104878;
    }
    else
    {
      v43 = v75;
      v44 = (*(uint64_t (**)(char *, char *, uint64_t))(v37 + 16))(v75, v24, v36);
      v39 = URL.absoluteString.getter(v44);
      v38 = v45;
      (*(void (**)(char *, uint64_t))(v37 + 8))(v43, v36);
    }
    v41 = v79;
    v87 = sub_100027030(v39, v38, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v34 + 4, v34 + 12);
    swift_bridgeObjectRelease(v38);
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Reaching out to People extension with base URL %s", v34, 0xCu);
    swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v34, -1, -1);

    v40 = (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v72, v74);
    v25 = v68;
    v42 = v80;
  }
  else
  {

    v40 = (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v29, v26);
    v41 = v79;
    v42 = v80;
  }
  v46 = *(unsigned __int8 *)(v41 + 17);
  v47 = v83;
  v48 = v81;
  if (v46 == 3)
  {
    v49 = v25;
    v50 = (void *)ATPayload.question.getter(v40);
    ATQuestion.id.getter();
    v52 = v51;

    v53 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v52);
    v54 = (uint64_t)v71;
    swift_beginAccess(v71, &v87, 0, 0);
    v55 = (uint64_t)v69;
    sub_100006030(v54, (uint64_t)v69);
    v56 = v77;
    v57 = v78;
    v59 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v55, 1, v77) != 1)
    {
      URL._bridgeToObjectiveC()(v58);
      v59 = v60;
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v55, v56);
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v42, v82, v47);
    v61 = *(unsigned __int8 *)(v48 + 80);
    v62 = (v61 + 24) & ~v61;
    v63 = swift_allocObject(&unk_10003D168, v62 + v70, v61 | 7);
    *(_QWORD *)(v63 + 16) = v49;
    (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v63 + v62, v42, v47);
    aBlock[4] = (uint64_t)sub_1000069D0;
    v86 = v63;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100004CFC;
    aBlock[3] = (uint64_t)&unk_10003D180;
    v64 = _Block_copy(aBlock);
    v65 = v86;
    v66 = v49;
    swift_release(v65);
    objc_msgSend(v76, "messagePayloadForScreenTimeFor:baseURL:fallbackToLP:reply:", v53, v59, 0, v64);
    _Block_release(v64);

  }
  return sub_1000068A0((uint64_t)v71, &qword_100041C58);
}

void sub_100004B5C(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t inited;
  uint64_t v13;
  Swift::Int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[10];
  _BYTE v29[56];

  if (a2)
  {
    v2 = a2;
    v3 = PeopleLegacyResult.data.getter();
    v26 = v4;
    v27 = v3;
    v5 = PeopleLegacyResult.bundleID.getter();
    v7 = v6;
    v8 = ATPayload.messageGUID.getter();
    v10 = v9;
    v11 = sub_100005FF0(&qword_1000426C0);
    inited = swift_initStackObject(v11, v29);
    *(_OWORD *)(inited + 16) = xmmword_100030010;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSRegistrationPropertySupportsPeopleRequestMessages);
    *(_QWORD *)(inited + 40) = v13;
    v14 = sub_10000CE70(inited);
    swift_setDeallocating(inited);
    v15 = swift_arrayDestroy(inited + 32, 1, &type metadata for String);
    v16 = ATPayload.clientBundleIdentifier.getter(v15);
    v18 = v17;
    v19 = (void *)ATPayload.question.getter();
    v20 = ATQuestion.topic.getter();

    v28[0] = v27;
    v28[1] = v26;
    v28[2] = v5;
    v28[3] = v7;
    v28[4] = v8;
    v28[5] = v10;
    v28[6] = v14;
    v28[7] = v16;
    v28[8] = v18;
    v28[9] = v20;
    v21 = sub_100005FF0(&qword_100041C70);
    CheckedContinuation.resume(returning:)(v28, v21);

  }
  else
  {
    if (a1)
    {
      v28[0] = a1;
      swift_errorRetain(a1);
    }
    else
    {
      v22 = sub_100006934();
      v23 = swift_allocError(&type metadata for ExtensionConnectionError, v22, 0, 0);
      *v24 = 2;
      v28[0] = v23;
    }
    v25 = sub_100005FF0(&qword_100041C70);
    CheckedContinuation.resume(throwing:)(v28, v25);
  }
}

void sub_100004CFC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v7 = a2;
  v8 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_100004D70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void **v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  void **v15;
  void **v16;
  void ***v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void **v25;
  uint64_t v26;
  void ***v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  id v31;
  void **aBlock;
  _QWORD v33[4];
  uint64_t v34;

  v31 = a3;
  v5 = sub_100005FF0(&qword_100041C70);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000418D8 != -1)
    swift_once(&qword_1000418D8, sub_100025C4C);
  v9 = type metadata accessor for Logger(0);
  sub_1000036A4(v9, (uint64_t)qword_100043F28);
  v10 = a2;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v30 = v5;
    v13 = swift_slowAlloc(12, -1);
    v28 = a1;
    v14 = (uint8_t *)v13;
    v27 = (void ***)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    aBlock = v10;
    v15 = v10;
    v29 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v16 = v15;
    v5 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v33, v14 + 4, v14 + 12);
    v17 = v27;
    *v27 = v10;

    v8 = v29;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Reaching out to AskTo extension with payload: %@", v14, 0xCu);
    v18 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v17, 1, v18);
    swift_slowDealloc(v17, -1, -1);
    v19 = v14;
    a1 = v28;
    swift_slowDealloc(v19, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v20 = *(unsigned __int8 *)(v6 + 80);
  v21 = (v20 + 24) & ~v20;
  v22 = swift_allocObject(&unk_10003D1B8, v21 + v7, v20 | 7);
  *(_QWORD *)(v22 + 16) = v10;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v22 + v21, v8, v5);
  v33[3] = sub_100006AC0;
  v34 = v22;
  aBlock = _NSConcreteStackBlock;
  v33[0] = 1107296256;
  v33[1] = sub_100005258;
  v33[2] = &unk_10003D1D0;
  v23 = _Block_copy(&aBlock);
  v24 = v34;
  v25 = v10;
  swift_release(v24);
  objc_msgSend(v31, "messagesDataPayloadFor:reply:", v25, v23);
  _Block_release(v23);
}

uint64_t sub_10000503C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[10];
  _BYTE v27[48];

  if (a3 >> 60 == 15)
  {
    if (a1)
    {
      v26[0] = a1;
      swift_errorRetain(a1);
    }
    else
    {
      v21 = sub_100006934();
      v22 = swift_allocError(&type metadata for ExtensionConnectionError, v21, 0, 0);
      *v23 = 2;
      v26[0] = v22;
    }
    v24 = sub_100005FF0(&qword_100041C70);
    return CheckedContinuation.resume(throwing:)(v26, v24);
  }
  else
  {
    sub_100006B1C(a2, a3);
    v5 = sub_100006B1C(a2, a3);
    v25 = ATPayload.messageGUID.getter(v5);
    v7 = v6;
    v8 = sub_100005FF0(&qword_1000426C0);
    inited = swift_initStackObject(v8, v27);
    *(_OWORD *)(inited + 16) = xmmword_100030010;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSRegistrationPropertySupportsAskTo);
    *(_QWORD *)(inited + 40) = v10;
    v11 = sub_10000CE70(inited);
    swift_setDeallocating(inited);
    v12 = swift_arrayDestroy(inited + 32, 1, &type metadata for String);
    v13 = ATPayload.clientBundleIdentifier.getter(v12);
    v15 = v14;
    v16 = (void *)ATPayload.question.getter(v13);
    v17 = (void *)ATQuestion.topic.getter();

    v26[0] = a2;
    v26[1] = a3;
    v26[2] = 0xD000000000000032;
    v26[3] = 0x8000000100031570;
    v26[4] = v25;
    v26[5] = v7;
    v26[6] = v11;
    v26[7] = v13;
    v26[8] = v15;
    v26[9] = v17;
    sub_100006B60(a2, a3);
    swift_bridgeObjectRetain(v15);
    v18 = v17;
    swift_bridgeObjectRetain(0x8000000100031570);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v11);
    v19 = sub_100005FF0(&qword_100041C70);
    CheckedContinuation.resume(returning:)(v26, v19);
    sub_1000068DC(a2, a3);
    sub_1000068DC(a2, a3);

    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v7);
    return swift_bridgeObjectRelease(0x8000000100031570);
  }
}

void sub_100005258(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  uint64_t v4;
  void (*v5)(void *, void *, unint64_t);
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v3 = a3;
  v5 = *(void (**)(void *, void *, unint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    swift_retain(v4);
    v6 = a2;
    v7 = v3;
    v3 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v9 = v8;

  }
  else
  {
    swift_retain(v4);
    v10 = a2;
    v9 = 0xF000000000000000;
  }
  v5(a2, v3, v9);
  sub_1000068DC((uint64_t)v3, v9);
  swift_release(v4);

}

uint64_t sub_100005300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint8_t *v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint8_t *v45;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unsigned int (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;

  v6 = type metadata accessor for URLComponents(0);
  v104 = *(_QWORD *)(v6 - 8);
  v105 = v6;
  ((void (*)(void))__chkstk_darwin)();
  v95 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = type metadata accessor for URLQueryItem(0);
  v8 = *(_QWORD *)(v111 - 8);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v107 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v110 = (char *)&v94 - v12;
  v13 = __chkstk_darwin(v11);
  v99 = (char *)&v94 - v14;
  v15 = __chkstk_darwin(v13);
  v98 = (char *)&v94 - v16;
  v17 = __chkstk_darwin(v15);
  v97 = (char *)&v94 - v18;
  __chkstk_darwin(v17);
  v96 = (char *)&v94 - v19;
  v103 = type metadata accessor for Icon(0);
  v101 = *(_QWORD *)(v103 - 8);
  v20 = __chkstk_darwin(v103);
  v114 = (char *)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v109 = (char *)&v94 - v22;
  v102 = type metadata accessor for IconProvider(0);
  v100 = *(_QWORD *)(v102 - 8);
  __chkstk_darwin(v102);
  v108 = (char *)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_100005FF0(&qword_100041C50);
  __chkstk_darwin(v24);
  v26 = (char *)&v94 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100005FF0(&qword_100041C58);
  __chkstk_darwin(v27);
  v29 = (char *)&v94 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = type metadata accessor for URL(0);
  v30 = *(_QWORD *)(v113 - 8);
  __chkstk_darwin(v113);
  v106 = (char *)&v94 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000418D8 != -1)
    swift_once(&qword_1000418D8, sub_100025C4C);
  v32 = type metadata accessor for Logger(0);
  v33 = sub_1000036A4(v32, (uint64_t)qword_100043F28);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.default.getter();
  v36 = os_log_type_enabled(v34, v35);
  v112 = v30;
  if (v36)
  {
    v37 = a3;
    v38 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v38 = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Attempting to add icon image data to base URL", v38, 2u);
    v39 = v38;
    a3 = v37;
    v30 = v112;
    swift_slowDealloc(v39, -1, -1);
  }

  sub_100006030(a1, (uint64_t)v29);
  v40 = v113;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v29, 1, v113) == 1)
  {
    v41 = sub_1000068A0((uint64_t)v29, &qword_100041C58);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Tried adding an icon to a URL, but the given URL was nil", v44, 2u);
      v45 = v44;
      v30 = v112;
      swift_slowDealloc(v45, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(a3, 1, 1, v40);
  }
  else
  {
    v47 = v106;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v106, v29, v40);
    v48 = URLComponents.init(url:resolvingAgainstBaseURL:)(v47, 1);
    IconProvider.init()(v48);
    v49 = IconProvider.associatedContentIcon(for:)(a2);
    v50 = Icon.isBlank.getter(v49);
    IconProvider.clientIcon(for:isBadge:)(a2, v50 & 1);
    v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v104 + 48);
    if (v51(v26, 1, v105) || (v52 = URLComponents.queryItems.getter()) == 0)
    {
      v52 = swift_bridgeObjectRelease(0);
      v53 = &_swiftEmptyArrayStorage;
    }
    else
    {
      v53 = (_QWORD *)v52;
    }
    v54 = Icon.isBlank.getter(v52);
    if ((v54 & 1) != 0 || (v54 = sub_1000065C0(), !v55))
    {
      v60 = a3;
      v64 = Logger.logObject.getter(v54);
      v65 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v64, v65))
      {
        v66 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v66 = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, v65, "Tried adding associatedContentIcon data to the URL, but the icon data was nil", v66, 2u);
        swift_slowDealloc(v66, -1, -1);
      }

      v63 = 0;
    }
    else
    {
      v56 = v55;
      v57 = v97;
      URLQueryItem.init(name:value:)(0x69616E626D756874, 0xED0000617461446CLL, v54, v55);
      swift_bridgeObjectRelease(v56);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v96, v57, v111);
      if ((swift_isUniquelyReferenced_nonNull_native(v53) & 1) == 0)
        v53 = (_QWORD *)sub_10001D6C8(0, v53[2] + 1, 1, (unint64_t)v53);
      v59 = v53[2];
      v58 = v53[3];
      v60 = a3;
      if (v59 >= v58 >> 1)
        v53 = (_QWORD *)sub_10001D6C8(v58 > 1, v59 + 1, 1, (unint64_t)v53);
      v53[2] = v59 + 1;
      v61 = v111;
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))((unint64_t)v53+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v59, v96, v111);
      v62 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v97, v61);
      v63 = 1;
    }
    v67 = Icon.isBlank.getter(v62);
    if ((v67 & 1) != 0 || (v67 = sub_1000065C0(), !v68))
    {
      v75 = Logger.logObject.getter(v67);
      v76 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v75, v76))
      {
        v77 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "Tried adding clientIcon data to the URL, but the icon data was nil", v77, 2u);
        swift_slowDealloc(v77, -1, -1);
      }

      v71 = v105;
    }
    else
    {
      v69 = v68;
      v70 = v99;
      URLQueryItem.init(name:value:)(0x6349746E65696C63, 0xEE00617461446E6FLL, v67, v68);
      swift_bridgeObjectRelease(v69);
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v98, v70, v111);
      if ((swift_isUniquelyReferenced_nonNull_native(v53) & 1) == 0)
        v53 = (_QWORD *)sub_10001D6C8(0, v53[2] + 1, 1, (unint64_t)v53);
      v71 = v105;
      v73 = v53[2];
      v72 = v53[3];
      if (v73 >= v72 >> 1)
        v53 = (_QWORD *)sub_10001D6C8(v72 > 1, v73 + 1, 1, (unint64_t)v53);
      v53[2] = v73 + 1;
      v74 = v111;
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))((unint64_t)v53+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v73, v98, v111);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v99, v74);
    }
    if (v63)
      v78 = 1702195828;
    else
      v78 = 0x65736C6166;
    if (v63)
      v79 = 0xE400000000000000;
    else
      v79 = 0xE500000000000000;
    v80 = v110;
    URLQueryItem.init(name:value:)(0xD000000000000023, 0x80000001000313E0, v78, v79);
    swift_bridgeObjectRelease(v79);
    v81 = v111;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v107, v80, v111);
    if ((swift_isUniquelyReferenced_nonNull_native(v53) & 1) == 0)
      v53 = (_QWORD *)sub_10001D6C8(0, v53[2] + 1, 1, (unint64_t)v53);
    v82 = v60;
    v84 = v53[2];
    v83 = v53[3];
    v85 = v113;
    if (v84 >= v83 >> 1)
      v53 = (_QWORD *)sub_10001D6C8(v83 > 1, v84 + 1, 1, (unint64_t)v53);
    v53[2] = v84 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))((unint64_t)v53+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v84, v107, v81);
    if (v51(v26, 1, v71))
      swift_bridgeObjectRelease(v53);
    else
      URLComponents.queryItems.setter(v53);
    if (v51(v26, 1, v71))
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v110, v81);
      v86 = *(void (**)(char *, uint64_t))(v101 + 8);
      v87 = v103;
      v86(v114, v103);
      v86(v109, v87);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v108, v102);
      v88 = v112;
      (*(void (**)(char *, uint64_t))(v112 + 8))(v106, v85);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56))(v82, 1, 1, v85);
    }
    else
    {
      v89 = v104;
      v90 = v95;
      v91 = (*(uint64_t (**)(char *, char *, uint64_t))(v104 + 16))(v95, v26, v71);
      URLComponents.url.getter(v91);
      (*(void (**)(char *, uint64_t))(v89 + 8))(v90, v71);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v110, v81);
      v92 = *(void (**)(char *, uint64_t))(v101 + 8);
      v93 = v103;
      v92(v114, v103);
      v92(v109, v93);
      (*(void (**)(char *, uint64_t))(v100 + 8))(v108, v102);
      (*(void (**)(char *, uint64_t))(v112 + 8))(v106, v85);
    }
    return sub_1000068A0((uint64_t)v26, &qword_100041C50);
  }
}

uint64_t sub_100005D44()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for AppExtensionProxy()
{
  return objc_opt_self(_TtC6asktod17AppExtensionProxy);
}

_BYTE *initializeBufferWithCopyOfBuffer for AppExtension(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppExtension(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppExtension(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100005E74 + 4 * byte_100030025[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100005EA8 + 4 * byte_100030020[v4]))();
}

uint64_t sub_100005EA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005EB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100005EB8);
  return result;
}

uint64_t sub_100005EC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100005ECCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100005ED0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005ED8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100005EE4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100005EF0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppExtension()
{
  return &type metadata for AppExtension;
}

unint64_t sub_100005F10()
{
  unint64_t result;

  result = qword_100041C40;
  if (!qword_100041C40)
  {
    result = swift_getWitnessTable(&unk_1000300B0, &type metadata for AppExtension);
    atomic_store(result, (unint64_t *)&qword_100041C40);
  }
  return result;
}

uint64_t sub_100005F54(uint64_t a1)
{
  swift_getWitnessTable(&unk_100030110, a1);
  return sub_10002098C(a1);
}

unint64_t sub_100005F88(uint64_t a1)
{
  unint64_t result;

  result = sub_100005FAC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100005FAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100041C48;
  if (!qword_100041C48)
  {
    v1 = type metadata accessor for AppExtensionProxy();
    result = swift_getWitnessTable(&unk_1000300D8, v1);
    atomic_store(result, (unint64_t *)&qword_100041C48);
  }
  return result;
}

uint64_t sub_100005FF0(uint64_t *a1)
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

uint64_t sub_100006030(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005FF0(&qword_100041C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  return swift_task_switch(sub_100006094, 0, 0);
}

uint64_t sub_100006094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v7;
  _BYTE *v8;

  sub_10001766C();
  v1 = sub_100005FF0(&qword_100041C80);
  if (swift_dynamicCast(v0 + 128, v0 + 96, (char *)&type metadata for Any + 8, v1, 6))
  {
    v2 = *(_QWORD *)(v0 + 152);
    v3 = *(_QWORD *)(v0 + 128);
    *(_QWORD *)(v0 + 160) = v3;
    v4 = swift_task_alloc(32);
    *(_QWORD *)(v0 + 168) = v4;
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = v3;
    v5 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 176) = v5;
    *v5 = v0;
    v5[1] = sub_1000061DC;
    return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD00000000000003FLL, 0x8000000100031510, sub_100006A3C, v4, &type metadata for MessagesPayload);
  }
  else
  {
    v7 = sub_100006934();
    swift_allocError(&type metadata for ExtensionConnectionError, v7, 0, 0);
    *v8 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1000061DC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 176);
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_1000062A8;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 168));
    v4 = sub_100006248;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100006248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 136);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 160));
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_OWORD *)(v0 + 56);
  v5 = *(_OWORD *)(v0 + 32);
  v6 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = v5;
  *(_QWORD *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 40) = v4;
  *(_OWORD *)(v1 + 56) = v6;
  *(_QWORD *)(v1 + 72) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000062A8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 168);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 160));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000062E4(CGImage *a1)
{
  __CFData *Mutable;
  NSObject *v3;
  CGImageDestination *v4;
  CGImageDestination *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;

  Mutable = CFDataCreateMutable(0, 0);
  if (!Mutable)
  {
    if (qword_1000418D8 != -1)
      swift_once(&qword_1000418D8, sub_100025C4C);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_1000036A4(v8, (uint64_t)qword_100043F28);
    v3 = Logger.logObject.getter(v9);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v10, "CFDataCreateMutable failed", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }
    goto LABEL_19;
  }
  v3 = Mutable;
  v4 = CGImageDestinationCreateWithData(Mutable, kUTTypePNG, 1uLL, 0);
  if (!v4)
  {
    if (qword_1000418D8 != -1)
      swift_once(&qword_1000418D8, sub_100025C4C);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_1000036A4(v12, (uint64_t)qword_100043F28);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "CGImageDestinationCreateWithData failed", v16, 2u);
      swift_slowDealloc(v16, -1, -1);

      return 0;
    }

LABEL_19:
    return 0;
  }
  v5 = v4;
  CGImageDestinationAddImage(v4, a1, 0);
  if (!CGImageDestinationFinalize(v5))
  {
    if (qword_1000418D8 != -1)
      swift_once(&qword_1000418D8, sub_100025C4C);
    v17 = type metadata accessor for Logger(0);
    v18 = sub_1000036A4(v17, (uint64_t)qword_100043F28);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "CGImageDestinationFinalize failed", v21, 2u);
      swift_slowDealloc(v21, -1, -1);

      return 0;
    }

    goto LABEL_19;
  }
  v6 = v3;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v3);

  return v7;
}

uint64_t sub_1000065C0()
{
  CGImage *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  Class isa;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  CGImage *v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;

  v0 = (CGImage *)Icon.image.getter();
  v1 = sub_1000062E4(v0);
  v3 = v2;
  if (v2 >> 60 != 15)
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    v28 = 0;
    v5 = -[objc_class compressedDataUsingAlgorithm:error:](isa, "compressedDataUsingAlgorithm:error:", 3, &v28);

    v6 = v28;
    if (v5)
      goto LABEL_5;
    v7 = v6;
    v8 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease(v8);
  }
  v5 = 0;
LABEL_5:
  if (qword_1000418D8 != -1)
    swift_once(&qword_1000418D8, sub_100025C4C);
  v9 = type metadata accessor for Logger(0);
  sub_1000036A4(v9, (uint64_t)qword_100043F28);
  v10 = v5;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v13 = 134217984;
    if (!v5)
    {
      v21 = 0;
LABEL_18:
      v28 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v13 + 4, v13 + 12);

      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Icon image data is %ld bytes", v13, 0xCu);
      swift_slowDealloc(v13, -1, -1);

      if (!v5)
        goto LABEL_19;
      goto LABEL_16;
    }
    v26 = v1;
    v27 = v3;
    v14 = v10;
    v15 = NSData.startIndex.getter();
    v16 = NSData.endIndex.getter();
    v17 = NSData.startIndex.getter();
    v18 = NSData.endIndex.getter();
    if (v15 < v17 || v18 < v15)
    {
      __break(1u);
    }
    else
    {
      v25 = v0;
      v19 = NSData.startIndex.getter();
      v20 = NSData.endIndex.getter();

      if (v16 >= v19 && v20 >= v16)
      {
        v21 = (void *)(v16 - v15);
        if (!__OFSUB__(v16, v15))
        {
          v0 = v25;
          v1 = v26;
          v3 = v27;
          goto LABEL_18;
        }
LABEL_23:
        __break(1u);
      }
    }
    __break(1u);
    goto LABEL_23;
  }

  if (!v5)
  {
LABEL_19:
    sub_1000068DC(v1, v3);

    return 0;
  }
LABEL_16:
  v22 = objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  sub_1000068DC(v1, v3);

  return v23;
}

uint64_t sub_1000068A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005FF0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000068DC(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1000068F0(result, a2);
  return result;
}

uint64_t sub_1000068F0(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_100006934()
{
  unint64_t result;

  result = qword_100041C60;
  if (!qword_100041C60)
  {
    result = swift_getWitnessTable(&unk_100030A04, &type metadata for ExtensionConnectionError);
    atomic_store(result, (unint64_t *)&qword_100041C60);
  }
  return result;
}

uint64_t sub_100006978(uint64_t a1)
{
  uint64_t v1;

  return sub_100004564(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100006984(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005FF0(&qword_100041C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1000069D0(uint64_t a1, void *a2)
{
  sub_100005FF0(&qword_100041C70);
  sub_100004B5C(a1, a2);
}

uint64_t sub_100006A24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006A34(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100006A3C(uint64_t a1)
{
  uint64_t v1;

  sub_100004D70(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100006A48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005FF0(&qword_100041C70);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100006AC0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_100005FF0(&qword_100041C70);
  return sub_10000503C(a1, a2, a3);
}

uint64_t sub_100006B1C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100006B60(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100006B1C(result, a2);
  return result;
}

void sub_100006B74(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_100003DA4(a1, a2, a3, v3);
}

uint64_t sub_100006B8C()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006BB4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100006BC8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006BF4()
{
  uint64_t *v0;

  return sub_100003E44(v0[2], v0[3], v0[4]);
}

uint64_t initializeBufferWithCopyOfBuffer for Client.Metadata(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

void destroy for MessagesPayload(uint64_t a1)
{
  unint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >> 60 != 15)
    sub_1000068F0(*(_QWORD *)a1, v2);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 64));

}

uint64_t initializeWithCopy for MessagesPayload(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    sub_100006B1C(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v6 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v6;
  v7 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v7;
  v9 = a2[6];
  v8 = a2[7];
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v8;
  v11 = a2[8];
  v10 = (void *)a2[9];
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v10;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v11);
  v12 = v10;
  return a1;
}

uint64_t *assignWithCopy for MessagesPayload(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *a2;
      sub_100006B1C(*a2, a2[1]);
      v7 = *a1;
      v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_1000068F0(v7, v8);
      goto LABEL_8;
    }
    sub_100006E74((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v5 = *a2;
  sub_100006B1C(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  a1[2] = a2[2];
  v9 = a2[3];
  v10 = a1[3];
  a1[3] = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  a1[4] = a2[4];
  v11 = a2[5];
  v12 = a1[5];
  a1[5] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  v13 = a2[6];
  v14 = a1[6];
  a1[6] = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14);
  a1[7] = a2[7];
  v15 = a2[8];
  v16 = a1[8];
  a1[8] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  v17 = (void *)a2[9];
  v18 = (void *)a1[9];
  a1[9] = (uint64_t)v17;
  v19 = v17;

  return a1;
}

uint64_t sub_100006E74(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for Data - 1) + 8))();
  return a1;
}

__n128 initializeWithTake for MessagesPayload(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t *assignWithTake for MessagesPayload(uint64_t *a1, uint64_t *a2)
{
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
  void *v14;

  v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_1000068F0(v6, v4);
      goto LABEL_6;
    }
    sub_100006E74((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  v7 = a2[3];
  v8 = a1[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease(v8);
  v9 = a2[5];
  v10 = a1[5];
  a1[4] = a2[4];
  a1[5] = v9;
  swift_bridgeObjectRelease(v10);
  v11 = a1[6];
  a1[6] = a2[6];
  swift_bridgeObjectRelease(v11);
  v12 = a2[8];
  v13 = a1[8];
  a1[7] = a2[7];
  a1[8] = v12;
  swift_bridgeObjectRelease(v13);
  v14 = (void *)a1[9];
  a1[9] = a2[9];

  return a1;
}

uint64_t getEnumTagSinglePayload for MessagesPayload(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MessagesPayload(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesPayload()
{
  return &type metadata for MessagesPayload;
}

unint64_t sub_100007028(uint64_t a1)
{
  const char *v1;
  Swift::String v2;
  Swift::String v3;
  void *object;
  Swift::String v5;

  if (!BYTE4(a1))
  {
    _StringGuts.grow(_:)(61);
    v1 = "The Biome event had an invalid Screen Time request status ";
    goto LABEL_5;
  }
  if (BYTE4(a1) == 1)
  {
    _StringGuts.grow(_:)(61);
    v1 = "The Biome event had an unknown Screen Time request answer ";
LABEL_5:
    v2._object = (void *)((unint64_t)(v1 - 32) | 0x8000000000000000);
    v2._countAndFlagsBits = 0xD00000000000003ALL;
    String.append(_:)(v2);
    v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
    object = v3._object;
    String.append(_:)(v3);
    swift_bridgeObjectRelease(object);
    v5._countAndFlagsBits = 46;
    v5._object = (void *)0xE100000000000000;
    String.append(_:)(v5);
    return 0;
  }
  if ((_DWORD)a1)
    return 0xD00000000000002FLL;
  else
    return 0xD00000000000002DLL;
}

unint64_t sub_100007144()
{
  unsigned int *v0;

  return sub_100007028(*v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32));
}

uint64_t sub_100007170()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_1000096E8(1, v0, (uint64_t)&off_100041D48);
  v2 = sub_100005FF0(&qword_100041D68);
  swift_allocObject(v2, 48, 7);
  v3 = v1;
  v4 = sub_100007884((uint64_t)v3);
  v5 = swift_allocObject(v0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v4 + 24) = &off_100041D30;
  swift_unknownObjectWeakAssign(v4 + 16, v5);
  swift_retain(v4);
  sub_100007A18();
  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_1000036A4(v6, (uint64_t)qword_100043FA0);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v14 = v11;
    *(_DWORD *)v10 = 136315138;
    v13 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10 + 4, v10 + 12);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%s init complete", v10, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);

    swift_release(v4);
  }
  else
  {

    swift_release(v4);
  }
  return v5;
}

uint64_t sub_100007394()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ScreenTimeRequestBiomeEventHandler()
{
  return objc_opt_self(_TtC6asktod34ScreenTimeRequestBiomeEventHandler);
}

void sub_1000073D8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_1000036A4(v0, (uint64_t)qword_100043FA0);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(12, -1);
    v5 = swift_slowAlloc(32, -1);
    v7 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v6, &v7, v4 + 4, v4 + 12);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s completing transaction", v4, 0xCu);
    swift_arrayDestroy(v5, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1, -1);
    swift_slowDealloc(v4, -1, -1);
  }

  OSTransaction.complete()();
}

uint64_t sub_100007554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  *(_QWORD *)(v6 + 64) = a6;
  v10 = (uint64_t (*)(uint64_t))((char *)&dword_100041D90 + dword_100041D90);
  v8 = (_QWORD *)swift_task_alloc(unk_100041D94);
  *(_QWORD *)(v6 + 72) = v8;
  *v8 = v6;
  v8[1] = sub_1000075B8;
  return v10(a5);
}

uint64_t sub_1000075B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_10000764C;
  else
    v3 = sub_10000761C;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000761C()
{
  uint64_t v0;

  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000764C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v1 = *(_QWORD *)(v0 + 80);
  v2 = type metadata accessor for Logger(0);
  sub_1000036A4(v2, (uint64_t)qword_100043FA0);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 80);
  if (v6)
  {
    v8 = swift_slowAlloc(22, -1);
    v9 = swift_slowAlloc(64, -1);
    v14 = v9;
    *(_DWORD *)v8 = 136315394;
    *(_QWORD *)(v0 + 40) = sub_100027030(0xD000000000000011, 0x8000000100031230, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v8 + 4, v8 + 12);
    *(_WORD *)(v8 + 12) = 2080;
    swift_getErrorValue(v7, v0 + 48, v0 + 16);
    v10 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    v12 = v11;
    *(_QWORD *)(v0 + 56) = sub_100027030(v10, v11, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v8 + 14, v8 + 22);
    swift_bridgeObjectRelease(v12);
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s event error: %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy(v9, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

    swift_errorRelease(v7);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 80));
    swift_errorRelease(v7);
    swift_errorRelease(v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100007884(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  *(_QWORD *)(v1 + 24) = 0;
  swift_unknownObjectWeakInit(v1 + 16, 0);
  *(_QWORD *)(v1 + 40) = 0;
  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043FA0);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v11 = v8;
    *(_DWORD *)v7 = 136315138;
    v10 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "BiomeStreamListener create for %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  *(_QWORD *)(v2 + 32) = a1;
  return v2;
}

void sub_100007A18()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (*v14)(uint64_t);
  uint64_t v15;

  v1 = objc_msgSend((id)objc_opt_self(BMStreams), "screenTimeRequestStream");
  v2 = objc_msgSend(v1, "publisher");

  v3 = objc_msgSend(v2, "subscribeOn:", *(_QWORD *)(v0 + 32));
  v14 = sub_1000082F8;
  v15 = v0;
  v10 = _NSConcreteStackBlock;
  v11 = 1107296256;
  v12 = sub_100007D40;
  v13 = &unk_10003D360;
  v4 = _Block_copy(&v10);
  v5 = v15;
  swift_retain(v0);
  swift_release(v5);
  v14 = (void (*)(uint64_t))sub_100008318;
  v15 = v0;
  v10 = _NSConcreteStackBlock;
  v11 = 1107296256;
  v12 = sub_100007D90;
  v13 = &unk_10003D388;
  v6 = _Block_copy(&v10);
  v7 = v15;
  swift_retain(v0);
  swift_release(v7);
  v8 = objc_msgSend(v3, "sinkWithCompletion:receiveInput:", v4, v6);

  _Block_release(v6);
  _Block_release(v4);
  v9 = *(void **)(v0 + 40);
  *(_QWORD *)(v0 + 40) = v8;

}

void sub_100007B98(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v3 = type metadata accessor for Logger(0);
  sub_1000036A4(v3, (uint64_t)qword_100043FA0);
  v4 = swift_retain(a2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v10 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v7 + 4, v7 + 12);
    swift_release(a2);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Biome stream sunk for %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

    swift_release(a2);
  }
}

void sub_100007D40(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_100007D90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

void sub_100007DD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t Strong;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = v1;
  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043FA0);
  v5 = swift_retain(v1);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v34 = v9;
    *(_DWORD *)v8 = 136315138;
    v33 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v8 + 4, v8 + 12);
    swift_release(v1);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s receive input", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_release(v1);
  }
  swift_unknownObjectRetain(a1);
  v10 = objc_opt_self(BMStoreEvent);
  v11 = swift_dynamicCastObjCClass(a1, v10);
  if (v11)
  {
    v12 = (void *)v11;
    Strong = swift_unknownObjectWeakLoadStrong(v1 + 16);
    if (Strong)
    {
      v14 = Strong;
      sub_1000090F8(v12);
      swift_unknownObjectRelease(a1);
      v15 = v14;
    }
    else
    {
      v28 = swift_retain(v1);
      v29 = Logger.logObject.getter(v28);
      v30 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc(12, -1);
        v32 = swift_slowAlloc(32, -1);
        v34 = v32;
        *(_DWORD *)v31 = 136315138;
        v33 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v31 + 4, v31 + 12);
        swift_release(v2);
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s received event, but has no delegate to notify", v31, 0xCu);
        swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v32, -1, -1);
        swift_slowDealloc(v31, -1, -1);

      }
      else
      {

        swift_release(v2);
      }
      v15 = a1;
    }
    swift_unknownObjectRelease(v15);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    swift_retain_n(v1, 2);
    v16 = swift_unknownObjectRetain_n(a1, 2);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc(32, -1);
      v20 = swift_slowAlloc(96, -1);
      v34 = v20;
      *(_DWORD *)v19 = 136315650;
      swift_release(v2);
      v33 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v19 + 4, v19 + 12);
      swift_release(v2);
      *(_WORD *)(v19 + 12) = 2080;
      v33 = a1;
      swift_unknownObjectRetain(a1);
      v21 = String.init<A>(describing:)(&v33, (char *)&type metadata for Swift.AnyObject + 8);
      v23 = v22;
      v33 = sub_100027030(v21, v22, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v19 + 14, v19 + 22);
      swift_unknownObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v23);
      *(_WORD *)(v19 + 22) = 2080;
      v33 = sub_100005FF0(&qword_100041D70);
      v24 = sub_100005FF0(&qword_100041D78);
      v25 = String.init<A>(describing:)(&v33, v24);
      v27 = v26;
      v33 = sub_100027030(v25, v26, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v19 + 24, v19 + 32);
      swift_bridgeObjectRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s has the wrong type: %s, expected: %s", (uint8_t *)v19, 0x20u);
      swift_arrayDestroy(v20, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v19, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n(a1, 2);
      swift_release_n(v2, 2);
    }
  }
}

void sub_1000082F8(uint64_t a1)
{
  uint64_t v1;

  sub_100007B98(a1, v1);
}

uint64_t sub_100008300(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008310(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000831C(int a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a1 == 2)
    return 0;
  if (a1 == 3)
  {
    result = a2;
    switch(a2)
    {
      case 0u:
        if (qword_100041900 != -1)
          swift_once(&qword_100041900, sub_100025D04);
        v5 = type metadata accessor for Logger(0);
        v6 = sub_1000036A4(v5, (uint64_t)qword_100043FA0);
        v7 = Logger.logObject.getter(v6);
        v8 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v7, v8))
        {
          v9 = swift_slowAlloc(18, -1);
          v10 = swift_slowAlloc(32, -1);
          v30 = v10;
          *(_DWORD *)v9 = 67109378;
          LODWORD(v28) = 0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, (char *)&v28 + 4, v9 + 4, v9 + 8);
          *(_WORD *)(v9 + 8) = 2080;
          v28 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v30);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v9 + 10, v9 + 18);
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unknown approval time %d for %s", (uint8_t *)v9, 0x12u);
          swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v10, -1, -1);
          swift_slowDealloc(v9, -1, -1);
        }

        v11 = sub_1000095A8();
        swift_allocError(&type metadata for ScreenTimeRequestBiomeEventHandler.Error, v11, 0, 0);
        *(_DWORD *)v12 = 0;
        goto LABEL_20;
      case 1u:
        return result;
      case 2u:
        return 2;
      case 3u:
        return 3;
      default:
        if (qword_100041900 != -1)
          swift_once(&qword_100041900, sub_100025D04);
        v21 = type metadata accessor for Logger(0);
        v22 = sub_1000036A4(v21, (uint64_t)qword_100043FA0);
        v23 = Logger.logObject.getter(v22);
        v24 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = swift_slowAlloc(18, -1);
          v26 = swift_slowAlloc(32, -1);
          v30 = v26;
          *(_DWORD *)v25 = 67109378;
          LODWORD(v28) = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, (char *)&v28 + 4, v25 + 4, v25 + 8);
          *(_WORD *)(v25 + 8) = 2080;
          v28 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v30);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v25 + 10, v25 + 18);
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unknown approval time %d for %s", (uint8_t *)v25, 0x12u);
          swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v26, -1, -1);
          swift_slowDealloc(v25, -1, -1);
        }

        v27 = sub_1000095A8();
        swift_allocError(&type metadata for ScreenTimeRequestBiomeEventHandler.Error, v27, 0, 0);
        *(_DWORD *)v12 = a2;
LABEL_20:
        v20 = 1;
        goto LABEL_21;
    }
  }
  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v13 = type metadata accessor for Logger(0);
  v14 = sub_1000036A4(v13, (uint64_t)qword_100043FA0);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(18, -1);
    v18 = swift_slowAlloc(32, -1);
    v30 = v18;
    *(_DWORD *)v17 = 67109378;
    LODWORD(v28) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, (char *)&v28 + 4, v17 + 4, v17 + 8);
    *(_WORD *)(v17 + 8) = 2080;
    v28 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v17 + 10, v17 + 18);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Invalid status %d for %s", (uint8_t *)v17, 0x12u);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);
  }

  v19 = sub_1000095A8();
  swift_allocError(&type metadata for ScreenTimeRequestBiomeEventHandler.Error, v19, 0, 0);
  v20 = 0;
  *(_DWORD *)v12 = a1;
LABEL_21:
  *(_BYTE *)(v12 + 4) = v20;
  return swift_willThrow();
}

uint64_t sub_100008828(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = a1;
  return swift_task_switch(sub_100008840, 0, 0);
}

uint64_t sub_100008840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t (*v25)(void);
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  os_log_type_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  NSObject *log;
  os_log_type_t type;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52[2];

  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_1000036A4(v1, (uint64_t)qword_100043FA0);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v52[0] = v6;
    *(_DWORD *)v5 = 136315138;
    *(_QWORD *)(v0 + 96) = sub_100027030(0xD000000000000011, 0x8000000100031230, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Handling %s biome event", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);
  }

  v7 = objc_msgSend(*(id *)(v0 + 104), "eventBody");
  *(_QWORD *)(v0 + 112) = v7;
  if (!v7)
  {
    v14 = Logger.logObject.getter(0);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(12, -1);
      v17 = swift_slowAlloc(32, -1);
      v52[0] = v17;
      *(_DWORD *)v16 = 136315138;
      *(_QWORD *)(v0 + 56) = sub_100027030(0xD000000000000011, 0x8000000100031230, v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v16 + 4, v16 + 12);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "No event body for %s", v16, 0xCu);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v16, -1, -1);
    }

    v18 = sub_1000095A8();
    v19 = swift_allocError(&type metadata for ScreenTimeRequestBiomeEventHandler.Error, v18, 0, 0);
    *(_DWORD *)v20 = 0;
    *(_BYTE *)(v20 + 4) = 2;
    swift_willThrow(v19);
    goto LABEL_19;
  }
  v8 = v7;
  if (objc_msgSend(v7, "status") == 1)
  {
    v9 = v8;
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc(18, -1);
      v52[0] = swift_slowAlloc(32, -1);
      v13 = v52[0];
      *(_DWORD *)v12 = 67109378;
      *(_DWORD *)(v0 + 152) = objc_msgSend(v9, "status");
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v0 + 156, v12 + 4, v12 + 8);

      *(_WORD *)(v12 + 8) = 2080;
      *(_QWORD *)(v0 + 88) = sub_100027030(0xD000000000000011, 0x8000000100031230, v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v12 + 10, v12 + 18);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Status was %d (pending) for %s. Ignoring biome event.", (uint8_t *)v12, 0x12u);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);

    }
    else
    {

    }
    v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  v21 = objc_msgSend(v8, "responderDSID");
  if (!v21)
  {
    v26 = Logger.logObject.getter(0);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Event body did not contain a DSID.", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }

    v29 = sub_1000095A8();
    v30 = swift_allocError(&type metadata for ScreenTimeRequestBiomeEventHandler.Error, v29, 0, 0);
    *(_DWORD *)v31 = 1;
    *(_BYTE *)(v31 + 4) = 2;
    swift_willThrow(v30);

LABEL_19:
    v25 = *(uint64_t (**)(void))(v0 + 8);
    return v25();
  }
  v22 = v21;
  v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v24 = v23;

  *(_QWORD *)(v0 + 120) = v24;
  v33 = sub_10000831C((int)objc_msgSend(v8, "status"), objc_msgSend(v8, "approvalTime"));
  v34 = objc_msgSend(v8, "requestID");
  v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
  v37 = v36;

  *(_QWORD *)(v0 + 128) = v37;
  *(_QWORD *)(v0 + 16) = v35;
  *(_QWORD *)(v0 + 24) = v37;
  *(_QWORD *)(v0 + 32) = v51;
  *(_QWORD *)(v0 + 40) = v24;
  *(_QWORD *)(v0 + 48) = v33;
  swift_bridgeObjectRetain_n(v24, 2);
  v38 = v8;
  v39 = Logger.logObject.getter(v38);
  v40 = static os_log_type_t.default.getter();
  v41 = v40;
  if (os_log_type_enabled(v39, v40))
  {
    type = v41;
    v42 = swift_slowAlloc(32, -1);
    v50 = swift_slowAlloc(64, -1);
    v52[0] = v50;
    *(_DWORD *)v42 = 136315650;
    v43 = objc_msgSend(v38, "requestID");
    log = v39;
    v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
    v46 = v45;

    *(_QWORD *)(v0 + 64) = sub_100027030(v44, v46, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v42 + 4, v42 + 12);
    swift_bridgeObjectRelease(v46);

    *(_WORD *)(v42 + 12) = 2080;
    swift_bridgeObjectRetain(v24);
    *(_QWORD *)(v0 + 72) = sub_100027030(v51, v24, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v42 + 14, v42 + 22);
    swift_bridgeObjectRelease_n(v24, 3);
    *(_WORD *)(v42 + 22) = 2048;
    *(_QWORD *)(v0 + 80) = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v42 + 24, v42 + 32);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Calling into ScreenTimeAnswerHandler with requestID %s, responderDSID: %s, answer: %ld", (uint8_t *)v42, 0x20u);
    swift_arrayDestroy(v50, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1, -1);
    swift_slowDealloc(v42, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v24, 2);
  }
  v47 = (_QWORD *)swift_task_alloc(dword_100042524);
  *(_QWORD *)(v0 + 136) = v47;
  *v47 = v0;
  v47[1] = sub_10000900C;
  return sub_100019864();
}

uint64_t sub_10000900C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_1000090B4;
  else
    v3 = sub_100009070;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100009070()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(void **)(v0 + 112);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 128));
  swift_bridgeObjectRelease(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000090B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(void **)(v0 + 112);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 128));
  swift_bridgeObjectRelease(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000090F8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  NSObject *v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;

  v2 = v1;
  v4 = sub_100005FF0(&qword_100042990);
  __chkstk_darwin(v4);
  v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_1000036A4(v7, (uint64_t)qword_100043FA0);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v28[1] = v8;
    v13 = v12;
    v30 = v12;
    *(_DWORD *)v11 = 136315138;
    v29 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v11 + 4, v11 + 12);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s event consume", v11, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  v14 = type metadata accessor for OSTransaction(0);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  v15 = OSTransaction.init(name:)("com.apple.asktod.biomeStreamListener", 36, 2);
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v6, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject(&unk_10003D3C0, 56, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v2;
  v18[5] = a1;
  v18[6] = v16;
  swift_retain(v2);
  v19 = a1;
  v20 = v16;
  v21 = sub_100029A8C((uint64_t)v6, (uint64_t)&unk_100041D88, (uint64_t)v18);
  swift_release(v21);
  OS_dispatch_group.wait()();
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    v26 = swift_slowAlloc(32, -1);
    v30 = v26;
    *(_DWORD *)v25 = 136315138;
    v29 = sub_100027030(0xD000000000000011, 0x8000000100031230, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v25 + 4, v25 + 12);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s eventHandler complete", v25, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

  }
  sub_1000073D8();
  return swift_release(v15);
}

uint64_t sub_100009498()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000094D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = (_QWORD *)swift_task_alloc(dword_100041D84);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_100009560;
  v4[8] = v3;
  v7 = (uint64_t (*)(uint64_t))((char *)&dword_100041D90 + dword_100041D90);
  v5 = (_QWORD *)swift_task_alloc(unk_100041D94);
  v4[9] = v5;
  *v5 = v4;
  v5[1] = sub_1000075B8;
  return v7(v2);
}

uint64_t sub_100009560()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_1000095A8()
{
  unint64_t result;

  result = qword_100041D98;
  if (!qword_100041D98)
  {
    result = swift_getWitnessTable(&unk_100030214, &type metadata for ScreenTimeRequestBiomeEventHandler.Error);
    atomic_store(result, (unint64_t *)&qword_100041D98);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ScreenTimeRequestBiomeEventHandler.Error(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScreenTimeRequestBiomeEventHandler.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 4);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeRequestBiomeEventHandler.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = -(char)a2;
  }
  return result;
}

uint64_t sub_10000968C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 4) <= 1u)
    return *(unsigned __int8 *)(a1 + 4);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1000096A4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 4) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeRequestBiomeEventHandler.Error()
{
  return &type metadata for ScreenTimeRequestBiomeEventHandler.Error;
}

ValueMetadata *type metadata accessor for BiomeController()
{
  return &type metadata for BiomeController;
}

id sub_1000096E8(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void *v23;
  id v24;
  NSString v25;
  id v26;
  _QWORD v28[3];
  char *v29;
  int v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;

  v30 = a1;
  v28[2] = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v29 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = 0;
  v33 = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease(v33);
  v12 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
  v12(a2, a3);
  v28[1] = sub_100009A78();
  v32 = 0;
  v33 = 0xE000000000000000;
  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease(v33);
  v12(a2, a3);
  v13 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v8);
  static DispatchQoS.unspecified.getter(v13);
  v32 = &_swiftEmptyArrayStorage;
  sub_100009AB4();
  v14 = sub_100005FF0(&qword_100041E10);
  v15 = sub_100009AFC();
  v16 = v29;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v32, v14, v15);
  v17 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002ELL, 0x8000000100031760, v7, v16, v11, 0);
  if (qword_100041900 != -1)
    swift_once(&qword_100041900, sub_100025D04);
  v18 = type metadata accessor for Logger(0);
  v19 = sub_1000036A4(v18, (uint64_t)qword_100043FA0);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = (void *)swift_slowAlloc(32, -1);
    v32 = v23;
    *(_DWORD *)v22 = 136315138;
    v31 = sub_100027030(0xD000000000000022, 0x8000000100031730, (uint64_t *)&v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v22 + 4, v22 + 12);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Creating listening scheduler for %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }

  v24 = objc_allocWithZone((Class)BMBiomeScheduler);
  v25 = String._bridgeToObjectiveC()();
  v26 = objc_msgSend(v24, "initWithIdentifier:targetQueue:waking:", v25, v17, v30 & 1);

  return v26;
}

unint64_t sub_100009A78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100041E00;
  if (!qword_100041E00)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100041E00);
  }
  return result;
}

unint64_t sub_100009AB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100041E08;
  if (!qword_100041E08)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_100041E08);
  }
  return result;
}

unint64_t sub_100009AFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100041E18;
  if (!qword_100041E18)
  {
    v1 = sub_100009B48(&qword_100041E10);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100041E18);
  }
  return result;
}

uint64_t sub_100009B48(uint64_t *a1)
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

uint64_t sub_100009B8C(uint64_t a1, void *a2, char a3)
{
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  void *object;
  _QWORD v12[3];
  _BYTE v13[8];
  uint64_t v14;
  unint64_t v15;

  v14 = 0;
  v15 = 0xE000000000000000;
  if ((a3 & 1) != 0)
  {
    swift_errorRetain(a1);
    _StringGuts.grow(_:)(54);
    v8._countAndFlagsBits = 0xD000000000000034;
    v8._object = (void *)0x80000001000319B0;
    String.append(_:)(v8);
    swift_getErrorValue(a1, v13, v12);
    v9._countAndFlagsBits = Error.localizedDescription.getter(v12[1], v12[2]);
    object = v9._object;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(object);
    sub_10000F5F4(a1, (uint64_t)a2, 1);
  }
  else
  {
    _StringGuts.grow(_:)(63);
    v5._countAndFlagsBits = 0xD000000000000022;
    v5._object = (void *)0x80000001000319F0;
    String.append(_:)(v5);
    v6._countAndFlagsBits = a1;
    v6._object = a2;
    String.append(_:)(v6);
    v7._object = (void *)0x8000000100031A20;
    v7._countAndFlagsBits = 0xD00000000000001BLL;
    String.append(_:)(v7);
  }
  return v14;
}

uint64_t sub_100009CB4()
{
  uint64_t v0;

  return sub_100009B8C(*(_QWORD *)v0, *(void **)(v0 + 8), *(_BYTE *)(v0 + 16));
}

__objc2_prot *sub_100009CC0()
{
  qword_100043EF0 = (uint64_t)&OBJC_PROTOCOL____TtP9AskToCore16ATDaemonProtocol_;
  return &OBJC_PROTOCOL____TtP9AskToCore16ATDaemonProtocol_;
}

uint64_t sub_100009CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[31] = a2;
  v3[32] = v2;
  v3[30] = a1;
  return swift_task_switch(sub_100009CF0, 0, 0);
}

uint64_t sub_100009CF0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *Strong;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v27;

  v1 = (_QWORD *)(v0 + 136);
  v2 = (_QWORD *)(v0 + 176);
  Strong = (_QWORD *)swift_weakLoadStrong(*(_QWORD *)(v0 + 256) + 24);
  if (Strong
    && (v4 = Strong,
        v5 = Strong[6],
        v6 = Strong[8],
        v7 = Strong[10],
        sub_10000F268(v5, Strong[7], v6, Strong[9], v7),
        swift_release(v4),
        v6))
  {
    v8 = v5;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v7);
    *v2 = 0;
    if (v5 != 4)
    {
      v9 = type metadata accessor for AppExtensionProxy();
      v10 = swift_allocObject(v9, 32, 7);
      v11 = sub_100025DF4((uint64_t)&_swiftEmptyArrayStorage);
      v12 = 0;
      *(_QWORD *)(v10 + 24) = v11;
      *(_BYTE *)(v10 + 16) = v8 != 3;
      goto LABEL_7;
    }
  }
  else
  {
    *v2 = 0;
  }
  v9 = type metadata accessor for AppExtensionProxy();
  v10 = swift_allocObject(v9, 32, 7);
  *(_QWORD *)(v10 + 24) = sub_100025DF4((uint64_t)&_swiftEmptyArrayStorage);
  v12 = 1;
  *(_BYTE *)(v10 + 16) = 1;
  LOBYTE(v8) = 4;
LABEL_7:
  *(_BYTE *)(v0 + 321) = v12;
  *(_BYTE *)(v0 + 320) = v8;
  *(_BYTE *)(v10 + 17) = v8;
  *(_QWORD *)(v0 + 160) = v9;
  *(_QWORD *)(v0 + 168) = sub_10000F46C();
  *(_QWORD *)(v0 + 136) = v10;
  if (qword_1000418C8 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v13 = type metadata accessor for Logger(0);
  *(_QWORD *)(v0 + 264) = sub_1000036A4(v13, (uint64_t)qword_100043EF8);
  v14 = sub_10000F4B4(v0 + 136, v0 + 96);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v27 = swift_slowAlloc(32, -1);
    v18 = v27;
    *(_DWORD *)v17 = 136315138;
    v20 = *(_QWORD *)(v0 + 120);
    v19 = *(_QWORD *)(v0 + 128);
    sub_100003680((_QWORD *)(v0 + 96), v20);
    v21 = dispatch thunk of CustomStringConvertible.description.getter(v20, *(_QWORD *)(v19 + 8));
    v23 = v22;
    *(_QWORD *)(v0 + 232) = sub_100027030(v21, v22, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 232, v0 + 240, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease(v23);
    sub_10000EE64((_QWORD *)(v0 + 96));
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Calling into app extension to get Messages data payload. messagesPayloadProvider: %s", v17, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    v24 = v18;
    v1 = (_QWORD *)(v0 + 136);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v17, -1, -1);
  }
  else
  {
    sub_10000EE64((_QWORD *)(v0 + 96));
  }

  sub_100003680(v1, *(_QWORD *)(v0 + 160));
  v25 = (_QWORD *)swift_task_alloc(dword_100041B54);
  *(_QWORD *)(v0 + 272) = v25;
  *v25 = v0;
  v25[1] = sub_100009FF0;
  return sub_100003EE0(v0 + 16, *(_QWORD *)(v0 + 240));
}

uint64_t sub_100009FF0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 272);
  *(_QWORD *)(*v1 + 280) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v2 + 176));
    v4 = sub_10000A37C;
  }
  else
  {
    v4 = sub_10000A05C;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000A05C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *Strong;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0 + 16;
  Strong = (uint64_t *)swift_weakLoadStrong(*(_QWORD *)(v0 + 256) + 24);
  if (Strong
    && (v3 = Strong,
        v4 = Strong[8],
        v6 = Strong[9],
        v5 = Strong[10],
        sub_10000F268(Strong[6], v3[7], v3[8], v3[9], v3[10]),
        Strong = (uint64_t *)swift_release(v3),
        v4))
  {
    Strong = (uint64_t *)swift_bridgeObjectRelease(v4);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *(_QWORD *)(v0 + 248);
  v8 = (void *)ATPayload.question.getter(Strong);
  v9 = (void *)ATQuestion.topic.getter();

  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v6, v5, v9, 1500);
  swift_bridgeObjectRelease(v5);
  swift_retain_n(v7, 2);
  v10 = sub_10000F4F8((uint64_t *)(v0 + 16));
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(_QWORD *)(v0 + 248);
  if (v13)
  {
    v15 = swift_slowAlloc(22, -1);
    v24 = swift_slowAlloc(64, -1);
    v25 = v24;
    *(_DWORD *)v15 = 136315394;
    v16 = *(_QWORD *)(v0 + 32);
    v17 = *(_QWORD *)(v0 + 40);
    swift_bridgeObjectRetain(v17);
    *(_QWORD *)(v0 + 216) = sub_100027030(v16, v17, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v17);
    sub_10000F564((uint64_t *)(v0 + 16));
    *(_WORD *)(v15 + 12) = 2080;
    v18 = ATRecipientGroup.debugDescription.getter(*(unsigned __int16 *)(v14 + 26));
    v20 = v19;
    *(_QWORD *)(v0 + 224) = sub_100027030(v18, v19, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v0 + 232, v15 + 14, v15 + 22);
    swift_bridgeObjectRelease(v20);
    swift_release_n(v14, 2);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Sending message with Messages extension bundle identifier \"%s\" to %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v24, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }
  else
  {
    sub_10000F564((uint64_t *)(v0 + 16));
    swift_release_n(v14, 2);
  }

  if ((*(_BYTE *)(v0 + 321) & 1) != 0
    || !sub_10000ACEC(*(_BYTE *)(v0 + 320), *(_QWORD *)(*(_QWORD *)(v0 + 256) + 16)))
  {
    sub_100003680((_QWORD *)(*(_QWORD *)(v0 + 256) + 32), *(_QWORD *)(*(_QWORD *)(v0 + 256) + 56));
    *(_QWORD *)(v0 + 208) = 0;
    v23 = (_QWORD *)swift_task_alloc(dword_10004240C);
    *(_QWORD *)(v0 + 304) = v23;
    *v23 = v0;
    v23[1] = sub_10000A9A8;
    return sub_100014C10(v1, *(_QWORD *)(v0 + 248), 0, v0 + 208);
  }
  else
  {
    sub_100003680((_QWORD *)(*(_QWORD *)(v0 + 256) + 32), *(_QWORD *)(*(_QWORD *)(v0 + 256) + 56));
    v21 = (_QWORD *)swift_task_alloc(dword_10004240C);
    *(_QWORD *)(v0 + 288) = v21;
    *v21 = v0;
    v21[1] = sub_10000A630;
    return sub_100014C10(v1, *(_QWORD *)(v0 + 248), 1, v0 + 176);
  }
}

uint64_t sub_10000A37C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *log;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28[2];

  v1 = *(_QWORD *)(v0 + 280);
  v3 = *(void **)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  sub_10000EE64((_QWORD *)(v0 + 136));
  swift_retain(v2);
  v4 = v3;
  swift_errorRetain(v1);
  swift_retain(v2);
  v5 = v4;
  v6 = swift_errorRetain(v1);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    log = v7;
    v10 = *(void **)(v0 + 240);
    v9 = *(_QWORD *)(v0 + 248);
    v11 = swift_slowAlloc(32, -1);
    v26 = (uint64_t *)swift_slowAlloc(8, -1);
    v27 = swift_slowAlloc(64, -1);
    v28[0] = v27;
    *(_DWORD *)v11 = 136315650;
    v12 = (void *)ATPayload.question.getter(v27);
    v13 = ATQuestion.description.getter();
    v15 = v14;

    *(_QWORD *)(v0 + 184) = sub_100027030(v13, v15, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v15);

    *(_WORD *)(v11 + 12) = 2080;
    v16 = ATRecipientGroup.debugDescription.getter(*(unsigned __int16 *)(v9 + 26));
    v18 = v17;
    *(_QWORD *)(v0 + 192) = sub_100027030(v16, v17, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v18);
    swift_release_n(v9, 2);
    *(_WORD *)(v11 + 22) = 2112;
    swift_errorRetain(v1);
    v19 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 200) = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v11 + 24, v11 + 32);
    *v26 = v19;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    v7 = log;
    _os_log_impl((void *)&_mh_execute_header, log, v8, "Failed to send payload over Messages. question: %s recipientGroup: \"%s\" error: %@", (uint8_t *)v11, 0x20u);
    v20 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v26, 1, v20);
    swift_slowDealloc(v26, -1, -1);
    swift_arrayDestroy(v27, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }
  else
  {
    v22 = *(void **)(v0 + 240);
    v21 = *(_QWORD *)(v0 + 248);

    swift_release_n(v21, 2);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  swift_willThrow(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 288);
  *(_QWORD *)(*(_QWORD *)v1 + 296) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_10000A6D8;
  else
    v3 = sub_10000A694;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000A694()
{
  uint64_t v0;

  sub_10000F564((uint64_t *)(v0 + 16));
  sub_10000EE64((_QWORD *)(v0 + 136));
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 176));
}

uint64_t sub_10000A6D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *log;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28[2];

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 176));
  sub_10000F564((uint64_t *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 296);
  v3 = *(void **)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  sub_10000EE64((_QWORD *)(v0 + 136));
  swift_retain(v2);
  v4 = v3;
  swift_errorRetain(v1);
  swift_retain(v2);
  v5 = v4;
  v6 = swift_errorRetain(v1);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    log = v7;
    v10 = *(void **)(v0 + 240);
    v9 = *(_QWORD *)(v0 + 248);
    v11 = swift_slowAlloc(32, -1);
    v26 = (uint64_t *)swift_slowAlloc(8, -1);
    v27 = swift_slowAlloc(64, -1);
    v28[0] = v27;
    *(_DWORD *)v11 = 136315650;
    v12 = (void *)ATPayload.question.getter(v27);
    v13 = ATQuestion.description.getter();
    v15 = v14;

    *(_QWORD *)(v0 + 184) = sub_100027030(v13, v15, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v15);

    *(_WORD *)(v11 + 12) = 2080;
    v16 = ATRecipientGroup.debugDescription.getter(*(unsigned __int16 *)(v9 + 26));
    v18 = v17;
    *(_QWORD *)(v0 + 192) = sub_100027030(v16, v17, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v18);
    swift_release_n(v9, 2);
    *(_WORD *)(v11 + 22) = 2112;
    swift_errorRetain(v1);
    v19 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 200) = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v11 + 24, v11 + 32);
    *v26 = v19;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    v7 = log;
    _os_log_impl((void *)&_mh_execute_header, log, v8, "Failed to send payload over Messages. question: %s recipientGroup: \"%s\" error: %@", (uint8_t *)v11, 0x20u);
    v20 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v26, 1, v20);
    swift_slowDealloc(v26, -1, -1);
    swift_arrayDestroy(v27, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }
  else
  {
    v22 = *(void **)(v0 + 240);
    v21 = *(_QWORD *)(v0 + 248);

    swift_release_n(v21, 2);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  swift_willThrow(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A9A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 304);
  *(_QWORD *)(*v1 + 312) = v0;
  swift_task_dealloc(v3);
  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 208));
  if (v0)
    v4 = sub_10000AA14;
  else
    v4 = sub_10000A694;
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000AA14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *log;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28[2];

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 176));
  sub_10000F564((uint64_t *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 312);
  v3 = *(void **)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  sub_10000EE64((_QWORD *)(v0 + 136));
  swift_retain(v2);
  v4 = v3;
  swift_errorRetain(v1);
  swift_retain(v2);
  v5 = v4;
  v6 = swift_errorRetain(v1);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    log = v7;
    v10 = *(void **)(v0 + 240);
    v9 = *(_QWORD *)(v0 + 248);
    v11 = swift_slowAlloc(32, -1);
    v26 = (uint64_t *)swift_slowAlloc(8, -1);
    v27 = swift_slowAlloc(64, -1);
    v28[0] = v27;
    *(_DWORD *)v11 = 136315650;
    v12 = (void *)ATPayload.question.getter(v27);
    v13 = ATQuestion.description.getter();
    v15 = v14;

    *(_QWORD *)(v0 + 184) = sub_100027030(v13, v15, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v15);

    *(_WORD *)(v11 + 12) = 2080;
    v16 = ATRecipientGroup.debugDescription.getter(*(unsigned __int16 *)(v9 + 26));
    v18 = v17;
    *(_QWORD *)(v0 + 192) = sub_100027030(v16, v17, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v11 + 14, v11 + 22);
    swift_bridgeObjectRelease(v18);
    swift_release_n(v9, 2);
    *(_WORD *)(v11 + 22) = 2112;
    swift_errorRetain(v1);
    v19 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(_QWORD *)(v0 + 200) = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v11 + 24, v11 + 32);
    *v26 = v19;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    v7 = log;
    _os_log_impl((void *)&_mh_execute_header, log, v8, "Failed to send payload over Messages. question: %s recipientGroup: \"%s\" error: %@", (uint8_t *)v11, 0x20u);
    v20 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v26, 1, v20);
    swift_slowDealloc(v26, -1, -1);
    swift_arrayDestroy(v27, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }
  else
  {
    v22 = *(void **)(v0 + 240);
    v21 = *(_QWORD *)(v0 + 248);

    swift_release_n(v21, 2);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  swift_willThrow(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL sub_10000ACEC(unsigned __int8 a1, uint64_t a2)
{
  Swift::UInt v3;
  Swift::Int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;
  _QWORD v13[9];

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v3 = a1;
  Hasher.init(_seed:)(v13, *(_QWORD *)(a2 + 40));
  Hasher._combine(_:)(v3);
  v4 = Hasher._finalize()();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(unsigned __int8 *)(v8 + v6) == (_DWORD)v3)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(unsigned __int8 *)(v8 + v11);
    result = v12 == (_DWORD)v3;
    if (v12 == (_DWORD)v3)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_10000ADD8(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v3 + 220) = a2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v2;
  v4 = type metadata accessor for Logger(0);
  *(_QWORD *)(v3 + 88) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 96) = v5;
  *(_QWORD *)(v3 + 104) = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000AE3C, 0, 0);
}

uint64_t sub_10000AE3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *Strong;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, __int16, __int16);
  uint64_t v58;

  v1 = *(_QWORD *)(v0 + 80) + 24;
  Strong = (uint64_t *)swift_weakLoadStrong(v1);
  if (Strong
    && (v3 = Strong,
        v4 = Strong[8],
        v5 = Strong[9],
        v6 = Strong[10],
        sub_10000F268(Strong[6], v3[7], v3[8], v3[9], v3[10]),
        Strong = (uint64_t *)swift_release(v3),
        v4))
  {
    Strong = (uint64_t *)swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = (void *)ATQuestion.topic.getter(Strong);
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v5, v6, v7, 200);

  swift_bridgeObjectRelease(v6);
  if (qword_1000418C8 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v9 = *(_QWORD *)(v0 + 96);
  v8 = *(_QWORD *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 112) = sub_1000036A4(*(_QWORD *)(v0 + 88), (uint64_t)qword_100043EF8);
  (*(void (**)(uint64_t))(v9 + 16))(v8);
  v11 = swift_retain_n(v10, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v15 = swift_slowAlloc(64, -1);
    v58 = v15;
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v0 + 56) = sub_100027030(0xD000000000000012, 0x8000000100031990, &v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v14 + 4, v14 + 12);
    *(_WORD *)(v14 + 12) = 2080;
    v56 = v1;
    v16 = (uint64_t *)swift_weakLoadStrong(v1);
    if (!v16
      || (v17 = v16,
          v18 = v16[8],
          v19 = v16[9],
          v20 = v16[10],
          sub_10000F268(v16[6], v17[7], v17[8], v17[9], v17[10]),
          swift_release(v17),
          !v18)
      || (swift_bridgeObjectRelease(v18), !v20))
    {
      swift_bridgeObjectRelease(0);
      v20 = 0xE300000000000000;
      v19 = 7104878;
    }
    v21 = *(_QWORD *)(v0 + 88);
    v54 = *(_QWORD *)(v0 + 96);
    v55 = *(_QWORD *)(v0 + 104);
    v22 = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 40) = sub_100027030(v19, v20, &v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v14 + 14, v14 + 22);
    swift_bridgeObjectRelease(v20);
    swift_release_n(v22, 2);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s called by client with bundle ID %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy(v15, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v55, v21);
    v1 = v56;
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 96);
    v23 = *(_QWORD *)(v0 + 104);
    v25 = *(_QWORD *)(v0 + 88);
    swift_release_n(*(_QWORD *)(v0 + 80), 2);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  }
  v26 = (uint64_t *)swift_weakLoadStrong(v1);
  if (v26
    && (v27 = v26,
        v28 = v26[8],
        v29 = v26[9],
        v30 = v26[10],
        sub_10000F268(v26[6], v27[7], v27[8], v27[9], v27[10]),
        swift_release(v27),
        v28))
  {
    swift_bridgeObjectRelease(v28);
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }
  v31 = swift_weakLoadStrong(v1);
  if (v31
    && (v32 = (uint64_t *)v31,
        v33 = *(_QWORD *)(v31 + 64),
        v34 = *(_QWORD *)(v31 + 80),
        v35 = *(_QWORD *)(v31 + 88),
        v36 = *(_BYTE *)(v31 + 96),
        sub_10000F268(*(_QWORD *)(v31 + 48), v32[7], v32[8], v32[9], v32[10]),
        swift_release(v32),
        v33))
  {
    swift_bridgeObjectRelease(v33);
    v37 = v36 & 1;
    swift_bridgeObjectRelease(v34);
  }
  else
  {
    v35 = 0;
    v37 = 1;
  }
  v38 = *(void **)(v0 + 72);
  v39 = *(unsigned __int16 *)(v0 + 220);
  type metadata accessor for ATPayload(0);
  v40 = ATRecipientGroup.rawValue.getter(v39);
  LOBYTE(v39) = ATRecipientGroup.isFamily.getter(v39);
  v41 = ATPayload.__allocating_init(clientBundleIdentifier:clientAdamIdentifier:rawRecipientGroup:isForFamily:question:)(v29, v30, v35, v37, v40, v39 & 1, v38);
  *(_QWORD *)(v0 + 120) = v41;
  v42 = Logger.logObject.getter(v41);
  v43 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = *(unsigned __int16 *)(v0 + 220);
    v45 = (uint8_t *)swift_slowAlloc(12, -1);
    v46 = swift_slowAlloc(32, -1);
    v58 = v46;
    *(_DWORD *)v45 = 136315138;
    v47 = ATRecipientGroup.debugDescription.getter(v44);
    v49 = v48;
    *(_QWORD *)(v0 + 64) = sub_100027030(v47, v48, &v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v45 + 4, v45 + 12);
    swift_bridgeObjectRelease(v49);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "Attempting to inflate recipient group \"%s\"", v45, 0xCu);
    swift_arrayDestroy(v46, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v46, -1, -1);
    swift_slowDealloc(v45, -1, -1);
  }

  v50 = swift_weakLoadStrong(v1);
  *(_QWORD *)(v0 + 128) = v50;
  v51 = unk_1000422BC;
  v57 = (uint64_t (*)(uint64_t, __int16, __int16))((char *)&dword_1000422B8 + dword_1000422B8);
  swift_retain(v50);
  v52 = (_QWORD *)swift_task_alloc(v51);
  *(_QWORD *)(v0 + 136) = v52;
  *v52 = v0;
  v52[1] = sub_10000B3D0;
  return v57(v50, 0, *(_WORD *)(v0 + 220));
}

uint64_t sub_10000B3D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 136);
  v3[18] = a1;
  v3[19] = v1;
  swift_task_dealloc(v4);
  swift_release(v3[16]);
  if (v1)
    v5 = sub_10000B640;
  else
    v5 = sub_10000B444;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000B444()
{
  uint64_t v0;
  uint64_t *Strong;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  char v21;

  Strong = (uint64_t *)swift_weakLoadStrong(*(_QWORD *)(v0 + 80) + 24);
  if (Strong
    && (v2 = Strong,
        v3 = Strong[8],
        v5 = Strong[9],
        v4 = Strong[10],
        sub_10000F268(Strong[6], v2[7], v2[8], v2[9], v2[10]),
        Strong = (uint64_t *)swift_release(v2),
        v3))
  {
    Strong = (uint64_t *)swift_bridgeObjectRelease(v3);
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v6 = (void *)ATQuestion.topic.getter(Strong);
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v5, v4, v6, 300);

  v7 = swift_bridgeObjectRelease(v4);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Checking if send destinations are valid for sending", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }
  v11 = *(_QWORD *)(v0 + 128);

  if (v11 && (v13 = *(_QWORD *)(v0 + 128), *(_QWORD *)(v13 + 64)) && *(_BYTE *)(v13 + 48) == 3)
  {
    v14 = (void *)ATQuestion.topic.getter(v12);
    v15 = ATQuestion.Topic.rawValue.getter();
    v17 = v16;

    if (v15 == 0xD00000000000001DLL && v17 == 0x8000000100031970)
    {
      swift_bridgeObjectRelease(0x8000000100031970);
      v18 = 0;
    }
    else
    {
      v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, 0xD00000000000001DLL, 0x8000000100031970, 0);
      swift_bridgeObjectRelease(v17);
      v18 = v21 ^ 1;
    }
  }
  else
  {
    v18 = 1;
  }
  *(_BYTE *)(v0 + 223) = v18 & 1;
  v19 = (_QWORD *)swift_task_alloc(dword_1000422A4);
  *(_QWORD *)(v0 + 160) = v19;
  *v19 = v0;
  v19[1] = sub_10000B680;
  return sub_10001117C();
}

uint64_t sub_10000B640()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release(*(_QWORD *)(v0 + 128));

  swift_task_dealloc(*(_QWORD *)(v0 + 104));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B680(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_BYTE *)(*(_QWORD *)v1 + 224) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10000B6DC, 0, 0);
}

uint64_t sub_10000B6DC()
{
  uint64_t v0;
  int v1;
  _QWORD *v2;
  uint64_t *Strong;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(void);

  v1 = *(unsigned __int8 *)(v0 + 224);
  *(_BYTE *)(v0 + 222) = v1;
  if (v1 != 1 || (*(_BYTE *)(v0 + 223) & 1) != 0)
  {
    swift_beginAccess(v0 + 222, v0 + 16, 0, 0);
    if (*(_BYTE *)(v0 + 222) == 1)
    {
      Strong = (uint64_t *)swift_weakLoadStrong(*(_QWORD *)(v0 + 80) + 24);
      if (Strong
        && (v5 = Strong,
            v6 = Strong[8],
            v8 = Strong[9],
            v7 = Strong[10],
            sub_10000F268(Strong[6], v5[7], v5[8], v5[9], v5[10]),
            Strong = (uint64_t *)swift_release(v5),
            v6))
      {
        Strong = (uint64_t *)swift_bridgeObjectRelease(v6);
      }
      else
      {
        v8 = 0;
        v7 = 0;
      }
      v16 = (void *)ATQuestion.topic.getter(Strong);
      static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v8, v7, v16, 1400);

      v17 = swift_bridgeObjectRelease(v7);
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Send destinations are valid", v20, 2u);
        swift_slowDealloc(v20, -1, -1);
      }

      v21 = (_QWORD *)swift_task_alloc(dword_100041FBC);
      *(_QWORD *)(v0 + 192) = v21;
      *v21 = v0;
      v21[1] = sub_10000BD4C;
      v22 = *(_QWORD *)(v0 + 120);
      v23 = *(_QWORD *)(v0 + 80);
      v21[31] = *(_QWORD *)(v0 + 144);
      v21[32] = v23;
      v21[30] = v22;
      return swift_task_switch(sub_100009CF0, 0, 0);
    }
    else
    {
      v9 = *(_QWORD *)(v0 + 144);
      v11 = *(void **)(v0 + 120);
      v10 = *(_QWORD *)(v0 + 128);
      v12 = sub_100005FF0(&qword_100041FA8);
      v13 = sub_10000F420();
      v14 = swift_allocError(v12, v13, 0, 0);
      *v15 = 4;
      swift_willThrow(v14);
      swift_release(v10);
      swift_release(v9);

      swift_task_dealloc(*(_QWORD *)(v0 + 104));
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    *(_QWORD *)(v0 + 168) = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PeopleClient(0)), "init");
    v24 = (uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of PeopleClient.canSendFamilyScreenTimeRequestIMessage()
                            + async function pointer to dispatch thunk of PeopleClient.canSendFamilyScreenTimeRequestIMessage());
    v2 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to dispatch thunk of PeopleClient.canSendFamilyScreenTimeRequestIMessage()
                                    + 1));
    *(_QWORD *)(v0 + 176) = v2;
    *v2 = v0;
    v2[1] = sub_10000B974;
    return v24();
  }
}

uint64_t sub_10000B974(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 176);
  *(_BYTE *)(v3 + 225) = a1;
  *(_QWORD *)(v3 + 184) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_10000BE1C;
  else
    v5 = sub_10000B9E4;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000B9E4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  int v4;
  void *v5;
  uint8_t *v6;
  uint64_t *Strong;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;

  *(_BYTE *)(v1 + 222) = *(_BYTE *)(v1 + 225);
  v2 = Logger.logObject.getter(a1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(unsigned __int8 *)(v1 + 225);
    v5 = *(void **)(v1 + 168);
    v6 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 67109120;
    *(_DWORD *)(v1 + 216) = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 216, v1 + 220, v6 + 4, v6 + 8);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "People returned %{BOOL}d for PeopleClient.canSendFamilyScreenTimeRequestIMessage()", v6, 8u);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    v5 = *(void **)(v1 + 168);
  }

  Strong = (uint64_t *)swift_weakLoadStrong(*(_QWORD *)(v1 + 80) + 24);
  if (Strong
    && (v8 = Strong,
        v9 = Strong[8],
        v11 = Strong[9],
        v10 = Strong[10],
        sub_10000F268(Strong[6], v8[7], v8[8], v8[9], v8[10]),
        Strong = (uint64_t *)swift_release(v8),
        v9))
  {
    Strong = (uint64_t *)swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v12 = (void *)ATQuestion.topic.getter(Strong);
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v11, v10, v12, 1300);

  swift_bridgeObjectRelease(v10);
  swift_beginAccess(v1 + 222, v1 + 16, 0, 0);
  if (*(_BYTE *)(v1 + 222) == 1)
  {
    v13 = (uint64_t *)swift_weakLoadStrong(*(_QWORD *)(v1 + 80) + 24);
    if (v13
      && (v14 = v13,
          v15 = v13[8],
          v17 = v13[9],
          v16 = v13[10],
          sub_10000F268(v13[6], v14[7], v14[8], v14[9], v14[10]),
          v13 = (uint64_t *)swift_release(v14),
          v15))
    {
      v13 = (uint64_t *)swift_bridgeObjectRelease(v15);
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }
    v26 = (void *)ATQuestion.topic.getter(v13);
    static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v17, v16, v26, 1400);

    v27 = swift_bridgeObjectRelease(v16);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Send destinations are valid", v30, 2u);
      swift_slowDealloc(v30, -1, -1);
    }

    v31 = (_QWORD *)swift_task_alloc(dword_100041FBC);
    *(_QWORD *)(v1 + 192) = v31;
    *v31 = v1;
    v31[1] = sub_10000BD4C;
    v32 = *(_QWORD *)(v1 + 120);
    v33 = *(_QWORD *)(v1 + 80);
    v31[31] = *(_QWORD *)(v1 + 144);
    v31[32] = v33;
    v31[30] = v32;
    return swift_task_switch(sub_100009CF0, 0, 0);
  }
  else
  {
    v18 = *(_QWORD *)(v1 + 144);
    v20 = *(void **)(v1 + 120);
    v19 = *(_QWORD *)(v1 + 128);
    v21 = sub_100005FF0(&qword_100041FA8);
    v22 = sub_10000F420();
    v23 = swift_allocError(v21, v22, 0, 0);
    *v24 = 4;
    swift_willThrow(v23);
    swift_release(v19);
    swift_release(v18);

    swift_task_dealloc(*(_QWORD *)(v1 + 104));
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000BD4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 192);
  *(_QWORD *)(*v2 + 200) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_10000C234;
  }
  else
  {
    *(_QWORD *)(v4 + 208) = a1;
    v6 = sub_10000BDC0;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_10000BDC0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 128));
  swift_release(v1);

  swift_task_dealloc(v3);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 208));
}

uint64_t sub_10000BE1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *Strong;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;

  v1 = v0 + 16;
  v2 = v0 + 222;
  v3 = *(_QWORD *)(v0 + 184);

  swift_errorRetain(v3);
  v4 = swift_errorRetain(v3);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 184);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    swift_errorRetain(v7);
    v10 = _swift_stdlib_bridgeErrorToNSError(v7);
    *(_QWORD *)(v0 + 48) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v8 + 4, v8 + 12);
    *v9 = v10;
    swift_errorRelease(v7);
    swift_errorRelease(v7);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "People threw error for PeopleClient.canSendFamilyScreenTimeRequestIMessage(): %@", v8, 0xCu);
    v11 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v9, 1, v11);
    v12 = v9;
    v1 = v0 + 16;
    v2 = v0 + 222;
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v8, -1, -1);

    swift_errorRelease(v7);
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 184);
    swift_errorRelease(v13);
    swift_errorRelease(v13);
    swift_errorRelease(v13);

  }
  *(_BYTE *)(v0 + 222) = 0;
  Strong = (uint64_t *)swift_weakLoadStrong(*(_QWORD *)(v0 + 80) + 24);
  if (Strong
    && (v15 = Strong,
        v16 = Strong[8],
        v18 = Strong[9],
        v17 = Strong[10],
        sub_10000F268(Strong[6], v15[7], v15[8], v15[9], v15[10]),
        Strong = (uint64_t *)swift_release(v15),
        v16))
  {
    Strong = (uint64_t *)swift_bridgeObjectRelease(v16);
  }
  else
  {
    v18 = 0;
    v17 = 0;
  }
  v19 = (void *)ATQuestion.topic.getter(Strong);
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v18, v17, v19, 1300);

  swift_bridgeObjectRelease(v17);
  swift_beginAccess(v2, v1, 0, 0);
  if (*(_BYTE *)(v0 + 222) == 1)
  {
    v20 = (uint64_t *)swift_weakLoadStrong(*(_QWORD *)(v0 + 80) + 24);
    if (v20
      && (v21 = v20,
          v22 = v20[8],
          v24 = v20[9],
          v23 = v20[10],
          sub_10000F268(v20[6], v21[7], v21[8], v21[9], v21[10]),
          v20 = (uint64_t *)swift_release(v21),
          v22))
    {
      v20 = (uint64_t *)swift_bridgeObjectRelease(v22);
    }
    else
    {
      v24 = 0;
      v23 = 0;
    }
    v33 = (void *)ATQuestion.topic.getter(v20);
    static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v24, v23, v33, 1400);

    v34 = swift_bridgeObjectRelease(v23);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Send destinations are valid", v37, 2u);
      swift_slowDealloc(v37, -1, -1);
    }

    v38 = (_QWORD *)swift_task_alloc(dword_100041FBC);
    *(_QWORD *)(v0 + 192) = v38;
    *v38 = v0;
    v38[1] = sub_10000BD4C;
    v39 = *(_QWORD *)(v0 + 120);
    v40 = *(_QWORD *)(v0 + 80);
    v38[31] = *(_QWORD *)(v0 + 144);
    v38[32] = v40;
    v38[30] = v39;
    return swift_task_switch(sub_100009CF0, 0, 0);
  }
  else
  {
    v25 = *(_QWORD *)(v0 + 144);
    v27 = *(void **)(v0 + 120);
    v26 = *(_QWORD *)(v0 + 128);
    v28 = sub_100005FF0(&qword_100041FA8);
    v29 = sub_10000F420();
    v30 = swift_allocError(v28, v29, 0, 0);
    *v31 = 4;
    swift_willThrow(v30);

    swift_release(v25);
    swift_release(v26);
    swift_task_dealloc(*(_QWORD *)(v0 + 104));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000C234()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void **)(v0 + 120);
  swift_release(*(_QWORD *)(v0 + 128));
  swift_release(v1);

  swift_task_dealloc(*(_QWORD *)(v0 + 104));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C3BC(void *a1, __int16 a2, void *aBlock, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  id v9;
  _QWORD *v10;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v8 = dword_100041FA4;
  v9 = a1;
  swift_retain(a4);
  v10 = (_QWORD *)swift_task_alloc(v8);
  v4[5] = v10;
  *v10 = v4;
  v10[1] = sub_10000C440;
  return sub_10000ADD8((uint64_t)v9, a2);
}

uint64_t sub_10000C440(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  Class isa;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);

  v3 = v1;
  v5 = *v2;
  v6 = *(_QWORD *)(*v2 + 40);
  v8 = *(void **)(*v2 + 16);
  v7 = *(_QWORD *)(*v2 + 24);
  v9 = *v2;
  swift_task_dealloc(v6);

  swift_release(v7);
  if (v3)
  {
    a1 = _convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    isa = 0;
    v11 = (void *)a1;
  }
  else if (a1)
  {
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
    a1 = 0;
    v11 = isa;
  }
  else
  {
    isa = 0;
    v11 = 0;
  }
  v12 = *(void (***)(_QWORD, _QWORD, _QWORD))(v5 + 32);
  ((void (**)(_QWORD, Class, uint64_t))v12)[2](v12, isa, a1);

  _Block_release(v12);
  return (*(uint64_t (**)(void))(v9 + 8))();
}

uint64_t sub_10000C664(void *a1, int a2, void *aBlock, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v7 = unk_100041F6C;
  v11 = (uint64_t (*)(uint64_t))((char *)&dword_100041F68 + dword_100041F68);
  v8 = a1;
  swift_retain(a4);
  v9 = (_QWORD *)swift_task_alloc(v7);
  v4[5] = v9;
  *v9 = v4;
  v9[1] = sub_10000C6F4;
  return v11((uint64_t)v8);
}

uint64_t sub_10000C6F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(*v1 + 40);
  v4 = *(void **)(*v1 + 16);
  v3 = *(_QWORD *)(*v1 + 24);
  v5 = *v1;
  swift_task_dealloc(v2);

  swift_release(v3);
  v6 = *(_QWORD *)(v5 + 32);
  if (v0)
  {
    v7 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(v5 + 32), 0);
  }
  _Block_release(*(const void **)(v5 + 32));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_10000C8EC(void *a1, uint64_t a2, uint64_t a3, void *aBlock, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v5[2] = a1;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  v12 = v11;
  v5[5] = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v5[6] = v14;
  v16 = unk_100041F44;
  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100041F40 + dword_100041F40);
  v17 = a1;
  swift_retain(a5);
  v18 = (_QWORD *)swift_task_alloc(v16);
  v5[7] = v18;
  *v18 = v5;
  v18[1] = sub_10000C9CC;
  return v20((uint64_t)v17, v10, v12, v13, v15);
}

uint64_t sub_10000C9CC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)(*v1 + 48);
  v2 = *(_QWORD *)(*v1 + 56);
  v4 = *(_QWORD *)(*v1 + 40);
  v6 = *(void **)(*v1 + 16);
  v5 = *(_QWORD *)(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc(v2);

  swift_release(v5);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  v8 = *(_QWORD *)(v7 + 32);
  if (v0)
  {
    v9 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v8 + 16))(*(_QWORD *)(v7 + 32), 0);
  }
  _Block_release(*(const void **)(v7 + 32));
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_10000CA90()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  swift_weakDestroy(v0 + 3);
  sub_10000EE64(v0 + 4);
  sub_10000EE64(v0 + 9);
  return swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for Server()
{
  return objc_opt_self(_TtC6asktod6Server);
}

id sub_10000CAEC()
{
  if (qword_1000418B8 != -1)
    swift_once(&qword_1000418B8, sub_100009CC0);
  return (id)qword_100043EF0;
}

_QWORD *sub_10000CB2C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _BYTE v5[96];
  _QWORD v6[12];

  v1 = *a1;
  v2 = swift_retain(*a1);
  sub_100014854(v2, (uint64_t)&off_10003E778, (uint64_t)v6);
  sub_10000CB98((uint64_t)v6, (uint64_t)v5);
  v3 = sub_10000EC5C(v1, (uint64_t)v5);
  swift_release(v1);
  sub_10000EDF4(v6);
  return v3;
}

uint64_t sub_10000CB98(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for iMessageSender(a2, a1);
  return a2;
}

uint64_t sub_10000CBD4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_10000F7AC;
  return v6();
}

uint64_t sub_10000CC28(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_10000F7AC;
  return v7();
}

uint64_t sub_10000CC7C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10000F0B0(a1);
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
  v16 = swift_allocObject(&unk_10003D5B0, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100041F38, v16);
}

uint64_t sub_10000CDC0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000CE24;
  return v6(a1);
}

uint64_t sub_10000CE24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

Swift::Int sub_10000CE70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100005FF0(&qword_100041FC8);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v27 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v27 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)(v28, *(_QWORD *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      result = Hasher._finalize()();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = v16[1];
        v18 = *v16 == v8 && v17 == v7;
        if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }
        v19 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v19;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v20 = (_QWORD *)(v15 + 16 * v11);
          v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0);
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v23 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v23 = v8;
      v23[1] = v7;
      v24 = *(_QWORD *)(v3 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

Swift::Int sub_10000D010(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::UInt v7;
  Swift::Int result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _QWORD v19[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100005FF0(&qword_100041EF8);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = *(unsigned __int8 *)(v6 + v4);
      Hasher.init(_seed:)(v19, *(_QWORD *)(v3 + 40));
      Hasher._combine(_:)(v7);
      result = Hasher._finalize()();
      v9 = -1 << *(_BYTE *)(v3 + 32);
      v10 = result & ~v9;
      v11 = v10 >> 6;
      v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
      v13 = 1 << v10;
      v14 = *(_QWORD *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(unsigned __int8 *)(v14 + v10) == (_DWORD)v7)
          goto LABEL_3;
        v15 = ~v9;
        while (1)
        {
          v10 = (v10 + 1) & v15;
          v11 = v10 >> 6;
          v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
          v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0)
            break;
          if (*(unsigned __int8 *)(v14 + v10) == (_DWORD)v7)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
      *(_BYTE *)(v14 + v10) = v7;
      v16 = *(_QWORD *)(v3 + 16);
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_10000D150(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2[38] = a1;
  v2[39] = v1;
  v3 = type metadata accessor for Logger(0);
  v2[40] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[41] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[42] = swift_task_alloc(v5);
  v2[43] = swift_task_alloc(v5);
  return swift_task_switch(sub_10000D1C0, 0, 0);
}

uint64_t sub_10000D1C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *Strong;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::Int v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  char v51;
  int v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(void);
  uint64_t result;
  void (*v70)(uint64_t, uint64_t, uint64_t);
  void *v71;
  NSObject *v72;
  os_log_type_t v73;
  _BOOL4 v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _OWORD *v88;
  NSObject *v89;
  os_log_type_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  os_log_type_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  char v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  NSObject *v113;
  os_log_type_t v114;
  _BOOL4 v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  void (*v133)(uint64_t, uint64_t, uint64_t);
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unsigned __int8 v139;
  int v140;
  uint64_t (*v141)(uint64_t, char);
  char v142;
  uint64_t v143[2];

  v2 = *(_QWORD *)(v1 + 312);
  v3 = ATPayload.clientBundleIdentifier.getter(a1);
  v5 = v4;
  v6 = (void *)ATPayload.question.getter(v3);
  v7 = (void *)ATQuestion.topic.getter();

  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v3, v5, v7, 400);
  swift_bridgeObjectRelease(v5);
  v8 = v2 + 24;
  Strong = (_QWORD *)swift_weakLoadStrong(v2 + 24);
  if (Strong
    && (v10 = Strong,
        v11 = Strong[6],
        v12 = Strong[8],
        v13 = Strong[10],
        sub_10000F268(v11, Strong[7], v12, Strong[9], v13),
        swift_release(v10),
        v12))
  {
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v13);
  }
  else
  {
    LOBYTE(v11) = 4;
  }
  v139 = v11;
  if (qword_1000418C8 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v14 = *(_QWORD *)(v1 + 344);
  v15 = *(_QWORD *)(v1 + 320);
  v16 = *(_QWORD *)(v1 + 328);
  v17 = *(_QWORD *)(v1 + 312);
  v18 = sub_1000036A4(v15, (uint64_t)qword_100043EF8);
  *(_QWORD *)(v1 + 352) = v18;
  v133 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v133(v14, v18, v15);
  v19 = swift_retain_n(v17, 2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  v135 = v1 + 208;
  v138 = v8;
  if (os_log_type_enabled(v20, v21))
  {
    v136 = v18;
    v22 = swift_slowAlloc(22, -1);
    v23 = swift_slowAlloc(64, -1);
    v143[0] = v23;
    *(_DWORD *)v22 = 136315394;
    *(_QWORD *)(v1 + 288) = sub_100027030(0xD000000000000013, 0x8000000100031950, v143);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 288, v1 + 296, v22 + 4, v22 + 12);
    *(_WORD *)(v22 + 12) = 2080;
    v24 = (uint64_t *)swift_weakLoadStrong(v8);
    if (!v24
      || (v25 = v24,
          v26 = v24[8],
          v28 = v24[9],
          v27 = v24[10],
          sub_10000F268(v24[6], v25[7], v25[8], v25[9], v25[10]),
          swift_release(v25),
          !v26)
      || (swift_bridgeObjectRelease(v26), !v27))
    {
      swift_bridgeObjectRelease(0);
      v27 = 0xE300000000000000;
      v28 = 7104878;
    }
    v29 = *(_QWORD *)(v1 + 320);
    v130 = *(_QWORD *)(v1 + 328);
    v131 = *(_QWORD *)(v1 + 344);
    v30 = *(_QWORD *)(v1 + 312);
    *(_QWORD *)(v1 + 296) = sub_100027030(v28, v27, v143);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 296, v1 + 304, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v27);
    swift_release_n(v30, 2);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s called by client with bundle ID %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy(v23, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);

    v31 = *(void (**)(uint64_t, uint64_t))(v130 + 8);
    v31(v131, v29);
    v18 = v136;
  }
  else
  {
    v32 = *(_QWORD *)(v1 + 344);
    v33 = *(_QWORD *)(v1 + 320);
    v34 = *(_QWORD *)(v1 + 328);
    swift_release_n(*(_QWORD *)(v1 + 312), 2);

    v31 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v31(v32, v33);
  }
  v35 = sub_10000D010((uint64_t)&off_10003CE08);
  if (v139 == 4)
  {
    swift_bridgeObjectRelease(v35);
    goto LABEL_23;
  }
  v36 = sub_10000ACEC(v139, v35);
  v37 = swift_bridgeObjectRelease(v35);
  if (!v36)
  {
LABEL_23:
    v53 = (uint64_t *)swift_weakLoadStrong(v138);
    if (!v53
      || (v54 = v53,
          v55 = v53[8],
          v57 = v53[9],
          v56 = v53[10],
          sub_10000F268(v53[6], v54[7], v54[8], v54[9], v54[10]),
          swift_release(v54),
          !v55)
      || (swift_bridgeObjectRelease(v55), !v56))
    {
      swift_bridgeObjectRelease(0);
      v56 = 0xE300000000000000;
      v57 = 7104878;
    }
    v58 = swift_bridgeObjectRetain_n(v56, 2);
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = swift_slowAlloc(22, -1);
      v62 = swift_slowAlloc(64, -1);
      v143[0] = v62;
      *(_DWORD *)v61 = 136315394;
      swift_bridgeObjectRetain(v56);
      *(_QWORD *)(v1 + 232) = sub_100027030(v57, v56, v143);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 232, v1 + 240, v61 + 4, v61 + 12);
      swift_bridgeObjectRelease_n(v56, 3);
      *(_WORD *)(v61 + 12) = 2080;
      *(_QWORD *)(v1 + 200) = sub_100027030(0xD000000000000013, 0x8000000100031950, v143);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 200, v135, v61 + 14, v61 + 22);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "Client with bundle ID %s was not in the allowlist for %s. Bailing.", (uint8_t *)v61, 0x16u);
      swift_arrayDestroy(v62, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v61, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v56, 2);
    }

    v63 = sub_10000F298();
    v64 = swift_allocError(&type metadata for ResponseError, v63, 0, 0);
    v66 = *(_QWORD *)(v1 + 336);
    v65 = *(_QWORD *)(v1 + 344);
    *(_QWORD *)v67 = v57;
    *(_QWORD *)(v67 + 8) = v56;
    *(_BYTE *)(v67 + 16) = 0;
    swift_willThrow(v64);
    swift_task_dealloc(v65);
    swift_task_dealloc(v66);
    v68 = *(uint64_t (**)(void))(v1 + 8);
    return v68();
  }
  v137 = v18;
  v132 = (uint64_t *)(v1 + 240);
  v38 = ATPayload.clientBundleIdentifier.getter(v37);
  v40 = v39;
  v41 = (void *)ATPayload.question.getter(v38);
  v42 = (void *)ATQuestion.topic.getter();

  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v38, v40, v42, 500);
  v43 = swift_bridgeObjectRelease(v40);
  v44 = ATPayload.clientBundleIdentifier.getter(v43);
  if (v45)
  {
    v46 = v44;
    v47 = v45;
    v48 = v137;
    if (qword_100041920 != -1)
      swift_once(&qword_100041920, sub_100026C88);
    v49 = off_100042778;
    if (*((_QWORD *)off_100042778 + 2) && (v50 = sub_1000276E8(v46, v47), (v51 & 1) != 0))
      v52 = *(unsigned __int8 *)(v49[7] + v50);
    else
      v52 = 4;
    v70 = v133;
    swift_bridgeObjectRelease(v47);
  }
  else
  {
    v52 = 4;
    v48 = v137;
    v70 = v133;
  }
  *(_BYTE *)(v1 + 400) = v52;
  v71 = *(void **)(v1 + 304);
  v70(*(_QWORD *)(v1 + 336), v48, *(_QWORD *)(v1 + 320));
  v72 = Logger.logObject.getter(v71);
  v73 = static os_log_type_t.default.getter();
  v74 = os_log_type_enabled(v72, v73);
  v75 = *(_QWORD *)(v1 + 336);
  v76 = *(_QWORD *)(v1 + 320);
  v77 = *(void **)(v1 + 304);
  if (v74)
  {
    v78 = swift_slowAlloc(22, -1);
    v134 = v76;
    v79 = swift_slowAlloc(64, -1);
    v143[0] = v79;
    *(_DWORD *)v78 = 136315394;
    v140 = v52;
    *(_QWORD *)(v1 + 272) = sub_100027030(0xD000000000000013, 0x8000000100031950, v143);
    v80 = UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 272, v1 + 280, v78 + 4, v78 + 12);
    *(_WORD *)(v78 + 12) = 2080;
    v81 = ATPayload.clientBundleIdentifier.getter(v80);
    if (v82)
    {
      v83 = v82;
    }
    else
    {
      v81 = 7104878;
      v83 = 0xE300000000000000;
    }
    *(_QWORD *)(v1 + 280) = sub_100027030(v81, v83, v143);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 280, v1 + 288, v78 + 14, v78 + 22);
    v84 = v83;
    v52 = v140;
    swift_bridgeObjectRelease(v84);

    _os_log_impl((void *)&_mh_execute_header, v72, v73, "%s Client that originated the request has bundle ID %s", (uint8_t *)v78, 0x16u);
    swift_arrayDestroy(v79, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v79, -1, -1);
    swift_slowDealloc(v78, -1, -1);

    v85 = v75;
    v86 = v134;
  }
  else
  {

    v85 = v75;
    v86 = v76;
  }
  v87 = ((uint64_t (*)(uint64_t, uint64_t))v31)(v85, v86);
  if (v52 == 4)
  {
LABEL_57:
    v124 = *(_QWORD *)(v1 + 336);
    v123 = *(_QWORD *)(v1 + 344);
    v125 = ATPayload.clientBundleIdentifier.getter(v87);
    v127 = v126;
    v128 = (void *)ATPayload.question.getter(v125);
    v129 = (void *)ATQuestion.topic.getter();

    static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v125, v127, v129, 900);
    swift_bridgeObjectRelease(v127);
    swift_task_dealloc(v123);
    swift_task_dealloc(v124);
    v68 = *(uint64_t (**)(void))(v1 + 8);
    return v68();
  }
  v88 = sub_10002151C(v52);
  *(_QWORD *)(v1 + 360) = v88;
  v89 = Logger.logObject.getter(v88);
  v90 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v89, v90))
  {
    v91 = swift_slowAlloc(32, -1);
    v92 = swift_slowAlloc(64, -1);
    v143[0] = v92;
    *(_DWORD *)v91 = 136315650;
    *(_QWORD *)(v1 + 248) = sub_100027030(0xD000000000000013, 0x8000000100031950, v143);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 248, v1 + 256, v91 + 4, v91 + 12);
    *(_WORD *)(v91 + 12) = 2048;
    *(_QWORD *)(v1 + 256) = *((_QWORD *)v88 + 2);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 256, v1 + 264, v91 + 14, v91 + 22);
    *(_WORD *)(v91 + 22) = 2080;
    sub_100026BA8(v52);
    v94 = v93;
    *(_QWORD *)(v1 + 264) = sub_100027030(v95, v93, v143);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 264, v1 + 272, v91 + 24, v91 + 32);
    swift_bridgeObjectRelease(v94);
    _os_log_impl((void *)&_mh_execute_header, v89, v90, "%s Performing %ld response tasks for known client %s", (uint8_t *)v91, 0x20u);
    swift_arrayDestroy(v92, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v92, -1, -1);
    swift_slowDealloc(v91, -1, -1);
  }

  v96 = *((_QWORD *)v88 + 2);
  *(_QWORD *)(v1 + 368) = v96;
  result = swift_bridgeObjectRetain(v88);
  if (v96)
  {
    v97 = *(_QWORD *)(v1 + 360);
    if (!*(_QWORD *)(v97 + 16))
    {
      __break(1u);
      goto LABEL_59;
    }
    sub_10000F4B4(v97 + 32, v1 + 24);
    *(_QWORD *)(v1 + 112) = 0;
    sub_10000F2DC((__int128 *)(v1 + 24), v1 + 120);
    v98 = 1;
  }
  else
  {
    v98 = 0;
    *(_OWORD *)(v1 + 128) = 0u;
    *(_OWORD *)(v1 + 144) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
  }
  *(_QWORD *)(v1 + 376) = v98;
  sub_10000F2F4(v1 + 112, v1 + 64);
  if (!*(_QWORD *)(v1 + 96))
  {
    v111 = *(_QWORD *)(v1 + 360);
    swift_bridgeObjectRelease(v111);
    v112 = swift_bridgeObjectRetain(v111);
    v113 = Logger.logObject.getter(v112);
    v114 = static os_log_type_t.default.getter();
    v115 = os_log_type_enabled(v113, v114);
    v116 = *(_QWORD *)(v1 + 360);
    if (v115)
    {
      v142 = *(_BYTE *)(v1 + 400);
      v117 = swift_slowAlloc(32, -1);
      v118 = swift_slowAlloc(64, -1);
      v143[0] = v118;
      *(_DWORD *)v117 = 136315650;
      *(_QWORD *)(v1 + 208) = sub_100027030(0xD000000000000013, 0x8000000100031950, v143);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v135, v1 + 216, v117 + 4, v117 + 12);
      *(_WORD *)(v117 + 12) = 2048;
      v119 = *(_QWORD *)(v116 + 16);
      swift_bridgeObjectRelease(v116);
      *(_QWORD *)(v1 + 216) = v119;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 216, v1 + 224, v117 + 14, v117 + 22);
      swift_bridgeObjectRelease(v116);
      *(_WORD *)(v117 + 22) = 2080;
      sub_100026BA8(v142);
      v121 = v120;
      *(_QWORD *)(v1 + 224) = sub_100027030(v122, v120, v143);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 224, v1 + 232, v117 + 24, v117 + 32);
      swift_bridgeObjectRelease(v121);
      _os_log_impl((void *)&_mh_execute_header, v113, v114, "%s Successfully performed all %ld response tasks for known client %s", (uint8_t *)v117, 0x20u);
      swift_arrayDestroy(v118, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v118, -1, -1);
      swift_slowDealloc(v117, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v1 + 360), 2);
    }

    goto LABEL_57;
  }
  v99 = *(_QWORD *)(v1 + 64);
  v100 = sub_10000F2DC((__int128 *)(v1 + 72), v1 + 160);
  v101 = Logger.logObject.getter(v100);
  v102 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v101, v102))
  {
LABEL_52:

    v108 = sub_100003680((_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 184));
    v141 = (uint64_t (*)(uint64_t, char))((char *)&dword_100042358 + dword_100042358);
    v109 = *(_BYTE *)v108;
    v110 = (_QWORD *)swift_task_alloc(unk_10004235C);
    *(_QWORD *)(v1 + 384) = v110;
    *v110 = v1;
    v110[1] = sub_10000DFB8;
    return v141(*(_QWORD *)(v1 + 304), v109);
  }
  v103 = swift_slowAlloc(32, -1);
  v104 = swift_slowAlloc(64, -1);
  *v132 = v104;
  *(_DWORD *)v103 = 136315650;
  result = sub_100027030(0xD000000000000013, 0x8000000100031950, v132);
  *(_QWORD *)(v103 + 4) = result;
  *(_WORD *)(v103 + 12) = 2048;
  if (!__OFADD__(v99, 1))
  {
    *(_QWORD *)(v103 + 14) = v99 + 1;
    *(_WORD *)(v103 + 22) = 2080;
    sub_100026BA8(*(_BYTE *)(v1 + 400));
    v106 = v105;
    *(_QWORD *)(v103 + 24) = sub_100027030(v107, v105, v132);
    swift_bridgeObjectRelease(v106);
    _os_log_impl((void *)&_mh_execute_header, v101, v102, "%s Performing response task #%ld for known client %s", (uint8_t *)v103, 0x20u);
    swift_arrayDestroy(v104, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v104, -1, -1);
    swift_slowDealloc(v103, -1, -1);
    goto LABEL_52;
  }
LABEL_59:
  __break(1u);
  return result;
}

uint64_t sub_10000DFB8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 384);
  *(_QWORD *)(*v1 + 392) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v2 + 360), 2);
    v4 = sub_10000E498;
  }
  else
  {
    v4 = sub_10000E028;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000E028()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t (*v36)(uint64_t, char);
  char v37;
  uint64_t v38;

  result = sub_10000EE64((_QWORD *)(v0 + 160));
  v2 = *(_QWORD *)(v0 + 376);
  if (v2 == *(_QWORD *)(v0 + 368))
  {
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 360);
    if (v2 >= *(_QWORD *)(v3 + 16))
    {
      __break(1u);
LABEL_15:
      __break(1u);
      return result;
    }
    sub_10000F4B4(v3 + 40 * v2 + 32, v0 + 24);
    *(_QWORD *)(v0 + 112) = v2;
    sub_10000F2DC((__int128 *)(v0 + 24), v0 + 120);
    ++v2;
  }
  *(_QWORD *)(v0 + 376) = v2;
  sub_10000F2F4(v0 + 112, v0 + 64);
  if (*(_QWORD *)(v0 + 96))
  {
    v4 = *(_QWORD *)(v0 + 64);
    v5 = sub_10000F2DC((__int128 *)(v0 + 72), v0 + 160);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v6, v7))
    {
LABEL_9:

      v13 = sub_100003680((_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 184));
      v36 = (uint64_t (*)(uint64_t, char))((char *)&dword_100042358 + dword_100042358);
      v14 = *(_BYTE *)v13;
      v15 = (_QWORD *)swift_task_alloc(unk_10004235C);
      *(_QWORD *)(v0 + 384) = v15;
      *v15 = v0;
      v15[1] = sub_10000DFB8;
      return v36(*(_QWORD *)(v0 + 304), v14);
    }
    v8 = swift_slowAlloc(32, -1);
    v9 = swift_slowAlloc(64, -1);
    *(_QWORD *)(v0 + 240) = v9;
    *(_DWORD *)v8 = 136315650;
    result = sub_100027030(0xD000000000000013, 0x8000000100031950, (uint64_t *)(v0 + 240));
    *(_QWORD *)(v8 + 4) = result;
    *(_WORD *)(v8 + 12) = 2048;
    if (!__OFADD__(v4, 1))
    {
      *(_QWORD *)(v8 + 14) = v4 + 1;
      *(_WORD *)(v8 + 22) = 2080;
      sub_100026BA8(*(_BYTE *)(v0 + 400));
      v11 = v10;
      *(_QWORD *)(v8 + 24) = sub_100027030(v12, v10, (uint64_t *)(v0 + 240));
      swift_bridgeObjectRelease(v11);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s Performing response task #%ld for known client %s", (uint8_t *)v8, 0x20u);
      swift_arrayDestroy(v9, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  v16 = *(_QWORD *)(v0 + 360);
  swift_bridgeObjectRelease(v16);
  v17 = swift_bridgeObjectRetain(v16);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  v20 = os_log_type_enabled(v18, v19);
  v21 = *(_QWORD *)(v0 + 360);
  if (v20)
  {
    v37 = *(_BYTE *)(v0 + 400);
    v22 = swift_slowAlloc(32, -1);
    v23 = swift_slowAlloc(64, -1);
    v38 = v23;
    *(_DWORD *)v22 = 136315650;
    *(_QWORD *)(v0 + 208) = sub_100027030(0xD000000000000013, 0x8000000100031950, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v22 + 4, v22 + 12);
    *(_WORD *)(v22 + 12) = 2048;
    v24 = *(_QWORD *)(v21 + 16);
    swift_bridgeObjectRelease(v21);
    *(_QWORD *)(v0 + 216) = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v22 + 22) = 2080;
    sub_100026BA8(v37);
    v26 = v25;
    *(_QWORD *)(v0 + 224) = sub_100027030(v27, v25, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v0 + 232, v22 + 24, v22 + 32);
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s Successfully performed all %ld response tasks for known client %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy(v23, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 360), 2);
  }

  v29 = *(_QWORD *)(v0 + 336);
  v28 = *(_QWORD *)(v0 + 344);
  v31 = ATPayload.clientBundleIdentifier.getter(v30);
  v33 = v32;
  v34 = (void *)ATPayload.question.getter(v31);
  v35 = (void *)ATQuestion.topic.getter();

  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v31, v33, v35, 900);
  swift_bridgeObjectRelease(v33);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E498()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 392);
  sub_10000EE64((_QWORD *)(v0 + 160));
  v2 = sub_10000F298();
  v3 = swift_allocError(&type metadata for ResponseError, v2, 0, 0);
  v5 = *(_QWORD *)(v0 + 336);
  v4 = *(_QWORD *)(v0 + 344);
  *(_QWORD *)v6 = v1;
  *(_QWORD *)(v6 + 8) = 0;
  *(_BYTE *)(v6 + 16) = 1;
  swift_willThrow(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[25] = a4;
  v5[26] = a5;
  v5[23] = a2;
  v5[24] = a3;
  v5[22] = a1;
  return swift_task_switch(sub_10000E544, 0, 0);
}

uint64_t sub_10000E544()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  os_log_type_t type;
  _QWORD *typea;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[2];

  if (qword_1000418C8 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v1 = (void *)v0[22];
  v2 = v0[26];
  v3 = v0[24];
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043EF8);
  swift_bridgeObjectRetain_n(v3, 2);
  swift_bridgeObjectRetain_n(v2, 2);
  v5 = Logger.logObject.getter(v1);
  v6 = static os_log_type_t.default.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = v0[26];
  if (v7)
  {
    v36 = v0[25];
    type = v6;
    v9 = v0[24];
    v35 = v0[23];
    v39 = (void *)v0[22];
    v10 = swift_slowAlloc(42, -1);
    v37 = (_QWORD *)swift_slowAlloc(8, -1);
    v42 = swift_slowAlloc(96, -1);
    v44[0] = v42;
    *(_DWORD *)v10 = 136315906;
    v0[18] = sub_100027030(0xD00000000000003DLL, 0x8000000100031910, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 18, v0 + 19, v10 + 4, v10 + 12);
    *(_WORD *)(v10 + 12) = 2080;
    swift_bridgeObjectRetain(v9);
    v0[19] = sub_100027030(v35, v9, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 19, v0 + 20, v10 + 14, v10 + 22);
    swift_bridgeObjectRelease_n(v9, 3);
    *(_WORD *)(v10 + 22) = 2080;
    swift_bridgeObjectRetain(v8);
    v0[20] = sub_100027030(v36, v8, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 20, v0 + 21, v10 + 24, v10 + 32);
    swift_bridgeObjectRelease_n(v8, 3);
    *(_WORD *)(v10 + 32) = 2112;
    v0[21] = v39;
    v11 = v39;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 21, v0 + 22, v10 + 34, v10 + 42);
    *v37 = v39;

    _os_log_impl((void *)&_mh_execute_header, v5, type, "%s called with requestID %s, responderDSID: %s, answer: %@", (uint8_t *)v10, 0x2Au);
    v12 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v37, 1, v12);
    swift_slowDealloc(v37, -1, -1);
    swift_arrayDestroy(v42, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1, -1);
    swift_slowDealloc(v10, -1, -1);

  }
  else
  {
    v13 = (void *)v0[22];
    swift_bridgeObjectRelease_n(v0[24], 2);
    swift_bridgeObjectRelease_n(v8, 2);

  }
  v14 = v0[25];
  v15 = v0[26];
  v17 = v0[23];
  v16 = v0[24];
  v18 = (void *)v0[22];
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v15);
  sub_1000200D8(v17, v16, v14, v15, v18, v0 + 2);
  v19 = v0[26];
  v20 = v0[24];
  v21 = (void *)v0[22];

  swift_bridgeObjectRetain_n(v20, 2);
  swift_bridgeObjectRetain_n(v19, 2);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.default.getter();
  v24 = os_log_type_enabled(v22, v23);
  v25 = v0[26];
  if (v24)
  {
    v26 = v0[24];
    v38 = v0[25];
    v27 = (void *)v0[22];
    v28 = v0[23];
    v29 = swift_slowAlloc(32, -1);
    typea = (_QWORD *)swift_slowAlloc(8, -1);
    v43 = swift_slowAlloc(64, -1);
    v44[0] = v43;
    *(_DWORD *)v29 = 136315650;
    swift_bridgeObjectRetain(v26);
    v0[15] = sub_100027030(v28, v26, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 15, v0 + 16, v29 + 4, v29 + 12);
    swift_bridgeObjectRelease_n(v26, 3);
    *(_WORD *)(v29 + 12) = 2080;
    swift_bridgeObjectRetain(v25);
    v0[16] = sub_100027030(v38, v25, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 17, v29 + 14, v29 + 22);
    swift_bridgeObjectRelease_n(v25, 3);
    *(_WORD *)(v29 + 22) = 2112;
    v0[17] = v27;
    v30 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 17, v0 + 18, v29 + 24, v29 + 32);
    *typea = v27;

    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Calling into ScreenTimeAnswerHandler with requestID %s, responderDSID: %s, answer: %@", (uint8_t *)v29, 0x20u);
    v31 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(typea, 1, v31);
    swift_slowDealloc(typea, -1, -1);
    swift_arrayDestroy(v43, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v43, -1, -1);
    swift_slowDealloc(v29, -1, -1);
  }
  else
  {
    v32 = (void *)v0[22];
    swift_bridgeObjectRelease_n(v0[24], 2);
    swift_bridgeObjectRelease_n(v25, 2);

  }
  v33 = (_QWORD *)swift_task_alloc(dword_100042524);
  v0[27] = v33;
  *v33 = v0;
  v33[1] = sub_10000EB58;
  return sub_100019864();
}

uint64_t sub_10000EB58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 216);
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_10000EC0C;
  else
    v3 = sub_10000EBBC;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000EBBC()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 88) = *(_OWORD *)(v0 + 16);
  sub_10000F184(v0 + 88);
  *(_OWORD *)(v0 + 104) = *(_OWORD *)(v0 + 32);
  sub_10000F184(v0 + 104);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000EC0C()
{
  uint64_t v0;

  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 16);
  sub_10000F184(v0 + 56);
  *(_OWORD *)(v0 + 72) = *(_OWORD *)(v0 + 32);
  sub_10000F184(v0 + 72);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_10000EC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  ValueWitnessTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];
  _QWORD v17[5];

  v17[3] = &type metadata for iMessageSender;
  v17[4] = &off_10003DE68;
  v17[0] = swift_allocObject(&unk_10003D510, 112, 7);
  sub_10000EE84(a2, v17[0] + 16);
  v16[3] = &type metadata for ClientResponseTaskMapper;
  v16[4] = &off_10003E410;
  v4 = type metadata accessor for Server();
  v5 = (_QWORD *)swift_allocObject(v4, 112, 7);
  v6 = sub_10000EEC0((uint64_t)v17, (uint64_t)&type metadata for iMessageSender);
  __chkstk_darwin(v6);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(uint64_t, uint64_t))v9->initializeWithCopy)((uint64_t)v8, v10);
  v11 = sub_10000EEC0((uint64_t)v16, (uint64_t)&type metadata for ClientResponseTaskMapper);
  __chkstk_darwin(v11);
  (*(void (**)(void))(v12 + 16))();
  v5[7] = &type metadata for iMessageSender;
  v5[8] = &off_10003DE68;
  v13 = swift_allocObject(&unk_10003D510, 112, 7);
  v5[4] = v13;
  sub_10000EE84((uint64_t)v8, v13 + 16);
  v5[12] = &type metadata for ClientResponseTaskMapper;
  v5[13] = &off_10003E410;
  v5[2] = sub_10000D010((uint64_t)&off_10003CE30);
  v14 = swift_weakInit(v5 + 3, 0);
  swift_weakAssign(v14, a1);
  sub_10000EE64(v16);
  sub_10000EE64(v17);
  return v5;
}

_QWORD *sub_10000EDF4(_QWORD *a1)
{
  destroy for iMessageSender(a1);
  return a1;
}

uint64_t sub_10000EE28()
{
  _QWORD *v0;

  swift_unknownObjectWeakDestroy(v0 + 2);
  if (v0[7])
    sub_10000EE64(v0 + 4);
  sub_10000EE64(v0 + 9);
  return swift_deallocObject(v0, 112, 7);
}

uint64_t sub_10000EE64(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000EE84(uint64_t a1, uint64_t a2)
{
  initializeWithTake for iMessageSender(a2, a1);
  return a2;
}

uint64_t sub_10000EEC0(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000EEE8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000EF2C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v6 = v0[6];
  v7 = (_QWORD *)swift_task_alloc(dword_100041F04);
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_10000F7AC;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, void *, uint64_t))((char *)&dword_100041F00 + dword_100041F00))(v2, v3, v4, v5, v6);
}

uint64_t sub_10000EFB0()
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
  v5 = (_QWORD *)swift_task_alloc(dword_100041F14);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000F7AC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100041F10 + dword_100041F10))(v2, v3, v4);
}

uint64_t sub_10000F02C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100041F24);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000F7AC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100041F20 + dword_100041F20))(a1, v4, v5, v6);
}

uint64_t sub_10000F0B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005FF0(&qword_100042990);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000F0F0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F114(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100041F34);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100009560;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100041F30 + dword_100041F30))(a1, v4);
}

uint64_t sub_10000F184(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_10000F1AC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000F1E8()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v5 = (void *)v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc(dword_100041F4C);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_100009560;
  return ((uint64_t (*)(void *, int, void *, uint64_t))((char *)&dword_100041F48 + dword_100041F48))(v2, v3, v5, v4);
}

uint64_t sub_10000F268(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRetain(a5);
    return swift_bridgeObjectRetain(a3);
  }
  return result;
}

unint64_t sub_10000F298()
{
  unint64_t result;

  result = qword_100041F70;
  if (!qword_100041F70)
  {
    result = swift_getWitnessTable(&unk_100030360, &type metadata for ResponseError);
    atomic_store(result, (unint64_t *)&qword_100041F70);
  }
  return result;
}

uint64_t sub_10000F2DC(__int128 *a1, uint64_t a2)
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

uint64_t sub_10000F2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005FF0(&qword_100041F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F33C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000F370()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  __int16 v5;
  _QWORD *v6;

  v2 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_WORD *)(v0 + 24);
  v6 = (_QWORD *)swift_task_alloc(dword_100041F84);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_10000F7AC;
  return ((uint64_t (*)(void *, __int16, void *, uint64_t))((char *)&dword_100041F80 + dword_100041F80))(v2, v5, v3, v4);
}

uint64_t sub_10000F3F4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

unint64_t sub_10000F420()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100041FB0;
  if (!qword_100041FB0)
  {
    v1 = sub_100009B48(&qword_100041FA8);
    result = swift_getWitnessTable(&unk_100030510, v1);
    atomic_store(result, &qword_100041FB0);
  }
  return result;
}

unint64_t sub_10000F46C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100041FC0;
  if (!qword_100041FC0)
  {
    v1 = type metadata accessor for AppExtensionProxy();
    result = swift_getWitnessTable(&unk_100030110, v1);
    atomic_store(result, (unint64_t *)&qword_100041FC0);
  }
  return result;
}

uint64_t sub_10000F4B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_10000F4F8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = a1[3];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[8];
  v6 = (void *)a1[9];
  sub_100006B60(*a1, a1[1]);
  swift_bridgeObjectRetain(v5);
  v7 = v6;
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t *sub_10000F564(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[3];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[8];
  v6 = (void *)a1[9];
  sub_1000068DC(*a1, a1[1]);

  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v5);
  return a1;
}

uint64_t sub_10000F5D4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_errorRetain();
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t destroy for ResponseError(uint64_t a1)
{
  return sub_10000F5F4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10000F5F4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_errorRelease(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t _s6asktod13ResponseErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000F5D4(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ResponseError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000F5D4(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_10000F5F4(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ResponseError(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ResponseError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_10000F5F4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ResponseError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ResponseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10000F784(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10000F78C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ResponseError()
{
  return &type metadata for ResponseError;
}

uint64_t sub_10000F7B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;

  v1 = v0;
  *(_QWORD *)(v0 + 16) = 0;
  if (qword_1000418C8 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_1000036A4(v2, (uint64_t)qword_100043EF8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Initializing daemon", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Daemon entering sandbox", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = _set_user_dir_suffix("com.apple.asktod");
  if ((_DWORD)v11)
  {
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Creating IDS service and adding service delegate", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    if (qword_100041928 != -1)
      swift_once(&qword_100041928, sub_100029C9C);
    v15 = (void *)qword_100043FF0;
    *(_QWORD *)(v0 + 24) = qword_100043FF0;
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Creating Biome listener", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    v19 = sub_100005FF0((uint64_t *)&unk_1000420A0);
    v20 = swift_allocObject(v19, 48, 7);
    *(_OWORD *)(v20 + 16) = xmmword_100030010;
    type metadata accessor for ScreenTimeRequestBiomeEventHandler();
    *(_QWORD *)(v20 + 32) = sub_100007170();
    *(_QWORD *)(v20 + 40) = &off_100041D48;
    *(_QWORD *)(v1 + 32) = v20;
    return v1;
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001ELL, 0x8000000100031B50, "asktod/Daemon+Sandbox-iOS.swift", 31, 2, 20, 0);
    __break(1u);
  }
  return result;
}

void sub_10000FAB8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  char *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v3 = qword_100041FD0;
  v2 = off_100041FD8;
  v4 = qword_1000418C8;
  swift_bridgeObjectRetain(off_100041FD8);
  if (v4 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v5 = type metadata accessor for Logger(0);
  sub_1000036A4(v5, (uint64_t)qword_100043EF8);
  v6 = swift_bridgeObjectRetain_n(v2, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v25 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain(v2);
    v24 = sub_100027030(v3, (unint64_t)v2, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease_n(v2, 3);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Starting daemon - %s", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    v11 = swift_bridgeObjectRelease_n(v2, 2);
  }
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Creating and resuming client connection listener", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = objc_allocWithZone((Class)sub_100005FF0(&qword_100042090));
  swift_bridgeObjectRetain(v2);
  v16 = sub_10001005C(v3, (uint64_t)v2);
  sub_10000FE48();
  v17 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v16;
  v18 = v16;

  v19 = swift_bridgeObjectRetain(v2);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = swift_slowAlloc(32, -1);
    v25 = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain(v2);
    v24 = sub_100027030(v3, (unint64_t)v2, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease_n(v2, 3);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Daemon started - %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v2, 2);
  }
}

id sub_10000FE48()
{
  void *v0;
  uint64_t v1;
  char *v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;

  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v1 = type metadata accessor for Logger(0);
  sub_1000036A4(v1, (uint64_t)qword_100043F10);
  v2 = v0;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v11 = v6;
    *(_DWORD *)v5 = 136315138;
    v7 = *(_QWORD *)&v2[qword_1000420B0];
    v8 = *(_QWORD *)&v2[qword_1000420B0 + 8];
    swift_bridgeObjectRetain(v8);
    v10 = sub_100027030(v7, v8, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);

    swift_bridgeObjectRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Resuming XPC listener for %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(*(id *)&v2[qword_1000420B8], "resume");
}

uint64_t sub_100010008()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for AskToDaemon()
{
  return objc_opt_self(_TtC6asktod11AskToDaemon);
}

char *sub_10001005C(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  NSString v11;
  id v12;
  char *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType(v2);
  v6 = qword_1000420C0;
  v7 = sub_100005FF0(&qword_100042098);
  swift_allocObject(v7, 24, 7);
  v8 = v2;
  *(_QWORD *)&v2[v6] = sub_10001018C((uint64_t)&_swiftEmptyArrayStorage);
  v9 = &v8[qword_1000420B0];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  v10 = objc_allocWithZone((Class)NSXPCListener);
  swift_bridgeObjectRetain(a2);
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = objc_msgSend(v10, "initWithMachServiceName:", v11);

  *(_QWORD *)&v8[qword_1000420B8] = v12;
  v15.receiver = v8;
  v15.super_class = ObjectType;
  v13 = (char *)objc_msgSendSuper2(&v15, "init");
  objc_msgSend(*(id *)&v13[qword_1000420B8], "setDelegate:", v13);
  return v13;
}

uint64_t sub_10001018C(uint64_t a1)
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
  uint64_t isUniquelyReferenced_nonNull_native;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v2 = (_QWORD *)sub_100025DE8((uint64_t)&_swiftEmptyArrayStorage);
  if ((unint64_t)a1 >> 62)
  {
LABEL_25:
    if (a1 < 0)
      v24 = a1;
    else
      v24 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v24);
    swift_bridgeObjectRelease(a1);
    if (v3)
      goto LABEL_3;
LABEL_29:
    result = v26;
    *(_QWORD *)(v26 + 16) = v2;
    return result;
  }
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
    goto LABEL_29;
LABEL_3:
  v27 = a1;
  v28 = a1 & 0xC000000000000001;
  v4 = 4;
  while (1)
  {
    v7 = v4 - 4;
    if (v28)
    {
      v8 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, a1);
      v9 = v4 - 3;
      if (__OFADD__(v7, 1))
        goto LABEL_22;
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 8 * v4);
      swift_retain(v8);
      v9 = v4 - 3;
      if (__OFADD__(v7, 1))
      {
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
    }
    a1 = *(_QWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v8 + 24);
    swift_bridgeObjectRetain(v10);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v2);
    v13 = sub_1000276E8(a1, v10);
    v14 = v2[2];
    v15 = (v12 & 1) == 0;
    v16 = v14 + v15;
    if (__OFADD__(v14, v15))
      goto LABEL_23;
    v17 = v12;
    if (v2[3] < v16)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v12 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      sub_100028588();
      if ((v17 & 1) != 0)
      {
LABEL_4:
        v5 = v2[7];
        v6 = 8 * v13;
        swift_release(*(_QWORD *)(v5 + v6));
        *(_QWORD *)(v5 + v6) = v8;
        goto LABEL_5;
      }
    }
LABEL_18:
    v2[(v13 >> 6) + 8] |= 1 << v13;
    v20 = (uint64_t *)(v2[6] + 16 * v13);
    *v20 = a1;
    v20[1] = v10;
    *(_QWORD *)(v2[7] + 8 * v13) = v8;
    v21 = v2[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_24;
    v2[2] = v23;
    swift_bridgeObjectRetain(v10);
LABEL_5:
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(0x8000000000000000);
    ++v4;
    a1 = v27;
    if (v9 == v3)
      goto LABEL_29;
  }
  sub_100027964(v16, isUniquelyReferenced_nonNull_native);
  v18 = sub_1000276E8(a1, v10);
  if ((v17 & 1) == (v19 & 1))
  {
    v13 = v18;
    if ((v17 & 1) != 0)
      goto LABEL_4;
    goto LABEL_18;
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_1000103C4(uint64_t a1)
{
  _QWORD v2[3];

  v2[0] = &unk_100030410;
  v2[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  return swift_initClassMetadata2(a1, 0, 3, v2, a1 + 112);
}

void sub_100010420(void *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  void **v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void ***, uint64_t, uint64_t);
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void ***, uint64_t, uint64_t);
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  _QWORD *v30;
  void **v31;
  _QWORD *v32;
  void *v33;
  _QWORD *v34;
  void **v35;
  void **v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void **aBlock;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  uint64_t (*v47)();
  _QWORD *v48;

  v3 = (_QWORD *)(swift_isaMask & *v1);
  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043F10);
  v5 = v1;
  v6 = a1;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(18, -1);
    v10 = (void **)swift_slowAlloc(32, -1);
    aBlock = v10;
    *(_DWORD *)v9 = 136315394;
    v11 = *(_QWORD *)((char *)v5 + qword_1000420B0);
    v12 = *(_QWORD *)((char *)v5 + qword_1000420B0 + 8);
    swift_bridgeObjectRetain(v12);
    v42 = sub_100027030(v11, v12, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &aBlock, v9 + 4, v9 + 12);

    swift_bridgeObjectRelease(v12);
    *(_WORD *)(v9 + 12) = 1024;
    LODWORD(v42) = objc_msgSend(v6, "processIdentifier");
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, (char *)&v42 + 4, v9 + 14, v9 + 18);

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Configuring XPC connection for %s from PID %d", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

  }
  v13 = v3[11];
  aBlock = v6;
  v14 = v3[13];
  v15 = *(uint64_t (**)(void ***, uint64_t, uint64_t))(v14 + 48);
  v16 = v6;
  v17 = v15(&aBlock, v13, v14);
  v18 = v3[10];
  aBlock = (void **)v17;
  v19 = v3[12];
  v20 = *(uint64_t (**)(void ***, uint64_t, uint64_t))(v19 + 24);
  swift_unknownObjectRetain(v17);
  v21 = v20(&aBlock, v18, v19);
  v22 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
  v23 = (void *)objc_opt_self(NSXPCInterface);
  v24 = objc_msgSend(v23, "interfaceWithProtocol:", v22);

  objc_msgSend(v16, "setExportedInterface:", v24);
  v41 = v21;
  objc_msgSend(v16, "setExportedObject:", v21);
  v25 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v14 + 40))(v13, v14);
  v26 = objc_msgSend(v23, "interfaceWithProtocol:", v25);

  v40 = v26;
  objc_msgSend(v16, "setRemoteObjectInterface:", v26);
  v27 = (_QWORD *)swift_allocObject(&unk_10003D878, 40, 7);
  v27[2] = v16;
  v27[3] = v5;
  v27[4] = v17;
  v47 = sub_1000110CC;
  v48 = v27;
  aBlock = _NSConcreteStackBlock;
  v44 = 1107296256;
  v45 = sub_10002636C;
  v46 = &unk_10003D890;
  v28 = _Block_copy(&aBlock);
  v29 = v48;
  v30 = v5;
  v31 = v16;
  swift_unknownObjectRetain(v17);
  swift_release(v29);
  objc_msgSend(v31, "setInterruptionHandler:", v28);
  _Block_release(v28);
  v32 = (_QWORD *)swift_allocObject(&unk_10003D8C8, 40, 7);
  v32[2] = v31;
  v32[3] = v30;
  v32[4] = v17;
  v47 = sub_100011148;
  v48 = v32;
  aBlock = _NSConcreteStackBlock;
  v44 = 1107296256;
  v45 = sub_10002636C;
  v46 = &unk_10003D8E0;
  v33 = _Block_copy(&aBlock);
  v34 = v48;
  v30;
  v35 = v31;
  swift_unknownObjectRetain(v17);
  swift_release(v34);
  objc_msgSend(v35, "setInvalidationHandler:", v33);
  _Block_release(v33);
  (*(void (**)(uint64_t, uint64_t))(v14 + 56))(v13, v14);
  sub_1000211D4(v17);
  v36 = v35;
  v37 = Logger.logObject.getter(v36);
  v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v39 = 67109120;
    LODWORD(aBlock) = objc_msgSend(v36, "processIdentifier");
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, (char *)&aBlock + 4, v39 + 4, v39 + 8);

    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Activated connection for PID %d", v39, 8u);
    swift_slowDealloc(v39, -1, -1);
    swift_unknownObjectRelease(v17);

    swift_unknownObjectRelease(v41);
  }
  else
  {

    swift_unknownObjectRelease(v41);
    swift_unknownObjectRelease(v17);
  }
}

uint64_t sub_100010998(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  unsigned int v15;
  uint64_t v16;

  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v9 = type metadata accessor for Logger(0);
  sub_1000036A4(v9, (uint64_t)qword_100043F10);
  v10 = a1;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v13 = 67109120;
    v15 = objc_msgSend(v10, "processIdentifier");
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v13 + 4, v13 + 8);

    _os_log_impl((void *)&_mh_execute_header, v11, v12, a4, v13, 8u);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {

  }
  return a5(a3);
}

uint64_t sub_100010B04(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = sub_100010ECC(v7);

  return v9 & 1;
}

void sub_100010B60()
{
  sub_10001109C();
}

id sub_100010B80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100010BB4(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_1000420B0 + 8));

  return swift_release(*(_QWORD *)(a1 + qword_1000420C0));
}

uint64_t type metadata accessor for XPCClientConnectionListener(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for XPCClientConnectionListener);
}

uint64_t sub_100010C0C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t sub_100010C14(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 1;
  swift_bridgeObjectRetain(a2);
  v5 = 0;
  while (1)
  {
    v6 = *(unsigned __int8 *)(a2 + v5++ + 32);
    v7 = 0xD00000000000002FLL;
    if (v6 == 1)
    {
      v8 = 0x80000001000311D0;
    }
    else
    {
      v7 = 0xD000000000000025;
      v8 = 0x8000000100031200;
    }
    v9 = v6 ? v7 : 0xD000000000000010;
    v10 = v6 ? v8 : 0x80000001000311B0;
    v11 = sub_100019540(v9, v10);
    swift_bridgeObjectRelease(v10);
    if ((v11 & 1) == 0)
      break;
    if (v2 == v5)
    {
      swift_bridgeObjectRelease(a2);
      return 1;
    }
  }
  swift_bridgeObjectRelease(a2);
  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v13 = type metadata accessor for Logger(0);
  sub_1000036A4(v13, (uint64_t)qword_100043F10);
  v14 = a1;
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(18, -1);
    v18 = swift_slowAlloc(32, -1);
    v24 = v18;
    *(_DWORD *)v17 = 67109378;
    LODWORD(v23) = objc_msgSend(v14, "processIdentifier");
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, (char *)&v23 + 4, v17 + 4, v17 + 8);

    *(_WORD *)(v17 + 8) = 2080;
    v19 = 0xD00000000000002FLL;
    v20 = 0x80000001000311D0;
    if (v6 != 1)
    {
      v19 = 0xD000000000000025;
      v20 = 0x8000000100031200;
    }
    if (v6)
      v21 = v19;
    else
      v21 = 0xD000000000000010;
    if (v6)
      v22 = v20;
    else
      v22 = 0x80000001000311B0;
    v23 = sub_100027030(v21, v22, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v17 + 10, v17 + 18);
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Rejecting connection to PID %d. Missing entitlement: %s", (uint8_t *)v17, 0x12u);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_100010ECC(void *a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v13;
  uint64_t v14;

  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v3 = type metadata accessor for Logger(0);
  sub_1000036A4(v3, (uint64_t)qword_100043F10);
  v4 = v1;
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v14 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = *(_QWORD *)&v4[qword_1000420B0];
    v10 = *(_QWORD *)&v4[qword_1000420B0 + 8];
    swift_bridgeObjectRetain(v10);
    v13 = sub_100027030(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 4, v7 + 12);

    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Incoming XPC connection for %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
  v11 = sub_100010C14(a1, (uint64_t)&off_10003CE58);
  if ((v11 & 1) != 0)
    sub_100010420(a1);
  return v11 & 1;
}

void sub_10001109C()
{
  _swift_stdlib_reportUnimplementedInitializer("asktod.XPCClientConnectionListener", 34, "init()", 6, 0);
  __break(1u);
}

uint64_t sub_1000110CC()
{
  uint64_t v0;

  return sub_100010998(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), "Connection interrupted for PID %d", (uint64_t (*)(uint64_t))sub_100020EAC);
}

uint64_t sub_1000110F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100011108(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100011114()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100011148()
{
  uint64_t v0;

  return sub_100010998(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), "Connection invalidated for PID %d", (uint64_t (*)(uint64_t))sub_100020EAC);
}

uint64_t sub_10001117C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch(sub_100011194, 0, 0);
}

uint64_t sub_100011194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _QWORD *v8;
  uint64_t v9;

  if (*(_WORD *)(*(_QWORD *)(v0 + 24) + 24))
  {
    if (qword_1000418E8 != -1)
      swift_once(&qword_1000418E8, sub_100025C9C);
    v1 = type metadata accessor for Logger(0);
    v2 = sub_1000036A4(v1, (uint64_t)qword_100043F58);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(12, -1);
      v6 = swift_slowAlloc(32, -1);
      v9 = v6;
      *(_DWORD *)v5 = 136315138;
      *(_QWORD *)(v0 + 16) = sub_100027030(0xD00000000000001ALL, 0x8000000100031CA0, &v9);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v5 + 4, v5 + 12);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s Unhandled transport", v5, 0xCu);
      swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v6, -1, -1);
      swift_slowDealloc(v5, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
  else
  {
    v8 = (_QWORD *)swift_task_alloc(dword_1000422AC);
    *(_QWORD *)(v0 + 32) = v8;
    *v8 = v0;
    v8[1] = sub_100011384;
    v8[4] = *(_QWORD *)(v0 + 24);
    return swift_task_switch(sub_1000113EC, 0, 0);
  }
}

uint64_t sub_100011384(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 32));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1000113D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch(sub_1000113EC, 0, 0);
}

uint64_t sub_1000113EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(v0[4] + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain_n(v1, 2);
    v24 = v1;
    v3 = (unint64_t *)(v1 + 40);
    do
    {
      v4 = *(v3 - 1);
      v5 = *v3;
      swift_bridgeObjectRetain(*v3);
      v6 = String._bridgeToObjectiveC()();
      v7 = IDSCopyBestGuessIDForID();

      if (v7)
      {
        v8 = swift_bridgeObjectRelease(v5);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v8);
        v10 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
        v9 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v10 >= v9 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v9 > 1, v10 + 1, 1);
        v11 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v10, v7);
        specialized Array._endMutation()(v11);
      }
      else
      {
        if (qword_1000418E8 != -1)
          swift_once(&qword_1000418E8, sub_100025C9C);
        v12 = type metadata accessor for Logger(0);
        sub_1000036A4(v12, (uint64_t)qword_100043F58);
        swift_bridgeObjectRetain_n(v5, 2);
        v14 = Logger.logObject.getter(v13);
        v15 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v14, v15))
        {
          v16 = swift_slowAlloc(12, -1);
          v17 = swift_slowAlloc(32, -1);
          v25 = v17;
          *(_DWORD *)v16 = 136315138;
          swift_bridgeObjectRetain(v5);
          *(_QWORD *)(v16 + 4) = sub_100027030(v4, v5, &v25);
          swift_bridgeObjectRelease_n(v5, 3);
          _os_log_impl((void *)&_mh_execute_header, v14, v15, "Best guess ID for %s was nil. Skipping destination.", (uint8_t *)v16, 0xCu);
          swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v17, -1, -1);
          swift_slowDealloc(v16, -1, -1);

          swift_bridgeObjectRelease(v5);
        }
        else
        {
          swift_bridgeObjectRelease_n(v5, 3);

        }
      }
      v3 += 2;
      --v2;
    }
    while (v2);
    v1 = v24;
    swift_bridgeObjectRelease(v24);
    v0 = v23;
  }
  else
  {
    swift_bridgeObjectRetain(v1);
  }
  v0[5] = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v1);
  if (qword_100041928 != -1)
    swift_once(&qword_100041928, sub_100029C9C);
  v18 = qword_100043FF0;
  v19 = (_QWORD *)swift_task_alloc(48);
  v0[6] = v19;
  v19[2] = v18;
  v19[3] = &_swiftEmptyArrayStorage;
  v19[4] = 0xD000000000000010;
  v19[5] = 0x8000000100031CC0;
  v20 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v0[7] = v20;
  v21 = sub_100005FF0(&qword_1000422B0);
  *v20 = v0;
  v20[1] = sub_10001174C;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 2, 0, 0, 0xD00000000000002BLL, 0x8000000100031CE0, sub_100011AE8, v19, v21);
}

uint64_t sub_10001174C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 56));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_1000117A8, 0, 0);
}

uint64_t sub_1000117A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  v1 = *(_QWORD *)(v0 + 16);
  if (qword_1000418E8 != -1)
    swift_once(&qword_1000418E8, sub_100025C9C);
  v2 = type metadata accessor for Logger(0);
  sub_1000036A4(v2, (uint64_t)qword_100043F58);
  v3 = swift_bridgeObjectRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v6 = 134217984;
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Found %ld valid IDS destinations", v6, 0xCu);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease(v1);
  }

  v7 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(BOOL))(v0 + 8))(v7 != 0);
}

uint64_t sub_1000118F4()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  sub_10000EE64(v0 + 5);
  sub_10000EE64(v0 + 10);
  return swift_deallocClassInstance(v0, 120, 7);
}

uint64_t type metadata accessor for PrivledgedRecipientGroup()
{
  return objc_opt_self(_TtC6asktod24PrivledgedRecipientGroup);
}

uint64_t initializeBufferWithCopyOfBuffer for PrivledgedRecipientGroup.Context(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
  swift_retain(v3);
  return a1;
}

uint64_t destroy for PrivledgedRecipientGroup.Context(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t *assignWithCopy for PrivledgedRecipientGroup.Context(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  *((_WORD *)a1 + 4) = *((_WORD *)a2 + 4);
  return a1;
}

uint64_t initializeWithTake for PrivledgedRecipientGroup.Context(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t *assignWithTake for PrivledgedRecipientGroup.Context(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  *((_WORD *)a1 + 4) = *((_WORD *)a2 + 4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PrivledgedRecipientGroup.Context(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 10))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PrivledgedRecipientGroup.Context(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PrivledgedRecipientGroup.Context()
{
  return &type metadata for PrivledgedRecipientGroup.Context;
}

uint64_t sub_100011AE8(uint64_t a1)
{
  uint64_t *v1;

  return sub_10002A0B0(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_100011AF4(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, __int16 a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD v28[3];
  uint64_t v29;
  _UNKNOWN **v30;
  _QWORD v31[5];

  v12 = type metadata accessor for IDSRelay();
  v31[3] = v12;
  v31[4] = &off_10003E938;
  v31[0] = a1;
  v13 = type metadata accessor for IDSLookupController(0);
  v29 = v13;
  v30 = &off_10003E500;
  v14 = sub_100012B14(v28);
  sub_100012C10(a2, (uint64_t)v14);
  v15 = type metadata accessor for PrivledgedRecipientGroup();
  v16 = swift_allocObject(v15, 120, 7);
  v17 = sub_10000EEC0((uint64_t)v31, v12);
  __chkstk_darwin(v17);
  v19 = (_QWORD *)((char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  v21 = sub_10000EEC0((uint64_t)v28, v29);
  __chkstk_darwin(v21);
  v23 = (char *)v28 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  v25 = *v19;
  *(_QWORD *)(v16 + 64) = v12;
  *(_QWORD *)(v16 + 72) = &off_10003E938;
  *(_QWORD *)(v16 + 40) = v25;
  *(_QWORD *)(v16 + 104) = v13;
  *(_QWORD *)(v16 + 112) = &off_10003E500;
  v26 = sub_100012B14((_QWORD *)(v16 + 80));
  sub_100012C10((uint64_t)v23, (uint64_t)v26);
  *(_QWORD *)(v16 + 16) = a3;
  *(_WORD *)(v16 + 24) = a4;
  *(_WORD *)(v16 + 26) = a5;
  *(_QWORD *)(v16 + 32) = a6;
  sub_10000EE64(v28);
  sub_10000EE64(v31);
  return v16;
}

uint64_t sub_100011CA4(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, __int16 a5)
{
  uint64_t v5;

  *(_WORD *)(v5 + 292) = a5;
  *(_WORD *)(v5 + 290) = a4;
  *(_QWORD *)(v5 + 216) = a2;
  *(_QWORD *)(v5 + 224) = a3;
  *(_QWORD *)(v5 + 208) = a1;
  return swift_task_switch(sub_100011CC8, 0, 0);
}

uint64_t sub_100011CC8()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t KeyPath;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  __int16 v47;
  __int16 v48;
  uint64_t v49;

  if (*(unsigned __int16 *)(v0 + 292) == 0xFFFF)
  {
    v7 = *(_QWORD *)(v0 + 224);
    if (v7)
    {
      swift_retain(*(_QWORD *)(v0 + 224));
      if ((sub_100019540(0xD000000000000025, 0x8000000100031200) & 1) != 0)
      {
        v8 = (unsigned __int16)Transport.rawValue.getter(*(unsigned __int16 *)(v0 + 290));
        if (v8 == (unsigned __int16)Transport.rawValue.getter(0))
        {
          swift_release(v7);
          v9 = *(_QWORD **)(v0 + 216);
          v49 = *(_QWORD *)(v0 + 224);
          v10 = *(_QWORD **)(v0 + 208);
          v47 = *(_WORD *)(v0 + 292);
          v48 = *(_WORD *)(v0 + 290);
          sub_10000F4B4((uint64_t)v10, v0 + 80);
          sub_10000F4B4((uint64_t)v9, v0 + 120);
          v11 = *(_QWORD *)(v0 + 104);
          v12 = sub_10000EEC0(v0 + 80, v11);
          v13 = *(_QWORD *)(v11 - 8);
          v14 = (uint64_t *)swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 16))(v14, v12, v11);
          v15 = *(_QWORD *)(v0 + 144);
          v16 = sub_10000EEC0(v0 + 120, v15);
          v17 = *(_QWORD *)(v15 - 8);
          v18 = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v18, v16, v15);
          v19 = sub_100011AF4(*v14, v18, v49, v48, v47, (uint64_t)&_swiftEmptyArrayStorage);
          sub_10000EE64((_QWORD *)(v0 + 120));
          swift_task_dealloc(v18);
          sub_10000EE64((_QWORD *)(v0 + 80));
          swift_task_dealloc(v14);
          sub_10000EE64(v10);
          sub_10000EE64(v9);
          return (*(uint64_t (**)(uint64_t))(v0 + 8))(v19);
        }
        v27 = *(_QWORD **)(v0 + 208);
        v44 = sub_100005FF0(&qword_100041FA8);
        v45 = sub_100012BD0(&qword_100041FB0, &qword_100041FA8);
        v42 = swift_allocError(v44, v45, 0, 0);
        *v46 = 1;
      }
      else
      {
        v27 = *(_QWORD **)(v0 + 208);
        v40 = sub_100005FF0(&qword_100041FA8);
        v41 = sub_100012BD0(&qword_100041FB0, &qword_100041FA8);
        v42 = swift_allocError(v40, v41, 0, 0);
        *v43 = 0;
      }
      swift_willThrow(v42);
      swift_release_n(v7, 2);
    }
    else
    {
      v27 = *(_QWORD **)(v0 + 208);
      KeyPath = swift_getKeyPath(&unk_1000304D8);
      v36 = sub_100005FF0(&qword_1000422C8);
      v37 = sub_100012BD0(qword_1000422D0, &qword_1000422C8);
      v38 = swift_allocError(v36, v37, 0, 0);
      *v39 = KeyPath;
      swift_willThrow(v38);
    }
  }
  else
  {
    if (*(_WORD *)(v0 + 292))
    {
      if (qword_1000418E8 != -1)
        swift_once(&qword_1000418E8, sub_100025C9C);
      v20 = type metadata accessor for Logger(0);
      v21 = sub_1000036A4(v20, (uint64_t)qword_100043F58);
      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = *(unsigned __int16 *)(v0 + 292);
        v25 = (uint8_t *)swift_slowAlloc(6, -1);
        *(_DWORD *)v25 = 33554688;
        *(_WORD *)(v0 + 288) = ATRecipientGroup.rawValue.getter(v24);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 290, v25 + 4, v25 + 6);
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Error inflating recipient group. Recipient group was unknown. %hd", v25, 6u);
        swift_slowDealloc(v25, -1, -1);
      }

      v26 = *(_QWORD *)(v0 + 224);
      v27 = *(_QWORD **)(v0 + 208);
      v28 = sub_100005FF0(&qword_100041FA8);
      v29 = sub_100012BD0(&qword_100041FB0, &qword_100041FA8);
      v30 = swift_allocError(v28, v29, 0, 0);
      v32 = 2;
    }
    else
    {
      v1 = (unsigned __int16)Transport.rawValue.getter(*(unsigned __int16 *)(v0 + 290));
      if (v1 == (unsigned __int16)Transport.rawValue.getter(0))
      {
        v2 = v0 + 16;
        v3 = objc_msgSend(objc_allocWithZone((Class)FAFetchFamilyCircleRequest), "init");
        *(_QWORD *)(v0 + 232) = v3;
        *(_QWORD *)(v0 + 56) = v0 + 200;
        *(_QWORD *)(v0 + 16) = v0;
        *(_QWORD *)(v0 + 24) = sub_100012218;
        v4 = swift_continuation_init(v0 + 16, 1);
        *(_QWORD *)(v0 + 160) = _NSConcreteStackBlock;
        v5 = (_QWORD *)(v0 + 160);
        v5[1] = 0x40000000;
        v5[2] = sub_10001BD7C;
        v5[3] = &unk_10003D9A0;
        v5[4] = v4;
        objc_msgSend(v3, "startRequestWithCompletionHandler:", v5);
        return swift_continuation_await(v2);
      }
      v26 = *(_QWORD *)(v0 + 224);
      v27 = *(_QWORD **)(v0 + 208);
      v33 = sub_100005FF0(&qword_100041FA8);
      v34 = sub_100012BD0(&qword_100041FB0, &qword_100041FA8);
      v30 = swift_allocError(v33, v34, 0, 0);
      v32 = 1;
    }
    *v31 = v32;
    swift_willThrow(v30);
    swift_release(v26);
  }
  sub_10000EE64(v27);
  sub_10000EE64(*(_QWORD **)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012218()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 240) = v1;
  if (v1)
    v2 = sub_100012840;
  else
    v2 = sub_100012278;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100012278()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v1 = *(void **)(v0 + 200);
  *(_QWORD *)(v0 + 248) = v1;
  v2 = FAFamilyCircle.guardiansNotMe()();
  v3 = v2;
  *(_QWORD *)(v0 + 256) = v2;
  if ((unint64_t)v2 >> 62)
  {
    if (v2 >= 0)
      v2 &= 0xFFFFFFFFFFFFFF8uLL;
    if (_CocoaArrayWrapper.endIndex.getter(v2))
      goto LABEL_3;
  }
  else if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_100003680(*(_QWORD **)(v0 + 216), *(_QWORD *)(*(_QWORD *)(v0 + 216) + 24));
    v4 = (_QWORD *)swift_task_alloc(dword_1000426A4);
    *(_QWORD *)(v0 + 264) = v4;
    *v4 = v0;
    v4[1] = sub_100012474;
    return sub_1000219D8(v3);
  }
  swift_bridgeObjectRelease(v3);
  if (qword_1000418E8 != -1)
    swift_once(&qword_1000418E8, sub_100025C9C);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_1000036A4(v6, (uint64_t)qword_100043F58);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "There were no parents and guardians. This shouldn't ever happen. Please file a radar to Family Frameworks - AskTo | All.", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }
  v11 = *(_QWORD *)(v0 + 224);
  v12 = *(void **)(v0 + 232);
  v13 = *(_QWORD **)(v0 + 208);

  v14 = sub_100005FF0(&qword_100041FA8);
  v15 = sub_100012BD0(&qword_100041FB0, &qword_100041FA8);
  v16 = swift_allocError(v14, v15, 0, 0);
  *v17 = 3;
  swift_willThrow(v16);

  swift_release(v11);
  sub_10000EE64(v13);
  sub_10000EE64(*(_QWORD **)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012474(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 264);
  v3[34] = a1;
  v3[35] = v1;
  swift_task_dealloc(v4);
  swift_bridgeObjectRelease(v3[32]);
  if (v1)
    v5 = sub_1000127E0;
  else
    v5 = sub_1000124E8;
  return swift_task_switch(v5, 0, 0);
}

void sub_1000124E8()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  _QWORD *v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int16 v33;
  __int16 v34;
  uint64_t v35;
  char *v36;

  v1 = 0;
  v2 = *(_QWORD *)(v0 + 272);
  v4 = v2 + 64;
  v3 = *(_QWORD *)(v2 + 64);
  v5 = -1;
  v6 = -1 << *(_BYTE *)(v2 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & v3;
  v8 = (unint64_t)(63 - v6) >> 6;
  v36 = (char *)&_swiftEmptyArrayStorage;
  if ((v5 & v3) == 0)
    goto LABEL_7;
LABEL_4:
  v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v9 | (v1 << 6); ; i = __clz(__rbit64(v13)) + (v1 << 6))
  {
    v11 = *(_QWORD **)(*(_QWORD *)(v2 + 56) + 8 * i);
    if (v11[2])
    {
      v16 = v11[4];
      v15 = v11[5];
      swift_bridgeObjectRetain(v15);
      if ((swift_isUniquelyReferenced_nonNull_native(v36) & 1) == 0)
        v36 = sub_10001D8D0(0, *((_QWORD *)v36 + 2) + 1, 1, v36);
      v18 = *((_QWORD *)v36 + 2);
      v17 = *((_QWORD *)v36 + 3);
      if (v18 >= v17 >> 1)
        v36 = sub_10001D8D0((char *)(v17 > 1), v18 + 1, 1, v36);
      *((_QWORD *)v36 + 2) = v18 + 1;
      v19 = &v36[16 * v18];
      *((_QWORD *)v19 + 4) = v16;
      *((_QWORD *)v19 + 5) = v15;
      if (v7)
        goto LABEL_4;
    }
    else if (v7)
    {
      goto LABEL_4;
    }
LABEL_7:
    v12 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v12 >= v8)
      goto LABEL_27;
    v13 = *(_QWORD *)(v4 + 8 * v12);
    ++v1;
    if (!v13)
    {
      v1 = v12 + 1;
      if (v12 + 1 >= v8)
        goto LABEL_27;
      v13 = *(_QWORD *)(v4 + 8 * v1);
      if (!v13)
      {
        v1 = v12 + 2;
        if (v12 + 2 >= v8)
          goto LABEL_27;
        v13 = *(_QWORD *)(v4 + 8 * v1);
        if (!v13)
          break;
      }
    }
LABEL_20:
    v7 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v8)
  {
LABEL_27:
    v20 = *(_QWORD *)(v0 + 272);
    v21 = *(void **)(v0 + 248);

    swift_release(v20);
    v22 = *(_QWORD **)(v0 + 216);
    v35 = *(_QWORD *)(v0 + 224);
    v23 = *(_QWORD **)(v0 + 208);
    v33 = *(_WORD *)(v0 + 292);
    v34 = *(_WORD *)(v0 + 290);
    sub_10000F4B4((uint64_t)v23, v0 + 80);
    sub_10000F4B4((uint64_t)v22, v0 + 120);
    v24 = *(_QWORD *)(v0 + 104);
    v25 = sub_10000EEC0(v0 + 80, v24);
    v26 = *(_QWORD *)(v24 - 8);
    v27 = (uint64_t *)swift_task_alloc((*(_QWORD *)(v26 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v26 + 16))(v27, v25, v24);
    v28 = *(_QWORD *)(v0 + 144);
    v29 = sub_10000EEC0(v0 + 120, v28);
    v30 = *(_QWORD *)(v28 - 8);
    v31 = swift_task_alloc((*(_QWORD *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v31, v29, v28);
    v32 = sub_100011AF4(*v27, v31, v35, v34, v33, (uint64_t)v36);
    sub_10000EE64((_QWORD *)(v0 + 120));
    swift_task_dealloc(v31);
    sub_10000EE64((_QWORD *)(v0 + 80));
    swift_task_dealloc(v27);
    sub_10000EE64(v23);
    sub_10000EE64(v22);
    (*(void (**)(uint64_t))(v0 + 8))(v32);
    return;
  }
  v13 = *(_QWORD *)(v4 + 8 * v14);
  if (v13)
  {
    v1 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    v1 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v1 >= v8)
      goto LABEL_27;
    v13 = *(_QWORD *)(v4 + 8 * v1);
    ++v14;
    if (v13)
      goto LABEL_20;
  }
LABEL_29:
  __break(1u);
}

uint64_t sub_1000127E0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(void **)(v0 + 232);
  v3 = *(_QWORD **)(v0 + 208);

  swift_release(v1);
  sub_10000EE64(v3);
  sub_10000EE64(*(_QWORD **)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012840(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(void **)(v1 + 232);
  v3 = *(_QWORD *)(v1 + 224);
  v4 = *(_QWORD **)(v1 + 208);
  swift_willThrow(a1);

  swift_release(v3);
  sub_10000EE64(v4);
  sub_10000EE64(*(_QWORD **)(v1 + 216));
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000128A8(uint64_t a1, __int16 a2, __int16 a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + 146) = a3;
  *(_WORD *)(v3 + 144) = a2;
  *(_QWORD *)(v3 + 96) = a1;
  v4 = type metadata accessor for IDSLookupController(0);
  *(_QWORD *)(v3 + 104) = v4;
  *(_QWORD *)(v3 + 112) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10001290C, 0, 0);
}

uint64_t sub_10001290C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  char *v10;

  if (qword_100041928 != -1)
    swift_once(&qword_100041928, sub_100029C9C);
  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = (void *)qword_100043FF0;
  sub_1000216F4(v1);
  *(_QWORD *)(v0 + 40) = type metadata accessor for IDSRelay();
  *(_QWORD *)(v0 + 48) = &off_10003E938;
  *(_QWORD *)(v0 + 16) = v4;
  *(_QWORD *)(v0 + 80) = v2;
  *(_QWORD *)(v0 + 88) = &off_10003E500;
  v5 = sub_100012B14((_QWORD *)(v0 + 56));
  sub_100012B50(v1, (uint64_t)v5);
  v6 = unk_1000422C4;
  v10 = (char *)&dword_1000422C0 + dword_1000422C0;
  v7 = v4;
  swift_retain(v3);
  v8 = (_QWORD *)swift_task_alloc(v6);
  *(_QWORD *)(v0 + 120) = v8;
  *v8 = v0;
  v8[1] = sub_100012A1C;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v10)(v0 + 16, v0 + 56, *(_QWORD *)(v0 + 96), *(unsigned __int16 *)(v0 + 144), *(unsigned __int16 *)(v0 + 146));
}

uint64_t sub_100012A1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 120);
  *(_QWORD *)(*v2 + 128) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100012AD4;
  }
  else
  {
    *(_QWORD *)(v4 + 136) = a1;
    v6 = sub_100012A90;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100012A90()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  sub_100012B94(v1);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 136));
}

uint64_t sub_100012AD4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  sub_100012B94(v1);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_100012B14(_QWORD *a1)
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

uint64_t sub_100012B50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IDSLookupController(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012B94(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IDSLookupController(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100012BD0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100009B48(a2);
    result = swift_getWitnessTable(&unk_100030510, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100012C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IDSLookupController(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100012C54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 8);
}

uint64_t *sub_100012C5C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v3 = swift_retain(v3);
  *a1 = v3;
  return a1;
}

unint64_t sub_100012C94(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_release(result);
  return result;
}

unint64_t *sub_100012CAC(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF)
      swift_retain(v4);
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_release(v3);
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_retain(v4);
    swift_release(v3);
  }
  return a1;
}

_QWORD *initializeWithTake for IDSLookupController.Error(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *sub_100012D48(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {
    swift_release(v3);
LABEL_6:
    *a1 = v4;
    return a1;
  }
  *a1 = v4;
  swift_release(v3);
  return a1;
}

uint64_t sub_100012DA8(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFFA && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483643);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 4;
  if (v4 >= 6)
    return v5;
  else
    return 0;
}

uint64_t sub_100012E00(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483643;
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFB)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 4;
  }
  return result;
}

uint64_t sub_100012E50(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_100012E68(_QWORD *result, int a2)
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

uint64_t type metadata accessor for PrivledgedRecipientGroup.Error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100012E94(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PrivledgedRecipientGroup.Error);
}

uint64_t sub_100012E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

unint64_t sub_100012EC8()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000041;
  else
    return 0xD00000000000002DLL;
}

uint64_t sub_100012F08(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 32) = a2;
  *(_QWORD *)(v2 + 24) = a1;
  return swift_task_switch(sub_100012F70, 0, 0);
}

uint64_t sub_100012F70()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 *v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  unsigned __int8 *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSString v58;
  void **v59;
  void *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t (*v74)(void);
  uint64_t v75;
  unsigned __int8 *v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 *v80;
  unsigned int v81;
  uint64_t v82;
  char v83;
  char v84;
  void *v85;
  uint64_t v86;
  id v87;
  NSObject *v88;
  os_log_type_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  _BYTE *v95;
  _QWORD *v97;
  uint64_t v98;
  _QWORD *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  id v104;
  uint64_t v105[2];

  if (qword_1000418C8 != -1)
    swift_once(&qword_1000418C8, sub_100025BCC);
  v1 = (uint64_t *)(v0 + 16);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_1000036A4(v2, (uint64_t)qword_100043EF8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_BYTE *)(v0 + 32);
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(64, -1);
    v105[0] = v8;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v0 + 16) = sub_100027030(0xD00000000000001BLL, 0x8000000100031D40, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
    *(_WORD *)(v7 + 12) = 2080;
    sub_100026BA8(v6);
    v10 = v9;
    *(_QWORD *)(v0 + 16) = sub_100027030(v11, v9, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 14, v7 + 22);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s called for client %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }

  v12 = (id *)(v0 + 24);
  v13 = ATPayload.response.getter();
  if (!v13)
  {
    v29 = Logger.logObject.getter(*v12);
    v30 = static os_log_type_t.fault.getter();
    v31 = os_log_type_enabled(v29, v30);
    v32 = *v12;
    if (v31)
    {
      v33 = swift_slowAlloc(22, -1);
      v34 = (_QWORD *)swift_slowAlloc(8, -1);
      v104 = (id)swift_slowAlloc(32, -1);
      v105[0] = (uint64_t)v104;
      *(_DWORD *)v33 = 136315394;
      *v1 = sub_100027030(0xD00000000000001BLL, 0x8000000100031D40, v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v33 + 4, v33 + 12);
      *(_WORD *)(v33 + 12) = 2112;
      *v1 = (uint64_t)v32;
      v35 = v32;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v33 + 14, v33 + 22);
      *v34 = v32;

      _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s The AskTo payload doesn't have a response attached: %@", (uint8_t *)v33, 0x16u);
      v36 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v34, 1, v36);
      swift_slowDealloc(v34, -1, -1);
      swift_arrayDestroy(v104, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v104, -1, -1);
      swift_slowDealloc(v33, -1, -1);
    }
    else
    {

    }
    v37 = sub_100013B5C();
    v38 = swift_allocError(&type metadata for ScreenTimeResponseTask.Error, v37, 0, 0);
    *v39 = 0;
    swift_willThrow(v38);
    goto LABEL_73;
  }
  v14 = (void *)v13;
  v15 = (uint64_t *)(v0 + 16);
  v16 = ATPayload.clientBundleIdentifier.getter(v13);
  v18 = v17;
  v19 = (void *)ATPayload.question.getter(v16);
  v20 = (void *)ATQuestion.topic.getter();

  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v16, v18, v20, 600);
  swift_bridgeObjectRelease(v18);
  v103 = objc_msgSend(objc_allocWithZone((Class)STAskClient), "init");
  v21 = (void *)ATResponse.chosenAnswer.getter();
  v22 = ATAnswerChoice.id.getter();
  v24 = v23;

  v25 = HIBYTE(v24) & 0xF;
  v26 = v22 & 0xFFFFFFFFFFFFLL;
  if ((v24 & 0x2000000000000000) != 0)
    v27 = HIBYTE(v24) & 0xF;
  else
    v27 = v22 & 0xFFFFFFFFFFFFLL;
  if (!v27)
  {
    v102 = v0;
    swift_bridgeObjectRelease(v24);
    goto LABEL_68;
  }
  if ((v24 & 0x1000000000000000) == 0)
  {
    if ((v24 & 0x2000000000000000) == 0)
    {
      if ((v22 & 0x1000000000000000) != 0)
        v28 = (unsigned __int8 *)((v24 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v28 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v22, v24);
      v40 = (uint64_t)sub_10001DBEC(v28, v26, 10);
      v102 = v0;
      v42 = v41 & 1;
LABEL_43:
      v47 = swift_bridgeObjectRelease(v24);
      if ((v42 & 1) == 0)
        goto LABEL_44;
LABEL_68:
      v85 = v14;
      v86 = v0 + 24;
      v87 = v85;
      v88 = Logger.logObject.getter(v87);
      v89 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v88, v89))
      {
        v90 = swift_slowAlloc(22, -1);
        v99 = (_QWORD *)swift_slowAlloc(8, -1);
        v101 = swift_slowAlloc(32, -1);
        v105[0] = v101;
        *(_DWORD *)v90 = 136315394;
        *v15 = sub_100027030(0xD00000000000001BLL, 0x8000000100031D40, v105);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v15, v86, v90 + 4, v90 + 12);
        *(_WORD *)(v90 + 12) = 2112;
        *v15 = (uint64_t)v87;
        v91 = v87;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v15, v86, v90 + 14, v90 + 22);
        *v99 = v85;

        _os_log_impl((void *)&_mh_execute_header, v88, v89, "%s Unable to derive STAskForTimeAnswer from AskTo response. response: %@", (uint8_t *)v90, 0x16u);
        v92 = sub_100005FF0(&qword_100042650);
        swift_arrayDestroy(v99, 1, v92);
        swift_slowDealloc(v99, -1, -1);
        swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v101, -1, -1);
        swift_slowDealloc(v90, -1, -1);
      }
      else
      {

      }
      v93 = sub_100013B5C();
      v94 = swift_allocError(&type metadata for ScreenTimeResponseTask.Error, v93, 0, 0);
      *v95 = 1;
      swift_willThrow(v94);

      goto LABEL_72;
    }
    v105[0] = v22;
    v105[1] = v24 & 0xFFFFFFFFFFFFFFLL;
    v102 = v0;
    if (v22 == 43)
    {
      if (!v25)
        goto LABEL_77;
      if (v25 != 1 && (BYTE1(v22) - 48) <= 9u)
      {
        v40 = (BYTE1(v22) - 48);
        if (v25 == 2)
          goto LABEL_42;
        if ((BYTE2(v22) - 48) <= 9u)
        {
          v40 = 10 * (BYTE1(v22) - 48) + (BYTE2(v22) - 48);
          v43 = v25 - 3;
          if (v43)
          {
            v44 = (unsigned __int8 *)v105 + 3;
            while (1)
            {
              v45 = *v44 - 48;
              if (v45 > 9)
                goto LABEL_40;
              v46 = 10 * v40;
              if ((unsigned __int128)(v40 * (__int128)10) >> 64 != (10 * v40) >> 63)
                goto LABEL_40;
              v40 = v46 + v45;
              if (__OFADD__(v46, v45))
                goto LABEL_40;
              v42 = 0;
              ++v44;
              if (!--v43)
                goto LABEL_43;
            }
          }
          goto LABEL_42;
        }
      }
    }
    else
    {
      if (v22 == 45)
      {
        if (v25)
        {
          if (v25 == 1 || (BYTE1(v22) - 48) > 9u)
            goto LABEL_40;
          if (v25 == 2)
          {
            v42 = 0;
            v40 = -(uint64_t)(BYTE1(v22) - 48);
            goto LABEL_43;
          }
          if ((BYTE2(v22) - 48) > 9u)
            goto LABEL_40;
          v40 = -10 * (BYTE1(v22) - 48) - (BYTE2(v22) - 48);
          v79 = v25 - 3;
          if (v79)
          {
            v80 = (unsigned __int8 *)v105 + 3;
            while (1)
            {
              v81 = *v80 - 48;
              if (v81 > 9)
                goto LABEL_40;
              v82 = 10 * v40;
              if ((unsigned __int128)(v40 * (__int128)10) >> 64 != (10 * v40) >> 63)
                goto LABEL_40;
              v40 = v82 - v81;
              if (__OFSUB__(v82, v81))
                goto LABEL_40;
              v42 = 0;
              ++v80;
              if (!--v79)
                goto LABEL_43;
            }
          }
LABEL_42:
          v42 = 0;
          goto LABEL_43;
        }
        __break(1u);
LABEL_77:
        __break(1u);
      }
      if (v25 && (v22 - 48) <= 9u)
      {
        v40 = (v22 - 48);
        if (v25 == 1)
          goto LABEL_42;
        if ((BYTE1(v22) - 48) <= 9u)
        {
          v40 = 10 * (v22 - 48) + (BYTE1(v22) - 48);
          v75 = v25 - 2;
          if (v75)
          {
            v76 = (unsigned __int8 *)v105 + 2;
            while (1)
            {
              v77 = *v76 - 48;
              if (v77 > 9)
                goto LABEL_40;
              v78 = 10 * v40;
              if ((unsigned __int128)(v40 * (__int128)10) >> 64 != (10 * v40) >> 63)
                goto LABEL_40;
              v40 = v78 + v77;
              if (__OFADD__(v78, v77))
                goto LABEL_40;
              v42 = 0;
              ++v76;
              if (!--v75)
                goto LABEL_43;
            }
          }
          goto LABEL_42;
        }
      }
    }
LABEL_40:
    v40 = 0;
    v42 = 1;
    goto LABEL_43;
  }
  v102 = v0;
  v40 = (uint64_t)sub_10001DC00(v22, v24, 10);
  v84 = v83;
  v47 = swift_bridgeObjectRelease(v24);
  if ((v84 & 1) != 0)
    goto LABEL_68;
LABEL_44:
  v48 = v0 + 24;
  v49 = ATPayload.clientBundleIdentifier.getter(v47);
  v51 = v50;
  v52 = (void *)ATPayload.question.getter(v49);
  v53 = (void *)ATQuestion.topic.getter();

  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v49, v51, v53, 700);
  v54 = swift_bridgeObjectRelease(v51);
  v55 = (void *)ATResponse.originalQuestion.getter(v54);
  ATQuestion.id.getter();
  v57 = v56;

  v58 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v57);
  v59 = (void **)(v0 + 16);
  *v15 = 0;
  LODWORD(v49) = objc_msgSend(v103, "respondToAskForTimeRequestWithIdentifier:answer:error:", v58, v40, v59);

  v60 = *v59;
  if (!(_DWORD)v49)
  {
    v66 = v60;
    _convertNSErrorToError(_:)(v60);

    swift_willThrow(v67);
LABEL_72:
    v0 = v102;
LABEL_73:
    v74 = *(uint64_t (**)(void))(v0 + 8);
    return v74();
  }
  v100 = v14;
  v61 = Logger.logObject.getter(v60);
  v62 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = swift_slowAlloc(22, -1);
    v97 = (_QWORD *)swift_slowAlloc(8, -1);
    v98 = swift_slowAlloc(32, -1);
    v105[0] = v98;
    *(_DWORD *)v63 = 136315394;
    *v59 = (void *)sub_100027030(0xD00000000000001BLL, 0x8000000100031D40, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v59, v48, v63 + 4, v63 + 12);
    *(_WORD *)(v63 + 12) = 2112;
    *v59 = v100;
    v64 = v100;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v59, v48, v63 + 14, v63 + 22);
    *v97 = v14;

    _os_log_impl((void *)&_mh_execute_header, v61, v62, "%s Updated ScreenTime with response. response: %@", (uint8_t *)v63, 0x16u);
    v65 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v97, 1, v65);
    swift_slowDealloc(v97, -1, -1);
    swift_arrayDestroy(v98, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v98, -1, -1);
    swift_slowDealloc(v63, -1, -1);
  }
  else
  {

  }
  v69 = ATPayload.clientBundleIdentifier.getter(v68);
  v71 = v70;
  v72 = (void *)ATPayload.question.getter(v69);
  v73 = (void *)ATQuestion.topic.getter();

  static Metrics.ResponseJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v69, v71, v73, 800);
  swift_bridgeObjectRelease(v71);
  v74 = *(uint64_t (**)(void))(v102 + 8);
  return v74();
}

unint64_t sub_100013B5C()
{
  unint64_t result;

  result = qword_100042360;
  if (!qword_100042360)
  {
    result = swift_getWitnessTable(&unk_100030650, &type metadata for ScreenTimeResponseTask.Error);
    atomic_store(result, (unint64_t *)&qword_100042360);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Client.Known(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ScreenTimeResponseTask(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100013C7C + 4 * byte_100030555[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100013CB0 + 4 * byte_100030550[v4]))();
}

uint64_t sub_100013CB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013CB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013CC0);
  return result;
}

uint64_t sub_100013CCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100013CD4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100013CD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013CE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeResponseTask()
{
  return &type metadata for ScreenTimeResponseTask;
}

uint64_t storeEnumTagSinglePayload for ScreenTimeResponseTask.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100013D48 + 4 * byte_10003055F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100013D7C + 4 * byte_10003055A[v4]))();
}

uint64_t sub_100013D7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013D84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013D8CLL);
  return result;
}

uint64_t sub_100013D98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100013DA0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100013DA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013DAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeResponseTask.Error()
{
  return &type metadata for ScreenTimeResponseTask.Error;
}

unint64_t sub_100013DD0()
{
  unint64_t result;

  result = qword_100042368;
  if (!qword_100042368)
  {
    result = swift_getWitnessTable(&unk_100030618, &type metadata for ScreenTimeResponseTask.Error);
    atomic_store(result, (unint64_t *)&qword_100042368);
  }
  return result;
}

void sub_100013E14(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (qword_100041910 != -1)
    swift_once(&qword_100041910, sub_100025D44);
  v8 = type metadata accessor for Logger(0);
  sub_1000036A4(v8, (uint64_t)qword_100043FD0);
  v9 = swift_bridgeObjectRetain_n(a2, 2);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v30 = a3;
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 138412290;
    if (a2)
    {
      v14 = sub_100014624();
      v15 = swift_allocError(&type metadata for String, v14, 0, 0);
      *v16 = a1;
      v16[1] = a2;
      swift_bridgeObjectRetain(a2);
      v17 = _swift_stdlib_bridgeErrorToNSError(v15);
      v33 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v12 + 4, v12 + 12);
    }
    else
    {
      v33 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v12 + 4, v12 + 12);
      v17 = 0;
    }
    *v13 = v17;
    swift_bridgeObjectRelease_n(a2, 2);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "sentMessageGUID is %@", v12, 0xCu);
    v18 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v13, 1, v18);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    a3 = v30;
    if (!a2)
      goto LABEL_13;
  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
    if (!a2)
    {
LABEL_13:
      swift_bridgeObjectRetain_n(a2, 2);
      v19 = swift_bridgeObjectRetain_n(a4, 2);
      v20 = Logger.logObject.getter(v19);
      v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v31 = a3;
        v22 = swift_slowAlloc(22, -1);
        v23 = (uint64_t *)swift_slowAlloc(8, -1);
        v24 = swift_slowAlloc(32, -1);
        v33 = v24;
        *(_DWORD *)v22 = 138412546;
        if (a2)
        {
          v25 = sub_100014624();
          v26 = swift_allocError(&type metadata for String, v25, 0, 0);
          *v27 = a1;
          v27[1] = a2;
          swift_bridgeObjectRetain(a2);
          v28 = _swift_stdlib_bridgeErrorToNSError(v26);
          v32 = v28;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v22 + 4, v22 + 12);
        }
        else
        {
          v32 = 0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v22 + 4, v22 + 12);
          v28 = 0;
        }
        *v23 = v28;
        swift_bridgeObjectRelease_n(a2, 2);
        *(_WORD *)(v22 + 12) = 2080;
        swift_bridgeObjectRetain(a4);
        v32 = sub_100027030(v31, a4, &v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v22 + 14, v22 + 22);
        swift_bridgeObjectRelease_n(a4, 3);
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "sentMessageGUID %@ does not equal payload messageGUID %s", (uint8_t *)v22, 0x16u);
        v29 = sub_100005FF0(&qword_100042650);
        swift_arrayDestroy(v23, 1, v29);
        swift_slowDealloc(v23, -1, -1);
        swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v24, -1, -1);
        swift_slowDealloc(v22, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a4, 2);
        swift_bridgeObjectRelease_n(a2, 2);
      }
      return;
    }
  }
  if ((a1 != a3 || a4 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0) & 1) == 0)
    goto LABEL_13;
}

uint64_t sub_100014270(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  swift_retain(v2);
  v3(v4, v6);
  swift_release(v2);
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_1000142D4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  Class isa;
  Class v18;
  NSString v19;
  NSString v20;
  NSString v21;
  Class v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t aBlock[5];
  uint64_t v30;

  if (qword_100041910 != -1)
    swift_once(&qword_100041910, sub_100025D44);
  v11 = type metadata accessor for Logger(0);
  v12 = sub_1000036A4(v11, (uint64_t)qword_100043FD0);
  v13 = Logger.logObject.getter(v12);
  v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc(12, -1);
    v16 = swift_slowAlloc(32, -1);
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v28 = sub_100027030(0xD000000000000077, 0x8000000100031E00, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, aBlock, v15 + 4, v15 + 12);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s called", v15, 0xCu);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);
  }

  if (a2 >> 60 == 15)
    isa = 0;
  else
    isa = Data._bridgeToObjectiveC()().super.isa;
  v18 = Array._bridgeToObjectiveC()().super.isa;
  v19 = String._bridgeToObjectiveC()();
  v20 = String._bridgeToObjectiveC()();
  v21 = String._bridgeToObjectiveC()();
  v22 = Array._bridgeToObjectiveC()().super.isa;
  v23 = swift_allocObject(&unk_10003DC28, 32, 7);
  *(_QWORD *)(v23 + 16) = a8;
  *(_QWORD *)(v23 + 24) = a9;
  aBlock[4] = (uint64_t)sub_100014604;
  v30 = v23;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100014270;
  aBlock[3] = (uint64_t)&unk_10003DC40;
  v24 = _Block_copy(aBlock);
  v25 = v30;
  swift_bridgeObjectRetain(a9);
  swift_release(v25);
  v26 = IMSPISendMSMessagePayloadReturningGUID(isa, v18, v19, v20, v21, v22, v24);
  _Block_release(v24);

  return v26;
}

uint64_t sub_1000145E0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100014604(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100013E14(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_10001460C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001461C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100014624()
{
  unint64_t result;

  result = qword_100042370;
  if (!qword_100042370)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100042370);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesSPI()
{
  return &type metadata for MessagesSPI;
}

uint64_t sub_100014678(uint64_t a1)
{
  _QWORD v2[4];

  v2[0] = (char *)&value witness table for () + 64;
  v2[1] = &unk_100030748;
  v2[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[3] = &unk_100030760;
  return swift_initClassMetadata2(a1, 0, 4, v2, a1 + 88);
}

uint64_t sub_1000146DC()
{
  uint64_t v0;

  sub_100014734(v0 + 16);

  return v0;
}

uint64_t sub_100014708()
{
  uint64_t v0;

  sub_1000146DC();
  return swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for BiomeStreamListener(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100012E94(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BiomeStreamListener);
}

uint64_t sub_100014734(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_100014758(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xD000000000000010;
  v3 = 0x80000001000311B0;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD00000000000002FLL;
    else
      v5 = 0xD000000000000025;
    if (v4 == 1)
      v6 = 0x80000001000311D0;
    else
      v6 = 0x8000000100031200;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0xD000000000000010;
  v6 = 0x80000001000311B0;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v2 = 0xD00000000000002FLL;
    else
      v2 = 0xD000000000000025;
    if (v7 == 1)
      v3 = 0x80000001000311D0;
    else
      v3 = 0x8000000100031200;
  }
LABEL_15:
  if (v5 == v2 && v6 == v3)
  {
    v8 = 1;
    v3 = v6;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v3);
  return v8 & 1;
}

uint64_t sub_100014854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  _BYTE v12[8];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  ValueMetadata *v17;
  char **v18;
  _QWORD v19[5];

  v6 = type metadata accessor for IDSLookupController(0);
  __chkstk_darwin(v6);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000216F4((uint64_t)v8);
  v19[3] = v6;
  v19[4] = &off_10003E500;
  v9 = sub_100012B14(v19);
  sub_100012B50((uint64_t)v8, (uint64_t)v9);
  v17 = &type metadata for MessagesSPI;
  v18 = &off_10003DC88;
  v13 = 0;
  v10 = swift_unknownObjectWeakInit(v12, 0);
  v13 = a2;
  swift_unknownObjectWeakAssign(v10, a1);
  swift_unknownObjectRelease(a1);
  sub_100016D18((uint64_t)v19, (uint64_t)&v14, &qword_100042400);
  sub_10000F2DC(&v16, (uint64_t)&v15);
  sub_10000EE84((uint64_t)v12, a3);
  return sub_100012B94((uint64_t)v8);
}

void sub_100014960(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_10001499C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;
  Swift::String v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[8];

  v7[0] = 0;
  v7[1] = 0xE000000000000000;
  swift_errorRetain(v0);
  _StringGuts.grow(_:)(71);
  v3._countAndFlagsBits = 0xD000000000000045;
  v3._object = (void *)0x8000000100031F90;
  String.append(_:)(v3);
  v6 = v0;
  v4 = sub_100005FF0(&qword_100041C88);
  ((void (*)(uint64_t *, _QWORD *, uint64_t, void *, void *))_print_unlocked<A, B>(_:_:))(&v6, v7, v4, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  sub_100016E5C(v0, v1, v2);
  return v7[0];
}

void sub_100014BE8()
{
  uint64_t v0;

  sub_100014960(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_100014BF4(uint64_t a1)
{
  sub_100016ACC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_100014C10(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 320) = a4;
  *(_QWORD *)(v5 + 328) = v4;
  *(_BYTE *)(v5 + 424) = a3;
  *(_QWORD *)(v5 + 304) = a1;
  *(_QWORD *)(v5 + 312) = a2;
  return swift_task_switch(sub_100014C30, 0, 0);
}

uint64_t sub_100014C30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t Strong;
  uint64_t v10;
  __int128 *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t *v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t (*v99)(void);
  unint64_t v100;
  uint64_t v101;
  NSObject *log;
  uint64_t v103[2];

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v0 + 336) = v2;
  if (!*(_QWORD *)(v2 + 16))
  {
    if (qword_1000418E0 != -1)
    {
      swift_once(&qword_1000418E0, sub_100025C70);
      v1 = *(_QWORD *)(v0 + 312);
    }
    v26 = type metadata accessor for Logger(0);
    sub_1000036A4(v26, (uint64_t)qword_100043F40);
    v27 = swift_retain_n(v1, 2);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.error.getter();
    v30 = os_log_type_enabled(v28, v29);
    v31 = *(_QWORD *)(v0 + 312);
    if (v30)
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = swift_slowAlloc(32, -1);
      v103[0] = v33;
      *(_DWORD *)v32 = 136315138;
      v34 = ATRecipientGroup.debugDescription.getter(*(unsigned __int16 *)(v31 + 26));
      v36 = v35;
      *(_QWORD *)(v0 + 272) = sub_100027030(v34, v35, v103);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 272, v0 + 280, v32 + 4, v32 + 12);
      swift_bridgeObjectRelease(v36);
      swift_release_n(v31, 2);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "There were no ids handles in the privledged recipient group derived from  \"%s\"", v32, 0xCu);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);
    }
    else
    {
      swift_release_n(*(_QWORD *)(v0 + 312), 2);
    }

    v46 = *(unsigned __int16 *)(*(_QWORD *)(v0 + 312) + 26);
    v47 = sub_100016CD4();
    v48 = swift_allocError(&type metadata for iMessageSender.Error, v47, 0, 0);
    *(_QWORD *)v49 = v46;
    *(_QWORD *)(v49 + 8) = 0;
    v50 = 64;
    goto LABEL_48;
  }
  v3 = (_DWORD *)(v0 + 420);
  v4 = *(unsigned __int8 *)(v0 + 424);
  v5 = *(_QWORD **)(v0 + 304);
  v6 = v5[7];
  *(_QWORD *)(v0 + 344) = v6;
  v7 = v5[8];
  *(_QWORD *)(v0 + 352) = v7;
  v8 = v5[9];
  *(_QWORD *)(v0 + 360) = v8;
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(v6, v7, v8, 1600);
  if (v4 == 1)
  {
    Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 328));
    *(_QWORD *)(v0 + 368) = Strong;
    if (Strong)
    {
      v10 = Strong;
      if ((sub_100019540(0xD00000000000002FLL, 0x80000001000311D0) & 1) != 0)
      {
        v11 = (__int128 *)(v0 + 56);
        if (qword_1000418E0 != -1)
          swift_once(&qword_1000418E0, sub_100025C70);
        v12 = *(uint64_t **)(v0 + 304);
        v13 = type metadata accessor for Logger(0);
        *(_QWORD *)(v0 + 376) = sub_1000036A4(v13, (uint64_t)qword_100043F40);
        sub_10000F4F8(v12);
        v14 = sub_10000F4F8(v12);
        v15 = Logger.logObject.getter(v14);
        v16 = static os_log_type_t.default.getter();
        v17 = os_log_type_enabled(v15, v16);
        v18 = *(uint64_t **)(v0 + 304);
        if (v17)
        {
          log = v15;
          v19 = (uint8_t *)swift_slowAlloc(12, -1);
          v101 = swift_slowAlloc(32, -1);
          v103[0] = v101;
          *(_DWORD *)v19 = 136315138;
          v20 = v18[6];
          v21 = swift_bridgeObjectRetain(v20);
          v22 = Set.description.getter(v21, &type metadata for String, &protocol witness table for String);
          v24 = v23;
          swift_bridgeObjectRelease(v20);
          *(_QWORD *)(v0 + 288) = sub_100027030(v22, v24, v103);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 288, v0 + 296, v19 + 4, v19 + 12);
          v25 = v24;
          v11 = (__int128 *)(v0 + 56);
          swift_bridgeObjectRelease(v25);
          sub_10000F564(v18);
          sub_10000F564(v18);
          v15 = log;
          _os_log_impl((void *)&_mh_execute_header, log, v16, "Looking for IDS endpoints that don't support the following reg caps: %s", v19, 0xCu);
          swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v101, -1, -1);
          swift_slowDealloc(v19, -1, -1);
        }
        else
        {
          sub_10000F564(*(uint64_t **)(v0 + 304));
          sub_10000F564(v18);
        }

        sub_100016D98(*(_QWORD *)(v0 + 328) + 16, (uint64_t)v11);
        if (*(_QWORD *)(v0 + 80))
        {
          v71 = *(_QWORD *)(v0 + 304);
          sub_10000F2DC(v11, v0 + 16);
          sub_100003680((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
          v72 = *(_QWORD *)(v71 + 48);
          *(_QWORD *)(v0 + 384) = v72;
          v73 = (_QWORD *)swift_task_alloc(dword_100042644);
          *(_QWORD *)(v0 + 392) = v73;
          *v73 = v0;
          v73[1] = sub_1000158D4;
          return sub_100023378(v72, v2);
        }
        v81 = sub_100016DE0((uint64_t)v11);
        v82 = Logger.logObject.getter(v81);
        v83 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v82, v83))
        {
          v84 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v84 = 0;
          _os_log_impl((void *)&_mh_execute_header, v82, v83, "Needed to lookup unsupported destinations, but idsLookupController was nil.", v84, 2u);
          swift_slowDealloc(v84, -1, -1);
        }

        v85 = sub_100016CD4();
        v70 = swift_allocError(&type metadata for iMessageSender.Error, v85, 0, 0);
        *(_QWORD *)v79 = 0;
        *(_QWORD *)(v79 + 8) = 0;
        v80 = -64;
      }
      else
      {
        if (qword_1000418E0 != -1)
          swift_once(&qword_1000418E0, sub_100025C70);
        v60 = type metadata accessor for Logger(0);
        v61 = sub_1000036A4(v60, (uint64_t)qword_100043F40);
        v62 = Logger.logObject.getter(v61);
        v63 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v62, v63))
        {
          v64 = (uint8_t *)swift_slowAlloc(12, -1);
          v65 = swift_slowAlloc(32, -1);
          v103[0] = v65;
          *(_DWORD *)v64 = 136315138;
          *(_QWORD *)(v0 + 224) = sub_100027030(0xD00000000000002FLL, 0x80000001000311D0, v103);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v0 + 232, v64 + 4, v64 + 12);
          _os_log_impl((void *)&_mh_execute_header, v62, v63, "Missing entitlement %s. Ignoring IDS destinations that don't support.", v64, 0xCu);
          swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v65, -1, -1);
          swift_slowDealloc(v64, -1, -1);
        }

        v66 = *(_QWORD *)(v10 + 64);
        if (v66)
        {
          v67 = *(_QWORD *)(v10 + 56);
          v68 = sub_100016CD4();
          swift_allocError(&type metadata for iMessageSender.Error, v68, 0, 0);
          *(_QWORD *)v69 = v67;
          *(_QWORD *)(v69 + 8) = v66;
          *(_BYTE *)(v69 + 16) = -127;
          v70 = swift_bridgeObjectRetain(v66);
LABEL_41:
          swift_willThrow(v70);
          swift_unknownObjectRelease(v10);
LABEL_49:
          v99 = *(uint64_t (**)(void))(v0 + 8);
          return v99();
        }
        *v3 = objc_msgSend(*(id *)(v10 + 32), "processIdentifier");
        v75 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
        v77 = v76;
        v78 = sub_100016CD4();
        v70 = swift_allocError(&type metadata for iMessageSender.Error, v78, 0, 0);
        *(_QWORD *)v79 = v75;
        *(_QWORD *)(v79 + 8) = v77;
        v80 = -127;
      }
      *(_BYTE *)(v79 + 16) = v80;
      goto LABEL_41;
    }
    if (qword_1000418E0 != -1)
      swift_once(&qword_1000418E0, sub_100025C70);
    v52 = type metadata accessor for Logger(0);
    v53 = sub_1000036A4(v52, (uint64_t)qword_100043F40);
    v54 = Logger.logObject.getter(v53);
    v55 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc(12, -1);
      v57 = swift_slowAlloc(32, -1);
      v103[0] = v57;
      *(_DWORD *)v56 = 136315138;
      *(_QWORD *)(v0 + 240) = sub_100027030(0xD00000000000002FLL, 0x80000001000311D0, v103);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 240, v0 + 248, v56 + 4, v56 + 12);
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "Unable to to check for %s entitlement because caller is nil. Bailing from send.", v56, 0xCu);
      swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v57, -1, -1);
      swift_slowDealloc(v56, -1, -1);
    }

    v58 = sub_100016CD4();
    v48 = swift_allocError(&type metadata for iMessageSender.Error, v58, 0, 0);
    v59 = xmmword_1000308D0;
    goto LABEL_47;
  }
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 360), 1700);
  if (qword_1000418E0 != -1)
    swift_once(&qword_1000418E0, sub_100025C70);
  v38 = *(uint64_t **)(v0 + 304);
  v37 = *(_QWORD *)(v0 + 312);
  v39 = type metadata accessor for Logger(0);
  sub_1000036A4(v39, (uint64_t)qword_100043F40);
  swift_retain(v37);
  sub_10000F4F8(v38);
  v40 = swift_retain(v37);
  v41 = Logger.logObject.getter(v40);
  v42 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = *(_QWORD *)(v0 + 304);
    v44 = swift_slowAlloc(22, -1);
    v45 = swift_slowAlloc(32, -1);
    v103[0] = v45;
    *(_DWORD *)v44 = 134218242;
    sub_100016D18(v43, v0 + 208, &qword_100042418);
    sub_100016D18(v0 + 208, v0 + 160, &qword_100042418);
    if (*(_QWORD *)(v0 + 168) >> 60 != 15)
    {
      *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 160);
      sub_100016D5C(v0 + 176, v0 + 192);
      sub_100016D5C(v0 + 192, v0 + 144);
      __asm { BR              X12 }
    }
    v86 = *(_QWORD *)(v0 + 336);
    v88 = *(uint64_t **)(v0 + 304);
    v87 = *(_QWORD *)(v0 + 312);
    *(_QWORD *)(v0 + 280) = 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 280, v0 + 288, v44 + 4, v44 + 12);
    sub_10000F564(v88);
    *(_WORD *)(v44 + 12) = 2080;
    v89 = swift_bridgeObjectRetain(v86);
    v90 = Array.description.getter(v89, &type metadata for String);
    v92 = v91;
    swift_bridgeObjectRelease(v86);
    *(_QWORD *)(v0 + 248) = sub_100027030(v90, v92, v103);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 248, v0 + 256, v44 + 14, v44 + 22);
    swift_bridgeObjectRelease(v92);
    swift_release_n(v87, 2);
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Sending message of %ld bytes to %s", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v45, -1, -1);
    swift_slowDealloc(v44, -1, -1);

    v3 = (_DWORD *)(v0 + 420);
  }
  else
  {
    v51 = *(_QWORD *)(v0 + 312);
    sub_10000F564(*(uint64_t **)(v0 + 304));
    swift_release_n(v51, 2);

  }
  v93 = *(_QWORD *)(v0 + 304);
  v94 = sub_1000142D4(*(_QWORD *)v93, *(_QWORD *)(v93 + 8), *(_QWORD *)(v0 + 336), *(_QWORD *)(v93 + 16), *(_QWORD *)(v93 + 24), 0, 0xE000000000000000, *(_QWORD *)(v93 + 32), *(_QWORD *)(v93 + 40));
  v95 = v94;
  v96 = Logger.logObject.getter(v94);
  v97 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v96, v97))
  {
    v98 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v98 = 67109120;
    *(_DWORD *)(v0 + 416) = v95 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 416, v3, v98 + 4, v98 + 8);
    _os_log_impl((void *)&_mh_execute_header, v96, v97, "Result of call to send message is %{BOOL}d", v98, 8u);
    swift_slowDealloc(v98, -1, -1);
  }

  if ((v95 & 1) == 0)
  {
    v100 = sub_100016CD4();
    v48 = swift_allocError(&type metadata for iMessageSender.Error, v100, 0, 0);
    v59 = xmmword_1000308C0;
LABEL_47:
    *(_OWORD *)v49 = v59;
    v50 = -64;
LABEL_48:
    *(_BYTE *)(v49 + 16) = v50;
    swift_willThrow(v48);
    goto LABEL_49;
  }
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 352), *(_QWORD *)(v0 + 360), 1800);
  v99 = *(uint64_t (**)(void))(v0 + 8);
  return v99();
}

uint64_t sub_1000158D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 392);
  *(_QWORD *)(v3 + 400) = a1;
  *(_QWORD *)(v3 + 408) = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v5 = sub_100016044;
  }
  else
  {
    swift_bridgeObjectRelease(**(_QWORD **)(v3 + 320));
    v5 = sub_10001594C;
  }
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10001594C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57[2];

  v0[29] = &_swiftEmptyArrayStorage;
  v1 = v0 + 29;
  v2 = v0[50];
  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0)
      v9 = v0[50];
    else
      v9 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v0[50]);
    v3 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v2);
    if (!v3)
      goto LABEL_13;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v3)
      goto LABEL_13;
  }
  if (v3 < 1)
  {
    __break(1u);
    JUMPOUT(0x10001602CLL);
  }
  v4 = 0;
  v5 = v2 & 0xC000000000000001;
  v55 = *(_QWORD *)(v56 + 400) + 32;
  do
  {
    if (v5)
    {
      v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, *(_QWORD *)(v56 + 400));
    }
    else
    {
      v6 = *(void **)(v55 + 8 * v4);
      swift_unknownObjectRetain(v6);
    }
    ++v4;
    v7 = objc_msgSend(v6, "destinationURIs");
    v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10001630C(v8);
    swift_unknownObjectRelease(v6);
  }
  while (v3 != v4);
LABEL_13:
  v10 = v0 + 2;
  v11 = v0 + 12;
  v12 = v56;
  v13 = swift_bridgeObjectRelease(*(_QWORD *)(v56 + 400));
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v52 = *(_QWORD *)(v56 + 368);
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v17 = swift_slowAlloc(32, -1);
    v57[0] = v17;
    *(_DWORD *)v16 = 136315138;
    swift_beginAccess(v1, v1 - 14, 0, 0);
    v18 = *(_QWORD *)(v56 + 232);
    v19 = swift_bridgeObjectRetain(v18);
    v20 = Array.description.getter(v19, &type metadata for String);
    v22 = v21;
    v23 = v18;
    v10 = v1 - 27;
    swift_bridgeObjectRelease(v23);
    v24 = v20;
    v11 = v1 - 17;
    *(_QWORD *)(v56 + 296) = sub_100027030(v24, v22, v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 8, v56 + 304, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease(v22);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "The following destinations don't support the required reg caps: %s", v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

    swift_unknownObjectRelease(v52);
  }
  else
  {
    swift_unknownObjectRelease(*(_QWORD *)(v56 + 368));

  }
  v25 = *(_QWORD **)(v56 + 320);
  swift_beginAccess(v1, v11, 0, 0);
  *v25 = *(_QWORD *)(v56 + 232);
  sub_10000EE64(v10);
  static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(*(_QWORD *)(v56 + 344), *(_QWORD *)(v56 + 352), *(_QWORD *)(v56 + 360), 1700);
  if (qword_1000418E0 != -1)
    swift_once(&qword_1000418E0, sub_100025C70);
  v27 = *(uint64_t **)(v56 + 304);
  v26 = *(_QWORD *)(v56 + 312);
  v28 = type metadata accessor for Logger(0);
  sub_1000036A4(v28, (uint64_t)qword_100043F40);
  swift_retain(v26);
  sub_10000F4F8(v27);
  v29 = swift_retain(v26);
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v54 = v31;
    v32 = *(_QWORD *)(v56 + 304);
    v33 = swift_slowAlloc(22, -1);
    v53 = swift_slowAlloc(32, -1);
    v57[0] = v53;
    *(_DWORD *)v33 = 134218242;
    sub_100016D18(v32, (uint64_t)(v1 - 3), &qword_100042418);
    sub_100016D18((uint64_t)(v1 - 3), (uint64_t)(v1 - 9), &qword_100042418);
    if (*(_QWORD *)(v56 + 168) >> 60 != 15)
    {
      *(_OWORD *)(v1 - 7) = *(_OWORD *)(v1 - 9);
      sub_100016D5C((uint64_t)(v1 - 7), (uint64_t)(v1 - 5));
      sub_100016D5C((uint64_t)(v1 - 5), (uint64_t)(v1 - 11));
      __asm { BR              X12 }
    }
    v35 = *(_QWORD *)(v56 + 336);
    v37 = *(uint64_t **)(v56 + 304);
    v36 = *(_QWORD *)(v56 + 312);
    *(_QWORD *)(v56 + 280) = 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 6, v56 + 288, v33 + 4, v33 + 12);
    sub_10000F564(v37);
    *(_WORD *)(v33 + 12) = 2080;
    v38 = swift_bridgeObjectRetain(v35);
    v39 = Array.description.getter(v38, &type metadata for String);
    v41 = v40;
    swift_bridgeObjectRelease(v35);
    *(_QWORD *)(v56 + 248) = sub_100027030(v39, v41, v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 2, v56 + 256, v33 + 14, v33 + 22);
    swift_bridgeObjectRelease(v41);
    swift_release_n(v36, 2);
    _os_log_impl((void *)&_mh_execute_header, v30, v54, "Sending message of %ld bytes to %s", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v53, -1, -1);
    swift_slowDealloc(v33, -1, -1);

  }
  else
  {
    v34 = *(_QWORD *)(v56 + 312);
    sub_10000F564(*(uint64_t **)(v56 + 304));
    swift_release_n(v34, 2);

  }
  v42 = *(_QWORD *)(v56 + 304);
  v43 = sub_1000142D4(*(_QWORD *)v42, *(_QWORD *)(v42 + 8), *(_QWORD *)(v56 + 336), *(_QWORD *)(v42 + 16), *(_QWORD *)(v42 + 24), 0, 0xE000000000000000, *(_QWORD *)(v42 + 32), *(_QWORD *)(v42 + 40));
  v44 = v43;
  v45 = Logger.logObject.getter(v43);
  v46 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v47 = 67109120;
    *(_DWORD *)(v56 + 416) = v44 & 1;
    v12 = v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 23, v56 + 420, v47 + 4, v47 + 8);
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "Result of call to send message is %{BOOL}d", v47, 8u);
    swift_slowDealloc(v47, -1, -1);
  }

  if ((v44 & 1) != 0)
  {
    static Metrics.RequestJourney.log(clientBundleIdentifier:questionTopic:checkpoint:)(*(_QWORD *)(v12 + 344), *(_QWORD *)(v12 + 352), *(_QWORD *)(v12 + 360), 1800);
  }
  else
  {
    v48 = sub_100016CD4();
    v49 = swift_allocError(&type metadata for iMessageSender.Error, v48, 0, 0);
    *(_OWORD *)v50 = xmmword_1000308C0;
    *(_BYTE *)(v50 + 16) = -64;
    swift_willThrow(v49);
  }
  return (*(uint64_t (**)(void))(v12 + 8))();
}

uint64_t sub_100016044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(_QWORD *)(v0 + 408);
  v2 = *(uint64_t **)(v0 + 304);
  sub_10000F4F8(v2);
  swift_errorRetain(v1);
  sub_10000F4F8(v2);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 408);
    v7 = *(_QWORD *)(v0 + 384);
    v8 = *(uint64_t **)(v0 + 304);
    v9 = swift_slowAlloc(22, -1);
    v24 = (uint64_t *)swift_slowAlloc(8, -1);
    v25 = swift_slowAlloc(32, -1);
    v26 = v25;
    *(_DWORD *)v9 = 136315394;
    v10 = swift_bridgeObjectRetain(v7);
    v11 = Set.description.getter(v10, &type metadata for String, &protocol witness table for String);
    v13 = v12;
    swift_bridgeObjectRelease(v7);
    *(_QWORD *)(v0 + 256) = sub_100027030(v11, v13, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 256, v0 + 264, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v13);
    sub_10000F564(v8);
    sub_10000F564(v8);
    *(_WORD *)(v9 + 12) = 2112;
    swift_errorRetain(v6);
    v14 = _swift_stdlib_bridgeErrorToNSError(v6);
    *(_QWORD *)(v0 + 264) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 264, v0 + 272, v9 + 14, v9 + 22);
    *v24 = v14;
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error looking up endpoints without required registration capabilities %s. error: %@", (uint8_t *)v9, 0x16u);
    v15 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v24, 1, v15);
    swift_slowDealloc(v24, -1, -1);
    swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 408);
    v17 = *(uint64_t **)(v0 + 304);
    sub_10000F564(v17);
    sub_10000F564(v17);
    swift_errorRelease(v16);
    swift_errorRelease(v16);
  }

  v18 = *(_QWORD *)(v0 + 408);
  v19 = *(_QWORD *)(v0 + 368);
  v20 = sub_100016CD4();
  swift_allocError(&type metadata for iMessageSender.Error, v20, 0, 0);
  *(_QWORD *)v21 = v18;
  *(_QWORD *)(v21 + 8) = 0;
  *(_BYTE *)(v21 + 16) = 0;
  v22 = swift_errorRetain(v18);
  swift_willThrow(v22);
  swift_unknownObjectRelease(v19);
  swift_errorRelease(v18);
  sub_10000EE64((_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001630C(uint64_t result)
{
  char **v1;
  int64_t v2;
  uint64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  uint64_t *v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  uint64_t v40;
  int64_t v41;
  unint64_t v42;

  v3 = *(_QWORD *)(result + 16);
  v4 = *v1;
  v5 = *((_QWORD *)*v1 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = *((_QWORD *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_10001D8D0(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v9 = *((_QWORD *)v4 + 3) >> 1;
  }
  v11 = *((_QWORD *)v4 + 2);
  v12 = v9 - v11;
  result = sub_1000166D4((uint64_t)v39, &v4[16 * v11 + 32], v9 - v11, v7);
  if (result < v3)
    goto LABEL_16;
  if (result)
  {
    v14 = *((_QWORD *)v4 + 2);
    v15 = __OFADD__(v14, result);
    v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_50;
    }
    *((_QWORD *)v4 + 2) = v16;
  }
  if (result != v12)
  {
    v17 = v39[0];
LABEL_14:
    result = sub_100016E20(v17);
    *v1 = v4;
    return result;
  }
LABEL_17:
  v2 = *((_QWORD *)v4 + 2);
  v3 = v39[0];
  v38 = v39[1];
  v13 = v40;
  v6 = v41;
  if (v42)
  {
    v18 = (v42 - 1) & v42;
    v19 = __clz(__rbit64(v42)) | (v41 << 6);
    v37 = (unint64_t)(v40 + 64) >> 6;
    goto LABEL_19;
  }
LABEL_50:
  v33 = v6 + 1;
  if (__OFADD__(v6, 1))
    goto LABEL_68;
  v37 = (unint64_t)(v13 + 64) >> 6;
  if (v33 >= v37)
  {
    v17 = v3;
    goto LABEL_14;
  }
  v34 = *(_QWORD *)(v38 + 8 * v33);
  v35 = v6 + 1;
  if (v34)
    goto LABEL_53;
  v35 = v6 + 2;
  if (v6 + 2 >= v37)
    goto LABEL_47;
  v34 = *(_QWORD *)(v38 + 8 * v35);
  if (!v34)
  {
    v35 = v6 + 3;
    if (v6 + 3 >= v37)
      goto LABEL_47;
    v34 = *(_QWORD *)(v38 + 8 * v35);
    if (!v34)
    {
      v35 = v6 + 4;
      if (v6 + 4 >= v37)
        goto LABEL_47;
      v34 = *(_QWORD *)(v38 + 8 * v35);
      if (!v34)
      {
        v35 = v6 + 5;
        if (v6 + 5 < v37)
        {
          v34 = *(_QWORD *)(v38 + 8 * v35);
          if (!v34)
          {
            v36 = v6 + 6;
            do
            {
              if (v37 == v36)
                goto LABEL_47;
              v34 = *(_QWORD *)(v38 + 8 * v36++);
            }
            while (!v34);
            v35 = v36 - 1;
          }
          goto LABEL_53;
        }
LABEL_47:
        v17 = v3;
        goto LABEL_14;
      }
    }
  }
LABEL_53:
  v18 = (v34 - 1) & v34;
  v19 = __clz(__rbit64(v34)) + (v35 << 6);
  v6 = v35;
LABEL_19:
  v20 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v19);
  v22 = *v20;
  v21 = v20[1];
  result = swift_bridgeObjectRetain(v21);
  while (1)
  {
    v23 = *((_QWORD *)v4 + 3);
    v24 = v23 >> 1;
    if ((uint64_t)(v23 >> 1) < v2 + 1)
      break;
    if (v2 < v24)
      goto LABEL_24;
LABEL_21:
    *((_QWORD *)v4 + 2) = v2;
  }
  result = (uint64_t)sub_10001D8D0((char *)(v23 > 1), v2 + 1, 1, v4);
  v4 = (char *)result;
  v24 = *(_QWORD *)(result + 24) >> 1;
  if (v2 >= v24)
    goto LABEL_21;
  while (1)
  {
LABEL_24:
    v25 = &v4[16 * v2 + 32];
    *(_QWORD *)v25 = v22;
    *((_QWORD *)v25 + 1) = v21;
    ++v2;
    if (v18)
    {
      v26 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v27 = v26 | (v6 << 6);
      goto LABEL_42;
    }
    v28 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v28 >= v37)
      goto LABEL_46;
    v29 = *(_QWORD *)(v38 + 8 * v28);
    v30 = v6 + 1;
    if (!v29)
    {
      v30 = v6 + 2;
      if (v6 + 2 >= v37)
        goto LABEL_46;
      v29 = *(_QWORD *)(v38 + 8 * v30);
      if (!v29)
      {
        v30 = v6 + 3;
        if (v6 + 3 >= v37)
          goto LABEL_46;
        v29 = *(_QWORD *)(v38 + 8 * v30);
        if (!v29)
        {
          v30 = v6 + 4;
          if (v6 + 4 >= v37)
            goto LABEL_46;
          v29 = *(_QWORD *)(v38 + 8 * v30);
          if (!v29)
          {
            v30 = v6 + 5;
            if (v6 + 5 >= v37)
              goto LABEL_46;
            v29 = *(_QWORD *)(v38 + 8 * v30);
            if (!v29)
            {
              v31 = v6 + 6;
              while (v37 != v31)
              {
                v29 = *(_QWORD *)(v38 + 8 * v31++);
                if (v29)
                {
                  v30 = v31 - 1;
                  goto LABEL_41;
                }
              }
LABEL_46:
              *((_QWORD *)v4 + 2) = v2;
              goto LABEL_47;
            }
          }
        }
      }
    }
LABEL_41:
    v18 = (v29 - 1) & v29;
    v27 = __clz(__rbit64(v29)) + (v30 << 6);
    v6 = v30;
LABEL_42:
    v32 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v27);
    v22 = *v32;
    v21 = v32[1];
    if (v2 >= v24)
    {
      result = swift_bridgeObjectRetain(v21);
      goto LABEL_21;
    }
    result = swift_bridgeObjectRetain(v21);
  }
  __break(1u);
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_1000166D4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain(v21);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000168D0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain(v21);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_100016ACC(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

BOOL sub_100016B04()
{
  unsigned int v0;

  return v0 < 0x40;
}

unint64_t sub_100016CD4()
{
  unint64_t result;

  result = qword_100042410;
  if (!qword_100042410)
  {
    result = swift_getWitnessTable(&unk_100030860, &type metadata for iMessageSender.Error);
    atomic_store(result, (unint64_t *)&qword_100042410);
  }
  return result;
}

uint64_t sub_100016D18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005FF0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100016D5C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for Data._Representation - 1) + 32))(a2, a1);
  return a2;
}

uint64_t sub_100016D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005FF0(&qword_100042400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016DE0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005FF0(&qword_100042400);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100016E20(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100016E2C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 >> 6 == 2)
    return swift_bridgeObjectRetain(a2);
  if (!(a3 >> 6))
    return swift_errorRetain();
  return result;
}

uint64_t destroy for iMessageSender.Error(uint64_t a1)
{
  return sub_100016E5C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_100016E5C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 >> 6 == 2)
    return swift_bridgeObjectRelease(a2);
  if (!(a3 >> 6))
    return swift_errorRelease(result);
  return result;
}

uint64_t _s6asktod14iMessageSenderV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100016E2C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for iMessageSender.Error(uint64_t a1, uint64_t a2)
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
  sub_100016E2C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100016E5C(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for iMessageSender.Error(uint64_t a1, uint64_t a2)
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
  sub_100016E5C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for iMessageSender.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x3D && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 61);
  v3 = (*(_BYTE *)(a1 + 16) & 0x3C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x3F;
  if (v3 >= 0x3C)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for iMessageSender.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3C)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 61;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x3D)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x3D)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 4 * (((-a2 >> 2) & 0xF) - 16 * a2);
    }
  }
  return result;
}

uint64_t sub_100017000(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 16) >> 6;
  if (v1 == 3)
    return (*(_DWORD *)a1 + 3);
  else
    return v1;
}

uint64_t sub_10001701C(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_10001702C(uint64_t result, unsigned int a2)
{
  if (a2 < 3)
  {
    *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 3 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = -64;
  }
  return result;
}

ValueMetadata *type metadata accessor for iMessageSender.Error()
{
  return &type metadata for iMessageSender.Error;
}

uint64_t destroy for iMessageSender(_QWORD *a1)
{
  swift_unknownObjectWeakDestroy();
  if (a1[5])
    sub_10000EE64(a1 + 2);
  return sub_10000EE64(a1 + 7);
}

uint64_t initializeWithCopy for iMessageSender(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  v4 = swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(a2 + 8);
  v5 = v4 + 16;
  v6 = (_OWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 40);
  if (v7)
  {
    v8 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v7;
    *(_QWORD *)(a1 + 48) = v8;
    (**(void (***)(uint64_t, _OWORD *))(v7 - 8))(v5, v6);
  }
  else
  {
    v9 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)v5 = *v6;
    *(_OWORD *)(v5 + 16) = v9;
    *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 48);
  }
  v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 56, a2 + 56);
  return a1;
}

_QWORD *assignWithCopy for iMessageSender(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  v4 = (_QWORD *)swift_unknownObjectWeakCopyAssign();
  v4[1] = *(_QWORD *)(a2 + 8);
  v5 = v4 + 2;
  v6 = *(_QWORD *)(a2 + 40);
  if (!v4[5])
  {
    if (v6)
    {
      a1[5] = v6;
      a1[6] = *(_QWORD *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(v4 + 2), a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    v7 = *(_OWORD *)(a2 + 16);
    v8 = *(_OWORD *)(a2 + 32);
    v5[4] = *(_QWORD *)(a2 + 48);
    *(_OWORD *)v5 = v7;
    *((_OWORD *)v5 + 1) = v8;
    goto LABEL_8;
  }
  if (!v6)
  {
    sub_10000EE64(v4 + 2);
    goto LABEL_7;
  }
  sub_1000171D0(v4 + 2, (_QWORD *)(a2 + 16));
LABEL_8:
  sub_1000171D0(a1 + 7, (_QWORD *)(a2 + 56));
  return a1;
}

_QWORD *sub_1000171D0(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
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
  _BYTE v15[24];

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
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
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
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

__n128 initializeWithTake for iMessageSender(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a2 + 56);
  result = *(__n128 *)(a2 + 72);
  *(__n128 *)(v3 + 72) = result;
  *(_QWORD *)(v3 + 88) = *(_QWORD *)(a2 + 88);
  return result;
}

uint64_t assignWithTake for iMessageSender(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  __int128 v6;

  v4 = (_QWORD *)swift_unknownObjectWeakTakeAssign();
  v4[1] = *(_QWORD *)(a2 + 8);
  v5 = v4 + 2;
  if (v4[5])
    sub_10000EE64(v4 + 2);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)v5 = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v5 + 1) = v6;
  v5[4] = *(_QWORD *)(a2 + 48);
  sub_10000EE64((_QWORD *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

uint64_t getEnumTagSinglePayload for iMessageSender(uint64_t a1, int a2)
{
  int v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  if ((*(_QWORD *)(a1 + 8) & 0xF000000000000007) != 0)
    v2 = *(_DWORD *)a1 & 0x7FFFFFFF;
  else
    v2 = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for iMessageSender(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      *(_QWORD *)(result + 8) = 1;
      return result;
    }
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for iMessageSender()
{
  return &type metadata for iMessageSender;
}

void sub_1000174C0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(*(id *)(v0 + 48), "activate");
  v1 = *(void **)(v0 + 56);
  if (v1 && objc_msgSend(v1, "valid"))
  {
    if (qword_1000418D8 != -1)
      swift_once(&qword_1000418D8, sub_100025C4C);
    v2 = type metadata accessor for Logger(0);
    v3 = sub_1000036A4(v2, (uint64_t)qword_100043F28);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(12, -1);
      v7 = swift_slowAlloc(32, -1);
      v10 = v7;
      *(_DWORD *)v6 = 136315138;
      v8 = sub_100027030(0x6574617669746361, 0xEA00000000002928, &v10);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v6 + 4, v6 + 12);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s was called, but there was already a valid assertion for the extension process", v6, 0xCu);
      swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v7, -1, -1);
      swift_slowDealloc(v6, -1, -1);
    }

  }
  else
  {
    sub_100018B68();
  }
}

void sub_10001766C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD aBlock[6];

  v1 = *(void **)(v0 + 48);
  aBlock[4] = sub_1000190DC;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007D40;
  aBlock[3] = &unk_10003DEF8;
  v2 = _Block_copy(aBlock);
  v3 = objc_msgSend(v1, "remoteObjectProxyWithErrorHandler:", v2);
  _Block_release(v2);
  _bridgeAnyObjectToAny(_:)(v3);
  swift_unknownObjectRelease(v3);
  v4 = *(void **)(v0 + 56);
  if (!v4 || (objc_msgSend(v4, "valid") & 1) == 0)
  {
    if (qword_1000418D8 != -1)
      swift_once(&qword_1000418D8, sub_100025C4C);
    v5 = type metadata accessor for Logger(0);
    v6 = sub_1000036A4(v5, (uint64_t)qword_100043F28);
    v7 = Logger.logObject.getter(v6);
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Trying to obtain a remote proxy without a valid assertion. Re-acquiring assertion.", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

    sub_100018B68();
  }
}

BOOL sub_100017944(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100017958(char a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 248) = a3;
  *(_QWORD *)(v4 + 256) = v3;
  *(_QWORD *)(v4 + 240) = a2;
  *(_BYTE *)(v4 + 424) = a1;
  *(_QWORD *)(v4 + 264) = *v3;
  return swift_task_switch(sub_100017980, 0, 0);
}

uint64_t sub_100017980()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  BOOL v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  NSString v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  Class isa;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_BYTE *)(v0 + 424);
  *(_QWORD *)(v1 + 32) = 0;
  v3 = swift_unknownObjectWeakInit(v1 + 24, 0);
  *(_QWORD *)(v1 + 88) = 0;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_BYTE *)(v1 + 16) = v2 & 1;
  if ((v2 & 1) != 0)
  {
    static AskToExtensionPoint.identifier.getter(v3);
  }
  else
  {
    if (&type metadata accessor for PeopleLegacyExtensionPoint)
      v4 = &type metadata for PeopleLegacyExtensionPoint == 0;
    else
      v4 = 1;
    if (v4 || &nominal type descriptor for PeopleLegacyExtensionPoint == 0)
    {
      v7 = 0x8000000100032140;
      goto LABEL_13;
    }
    static PeopleLegacyExtensionPoint.identifier.getter(v3);
  }
  v7 = v6;
LABEL_13:
  v8 = v0 + 16;
  v9 = objc_allocWithZone((Class)_EXQuery);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v11 = objc_msgSend(v9, "initWithExtensionPointIdentifier:", v10);
  *(_QWORD *)(v0 + 272) = v11;

  v12 = (void *)objc_opt_self(_EXQueryController);
  v13 = sub_100005FF0(&qword_1000424F8);
  v14 = swift_allocObject(v13, 40, 7);
  *(_OWORD *)(v14 + 16) = xmmword_1000308E0;
  *(_QWORD *)(v14 + 32) = v11;
  v20 = v14;
  specialized Array._endMutation()();
  sub_10001934C(0, &qword_100042500, _EXQuery_ptr);
  v15 = v11;
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 280) = isa;
  swift_bridgeObjectRelease(v20);
  *(_QWORD *)(v0 + 56) = v0 + 216;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_100017B84;
  v17 = swift_continuation_init(v0 + 16, 0);
  *(_QWORD *)(v0 + 176) = _NSConcreteStackBlock;
  v18 = (_QWORD *)(v0 + 176);
  v18[1] = 0x40000000;
  v18[2] = sub_1000187EC;
  v18[3] = &unk_10003DF20;
  v18[4] = v17;
  objc_msgSend(v12, "executeQueries:completionHandler:", isa, v18);
  return swift_continuation_await(v8);
}

uint64_t sub_100017B84()
{
  return swift_task_switch(sub_100017BD0, 0, 0);
}

uint64_t sub_100017BD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t result;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v39;
  void *v40;
  unint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
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
  os_log_type_t v62;
  uint8_t *v63;
  NSObject *log;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t *v68;

  v1 = *(_QWORD *)(v0 + 216);

  if (qword_1000418D8 != -1)
    goto LABEL_45;
  while (1)
  {
    v2 = type metadata accessor for Logger(0);
    sub_1000036A4(v2, (uint64_t)qword_100043F28);
    v3 = swift_bridgeObjectRetain_n(v1, 2);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.default.getter();
    v6 = (unint64_t)v1 >> 62;
    v66 = v1;
    if (!os_log_type_enabled(v4, v5))
    {
      swift_bridgeObjectRelease_n(v1, 2);

      goto LABEL_23;
    }
    v62 = v5;
    log = v4;
    v7 = *(_BYTE *)(v65 + 424);
    v8 = swift_slowAlloc(22, -1);
    v61 = swift_slowAlloc(64, -1);
    v67 = v61;
    *(_DWORD *)v8 = 136315394;
    v9 = (v7 & 1) != 0 ? 0xD00000000000002ALL : 0xD000000000000033;
    v10 = (v7 & 1) != 0 ? 0x80000001000314A0 : 0x80000001000314D0;
    *(_QWORD *)(v65 + 224) = sub_100027030(v9, v10, &v67);
    v60 = v65 + 232;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v65 + 224, v65 + 232, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v10);
    v63 = (uint8_t *)v8;
    *(_WORD *)(v8 + 12) = 2080;
    if (v6)
    {
      v59 = v1 < 0 ? v1 : v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v11 = _CocoaArrayWrapper.endIndex.getter(v59);
      swift_bridgeObjectRelease(v1);
    }
    else
    {
      v11 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v12 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (v11)
      break;
LABEL_22:
    v24 = Array.description.getter(v12, &type metadata for String);
    v26 = v25;
    swift_bridgeObjectRelease(v12);
    *(_QWORD *)(v65 + 232) = sub_100027030(v24, v26, &v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v60, v65 + 240, v63 + 14, v63 + 22);
    swift_bridgeObjectRelease(v26);
    swift_bridgeObjectRelease_n(v1, 2);
    _os_log_impl((void *)&_mh_execute_header, log, v62, "Extension bundleId: %s ; Found identities %s", v63, 0x16u);
    swift_arrayDestroy(v61, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v61, -1, -1);
    swift_slowDealloc(v63, -1, -1);

    v6 = (unint64_t)v1 >> 62;
LABEL_23:
    if (v6)
    {
      if (v1 < 0)
        v58 = v1;
      else
        v58 = v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v27 = _CocoaArrayWrapper.endIndex.getter(v58);
      if (!v27)
      {
LABEL_41:
        v40 = *(void **)(v65 + 272);
        swift_bridgeObjectRelease_n(v1, 2);
        v41 = sub_100006934();
        swift_allocError(&type metadata for ExtensionConnectionError, v41, 0, 0);
        *v42 = 0;
        swift_willThrow();

        v44 = *(_QWORD *)(v65 + 256);
        v43 = *(_QWORD *)(v65 + 264);
        sub_100014734(v44 + 24);

        sub_100006BB4(*(_QWORD *)(v44 + 64), *(_QWORD *)(v44 + 72));
        sub_100006BB4(*(_QWORD *)(v44 + 80), *(_QWORD *)(v44 + 88));
        swift_deallocPartialClassInstance(v44, v43, 96, 7);
        return (*(uint64_t (**)(void))(v65 + 8))();
      }
    }
    else
    {
      v27 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v1);
      if (!v27)
        goto LABEL_41;
    }
    v28 = 0;
    v29 = v1 & 0xC000000000000001;
    if ((*(_BYTE *)(v65 + 424) & 1) != 0)
      v30 = 0xD00000000000002ALL;
    else
      v30 = 0xD000000000000033;
    if ((*(_BYTE *)(v65 + 424) & 1) != 0)
      v31 = 0x80000001000314A0;
    else
      v31 = 0x80000001000314D0;
    while (1)
    {
      v32 = v29
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v1)
          : *(id *)(v1 + 8 * v28 + 32);
      v1 = (uint64_t)v32;
      *(_QWORD *)(v65 + 288) = v32;
      v33 = v28 + 1;
      if (__OFADD__(v28, 1))
        break;
      v34 = objc_msgSend(v32, "bundleIdentifier");
      v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      v37 = v36;

      if (v35 == v30 && v37 == v31)
      {
        swift_bridgeObjectRelease_n(v31, 2);
LABEL_43:
        swift_bridgeObjectRelease_n(v66, 2);
        v45 = type metadata accessor for _AppExtensionIdentity(0);
        *(_QWORD *)(v65 + 296) = v45;
        v46 = *(_QWORD *)(v45 - 8);
        *(_QWORD *)(v65 + 304) = v46;
        v47 = (*(_QWORD *)(v46 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
        v48 = swift_task_alloc(v47);
        *(_QWORD *)(v65 + 312) = v48;
        _AppExtensionIdentity.init(_:)((id)v1);
        v49 = type metadata accessor for _AppExtensionProcess.Configuration(0);
        *(_QWORD *)(v65 + 320) = v49;
        v50 = *(_QWORD *)(v49 - 8);
        *(_QWORD *)(v65 + 328) = v50;
        v51 = (*(_QWORD *)(v50 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
        *(_QWORD *)(v65 + 336) = swift_task_alloc(v51);
        v52 = swift_task_alloc(v47);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v52, v48, v45);
        _AppExtensionProcess.Configuration.init(appExtension:onInterruption:)(v52, nullsub_1, 0);
        swift_task_dealloc(v52);
        v53 = type metadata accessor for _AppExtensionProcess(0);
        *(_QWORD *)(v65 + 344) = v53;
        v54 = *(_QWORD *)(v53 - 8);
        *(_QWORD *)(v65 + 352) = v54;
        v55 = swift_task_alloc((*(_QWORD *)(v54 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
        *(_QWORD *)(v65 + 360) = v55;
        v56 = swift_task_alloc(v51);
        *(_QWORD *)(v65 + 368) = v56;
        (*(void (**)(void))(v50 + 16))();
        v57 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to _AppExtensionProcess.init(configuration:)
                                         + 1));
        *(_QWORD *)(v65 + 376) = v57;
        *v57 = v65;
        v57[1] = sub_100018280;
        return _AppExtensionProcess.init(configuration:)(v55, v56);
      }
      v39 = _stringCompareWithSmolCheck(_:_:expecting:)(v35, v37, v30, v31, 0);
      swift_bridgeObjectRelease(v31);
      swift_bridgeObjectRelease(v37);
      if ((v39 & 1) != 0)
        goto LABEL_43;

      ++v28;
      v1 = v66;
      if (v33 == v27)
        goto LABEL_41;
    }
    __break(1u);
LABEL_45:
    swift_once(&qword_1000418D8, sub_100025C4C);
  }
  v68 = (unint64_t *)&_swiftEmptyArrayStorage;
  result = sub_10001E41C(0, v11 & ~(v11 >> 63), 0);
  if ((v11 & 0x8000000000000000) == 0)
  {
    v14 = 0;
    v12 = v68;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v14, v1);
      else
        v15 = *(id *)(v1 + 8 * v14 + 32);
      v16 = v15;
      v17 = objc_msgSend(v15, "bundleIdentifier", v60);
      v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
      v20 = v19;

      v68 = v12;
      v22 = v12[2];
      v21 = v12[3];
      if (v22 >= v21 >> 1)
      {
        sub_10001E41C(v21 > 1, v22 + 1, 1);
        v12 = v68;
      }
      ++v14;
      v12[2] = v22 + 1;
      v23 = &v12[2 * v22];
      v23[4] = v18;
      v23[5] = v20;
    }
    while (v11 != v14);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_100018280()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 376);
  *(_QWORD *)(*v1 + 384) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_100018708;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 368));
    v4 = sub_1000182EC;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000182EC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSXPCConnection v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  Class isa;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  objc_class *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = *(_QWORD *)(v0 + 256);
  *(_QWORD *)(v0 + 392) = _AppExtensionProcess.auditToken.getter();
  *(_DWORD *)(v0 + 400) = v2;
  *(_DWORD *)(v0 + 404) = v3;
  *(_DWORD *)(v0 + 408) = v4;
  *(_DWORD *)(v0 + 412) = v5;
  *(_DWORD *)(v0 + 416) = v6;
  *(_DWORD *)(v0 + 420) = v7;
  *(_DWORD *)(v1 + 40) = audit_token_to_pid((audit_token_t *)(v0 + 392));
  v8.super.isa = _AppExtensionProcess.makeXPCConnection()().super.isa;
  if (v9)
  {
    v11 = *(_QWORD *)(v0 + 352);
    v10 = *(_QWORD *)(v0 + 360);
    v12 = *(_QWORD *)(v0 + 336);
    v13 = *(_QWORD *)(v0 + 344);
    v14 = *(_QWORD *)(v0 + 320);
    v15 = *(_QWORD *)(v0 + 328);
    v16 = *(_QWORD *)(v0 + 304);
    v42 = *(_QWORD *)(v0 + 312);
    v17 = *(_QWORD *)(v0 + 296);
    v18 = *(void **)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v13);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v12, v14);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v42, v17);
    swift_task_dealloc(v10);
    swift_task_dealloc(v12);
    swift_task_dealloc(v42);
    v22 = *(_QWORD *)(v0 + 256);
    v23 = *(_QWORD *)(v0 + 264);
    sub_100014734(v22 + 24);

    sub_100006BB4(*(_QWORD *)(v22 + 64), *(_QWORD *)(v22 + 72));
    sub_100006BB4(*(_QWORD *)(v22 + 80), *(_QWORD *)(v22 + 88));
    swift_deallocPartialClassInstance(v22, v23, 96, 7);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    isa = v8.super.isa;
    if ((*(_BYTE *)(v0 + 424) & 1) != 0)
      v20 = 0xD00000000000002ALL;
    else
      v20 = 0xD000000000000033;
    if ((*(_BYTE *)(v0 + 424) & 1) != 0)
      v21 = 0x80000001000314A0;
    else
      v21 = 0x80000001000314D0;
    (*(void (**)(Class, unint64_t, unint64_t))(v0 + 240))(v8.super.isa, v20, v21);
    v25 = *(_QWORD *)(v0 + 360);
    v26 = *(_QWORD *)(v0 + 336);
    v37 = *(_QWORD *)(v0 + 352);
    v38 = *(_QWORD *)(v0 + 344);
    v39 = *(_QWORD *)(v0 + 328);
    v40 = *(_QWORD *)(v0 + 320);
    v41 = *(_QWORD *)(v0 + 304);
    v43 = *(_QWORD *)(v0 + 296);
    v44 = *(_QWORD *)(v0 + 312);
    v35 = *(void **)(v0 + 288);
    v36 = *(void **)(v0 + 272);
    if ((*(_BYTE *)(v0 + 424) & 1) != 0)
      v27 = 0x80000001000314A0;
    else
      v27 = 0x80000001000314D0;
    v28 = *(_QWORD *)(v0 + 256);
    swift_bridgeObjectRelease(v27);
    *(_QWORD *)(v28 + 48) = isa;
    v29 = swift_allocObject(&unk_10003DF48, 24, 7);
    swift_weakInit(v29 + 16, v28);
    *(_QWORD *)(v0 + 112) = sub_10001933C;
    *(_QWORD *)(v0 + 120) = v29;
    *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
    *(_QWORD *)(v0 + 88) = 1107296256;
    *(_QWORD *)(v0 + 96) = sub_10002636C;
    *(_QWORD *)(v0 + 104) = &unk_10003DF60;
    v30 = _Block_copy((const void *)(v0 + 80));
    v31 = *(_QWORD *)(v0 + 120);
    v32 = isa;
    swift_release(v31);
    -[objc_class setInterruptionHandler:](v32, "setInterruptionHandler:", v30);
    _Block_release(v30);
    v33 = swift_allocObject(&unk_10003DF48, 24, 7);
    swift_weakInit(v33 + 16, v28);
    *(_QWORD *)(v0 + 128) = _NSConcreteStackBlock;
    *(_QWORD *)(v0 + 160) = sub_100019344;
    *(_QWORD *)(v0 + 168) = v33;
    *(_QWORD *)(v0 + 136) = 1107296256;
    *(_QWORD *)(v0 + 144) = sub_10002636C;
    *(_QWORD *)(v0 + 152) = &unk_10003DF88;
    v34 = _Block_copy((const void *)(v0 + 128));
    swift_release(*(_QWORD *)(v0 + 168));
    -[objc_class setInvalidationHandler:](v32, "setInvalidationHandler:", v34);
    _Block_release(v34);

    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v25, v38);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v26, v40);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v44, v43);
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v44);
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 256));
  }
}

uint64_t sub_100018708()
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
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 320);
  v7 = *(_QWORD *)(v0 + 296);
  v8 = *(_QWORD *)(v0 + 304);
  v9 = *(void **)(v0 + 272);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  v11 = *(_QWORD *)(v0 + 256);
  v10 = *(_QWORD *)(v0 + 264);
  sub_100014734(v11 + 24);

  sub_100006BB4(*(_QWORD *)(v11 + 64), *(_QWORD *)(v11 + 72));
  sub_100006BB4(*(_QWORD *)(v11 + 80), *(_QWORD *)(v11 + 88));
  swift_deallocPartialClassInstance(v11, v10, 96, 7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000187EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = sub_10001934C(0, &qword_100042508, _EXExtensionIdentity_ptr);
  **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v4);
  return swift_continuation_resume(v3);
}

uint64_t sub_100018840(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0, 0);
  result = swift_weakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    v4 = *(void (**)(uint64_t))(result + 64);
    if (v4)
    {
      v5 = *(_QWORD *)(result + 72);
      v6 = swift_retain(v5);
      v4(v6);
      sub_100006BB4((uint64_t)v4, v5);
    }
    sub_1000188C4();
    return swift_release(v3);
  }
  return result;
}

id sub_1000188C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  v1 = v0;
  if (qword_1000418D8 != -1)
    swift_once(&qword_1000418D8, sub_100025C4C);
  v2 = type metadata accessor for Logger(0);
  sub_1000036A4(v2, (uint64_t)qword_100043F28);
  v3 = swift_retain_n(v0, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc(18, -1);
    v7 = swift_slowAlloc(32, -1);
    v14 = v7;
    *(_DWORD *)v6 = 67109378;
    LODWORD(v13) = *(_DWORD *)(v1 + 40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, (char *)&v13 + 4, v6 + 4, v6 + 8);
    *(_WORD *)(v6 + 8) = 2080;
    if (*(_BYTE *)(v1 + 16))
      v8 = 0xD00000000000002ALL;
    else
      v8 = 0xD000000000000033;
    if (*(_BYTE *)(v1 + 16))
      v9 = 0x80000001000314A0;
    else
      v9 = 0x80000001000314D0;
    v13 = sub_100027030(v8, v9, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v6 + 10, v6 + 18);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Invalidating assertion for extension with PID %d and bundleId %s", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
  v10 = *(void **)(v1 + 56);
  if (v10)
  {
    objc_msgSend(v10, "invalidate");
    v11 = *(void **)(v1 + 56);
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)(v1 + 56) = 0;

  return objc_msgSend(*(id *)(v1 + 48), "invalidate");
}

uint64_t sub_100018AE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0, 0);
  result = swift_weakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    v4 = *(void (**)(uint64_t))(result + 80);
    if (v4)
    {
      v5 = *(_QWORD *)(result + 88);
      v6 = swift_retain(v5);
      v4(v6);
      sub_100006BB4((uint64_t)v4, v5);
    }
    sub_1000188C4();
    return swift_release(v3);
  }
  return result;
}

void sub_100018B68()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  id v12;
  NSString v13;
  id v14;
  id v15;
  unsigned __int8 v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0;
  v2 = 0xD000000000000033;
  if (*(_BYTE *)(v0 + 16))
    v2 = 0xD00000000000002ALL;
  v31 = v2;
  if (*(_BYTE *)(v0 + 16))
    v3 = 0x80000001000314A0;
  else
    v3 = 0x80000001000314D0;
  if (qword_1000418D8 != -1)
    swift_once(&qword_1000418D8, sub_100025C4C);
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043F28);
  swift_retain_n(v0, 2);
  v5 = swift_bridgeObjectRetain_n(v3, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc(18, -1);
    v9 = swift_slowAlloc(32, -1);
    v34 = v9;
    *(_DWORD *)v8 = 67109378;
    v10 = *(_DWORD *)(v0 + 40);
    swift_release(v0);
    LODWORD(v32) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, (char *)&v32 + 4, v8 + 4, v8 + 8);
    swift_release(v0);
    *(_WORD *)(v8 + 8) = 2080;
    swift_bridgeObjectRetain(v3);
    v32 = sub_100027030(v31, v3, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v8 + 10, v8 + 18);
    swift_bridgeObjectRelease_n(v3, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Initializing assertion for extension with PID %d and bundleId %s", (uint8_t *)v8, 0x12u);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v3, 2);
    swift_release_n(v0, 2);
  }
  v11 = *(unsigned int *)(v0 + 40);
  v12 = objc_allocWithZone((Class)BKSProcessAssertion);
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v12, "initWithPID:flags:reason:name:", v11, 10, 13, v13);

  if (v14)
  {
    v15 = v14;
    v16 = objc_msgSend(v15, "acquire");
    v17 = swift_bridgeObjectRetain(v3);
    v18 = Logger.logObject.getter(v17);
    if ((v16 & 1) != 0)
    {
      v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v30 = v15;
        v20 = (uint8_t *)swift_slowAlloc(12, -1);
        v21 = swift_slowAlloc(32, -1);
        v34 = v21;
        *(_DWORD *)v20 = 136315138;
        swift_bridgeObjectRetain(v3);
        v32 = sub_100027030(v31, v3, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v20 + 4, v20 + 12);
        swift_bridgeObjectRelease_n(v3, 3);
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Successfully acquired assertion for extension with bundleId %s", v20, 0xCu);
        swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v21, -1, -1);
        swift_slowDealloc(v20, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v3, 2);
      }
      v27 = *(void **)(v1 + 56);
      *(_QWORD *)(v1 + 56) = v14;

    }
    else
    {
      v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc(12, -1);
        v26 = swift_slowAlloc(32, -1);
        v34 = v26;
        *(_DWORD *)v25 = 136315138;
        swift_bridgeObjectRetain(v3);
        v32 = sub_100027030(v31, v3, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v25 + 4, v25 + 12);
        swift_bridgeObjectRelease_n(v3, 3);
        _os_log_impl((void *)&_mh_execute_header, v18, v24, "Failed to acquire assertion for extension with bundleId %s", v25, 0xCu);
        swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v26, -1, -1);
        swift_slowDealloc(v25, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v3, 2);
      }
      v28 = sub_100006934();
      swift_allocError(&type metadata for ExtensionConnectionError, v28, 0, 0);
      *v29 = 5;
      swift_willThrow();

    }
  }
  else
  {
    swift_bridgeObjectRelease(v3);
    v22 = sub_100006934();
    swift_allocError(&type metadata for ExtensionConnectionError, v22, 0, 0);
    *v23 = 4;
    swift_willThrow();
  }
}

void sub_1000190DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *oslog;
  uint64_t v10;
  uint64_t v11;

  if (qword_1000418D8 != -1)
    swift_once(&qword_1000418D8, sub_100025C4C);
  v2 = type metadata accessor for Logger(0);
  sub_1000036A4(v2, (uint64_t)qword_100043F28);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    swift_errorRetain(a1);
    v7 = _swift_stdlib_bridgeErrorToNSError(a1);
    v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11, v5 + 4, v5 + 12);
    *v6 = v7;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Error obtaining remote proxy: %@", v5, 0xCu);
    v8 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v6, 1, v8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

  }
}

uint64_t sub_10001929C()
{
  uint64_t v0;

  sub_100014734(v0 + 24);

  sub_100006BB4(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  sub_100006BB4(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  return swift_deallocClassInstance(v0, 96, 7);
}

uint64_t type metadata accessor for AppExtensionConnection()
{
  return objc_opt_self(_TtC6asktod22AppExtensionConnection);
}

uint64_t sub_100019300(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100019310(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100019318()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001933C()
{
  uint64_t v0;

  return sub_100018840(v0);
}

uint64_t sub_100019344()
{
  uint64_t v0;

  return sub_100018AE4(v0);
}

uint64_t sub_10001934C(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t getEnumTagSinglePayload for ExtensionConnectionError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ExtensionConnectionError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100019460 + 4 * byte_1000308F5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100019494 + 4 * byte_1000308F0[v4]))();
}

uint64_t sub_100019494(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001949C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000194A4);
  return result;
}

uint64_t sub_1000194B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000194B8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1000194BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000194C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000194D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExtensionConnectionError()
{
  return &type metadata for ExtensionConnectionError;
}

unint64_t sub_1000194EC()
{
  unint64_t result;

  result = qword_100042510;
  if (!qword_100042510)
  {
    result = swift_getWitnessTable(&unk_1000309DC, &type metadata for ExtensionConnectionError);
    atomic_store(result, (unint64_t *)&qword_100042510);
  }
  return result;
}

uint64_t sub_100019540(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  NSString v12;
  id v13;
  uint64_t result;
  unsigned __int8 v15;
  _OWORD v16[2];
  uint64_t v17[4];

  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v5 = type metadata accessor for Logger(0);
  sub_1000036A4(v5, (uint64_t)qword_100043F10);
  swift_bridgeObjectRetain_n(a2, 2);
  v6 = v2;
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc(18, -1);
    v10 = swift_slowAlloc(32, -1);
    v17[0] = v10;
    *(_DWORD *)v9 = 136315394;
    swift_bridgeObjectRetain(a2);
    *(_QWORD *)&v16[0] = sub_100027030(a1, a2, v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v16, (char *)v16 + 8, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease_n(a2, 3);
    *(_WORD *)(v9 + 12) = 1024;
    v11 = objc_msgSend(v6, "processIdentifier");

    LODWORD(v16[0]) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v16, (char *)v16 + 4, v9 + 14, v9 + 18);

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Checking entitlement \"%s\" for connection with PID %d", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v6, "valueForEntitlement:", v12);

  if (v13)
  {
    _bridgeAnyObjectToAny(_:)(v13);
    swift_unknownObjectRelease(v13);
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_1000197DC((uint64_t)v16, (uint64_t)v17);
  if (v17[3])
  {
    result = swift_dynamicCast(&v15, v17, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
    if ((_DWORD)result)
      return v15;
  }
  else
  {
    sub_100019824((uint64_t)v17);
    return 0;
  }
  return result;
}

uint64_t sub_1000197DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005FF0(&qword_100042518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019824(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005FF0(&qword_100042518);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100019864()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v1[29] = v0;
  v2 = type metadata accessor for ATURL.Parser(0);
  v1[30] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[31] = v3;
  v1[32] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v1[33] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[34] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[35] = swift_task_alloc(v6);
  v1[36] = swift_task_alloc(v6);
  v7 = sub_100005FF0(&qword_100042528);
  v1[37] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v1[38] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[39] = swift_task_alloc(v9);
  v1[40] = swift_task_alloc(v9);
  v1[41] = swift_task_alloc(v9);
  v1[42] = swift_task_alloc(v9);
  v1[43] = swift_task_alloc(v9);
  v1[44] = swift_task_alloc(v9);
  return swift_task_switch(sub_100019968, 0, 0);
}

uint64_t sub_100019968()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;

  v0[16] = *(_QWORD *)(v0[29] + 32);
  v1 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v3 = v2;
  v0[45] = v1;
  v0[46] = v2;
  if (qword_100041908 != -1)
    swift_once(&qword_100041908, sub_100025D20);
  v4 = type metadata accessor for Logger(0);
  v0[47] = sub_1000036A4(v4, (uint64_t)qword_100043FB8);
  v5 = swift_bridgeObjectRetain_n(v3, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v21 = v1;
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v22 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain(v3);
    v0[28] = sub_100027030(v21, v3, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 28, v0 + 29, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(v3, 3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "ScreenTime answer ID was %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v3, 2);
  }

  v10 = (uint64_t *)v0[29];
  v11 = *v10;
  v0[48] = *v10;
  v12 = v10[1];
  v0[49] = v12;
  v0[50] = v10[2];
  v13 = v10[3];
  v0[51] = v13;
  swift_bridgeObjectRetain_n(v12, 2);
  v14 = swift_bridgeObjectRetain_n(v13, 2);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(32, -1);
    v22 = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain(v12);
    v0[27] = sub_100027030(v11, v12, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 27, v0 + 28, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease_n(v12, 3);
    swift_bridgeObjectRelease_n(v13, 2);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Looking for Messages messages with request ID %s", v17, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v12, 2);
    swift_bridgeObjectRelease_n(v13, 2);
  }

  v19 = (_QWORD *)swift_task_alloc(dword_100042534);
  v0[52] = v19;
  *v19 = v0;
  v19[1] = sub_100019CE0;
  return sub_10001E840(v11, v12);
}

uint64_t sub_100019CE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 416);
  *(_QWORD *)(v3 + 424) = a1;
  *(_QWORD *)(v3 + 432) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_10001A84C;
  else
    v5 = sub_100019D4C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100019D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void (*v51)(uint64_t, uint64_t);
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
  uint64_t (*v63)(void);
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t result;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  os_log_type_t v112;
  _BOOL4 v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  NSObject *log;
  uint64_t v135;
  uint64_t *v136;
  os_log_type_t type[8];
  os_log_type_t typeb;
  void *typea;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144[2];

  v1 = *(_QWORD *)(v0 + 424);
  v2 = *(_QWORD *)(v0 + 408);
  swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 392), 2);
  swift_bridgeObjectRetain_n(v2, 2);
  v3 = swift_bridgeObjectRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 424);
    v140 = *(_QWORD *)(v0 + 408);
    v8 = *(_QWORD *)(v0 + 384);
    v7 = *(_QWORD *)(v0 + 392);
    v9 = swift_slowAlloc(22, -1);
    v10 = swift_slowAlloc(32, -1);
    *(_DWORD *)v9 = 134218242;
    *(_QWORD *)(v0 + 200) = *(_QWORD *)(v6 + 16);
    v144[0] = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 200, v0 + 208, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v6);
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain(v7);
    *(_QWORD *)(v0 + 208) = sub_100027030(v8, v7, v144);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v9 + 14, v9 + 22);
    swift_bridgeObjectRelease_n(v7, 3);
    swift_bridgeObjectRelease_n(v140, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Found %ld Messages messages matching request ID %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 408);
    v12 = *(_QWORD *)(v0 + 392);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 424));
    swift_bridgeObjectRelease_n(v12, 2);
    swift_bridgeObjectRelease_n(v11, 2);
  }

  v13 = *(_QWORD *)(v0 + 424);
  v14 = *(_QWORD *)(v13 + 16);
  *(_QWORD *)(v0 + 440) = v14;
  if (!v14)
  {
    v54 = *(_QWORD *)(v0 + 368);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v54);
    v55 = *(_QWORD *)(v0 + 344);
    v57 = *(_QWORD *)(v0 + 328);
    v56 = *(_QWORD *)(v0 + 336);
    v59 = *(_QWORD *)(v0 + 312);
    v58 = *(_QWORD *)(v0 + 320);
    v61 = *(_QWORD *)(v0 + 280);
    v60 = *(_QWORD *)(v0 + 288);
    v62 = *(_QWORD *)(v0 + 256);
    swift_task_dealloc(*(_QWORD *)(v0 + 352));
    swift_task_dealloc(v55);
    swift_task_dealloc(v56);
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    v63 = *(uint64_t (**)(void))(v0 + 8);
    return v63();
  }
  v132 = v0 + 160;
  v15 = *(_QWORD **)(v0 + 344);
  v16 = *(char **)(v0 + 352);
  v135 = *(_QWORD *)(v0 + 336);
  v18 = *(_QWORD *)(v0 + 296);
  v17 = *(_QWORD *)(v0 + 304);
  v19 = *(_QWORD *)(v0 + 272);
  v20 = *(int *)(v18 + 48);
  *(_DWORD *)(v0 + 584) = v20;
  v21 = type metadata accessor for ATPayload(0);
  *(_QWORD *)(v0 + 448) = v21;
  v22 = *(_DWORD *)(v17 + 80);
  *(_DWORD *)(v0 + 588) = v22;
  *(_QWORD *)type = *(_QWORD *)(v0 + 432);
  *(_QWORD *)(v0 + 456) = *(_QWORD *)(v17 + 72);
  *(_QWORD *)(v0 + 464) = 0;
  v23 = *(_QWORD *)(v0 + 264);
  v133 = *(char **)(v0 + 288);
  sub_10001FFA4(v13 + ((v22 + 32) & ~(unint64_t)v22), (uint64_t)v16, &qword_100042528);
  v24 = *(int *)(v18 + 48);
  *(_DWORD *)(v0 + 592) = v24;
  v25 = (char *)v15 + v24;
  v26 = *(_QWORD *)v16;
  *(_QWORD *)(v0 + 472) = *(_QWORD *)v16;
  v27 = *((_QWORD *)v16 + 1);
  *(_QWORD *)(v0 + 480) = v27;
  *v15 = v26;
  v15[1] = v27;
  v28 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
  v28(v25, &v16[v20], v23);
  v29 = (char *)(v135 + *(int *)(v18 + 48));
  v30 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  *(_QWORD *)(v0 + 488) = v30;
  v30(v29, v25, v23);
  v28(v133, v29, v23);
  v31 = swift_bridgeObjectRetain(v27);
  ATURL.Parser.init()(v31);
  v32 = sub_10001F1A8(&qword_100042538, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  v33 = sub_10001F1A8(&qword_100042540, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  v34 = *(_QWORD *)type;
  ATURL.Parser.parse<A>(_:from:)(v21, v133, v21, v32, v33);
  if (*(_QWORD *)type)
  {
    v35 = *(_QWORD *)(v0 + 368);
    v37 = *(char **)(v0 + 280);
    v36 = *(char **)(v0 + 288);
    v38 = *(_QWORD *)(v0 + 264);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 424));
    swift_bridgeObjectRelease(v35);
    swift_bridgeObjectRelease(v27);
    v30(v37, v36, v38);
    swift_errorRetain(*(_QWORD *)type);
    v39 = swift_errorRetain(*(_QWORD *)type);
    v40 = Logger.logObject.getter(v39);
    v41 = static os_log_type_t.error.getter();
    v42 = os_log_type_enabled(v40, v41);
    v44 = *(_QWORD *)(v0 + 272);
    v43 = *(_QWORD *)(v0 + 280);
    v45 = *(_QWORD *)(v0 + 264);
    if (v42)
    {
      typeb = v41;
      v46 = swift_slowAlloc(22, -1);
      v136 = (uint64_t *)swift_slowAlloc(8, -1);
      v141 = swift_slowAlloc(32, -1);
      v144[0] = v141;
      *(_DWORD *)v46 = 136315394;
      v47 = sub_10001F1A8(&qword_100042550, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v48 = dispatch thunk of CustomStringConvertible.description.getter(v45, v47);
      log = v40;
      v50 = v49;
      *(_QWORD *)(v0 + 144) = sub_100027030(v48, v49, v144);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v46 + 4, v46 + 12);
      swift_bridgeObjectRelease(v50);
      v51 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v51(v43, v45);
      *(_WORD *)(v46 + 12) = 2112;
      swift_errorRetain(v34);
      v52 = _swift_stdlib_bridgeErrorToNSError(v34);
      *(_QWORD *)(v0 + 152) = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v132, v46 + 14, v46 + 22);
      *v136 = v52;
      swift_errorRelease(v34);
      swift_errorRelease(v34);
      _os_log_impl((void *)&_mh_execute_header, log, typeb, "Could not parse ATPayload from messagesPayloadURL %s. error: %@", (uint8_t *)v46, 0x16u);
      v53 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v136, 1, v53);
      swift_slowDealloc(v136, -1, -1);
      swift_arrayDestroy(v141, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v141, -1, -1);
      swift_slowDealloc(v46, -1, -1);

    }
    else
    {
      v51 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v51(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
      swift_errorRelease(*(_QWORD *)type);
      swift_errorRelease(*(_QWORD *)type);

    }
    v74 = *(_QWORD *)(v0 + 344);
    v75 = *(_QWORD *)(v0 + 288);
    v77 = *(_QWORD *)(v0 + 256);
    v76 = *(_QWORD *)(v0 + 264);
    v78 = *(_QWORD *)(v0 + 240);
    v79 = *(_QWORD *)(v0 + 248);
    v80 = sub_10001F164();
    v81 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v80, 0, 0);
    *(_QWORD *)v82 = v34;
    *(_QWORD *)(v82 + 8) = 0;
    *(_BYTE *)(v82 + 16) = 3;
    swift_willThrow(v81);
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v77, v78);
    v51(v75, v76);
LABEL_13:
    sub_1000068A0(v74, &qword_100042528);
    v83 = *(_QWORD *)(v0 + 344);
    v85 = *(_QWORD *)(v0 + 328);
    v84 = *(_QWORD *)(v0 + 336);
    v87 = *(_QWORD *)(v0 + 312);
    v86 = *(_QWORD *)(v0 + 320);
    v89 = *(_QWORD *)(v0 + 280);
    v88 = *(_QWORD *)(v0 + 288);
    v90 = *(_QWORD *)(v0 + 256);
    swift_task_dealloc(*(_QWORD *)(v0 + 352));
    swift_task_dealloc(v83);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v88);
    swift_task_dealloc(v89);
    swift_task_dealloc(v90);
    v63 = *(uint64_t (**)(void))(v0 + 8);
    return v63();
  }
  v65 = *(_QWORD *)(v0 + 360);
  v64 = *(_QWORD *)(v0 + 368);
  v66 = *(void **)(v0 + 136);
  *(_QWORD *)(v0 + 496) = v66;
  v67 = v66;
  v68 = (void *)ATPayload.question.getter(v67);
  v69 = ATQuestion.answerChoices.getter();

  swift_bridgeObjectRetain(v64);
  v70 = sub_10001F1E8(v69, v65, v64);
  *(_QWORD *)(v0 + 504) = v70;
  swift_bridgeObjectRelease(v64);
  swift_bridgeObjectRelease(v69);
  if (v70)
  {
    v71 = (_QWORD *)swift_task_alloc(dword_10004255C);
    *(_QWORD *)(v0 + 512) = v71;
    *v71 = v0;
    v71[1] = sub_10001A8F8;
    v72 = *(_QWORD *)(v0 + 408);
    v71[16] = *(_QWORD *)(v0 + 400);
    v71[17] = v72;
    return swift_task_switch(sub_10001F580, 0, 0);
  }
  v91 = swift_bridgeObjectRelease(v27);
  v92 = (void *)ATPayload.question.getter(v91);

  v93 = ATQuestion.answerChoices.getter();
  if (!((unint64_t)v93 >> 62))
  {
    v94 = *(_QWORD *)((v93 & 0xFFFFFFFFFFFFF8) + 0x10);
    typea = v67;
    if (v94)
      goto LABEL_17;
LABEL_30:
    v109 = *(_QWORD *)(v0 + 424);
    swift_bridgeObjectRelease(v93);
    swift_bridgeObjectRelease(v109);
    v96 = &_swiftEmptyArrayStorage;
LABEL_31:
    swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 368), 2);
    v110 = swift_bridgeObjectRetain(v96);
    v111 = Logger.logObject.getter(v110);
    v112 = static os_log_type_t.error.getter();
    v113 = os_log_type_enabled(v111, v112);
    v114 = *(_QWORD *)(v0 + 368);
    if (v113)
    {
      v115 = *(_QWORD *)(v0 + 360);
      v116 = swift_slowAlloc(22, -1);
      v117 = swift_slowAlloc(64, -1);
      v144[0] = v117;
      *(_DWORD *)v116 = 136315394;
      swift_bridgeObjectRetain(v114);
      *(_QWORD *)(v0 + 160) = sub_100027030(v115, v114, v144);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v132, v0 + 168, v116 + 4, v116 + 12);
      swift_bridgeObjectRelease_n(v114, 3);
      *(_WORD *)(v116 + 12) = 2080;
      v118 = swift_bridgeObjectRetain(v96);
      v119 = Array.description.getter(v118, &type metadata for String);
      v121 = v120;
      swift_bridgeObjectRelease(v96);
      *(_QWORD *)(v0 + 168) = sub_100027030(v119, v121, v144);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176, v116 + 14, v116 + 22);
      swift_bridgeObjectRelease(v121);
      swift_bridgeObjectRelease_n(v96, 2);
      _os_log_impl((void *)&_mh_execute_header, v111, v112, "No answer choice in the original question had id %s. originalAnswerIds: %s", (uint8_t *)v116, 0x16u);
      swift_arrayDestroy(v117, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v117, -1, -1);
      swift_slowDealloc(v116, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 368), 2);
      swift_bridgeObjectRelease_n(v96, 2);
    }

    v123 = *(_QWORD *)(v0 + 360);
    v122 = *(_QWORD *)(v0 + 368);
    v74 = *(_QWORD *)(v0 + 344);
    v143 = *(_QWORD *)(v0 + 288);
    v124 = *(_QWORD *)(v0 + 264);
    v125 = *(_QWORD *)(v0 + 272);
    v126 = *(_QWORD *)(v0 + 248);
    v127 = *(_QWORD *)(v0 + 256);
    v128 = *(_QWORD *)(v0 + 240);
    v129 = sub_10001F164();
    v130 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v129, 0, 0);
    *(_QWORD *)v131 = v123;
    *(_QWORD *)(v131 + 8) = v122;
    *(_BYTE *)(v131 + 16) = 1;
    swift_willThrow(v130);

    (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v127, v128);
    (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v143, v124);
    goto LABEL_13;
  }
  if (v93 < 0)
    v108 = v93;
  else
    v108 = v93 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v93);
  v94 = _CocoaArrayWrapper.endIndex.getter(v108);
  swift_bridgeObjectRelease(v93);
  typea = v67;
  if (!v94)
    goto LABEL_30;
LABEL_17:
  v144[0] = (uint64_t)&_swiftEmptyArrayStorage;
  result = sub_10001E41C(0, v94 & ~(v94 >> 63), 0);
  if ((v94 & 0x8000000000000000) == 0)
  {
    v95 = 0;
    v96 = (_QWORD *)v144[0];
    v142 = v93 & 0xC000000000000001;
    v97 = v93;
    v98 = v94;
    do
    {
      if (v142)
        v99 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v95, v93);
      else
        v99 = *(id *)(v93 + 8 * v95 + 32);
      v100 = v99;
      v101 = ATAnswerChoice.id.getter();
      v103 = v102;

      v144[0] = (uint64_t)v96;
      v105 = v96[2];
      v104 = v96[3];
      if (v105 >= v104 >> 1)
      {
        sub_10001E41C(v104 > 1, v105 + 1, 1);
        v96 = (_QWORD *)v144[0];
      }
      ++v95;
      v96[2] = v105 + 1;
      v106 = (char *)&v96[2 * v105];
      *((_QWORD *)v106 + 4) = v101;
      *((_QWORD *)v106 + 5) = v103;
      v93 = v97;
    }
    while (v98 != v95);
    v107 = *(_QWORD *)(v0 + 424);
    swift_bridgeObjectRelease(v97);
    swift_bridgeObjectRelease(v107);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001A84C()
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

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 368));
  v1 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 336);
  v5 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 320);
  v7 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 288);
  v8 = *(_QWORD *)(v0 + 256);
  swift_task_dealloc(*(_QWORD *)(v0 + 352));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001A8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = *(_QWORD **)v3;
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 512);
  *(_QWORD *)(*(_QWORD *)v3 + 520) = v2;
  swift_task_dealloc(v7);
  if (v2)
  {
    v8 = (void *)v6[62];
    v9 = v6[60];
    v10 = v6[46];
    swift_bridgeObjectRelease(v6[53]);
    swift_bridgeObjectRelease(v10);

    swift_bridgeObjectRelease(v9);
    v11 = sub_10001AB2C;
  }
  else
  {
    v6[66] = a2;
    v6[67] = a1;
    v11 = sub_10001A99C;
  }
  return swift_task_switch(v11, 0, 0);
}

uint64_t sub_10001A99C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v2 = v1[67];
  v3 = v1[66];
  v4 = v1[62];
  v5 = (void *)v1[63];
  v6 = ATPayload.question.getter(a1);
  v7 = objc_allocWithZone((Class)type metadata accessor for ATResponse(0));
  v8 = (void *)ATResponse.init(originalQuestion:responderHandle:chosenAnswer:)(v6, v2, v3, v5);
  v1[68] = v8;
  v9 = ATPayload.__allocating_init(originalPayload:newResponse:)(v4, v8);
  v1[69] = v9;
  v10 = type metadata accessor for AppExtensionProxy();
  v11 = swift_allocObject(v10, 32, 7);
  v1[70] = v11;
  *(_QWORD *)(v11 + 24) = sub_100025DF4((uint64_t)&_swiftEmptyArrayStorage);
  *(_WORD *)(v11 + 16) = 768;
  v12 = (_QWORD *)swift_task_alloc(dword_100041B54);
  v1[71] = v12;
  *v12 = v1;
  v12[1] = sub_10001AAA8;
  return sub_100003EE0((uint64_t)(v1 + 2), v9);
}

uint64_t sub_10001AAA8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 568);
  *(_QWORD *)(*(_QWORD *)v1 + 576) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = v2[60];
    v5 = v2[53];
    v6 = v2[46];
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v4);
    v7 = sub_10001BAE0;
  }
  else
  {
    v7 = sub_10001AC20;
  }
  return swift_task_switch(v7, 0, 0);
}

uint64_t sub_10001AB2C()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(void **)(v0 + 504);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 272);
  v7 = *(_QWORD *)(v0 + 248);
  v6 = *(_QWORD *)(v0 + 256);
  v8 = *(_QWORD *)(v0 + 240);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_1000068A0(v2, &qword_100042528);
  v9 = *(_QWORD *)(v0 + 344);
  v11 = *(_QWORD *)(v0 + 328);
  v10 = *(_QWORD *)(v0 + 336);
  v13 = *(_QWORD *)(v0 + 312);
  v12 = *(_QWORD *)(v0 + 320);
  v15 = *(_QWORD *)(v0 + 280);
  v14 = *(_QWORD *)(v0 + 288);
  v16 = *(_QWORD *)(v0 + 256);
  swift_task_dealloc(*(_QWORD *)(v0 + 352));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001AC20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  id v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  NSString v55;
  void (*v56)(char *, uint64_t);
  Class isa;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(void);
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, char *, uint64_t);
  char *v82;
  void (*v83)(uint64_t, char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  _BOOL4 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  void (*v104)(uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  id v110;
  void *v111;
  uint64_t v112;
  void *v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t result;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  unint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  NSObject *v153;
  os_log_type_t v154;
  _BOOL4 v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void (*v175)(uint64_t, uint64_t);
  uint64_t v176;
  void (*v177)(char *, char *, uint64_t);
  uint64_t v178;
  uint64_t v179;
  void *v180;
  NSObject *log;
  os_log_t loga;
  uint64_t v183;
  void *v184;
  _QWORD *v185;
  char *v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  os_log_type_t type[8];
  os_log_type_t typea;
  os_log_type_t typeb[8];
  NSObject *typec;
  uint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  os_log_type_t v201[8];
  os_log_type_t v202;
  void *v203;
  uint64_t *v204;
  uint64_t v205;
  uint64_t v206;
  unint64_t v207;
  uint64_t v208;
  uint64_t v209[2];

  v204 = (uint64_t *)(v0 + 16);
  sub_100016D18(v0 + 16, v0 + 112, &qword_100042418);
  sub_100016D18(v0 + 112, v0 + 96, &qword_100042418);
  if (*(_QWORD *)(v0 + 104) >> 60 == 15)
  {
    v1 = *(_QWORD *)(v0 + 480);
    v2 = *(_QWORD *)(v0 + 368);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 424));
    swift_bridgeObjectRelease(v2);
    v3 = swift_bridgeObjectRelease(v1);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "The data for the messages paylaod obtained from the People extension was nil.", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }
    v7 = *(_QWORD *)(v0 + 560);
    v8 = *(void **)(v0 + 552);
    v9 = *(void **)(v0 + 544);
    v10 = *(void **)(v0 + 504);
    v11 = *(_QWORD *)(v0 + 344);
    v190 = *(void **)(v0 + 496);
    *(_QWORD *)type = *(_QWORD *)(v0 + 272);
    v198 = *(_QWORD *)(v0 + 264);
    *(_QWORD *)v201 = *(_QWORD *)(v0 + 288);
    v12 = *(_QWORD *)(v0 + 248);
    v187 = *(_QWORD *)(v0 + 256);
    v13 = *(_QWORD *)(v0 + 240);

    v14 = sub_10001F164();
    v15 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v14, 0, 0);
    *(_OWORD *)v16 = xmmword_1000308C0;
    *(_BYTE *)(v16 + 16) = 7;
    swift_willThrow(v15);
    swift_release(v7);

    sub_10000F564(v204);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v187, v13);
    (*(void (**)(os_log_type_t *, uint64_t))(*(_QWORD *)type + 8))(*(os_log_type_t **)v201, v198);
LABEL_17:
    sub_1000068A0(v11, &qword_100042528);
    v125 = *(_QWORD *)(v0 + 344);
    v127 = *(_QWORD *)(v0 + 328);
    v126 = *(_QWORD *)(v0 + 336);
    v129 = *(_QWORD *)(v0 + 312);
    v128 = *(_QWORD *)(v0 + 320);
    v131 = *(_QWORD *)(v0 + 280);
    v130 = *(_QWORD *)(v0 + 288);
    v132 = *(_QWORD *)(v0 + 256);
    swift_task_dealloc(*(_QWORD *)(v0 + 352));
    swift_task_dealloc(v125);
    swift_task_dealloc(v126);
    swift_task_dealloc(v127);
    swift_task_dealloc(v128);
    swift_task_dealloc(v129);
    swift_task_dealloc(v130);
    swift_task_dealloc(v131);
    swift_task_dealloc(v132);
    v67 = *(uint64_t (**)(void))(v0 + 8);
    return v67();
  }
  v17 = *(void **)(v0 + 544);
  v19 = *(_QWORD *)(v0 + 480);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 488);
  v21 = *(_QWORD *)(v0 + 320);
  v20 = *(_QWORD **)(v0 + 328);
  v22 = *(_QWORD *)(v0 + 312);
  v23 = *(_QWORD *)(v0 + 264);
  v24 = *(_QWORD *)(v0 + 344) + *(int *)(v0 + 592);
  v25 = (char *)v20 + *(int *)(*(_QWORD *)(v0 + 296) + 48);
  *v20 = *(_QWORD *)(v0 + 472);
  v20[1] = v19;
  v18(v25, v24, v23);
  sub_10001FFA4((uint64_t)v20, v21, &qword_100042528);
  sub_100016D18((uint64_t)v20, v22, &qword_100042528);
  v26 = v17;
  swift_bridgeObjectRetain(v19);
  v27 = v26;
  v28 = sub_10001FE8C(v0 + 112);
  v29 = Logger.logObject.getter(v28);
  v30 = static os_log_type_t.default.getter();
  v31 = os_log_type_enabled(v29, v30);
  v32 = *(void **)(v0 + 544);
  if (v31)
  {
    v33 = *(uint64_t **)(v0 + 336);
    v34 = *(uint64_t **)(v0 + 320);
    v183 = *(_QWORD *)(v0 + 312);
    typea = v30;
    v35 = *(_QWORD *)(v0 + 296);
    v36 = *(_QWORD *)(v0 + 264);
    v176 = *(_QWORD *)(v0 + 272);
    v177 = *(void (**)(char *, char *, uint64_t))(v0 + 488);
    v37 = swift_slowAlloc(22, -1);
    v185 = (_QWORD *)swift_slowAlloc(8, -1);
    v191 = swift_slowAlloc(32, -1);
    v209[0] = v191;
    *(_DWORD *)v37 = 136315394;
    v38 = *(int *)(v35 + 48);
    v39 = (char *)v33 + v38;
    log = v29;
    v41 = *v34;
    v40 = v34[1];
    *v33 = *v34;
    v33[1] = v40;
    v177((char *)v33 + v38, (char *)v34 + v38, v36);
    swift_bridgeObjectRetain(v40);
    (*(void (**)(char *, uint64_t))(v176 + 8))(v39, v36);
    *(_QWORD *)(v0 + 184) = sub_100027030(v41, v40, v209);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 184, v0 + 192, v37 + 4, v37 + 12);
    swift_bridgeObjectRelease(v40);
    sub_1000068A0(v183, &qword_100042528);
    sub_1000068A0((uint64_t)v34, &qword_100042528);
    *(_WORD *)(v37 + 12) = 2112;
    *(_QWORD *)(v0 + 192) = v32;
    v42 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200, v37 + 14, v37 + 22);
    *v185 = v32;

    _os_log_impl((void *)&_mh_execute_header, log, typea, "Updating message with GUID %s in Messages with response: %@", (uint8_t *)v37, 0x16u);
    v43 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v185, 1, v43);
    swift_slowDealloc(v185, -1, -1);
    swift_arrayDestroy(v191, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v191, -1, -1);
    swift_slowDealloc(v37, -1, -1);

  }
  else
  {
    v44 = *(_QWORD *)(v0 + 320);
    sub_1000068A0(*(_QWORD *)(v0 + 312), &qword_100042528);
    sub_1000068A0(v44, &qword_100042528);

  }
  v45 = *(_QWORD *)(v0 + 560);
  v46 = *(void **)(v0 + 552);
  v180 = *(void **)(v0 + 544);
  v184 = *(void **)(v0 + 504);
  v188 = *(void **)(v0 + 496);
  v48 = *(_QWORD *)(v0 + 480);
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 488);
  *(_QWORD *)typeb = *(_QWORD *)(v0 + 440);
  v49 = *(_QWORD **)(v0 + 336);
  v50 = *(_QWORD *)(v0 + 344);
  v186 = *(char **)(v0 + 288);
  v51 = *(_QWORD *)(v0 + 264);
  v52 = *(_QWORD *)(v0 + 272);
  loga = *(os_log_t *)(v0 + 256);
  v178 = *(_QWORD *)(v0 + 248);
  v179 = *(_QWORD *)(v0 + 240);
  v53 = v50 + *(int *)(v0 + 592);
  v192 = *(_QWORD *)(v0 + 464) + 1;
  v54 = (char *)v49 + *(int *)(*(_QWORD *)(v0 + 296) + 48);
  *v49 = *(_QWORD *)(v0 + 472);
  v49[1] = v48;
  v47(v54, v53, v51);
  v55 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v48);
  v56 = *(void (**)(char *, uint64_t))(v52 + 8);
  v56(v54, v51);
  isa = Data._bridgeToObjectiveC()().super.isa;
  IMSPIUpdatePluginMessageWithGUID(v55, isa);
  sub_10001FEB8(v0 + 112);

  swift_release(v45);
  sub_10000F564(v204);

  (*(void (**)(os_log_t, uint64_t))(v178 + 8))(loga, v179);
  v56(v186, v51);
  sub_1000068A0(v50, &qword_100042528);
  if (v192 == *(_QWORD *)typeb)
  {
    v58 = *(_QWORD *)(v0 + 368);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 424));
    swift_bridgeObjectRelease(v58);
    v59 = *(_QWORD *)(v0 + 344);
    v61 = *(_QWORD *)(v0 + 328);
    v60 = *(_QWORD *)(v0 + 336);
    v63 = *(_QWORD *)(v0 + 312);
    v62 = *(_QWORD *)(v0 + 320);
    v65 = *(_QWORD *)(v0 + 280);
    v64 = *(_QWORD *)(v0 + 288);
    v66 = *(_QWORD *)(v0 + 256);
    swift_task_dealloc(*(_QWORD *)(v0 + 352));
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    swift_task_dealloc(v63);
    swift_task_dealloc(v64);
    swift_task_dealloc(v65);
    swift_task_dealloc(v66);
    v67 = *(uint64_t (**)(void))(v0 + 8);
    return v67();
  }
  v189 = v0 + 160;
  v205 = *(_QWORD *)(v0 + 576);
  v68 = *(_QWORD *)(v0 + 456);
  v69 = *(_QWORD *)(v0 + 464) + 1;
  *(_QWORD *)(v0 + 464) = v69;
  v199 = *(_QWORD *)(v0 + 448);
  v70 = *(_QWORD **)(v0 + 344);
  v71 = *(uint64_t **)(v0 + 352);
  v72 = *(_QWORD *)(v0 + 336);
  v73 = *(_QWORD *)(v0 + 296);
  v75 = *(_QWORD *)(v0 + 264);
  v74 = *(_QWORD *)(v0 + 272);
  v193 = *(char **)(v0 + 288);
  v76 = (char *)v71 + *(int *)(v0 + 584);
  sub_10001FFA4(*(_QWORD *)(v0 + 424)+ ((*(unsigned __int8 *)(v0 + 588) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 588))+ v68 * v69, (uint64_t)v71, &qword_100042528);
  v77 = *(int *)(v73 + 48);
  *(_DWORD *)(v0 + 592) = v77;
  v78 = (char *)v70 + v77;
  v79 = *v71;
  *(_QWORD *)(v0 + 472) = *v71;
  v80 = v71[1];
  *(_QWORD *)(v0 + 480) = v80;
  *v70 = v79;
  v70[1] = v80;
  v81 = *(void (**)(char *, char *, uint64_t))(v74 + 32);
  v81(v78, v76, v75);
  v82 = (char *)(v72 + *(int *)(v73 + 48));
  v83 = *(void (**)(uint64_t, char *, uint64_t))(v74 + 16);
  *(_QWORD *)(v0 + 488) = v83;
  v83((uint64_t)v82, v78, v75);
  v81(v193, v82, v75);
  v84 = swift_bridgeObjectRetain(v80);
  ATURL.Parser.init()(v84);
  v85 = sub_10001F1A8(&qword_100042538, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  v86 = sub_10001F1A8(&qword_100042540, (uint64_t (*)(uint64_t))&type metadata accessor for ATPayload, (uint64_t)&protocol conformance descriptor for ATPayload);
  v87 = v205;
  ATURL.Parser.parse<A>(_:from:)(v199, v193, v199, v85, v86);
  if (v205)
  {
    v88 = *(_QWORD *)(v0 + 368);
    v90 = *(_QWORD *)(v0 + 280);
    v89 = *(char **)(v0 + 288);
    v91 = *(_QWORD *)(v0 + 264);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 424));
    swift_bridgeObjectRelease(v88);
    swift_bridgeObjectRelease(v80);
    v83(v90, v89, v91);
    swift_errorRetain(v205);
    v92 = swift_errorRetain(v205);
    v93 = Logger.logObject.getter(v92);
    v94 = static os_log_type_t.error.getter();
    v95 = os_log_type_enabled(v93, v94);
    v97 = *(_QWORD *)(v0 + 272);
    v96 = *(_QWORD *)(v0 + 280);
    v98 = *(_QWORD *)(v0 + 264);
    if (v95)
    {
      v202 = v94;
      v99 = swift_slowAlloc(22, -1);
      v200 = (uint64_t *)swift_slowAlloc(8, -1);
      v206 = swift_slowAlloc(32, -1);
      v209[0] = v206;
      *(_DWORD *)v99 = 136315394;
      v100 = sub_10001F1A8(&qword_100042550, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      v101 = dispatch thunk of CustomStringConvertible.description.getter(v98, v100);
      typec = v93;
      v103 = v102;
      *(_QWORD *)(v0 + 144) = sub_100027030(v101, v102, v209);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v99 + 4, v99 + 12);
      swift_bridgeObjectRelease(v103);
      v104 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
      v104(v96, v98);
      *(_WORD *)(v99 + 12) = 2112;
      swift_errorRetain(v87);
      v105 = _swift_stdlib_bridgeErrorToNSError(v87);
      *(_QWORD *)(v0 + 152) = v105;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 152, v189, v99 + 14, v99 + 22);
      *v200 = v105;
      swift_errorRelease(v87);
      swift_errorRelease(v87);
      _os_log_impl((void *)&_mh_execute_header, typec, v202, "Could not parse ATPayload from messagesPayloadURL %s. error: %@", (uint8_t *)v99, 0x16u);
      v106 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v200, 1, v106);
      swift_slowDealloc(v200, -1, -1);
      swift_arrayDestroy(v206, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v206, -1, -1);
      swift_slowDealloc(v99, -1, -1);

    }
    else
    {
      v104 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
      v104(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
      swift_errorRelease(v205);
      swift_errorRelease(v205);

    }
    v11 = *(_QWORD *)(v0 + 344);
    v117 = *(_QWORD *)(v0 + 288);
    v119 = *(_QWORD *)(v0 + 256);
    v118 = *(_QWORD *)(v0 + 264);
    v121 = *(_QWORD *)(v0 + 240);
    v120 = *(_QWORD *)(v0 + 248);
    v122 = sub_10001F164();
    v123 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v122, 0, 0);
    *(_QWORD *)v124 = v87;
    *(_QWORD *)(v124 + 8) = 0;
    *(_BYTE *)(v124 + 16) = 3;
    swift_willThrow(v123);
    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v119, v121);
    v104(v117, v118);
    goto LABEL_17;
  }
  v108 = *(_QWORD *)(v0 + 360);
  v107 = *(_QWORD *)(v0 + 368);
  v109 = *(void **)(v0 + 136);
  *(_QWORD *)(v0 + 496) = v109;
  v110 = v109;
  v111 = (void *)ATPayload.question.getter(v110);
  v112 = ATQuestion.answerChoices.getter();

  swift_bridgeObjectRetain(v107);
  v113 = sub_10001F1E8(v112, v108, v107);
  *(_QWORD *)(v0 + 504) = v113;
  swift_bridgeObjectRelease(v107);
  swift_bridgeObjectRelease(v112);
  if (v113)
  {
    v114 = (_QWORD *)swift_task_alloc(dword_10004255C);
    *(_QWORD *)(v0 + 512) = v114;
    *v114 = v0;
    v114[1] = sub_10001A8F8;
    v115 = *(_QWORD *)(v0 + 408);
    v114[16] = *(_QWORD *)(v0 + 400);
    v114[17] = v115;
    return swift_task_switch(sub_10001F580, 0, 0);
  }
  v133 = swift_bridgeObjectRelease(v80);
  v134 = (void *)ATPayload.question.getter(v133);

  v135 = ATQuestion.answerChoices.getter();
  if (!((unint64_t)v135 >> 62))
  {
    v136 = *(_QWORD *)((v135 & 0xFFFFFFFFFFFFF8) + 0x10);
    v203 = v110;
    if (v136)
      goto LABEL_21;
LABEL_34:
    v151 = *(_QWORD *)(v0 + 424);
    swift_bridgeObjectRelease(v135);
    swift_bridgeObjectRelease(v151);
    v138 = &_swiftEmptyArrayStorage;
LABEL_35:
    swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 368), 2);
    v152 = swift_bridgeObjectRetain(v138);
    v153 = Logger.logObject.getter(v152);
    v154 = static os_log_type_t.error.getter();
    v155 = os_log_type_enabled(v153, v154);
    v156 = *(_QWORD *)(v0 + 368);
    if (v155)
    {
      v157 = *(_QWORD *)(v0 + 360);
      v158 = swift_slowAlloc(22, -1);
      v159 = swift_slowAlloc(64, -1);
      v209[0] = v159;
      *(_DWORD *)v158 = 136315394;
      swift_bridgeObjectRetain(v156);
      *(_QWORD *)(v0 + 160) = sub_100027030(v157, v156, v209);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v189, v0 + 168, v158 + 4, v158 + 12);
      swift_bridgeObjectRelease_n(v156, 3);
      *(_WORD *)(v158 + 12) = 2080;
      v160 = swift_bridgeObjectRetain(v138);
      v161 = Array.description.getter(v160, &type metadata for String);
      v163 = v162;
      swift_bridgeObjectRelease(v138);
      *(_QWORD *)(v0 + 168) = sub_100027030(v161, v163, v209);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 168, v0 + 176, v158 + 14, v158 + 22);
      swift_bridgeObjectRelease(v163);
      swift_bridgeObjectRelease_n(v138, 2);
      _os_log_impl((void *)&_mh_execute_header, v153, v154, "No answer choice in the original question had id %s. originalAnswerIds: %s", (uint8_t *)v158, 0x16u);
      swift_arrayDestroy(v159, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v159, -1, -1);
      swift_slowDealloc(v158, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 368), 2);
      swift_bridgeObjectRelease_n(v138, 2);
    }

    v165 = *(_QWORD *)(v0 + 360);
    v164 = *(_QWORD *)(v0 + 368);
    v166 = *(_QWORD *)(v0 + 344);
    v208 = *(_QWORD *)(v0 + 288);
    v168 = *(_QWORD *)(v0 + 264);
    v167 = *(_QWORD *)(v0 + 272);
    v170 = *(_QWORD *)(v0 + 248);
    v169 = *(_QWORD *)(v0 + 256);
    v171 = *(_QWORD *)(v0 + 240);
    v172 = sub_10001F164();
    v173 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v172, 0, 0);
    *(_QWORD *)v174 = v165;
    *(_QWORD *)(v174 + 8) = v164;
    *(_BYTE *)(v174 + 16) = 1;
    swift_willThrow(v173);

    v175 = *(void (**)(uint64_t, uint64_t))(v170 + 8);
    v11 = v166;
    v175(v169, v171);
    (*(void (**)(uint64_t, uint64_t))(v167 + 8))(v208, v168);
    goto LABEL_17;
  }
  if (v135 < 0)
    v150 = v135;
  else
    v150 = v135 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v135);
  v136 = _CocoaArrayWrapper.endIndex.getter(v150);
  swift_bridgeObjectRelease(v135);
  v203 = v110;
  if (!v136)
    goto LABEL_34;
LABEL_21:
  v209[0] = (uint64_t)&_swiftEmptyArrayStorage;
  result = sub_10001E41C(0, v136 & ~(v136 >> 63), 0);
  if ((v136 & 0x8000000000000000) == 0)
  {
    v137 = 0;
    v138 = (_QWORD *)v209[0];
    v207 = v135 & 0xC000000000000001;
    v139 = v135;
    v140 = v136;
    do
    {
      if (v207)
        v141 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v137, v135);
      else
        v141 = *(id *)(v135 + 8 * v137 + 32);
      v142 = v141;
      v143 = ATAnswerChoice.id.getter();
      v145 = v144;

      v209[0] = (uint64_t)v138;
      v147 = v138[2];
      v146 = v138[3];
      if (v147 >= v146 >> 1)
      {
        sub_10001E41C(v146 > 1, v147 + 1, 1);
        v138 = (_QWORD *)v209[0];
      }
      ++v137;
      v138[2] = v147 + 1;
      v148 = (char *)&v138[2 * v147];
      *((_QWORD *)v148 + 4) = v143;
      *((_QWORD *)v148 + 5) = v145;
      v135 = v139;
    }
    while (v140 != v137);
    v149 = *(_QWORD *)(v0 + 424);
    swift_bridgeObjectRelease(v139);
    swift_bridgeObjectRelease(v149);
    goto LABEL_35;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001BAE0()
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = *(_QWORD *)(v0 + 576);
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 576);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 176) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 176, v0 + 184, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to get the new Messages payload from the People extension. error: %@", v6, 0xCu);
    v9 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 576);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
  }
  v11 = *(_QWORD *)(v0 + 576);
  v12 = *(_QWORD *)(v0 + 560);
  v13 = *(void **)(v0 + 552);
  v14 = *(void **)(v0 + 544);
  v15 = *(void **)(v0 + 504);
  v34 = *(_QWORD *)(v0 + 288);
  v35 = *(_QWORD *)(v0 + 344);
  v31 = *(void **)(v0 + 496);
  v32 = *(_QWORD *)(v0 + 272);
  v33 = *(_QWORD *)(v0 + 264);
  v16 = *(_QWORD *)(v0 + 248);
  v30 = *(_QWORD *)(v0 + 256);
  v17 = *(_QWORD *)(v0 + 240);

  v18 = sub_10001F164();
  swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v18, 0, 0);
  *(_QWORD *)v19 = v11;
  *(_QWORD *)(v19 + 8) = 0;
  *(_BYTE *)(v19 + 16) = 4;
  v20 = swift_errorRetain(v11);
  swift_willThrow(v20);
  swift_release(v12);

  swift_errorRelease(v11);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v30, v17);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  sub_1000068A0(v35, &qword_100042528);
  v21 = *(_QWORD *)(v0 + 344);
  v23 = *(_QWORD *)(v0 + 328);
  v22 = *(_QWORD *)(v0 + 336);
  v25 = *(_QWORD *)(v0 + 312);
  v24 = *(_QWORD *)(v0 + 320);
  v27 = *(_QWORD *)(v0 + 280);
  v26 = *(_QWORD *)(v0 + 288);
  v28 = *(_QWORD *)(v0 + 256);
  swift_task_dealloc(*(_QWORD *)(v0 + 352));
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001BD7C(uint64_t result, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  id v9;

  v3 = *(_QWORD *)(result + 32);
  if (a3)
  {
    v5 = sub_100005FF0(&qword_100041C88);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = a2;
    v9 = a2;
    return swift_continuation_throwingResume(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001BE08(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_10001BE40()
{
  uint64_t v0;
  void *v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;

  _StringGuts.grow(_:)(70);
  v2._countAndFlagsBits = 0xD000000000000043;
  v2._object = (void *)0x80000001000325C0;
  String.append(_:)(v2);
  v3._countAndFlagsBits = v0;
  v3._object = v1;
  String.append(_:)(v3);
  v4._countAndFlagsBits = 46;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0;
}

void sub_10001C1D0()
{
  JUMPOUT(0x10001C1BCLL);
}

void sub_10001C1F8()
{
  uint64_t v0;

  sub_10001BE08(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_10001C204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v7;
  NSString v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t aBlock[5];
  _QWORD *v22;

  v7 = swift_allocObject(&unk_10003E0D8, 24, 7);
  *(_QWORD *)(v7 + 16) = &_swiftEmptyArrayStorage;
  v8 = String._bridgeToObjectiveC()();
  v9 = (_QWORD *)swift_allocObject(&unk_10003E100, 40, 7);
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = v7;
  aBlock[4] = (uint64_t)sub_10001FF80;
  v22 = v9;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10001D5A4;
  aBlock[3] = (uint64_t)&unk_10003E118;
  v10 = _Block_copy(aBlock);
  v11 = v22;
  swift_bridgeObjectRetain(a5);
  swift_retain(v7);
  swift_release(v11);
  IMSPIBatchFetchMessageGUIDsWithBalloonBundleID(v8, 5, v10);
  _Block_release(v10);

  if (qword_100041908 != -1)
    swift_once(&qword_100041908, sub_100025D20);
  v12 = type metadata accessor for Logger(0);
  sub_1000036A4(v12, (uint64_t)qword_100043FB8);
  v13 = swift_bridgeObjectRetain_n(a5, 2);
  v14 = Logger.logObject.getter(v13);
  v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc(12, -1);
    v17 = swift_slowAlloc(32, -1);
    aBlock[0] = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain(a5);
    v20 = sub_100027030(a4, a5, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, aBlock, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease_n(a5, 3);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Resuming continuation for query with request ID %s", v16, 0xCu);
    swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a5, 2);
  }
  swift_beginAccess(v7 + 16, aBlock, 0, 0);
  v20 = *(_QWORD *)(v7 + 16);
  swift_bridgeObjectRetain(v20);
  v18 = sub_100005FF0(&qword_100042570);
  CheckedContinuation.resume(returning:)(&v20, v18);
  return swift_release(v7);
}

uint64_t sub_10001C4D0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  os_log_type_t v53;
  uint8_t *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(char *, unint64_t, uint64_t);
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  void (*v100)(uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(char *, uint64_t);
  char *v114;
  uint64_t v115;
  uint64_t v117;
  char *v118;
  unint64_t *v119;
  unint64_t v120;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v122;
  unint64_t v123;
  char *v124;
  uint64_t v125;
  NSObject *v126;
  os_log_type_t v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  char *v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153[3];
  uint64_t v154;
  uint64_t v155;

  v140 = a6;
  v148 = a3;
  v149 = a5;
  v9 = sub_100005FF0(&qword_100042528);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v141 = (uint64_t *)((char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v143 = type metadata accessor for URLQueryItem(0);
  v151 = *(_QWORD *)(v143 - 8);
  __chkstk_darwin(v143);
  v150 = (char *)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100005FF0(&qword_100042578);
  __chkstk_darwin(v13);
  v142 = (char *)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100005FF0(&qword_100041C50);
  __chkstk_darwin(v15);
  v146 = (char *)&v132 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URLComponents(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v132 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100005FF0(&qword_100041C58);
  __chkstk_darwin(v21);
  v23 = (char *)&v132 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for URL(0);
  v25 = __chkstk_darwin(v24);
  v26 = __chkstk_darwin(v25);
  v30 = (char *)&v132 - v29;
  if (!a2)
  {
    if (qword_100041908 != -1)
      swift_once(&qword_100041908, sub_100025D20);
    v45 = type metadata accessor for Logger(0);
    v46 = sub_1000036A4(v45, (uint64_t)qword_100043FB8);
    v47 = Logger.logObject.getter(v46);
    v48 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v47, v48))
      goto LABEL_15;
    v49 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Got back nil message GUID from IMSPI", v49, 2u);
    v50 = v49;
LABEL_14:
    swift_slowDealloc(v50, -1, -1);
LABEL_15:

    return 0;
  }
  v132 = v28;
  v139 = a4;
  v133 = v9;
  v31 = v26;
  v134 = v10;
  v145 = a1;
  v147 = v27;
  v32 = qword_100041908;
  swift_bridgeObjectRetain(a2);
  if (v32 != -1)
    swift_once(&qword_100041908, sub_100025D20);
  v33 = type metadata accessor for Logger(0);
  v34 = sub_1000036A4(v33, (uint64_t)qword_100043FB8);
  swift_bridgeObjectRetain_n(a2, 2);
  v35 = v149;
  v36 = swift_bridgeObjectRetain_n(v149, 2);
  v144 = v34;
  v37 = Logger.logObject.getter(v36);
  v38 = static os_log_type_t.debug.getter();
  v39 = os_log_type_enabled(v37, v38);
  v152 = a2;
  if (v39)
  {
    v40 = swift_slowAlloc(22, -1);
    v135 = v30;
    v41 = v40;
    v42 = swift_slowAlloc(64, -1);
    v153[0] = v42;
    *(_DWORD *)v41 = 136315394;
    v137 = v18;
    v138 = v20;
    v136 = v17;
    swift_bridgeObjectRetain(v152);
    v154 = sub_100027030(v145, v152, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v41 + 4, v41 + 12);
    swift_bridgeObjectRelease_n(v152, 3);
    *(_WORD *)(v41 + 12) = 2080;
    swift_bridgeObjectRetain(v35);
    v154 = sub_100027030(v139, v35, v153);
    v17 = v136;
    v18 = v137;
    v20 = v138;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v41 + 14, v41 + 22);
    swift_bridgeObjectRelease_n(v35, 3);
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Inspecting ScreenTime request message with GUID %s in Messages DB to see if it matches with request ID %s", (uint8_t *)v41, 0x16u);
    swift_arrayDestroy(v42, 2, (char *)&type metadata for Any + 8);
    v43 = v42;
    a2 = v152;
    swift_slowDealloc(v43, -1, -1);
    v44 = v41;
    v30 = v135;
    swift_slowDealloc(v44, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v35, 2);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  sub_10001FFA4(v148, (uint64_t)v23, &qword_100041C58);
  v51 = v147;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v147 + 48))(v23, 1, v31) == 1)
  {
    sub_1000068A0((uint64_t)v23, &qword_100041C58);
    v52 = swift_bridgeObjectRetain(a2);
    v47 = Logger.logObject.getter(v52);
    v53 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v47, v53))
    {

      swift_bridgeObjectRelease_n(a2, 2);
      return 0;
    }
    v54 = (uint8_t *)swift_slowAlloc(12, -1);
    v55 = a2;
    v56 = swift_slowAlloc(32, -1);
    v153[0] = v56;
    *(_DWORD *)v54 = 136315138;
    swift_bridgeObjectRetain(v55);
    v154 = sub_100027030(v145, v55, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v54 + 4, v54 + 12);
    swift_bridgeObjectRelease_n(v55, 3);
    _os_log_impl((void *)&_mh_execute_header, v47, v53, "Payload URL for message with GUID %s was nil. Skipping.", v54, 0xCu);
    swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v56, -1, -1);
    v50 = v54;
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v30, v23, v31);
  v57 = (uint64_t)v146;
  URLComponents.init(url:resolvingAgainstBaseURL:)(v30, 0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v57, 1, v17) == 1)
  {
    sub_1000068A0(v57, &qword_100041C50);
    v58 = swift_bridgeObjectRetain(a2);
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc(12, -1);
      v62 = a2;
      v63 = swift_slowAlloc(32, -1);
      v153[0] = v63;
      *(_DWORD *)v61 = 136315138;
      swift_bridgeObjectRetain(v62);
      v154 = sub_100027030(v145, v62, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v61 + 4, v61 + 12);
      swift_bridgeObjectRelease_n(v62, 3);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "URL components for message with GUID %s was nil. Skipping.", v61, 0xCu);
      swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v63, -1, -1);
      swift_slowDealloc(v61, -1, -1);

      (*(void (**)(char *, uint64_t))(v147 + 8))(v30, v31);
      return 0;
    }
    swift_bridgeObjectRelease_n(a2, 2);

    goto LABEL_47;
  }
  v137 = v18;
  v64 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 32))(v20, v57, v17);
  v138 = v20;
  v65 = URLComponents.queryItems.getter(v64);
  if (!v65)
    goto LABEL_42;
  v66 = v65;
  v67 = v31;
  v68 = *(_QWORD *)(v65 + 16);
  if (v68)
  {
    v136 = v17;
    v148 = v31;
    v69 = v65 + ((*(unsigned __int8 *)(v151 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v151 + 80));
    v70 = *(_QWORD *)(v151 + 72);
    v71 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v151 + 16);
    swift_bridgeObjectRetain(v65);
    v72 = v143;
    v73 = v150;
    while (1)
    {
      v74 = v71(v73, v69, v72);
      v75 = URLQueryItem.name.getter(v74);
      v77 = v76;
      if (v75 == 0x4974736575716572 && v76 == 0xE900000000000044)
      {
        swift_bridgeObjectRelease(v66);
        goto LABEL_33;
      }
      v78 = _stringCompareWithSmolCheck(_:_:expecting:)(v75, v76, 0x4974736575716572, 0xE900000000000044, 0);
      swift_bridgeObjectRelease(v77);
      if ((v78 & 1) != 0)
        break;
      v73 = v150;
      (*(void (**)(char *, uint64_t))(v151 + 8))(v150, v72);
      v69 += v70;
      --v68;
      a2 = v152;
      if (!v68)
      {
        swift_bridgeObjectRelease(v66);
        v79 = 1;
        v80 = v72;
        v67 = v148;
        v17 = v136;
        goto LABEL_30;
      }
    }
    v77 = v66;
    a2 = v152;
LABEL_33:
    swift_bridgeObjectRelease(v77);
    v81 = v151;
    v82 = (uint64_t)v142;
    (*(void (**)(char *, char *, uint64_t))(v151 + 32))(v142, v150, v72);
    v79 = 0;
    v80 = v72;
    v67 = v148;
    v17 = v136;
  }
  else
  {
    v79 = 1;
    v80 = v143;
LABEL_30:
    v81 = v151;
    v82 = (uint64_t)v142;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v81 + 56))(v82, v79, 1, v80);
  swift_bridgeObjectRelease(v66);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v81 + 48))(v82, 1, v80) == 1)
  {
    sub_1000068A0(v82, &qword_100042578);
    v31 = v67;
LABEL_42:
    v105 = swift_bridgeObjectRetain(a2);
    v106 = Logger.logObject.getter(v105);
    v107 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v106, v107))
    {
      v108 = (uint8_t *)swift_slowAlloc(12, -1);
      v109 = a2;
      v110 = swift_slowAlloc(32, -1);
      v153[0] = v110;
      v111 = v17;
      v112 = v31;
      *(_DWORD *)v108 = 136315138;
      swift_bridgeObjectRetain(v109);
      v154 = sub_100027030(v145, v109, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v108 + 4, v108 + 12);
      swift_bridgeObjectRelease_n(v109, 3);
      _os_log_impl((void *)&_mh_execute_header, v106, v107, "URL had no request ID for message with GUID %s. Skipping.", v108, 0xCu);
      swift_arrayDestroy(v110, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v110, -1, -1);
      swift_slowDealloc(v108, -1, -1);

      (*(void (**)(char *, uint64_t))(v137 + 8))(v138, v111);
      v113 = *(void (**)(char *, uint64_t))(v147 + 8);
      v114 = v30;
LABEL_44:
      v115 = v112;
LABEL_48:
      v113(v114, v115);
      return 0;
    }
    swift_bridgeObjectRelease_n(a2, 2);

    goto LABEL_46;
  }
  v83 = URLQueryItem.value.getter();
  v85 = v84;
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v82, v80);
  v31 = v67;
  if (!v85)
    goto LABEL_42;
  v86 = v149;
  if ((v83 != v139 || v85 != v149) && (_stringCompareWithSmolCheck(_:_:expecting:)(v83, v85, v139, v149, 0) & 1) == 0)
  {
    swift_bridgeObjectRetain_n(v86, 2);
    swift_bridgeObjectRetain(a2);
    v125 = swift_bridgeObjectRetain(v85);
    v126 = Logger.logObject.getter(v125);
    v127 = static os_log_type_t.debug.getter();
    v128 = v127;
    if (os_log_type_enabled(v126, v127))
    {
      v129 = swift_slowAlloc(32, -1);
      LODWORD(v152) = v128;
      v130 = v129;
      v151 = swift_slowAlloc(96, -1);
      v153[0] = v151;
      *(_DWORD *)v130 = 136315650;
      swift_bridgeObjectRetain(a2);
      v154 = sub_100027030(v145, a2, v153);
      v136 = v17;
      v112 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v130 + 4, v130 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      *(_WORD *)(v130 + 12) = 2080;
      swift_bridgeObjectRetain(v85);
      v154 = sub_100027030(v83, v85, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v130 + 14, v130 + 22);
      swift_bridgeObjectRelease_n(v85, 3);
      *(_WORD *)(v130 + 22) = 2080;
      swift_bridgeObjectRetain(v86);
      v154 = sub_100027030(v139, v86, v153);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v130 + 24, v130 + 32);
      swift_bridgeObjectRelease_n(v86, 3);
      _os_log_impl((void *)&_mh_execute_header, v126, (os_log_type_t)v152, "Message with GUID %s has request ID %s, is not for request with ID %s", (uint8_t *)v130, 0x20u);
      v131 = v151;
      swift_arrayDestroy(v151, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v131, -1, -1);
      swift_slowDealloc(v130, -1, -1);

      (*(void (**)(char *, uint64_t))(v137 + 8))(v138, v136);
      v113 = *(void (**)(char *, uint64_t))(v147 + 8);
      v114 = v30;
      goto LABEL_44;
    }
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease_n(v85, 2);
    swift_bridgeObjectRelease_n(v86, 2);

LABEL_46:
    (*(void (**)(char *, uint64_t))(v137 + 8))(v138, v17);
LABEL_47:
    v113 = *(void (**)(char *, uint64_t))(v147 + 8);
    v114 = v30;
    v115 = v31;
    goto LABEL_48;
  }
  v136 = v17;
  v151 = v140 + 16;
  swift_bridgeObjectRelease(v85);
  v87 = v30;
  v88 = v147;
  v89 = *(char **)(v147 + 16);
  v90 = v132;
  v135 = v87;
  v150 = v89;
  ((void (*)(uint64_t))v89)(v132);
  swift_bridgeObjectRetain_n(a2, 2);
  v91 = swift_bridgeObjectRetain_n(v86, 2);
  v92 = Logger.logObject.getter(v91);
  v93 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v92, v93))
  {
    v94 = swift_slowAlloc(32, -1);
    v148 = swift_slowAlloc(96, -1);
    v153[0] = v148;
    *(_DWORD *)v94 = 136315650;
    swift_bridgeObjectRetain(v86);
    v154 = sub_100027030(v139, v86, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v94 + 4, v94 + 12);
    swift_bridgeObjectRelease_n(v86, 3);
    *(_WORD *)(v94 + 12) = 2080;
    swift_bridgeObjectRetain(v152);
    v95 = v145;
    v154 = sub_100027030(v145, v152, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v94 + 14, v94 + 22);
    swift_bridgeObjectRelease_n(v152, 3);
    *(_WORD *)(v94 + 22) = 2080;
    v96 = sub_10001F1A8(&qword_100042550, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v97 = dispatch thunk of CustomStringConvertible.description.getter(v67, v96);
    v99 = v98;
    v154 = sub_100027030(v97, v98, v153);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v154, &v155, v94 + 24, v94 + 32);
    swift_bridgeObjectRelease(v99);
    v100 = *(void (**)(uint64_t, uint64_t))(v147 + 8);
    v100(v90, v67);
    _os_log_impl((void *)&_mh_execute_header, v92, v93, "Found a match! Request with ID %s has message GUID %s. Payload URL: %s", (uint8_t *)v94, 0x20u);
    v101 = v148;
    swift_arrayDestroy(v148, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v101, -1, -1);
    v102 = v94;
    a2 = v152;
    swift_slowDealloc(v102, -1, -1);

    v104 = v137;
    v103 = v138;
  }
  else
  {
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease_n(v86, 2);
    v100 = *(void (**)(uint64_t, uint64_t))(v88 + 8);
    v100(v90, v67);

    v104 = v137;
    v103 = v138;
    v95 = v145;
  }
  v117 = (uint64_t)v141;
  v118 = (char *)v141 + *(int *)(v133 + 48);
  *v141 = v95;
  *(_QWORD *)(v117 + 8) = a2;
  ((void (*)(char *, char *, uint64_t))v150)(v118, v135, v67);
  v119 = (unint64_t *)v151;
  swift_beginAccess(v151, v153, 33, 0);
  v120 = *v119;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v119);
  *v119 = v120;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v120 = sub_10001D9DC(0, *(_QWORD *)(v120 + 16) + 1, 1, v120);
    *v119 = v120;
  }
  v123 = *(_QWORD *)(v120 + 16);
  v122 = *(_QWORD *)(v120 + 24);
  v124 = v135;
  if (v123 >= v122 >> 1)
  {
    v120 = sub_10001D9DC(v122 > 1, v123 + 1, 1, v120);
    *v119 = v120;
  }
  *(_QWORD *)(v120 + 16) = v123 + 1;
  sub_100016D18(v117, v120+ ((*(unsigned __int8 *)(v134 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v134 + 80))+ *(_QWORD *)(v134 + 72) * v123, &qword_100042528);
  swift_endAccess(v153);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v103, v136);
  v100((uint64_t)v124, v67);
  return 0;
}

uint64_t sub_10001D5A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, char *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v17;

  v6 = sub_100005FF0(&qword_100041C58);
  __chkstk_darwin(v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  if (!a2)
  {
    v11 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v14 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
    goto LABEL_6;
  }
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  a2 = v12;
  if (!a3)
    goto LABEL_5;
LABEL_3:
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = type metadata accessor for URL(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 0, 1, v13);
LABEL_6:
  swift_retain(v9);
  v15 = v10(v11, a2, v8);
  swift_release(v9);
  swift_bridgeObjectRelease(a2);
  sub_1000068A0((uint64_t)v8, &qword_100041C58);
  return v15 & 1;
}

uint64_t sub_10001D6C8(char a1, int64_t a2, char a3, unint64_t a4)
{
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
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
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
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100005FF0(&qword_100042590);
  v11 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for URLQueryItem(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001E728(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

char *sub_10001D8D0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_100005FF0(&qword_1000426C0);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001FFE8(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001D9DC(char a1, int64_t a2, char a3, unint64_t a4)
{
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
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
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
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100005FF0(&qword_100042580);
  v11 = *(_QWORD *)(sub_100005FF0(&qword_100042528) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = sub_100005FF0(&qword_100042528);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002063C(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

unsigned __int8 *sub_10001DBEC(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001DCE4(a1, a2, a3);
}

unsigned __int8 *sub_10001DC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  swift_bridgeObjectRetain(a2);
  v4 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v6 = v4;
  v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v14 = v6;
    v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  v6 = sub_10001DF60(v4, v5);
  v11 = v10;
  swift_bridgeObjectRelease(v7);
  v7 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }
LABEL_7:
  v12 = sub_10001DCE4(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

unsigned __int8 *sub_10001DCE4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_10001DF60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = sub_10001DFDC(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_10001DFDC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = sub_10001E120(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_1000274C0(v12, 0);
      v5 = sub_10001E20C((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t sub_10001E120(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_100027524(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_100027524(a2, a3, a4);
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
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t sub_10001E20C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_100027524(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
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
          result = _StringObject.sharedUTF8.getter(a6, a7);
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
    result = sub_100027524(v12, a6, a7);
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
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
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

uint64_t sub_10001E41C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10001E454(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10001E438(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10001E5BC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10001E454(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
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
    v10 = sub_100005FF0(&qword_1000426C0);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001E5BC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
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
    v10 = sub_100005FF0(&qword_100042588);
    v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8])
      memmove(v14, v15, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001E728(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001E840(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2[7] = a1;
  v2[8] = a2;
  v3 = sub_100005FF0(&qword_100042528);
  v2[9] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[10] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[11] = swift_task_alloc(v5);
  v2[12] = swift_task_alloc(v5);
  return swift_task_switch(sub_10001E8B4, 0, 0);
}

uint64_t sub_10001E8B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_100041908 != -1)
    swift_once(&qword_100041908, sub_100025D20);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_1000036A4(v1, (uint64_t)qword_100043FB8);
  *(_QWORD *)(v0 + 104) = v2;
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v26 = v6;
    *(_DWORD *)v5 = 136315138;
    *(_QWORD *)(v0 + 48) = sub_100027030(0xD00000000000002CLL, 0x80000001000321D0, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v5 + 4, v5 + 12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s called", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);
  }

  v7 = (id)IMBalloonExtensionIDWithSuffix(IMBalloonBundleIdentifierLegacyScreenTime);
  if (v7)
  {
    v8 = v7;
    v10 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 64);
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v13 = v12;

    *(_QWORD *)(v0 + 112) = v13;
    v14 = (_QWORD *)swift_task_alloc(48);
    *(_QWORD *)(v0 + 120) = v14;
    v14[2] = v11;
    v14[3] = v13;
    v14[4] = v10;
    v14[5] = v9;
    v15 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
    *(_QWORD *)(v0 + 128) = v15;
    v16 = sub_100005FF0(&qword_100042568);
    *v15 = v0;
    v15[1] = sub_10001EBC0;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 16, 0, 0, 0xD00000000000002CLL, 0x80000001000321D0, sub_10001FF24, v14, v16);
  }
  else
  {
    v18 = Logger.logObject.getter(0);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "ScreenTime request messages extension bundle identifier was nil", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

    v21 = sub_10001F164();
    v22 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v21, 0, 0);
    *(_QWORD *)v23 = 0;
    *(_QWORD *)(v23 + 8) = 0;
    *(_BYTE *)(v23 + 16) = 7;
    v25 = *(_QWORD *)(v0 + 88);
    v24 = *(_QWORD *)(v0 + 96);
    swift_willThrow(v22);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10001EBC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 128));
  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(v1);
  return swift_task_switch(sub_10001EC28, 0, 0);
}

uint64_t sub_10001EC28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  unint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  os_log_type_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 64);
  if (*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRetain_n(*(_QWORD *)(v0 + 64), 2);
    v3 = swift_bridgeObjectRetain_n(v1, 2);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.default.getter();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(_QWORD *)(v0 + 64);
    if (v6)
    {
      v53 = v0 + 40;
      v8 = *(_QWORD *)(v0 + 56);
      v9 = swift_slowAlloc(22, -1);
      v52 = swift_slowAlloc(64, -1);
      v59 = v52;
      *(_DWORD *)v9 = 136315394;
      swift_bridgeObjectRetain(v7);
      *(_QWORD *)(v0 + 24) = sub_100027030(v8, v7, &v59);
      v51 = (uint64_t *)(v0 + 32);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v9 + 4, v9 + 12);
      swift_bridgeObjectRelease_n(v7, 3);
      *(_WORD *)(v9 + 12) = 2080;
      v10 = *(_QWORD *)(v1 + 16);
      v11 = &_swiftEmptyArrayStorage;
      if (v10)
      {
        v47 = v5;
        v48 = v9;
        v49 = v4;
        v12 = *(_QWORD *)(v0 + 80);
        v57 = *(_QWORD *)(v0 + 88);
        v58 = *(_QWORD *)(v0 + 96);
        v56 = *(_QWORD *)(v0 + 72);
        v60 = &_swiftEmptyArrayStorage;
        sub_10001E41C(0, v10, 0);
        v50 = v1;
        v13 = v1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
        v54 = v0;
        v55 = *(_QWORD *)(v12 + 72);
        do
        {
          v15 = *(uint64_t **)(v0 + 88);
          v14 = *(uint64_t **)(v0 + 96);
          sub_10001FFA4(v13, (uint64_t)v14, &qword_100042528);
          v16 = *(int *)(v56 + 48);
          v17 = (char *)v15 + v16;
          v18 = (char *)v14 + v16;
          v19 = *v14;
          v20 = *(_QWORD *)(v58 + 8);
          *v15 = *v14;
          *(_QWORD *)(v57 + 8) = v20;
          v21 = type metadata accessor for URL(0);
          v22 = *(_QWORD *)(v21 - 8);
          (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v17, v18, v21);
          v23 = *(void (**)(char *, uint64_t))(v22 + 8);
          swift_bridgeObjectRetain(v20);
          v23(v17, v21);
          sub_1000068A0((uint64_t)v14, &qword_100042528);
          v11 = v60;
          if ((swift_isUniquelyReferenced_nonNull_native(v60) & 1) == 0)
          {
            sub_10001E41C(0, v11[2] + 1, 1);
            v11 = v60;
          }
          v25 = v11[2];
          v24 = v11[3];
          v0 = v54;
          if (v25 >= v24 >> 1)
          {
            sub_10001E41C(v24 > 1, v25 + 1, 1);
            v11 = v60;
          }
          v11[2] = v25 + 1;
          v26 = (char *)&v11[2 * v25];
          *((_QWORD *)v26 + 4) = v19;
          *((_QWORD *)v26 + 5) = v20;
          v13 += v55;
          --v10;
        }
        while (v10);
        v4 = v49;
        v1 = v50;
        v9 = v48;
        v5 = v47;
      }
      v35 = Array.description.getter(v11, &type metadata for String);
      v37 = v36;
      swift_bridgeObjectRelease(v11);
      *v51 = sub_100027030(v35, v37, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v51, v53, v9 + 14, v9 + 22);
      swift_bridgeObjectRelease(v37);
      swift_bridgeObjectRelease_n(v1, 2);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Matching messages for request ID %s have message GUIDs %s", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy(v52, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v52, -1, -1);
      swift_slowDealloc(v9, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 64), 2);
      swift_bridgeObjectRelease_n(v1, 2);
    }

    v38 = *(_QWORD *)(v0 + 88);
    swift_task_dealloc(*(_QWORD *)(v0 + 96));
    swift_task_dealloc(v38);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
    v27 = swift_bridgeObjectRetain_n(v2, 2);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.error.getter();
    v30 = os_log_type_enabled(v28, v29);
    v31 = *(_QWORD *)(v0 + 64);
    if (v30)
    {
      v32 = *(_QWORD *)(v0 + 56);
      v33 = (uint8_t *)swift_slowAlloc(12, -1);
      v34 = (_QWORD *)swift_slowAlloc(32, -1);
      v60 = v34;
      *(_DWORD *)v33 = 136315138;
      swift_bridgeObjectRetain(v31);
      *(_QWORD *)(v0 + 40) = sub_100027030(v32, v31, (uint64_t *)&v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v33 + 4, v33 + 12);
      swift_bridgeObjectRelease_n(v31, 3);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "No ScreenTime request message in the Messages DB matched request ID %s", v33, 0xCu);
      swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v33, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 64), 2);
    }

    v41 = *(_QWORD *)(v0 + 56);
    v40 = *(_QWORD *)(v0 + 64);
    v42 = sub_10001F164();
    swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v42, 0, 0);
    *(_QWORD *)v43 = v41;
    *(_QWORD *)(v43 + 8) = v40;
    *(_BYTE *)(v43 + 16) = 2;
    v45 = *(_QWORD *)(v0 + 88);
    v44 = *(_QWORD *)(v0 + 96);
    v46 = swift_bridgeObjectRetain(v40);
    swift_willThrow(v46);
    swift_task_dealloc(v44);
    swift_task_dealloc(v45);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

unint64_t sub_10001F164()
{
  unint64_t result;

  result = qword_100042548;
  if (!qword_100042548)
  {
    result = swift_getWitnessTable(&unk_100030B00, &type metadata for ScreenTimeAnswerHandler.Error);
    atomic_store(result, (unint64_t *)&qword_100042548);
  }
  return result;
}

uint64_t sub_10001F1A8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void *sub_10001F1E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  if ((unint64_t)a1 >> 62)
    goto LABEL_17;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v15))
  {
    v7 = 4;
    while (1)
    {
      v8 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a1)
         : *(id *)(a1 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = ATAnswerChoice.id.getter();
      v13 = v12;
      if (v11 == a2 && v12 == a3)
      {
        swift_bridgeObjectRelease(a1);
LABEL_15:
        swift_bridgeObjectRelease(a3);
        return v9;
      }
      v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease(v13);
      if ((v14 & 1) != 0)
      {
        a3 = a1;
        goto LABEL_15;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_21;
    }
    __break(1u);
LABEL_17:
    if (a1 < 0)
      v15 = a1;
    else
      v15 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_21:
  swift_bridgeObjectRelease(a1);
  return 0;
}

void *sub_10001F350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  void *v23;

  if ((unint64_t)a1 >> 62)
    goto LABEL_20;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v21))
  {
    v7 = 4;
    while (1)
    {
      v8 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, a1)
         : *(id *)(a1 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = objc_msgSend(v8, "dsid");
      if (v11)
      {
        v12 = v11;
        v23 = v9;
        v13 = a2;
        v14 = a3;
        v15 = objc_msgSend(v11, "stringValue");

        v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
        v18 = v17;

        a3 = v14;
        if (v16 == v13 && v18 == v14)
        {
          swift_bridgeObjectRelease(a1);
          v9 = v23;
          goto LABEL_18;
        }
        a2 = v13;
        v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, a3, v16, v18, 0);
        swift_bridgeObjectRelease(v18);
        v9 = v23;
        if ((v20 & 1) != 0)
        {
          a3 = a1;
LABEL_18:
          swift_bridgeObjectRelease(a3);
          return v9;
        }
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_24;
    }
    __break(1u);
LABEL_20:
    if (a1 < 0)
      v21 = a1;
    else
      v21 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_24:
  swift_bridgeObjectRelease(a1);
  return 0;
}

uint64_t sub_10001F51C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return swift_task_switch(sub_10001F580, 0, 0);
}

uint64_t sub_10001F580()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0 + 2;
  v2 = objc_msgSend(objc_allocWithZone((Class)FAFetchFamilyCircleRequest), "init");
  v0[18] = v2;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10001F664;
  v3 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_10001BD7C;
  v4[3] = &unk_10003E0B0;
  v4[4] = v3;
  objc_msgSend(v2, "startRequestWithCompletionHandler:", v4);
  return swift_continuation_await(v1);
}

uint64_t sub_10001F664()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 152) = v1;
  if (v1)
    v2 = sub_10001FC70;
  else
    v2 = sub_10001F708;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001F708()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(void **)(v0 + 120);
  v4 = objc_msgSend(v3, "members");
  v5 = sub_10001FEE4();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  swift_bridgeObjectRetain(v2);
  v7 = sub_10001F350(v6, v1, v2);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v6);
  if (v7 && (v8 = objc_msgSend(v7, "appleID")) != 0)
  {
    v9 = v8;
    v10 = *(void **)(v0 + 144);
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v13 = v12;

    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v11, v13);
  }
  else
  {
    v46 = v3;
    if (qword_100041908 != -1)
      swift_once(&qword_100041908, sub_100025D20);
    v15 = (_QWORD *)(v0 + 80);
    v16 = *(_QWORD *)(v0 + 136);
    v45 = type metadata accessor for Logger(0);
    sub_1000036A4(v45, (uint64_t)qword_100043FB8);
    v17 = v7;
    swift_bridgeObjectRetain_n(v16, 2);
    v18 = v17;
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.error.getter();
    v21 = os_log_type_enabled(v19, v20);
    v22 = *(_QWORD *)(v0 + 136);
    if (v21)
    {
      v23 = *(_QWORD *)(v0 + 128);
      v24 = swift_slowAlloc(22, -1);
      v43 = (_QWORD *)swift_slowAlloc(8, -1);
      v44 = swift_slowAlloc(32, -1);
      v47 = v44;
      *(_DWORD *)v24 = 136315394;
      swift_bridgeObjectRetain(v22);
      *(_QWORD *)(v0 + 80) = sub_100027030(v23, v22, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v24 + 4, v24 + 12);
      swift_bridgeObjectRelease_n(v22, 3);
      *(_WORD *)(v24 + 12) = 2112;
      if (v7)
      {
        *v15 = v18;
        v25 = v18;
      }
      else
      {
        *v15 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v24 + 14, v24 + 22);
      *v43 = v7;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Responder lacked Apple ID. DSID: %s, member: %@", (uint8_t *)v24, 0x16u);
      v26 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v43, 1, v26);
      swift_slowDealloc(v43, -1, -1);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v22, 2);

    }
    v28 = *(_QWORD *)(v0 + 136);
    v27 = *(void **)(v0 + 144);
    v29 = *(_QWORD *)(v0 + 128);
    v30 = sub_10001F164();
    v31 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v30, 0, 0);
    *(_QWORD *)v32 = v29;
    *(_QWORD *)(v32 + 8) = v28;
    *(_BYTE *)(v32 + 16) = 6;
    v33 = swift_bridgeObjectRetain(v28);
    swift_willThrow(v33);

    if (qword_100041908 != -1)
      swift_once(&qword_100041908, sub_100025D20);
    sub_1000036A4(v45, (uint64_t)qword_100043FB8);
    swift_errorRetain(v31);
    v34 = swift_errorRetain(v31);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v37 = 138412290;
      swift_errorRetain(v31);
      v39 = _swift_stdlib_bridgeErrorToNSError(v31);
      *(_QWORD *)(v0 + 80) = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v37 + 4, v37 + 12);
      *v38 = v39;
      swift_errorRelease(v31);
      swift_errorRelease(v31);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Failed to fetch family members. error: %@", v37, 0xCu);
      v40 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v38, 1, v40);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);
    }
    else
    {
      swift_errorRelease(v31);
      swift_errorRelease(v31);
    }

    v41 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v30, 0, 0);
    *(_QWORD *)v42 = v31;
    *(_QWORD *)(v42 + 8) = 0;
    *(_BYTE *)(v42 + 16) = 5;
    swift_willThrow(v41);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10001FC70(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(void **)(v1 + 144);
  swift_willThrow(a1);

  v3 = *(_QWORD *)(v1 + 152);
  if (qword_100041908 != -1)
    swift_once(&qword_100041908, sub_100025D20);
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043FB8);
  swift_errorRetain(v3);
  v5 = swift_errorRetain(v3);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    swift_errorRetain(v3);
    v10 = _swift_stdlib_bridgeErrorToNSError(v3);
    *(_QWORD *)(v1 + 80) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 80, v1 + 88, v8 + 4, v8 + 12);
    *v9 = v10;
    swift_errorRelease(v3);
    swift_errorRelease(v3);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failed to fetch family members. error: %@", v8, 0xCu);
    v11 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }
  else
  {
    swift_errorRelease(v3);
    swift_errorRelease(v3);
  }

  v12 = sub_10001F164();
  v13 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v12, 0, 0);
  *(_QWORD *)v14 = v3;
  *(_QWORD *)(v14 + 8) = 0;
  *(_BYTE *)(v14 + 16) = 5;
  swift_willThrow(v13);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10001FE8C(uint64_t a1)
{
  sub_100006B60(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_10001FEB8(uint64_t a1)
{
  sub_1000068DC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

unint64_t sub_10001FEE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042560;
  if (!qword_100042560)
  {
    v1 = objc_opt_self(FAFamilyMember);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100042560);
  }
  return result;
}

uint64_t sub_10001FF24(uint64_t a1)
{
  uint64_t v1;

  return sub_10001C204(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_10001FF30()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001FF54()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001FF80(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10001C4D0(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t sub_10001FF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001FF9C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001FFA4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005FF0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001FFE8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_1000200D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  unsigned __int8 *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int8 *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 *v47;
  unsigned int v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[2];
  uint64_t v54;
  uint64_t v55;

  result = ATAnswerChoice.id.getter();
  v14 = v13;
  v15 = HIBYTE(v13) & 0xF;
  v16 = result & 0xFFFFFFFFFFFFLL;
  if ((v14 & 0x2000000000000000) != 0)
    v17 = v15;
  else
    v17 = result & 0xFFFFFFFFFFFFLL;
  if (v17)
  {
    v51 = a1;
    if ((v14 & 0x1000000000000000) != 0)
    {
      v18 = a3;
      v20 = (uint64_t)sub_10001DC00(result, v14, 10);
      v22 = v50;
      goto LABEL_33;
    }
    if ((v14 & 0x2000000000000000) == 0)
    {
      v18 = a3;
      if ((result & 0x1000000000000000) != 0)
        v19 = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v19 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(result, v14);
      v20 = (uint64_t)sub_10001DCE4(v19, v16, 10);
      v22 = v21 & 1;
      goto LABEL_33;
    }
    v53[0] = result;
    v53[1] = v14 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v15)
        goto LABEL_65;
      if (v15 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_31;
      v20 = (BYTE1(result) - 48);
      if (v15 == 2)
        goto LABEL_43;
      if ((BYTE2(result) - 48) > 9u)
        goto LABEL_31;
      v18 = a3;
      v20 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
      v23 = v15 - 3;
      if (v23)
      {
        v24 = (unsigned __int8 *)v53 + 3;
        while (1)
        {
          v25 = *v24 - 48;
          if (v25 > 9)
            goto LABEL_32;
          v26 = 10 * v20;
          if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63)
            goto LABEL_32;
          v20 = v26 + v25;
          if (__OFADD__(v26, v25))
            goto LABEL_32;
          v22 = 0;
          ++v24;
          if (!--v23)
            goto LABEL_33;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v15)
        {
          if (v15 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            if (v15 == 2)
            {
              v18 = a3;
              v22 = 0;
              v20 = -(uint64_t)(BYTE1(result) - 48);
LABEL_33:
              result = swift_bridgeObjectRelease(v14);
              if ((v22 & 1) == 0)
              {
                *a6 = v51;
                a6[1] = a2;
                a6[2] = v18;
                a6[3] = a4;
                a6[4] = v20;
                return result;
              }
              swift_bridgeObjectRelease(a4);
              v27 = a2;
              goto LABEL_36;
            }
            if ((BYTE2(result) - 48) <= 9u)
            {
              v18 = a3;
              v20 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
              v46 = v15 - 3;
              if (!v46)
                goto LABEL_54;
              v47 = (unsigned __int8 *)v53 + 3;
              while (1)
              {
                v48 = *v47 - 48;
                if (v48 > 9)
                  break;
                v49 = 10 * v20;
                if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63)
                  break;
                v20 = v49 - v48;
                if (__OFSUB__(v49, v48))
                  break;
                v22 = 0;
                ++v47;
                if (!--v46)
                  goto LABEL_33;
              }
LABEL_32:
              v20 = 0;
              v22 = 1;
              goto LABEL_33;
            }
          }
LABEL_31:
          v18 = a3;
          goto LABEL_32;
        }
        __break(1u);
LABEL_65:
        __break(1u);
        return result;
      }
      if (!v15 || (result - 48) > 9u)
        goto LABEL_31;
      v20 = (result - 48);
      if (v15 == 1)
      {
LABEL_43:
        v18 = a3;
        v22 = 0;
        goto LABEL_33;
      }
      if ((BYTE1(result) - 48) > 9u)
        goto LABEL_31;
      v18 = a3;
      v20 = 10 * (result - 48) + (BYTE1(result) - 48);
      v42 = v15 - 2;
      if (v42)
      {
        v43 = (unsigned __int8 *)v53 + 2;
        while (1)
        {
          v44 = *v43 - 48;
          if (v44 > 9)
            goto LABEL_32;
          v45 = 10 * v20;
          if ((unsigned __int128)(v20 * (__int128)10) >> 64 != (10 * v20) >> 63)
            goto LABEL_32;
          v20 = v45 + v44;
          if (__OFADD__(v45, v44))
            goto LABEL_32;
          v22 = 0;
          ++v43;
          if (!--v42)
            goto LABEL_33;
        }
      }
    }
LABEL_54:
    v22 = 0;
    goto LABEL_33;
  }
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a2);
  v27 = v14;
LABEL_36:
  swift_bridgeObjectRelease(v27);
  if (qword_100041908 != -1)
    swift_once(&qword_100041908, sub_100025D20);
  v28 = type metadata accessor for Logger(0);
  sub_1000036A4(v28, (uint64_t)qword_100043FB8);
  v29 = a5;
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc(22, -1);
    v33 = (_QWORD *)swift_slowAlloc(8, -1);
    v52 = swift_slowAlloc(32, -1);
    v53[0] = v52;
    *(_DWORD *)v32 = 136315394;
    v54 = sub_100027030(0xD000000000000025, 0x80000001000322C0, v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v32 + 4, v32 + 12);
    *(_WORD *)(v32 + 12) = 2112;
    v54 = (uint64_t)v29;
    v34 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v32 + 14, v32 + 22);
    *v33 = v29;

    _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s Unable to derive STAskForTimeAnswer from AskTo answer choice: %@", (uint8_t *)v32, 0x16u);
    v35 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v33, 1, v35);
    swift_slowDealloc(v33, -1, -1);
    swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v52, -1, -1);
    swift_slowDealloc(v32, -1, -1);

  }
  else
  {

  }
  v36 = ATAnswerChoice.id.getter();
  v38 = v37;
  v39 = sub_10001F164();
  v40 = swift_allocError(&type metadata for ScreenTimeAnswerHandler.Error, v39, 0, 0);
  *(_QWORD *)v41 = v36;
  *(_QWORD *)(v41 + 8) = v38;
  *(_BYTE *)(v41 + 16) = 0;
  return swift_willThrow(v40);
}

uint64_t sub_10002063C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(sub_100005FF0(&qword_100042528) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002075C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      result = swift_bridgeObjectRetain(a2);
      break;
    case 3:
    case 4:
    case 5:
      result = swift_errorRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for ScreenTimeAnswerHandler.Error(uint64_t a1)
{
  return sub_1000207A4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1000207A4(uint64_t result, uint64_t a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 6:
      result = swift_bridgeObjectRelease(a2);
      break;
    case 3:
    case 4:
    case 5:
      result = swift_errorRelease(result);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _s6asktod23ScreenTimeAnswerHandlerV5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10002075C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ScreenTimeAnswerHandler.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10002075C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1000207A4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ScreenTimeAnswerHandler.Error(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1000207A4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScreenTimeAnswerHandler.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 249);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 7)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ScreenTimeAnswerHandler.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 249;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_100020948(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 6u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 7);
}

uint64_t sub_100020960(uint64_t result, unsigned int a2)
{
  if (a2 >= 7)
  {
    *(_QWORD *)result = a2 - 7;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 7;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeAnswerHandler.Error()
{
  return &type metadata for ScreenTimeAnswerHandler.Error;
}

uint64_t sub_10002098C(uint64_t a1)
{
  uint64_t v1;
  uint64_t MetatypeMetadata;
  uint64_t DynamicType;

  DynamicType = swift_getDynamicType(v1, a1, 0);
  MetatypeMetadata = swift_getMetatypeMetadata(a1);
  return String.init<A>(describing:)(&DynamicType, MetatypeMetadata);
}

unint64_t sub_1000209D8(char a1)
{
  unint64_t result;

  result = 0xD000000000000010;
  if (a1)
  {
    if (a1 == 1)
      return 0xD00000000000002FLL;
    else
      return 0xD000000000000025;
  }
  return result;
}

uint64_t sub_100020A38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100014758(*a1, *a2);
}

Swift::Int sub_100020A44()
{
  char *v0;

  return sub_100020A4C(*v0);
}

Swift::Int sub_100020A4C(char a1)
{
  unint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v2 = 0xD000000000000010;
  Hasher.init(_seed:)(v5, 0);
  if (a1)
  {
    if (a1 == 1)
      v2 = 0xD00000000000002FLL;
    else
      v2 = 0xD000000000000025;
    if (a1 == 1)
      v3 = 0x80000001000311D0;
    else
      v3 = 0x8000000100031200;
  }
  else
  {
    v3 = 0x80000001000311B0;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100020AF4(uint64_t a1)
{
  char *v1;

  return sub_100020AFC(a1, *v1);
}

uint64_t sub_100020AFC(uint64_t a1, char a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = 0xD000000000000010;
  if (a2)
  {
    if (a2 == 1)
      v3 = 0xD00000000000002FLL;
    else
      v3 = 0xD000000000000025;
    if (a2 == 1)
      v4 = 0x80000001000311D0;
    else
      v4 = 0x8000000100031200;
  }
  else
  {
    v4 = 0x80000001000311B0;
  }
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_100020B7C(uint64_t a1)
{
  char *v1;

  return sub_100020B84(a1, *v1);
}

Swift::Int sub_100020B84(uint64_t a1, char a2)
{
  unint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v3 = 0xD000000000000010;
  Hasher.init(_seed:)(v6, a1);
  if (a2)
  {
    if (a2 == 1)
      v3 = 0xD00000000000002FLL;
    else
      v3 = 0xD000000000000025;
    if (a2 == 1)
      v4 = 0x80000001000311D0;
    else
      v4 = 0x8000000100031200;
  }
  else
  {
    v4 = 0x80000001000311B0;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_100020C28@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100020E20(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_100020C54@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = sub_1000209D8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for Entitlement(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Entitlement(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100020D58 + 4 * byte_100030B71[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100020D8C + 4 * asc_100030B6C[v4]))();
}

uint64_t sub_100020D8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100020D94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100020D9CLL);
  return result;
}

uint64_t sub_100020DA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100020DB0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100020DB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100020DBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Entitlement()
{
  return &type metadata for Entitlement;
}

unint64_t sub_100020DDC()
{
  unint64_t result;

  result = qword_100042598[0];
  if (!qword_100042598[0])
  {
    result = swift_getWitnessTable(&unk_100030C10, &type metadata for Entitlement);
    atomic_store(result, qword_100042598);
  }
  return result;
}

unint64_t sub_100020E20(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003CE80, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

uint64_t sub_100020E68(uint64_t a1)
{
  char *v2;

  v2 = (char *)&value witness table for Builtin.BridgeObject + 64;
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 96);
}

uint64_t sub_100020EB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t AssociatedConformanceWitness;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[3];
  uint64_t MetatypeMetadata;
  uint64_t v35;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v5 = *(_QWORD *)(v4 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v5, v3, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v9 = (char *)&v29 - v8;
  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v10 = type metadata accessor for Logger(0);
  sub_1000036A4(v10, (uint64_t)qword_100043F10);
  v11 = swift_unknownObjectRetain_n(a1, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v30 = v5;
    v15 = v14;
    v29 = swift_slowAlloc(64, -1);
    v33[0] = v29;
    *(_DWORD *)v15 = 136315394;
    v16 = swift_getAssociatedTypeWitness(0, v4, v3, &unk_100036BC8, &unk_100036BE8);
    MetatypeMetadata = swift_getMetatypeMetadata(v16);
    v17 = swift_getMetatypeMetadata(MetatypeMetadata);
    v18 = String.init<A>(describing:)(&MetatypeMetadata, v17);
    v31 = v7;
    v20 = v19;
    MetatypeMetadata = sub_100027030(v18, v19, v33);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&MetatypeMetadata, &v35, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v20);
    *(_WORD *)(v15 + 12) = 2080;
    MetatypeMetadata = a1;
    v21 = dispatch thunk of CustomStringConvertible.description.getter(v3, *(_QWORD *)(v4 + 8));
    v23 = v22;
    MetatypeMetadata = sub_100027030(v21, v22, v33);
    v7 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&MetatypeMetadata, &v35, v15 + 14, v15 + 22);
    swift_unknownObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v23);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s connection invalidated. Removing client %s", (uint8_t *)v15, 0x16u);
    v24 = v29;
    swift_arrayDestroy(v29, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    v25 = v15;
    v5 = v30;
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n(a1, 2);
  }
  v33[0] = a1;
  dispatch thunk of Identifiable.id.getter(v3, v5);
  swift_beginAccess(v32 + 16, v33, 33, 0);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v5, v3, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v27 = type metadata accessor for Dictionary(0, AssociatedTypeWitness, v3, AssociatedConformanceWitness);
  Dictionary.removeValue(forKey:)(&MetatypeMetadata, v9, v27);
  swift_endAccess(v33);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  return swift_unknownObjectRelease(MetatypeMetadata);
}

uint64_t sub_1000211D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t AssociatedConformanceWitness;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35[3];
  uint64_t MetatypeMetadata;
  uint64_t v37;

  v2 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v6 = *(_QWORD *)(v5 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, v6, v4, &protocol requirements base descriptor for Identifiable, &associated type descriptor for Identifiable.ID);
  __chkstk_darwin(AssociatedTypeWitness);
  v9 = (char *)&v31 - v8;
  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v10 = type metadata accessor for Logger(0);
  sub_1000036A4(v10, (uint64_t)qword_100043F10);
  v11 = swift_unknownObjectRetain_n(a1, 2);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(22, -1);
    v32 = v1;
    v15 = v14;
    v16 = swift_slowAlloc(64, -1);
    v34 = v9;
    v35[0] = v16;
    v17 = v16;
    *(_DWORD *)v15 = 136315394;
    v18 = swift_getAssociatedTypeWitness(0, v5, v4, &unk_100036BC8, &unk_100036BE8);
    MetatypeMetadata = swift_getMetatypeMetadata(v18);
    v19 = swift_getMetatypeMetadata(MetatypeMetadata);
    v20 = String.init<A>(describing:)(&MetatypeMetadata, v19);
    v33 = v6;
    v22 = v21;
    MetatypeMetadata = sub_100027030(v20, v21, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&MetatypeMetadata, &v37, v15 + 4, v15 + 12);
    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v15 + 12) = 2080;
    MetatypeMetadata = a1;
    v23 = dispatch thunk of CustomStringConvertible.description.getter(v4, *(_QWORD *)(v5 + 8));
    v25 = v24;
    MetatypeMetadata = sub_100027030(v23, v24, v35);
    v6 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&MetatypeMetadata, &v37, v15 + 14, v15 + 22);
    swift_unknownObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v25);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s connection activated. Tracking client %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v17, 2, (char *)&type metadata for Any + 8);
    v26 = v17;
    v9 = v34;
    swift_slowDealloc(v26, -1, -1);
    v27 = v15;
    v2 = v32;
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n(a1, 2);
  }
  v35[0] = a1;
  dispatch thunk of Identifiable.id.getter(v4, v6);
  MetatypeMetadata = a1;
  swift_beginAccess(v2 + 16, v35, 33, 0);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness(v6, v4, AssociatedTypeWitness, &protocol requirements base descriptor for Identifiable, &associated conformance descriptor for Identifiable.Identifiable.ID: Hashable);
  v29 = type metadata accessor for Dictionary(0, AssociatedTypeWitness, v4, AssociatedConformanceWitness);
  swift_unknownObjectRetain(a1);
  Dictionary.subscript.setter(&MetatypeMetadata, v9, v29);
  return swift_endAccess(v35);
}

uint64_t sub_1000214EC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ClientConnectionManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100012E94(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ClientConnectionManager);
}

_OWORD *sub_10002151C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _OWORD *result;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  if (a1 == 3)
  {
    if (qword_1000418C8 != -1)
      swift_once(&qword_1000418C8, sub_100025BCC);
    v1 = type metadata accessor for Logger(0);
    v2 = sub_1000036A4(v1, (uint64_t)qword_100043EF8);
    v3 = Logger.logObject.getter(v2);
    v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Client is ScreenTime. Returning ScreenTime response tasks.", v5, 2u);
      swift_slowDealloc(v5, -1, -1);
    }

    v6 = sub_100005FF0((uint64_t *)&unk_100042620);
    result = (_OWORD *)swift_allocObject(v6, 72, 7);
    result[1] = xmmword_100030010;
    *((_QWORD *)result + 7) = &type metadata for ScreenTimeResponseTask;
    *((_QWORD *)result + 8) = &off_10003DB60;
    *((_BYTE *)result + 32) = 3;
  }
  else
  {
    if (qword_1000418C8 != -1)
      swift_once(&qword_1000418C8, sub_100025BCC);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_1000036A4(v8, (uint64_t)qword_100043EF8);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Client is an AskTo-owned process. Returning no response tasks.", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    return &_swiftEmptyArrayStorage;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientResponseTaskMapper()
{
  return &type metadata for ClientResponseTaskMapper;
}

uint64_t sub_1000216F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(uint64_t, char *, uint64_t);
  uint64_t v16;
  Swift::String v17;
  void *object;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;

  v29 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v29);
  v28 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()(v12);
  v15 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 16);
  v30 = a1;
  v15(a1, v14, v10);
  v16 = sub_10001934C(0, (unint64_t *)&qword_100041E00, OS_dispatch_queue_ptr);
  v27 = v16;
  if (qword_1000418C0 != -1)
    v16 = swift_once(&qword_1000418C0, sub_10002196C);
  v31 = (void *)0xD000000000000014;
  v32 = 0x80000001000326A0;
  v17._countAndFlagsBits = UUID.uuidString.getter(v16);
  object = v17._object;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(object);
  v19 = v31;
  v20 = v32;
  v21 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v6);
  static DispatchQoS.unspecified.getter(v21);
  v31 = &_swiftEmptyArrayStorage;
  sub_100009AB4();
  v22 = sub_100005FF0(&qword_100041E10);
  v23 = sub_100009AFC();
  v24 = v28;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v22, v23);
  v25 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v19, v20, v5, v24, v9, 0);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  result = type metadata accessor for IDSLookupController(0);
  *(_QWORD *)(v30 + *(int *)(result + 20)) = v25;
  return result;
}

void sub_10002196C()
{
  qword_100042630 = 0x6C7070612E6D6F63;
  *(_QWORD *)algn_100042638 = 0xEF6F546B73412E65;
}

uint64_t type metadata accessor for IDSLookupController(uint64_t a1)
{
  uint64_t result;

  result = qword_100042728;
  if (!qword_100042728)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for IDSLookupController);
  return result;
}

uint64_t sub_1000219D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 96) = a1;
  *(_QWORD *)(v2 + 104) = v1;
  return swift_task_switch(sub_1000219F0, 0, 0);
}

uint64_t sub_1000219F0()
{
  uint64_t v0;
  uint64_t i;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  unint64_t v21;
  void *v22;
  id v23;

  i = *(_QWORD *)(v0 + 96);
  if ((unint64_t)i >> 62)
    goto LABEL_11;
  v2 = *(_QWORD *)((i & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    v3 = *(_QWORD *)(v0 + 96);
    v22 = &_swiftEmptyDictionarySingleton;
    v4 = i & 0xC000000000000001;
    v5 = v3 + 32;
    swift_bridgeObjectRetain(v3);
    for (i = 0; ; ++i)
    {
      v6 = v4
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, *(_QWORD *)(v0 + 96))
         : *(id *)(v5 + 8 * i);
      v7 = v6;
      v8 = i + 1;
      if (__OFADD__(i, 1))
        break;
      v23 = v6;
      sub_10002288C((uint64_t *)&v22, &v23);

      if (v8 == v2)
      {
        swift_bridgeObjectRelease(*(_QWORD *)(v0 + 96));
        v9 = v22;
        *(_QWORD *)(v0 + 112) = v22;
        swift_bridgeObjectRetain(v9);
        v11 = sub_10002518C(v10);
        *(_QWORD *)(v0 + 120) = v11;
        swift_bridgeObjectRelease(v9);
        v12 = (_QWORD *)swift_task_alloc(dword_10004264C);
        *(_QWORD *)(v0 + 128) = v12;
        *v12 = v0;
        v12[1] = sub_100021C58;
        v13 = *(_QWORD *)(v0 + 104);
        v12[5] = v11;
        v12[6] = v13;
        return swift_task_switch(sub_100022D54, 0, 0);
      }
    }
    __break(1u);
LABEL_11:
    if (i < 0)
      v15 = i;
    else
      v15 = i & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(i);
    v2 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(i);
  }
  if (qword_1000418F0 != -1)
    swift_once(&qword_1000418F0, sub_100025CC0);
  v16 = type metadata accessor for Logger(0);
  v17 = sub_1000036A4(v16, (uint64_t)qword_100043F70);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "No family members to lookup, bailing early.", v20, 2u);
    swift_slowDealloc(v20, -1, -1);
  }

  v21 = sub_10002602C((uint64_t)&_swiftEmptyArrayStorage);
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v21);
}

uint64_t sub_100021C58(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 128);
  *(_QWORD *)(v3 + 136) = a1;
  *(_QWORD *)(v3 + 144) = v1;
  swift_task_dealloc(v4);
  if (v1)
    v5 = sub_100022850;
  else
    v5 = sub_100021CC4;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100021CC4()
{
  int64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char **p_name;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  int64_t v40;
  uint64_t *v41;
  unint64_t v42;
  NSString v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  unint64_t v67;
  char *v68;
  char v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  _BOOL4 v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t *v92;
  unint64_t v93;
  uint64_t *v95;
  int64_t v96;
  int64_t v97;
  int64_t v98;
  uint64_t *v99;
  int64_t v100;
  int v101;
  uint64_t v102;
  int64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;

  v1 = v0 + 88;
  v2 = *(_QWORD *)(v0 + 136);
  if (!*(_QWORD *)(v2 + 16))
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
    swift_bridgeObjectRelease(v2);
    if (qword_1000418F0 != -1)
      goto LABEL_65;
    goto LABEL_6;
  }
  swift_release(*(_QWORD *)(v0 + 120));
  if (qword_1000418F0 != -1)
LABEL_63:
    swift_once(&qword_1000418F0, sub_100025CC0);
  v98 = v0 + 16;
  v96 = v0 + 40;
  v3 = *(_QWORD *)(v0 + 136);
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043F70);
  swift_bridgeObjectRetain_n(v3, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 136);
  v10 = &loc_10002F000;
  v97 = v0 + 80;
  if (v8)
  {
    v104 = v1;
    v1 = swift_slowAlloc(12, -1);
    v11 = swift_slowAlloc(32, -1);
    v107 = v11;
    *(_DWORD *)v1 = 136315138;
    v12 = sub_10001934C(0, &qword_100042678, IDSIDInfoResult_ptr);
    v13 = ((uint64_t (*)(uint64_t))swift_bridgeObjectRetain)(v9);
    v14 = Dictionary.Keys.description.getter(v13, &type metadata for String, v12, &protocol witness table for String);
    v16 = v15;
    swift_bridgeObjectRelease(v9);
    *(_QWORD *)(v0 + 80) = sub_100027030(v14, v16, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v104, v1 + 4, v1 + 12);
    v17 = v16;
    v10 = (_QWORD *)&loc_10002F000;
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease_n(v9, 2);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Got result keys: %s", (uint8_t *)v1, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v1, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v9, 2);
  }

  v99 = (uint64_t *)(v0 + 64);
  v95 = (uint64_t *)(v0 + 72);
  v31 = *(_QWORD *)(v0 + 136);
  v106 = *(_QWORD *)(v0 + 112);
  v100 = v0;
  *(_QWORD *)(v0 + 64) = sub_10002602C((uint64_t)&_swiftEmptyArrayStorage);
  v102 = v31 + 64;
  v32 = -1;
  v33 = -1 << *(_BYTE *)(v31 + 32);
  if (-v33 < 64)
    v32 = ~(-1 << -(char)v33);
  v34 = v32 & *(_QWORD *)(v31 + 64);
  v103 = (unint64_t)(63 - v33) >> 6;
  swift_bridgeObjectRetain(v31);
  v0 = 0;
  p_name = &Client.name;
  v101 = v10[509];
  while (v34)
  {
    v36 = __clz(__rbit64(v34));
    v34 &= v34 - 1;
    v37 = v36 | (v0 << 6);
LABEL_33:
    v41 = (uint64_t *)(*(_QWORD *)(v31 + 48) + 16 * v37);
    v1 = *v41;
    v42 = v41[1];
    swift_bridgeObjectRetain(v42);
    v43 = String._bridgeToObjectiveC()();
    v44 = objc_msgSend(v43, p_name[216]);

    if (v44)
    {
      swift_bridgeObjectRelease(v42);
      v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      v42 = v46;

      if (!*(_QWORD *)(v106 + 16))
        goto LABEL_41;
      swift_bridgeObjectRetain(v42);
      v47 = sub_1000276E8(v45, v42);
      if ((v48 & 1) != 0)
      {
        v1 = (uint64_t)*(id *)(*(_QWORD *)(v106 + 56) + 8 * v47);
        swift_bridgeObjectRelease(v42);
        swift_bridgeObjectRetain_n(v42, 2);
        v50 = Logger.logObject.getter(v49);
        v51 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = swift_slowAlloc(12, -1);
          v53 = swift_slowAlloc(32, -1);
          v107 = v53;
          *(_DWORD *)v52 = v101;
          swift_bridgeObjectRetain(v42);
          *(_QWORD *)(v52 + 4) = sub_100027030(v45, v42, &v107);
          swift_bridgeObjectRelease_n(v42, 3);
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "%s is eligible to receive iMessages", (uint8_t *)v52, 0xCu);
          swift_arrayDestroy(v53, 1, (char *)&type metadata for Any + 8);
          v54 = v53;
          p_name = (char **)(&Client + 24);
          swift_slowDealloc(v54, -1, -1);
          swift_slowDealloc(v52, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n(v42, 2);
        }

        v65 = *v99;
        if (*(_QWORD *)(*v99 + 16))
        {
          v66 = (id)v1;
          v67 = sub_10002774C((uint64_t)v66);
          v68 = (char *)&_swiftEmptyArrayStorage;
          if ((v69 & 1) != 0)
          {
            v68 = *(char **)(*(_QWORD *)(v65 + 56) + 8 * v67);
            swift_bridgeObjectRetain(v68);
          }

        }
        else
        {
          v68 = (char *)&_swiftEmptyArrayStorage;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v68) & 1) == 0)
          v68 = sub_10001D8D0(0, *((_QWORD *)v68 + 2) + 1, 1, v68);
        v71 = *((_QWORD *)v68 + 2);
        v70 = *((_QWORD *)v68 + 3);
        if (v71 >= v70 >> 1)
          v68 = sub_10001D8D0((char *)(v70 > 1), v71 + 1, 1, v68);
        *((_QWORD *)v68 + 2) = v71 + 1;
        v72 = &v68[16 * v71];
        *((_QWORD *)v72 + 4) = v45;
        *((_QWORD *)v72 + 5) = v42;
        v73 = *v99;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v99);
        v107 = v73;
        *v99 = 0x8000000000000000;
        sub_10002502C((uint64_t)v68, (void *)v1, isUniquelyReferenced_nonNull_native);
        v75 = *v99;
        *v99 = v107;
        swift_bridgeObjectRelease(v75);

      }
      else
      {
        swift_bridgeObjectRelease(v42);
LABEL_41:
        swift_bridgeObjectRetain(v42);
        v56 = Logger.logObject.getter(v62);
        v63 = static os_log_type_t.error.getter();
        v1 = v63;
        if (!os_log_type_enabled(v56, v63))
          goto LABEL_12;
        v58 = swift_slowAlloc(12, -1);
        v59 = swift_slowAlloc(32, -1);
        v107 = v59;
        *(_DWORD *)v58 = v101;
        swift_bridgeObjectRetain(v42);
        *(_QWORD *)(v58 + 4) = sub_100027030(v45, v42, &v107);
        swift_bridgeObjectRelease_n(v42, 3);
        _os_log_impl((void *)&_mh_execute_header, v56, (os_log_type_t)v1, "Unable to find handle \"%s\" in handle to family member map.", (uint8_t *)v58, 0xCu);
        v61 = (char *)&type metadata for Any + 8;
        v60 = v59;
LABEL_43:
        swift_arrayDestroy(v60, 1, v61);
        v64 = v59;
        p_name = (char **)(&Client + 24);
        swift_slowDealloc(v64, -1, -1);
        swift_slowDealloc(v58, -1, -1);

      }
    }
    else
    {
      swift_bridgeObjectRetain(v42);
      v56 = Logger.logObject.getter(v55);
      v57 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = swift_slowAlloc(12, -1);
        v59 = swift_slowAlloc(32, -1);
        v107 = v59;
        *(_DWORD *)v58 = v101;
        swift_bridgeObjectRetain(v42);
        *(_QWORD *)(v58 + 4) = sub_100027030(v1, v42, &v107);
        swift_bridgeObjectRelease_n(v42, 3);
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Could not get normalized handle for key: %s", (uint8_t *)v58, 0xCu);
        v60 = v59;
        v61 = (char *)&type metadata for Any + 8;
        goto LABEL_43;
      }
LABEL_12:
      swift_bridgeObjectRelease_n(v42, 2);

    }
  }
  v38 = v0 + 1;
  if (__OFADD__(v0, 1))
  {
    __break(1u);
    goto LABEL_63;
  }
  if (v38 >= v103)
  {
LABEL_55:
    v0 = v100;
    v76 = *(_QWORD *)(v100 + 112);
    swift_release(*(_QWORD *)(v100 + 136));
    v77 = swift_bridgeObjectRelease(v76);
    v78 = Logger.logObject.getter(v77);
    v79 = static os_log_type_t.default.getter();
    v80 = os_log_type_enabled(v78, v79);
    v81 = *(_QWORD *)(v100 + 136);
    if (v80)
    {
      v82 = (uint8_t *)swift_slowAlloc(12, -1);
      v83 = swift_slowAlloc(32, -1);
      *(_DWORD *)v82 = v101;
      v107 = v83;
      swift_beginAccess(v99, v96, 0, 0);
      v84 = *v99;
      v85 = sub_10001934C(0, (unint64_t *)&qword_100042560, FAFamilyMember_ptr);
      swift_bridgeObjectRetain(v84);
      v86 = sub_100005FF0(&qword_1000426B0);
      v87 = sub_100025270();
      v88 = Dictionary.description.getter(v84, v85, v86, v87);
      v90 = v89;
      v91 = v84;
      v92 = (unint64_t *)v99;
      v0 = v100;
      swift_bridgeObjectRelease(v91);
      *v95 = sub_100027030(v88, v90, &v107);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v95, v97, v82 + 4, v82 + 12);
      swift_bridgeObjectRelease(v90);
      _os_log_impl((void *)&_mh_execute_header, v78, v79, "iMessageableHandles from IDS query controller: %s", v82, 0xCu);
      swift_arrayDestroy(v83, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v83, -1, -1);
      swift_slowDealloc(v82, -1, -1);

      swift_bridgeObjectRelease(v81);
    }
    else
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v100 + 136));

      v92 = (unint64_t *)v99;
    }
    swift_beginAccess(v92, v98, 0, 0);
    v93 = *v92;
    return (*(uint64_t (**)(unint64_t))(v0 + 8))(v93);
  }
  v39 = *(_QWORD *)(v102 + 8 * v38);
  ++v0;
  if (v39)
    goto LABEL_32;
  v0 = v38 + 1;
  if (v38 + 1 >= v103)
    goto LABEL_55;
  v39 = *(_QWORD *)(v102 + 8 * v0);
  if (v39)
    goto LABEL_32;
  v0 = v38 + 2;
  if (v38 + 2 >= v103)
    goto LABEL_55;
  v39 = *(_QWORD *)(v102 + 8 * v0);
  if (v39)
    goto LABEL_32;
  v0 = v38 + 3;
  if (v38 + 3 >= v103)
    goto LABEL_55;
  v39 = *(_QWORD *)(v102 + 8 * v0);
  if (v39)
    goto LABEL_32;
  v0 = v38 + 4;
  if (v38 + 4 >= v103)
    goto LABEL_55;
  v39 = *(_QWORD *)(v102 + 8 * v0);
  if (v39)
  {
LABEL_32:
    v34 = (v39 - 1) & v39;
    v37 = __clz(__rbit64(v39)) + (v0 << 6);
    goto LABEL_33;
  }
  v40 = v38 + 5;
  if (v40 >= v103)
    goto LABEL_55;
  v39 = *(_QWORD *)(v102 + 8 * v40);
  if (v39)
  {
    v0 = v40;
    goto LABEL_32;
  }
  while (1)
  {
    v0 = v40 + 1;
    if (__OFADD__(v40, 1))
      break;
    if (v0 >= v103)
      goto LABEL_55;
    v39 = *(_QWORD *)(v102 + 8 * v0);
    ++v40;
    if (v39)
      goto LABEL_32;
  }
  __break(1u);
LABEL_65:
  swift_once(&qword_1000418F0, sub_100025CC0);
LABEL_6:
  v18 = *(_QWORD *)(v0 + 120);
  v19 = type metadata accessor for Logger(0);
  sub_1000036A4(v19, (uint64_t)qword_100043F70);
  v20 = swift_retain(v18);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.default.getter();
  v23 = os_log_type_enabled(v21, v22);
  v24 = *(_QWORD *)(v0 + 120);
  if (v23)
  {
    v105 = v1;
    v25 = (uint8_t *)swift_slowAlloc(12, -1);
    v26 = swift_slowAlloc(32, -1);
    v107 = v26;
    *(_DWORD *)v25 = 136315138;
    v27 = swift_retain(v24);
    v28 = Array.description.getter(v27, &type metadata for String);
    v30 = v29;
    swift_release(v24);
    *(_QWORD *)(v0 + 88) = sub_100027030(v28, v30, &v107);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v105, v0 + 96, v25 + 4, v25 + 12);
    swift_bridgeObjectRelease(v30);
    swift_release_n(v24, 2);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "No results for ids lookup with destinations %s", v25, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v25, -1, -1);
  }
  else
  {
    swift_release_n(*(_QWORD *)(v0 + 120), 2);
  }

  v93 = sub_10002602C((uint64_t)&_swiftEmptyArrayStorage);
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v93);
}

uint64_t sub_100022850()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_release(*(_QWORD *)(v0 + 120));
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002288C(uint64_t *a1, id *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t *v20;
  int64_t isUniquelyReferenced_nonNull_native;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  char v27;
  unint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  char *v49;
  char *v50;
  __int128 v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t *v56;

  v56 = a1;
  v3 = type metadata accessor for CharacterSet(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = *a2;
  v7 = objc_msgSend(v52, "appleID");
  if (v7)
  {
    v9 = v7;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v12 = v11;

    v54 = v10;
    v55 = v12;
    static CharacterSet.whitespacesAndNewlines.getter();
    v13 = sub_1000252C8();
    v14 = StringProtocol.trimmingCharacters(in:)(v6, &type metadata for String, v13);
    v16 = v15;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRelease(v55);
    v17 = HIBYTE(v16) & 0xF;
    if ((v16 & 0x2000000000000000) == 0)
      v17 = v14 & 0xFFFFFFFFFFFFLL;
    if (v17)
    {
      v18 = sub_10001D8D0(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
      v20 = (uint64_t *)*((_QWORD *)v18 + 2);
      v19 = *((_QWORD *)v18 + 3);
      isUniquelyReferenced_nonNull_native = (int64_t)v20 + 1;
      if ((unint64_t)v20 >= v19 >> 1)
LABEL_31:
        v18 = sub_10001D8D0((char *)(v19 > 1), isUniquelyReferenced_nonNull_native, 1, v18);
      *((_QWORD *)v18 + 2) = isUniquelyReferenced_nonNull_native;
      v22 = &v18[16 * (_QWORD)v20];
      *((_QWORD *)v22 + 4) = v14;
      *((_QWORD *)v22 + 5) = v16;
      goto LABEL_9;
    }
    swift_bridgeObjectRelease(v16);
  }
  v18 = (char *)&_swiftEmptyArrayStorage;
LABEL_9:
  v49 = v18;
  v23 = *((_QWORD *)v18 + 2);
  if (!v23)
    return swift_bridgeObjectRelease(v49);
  v20 = (uint64_t *)(v49 + 40);
  *(_QWORD *)&v8 = 138412546;
  v51 = v8;
  v50 = (char *)&type metadata for Any + 8;
  while (1)
  {
    v53 = v23;
    v24 = *(v20 - 1);
    v14 = *v20;
    swift_bridgeObjectRetain_n(*v20, 2);
    v25 = v52;
    v26 = v56;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v56);
    v54 = *v26;
    v16 = v54;
    *v26 = 0x8000000000000000;
    v28 = sub_1000276E8(v24, v14);
    v19 = *(_QWORD *)(v16 + 16);
    v29 = (v27 & 1) == 0;
    v30 = v19 + v29;
    if (__OFADD__(v19, v29))
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    v31 = v27;
    if (*(_QWORD *)(v16 + 24) < v30)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v16 = v54;
      if ((v27 & 1) != 0)
        goto LABEL_20;
    }
    else
    {
      sub_100028A9C();
      v16 = v54;
      if ((v31 & 1) != 0)
      {
LABEL_20:
        v34 = *(_QWORD *)(v16 + 56);

        *(_QWORD *)(v34 + 8 * v28) = v25;
        goto LABEL_24;
      }
    }
LABEL_22:
    *(_QWORD *)(v16 + 8 * (v28 >> 6) + 64) |= 1 << v28;
    v35 = (uint64_t *)(*(_QWORD *)(v16 + 48) + 16 * v28);
    *v35 = v24;
    v35[1] = v14;
    *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v28) = v25;
    v36 = *(_QWORD *)(v16 + 16);
    v37 = __OFADD__(v36, 1);
    v19 = v36 + 1;
    if (v37)
      goto LABEL_30;
    *(_QWORD *)(v16 + 16) = v19;
    swift_bridgeObjectRetain(v14);
LABEL_24:
    v38 = *v56;
    *v56 = v16;
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v38);
    if (qword_1000418F0 != -1)
      swift_once(&qword_1000418F0, sub_100025CC0);
    v39 = type metadata accessor for Logger(0);
    sub_1000036A4(v39, (uint64_t)qword_100043F70);
    swift_bridgeObjectRetain(v14);
    v40 = v25;
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc(22, -1);
      v44 = (_QWORD *)swift_slowAlloc(8, -1);
      v45 = swift_slowAlloc(32, -1);
      v54 = v45;
      *(_DWORD *)v43 = v51;
      *(_QWORD *)(v43 + 4) = v40;
      *v44 = v52;
      *(_WORD *)(v43 + 12) = 2080;
      swift_bridgeObjectRetain(v14);
      *(_QWORD *)(v43 + 14) = sub_100027030(v24, v14, (uint64_t *)&v54);
      swift_bridgeObjectRelease_n(v14, 3);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "%@ registered %s", (uint8_t *)v43, 0x16u);
      v46 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v44, 1, v46);
      swift_slowDealloc(v44, -1, -1);
      swift_arrayDestroy(v45, 1, v50);
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v14, 2);
    }
    v20 += 2;
    v23 = v53 - 1;
    if (v53 == 1)
      return swift_bridgeObjectRelease(v49);
  }
  sub_100028268(v30, isUniquelyReferenced_nonNull_native);
  v32 = sub_1000276E8(v24, v14);
  if ((v31 & 1) == (v33 & 1))
  {
    v28 = v32;
    v16 = v54;
    if ((v31 & 1) != 0)
      goto LABEL_20;
    goto LABEL_22;
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100022D3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch(sub_100022D54, 0, 0);
}

uint64_t sub_100022D54()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  unint64_t v23;
  uint64_t v24;

  v1 = objc_msgSend((id)objc_opt_self(IDSIDQueryController), "sharedInstance");
  *(_QWORD *)(v0 + 56) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)(v0 + 40);
    if (*(_QWORD *)(v3 + 16))
    {
      v4 = *(_QWORD *)(v0 + 48);
      v5 = (_QWORD *)swift_task_alloc(48);
      *(_QWORD *)(v0 + 64) = v5;
      v5[2] = v2;
      v5[3] = v3;
      v5[4] = v4;
      v6 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
      *(_QWORD *)(v0 + 72) = v6;
      v7 = sub_100005FF0(&qword_100042670);
      *v6 = v0;
      v6[1] = sub_1000230C0;
      return withCheckedThrowingContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000025, 0x80000001000326C0, sub_100024CF4, v5, v7);
    }
    else
    {
      if (qword_1000418F0 != -1)
        swift_once(&qword_1000418F0, sub_100025CC0);
      v18 = type metadata accessor for Logger(0);
      v19 = sub_1000036A4(v18, (uint64_t)qword_100043F70);
      v20 = Logger.logObject.getter(v19);
      v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "No handles to lookup, bailing early.", v22, 2u);
        swift_slowDealloc(v22, -1, -1);
      }

      v23 = sub_100025F14((uint64_t)&_swiftEmptyArrayStorage);
      return (*(uint64_t (**)(unint64_t))(v0 + 8))(v23);
    }
  }
  else
  {
    if (qword_1000418F0 != -1)
      swift_once(&qword_1000418F0, sub_100025CC0);
    v9 = type metadata accessor for Logger(0);
    v10 = sub_1000036A4(v9, (uint64_t)qword_100043F70);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      v14 = swift_slowAlloc(32, -1);
      v24 = v14;
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v0 + 16) = sub_100027030(0xD000000000000025, 0x80000001000326C0, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v13 + 4, v13 + 12);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s The IDS query controller was nil, bailing early.", v13, 0xCu);
      swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v14, -1, -1);
      swift_slowDealloc(v13, -1, -1);
    }

    v15 = sub_100024CB0();
    v16 = swift_allocError(&type metadata for IDSLookupController.Error, v15, 0, 0);
    *v17 = 1;
    swift_willThrow(v16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1000230C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 72);
  *(_QWORD *)(*v1 + 80) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_10002333C;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 64));
    v4 = sub_10002312C;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10002312C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 24);
  if (qword_1000418F0 != -1)
    swift_once(&qword_1000418F0, sub_100025CC0);
  v2 = type metadata accessor for Logger(0);
  sub_1000036A4(v2, (uint64_t)qword_100043F70);
  v3 = swift_bridgeObjectRetain_n(v1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 56);
  if (v6)
  {
    v16 = *(void **)(v0 + 56);
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_10001934C(0, &qword_100042678, IDSIDInfoResult_ptr);
    v11 = swift_bridgeObjectRetain(v1);
    v12 = Dictionary.description.getter(v11, &type metadata for String, v10, &protocol witness table for String);
    v14 = v13;
    swift_bridgeObjectRelease(v1);
    *(_QWORD *)(v0 + 32) = sub_100027030(v12, v14, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease_n(v1, 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Got results from IDS query: %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n(v1, 2);

  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_10002333C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);

  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100023378(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;

  v3[5] = a1;
  v3[6] = a2;
  v5 = (_QWORD *)swift_task_alloc(dword_10004264C);
  v3[7] = v5;
  *v5 = v3;
  v5[1] = sub_1000233DC;
  v5[5] = a2;
  v5[6] = v2;
  return swift_task_switch(sub_100022D54, 0, 0);
}

uint64_t sub_1000233DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*v2 + 56);
  v4 = *v2;
  *(_QWORD *)(v4 + 64) = a1;
  swift_task_dealloc(v3);
  if (v1)
    return (*(uint64_t (**)(void))(v4 + 8))();
  else
    return swift_task_switch(sub_100023450, 0, 0);
}

uint64_t sub_100023450()
{
  _QWORD *v0;
  char *v1;
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  int64_t v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  unint64_t v38;
  NSString v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  os_log_type_t v64;
  _BOOL4 v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int64_t v79;
  uint64_t v80;
  NSObject *v81;
  uint64_t v82;
  int64_t v83;
  uint64_t *v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  os_log_type_t type;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  _QWORD *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99[2];

  v2 = (int64_t)v0;
  v86 = v0 + 4;
  v3 = v0[8];
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = 0;
    v85 = v0 + 2;
    v84 = v0 + 3;
    v78 = v3 + 64;
    v5 = -1 << *(_BYTE *)(v3 + 32);
    v6 = v0[5];
    if (-v5 < 64)
      v7 = ~(-1 << -(char)v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v3 + 64);
    v79 = (unint64_t)(63 - v5) >> 6;
    v97 = v6 + 56;
    v98 = (uint64_t)&_swiftEmptyArrayStorage;
    v95 = v0;
    v80 = v3;
    while (1)
    {
      if (v8)
      {
        v82 = (v8 - 1) & v8;
        v83 = v4;
        v9 = __clz(__rbit64(v8)) | (v4 << 6);
      }
      else
      {
        v10 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_89;
        if (v10 >= v79)
        {
LABEL_82:
          swift_release(*(_QWORD *)(v2 + 64));
          v73 = (void *)v98;
          if ((unint64_t)v98 >> 62)
          {
            if (v98 < 0)
              v76 = v98;
            else
              v76 = v98 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain(v98);
            v77 = sub_100005FF0(&qword_100042660);
            v72 = (void *)_bridgeCocoaArray<A>(_:)(v76, v77);
            swift_bridgeObjectRelease(v73);
          }
          else
          {
            v74 = swift_bridgeObjectRetain(v98);
            dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v74);
            v72 = v73;
          }
          swift_bridgeObjectRelease(v73);
          return (*(uint64_t (**)(void *))(v2 + 8))(v72);
        }
        v11 = *(_QWORD *)(v78 + 8 * v10);
        v12 = v4 + 1;
        if (!v11)
        {
          v12 = v4 + 2;
          if (v4 + 2 >= v79)
            goto LABEL_82;
          v11 = *(_QWORD *)(v78 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 3;
            if (v4 + 3 >= v79)
              goto LABEL_82;
            v11 = *(_QWORD *)(v78 + 8 * v12);
            if (!v11)
            {
              v13 = v4 + 4;
              if (v4 + 4 >= v79)
                goto LABEL_82;
              v11 = *(_QWORD *)(v78 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  v12 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_90;
                  if (v12 >= v79)
                    goto LABEL_82;
                  v11 = *(_QWORD *)(v78 + 8 * v12);
                  ++v13;
                  if (v11)
                    goto LABEL_23;
                }
              }
              v12 = v4 + 4;
            }
          }
        }
LABEL_23:
        v82 = (v11 - 1) & v11;
        v83 = v12;
        v9 = __clz(__rbit64(v11)) + (v12 << 6);
      }
      v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v9);
      v16 = *v14;
      v15 = v14[1];
      v17 = *(NSObject **)(*(_QWORD *)(v3 + 56) + 8 * v9);
      swift_bridgeObjectRetain(v15);
      v81 = v17;
      v18 = -[NSObject endpoints](v81, "endpoints");
      if (v18)
      {
        v17 = v18;
        v19 = sub_10001934C(0, &qword_100042658, IDSEndpoint_ptr);
        v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v17, v19);

        if (!((unint64_t)v20 >> 62))
          goto LABEL_26;
      }
      else
      {
        v20 = (uint64_t)&_swiftEmptyArrayStorage;
        if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
        {
LABEL_26:
          v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v21)
            goto LABEL_27;
          goto LABEL_70;
        }
      }
      if (v20 < 0)
        v17 = v20;
      else
        v17 = (v20 & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain(v20);
      v21 = _CocoaArrayWrapper.endIndex.getter(v17);
      swift_bridgeObjectRelease(v20);
      if (v21)
      {
LABEL_27:
        swift_bridgeObjectRelease(v15);
        v22 = 0;
        v94 = v20 & 0xC000000000000001;
        v87 = v20 + 32;
        v88 = v20 & 0xFFFFFFFFFFFFFF8;
        v92 = v21;
        v93 = v20;
        while (1)
        {
          if (v94)
          {
            v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v22, v20);
          }
          else
          {
            if (v22 >= *(_QWORD *)(v88 + 16))
              goto LABEL_88;
            v24 = *(id *)(v87 + 8 * v22);
          }
          v25 = v24;
          v26 = __OFADD__(v22, 1);
          v27 = v22 + 1;
          if (v26)
            break;
          v96 = v27;
          v28 = -1 << *(_BYTE *)(v6 + 32);
          if (-v28 < 64)
            v29 = ~(-1 << -(char)v28);
          else
            v29 = -1;
          v30 = v29 & *(_QWORD *)(v6 + 56);
          v31 = (unint64_t)(63 - v28) >> 6;
          swift_bridgeObjectRetain(*(_QWORD *)(v2 + 40));
          v2 = 0;
          if (v30)
          {
LABEL_39:
            v32 = __clz(__rbit64(v30));
            v30 &= v30 - 1;
            v33 = v32 | (v2 << 6);
            goto LABEL_54;
          }
          while (1)
          {
            v34 = v2 + 1;
            if (__OFADD__(v2, 1))
            {
              __break(1u);
              goto LABEL_80;
            }
            if (v34 >= v31)
              goto LABEL_28;
            v35 = *(_QWORD *)(v97 + 8 * v34);
            ++v2;
            if (!v35)
            {
              v2 = v34 + 1;
              if (v34 + 1 >= v31)
                goto LABEL_28;
              v35 = *(_QWORD *)(v97 + 8 * v2);
              if (!v35)
              {
                v2 = v34 + 2;
                if (v34 + 2 >= v31)
                  goto LABEL_28;
                v35 = *(_QWORD *)(v97 + 8 * v2);
                if (!v35)
                {
                  v36 = v34 + 3;
                  if (v36 >= v31)
                  {
LABEL_28:
                    v2 = (int64_t)v95;
                    swift_release(v95[5]);
                    v23 = v92;
                    v20 = v93;
                    v22 = v96;
                    goto LABEL_29;
                  }
                  v35 = *(_QWORD *)(v97 + 8 * v36);
                  if (!v35)
                  {
                    while (1)
                    {
                      v2 = v36 + 1;
                      if (__OFADD__(v36, 1))
                        break;
                      if (v2 >= v31)
                        goto LABEL_28;
                      v35 = *(_QWORD *)(v97 + 8 * v2);
                      ++v36;
                      if (v35)
                        goto LABEL_53;
                    }
                    __break(1u);
                    goto LABEL_87;
                  }
                  v2 = v36;
                }
              }
            }
LABEL_53:
            v30 = (v35 - 1) & v35;
            v33 = __clz(__rbit64(v35)) + (v2 << 6);
LABEL_54:
            v37 = *(_QWORD *)(v6 + 48) + 16 * v33;
            v1 = *(char **)v37;
            v38 = *(_QWORD *)(v37 + 8);
            swift_bridgeObjectRetain(v38);
            v17 = objc_msgSend(v25, "capabilities");
            v39 = String._bridgeToObjectiveC()();
            v40 = -[NSObject valueForCapability:](v17, "valueForCapability:", v39);

            if (!v40)
              break;
            swift_bridgeObjectRelease(v38);
            if (v30)
              goto LABEL_39;
          }
          if (qword_1000418F0 != -1)
            swift_once(&qword_1000418F0, sub_100025CC0);
          v41 = type metadata accessor for Logger(0);
          sub_1000036A4(v41, (uint64_t)qword_100043F70);
          v42 = v25;
          swift_bridgeObjectRetain(v38);
          v43 = v42;
          v44 = Logger.logObject.getter(v43);
          v45 = static os_log_type_t.default.getter();
          v46 = os_log_type_enabled(v44, v45);
          v2 = (int64_t)v95;
          v47 = v95[5];
          if (v46)
          {
            v48 = swift_slowAlloc(22, -1);
            type = v45;
            v49 = (_QWORD *)swift_slowAlloc(8, -1);
            v90 = swift_slowAlloc(32, -1);
            v99[0] = v90;
            *(_DWORD *)v48 = 138412546;
            v91 = v47;
            v50 = objc_msgSend(v43, "URI");
            *v85 = v50;
            v2 = (int64_t)v95;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v85, v84, v48 + 4, v48 + 12);
            *v49 = v50;

            *(_WORD *)(v48 + 12) = 2080;
            swift_bridgeObjectRetain(v38);
            *v84 = sub_100027030((uint64_t)v1, v38, v99);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(v84, v86, v48 + 14, v48 + 22);
            swift_bridgeObjectRelease_n(v38, 3);
            _os_log_impl((void *)&_mh_execute_header, v44, type, "Endpoint %@ does not support %s", (uint8_t *)v48, 0x16u);
            v51 = sub_100005FF0(&qword_100042650);
            swift_arrayDestroy(v49, 1, v51);
            swift_slowDealloc(v49, -1, -1);
            swift_arrayDestroy(v90, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v90, -1, -1);
            swift_slowDealloc(v48, -1, -1);

            v52 = v91;
          }
          else
          {

            swift_bridgeObjectRelease_n(v38, 2);
            v52 = v47;
          }
          swift_release(v52);
          v23 = v92;
          v20 = v93;
          v22 = v96;
          v1 = (char *)v43;
          v17 = &v98;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v54 = *(_QWORD *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v53 = *(_QWORD *)((v98 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v54 >= v53 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v53 > 1, v54 + 1, 1);
          v55 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v54, v1);
          specialized Array._endMutation()(v55);
LABEL_29:

          if (v22 == v23)
          {
            swift_bridgeObjectRelease(v20);

            goto LABEL_7;
          }
        }
LABEL_87:
        __break(1u);
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
        goto LABEL_91;
      }
LABEL_70:
      swift_bridgeObjectRelease(v20);
      if (qword_1000418F0 != -1)
        swift_once(&qword_1000418F0, sub_100025CC0);
      v56 = type metadata accessor for Logger(0);
      sub_1000036A4(v56, (uint64_t)qword_100043F70);
      v57 = swift_bridgeObjectRetain(v15);
      v58 = Logger.logObject.getter(v57);
      v59 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v58, v59))
      {
        v1 = (char *)swift_slowAlloc(12, -1);
        v60 = swift_slowAlloc(32, -1);
        v99[0] = v60;
        *(_DWORD *)v1 = 136315138;
        swift_bridgeObjectRetain(v15);
        *(_QWORD *)(v1 + 4) = sub_100027030(v16, v15, v99);
        swift_bridgeObjectRelease_n(v15, 3);
        _os_log_impl((void *)&_mh_execute_header, v58, v59, "No endpoints for handle %s", (uint8_t *)v1, 0xCu);
        swift_arrayDestroy(v60, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v60, -1, -1);
        swift_slowDealloc(v1, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v15, 2);
      }

LABEL_7:
      v3 = v80;
      v8 = v82;
      v4 = v83;
    }
  }
  swift_bridgeObjectRelease(v3);
  if (qword_1000418F0 != -1)
LABEL_91:
    swift_once(&qword_1000418F0, sub_100025CC0);
  v61 = *(_QWORD *)(v2 + 48);
  v62 = type metadata accessor for Logger(0);
  sub_1000036A4(v62, (uint64_t)qword_100043F70);
  v63 = swift_bridgeObjectRetain_n(v61, 2);
  v17 = Logger.logObject.getter(v63);
  v64 = static os_log_type_t.default.getter();
  v65 = os_log_type_enabled(v17, v64);
  v1 = *(char **)(v2 + 48);
  if (v65)
  {
    v66 = (uint8_t *)swift_slowAlloc(12, -1);
    v67 = swift_slowAlloc(32, -1);
    v99[0] = v67;
    *(_DWORD *)v66 = 136315138;
    v68 = swift_bridgeObjectRetain(v1);
    v69 = Array.description.getter(v68, &type metadata for String);
    v71 = v70;
    swift_bridgeObjectRelease(v1);
    *(_QWORD *)(v2 + 32) = sub_100027030(v69, v71, v99);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v86, v2 + 40, v66 + 4, v66 + 12);
    swift_bridgeObjectRelease(v71);
    swift_bridgeObjectRelease_n(v1, 2);
    _os_log_impl((void *)&_mh_execute_header, v17, v64, "No results for ids lookup with destinations %s", v66, 0xCu);
    swift_arrayDestroy(v67, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v67, -1, -1);
    swift_slowDealloc(v66, -1, -1);
  }
  else
  {
LABEL_80:
    swift_bridgeObjectRelease_n(v1, 2);
  }

  v72 = &_swiftEmptyArrayStorage;
  return (*(uint64_t (**)(void *))(v2 + 8))(v72);
}

_QWORD *sub_100023EC4(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[2];
  _OWORD v10[2];
  _QWORD *v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    v11 = &_swiftEmptyArrayStorage;
    sub_10001E438(0, v1, 0);
    v2 = &_swiftEmptyArrayStorage;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *v4;
      v9[0] = *(v4 - 1);
      v9[1] = v5;
      swift_bridgeObjectRetain(v5);
      swift_dynamicCast(v10, v9, &type metadata for String, (char *)&type metadata for Any + 8, 7);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_10001E438(0, v2[2] + 1, 1);
        v2 = v11;
      }
      v7 = v2[2];
      v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_10001E438(v6 > 1, v7 + 1, 1);
        v2 = v11;
      }
      v4 += 2;
      v2[2] = v7 + 1;
      sub_100024E8C(v10, &v2[4 * v7 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_100023FE8(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];
  _QWORD *v16;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = &_swiftEmptyArrayStorage;
  if (!v2)
    return (uint64_t)v3;
  v16 = &_swiftEmptyArrayStorage;
  result = sub_10001E438(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      v3 = v16;
      do
      {
        v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
        v6 = sub_100005FF0(&qword_100042660);
        swift_dynamicCast(v15, &v14, v6, (char *)&type metadata for Any + 8, 7);
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        {
          sub_10001E438(0, v3[2] + 1, 1);
          v3 = v16;
        }
        v8 = v3[2];
        v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_10001E438(v7 > 1, v8 + 1, 1);
          v3 = v16;
        }
        ++v5;
        v3[2] = v8 + 1;
        sub_100024E8C(v15, &v3[4 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (uint64_t *)(a1 + 32);
      v3 = v16;
      do
      {
        v14 = *v9;
        swift_unknownObjectRetain(v14);
        v10 = sub_100005FF0(&qword_100042660);
        swift_dynamicCast(v15, &v14, v10, (char *)&type metadata for Any + 8, 7);
        if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
        {
          sub_10001E438(0, v3[2] + 1, 1);
          v3 = v16;
        }
        v12 = v3[2];
        v11 = v3[3];
        if (v12 >= v11 >> 1)
        {
          sub_10001E438(v11 > 1, v12 + 1, 1);
          v3 = v16;
        }
        v3[2] = v12 + 1;
        sub_100024E8C(v15, &v3[4 * v12 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_100024224(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD *v11;
  NSString v12;
  uint64_t v13;
  id v14;
  NSString v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  Class v21;
  Class isa;
  id v23;
  _QWORD aBlock[5];
  uint64_t v25;

  v23 = a2;
  v7 = sub_100005FF0((uint64_t *)&unk_100042680);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = objc_msgSend((id)objc_opt_self(IDSIDInfoOptions), "refreshIDInfo");
  objc_msgSend(v10, "setForceRefresh:", 1);
  v11 = sub_100023EC4(a3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  v12 = String._bridgeToObjectiveC()();
  v13 = qword_1000418C0;
  v14 = v10;
  if (v13 != -1)
    swift_once(&qword_1000418C0, sub_10002196C);
  v15 = String._bridgeToObjectiveC()();
  v16 = *(_QWORD *)(a4 + *(int *)(type metadata accessor for IDSLookupController(0) + 20));
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&isa - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v17 = *(unsigned __int8 *)(v8 + 80);
  v18 = (v17 + 16) & ~v17;
  v19 = swift_allocObject(&unk_10003E430, v18 + v9, v17 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v19 + v18, (char *)&isa - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_100024D64;
  v25 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100024C1C;
  aBlock[3] = &unk_10003E448;
  v20 = _Block_copy(aBlock);
  swift_release(v25);
  v21 = isa;
  objc_msgSend(v23, "idInfoForDestinations:service:infoTypes:options:listenerID:queue:completionBlock:", isa, v12, 1, v14, v15, v16, v20);
  _Block_release(v20);

}

uint64_t sub_100024464(uint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v48;
  unint64_t v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  int v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  _QWORD *v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t result;
  unint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  unint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  id v75;
  unint64_t v76;
  char v77;
  uint64_t v78;
  int64_t v79;
  _QWORD *DynamicType;
  id v81[2];
  _QWORD v82[3];
  uint64_t v83;
  _OWORD v84[2];
  __int128 v85;
  __int128 v86;
  _OWORD v87[2];
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  __int128 v92[3];

  if (!a1)
  {
    if (a2)
    {
      v68 = sub_100024CB0();
      v69 = swift_allocError(&type metadata for IDSLookupController.Error, v68, 0, 0);
      *v70 = a2;
      *(_QWORD *)&v89 = v69;
      swift_errorRetain(a2);
    }
    else
    {
      v71 = sub_100024CB0();
      v72 = swift_allocError(&type metadata for IDSLookupController.Error, v71, 0, 0);
      *v73 = 2;
      *(_QWORD *)&v89 = v72;
    }
    v74 = sub_100005FF0((uint64_t *)&unk_100042680);
    return CheckedContinuation.resume(throwing:)(&v89, v74);
  }
  swift_bridgeObjectRetain(a1);
  v3 = 0;
  v76 = sub_100025F14((uint64_t)&_swiftEmptyArrayStorage);
  v78 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v79 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v8 = v7 | (v3 << 6);
LABEL_9:
      sub_100024DCC(*(_QWORD *)(a1 + 48) + 40 * v8, (uint64_t)&v85);
      sub_100024E08(*(_QWORD *)(a1 + 56) + 32 * v8, (uint64_t)v87 + 8);
      goto LABEL_28;
    }
    v9 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    if (v9 < v79)
    {
      v10 = *(_QWORD *)(v78 + 8 * v9);
      if (v10)
        goto LABEL_13;
      v11 = v3 + 2;
      ++v3;
      if (v9 + 1 < v79)
      {
        v10 = *(_QWORD *)(v78 + 8 * v11);
        if (v10)
          goto LABEL_16;
        v3 = v9 + 1;
        if (v9 + 2 < v79)
        {
          v10 = *(_QWORD *)(v78 + 8 * (v9 + 2));
          if (v10)
          {
            v9 += 2;
            goto LABEL_13;
          }
          v11 = v9 + 3;
          v3 = v9 + 2;
          if (v9 + 3 < v79)
            break;
        }
      }
    }
LABEL_27:
    v6 = 0;
    v88 = 0;
    memset(v87, 0, sizeof(v87));
    v85 = 0u;
    v86 = 0u;
LABEL_28:
    sub_100024E44((uint64_t)&v85, (uint64_t)&v89);
    if (!*((_QWORD *)&v90 + 1))
    {
      swift_release(a1);
      *(_QWORD *)&v89 = v76;
      v65 = sub_100005FF0((uint64_t *)&unk_100042680);
      return CheckedContinuation.resume(returning:)(&v89, v65);
    }
    v85 = v89;
    v86 = v90;
    *(_QWORD *)&v87[0] = v91;
    sub_100024E8C(v92, v84);
    sub_100024DCC((uint64_t)&v85, (uint64_t)v82);
    if ((swift_dynamicCast(v81, v82, &type metadata for AnyHashable, &type metadata for String, 6) & 1) == 0)
    {
      if (qword_1000418F0 != -1)
        swift_once(&qword_1000418F0, sub_100025CC0);
      v34 = type metadata accessor for Logger(0);
      sub_1000036A4(v34, (uint64_t)qword_100043F70);
      v35 = sub_100024E08((uint64_t)v84, (uint64_t)v82);
      v17 = Logger.logObject.getter(v35);
      v36 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v17, v36))
      {
LABEL_5:

        sub_10000EE64(v82);
        goto LABEL_6;
      }
      v19 = swift_slowAlloc(22, -1);
      v20 = (void *)swift_slowAlloc(64, -1);
      DynamicType = &type metadata for AnyHashable;
      v81[0] = v20;
      *(_DWORD *)v19 = 136315394;
      v37 = sub_100005FF0(&qword_100042690);
      v38 = String.init<A>(describing:)(&DynamicType, v37);
      v40 = v39;
      *(_QWORD *)(v19 + 4) = sub_100027030(v38, v39, (uint64_t *)v81);
      swift_bridgeObjectRelease(v40);
      *(_WORD *)(v19 + 12) = 2080;
      v41 = v83;
      v42 = sub_100003680(v82, v83);
      DynamicType = (_QWORD *)swift_getDynamicType(v42, v41, 1);
      v43 = sub_100005FF0(&qword_100042698);
      v44 = String.init<A>(describing:)(&DynamicType, v43);
      v46 = v45;
      *(_QWORD *)(v19 + 14) = sub_100027030(v44, v45, (uint64_t *)v81);
      swift_bridgeObjectRelease(v46);
      sub_10000EE64(v82);
      v31 = v17;
      v32 = v36;
      v33 = "key in IDS query results was not a String. Skipping. key type: %s, value type: %s";
      goto LABEL_39;
    }
    v13 = v81[0];
    v12 = v81[1];
    sub_100024E08((uint64_t)v84, (uint64_t)v82);
    v14 = sub_10001934C(0, &qword_100042678, IDSIDInfoResult_ptr);
    if ((swift_dynamicCast(v81, v82, (char *)&type metadata for Any + 8, v14, 6) & 1) == 0)
    {
      swift_bridgeObjectRelease(v12);
      if (qword_1000418F0 != -1)
        swift_once(&qword_1000418F0, sub_100025CC0);
      v15 = type metadata accessor for Logger(0);
      sub_1000036A4(v15, (uint64_t)qword_100043F70);
      v16 = sub_100024E08((uint64_t)v84, (uint64_t)v82);
      v17 = Logger.logObject.getter(v16);
      v18 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v17, v18))
        goto LABEL_5;
      v19 = swift_slowAlloc(22, -1);
      v20 = (void *)swift_slowAlloc(64, -1);
      DynamicType = &type metadata for AnyHashable;
      v81[0] = v20;
      *(_DWORD *)v19 = 136315394;
      v21 = sub_100005FF0(&qword_100042690);
      v22 = String.init<A>(describing:)(&DynamicType, v21);
      v24 = v23;
      *(_QWORD *)(v19 + 4) = sub_100027030(v22, v23, (uint64_t *)v81);
      swift_bridgeObjectRelease(v24);
      *(_WORD *)(v19 + 12) = 2080;
      v25 = v83;
      v26 = sub_100003680(v82, v83);
      DynamicType = (_QWORD *)swift_getDynamicType(v26, v25, 1);
      v27 = sub_100005FF0(&qword_100042698);
      v28 = String.init<A>(describing:)(&DynamicType, v27);
      v30 = v29;
      *(_QWORD *)(v19 + 14) = sub_100027030(v28, v29, (uint64_t *)v81);
      swift_bridgeObjectRelease(v30);
      sub_10000EE64(v82);
      v31 = v17;
      v32 = v18;
      v33 = "value in IDS query results was not IDSIDInfoResult. Skipping. key type: %s, value type: %s";
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v31, v32, v33, (uint8_t *)v19, 0x16u);
      swift_arrayDestroy(v20, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v19, -1, -1);

      goto LABEL_6;
    }
    v75 = v81[0];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v76);
    v82[0] = v76;
    v49 = sub_1000276E8((uint64_t)v13, (uint64_t)v12);
    v50 = *(_QWORD *)(v76 + 16);
    v51 = (v48 & 1) == 0;
    v52 = v50 + v51;
    if (__OFADD__(v50, v51))
      goto LABEL_57;
    if (*(_QWORD *)(v76 + 24) >= v52)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v64 = v48;
        sub_100028AA8();
        v48 = v64;
      }
    }
    else
    {
      v77 = v48;
      sub_100028274(v52, isUniquelyReferenced_nonNull_native);
      v53 = sub_1000276E8((uint64_t)v13, (uint64_t)v12);
      v55 = v54 & 1;
      v48 = v77;
      if ((v77 & 1) != v55)
        goto LABEL_60;
      v49 = v53;
    }
    v56 = (_QWORD *)v82[0];
    v76 = v82[0];
    if ((v48 & 1) != 0)
    {
      v57 = *(_QWORD *)(v82[0] + 56);
      v58 = 8 * v49;

      *(_QWORD *)(v57 + v58) = v75;
      v59 = v75;
    }
    else
    {
      *(_QWORD *)(v82[0] + 8 * (v49 >> 6) + 64) |= 1 << v49;
      v60 = (_QWORD *)(v56[6] + 16 * v49);
      *v60 = v13;
      v60[1] = v12;
      *(_QWORD *)(v56[7] + 8 * v49) = v75;
      v61 = v56[2];
      v62 = __OFADD__(v61, 1);
      v63 = v61 + 1;
      if (v62)
        goto LABEL_58;
      v59 = v75;
      v56[2] = v63;
      swift_bridgeObjectRetain(v12);
    }

    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(0x8000000000000000);
LABEL_6:
    sub_10000EE64(v84);
    sub_100024E9C((uint64_t)&v85);
  }
  v10 = *(_QWORD *)(v78 + 8 * v11);
  if (v10)
  {
LABEL_16:
    v9 = v11;
LABEL_13:
    v6 = (v10 - 1) & v10;
    v8 = __clz(__rbit64(v10)) + (v9 << 6);
    v3 = v9;
    goto LABEL_9;
  }
  while (1)
  {
    v9 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v9 >= v79)
    {
      v3 = v79 - 1;
      goto LABEL_27;
    }
    v10 = *(_QWORD *)(v78 + 8 * v9);
    ++v11;
    if (v10)
      goto LABEL_13;
  }
LABEL_59:
  __break(1u);
LABEL_60:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100024C1C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a2)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v7 = a3;
  v5(v6, a3);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

unint64_t sub_100024CB0()
{
  unint64_t result;

  result = qword_100042668;
  if (!qword_100042668)
  {
    result = swift_getWitnessTable(&unk_100030D44, &type metadata for IDSLookupController.Error);
    atomic_store(result, (unint64_t *)&qword_100042668);
  }
  return result;
}

void sub_100024CF4(uint64_t a1)
{
  uint64_t v1;

  sub_100024224(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_100024D00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005FF0((uint64_t *)&unk_100042680);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100024D64(uint64_t a1, uint64_t a2)
{
  sub_100005FF0((uint64_t *)&unk_100042680);
  return sub_100024464(a1, a2);
}

uint64_t sub_100024DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100024DC4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100024DCC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100024E08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100024E44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005FF0((uint64_t *)&unk_100042A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100024E8C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100024E9C(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100024ED0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1000276E8(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100028594();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_100027970(v15, a4 & 1);
  v21 = sub_1000276E8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

id sub_10002502C(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  v4 = v3;
  v7 = *v3;
  v9 = sub_10002774C((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10002874C();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_bridgeObjectRelease(*(_QWORD *)(v16 + 8 * v9));
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_100027C8C(v12, a3 & 1);
  v18 = sub_10002774C((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  v24 = sub_10001934C(0, (unint64_t *)&qword_100042560, FAFamilyMember_ptr);
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v24);
  __break(1u);
  return result;
}

_QWORD *sub_10002518C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v3 = sub_100005FF0(&qword_1000426C0);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_1000168D0((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_100016E20(v8);
  if (v7 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v4;
}

unint64_t sub_100025270()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000426B8;
  if (!qword_1000426B8)
  {
    v1 = sub_10001934C(255, (unint64_t *)&qword_100042560, FAFamilyMember_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000426B8);
  }
  return result;
}

unint64_t sub_1000252C8()
{
  unint64_t result;

  result = qword_1000426C8;
  if (!qword_1000426C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000426C8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for IDSLookupController.Error(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = *a2;
  if (*a2 >= 0xFFFFFFFFuLL)
    swift_errorRetain(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for IDSLookupController.Error(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_errorRelease(result);
  return result;
}

unint64_t *assignWithCopy for IDSLookupController.Error(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
      swift_errorRetain(*a2);
    *a1 = v4;
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_errorRelease(v3);
    *a1 = *a2;
  }
  else
  {
    swift_errorRetain(*a2);
    v5 = *a1;
    *a1 = v4;
    swift_errorRelease(v5);
  }
  return a1;
}

unint64_t *assignWithTake for IDSLookupController.Error(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v4 < 0xFFFFFFFF)
  {
    swift_errorRelease(v3);
LABEL_5:
    *a1 = v4;
    return a1;
  }
  *a1 = v4;
  swift_errorRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for IDSLookupController.Error(uint64_t *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IDSLookupController.Error(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for IDSLookupController.Error()
{
  return &type metadata for IDSLookupController.Error;
}

uint64_t *sub_1000254FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v11);
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void sub_100025588(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t sub_1000255CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t sub_10002562C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t sub_100025694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_1000256F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = type metadata accessor for UUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t sub_100025754(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100025760);
}

uint64_t sub_100025760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000257DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000257E8);
}

uint64_t sub_1000257E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_100025860(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BiomeEventKind(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BiomeEventKind(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10002596C + 4 * byte_100030D94[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10002598C + 4 * byte_100030D99[v4]))();
}

_BYTE *sub_10002596C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10002598C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100025994(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10002599C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000259A4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000259AC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1000259B8()
{
  return 0;
}

ValueMetadata *type metadata accessor for BiomeEventKind()
{
  return &type metadata for BiomeEventKind;
}

unint64_t sub_1000259D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042760;
  if (!qword_100042760)
  {
    v1 = sub_100009B48(&qword_100042768);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100042760);
  }
  return result;
}

uint64_t sub_100025A20()
{
  return 1;
}

Swift::Int sub_100025A28()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0xD000000000000011, 0x8000000100031230);
  return Hasher._finalize()();
}

uint64_t sub_100025A7C(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000011, 0x8000000100031230);
}

Swift::Int sub_100025A98(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0xD000000000000011, 0x8000000100031230);
  return Hasher._finalize()();
}

uint64_t sub_100025AE8@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003CEE8, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100025B38(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000011;
  a1[1] = 0x8000000100031230;
}

unint64_t sub_100025B58()
{
  return 0xD000000000000011;
}

void sub_100025B74(_QWORD *a1@<X8>)
{
  *a1 = &off_10003CF20;
}

unint64_t sub_100025B88()
{
  unint64_t result;

  result = qword_100042770;
  if (!qword_100042770)
  {
    result = swift_getWitnessTable(&unk_100030E88, &type metadata for BiomeEventKind);
    atomic_store(result, (unint64_t *)&qword_100042770);
  }
  return result;
}

uint64_t sub_100025BCC(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043EF8, 0x6E6F6D656144, 0xE600000000000000);
}

uint64_t sub_100025BE8(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043F10, 0xD000000000000011, 0x8000000100032720);
}

uint64_t *sub_100025C0C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100025C4C(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043F28, 0xD000000000000018, 0x80000001000327A0);
}

uint64_t sub_100025C70(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043F40, 0x6567617373654D69, 0xEE007265646E6553);
}

uint64_t sub_100025C9C(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043F58, 0xD000000000000018, 0x8000000100032780);
}

uint64_t sub_100025CC0(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043F70, 0xD000000000000013, 0x8000000100032760);
}

uint64_t sub_100025CE4(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043F88, 0x79616C6552534449, 0xE800000000000000);
}

uint64_t sub_100025D04(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043FA0, 0x656D6F6942, 0xE500000000000000);
}

uint64_t sub_100025D20(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043FB8, 0xD000000000000017, 0x8000000100032740);
}

uint64_t sub_100025D44(uint64_t a1)
{
  return sub_100025D6C(a1, qword_100043FD0, 0x736567617373654DLL, 0xEB00000000495053);
}

uint64_t sub_100025D6C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_100025C0C(v7, a2);
  sub_1000036A4(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0x6C7070612E6D6F63, 0xEF6F546B73412E65, a3, a4);
}

unint64_t sub_100025DE8(uint64_t a1)
{
  return sub_100025E00(a1, &qword_1000428D8);
}

unint64_t sub_100025DF4(uint64_t a1)
{
  return sub_100025E00(a1, &qword_1000428B8);
}

unint64_t sub_100025E00(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FF0(a2);
  v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  v5 = (_QWORD *)v4;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v5;
  }
  swift_retain(v4);
  v7 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v8 = *(v7 - 2);
    v9 = *(v7 - 1);
    v10 = *v7;
    swift_bridgeObjectRetain(v9);
    swift_retain(v10);
    result = sub_1000276E8(v8, v9);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v5[6] + 16 * result);
    *v13 = v8;
    v13[1] = v9;
    *(_QWORD *)(v5[7] + 8 * result) = v10;
    v14 = v5[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v5[2] = v16;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100025F14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FF0(&qword_1000428C0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_1000276E8(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
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

unint64_t sub_10002602C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FF0(&qword_1000428C8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = (id)*(v6 - 1);
    swift_bridgeObjectRetain(v7);
    result = sub_10002774C((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v4[6] + v11) = v8;
    *(_QWORD *)(v4[7] + v11) = v7;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
    v6 += 2;
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

unint64_t sub_100026134(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FF0(&qword_1000428A8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v7 = *((_QWORD *)v6 - 2);
    v8 = *((_QWORD *)v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    result = sub_1000276E8(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_BYTE *)(v4[7] + result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6 += 24;
    v4[2] = v15;
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

unint64_t sub_100026244(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005FF0(&qword_1000428B0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (_OWORD *)(a1 + 48);
  while (1)
  {
    v7 = *((_QWORD *)v6 - 2);
    v8 = *((_QWORD *)v6 - 1);
    v15 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_retain(*((_QWORD *)&v15 + 1));
    result = sub_1000276E8(v7, v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v4[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    *(_OWORD *)(v4[7] + 16 * result) = v15;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
    v6 += 2;
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

uint64_t sub_10002636C(uint64_t a1)
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

__objc2_prot *sub_100026398()
{
  qword_100043FE8 = (uint64_t)&OBJC_PROTOCOL____TtP9AskToCore22ATDaemonClientProtocol_;
  return &OBJC_PROTOCOL____TtP9AskToCore22ATDaemonClientProtocol_;
}

uint64_t sub_1000263AC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t (*v14)();
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  _QWORD *v19;
  uint64_t (*v20)();
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  _QWORD *v25;
  void **aBlock;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t (*v31)();
  _QWORD *v32;

  v2 = v1;
  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = UUID.init()(v6);
  v10 = UUID.uuidString.getter(v9);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  *(_QWORD *)(v2 + 16) = v10;
  *(_QWORD *)(v2 + 24) = v12;
  *(_BYTE *)(v2 + 40) = 0;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_BYTE *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 32) = a1;
  v13 = a1;
  v14 = (uint64_t (*)())objc_msgSend(v13, "interruptionHandler");
  if (v14)
  {
    v15 = swift_allocObject(&unk_10003E890, 24, 7);
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_100029A78;
  }
  else
  {
    v15 = 0;
  }
  v16 = swift_allocObject(&unk_10003E7A0, 24, 7);
  swift_weakInit(v16 + 16, v2);
  v17 = (_QWORD *)swift_allocObject(&unk_10003E7C8, 40, 7);
  v17[2] = v14;
  v17[3] = v15;
  v17[4] = v16;
  v31 = sub_100029A88;
  v32 = v17;
  aBlock = _NSConcreteStackBlock;
  v28 = 1107296256;
  v29 = sub_10002636C;
  v30 = &unk_10003E7E0;
  v18 = _Block_copy(&aBlock);
  v19 = v32;
  sub_1000299E4((uint64_t)v14, v15);
  swift_release(v19);
  objc_msgSend(v13, "setInterruptionHandler:", v18);
  _Block_release(v18);
  v20 = (uint64_t (*)())objc_msgSend(v13, "invalidationHandler");
  if (v20)
  {
    v21 = swift_allocObject(&unk_10003E868, 24, 7);
    *(_QWORD *)(v21 + 16) = v20;
    v20 = sub_100029A6C;
  }
  else
  {
    v21 = 0;
  }
  v22 = swift_allocObject(&unk_10003E7A0, 24, 7);
  swift_weakInit(v22 + 16, v2);
  v23 = (_QWORD *)swift_allocObject(&unk_10003E818, 40, 7);
  v23[2] = v20;
  v23[3] = v21;
  v23[4] = v22;
  v31 = sub_100029A2C;
  v32 = v23;
  aBlock = _NSConcreteStackBlock;
  v28 = 1107296256;
  v29 = sub_10002636C;
  v30 = &unk_10003E830;
  v24 = _Block_copy(&aBlock);
  v25 = v32;
  sub_1000299E4((uint64_t)v20, v21);
  swift_release(v25);
  objc_msgSend(v13, "setInvalidationHandler:", v24);

  _Block_release(v24);
  sub_100006BB4((uint64_t)v20, v21);
  sub_100006BB4((uint64_t)v14, v15);
  return v2;
}

uint64_t sub_100026688(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v3 = a3 + 16;
  if (a1)
    a1();
  swift_beginAccess(v3, v11, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    *(_BYTE *)(result + 40) = 0;
    v6 = *(_QWORD *)(result + 48);
    v7 = *(_QWORD *)(v5 + 56);
    v8 = *(_QWORD *)(v5 + 64);
    v9 = *(_QWORD *)(v5 + 72);
    v10 = *(_QWORD *)(v5 + 80);
    *(_OWORD *)(v5 + 48) = 0u;
    *(_OWORD *)(v5 + 64) = 0u;
    *(_OWORD *)(v5 + 80) = 0u;
    *(_BYTE *)(v5 + 96) = 0;
    sub_100029974(v6, v7, v8, v9, v10);
    return swift_release(v5);
  }
  return result;
}

void sub_100026710()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11[8];
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  char v16;

  if ((*(_BYTE *)(v0 + 40) & 1) == 0)
  {
    v1 = *(void **)(v0 + 32);
    objc_msgSend(v1, "activate");
    sub_100028E1C(v1, v11);
    v2 = v12;
    v3 = v13;
    v4 = v15;
    v5 = v16;
    v6 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 56);
    v8 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 80);
    *(_QWORD *)(v0 + 48) = v11[0];
    *(_QWORD *)(v0 + 56) = v2;
    *(_QWORD *)(v0 + 64) = v3;
    *(_OWORD *)(v0 + 72) = v14;
    *(_QWORD *)(v0 + 88) = v4;
    *(_BYTE *)(v0 + 96) = v5;
    sub_100029974(v6, v7, v8, v9, v10);
    *(_BYTE *)(v0 + 40) = 1;
  }
}

uint64_t sub_10002679C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  sub_100029974(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  return swift_deallocClassInstance(v0, 97, 7);
}

uint64_t type metadata accessor for Client()
{
  return objc_opt_self(_TtC6asktod6Client);
}

uint64_t destroy for Client.Metadata(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 32));
}

uint64_t initializeWithCopy for Client.Metadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t assignWithCopy for Client.Metadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v8;
  return a1;
}

__n128 initializeWithTake for Client.Metadata(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Client.Metadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for Client.Metadata(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Client.Metadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Client.Metadata()
{
  return &type metadata for Client.Metadata;
}

uint64_t storeEnumTagSinglePayload for Client.Known(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100026A68 + 4 * byte_100030ECD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100026A9C + 4 * asc_100030EC8[v4]))();
}

uint64_t sub_100026A9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100026AA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100026AACLL);
  return result;
}

uint64_t sub_100026AB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100026AC0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_100026AC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100026ACC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Client.Known()
{
  return &type metadata for Client.Known;
}

id sub_100026AE8()
{
  if (qword_100041918 != -1)
    swift_once(&qword_100041918, sub_100026398);
  return (id)qword_100043FE8;
}

uint64_t sub_100026B28(void **a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v2 = *a1;
  v3 = swift_allocObject(v1, 97, 7);
  sub_1000263AC(v2);
  return v3;
}

uint64_t sub_100026B68@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_100026B78()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 24));
  return v1;
}

void sub_100026BA8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100026BEC()
{
  uint64_t v0;

  _StringGuts.grow(_:)(21);
  swift_bridgeObjectRelease(0xE000000000000000);
  return v0 + 7;
}

void sub_100026C88()
{
  void *v0;

  sub_100026CA4();
  off_100042778 = v0;
}

void sub_100026CA4()
{
  sub_100026134((uint64_t)&_swiftEmptyArrayStorage);
  JUMPOUT(0x100026DB0);
}

void sub_100026EEC(_QWORD *a1@<X8>)
{
  *a1 = &off_10003CF48;
}

void sub_100026EFC()
{
  char *v0;

  sub_100026BA8(*v0);
}

unint64_t sub_100026F08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100042838;
  if (!qword_100042838)
  {
    v1 = sub_100009B48(&qword_100042840);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100042838);
  }
  return result;
}

unint64_t sub_100026F58()
{
  unint64_t result;

  result = qword_100042848;
  if (!qword_100042848)
  {
    result = swift_getWitnessTable(&unk_100030FD0, &type metadata for Client.Known);
    atomic_store(result, (unint64_t *)&qword_100042848);
  }
  return result;
}

void *sub_100026F9C()
{
  return &protocol witness table for String;
}

uint64_t sub_100026FA8(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_100026FF4(&qword_100042890, (uint64_t)&unk_100030FF8);
  result = sub_100026FF4(&qword_100042898, (uint64_t)&unk_100031020);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_100026FF4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Client();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100027030(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100027100(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100024E08((uint64_t)v12, *a3);
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
      sub_100024E08((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000EE64(v12);
  return v7;
}

uint64_t sub_100027100(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_1000272B8(a5, a6);
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

uint64_t sub_1000272B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10002734C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10002759C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10002759C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10002734C(uint64_t a1, unint64_t a2)
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
      v5 = sub_1000274C0(v4, 0);
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

_QWORD *sub_1000274C0(uint64_t a1, uint64_t a2)
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
  v4 = sub_100005FF0(&qword_1000428A0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100027524(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_10002759C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100005FF0(&qword_1000428A0);
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

unint64_t sub_1000276E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10002777C(a1, a2, v5);
}

unint64_t sub_10002774C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10002785C(a1, v4);
}

unint64_t sub_10002777C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10002785C(uint64_t a1, uint64_t a2)
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
    sub_10001FEE4();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

Swift::Int sub_100027964(uint64_t a1, uint64_t a2)
{
  return sub_10002797C(a1, a2, &qword_1000428D8);
}

Swift::Int sub_100027970(uint64_t a1, uint64_t a2)
{
  return sub_10002797C(a1, a2, &qword_1000428B8);
}

Swift::Int sub_10002797C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
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
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v4 = v3;
  v6 = *v3;
  if (*(_QWORD *)(*v3 + 24) <= a1)
    v7 = a1;
  else
    v7 = *(_QWORD *)(*v3 + 24);
  sub_100005FF0(a3);
  v38 = a2;
  v8 = static _DictionaryStorage.resize(original:capacity:move:)(v6, v7, a2);
  v9 = v8;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_43;
  v10 = 1 << *(_BYTE *)(v6 + 32);
  v37 = v6 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v12 = v11 & *(_QWORD *)(v6 + 64);
  v36 = (unint64_t)(v10 + 63) >> 6;
  v13 = v8 + 64;
  result = swift_retain(v6);
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v21 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v36)
      break;
    v24 = (_QWORD *)(v6 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v36)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v36)
        {
LABEL_36:
          swift_release(v6);
          if ((v38 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v36)
              goto LABEL_36;
            v25 = *(_QWORD *)(v37 + 8 * v15);
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
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v22);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain(v31[1]);
      swift_retain(v34);
    }
    Hasher.init(_seed:)(v39, *(_QWORD *)(v9 + 40));
    String.hash(into:)(v39, v33, v32);
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
          goto LABEL_44;
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
    v20 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v19);
    *v20 = v33;
    v20[1] = v32;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v19) = v34;
    ++*(_QWORD *)(v9 + 16);
  }
  swift_release(v6);
  v24 = (_QWORD *)(v6 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_43:
  result = swift_release(v6);
  *v4 = v9;
  return result;
}

Swift::Int sub_100027C8C(uint64_t a1, uint64_t a2)
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
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005FF0(&qword_1000428C8);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v3;
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v12)
              goto LABEL_36;
            v25 = *(_QWORD *)(v37 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v5 + 48) + v31);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      swift_bridgeObjectRetain(v33);
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v16 = -1 << *(_BYTE *)(v8 + 32);
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
          goto LABEL_44;
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
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100027F60(uint64_t a1, uint64_t a2)
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
  char v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100005FF0(&qword_1000428A8);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v36)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v36)
        goto LABEL_36;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_36:
          swift_release(v5);
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v36)
              goto LABEL_36;
            v24 = *(_QWORD *)(v37 + 8 * v14);
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
    v33 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v21);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain(v30[1]);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v32, v31);
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
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100028268(uint64_t a1, uint64_t a2)
{
  return sub_100028280(a1, a2, &qword_1000428D0);
}

Swift::Int sub_100028274(uint64_t a1, uint64_t a2)
{
  return sub_100028280(a1, a2, &qword_1000428C0);
}

Swift::Int sub_100028280(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
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
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  uint64_t v39;
  char v40;
  _QWORD v41[9];

  v4 = v3;
  v6 = *v3;
  if (*(_QWORD *)(*v3 + 24) <= a1)
    v7 = a1;
  else
    v7 = *(_QWORD *)(*v3 + 24);
  sub_100005FF0(a3);
  v40 = a2;
  v8 = static _DictionaryStorage.resize(original:capacity:move:)(v6, v7, a2);
  v9 = v8;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_43;
  v10 = 1 << *(_BYTE *)(v6 + 32);
  v39 = v6 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v12 = v11 & *(_QWORD *)(v6 + 64);
  v37 = v4;
  v38 = (unint64_t)(v10 + 63) >> 6;
  v13 = v8 + 64;
  result = swift_retain(v6);
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v21 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v38)
      break;
    v24 = (_QWORD *)(v6 + 64);
    v25 = *(_QWORD *)(v39 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v38)
        goto LABEL_36;
      v25 = *(_QWORD *)(v39 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v38)
        {
LABEL_36:
          swift_release(v6);
          v4 = v37;
          if ((v40 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v39 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v38)
              goto LABEL_36;
            v25 = *(_QWORD *)(v39 + 8 * v15);
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
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v22);
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain(v31[1]);
      v35 = v34;
    }
    Hasher.init(_seed:)(v41, *(_QWORD *)(v9 + 40));
    String.hash(into:)(v41, v33, v32);
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
          goto LABEL_44;
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
    v20 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v19);
    *v20 = v33;
    v20[1] = v32;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v19) = v34;
    ++*(_QWORD *)(v9 + 16);
  }
  swift_release(v6);
  v4 = v37;
  v24 = (_QWORD *)(v6 + 64);
  if ((v40 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v36 = 1 << *(_BYTE *)(v6 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_43:
  result = swift_release(v6);
  *v4 = v9;
  return result;
}

void *sub_100028588()
{
  return sub_1000285A0(&qword_1000428D8);
}

void *sub_100028594()
{
  return sub_1000285A0(&qword_1000428B8);
}

void *sub_1000285A0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  sub_100005FF0(a1);
  v3 = *v1;
  v4 = static _DictionaryStorage.copy(original:)(*v1);
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v3);
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19);
    result = (void *)swift_retain(v21);
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

void *sub_10002874C()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100005FF0(&qword_1000428C8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000288F4()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100005FF0(&qword_1000428A8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain(v17);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100028A9C()
{
  return sub_100028AB4(&qword_1000428D0);
}

id sub_100028AA8()
{
  return sub_100028AB4(&qword_1000428C0);
}

id sub_100028AB4(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  sub_100005FF0(a1);
  v3 = *v1;
  v4 = static _DictionaryStorage.copy(original:)(*v1);
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release(v3);
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain(v19);
    result = v21;
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

void *sub_100028C5C()
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
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  sub_100005FF0(&qword_1000428B0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_retain(*((_QWORD *)&v24 + 1));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_100028E1C(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  SecTaskRef v53;
  __SecTask *v54;
  CFStringRef v55;
  __CFString *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  id v65;
  char v66;
  id v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  unint64_t v78;
  char v79;
  char v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  void *v84;
  unsigned int v85;
  uint64_t v86;
  unsigned int v87;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  audit_token_t token;

  v96 = a2;
  v98 = type metadata accessor for Logger(0);
  v94 = *(_QWORD *)(v98 - 8);
  __chkstk_darwin(v98);
  v93 = (char *)&v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  token.val[0] = objc_msgSend(a1, "processIdentifier");
  v97 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
  v5 = v4;
  v6 = a1;
  objc_msgSend(a1, "auditToken");
  v7 = token.val[0];
  v8 = token.val[1];
  v9 = token.val[2];
  LODWORD(a1) = token.val[3];
  v10 = token.val[4];
  v11 = token.val[5];
  v12 = token.val[6];
  v13 = token.val[7];
  v14 = (void *)objc_opt_self(LSBundleRecord);
  v101 = 0;
  token.val[0] = v7;
  token.val[1] = v8;
  v91 = a1;
  v92 = v9;
  token.val[2] = v9;
  token.val[3] = a1;
  v89 = v11;
  v90 = v10;
  token.val[4] = v10;
  token.val[5] = v11;
  v87 = v13;
  v88 = v12;
  token.val[6] = v12;
  token.val[7] = v13;
  v15 = objc_msgSend(v14, "bundleRecordForAuditToken:error:", &token, &v101);
  v16 = v101;
  v95 = v5;
  if (v15)
  {
    v17 = v15;
    v18 = objc_opt_self(LSApplicationRecord);
    v19 = (void *)swift_dynamicCastObjCClass(v17, v18);
    v20 = v16;
    if (v19)
    {
      v101 = 0;
      v102 = 0;
      v21 = qword_1000418D0;
      v22 = v19;
      v23 = v6;
      if (v21 != -1)
        swift_once(&qword_1000418D0, sub_100025BE8);
      sub_1000036A4(v98, (uint64_t)qword_100043F10);
      swift_bridgeObjectRetain_n(v5, 2);
      v25 = Logger.logObject.getter(v24);
      v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc(12, -1);
        v28 = swift_slowAlloc(32, -1);
        *(_QWORD *)token.val = v28;
        *(_DWORD *)v27 = 136315138;
        swift_bridgeObjectRetain(v5);
        v99 = sub_100027030(v97, v5, (uint64_t *)&token);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v27 + 4, v27 + 12);
        swift_bridgeObjectRelease_n(v5, 3);
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Got LSApplicationRecord for process with PID %s", v27, 0xCu);
        swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v28, -1, -1);
        swift_slowDealloc(v27, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v5, 2);
      }
      v42 = objc_msgSend(v22, "bundleIdentifier");
      if (v42)
      {
        v43 = v42;
        v44 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
        v46 = v45;

      }
      else
      {
        v44 = 0;
        v46 = 0;
      }
      v101 = v44;
      v102 = v46;
      v67 = objc_msgSend(v22, "iTunesMetadata");
      v65 = objc_msgSend(v67, "storeItemIdentifier");

      v66 = 0;
      goto LABEL_38;
    }
    v85 = v7;

    v23 = v6;
  }
  else
  {
    v85 = v7;
    LODWORD(v86) = v8;
    v29 = v101;
    v30 = _convertNSErrorToError(_:)(v16);

    swift_willThrow(v31);
    if (qword_1000418D0 != -1)
      swift_once(&qword_1000418D0, sub_100025BE8);
    sub_1000036A4(v98, (uint64_t)qword_100043F10);
    swift_bridgeObjectRetain(v5);
    swift_errorRetain(v30);
    swift_bridgeObjectRetain(v5);
    v32 = swift_errorRetain(v30);
    v33 = Logger.logObject.getter(v32);
    v34 = static os_log_type_t.error.getter();
    v23 = v6;
    if (os_log_type_enabled(v33, v34))
    {
      v35 = swift_slowAlloc(22, -1);
      v36 = (_QWORD *)swift_slowAlloc(8, -1);
      v37 = swift_slowAlloc(32, -1);
      v84 = v6;
      v38 = v37;
      *(_QWORD *)token.val = v37;
      *(_DWORD *)v35 = 136315394;
      swift_bridgeObjectRetain(v5);
      v101 = (id)sub_100027030(v97, v5, (uint64_t *)&token);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, &v102, v35 + 4, v35 + 12);
      swift_bridgeObjectRelease_n(v5, 3);
      *(_WORD *)(v35 + 12) = 2112;
      swift_errorRetain(v30);
      v39 = v5;
      v40 = (void *)_swift_stdlib_bridgeErrorToNSError(v30);
      v101 = v40;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v101, &v102, v35 + 14, v35 + 22);
      *v36 = v40;
      v5 = v39;
      swift_errorRelease(v30);
      swift_errorRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "Error obtaining bundle record for connection to PID %s: %@", (uint8_t *)v35, 0x16u);
      v41 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v36, 1, v41);
      swift_slowDealloc(v36, -1, -1);
      swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
      v23 = v84;
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v35, -1, -1);

      swift_errorRelease(v30);
    }
    else
    {
      swift_errorRelease(v30);
      swift_bridgeObjectRelease_n(v5, 2);
      swift_errorRelease(v30);
      swift_errorRelease(v30);

    }
    v8 = v86;
  }
  v101 = 0;
  v102 = 0;
  if (qword_1000418D0 != -1)
    swift_once(&qword_1000418D0, sub_100025BE8);
  v47 = sub_1000036A4(v98, (uint64_t)qword_100043F10);
  swift_bridgeObjectRetain_n(v5, 2);
  v86 = v47;
  v49 = Logger.logObject.getter(v48);
  v50 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc(12, -1);
    v52 = swift_slowAlloc(32, -1);
    *(_QWORD *)token.val = v52;
    *(_DWORD *)v51 = 136315138;
    swift_bridgeObjectRetain(v5);
    v99 = sub_100027030(v97, v5, (uint64_t *)&token);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v51 + 4, v51 + 12);
    swift_bridgeObjectRelease_n(v5, 3);
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Could not get LSApplicationRecord for process with PID %s", v51, 0xCu);
    swift_arrayDestroy(v52, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v52, -1, -1);
    swift_slowDealloc(v51, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v5, 2);
  }
  token.val[0] = v85;
  token.val[1] = v8;
  token.val[2] = v92;
  token.val[3] = v91;
  token.val[4] = v90;
  token.val[5] = v89;
  token.val[6] = v88;
  token.val[7] = v87;
  v53 = SecTaskCreateWithAuditToken(0, &token);
  if (v53)
  {
    v54 = v53;
    swift_bridgeObjectRelease(v102);
    v55 = SecTaskCopySigningIdentifier(v54, 0);
    v84 = v23;
    if (v55)
    {
      v56 = (__CFString *)v55;
      v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
      v59 = v58;

    }
    else
    {
      v57 = 0;
      v59 = 0;
    }
    v101 = (id)v57;
    v102 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v93, v86, v98);
    swift_bridgeObjectRetain_n(v59, 2);
    v69 = Logger.logObject.getter(v68);
    v70 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc(12, -1);
      v72 = swift_slowAlloc(32, -1);
      *(_QWORD *)token.val = v72;
      *(_DWORD *)v71 = 136315138;
      if (v59)
      {
        v73 = v59;
      }
      else
      {
        v57 = 7104878;
        v73 = 0xE300000000000000;
      }
      swift_bridgeObjectRetain(v59);
      v99 = sub_100027030(v57, v73, (uint64_t *)&token);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v71 + 4, v71 + 12);
      swift_bridgeObjectRelease_n(v59, 2);
      swift_bridgeObjectRelease(v73);
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "Bundle identifier from signing identity is %s", v71, 0xCu);
      v66 = 1;
      swift_arrayDestroy(v72, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v72, -1, -1);
      swift_slowDealloc(v71, -1, -1);

      (*(void (**)(char *, uint64_t))(v94 + 8))(v93, v98);
      v22 = 0;
      v65 = 0;
      v23 = v84;
    }
    else
    {

      swift_bridgeObjectRelease_n(v59, 2);
      (*(void (**)(char *, uint64_t))(v94 + 8))(v93, v98);
      v22 = 0;
      v65 = 0;
      v66 = 1;
      v23 = v84;
    }
  }
  else
  {
    swift_bridgeObjectRetain_n(v5, 2);
    v61 = Logger.logObject.getter(v60);
    v62 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc(12, -1);
      v64 = swift_slowAlloc(32, -1);
      *(_QWORD *)token.val = v64;
      *(_DWORD *)v63 = 136315138;
      swift_bridgeObjectRetain(v5);
      v99 = sub_100027030(v97, v5, (uint64_t *)&token);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v63 + 4, v63 + 12);
      swift_bridgeObjectRelease_n(v5, 3);
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "Failed to get signing info for connection to PID %s", v63, 0xCu);
      swift_arrayDestroy(v64, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v64, -1, -1);
      swift_slowDealloc(v63, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v5, 2);
    }
    v22 = 0;
    v65 = 0;
    v66 = 1;
  }
LABEL_38:
  swift_beginAccess(&v101, &token, 0, 0);
  v75 = (uint64_t)v101;
  v74 = v102;
  if (!v102)
  {

    goto LABEL_46;
  }
  v76 = qword_100041920;
  swift_bridgeObjectRetain(v102);
  if (v76 != -1)
    swift_once(&qword_100041920, sub_100026C88);
  v77 = off_100042778;
  if (!*((_QWORD *)off_100042778 + 2) || (v78 = sub_1000276E8(v75, v74), (v79 & 1) == 0))
  {

    swift_bridgeObjectRelease(v74);
LABEL_46:
    v80 = 4;
    goto LABEL_47;
  }
  v80 = *(_BYTE *)(v77[7] + v78);

  swift_bridgeObjectRelease(v74);
LABEL_47:
  v81 = v96;
  v82 = v97;
  *v96 = v80;
  v83 = v95;
  *((_QWORD *)v81 + 1) = v82;
  *((_QWORD *)v81 + 2) = v83;
  *((_QWORD *)v81 + 3) = v75;
  *((_QWORD *)v81 + 4) = v74;
  *((_QWORD *)v81 + 5) = v65;
  v81[48] = v66;
}

uint64_t sub_100029974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(a5);
  }
  return result;
}

uint64_t sub_1000299A4()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000299CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000299DC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000299E4(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_1000299F8()
{
  _QWORD *v0;

  if (v0[2])
    swift_release(v0[3]);
  swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100029A2C()
{
  uint64_t v0;

  return sub_100026688(*(void (**)(void))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100029A48()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100029A6C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100029A8C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1000068A0(a1, &qword_100042990);
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
  v16 = swift_allocObject(&unk_10003E9A0, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000429B8, v16);
}

uint64_t sub_100029BD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v5;
  char v6;
  _BYTE v7[40];
  _BYTE v8[32];

  result = sub_10002CDD8(a1);
  if ((v6 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
  {
    *(_QWORD *)(a2 + 64) = 0;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    sub_10002CE60((uint64_t)v7, (uint64_t)v8, result, v5, 0, a1);
    sub_100024DCC((uint64_t)v7, a2);
    sub_100024E08((uint64_t)v8, a2 + 40);
    return sub_1000068A0((uint64_t)v7, &qword_1000429D0);
  }
  return result;
}

id sub_100029C9C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for IDSRelay()), "init");
  qword_100043FF0 = (uint64_t)result;
  return result;
}

void sub_100029CC8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  NSString v22;
  id v23;
  char *v24;
  _QWORD v25[2];
  uint64_t v26;
  char *v27;
  uint64_t v28;
  objc_super v29;
  void *v30;

  v25[0] = swift_getObjectType(v0);
  v28 = type metadata accessor for OS_dispatch_queue_serial.Attributes(0);
  __chkstk_darwin(v28);
  v27 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v2 = *(_QWORD *)(v26 - 8);
  __chkstk_darwin(v26);
  v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue_concurrent.Attributes(0);
  __chkstk_darwin(v5);
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v8);
  v10 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OBJC_IVAR____TtC6asktod8IDSRelay_pendingSendCompletions;
  v12 = v0;
  *(_QWORD *)&v0[v11] = sub_100026244((uint64_t)&_swiftEmptyArrayStorage);
  sub_10001934C(0, &qword_1000429D8, OS_dispatch_queue_concurrent_ptr);
  static DispatchQoS.background.getter();
  v30 = &_swiftEmptyArrayStorage;
  sub_10001F1A8(&qword_1000429E0, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_concurrent.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_concurrent.Attributes);
  v13 = sub_100005FF0(&qword_1000429E8);
  v14 = sub_10002ED48(&qword_1000429F0, &qword_1000429E8);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v13, v14);
  v15 = enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v17 = v26;
  v16(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v26);
  *(_QWORD *)&v12[OBJC_IVAR____TtC6asktod8IDSRelay_listenerQueue] = OS_dispatch_queue_concurrent.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001DLL, 0x8000000100032CE0, v10, v7, v4, 0);
  v25[1] = sub_10001934C(0, &qword_1000429F8, OS_dispatch_queue_serial_ptr);
  static DispatchQoS.background.getter();
  v30 = &_swiftEmptyArrayStorage;
  sub_10001F1A8(&qword_100042A00, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue_serial.Attributes);
  v18 = sub_100005FF0(&qword_100042A08);
  v19 = sub_10002ED48(&qword_100042A10, &qword_100042A08);
  v20 = v27;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v18, v19);
  v16(v4, v15, v17);
  *(_QWORD *)&v12[OBJC_IVAR____TtC6asktod8IDSRelay_senderQueue] = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001BLL, 0x8000000100032D00, v10, v20, v4, 0);
  v21 = objc_allocWithZone((Class)IDSService);
  v22 = String._bridgeToObjectiveC()();
  v23 = objc_msgSend(v21, "initWithService:", v22);

  if (v23)
  {
    *(_QWORD *)&v12[OBJC_IVAR____TtC6asktod8IDSRelay_service] = v23;

    v29.receiver = v12;
    v29.super_class = (Class)v25[0];
    v24 = (char *)objc_msgSendSuper2(&v29, "init");
    objc_msgSend(*(id *)&v24[OBJC_IVAR____TtC6asktod8IDSRelay_service], "addDelegate:queue:", v24, *(_QWORD *)&v24[OBJC_IVAR____TtC6asktod8IDSRelay_listenerQueue]);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10002A0B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v9 = sub_100005FF0(&qword_100042A18);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  __chkstk_darwin(v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = *(unsigned __int8 *)(v10 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = swift_allocObject(&unk_10003E9C8, v13 + v11, v12 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v14 + v13, (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  sub_10002A3A8(a3, a4, a5, (void (*)(void *, uint64_t))sub_10002EDEC, v14);
  return swift_release(v14);
}

uint64_t sub_10002A1B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_1000418F8 != -1)
      swift_once(&qword_1000418F8, sub_100025CE4);
    v4 = type metadata accessor for Logger(0);
    sub_1000036A4(v4, (uint64_t)qword_100043F88);
    swift_errorRetain(a2);
    v5 = swift_errorRetain(a2);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(12, -1);
      v9 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v8 = 138412290;
      swift_errorRetain(a2);
      v10 = _swift_stdlib_bridgeErrorToNSError(a2);
      v14 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v8 + 4, v8 + 12);
      *v9 = v10;
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Could not fetch valid destinations. Error: %@", v8, 0xCu);
      v11 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v9, 1, v11);
      swift_slowDealloc(v9, -1, -1);
      swift_slowDealloc(v8, -1, -1);

      swift_errorRelease(a2);
    }
    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);

    }
  }
  v14 = a1;
  swift_bridgeObjectRetain(a1);
  v12 = sub_100005FF0(&qword_100042A18);
  return CheckedContinuation.resume(returning:)(&v14, v12);
}

void sub_10002A3A8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void *, uint64_t), uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  Class isa;
  NSString v22;
  NSString v23;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void (*v36)(void *, uint64_t);
  unint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  unint64_t v46;
  _BYTE *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void (*v52)(void *, uint64_t);
  uint64_t aBlock[5];
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;

  if (qword_1000418F8 != -1)
    swift_once(&qword_1000418F8, sub_100025CE4);
  v7 = type metadata accessor for Logger(0);
  sub_1000036A4(v7, (uint64_t)qword_100043F88);
  v8 = swift_bridgeObjectRetain_n(a1, 2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  v52 = a4;
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    aBlock[0] = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain(a1);
    v13 = sub_100005FF0(&qword_100042660);
    v14 = Array.description.getter(a1, v13);
    v16 = v15;
    swift_bridgeObjectRelease(a1);
    v55 = sub_100027030(v14, v16, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease_n(a1, 2);
    swift_bridgeObjectRelease(v16);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Validating destinations for sending. destinations: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    v17 = swift_bridgeObjectRelease_n(a1, 2);
  }
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v40 = a1;
    else
      v40 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v41 = _CocoaArrayWrapper.endIndex.getter(v40);
    v17 = swift_bridgeObjectRelease(a1);
    if (v41)
    {
LABEL_8:
      v18 = objc_msgSend((id)objc_opt_self(IDSIDQueryController), "sharedInstance");
      v19 = v18;
      if (v18)
      {
        v48 = v18;
        v20 = sub_100023FE8(a1);
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v20);
        v22 = String._bridgeToObjectiveC()();
        v23 = String._bridgeToObjectiveC()();
        v50 = *(_QWORD *)(v49 + OBJC_IVAR____TtC6asktod8IDSRelay_senderQueue);
        v24 = (_QWORD *)swift_allocObject(&unk_10003E9F0, 40, 7);
        v24[2] = a1;
        v24[3] = v52;
        v24[4] = a5;
        aBlock[4] = (uint64_t)sub_10002EEB4;
        v54 = v24;
        aBlock[0] = (uint64_t)_NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_10002BB80;
        aBlock[3] = (uint64_t)&unk_10003EA08;
        v25 = _Block_copy(aBlock);
        v26 = v54;
        swift_bridgeObjectRetain(a1);
        sub_1000299E4((uint64_t)v52, a5);
        swift_release(v26);
        LOBYTE(v20) = objc_msgSend(v48, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", isa, v22, v23, v50, v25);
        _Block_release(v25);

        if ((v20 & 1) != 0)
        {

          return;
        }
      }
      v27 = swift_bridgeObjectRetain_n(a1, 2);
      v28 = Logger.logObject.getter(v27);
      v29 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc(12, -1);
        v31 = swift_slowAlloc(32, -1);
        aBlock[0] = v31;
        *(_DWORD *)v30 = 136315138;
        swift_bridgeObjectRetain(a1);
        v32 = sub_100005FF0(&qword_100042660);
        v33 = Array.description.getter(a1, v32);
        v35 = v34;
        swift_bridgeObjectRelease(a1);
        v55 = sub_100027030(v33, v35, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v30 + 4, v30 + 12);
        swift_bridgeObjectRelease_n(a1, 2);
        swift_bridgeObjectRelease(v35);
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to perform IDQuery {destinations: %s}", v30, 0xCu);
        swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v31, -1, -1);
        swift_slowDealloc(v30, -1, -1);

        v36 = v52;
        if (v52)
        {
LABEL_13:
          v37 = sub_10002EE3C();
          v38 = swift_allocError(&type metadata for IDSRelay.Error, v37, 0, 0);
          *v39 = 4;
          v36(&_swiftEmptySetSingleton, v38);

LABEL_24:
          swift_errorRelease(v38);
          return;
        }
      }
      else
      {

        swift_bridgeObjectRelease_n(a1, 2);
        v36 = v52;
        if (v52)
          goto LABEL_13;
      }

      return;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_8;
  }
  v42 = Logger.logObject.getter(v17);
  v43 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc(12, -1);
    v45 = swift_slowAlloc(32, -1);
    aBlock[0] = v45;
    *(_DWORD *)v44 = 136315138;
    v55 = sub_100027030(0xD000000000000039, 0x8000000100032D80, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v44 + 4, v44 + 12);
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "%s called with no destinations", v44, 0xCu);
    swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v45, -1, -1);
    swift_slowDealloc(v44, -1, -1);
  }

  if (v52)
  {
    v46 = sub_10002EE3C();
    v38 = swift_allocError(&type metadata for IDSRelay.Error, v46, 0, 0);
    *v47 = 0;
    v52(&_swiftEmptySetSingleton, v38);
    goto LABEL_24;
  }
}

void sub_10002AA40(uint64_t a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  Swift::Int v7;
  Swift::Int v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char **p_name;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  __int128 *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _BYTE *v76;
  __int128 *v77;
  Swift::Int v78;
  int64_t v79;
  uint64_t v80[5];
  uint64_t v81[5];
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  __int128 v90[3];

  if (!a1)
  {
    if (qword_1000418F8 != -1)
LABEL_65:
      swift_once(&qword_1000418F8, sub_100025CE4);
    v43 = type metadata accessor for Logger(0);
    sub_1000036A4(v43, (uint64_t)qword_100043F88);
    v44 = swift_bridgeObjectRetain_n(a2, 2);
    v45 = Logger.logObject.getter(v44);
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc(12, -1);
      v48 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v87 = v48;
      *(_DWORD *)v47 = 136315138;
      swift_bridgeObjectRetain(a2);
      v49 = sub_100005FF0(&qword_100042660);
      v50 = a3;
      v51 = Array.description.getter(a2, v49);
      v53 = v52;
      swift_bridgeObjectRelease(a2);
      v54 = v51;
      a3 = v50;
      *(_QWORD *)&v82 = sub_100027030(v54, v53, (uint64_t *)&v87);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v82, (char *)&v82 + 8, v47 + 4, v47 + 12);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v53);
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Result for ID query was nil. destinations: %s", v47, 0xCu);
      swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v47, -1, -1);

      if (!v50)
        return;
    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
      if (!a3)
        return;
    }
    v63 = sub_10002EE3C();
    v64 = swift_allocError(&type metadata for IDSRelay.Error, v63, 0, 0);
    *v65 = 2;
    v66 = v64;
    goto LABEL_62;
  }
  v6 = swift_bridgeObjectRetain(a1);
  v7 = sub_10002B3E4(v6);
  if (!v7)
  {
    if (qword_1000418F8 != -1)
      swift_once(&qword_1000418F8, sub_100025CE4);
    v55 = type metadata accessor for Logger(0);
    sub_1000036A4(v55, (uint64_t)qword_100043F88);
    swift_bridgeObjectRetain_n(a2, 2);
    v56 = swift_bridgeObjectRetain(a1);
    v57 = Logger.logObject.getter(v56);
    v58 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = a3;
      v60 = swift_slowAlloc(22, -1);
      v61 = swift_slowAlloc(64, -1);
      v81[0] = v61;
      *(_DWORD *)v60 = 136315394;
      v62 = swift_bridgeObjectRetain(a1);
      sub_100029BD8(v62, (uint64_t)&v87);
      swift_bridgeObjectRelease(a1);
      if (*((_QWORD *)&v88 + 1))
      {
        sub_100024E8C(v90, &v82);
        sub_100024E9C((uint64_t)&v87);
      }
      else
      {
        sub_1000068A0((uint64_t)&v87, (uint64_t *)&unk_100042A30);
        v82 = 0u;
        v83 = 0u;
      }
      v67 = sub_100005FF0(&qword_100042518);
      v68 = String.init<A>(describing:)(&v82, v67);
      v70 = v69;
      *(_QWORD *)&v87 = sub_100027030(v68, v69, v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, (char *)&v87 + 8, v60 + 4, v60 + 12);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v70);
      *(_WORD *)(v60 + 12) = 2080;
      swift_bridgeObjectRetain(a2);
      v71 = sub_100005FF0(&qword_100042660);
      v72 = Array.description.getter(a2, v71);
      v74 = v73;
      swift_bridgeObjectRelease(a2);
      *(_QWORD *)&v87 = sub_100027030(v72, v74, v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, (char *)&v87 + 8, v60 + 14, v60 + 22);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v74);
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "Result for ID query value type was not Int. first result value: %s, destinations: %s", (uint8_t *)v60, 0x16u);
      swift_arrayDestroy(v61, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v61, -1, -1);
      swift_slowDealloc(v60, -1, -1);

      a3 = v59;
      if (!v59)
        return;
    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease_n(a1, 2);
      if (!a3)
        return;
    }
    v75 = sub_10002EE3C();
    v64 = swift_allocError(&type metadata for IDSRelay.Error, v75, 0, 0);
    *v76 = 1;
    v66 = v64;
LABEL_62:
    ((void (*)(void *, uint64_t))a3)(&_swiftEmptySetSingleton, v66);
    swift_errorRelease(v64);
    return;
  }
  v8 = v7;
  v77 = a3;
  a3 = &v87;
  swift_bridgeObjectRelease(a1);
  v9 = 0;
  v10 = *(_QWORD *)(v8 + 64);
  v78 = v8 + 64;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v86 = &_swiftEmptySetSingleton;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  else
    v12 = -1;
  a2 = v12 & v10;
  v79 = (unint64_t)(v11 + 63) >> 6;
  p_name = &Client.name;
  while (1)
  {
    if (a2)
    {
      v14 = __clz(__rbit64(a2));
      a2 &= a2 - 1;
      v15 = v14 | (v9 << 6);
LABEL_13:
      sub_100024DCC(*(_QWORD *)(v8 + 48) + 40 * v15, (uint64_t)&v82);
      v16 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v15);
      goto LABEL_32;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_65;
    }
    if (v17 < v79)
    {
      v18 = *(_QWORD *)(v78 + 8 * v17);
      if (v18)
        goto LABEL_17;
      v19 = v9 + 2;
      ++v9;
      if (v17 + 1 < v79)
      {
        v18 = *(_QWORD *)(v78 + 8 * v19);
        if (v18)
          goto LABEL_20;
        v9 = v17 + 1;
        if (v17 + 2 < v79)
        {
          v18 = *(_QWORD *)(v78 + 8 * (v17 + 2));
          if (v18)
          {
            v17 += 2;
            goto LABEL_17;
          }
          v19 = v17 + 3;
          v9 = v17 + 2;
          if (v17 + 3 < v79)
            break;
        }
      }
    }
LABEL_31:
    v16 = 0;
    a2 = 0;
    v84 = 0;
    v82 = 0u;
    v83 = 0u;
LABEL_32:
    v85 = v16;
    sub_10002EED8((uint64_t)&v82, (uint64_t)&v87);
    if (!*((_QWORD *)&v88 + 1))
    {
      swift_release(v8);
      v42 = v86;
      if (v77)
        ((void (*)(void *, _QWORD))v77)(v86, 0);
      swift_bridgeObjectRelease(v42);
      return;
    }
    v82 = v87;
    v83 = v88;
    v20 = *(_QWORD *)&v90[0];
    v84 = v89;
    v21 = p_name[287];
    if (*(_QWORD *)&v90[0] == 1)
    {
      if (v21 != (char *)-1)
        swift_once(&qword_1000418F8, sub_100025CE4);
      v22 = type metadata accessor for Logger(0);
      sub_1000036A4(v22, (uint64_t)qword_100043F88);
      v23 = sub_100024DCC((uint64_t)&v82, (uint64_t)v81);
      v24 = Logger.logObject.getter(v23);
      v25 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = swift_slowAlloc(12, -1);
        v27 = swift_slowAlloc(32, -1);
        v80[0] = v27;
        *(_DWORD *)v26 = 136315138;
        v28 = AnyHashable.description.getter();
        v30 = v29;
        *(_QWORD *)(v26 + 4) = sub_100027030(v28, v29, v80);
        swift_bridgeObjectRelease(v30);
        sub_100024E9C((uint64_t)v81);
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Status for destination %s is valid. Adding to list of destinations to send message to.", (uint8_t *)v26, 0xCu);
        swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v27, -1, -1);
        v31 = v26;
        p_name = (char **)(&Client + 24);
        swift_slowDealloc(v31, -1, -1);
      }
      else
      {
        sub_100024E9C((uint64_t)v81);
      }

      sub_100024DCC((uint64_t)&v82, (uint64_t)v80);
      sub_10002C3D4((uint64_t)v81, (uint64_t)v80);
      goto LABEL_9;
    }
    if (v21 != (char *)-1)
      swift_once(&qword_1000418F8, sub_100025CE4);
    v32 = type metadata accessor for Logger(0);
    sub_1000036A4(v32, (uint64_t)qword_100043F88);
    v33 = sub_100024DCC((uint64_t)&v82, (uint64_t)v81);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v34, v35))
    {

LABEL_9:
      sub_100024E9C((uint64_t)v81);
      goto LABEL_10;
    }
    v36 = swift_slowAlloc(22, -1);
    v37 = swift_slowAlloc(32, -1);
    v80[0] = v37;
    *(_DWORD *)v36 = 136315394;
    v38 = AnyHashable.description.getter();
    v40 = v39;
    *(_QWORD *)(v36 + 4) = sub_100027030(v38, v39, v80);
    swift_bridgeObjectRelease(v40);
    sub_100024E9C((uint64_t)v81);
    *(_WORD *)(v36 + 12) = 2048;
    *(_QWORD *)(v36 + 14) = v20;
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Status for destination %s is %ld. Not sending message to this destination.", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    v41 = v36;
    p_name = (char **)(&Client + 24);
    swift_slowDealloc(v41, -1, -1);

LABEL_10:
    sub_100024E9C((uint64_t)&v82);
  }
  v18 = *(_QWORD *)(v78 + 8 * v19);
  if (v18)
  {
LABEL_20:
    v17 = v19;
LABEL_17:
    a2 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v17 << 6);
    v9 = v17;
    goto LABEL_13;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v79)
    {
      v9 = v79 - 1;
      goto LABEL_31;
    }
    v18 = *(_QWORD *)(v78 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_17;
  }
  __break(1u);
}

Swift::Int sub_10002B3E4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  Swift::Int result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  _BYTE v30[32];
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[40];
  _BYTE v38[40];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100005FF0(&qword_100042A50);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v27 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = (v6 - 1) & v6;
      v13 = __clz(__rbit64(v6)) | (v9 << 6);
      v14 = v9;
      goto LABEL_28;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v15 >= v26)
      goto LABEL_39;
    v16 = *(_QWORD *)(v27 + 8 * v15);
    v14 = v9 + 1;
    if (!v16)
    {
      v14 = v9 + 2;
      if (v9 + 2 >= v26)
        goto LABEL_39;
      v16 = *(_QWORD *)(v27 + 8 * v14);
      if (!v16)
      {
        v14 = v9 + 3;
        if (v9 + 3 >= v26)
          goto LABEL_39;
        v16 = *(_QWORD *)(v27 + 8 * v14);
        if (!v16)
        {
          v14 = v9 + 4;
          if (v9 + 4 >= v26)
            goto LABEL_39;
          v16 = *(_QWORD *)(v27 + 8 * v14);
          if (!v16)
            break;
        }
      }
    }
LABEL_27:
    v12 = (v16 - 1) & v16;
    v13 = __clz(__rbit64(v16)) + (v14 << 6);
LABEL_28:
    sub_100024DCC(*(_QWORD *)(a1 + 48) + 40 * v13, (uint64_t)v37);
    sub_100024E08(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v38);
    sub_100024DCC((uint64_t)v37, (uint64_t)&v31);
    sub_100024E08((uint64_t)v38, (uint64_t)v30);
    sub_1000068A0((uint64_t)v37, &qword_1000429D0);
    if (!swift_dynamicCast(&v28, v30, (char *)&type metadata for Any + 8, &type metadata for Int, 6))
    {
      v28 = 0;
      v29 = 1;
      sub_100024E9C((uint64_t)&v31);
      swift_release(v3);
      sub_100016E20(a1);
      swift_release(v3);
      return 0;
    }
    v18 = v28;
    v34 = v31;
    v35 = v32;
    v36 = v33;
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v19 = -1 << *((_BYTE *)v3 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)&v7[8 * (v20 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)&v7[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)&v7[8 * v21];
      }
      while (v25 == -1);
      v10 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v31;
    *(_OWORD *)(v11 + 16) = v32;
    *(_QWORD *)(v11 + 32) = v33;
    *(_QWORD *)(v3[7] + 8 * v10) = v18;
    ++v3[2];
    v9 = v14;
    v6 = v12;
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v26)
  {
LABEL_39:
    swift_release(v3);
    sub_100016E20(a1);
    return (Swift::Int)v3;
  }
  v16 = *(_QWORD *)(v27 + 8 * v17);
  if (v16)
  {
    v14 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v14 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v14 >= v26)
      goto LABEL_39;
    v16 = *(_QWORD *)(v27 + 8 * v14);
    ++v17;
    if (v16)
      goto LABEL_27;
  }
LABEL_42:
  __break(1u);
  return result;
}

void sub_10002B7B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  _OWORD v30[2];
  __int128 v31;
  _OWORD v32[2];
  _OWORD v33[2];
  _OWORD v34[2];
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[2];
  uint64_t v39;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100005FF0(&qword_1000429C8);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v26 = a1 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(a1 + 64);
  v25 = (unint64_t)(63 - v5) >> 6;
  swift_bridgeObjectRetain(a1);
  v7 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = (v6 - 1) & v6;
      v11 = __clz(__rbit64(v6)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_36;
      if (v13 >= v25)
      {
LABEL_33:
        sub_100016E20(a1);
        return;
      }
      v14 = *(_QWORD *)(v26 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v25)
          goto LABEL_33;
        v14 = *(_QWORD *)(v26 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v25)
            goto LABEL_33;
          v14 = *(_QWORD *)(v26 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v25)
              goto LABEL_33;
            v14 = *(_QWORD *)(v26 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v25)
                goto LABEL_33;
              v14 = *(_QWORD *)(v26 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_37;
                  if (v12 >= v25)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v26 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_100024DCC(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v37);
    sub_100024E08(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_100024DCC((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast(&v27, v29, &type metadata for AnyHashable, &type metadata for String, 6))
    {
      v27 = 0;
      v28 = 0;
      sub_1000068A0((uint64_t)v34, &qword_1000429D0);
      swift_bridgeObjectRelease(v28);
      sub_100016E20(a1);
      swift_release(v3);
      return;
    }
    v16 = v27;
    v17 = v28;
    sub_100024E08((uint64_t)v35 + 8, (uint64_t)v29);
    sub_1000068A0((uint64_t)v34, &qword_1000429D0);
    sub_100024E8C(v29, v30);
    *(_QWORD *)&v31 = v16;
    *((_QWORD *)&v31 + 1) = v17;
    sub_100024E8C(v30, v32);
    v18 = v31;
    sub_100024E8C(v32, v33);
    sub_100024E8C(v33, &v31);
    v19 = sub_1000276E8(v18, *((uint64_t *)&v18 + 1));
    v20 = v19;
    if ((v21 & 1) != 0)
    {
      v8 = v3[6] + 16 * v19;
      swift_bridgeObjectRelease(*(_QWORD *)(v8 + 8));
      *(_OWORD *)v8 = v18;
      v9 = (_QWORD *)(v3[7] + 32 * v20);
      sub_10000EE64(v9);
      sub_100024E8C(&v31, v9);
      goto LABEL_8;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v19;
    *(_OWORD *)(v3[6] + 16 * v19) = v18;
    sub_100024E8C(&v31, (_OWORD *)(v3[7] + 32 * v19));
    v22 = v3[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_35;
    v3[2] = v24;
LABEL_8:
    v7 = v12;
    v6 = v10;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

uint64_t sub_10002BB80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v4 = 0;
  swift_retain(v2);
  v3(v4);
  swift_release(v2);
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_10002BBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v12;

  v12 = (_QWORD *)swift_task_alloc(dword_1000429C4);
  *(_QWORD *)(v8 + 16) = v12;
  *v12 = v8;
  v12[1] = sub_10000F7AC;
  v12[4] = a7;
  v12[5] = a8;
  v12[3] = a5;
  return swift_task_switch(sub_10002CF10, 0, 0);
}

uint64_t type metadata accessor for IDSRelay()
{
  return objc_opt_self(_TtC6asktod8IDSRelay);
}

uint64_t sub_10002BE7C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_1000276E8(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  v14 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100028594();
    v10 = v14;
  }
  swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v7 + 8));
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v7);
  sub_10002C02C(v7, v10);
  v12 = *v3;
  *v3 = v10;
  swift_bridgeObjectRelease(v12);
  return v11;
}

uint64_t sub_10002BF48(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_1000276E8(a1, a2);
  LOBYTE(a2) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  v14 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100028C5C();
    v10 = v14;
  }
  swift_bridgeObjectRelease(*(_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v7 + 8));
  v11 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 16 * v7);
  sub_10002C200(v7, v10);
  v12 = *v3;
  *v3 = v10;
  swift_bridgeObjectRelease(v12);
  return v11;
}

unint64_t sub_10002C02C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

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
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v26, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10002C200(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

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
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v26, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_OWORD *)(v17 + 16 * v3);
          v19 = (_OWORD *)(v17 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10002C3D4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  Swift::Int v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  __int128 v15;
  uint64_t v17;
  _BYTE v18[40];

  v3 = v2;
  v6 = *v2;
  v7 = *(_QWORD *)(*v2 + 40);
  swift_bridgeObjectRetain(v6);
  v8 = AnyHashable._rawHashValue(seed:)(v7);
  v9 = -1 << *(_BYTE *)(v6 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    while (1)
    {
      sub_100024DCC(*(_QWORD *)(v6 + 48) + 40 * v10, (uint64_t)v18);
      v12 = static AnyHashable.== infix(_:_:)(v18, a2);
      sub_100024E9C((uint64_t)v18);
      if ((v12 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease(v6);
    sub_100024E9C(a2);
    sub_100024DCC(*(_QWORD *)(*v3 + 48) + 40 * v10, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    sub_100024DCC(a2, (uint64_t)v18);
    v17 = *v3;
    *v3 = 0x8000000000000000;
    sub_10002C814((uint64_t)v18, v10, isUniquelyReferenced_nonNull_native);
    v14 = *v3;
    *v3 = v17;
    swift_bridgeObjectRelease(v14);
    v15 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v15;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    return 1;
  }
}

Swift::Int sub_10002C54C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100005FF0(&qword_100042A48);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v31 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v18 = v17 | (v14 << 6);
      }
      else
      {
        v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v19 >= v11)
          goto LABEL_36;
        v20 = v8[v19];
        ++v14;
        if (!v20)
        {
          v14 = v19 + 1;
          if (v19 + 1 >= v11)
            goto LABEL_36;
          v20 = v8[v14];
          if (!v20)
          {
            v14 = v19 + 2;
            if (v19 + 2 >= v11)
              goto LABEL_36;
            v20 = v8[v14];
            if (!v20)
            {
              v21 = v19 + 3;
              if (v21 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v31;
                v30 = 1 << *(_BYTE *)(v3 + 32);
                if (v30 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v30;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v20 = v8[v21];
              if (!v20)
              {
                while (1)
                {
                  v14 = v21 + 1;
                  if (__OFADD__(v21, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v20 = v8[v14];
                  ++v21;
                  if (v20)
                    goto LABEL_26;
                }
              }
              v14 = v21;
            }
          }
        }
LABEL_26:
        v10 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      v22 = *(_QWORD *)(v3 + 48) + 40 * v18;
      v32 = *(_OWORD *)v22;
      v33 = *(_OWORD *)(v22 + 16);
      v34 = *(_QWORD *)(v22 + 32);
      result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v23 = -1 << *(_BYTE *)(v6 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = *(_QWORD *)(v6 + 48) + 40 * v15;
      *(_OWORD *)v16 = v32;
      *(_OWORD *)(v16 + 16) = v33;
      *(_QWORD *)(v16 + 32) = v34;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10002C814(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _BYTE v20[40];

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_12;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10002C54C(v9);
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_10002C97C();
      goto LABEL_12;
    }
    sub_10002CB48(v9);
  }
  v10 = *v3;
  result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v11 = -1 << *(_BYTE *)(v10 + 32);
  a2 = result & ~v11;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v12 = ~v11;
    do
    {
      sub_100024DCC(*(_QWORD *)(v10 + 48) + 40 * a2, (uint64_t)v20);
      v13 = static AnyHashable.== infix(_:_:)(v20, v6);
      result = sub_100024E9C((uint64_t)v20);
      if ((v13 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v12;
    }
    while (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v14 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v15 = *(_QWORD *)(v14 + 48) + 40 * a2;
  v16 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v6;
  *(_OWORD *)(v15 + 16) = v16;
  *(_QWORD *)(v15 + 32) = *(_QWORD *)(v6 + 32);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (!v18)
  {
    *(_QWORD *)(v14 + 16) = v19;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

void *sub_10002C97C()
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
  __int128 v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v1 = v0;
  sub_100005FF0(&qword_100042A48);
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
    v16 = 40 * v15;
    result = (void *)sub_100024DCC(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    v17 = *(_QWORD *)(v4 + 48) + v16;
    v18 = v23[0];
    v19 = v23[1];
    *(_QWORD *)(v17 + 32) = v24;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

Swift::Int sub_10002CB48(uint64_t a1)
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
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  _OWORD v32[2];
  uint64_t v33;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100005FF0(&qword_100042A48);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v31 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_27;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v21 >= v11)
      goto LABEL_36;
    v22 = *(_QWORD *)(v8 + 8 * v21);
    ++v14;
    if (!v22)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_36;
      v22 = *(_QWORD *)(v8 + 8 * v14);
      if (!v22)
      {
        v14 = v21 + 2;
        if (v21 + 2 >= v11)
          goto LABEL_36;
        v22 = *(_QWORD *)(v8 + 8 * v14);
        if (!v22)
          break;
      }
    }
LABEL_26:
    v10 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v14 << 6);
LABEL_27:
    sub_100024DCC(*(_QWORD *)(v3 + 48) + 40 * v20, (uint64_t)v32);
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
        v30 = *(_QWORD *)(v12 + 8 * v26);
      }
      while (v30 == -1);
      v15 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v6 + 48) + 40 * v15;
    v17 = v32[0];
    v18 = v32[1];
    *(_QWORD *)(v16 + 32) = v33;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    ++*(_QWORD *)(v6 + 16);
  }
  v23 = v21 + 3;
  if (v23 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v22 = *(_QWORD *)(v8 + 8 * v23);
  if (v22)
  {
    v14 = v23;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v22 = *(_QWORD *)(v8 + 8 * v14);
    ++v23;
    if (v22)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10002CDD8(uint64_t a1)
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

uint64_t sub_10002CE60(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  if (a3 < 0 || 1 << *(_BYTE *)(a6 + 32) <= a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a6 + (((unint64_t)a3 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a3) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a6 + 36) == a4)
  {
    sub_100024DCC(*(_QWORD *)(a6 + 48) + 40 * a3, result);
    return sub_100024E08(*(_QWORD *)(a6 + 56) + 32 * a3, a2);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10002CEF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return swift_task_switch(sub_10002CF10, 0, 0);
}

uint64_t sub_10002CF10()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __n128 v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  objc_class *v51;
  objc_class *v52;
  objc_class *v53;
  NSObject *v54;
  os_log_type_t v55;
  objc_class *v56;
  uint8_t *v57;
  objc_class *v58;
  uint64_t v59;
  id v60;
  os_log_type_t v61;
  uint8_t *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  unint64_t v72;
  char v73;
  int v74;
  uint64_t v75;
  os_log_type_t v76;
  _BOOL4 v77;
  uint8_t *v78;
  os_log_type_t v79;
  const char *v80;
  uint64_t v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  os_log_type_t v85;
  NSObject *v86;
  os_log_t log;
  uint8_t *buf;
  uint8_t *bufa;
  objc_class *v90;
  uint64_t *v91;
  _QWORD *v92;
  uint64_t v93[2];

  if (qword_1000418F8 != -1)
    swift_once(&qword_1000418F8, sub_100025CE4);
  v1 = v0 + 3;
  v2 = v0[3];
  v3 = v0[5];
  v4 = type metadata accessor for Logger(0);
  sub_1000036A4(v4, (uint64_t)qword_100043F88);
  swift_bridgeObjectRetain_n(v3, 2);
  swift_bridgeObjectRetain_n(v2, 2);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  v8 = os_log_type_enabled(v6, v7);
  v9 = v0[5];
  v91 = v0 + 2;
  v92 = v0;
  if (v8)
  {
    v10 = v0[3];
    v11 = v0[4];
    v12 = swift_slowAlloc(22, -1);
    buf = (uint8_t *)swift_slowAlloc(64, -1);
    v93[0] = (uint64_t)buf;
    *(_DWORD *)v12 = 136315394;
    swift_bridgeObjectRetain(v9);
    v0[2] = sub_100027030(v11, v9, v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(v9, 3);
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain(v10);
    v13 = Dictionary.description.getter(v10, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v15 = v14;
    swift_bridgeObjectRelease(v10);
    v0[2] = sub_100027030(v13, v15, v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v12 + 14, v12 + 22);
    v16 = v15;
    v1 = v0 + 3;
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease_n(v10, 2);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Swift received bridged message {fromID: %s, message: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(buf, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(buf, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }
  else
  {
    v17 = *v1;
    swift_bridgeObjectRelease_n(v9, 2);
    swift_bridgeObjectRelease_n(v17, 2);
  }

  sub_10002B7B0(*v1);
  if (!v18)
  {
    swift_bridgeObjectRetain_n(*v1, 2);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.error.getter();
    v25 = os_log_type_enabled(v23, v24);
    v26 = *v1;
    if (v25)
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(32, -1);
      v93[0] = v28;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain(v26);
      v30 = Dictionary.description.getter(v29, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
      v32 = v31;
      swift_bridgeObjectRelease(v26);
      *v91 = sub_100027030(v30, v32, v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v91, v1, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v32);
      swift_bridgeObjectRelease_n(v26, 2);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Message was not of type [String: Any]. Bailing receive. message: %s", v27, 0xCu);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      v33 = v28;
LABEL_15:
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v27, -1, -1);
      goto LABEL_19;
    }
    v49 = *v1;
LABEL_18:
    swift_bridgeObjectRelease_n(v49, 2);
    goto LABEL_19;
  }
  v19 = v18;
  type metadata accessor for ATPayload(0);
  v20 = swift_bridgeObjectRetain(v19);
  v21 = (void *)ATPayload.__allocating_init(dictionaryRepresentation:)(v20);
  v34 = v21;
  if (!v21)
  {
    swift_bridgeObjectRetain(v19);
    v23 = Logger.logObject.getter(v42);
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v43))
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v44 = swift_slowAlloc(32, -1);
      v93[0] = v44;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain(v19);
      v46 = Dictionary.description.getter(v45, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
      v48 = v47;
      swift_bridgeObjectRelease(v19);
      *v91 = sub_100027030(v46, v48, v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v91, v1, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v48);
      swift_bridgeObjectRelease_n(v19, 2);
      _os_log_impl((void *)&_mh_execute_header, v23, v43, "Failed to derive ATPayload from IDS message: %s", v27, 0xCu);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      v33 = v44;
      goto LABEL_15;
    }
    v49 = v19;
    goto LABEL_18;
  }
  v35 = v21;
  swift_bridgeObjectRelease(v19);
  v36 = v35;
  v37 = Logger.logObject.getter(v36);
  v38 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc(12, -1);
    bufa = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v39 = 138412290;
    *v91 = (uint64_t)v36;
    v40 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v91, v1, v39 + 4, v39 + 12);
    *(_QWORD *)bufa = v34;

    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Got ATPayload from IDS message: %@", v39, 0xCu);
    v41 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(bufa, 1, v41);
    swift_slowDealloc(bufa, -1, -1);
    swift_slowDealloc(v39, -1, -1);
  }
  else
  {

  }
  v51 = (objc_class *)ATPayload.response.getter();
  if (v51)
  {
    v52 = v51;
    v53 = v51;
    v54 = Logger.logObject.getter(v53);
    v55 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = v53;
      v57 = (uint8_t *)swift_slowAlloc(12, -1);
      log = (os_log_t)swift_slowAlloc(8, -1);
      *(_DWORD *)v57 = 138412290;
      *v91 = (uint64_t)v53;
      v58 = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v91, v1, v57 + 4, v57 + 12);
      log->isa = v52;

      v53 = v56;
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "Got ATResponse from IDS message: %@", v57, 0xCu);
      v59 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(log, 1, v59);
      swift_slowDealloc(log, -1, -1);
      swift_slowDealloc(v57, -1, -1);
    }
    else
    {

    }
    v66 = ATPayload.clientBundleIdentifier.getter(v65);
    if (!v67)
    {
      v23 = Logger.logObject.getter(v66);
      v85 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v85))
      {
        v78 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v78 = 0;
        v80 = "Couldn't launch client in response to IDS message because client bundle identifier was nil.";
        v86 = v23;
        v79 = v85;
LABEL_45:
        _os_log_impl((void *)&_mh_execute_header, v86, v79, v80, v78, 2u);
        swift_slowDealloc(v78, -1, -1);

        goto LABEL_46;
      }
LABEL_47:

      goto LABEL_19;
    }
    v68 = v66;
    v69 = v67;
    v70 = qword_100041920;
    swift_bridgeObjectRetain(v67);
    if (v70 != -1)
      swift_once(&qword_100041920, sub_100026C88);
    v71 = off_100042778;
    if (*((_QWORD *)off_100042778 + 2))
    {
      v72 = sub_1000276E8(v68, v69);
      if ((v73 & 1) != 0)
      {
        v74 = *(unsigned __int8 *)(v71[7] + v72);
        v75 = swift_bridgeObjectRelease_n(v69, 2);
        v23 = Logger.logObject.getter(v75);
        v76 = static os_log_type_t.fault.getter();
        v77 = os_log_type_enabled(v23, v76);
        if (v74 == 3)
        {
          if (v77)
          {
            v78 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v78 = 0;
            v79 = v76;
            v80 = "Received ScreenTime response. Allowing ScreenTime to handle it through their own channels.";
LABEL_44:
            v86 = v23;
            goto LABEL_45;
          }
        }
        else if (v77)
        {
          v78 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v78 = 0;
          v79 = v76;
          v80 = "Received response which comes from AskTo-owned process. This should never happen.";
          goto LABEL_44;
        }
        goto LABEL_47;
      }
    }
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRetain(v69);
    v23 = Logger.logObject.getter(v81);
    v82 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v82))
    {
      v83 = (uint8_t *)swift_slowAlloc(12, -1);
      v90 = v53;
      v84 = swift_slowAlloc(32, -1);
      v93[0] = v84;
      *(_DWORD *)v83 = 136315138;
      swift_bridgeObjectRetain(v69);
      *v91 = sub_100027030(v68, v69, v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v91, v1, v83 + 4, v83 + 12);
      swift_bridgeObjectRelease_n(v69, 3);
      _os_log_impl((void *)&_mh_execute_header, v23, v82, "Client with bundle identifier \"%s\" is not known. Dropping response.", v83, 0xCu);
      swift_arrayDestroy(v84, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v84, -1, -1);
      swift_slowDealloc(v83, -1, -1);

      goto LABEL_46;
    }

    v49 = v69;
    goto LABEL_18;
  }
  v60 = v36;
  v23 = Logger.logObject.getter(v60);
  v61 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v61))
  {
    v62 = (uint8_t *)swift_slowAlloc(12, -1);
    v63 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v62 = 138412290;
    *v91 = (uint64_t)v60;
    v36 = v60;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v91, v1, v62 + 4, v62 + 12);
    *v63 = v34;

    _os_log_impl((void *)&_mh_execute_header, v23, v61, "Received payload, but it had no associated response: %@", v62, 0xCu);
    v64 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v63, 1, v64);
    swift_slowDealloc(v63, -1, -1);
    swift_slowDealloc(v62, -1, -1);

LABEL_46:
    return ((uint64_t (*)(void))v92[1])();
  }

LABEL_19:
  return ((uint64_t (*)(void))v92[1])();
}

void sub_10002DC9C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  void (*v16)(_BYTE *);
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  const char *v48;
  _BYTE v49[4];
  int v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v8 = sub_100005FF0(&qword_100042990);
  __chkstk_darwin(v8);
  v10 = &v49[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = type metadata accessor for Logger(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = &v49[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1000418F8 != -1)
    swift_once(&qword_1000418F8, sub_100025CE4);
  v15 = sub_1000036A4(v11, (uint64_t)qword_100043F88);
  v16 = *(void (**)(_BYTE *))(v12 + 16);
  v58 = v15;
  v16(v14);
  swift_bridgeObjectRetain_n(a2, 2);
  swift_bridgeObjectRetain_n(a4, 2);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v18, (os_log_type_t)v19))
  {

    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease_n(a4, 2);
    v27 = (*(uint64_t (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
    if (!a2)
    {
      v34 = Logger.logObject.getter(v27);
      v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v34, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc(12, -1);
        v47 = swift_slowAlloc(32, -1);
        v60 = v47;
        *(_DWORD *)v46 = 136315138;
        v59 = sub_100027030(0xD000000000000032, 0x8000000100032CA0, &v60);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v46 + 4, v46 + 12);
        v48 = "IDS called %s with nil message.";
        goto LABEL_19;
      }
LABEL_21:

      return;
    }
    if (!a1)
    {
LABEL_15:
      v34 = Logger.logObject.getter(v27);
      v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v34, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc(12, -1);
        v47 = swift_slowAlloc(32, -1);
        v60 = v47;
        *(_DWORD *)v46 = 136315138;
        v59 = sub_100027030(0xD000000000000032, 0x8000000100032CA0, &v60);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v46 + 4, v46 + 12);
        v48 = "IDS called %s with nil service.";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v34, v45, v48, v46, 0xCu);
        swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v47, -1, -1);
        swift_slowDealloc(v46, -1, -1);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
LABEL_8:
    if (a4)
    {
      v28 = type metadata accessor for TaskPriority(0);
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v10, 1, 1, v28);
      v29 = (_QWORD *)swift_allocObject(&unk_10003E978, 72, 7);
      v29[2] = 0;
      v29[3] = 0;
      v30 = v57;
      v29[4] = v57;
      v29[5] = a2;
      v29[6] = a1;
      v29[7] = a3;
      v29[8] = a4;
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRetain(a2);
      v31 = a1;
      v32 = v30;
      v33 = sub_100029A8C((uint64_t)v10, (uint64_t)&unk_1000429A0, (uint64_t)v29);
      swift_release(v33);
      return;
    }
    v34 = a1;
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = swift_slowAlloc(32, -1);
      v60 = v38;
      *(_DWORD *)v37 = 136315138;
      v59 = sub_100027030(0xD000000000000032, 0x8000000100032CA0, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v37 + 4, v37 + 12);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "IDS called %s with nil fromID.", v37, 0xCu);
      swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);

      return;
    }

    goto LABEL_21;
  }
  v50 = v19;
  v52 = v12;
  v53 = v10;
  v56 = a3;
  v20 = swift_slowAlloc(22, -1);
  v21 = (uint64_t *)swift_slowAlloc(8, -1);
  v51 = swift_slowAlloc(32, -1);
  v60 = v51;
  *(_DWORD *)v20 = 138412546;
  v22 = a4;
  if (a4)
  {
    v23 = sub_100014624();
    v24 = swift_allocError(&type metadata for String, v23, 0, 0);
    *v25 = v56;
    v25[1] = v22;
    swift_bridgeObjectRetain(v22);
    a4 = _swift_stdlib_bridgeErrorToNSError(v24);
    v26 = v20 + 12;
    v59 = a4;
  }
  else
  {
    v26 = v20 + 12;
    v59 = 0;
  }
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v20 + 4, v26);
  v54 = v22;
  v55 = a1;
  *v21 = a4;
  swift_bridgeObjectRelease_n(v22, 2);
  *(_WORD *)(v20 + 12) = 2080;
  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    v40 = Dictionary.description.getter(v39, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
    v42 = v41;
    swift_bridgeObjectRelease(a2);
    v59 = sub_100027030(v40, v42, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v20 + 14, v20 + 22);
    swift_bridgeObjectRelease_n(a2, 2);
    swift_bridgeObjectRelease(v42);
    _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v50, "Received message {fromID: %@, message: %s}", (uint8_t *)v20, 0x16u);
    v43 = sub_100005FF0(&qword_100042650);
    swift_arrayDestroy(v21, 1, v43);
    swift_slowDealloc(v21, -1, -1);
    v44 = v51;
    swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v27 = (*(uint64_t (**)(_BYTE *, uint64_t))(v52 + 8))(v14, v11);
    a4 = v54;
    a1 = v55;
    v10 = v53;
    a3 = v56;
    if (!v55)
      goto LABEL_15;
    goto LABEL_8;
  }
  __break(1u);
}

void sub_10002E3A0(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t *, uint64_t *);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59[3];
  uint64_t v60;
  uint64_t v61;

  v5 = v4;
  if (a2 && a4)
  {
    v56 = v4;
    swift_bridgeObjectRetain(a2);
    swift_errorRetain(a4);
    if (qword_1000418F8 != -1)
      swift_once(&qword_1000418F8, sub_100025CE4);
    v58 = a3;
    v10 = type metadata accessor for Logger(0);
    sub_1000036A4(v10, (uint64_t)qword_100043F88);
    swift_errorRetain(a4);
    swift_bridgeObjectRetain(a2);
    v11 = swift_errorRetain(a4);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc(28, -1);
      v55 = a1;
      v15 = (uint64_t *)swift_slowAlloc(8, -1);
      v16 = swift_slowAlloc(32, -1);
      v59[0] = v16;
      *(_DWORD *)v14 = 136315650;
      swift_bridgeObjectRetain(a2);
      v60 = sub_100027030(v55, a2, v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v14 + 4, v14 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      *(_WORD *)(v14 + 12) = 1024;
      LODWORD(v60) = a3 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, (char *)&v60 + 4, v14 + 14, v14 + 18);
      *(_WORD *)(v14 + 18) = 2112;
      swift_errorRetain(a4);
      v17 = _swift_stdlib_bridgeErrorToNSError(a4);
      v60 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v14 + 20, v14 + 28);
      *v15 = v17;
      swift_errorRelease(a4);
      swift_errorRelease(a4);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Send message delegate callback {identifier: %s, success: %{BOOL}d, error: %@}", (uint8_t *)v14, 0x1Cu);
      v18 = sub_100005FF0(&qword_100042650);
      swift_arrayDestroy(v15, 1, v18);
      v19 = v15;
      a1 = v55;
      swift_slowDealloc(v19, -1, -1);
      swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      swift_errorRelease(a4);
    }
    else
    {
      swift_errorRelease(a4);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_errorRelease(a4);
      swift_errorRelease(a4);

    }
    v5 = v56;
    goto LABEL_18;
  }
  if (qword_1000418F8 != -1)
    swift_once(&qword_1000418F8, sub_100025CE4);
  v20 = type metadata accessor for Logger(0);
  v21 = sub_1000036A4(v20, (uint64_t)qword_100043F88);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v24 = 67109120;
    LODWORD(v59[0]) = a3 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v59, (char *)v59 + 4, v24 + 4, v24 + 8);
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Send message delegate callback {identifier: nil, success: %{BOOL}d, error: nil}", v24, 8u);
    swift_slowDealloc(v24, -1, -1);
  }

  if (a2)
  {
    v58 = a3;
LABEL_18:
    v30 = (uint64_t *)(v5 + OBJC_IVAR____TtC6asktod8IDSRelay_pendingSendCompletions);
    swift_beginAccess(v5 + OBJC_IVAR____TtC6asktod8IDSRelay_pendingSendCompletions, v59, 32, 0);
    v31 = *v30;
    v32 = *(_QWORD *)(*v30 + 16);
    swift_bridgeObjectRetain(a2);
    if (v32 && (v33 = sub_1000276E8(a1, a2), (v34 & 1) != 0))
    {
      v35 = *(_QWORD *)(v31 + 56) + 16 * v33;
      v37 = *(void (**)(uint64_t *, uint64_t *))v35;
      v36 = *(_QWORD *)(v35 + 8);
      swift_endAccess(v59);
      v38 = qword_1000418F8;
      swift_retain(v36);
      if (v38 != -1)
        swift_once(&qword_1000418F8, sub_100025CE4);
      v39 = type metadata accessor for Logger(0);
      sub_1000036A4(v39, (uint64_t)qword_100043F88);
      swift_bridgeObjectRetain_n(a2, 2);
      v41 = Logger.logObject.getter(v40);
      v42 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc(12, -1);
        v57 = v36;
        v44 = swift_slowAlloc(32, -1);
        v59[0] = v44;
        *(_DWORD *)v43 = 136315138;
        swift_bridgeObjectRetain(a2);
        v60 = sub_100027030(a1, a2, v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v43 + 4, v43 + 12);
        swift_bridgeObjectRelease_n(a2, 3);
        _os_log_impl((void *)&_mh_execute_header, v41, v42, "Calling completion for IDS message send identifier %s", v43, 0xCu);
        swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
        v45 = v44;
        v36 = v57;
        swift_slowDealloc(v45, -1, -1);
        swift_slowDealloc(v43, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a2, 2);
      }
      LOBYTE(v60) = v58 & 1;
      v59[0] = a4;
      v37(&v60, v59);
      swift_release(v36);
      swift_beginAccess(v30, v59, 33, 0);
      v52 = sub_10002BF48(a1, a2);
      v54 = v53;
      swift_endAccess(v59);
      swift_bridgeObjectRelease(a2);
      if (v52)
        sub_100006BB4(v52, v54);
    }
    else
    {
      swift_endAccess(v59);
      if (qword_1000418F8 != -1)
        swift_once(&qword_1000418F8, sub_100025CE4);
      v46 = type metadata accessor for Logger(0);
      sub_1000036A4(v46, (uint64_t)qword_100043F88);
      swift_bridgeObjectRetain(a2);
      v48 = Logger.logObject.getter(v47);
      v49 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc(12, -1);
        v51 = swift_slowAlloc(32, -1);
        v59[0] = v51;
        *(_DWORD *)v50 = 136315138;
        swift_bridgeObjectRetain(a2);
        v60 = sub_100027030(a1, a2, v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v50 + 4, v50 + 12);
        swift_bridgeObjectRelease_n(a2, 3);
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "Got delegate callback for message send from IDS, but completion for identifier %s was nil.", v50, 0xCu);
        swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v51, -1, -1);
        swift_slowDealloc(v50, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(a2, 2);
      }
    }
    return;
  }
  v26 = Logger.logObject.getter(v25);
  v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc(12, -1);
    v29 = swift_slowAlloc(32, -1);
    v59[0] = v29;
    *(_DWORD *)v28 = 136315138;
    v60 = sub_100027030(0xD000000000000037, 0x8000000100032C60, v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v28 + 4, v28 + 12);
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "IDS called %s with nil identifier.", v28, 0xCu);
    swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v28, -1, -1);
  }

}

uint64_t sub_10002EBE0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10002EC24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v2 = v0[5];
  v3 = v0[7];
  v4 = v0[8];
  v5 = (_QWORD *)swift_task_alloc(dword_10004299C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_100009560;
  v6 = (_QWORD *)swift_task_alloc(dword_1000429C4);
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_10000F7AC;
  v6[4] = v3;
  v6[5] = v4;
  v6[3] = v2;
  return swift_task_switch(sub_10002CF10, 0, 0);
}

uint64_t sub_10002ECB4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002ECD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000429B4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100009560;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000429B0 + dword_1000429B0))(a1, v4);
}

uint64_t sub_10002ED48(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100009B48(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002ED88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100005FF0(&qword_100042A18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002EDEC(uint64_t a1, uint64_t a2)
{
  sub_100005FF0(&qword_100042A18);
  return sub_10002A1B0(a1, a2);
}

unint64_t sub_10002EE3C()
{
  unint64_t result;

  result = qword_100042A20;
  if (!qword_100042A20)
  {
    result = swift_getWitnessTable(&unk_100031190, &type metadata for IDSRelay.Error);
    atomic_store(result, (unint64_t *)&qword_100042A20);
  }
  return result;
}

uint64_t sub_10002EE80()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[2]);
  if (v0[3])
    swift_release(v0[4]);
  return swift_deallocObject(v0, 40, 7);
}

void sub_10002EEB4(uint64_t a1)
{
  uint64_t v1;

  sub_10002AA40(a1, *(_QWORD *)(v1 + 16), *(__int128 **)(v1 + 24));
}

uint64_t sub_10002EEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002EED0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10002EED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005FF0(&qword_100042A40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t storeEnumTagSinglePayload for IDSRelay.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10002EF6C + 4 * byte_100031095[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10002EFA0 + 4 * byte_100031090[v4]))();
}

uint64_t sub_10002EFA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002EFA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10002EFB0);
  return result;
}

uint64_t sub_10002EFBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002EFC4);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_10002EFC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10002EFD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IDSRelay.Error()
{
  return &type metadata for IDSRelay.Error;
}

unint64_t sub_10002EFF0()
{
  unint64_t result;

  result = qword_100042A58;
  if (!qword_100042A58)
  {
    result = swift_getWitnessTable(&unk_100031168, &type metadata for IDSRelay.Error);
    atomic_store(result, (unint64_t *)&qword_100042A58);
  }
  return result;
}

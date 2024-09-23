uint64_t sub_1000052EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  v0[3] = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  v0[4] = v2;
  v0[5] = v3;
  return swift_task_switch(sub_100005354, v2, v3);
}

uint64_t sub_100005354()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 48) = type metadata accessor for Daemon(0);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to Daemon.__allocating_init(identifier:profile:services:)[1]);
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_1000053F0;
  return Daemon.__allocating_init(identifier:profile:services:)(0xD000000000000021, 0x8000000100017470, 0xD000000000000010, 0x80000001000174A0, &unk_100020DE0, 0);
}

uint64_t sub_1000053F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v8;

  v4 = *(_QWORD *)(*(_QWORD *)v2 + 56);
  v5 = *(_QWORD **)v2;
  v5[8] = a1;
  v5[9] = v1;
  swift_task_dealloc(v4);
  if (v1)
    return swift_task_switch(sub_100005550, v5[4], v5[5]);
  v7 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceDaemon.run()[1]);
  v5[10] = v7;
  v8 = sub_1000066F0(&qword_100020DF0, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  *v7 = v5;
  v7[1] = sub_1000054B4;
  return ActorServiceDaemon.run()(v5[6], v8);
}

uint64_t sub_1000054B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 80);
  *(_QWORD *)(*v1 + 88) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_100005734;
  else
    v4 = sub_100005514;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_100005514()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 64));
  swift_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005550()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 72);
  if (qword_100020CF0 != -1)
    swift_once(&qword_100020CF0, sub_100005978);
  v2 = type metadata accessor for Logger(0);
  sub_100005BF0(v2, (uint64_t)qword_100021A60);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    v8 = _convertErrorToNSError(_:)(v1);
    *(_QWORD *)(v0 + 16) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error creating Daemon instance: %@", v6, 0xCu);
    v9 = sub_100006044(&qword_100020DE8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  return _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000018, 0x8000000100017500, "findmybeaconingd/DaemonEntryPoint.swift", 39, 2, 24, 0);
}

uint64_t sub_100005734()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  swift_release(v0[8]);
  v1 = v0[11];
  if (qword_100020CF0 != -1)
    swift_once(&qword_100020CF0, sub_100005978);
  v2 = type metadata accessor for Logger(0);
  sub_100005BF0(v2, (uint64_t)qword_100021A60);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    v8 = _convertErrorToNSError(_:)(v1);
    v0[2] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 2, v0 + 3, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Error creating Daemon instance: %@", v6, 0xCu);
    v9 = sub_100006044(&qword_100020DE8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  return _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000018, 0x8000000100017500, "findmybeaconingd/DaemonEntryPoint.swift", 39, 2, 24, 0);
}

uint64_t sub_100005920()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_100020DF8 + dword_100020DF8);
  v1 = (_QWORD *)swift_task_alloc(unk_100020DFC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000699C;
  return v3();
}

uint64_t sub_100005978()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021A60);
  sub_100005BF0(v0, (uint64_t)qword_100021A60);
  return Logger.init(subsystem:category:)(0xD000000000000021, 0x8000000100017470, 95, 0xE100000000000000);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t MainExecutor;
  uint64_t v5;
  uint64_t v6;
  int result;

  v3 = swift_task_create(2048, 0, (char *)&type metadata for () + 8, &unk_100020D68, 0);
  MainExecutor = swift_task_getMainExecutor();
  v6 = swift_job_run(v3, MainExecutor, v5);
  result = swift_task_asyncMainDrainQueue(v6);
  __break(1u);
  return result;
}

uint64_t sub_100005A38()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = type metadata accessor for MainActor(0);
  v0[3] = static MainActor.shared.getter();
  v1 = (_QWORD *)swift_task_alloc(dword_100020DD4);
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_100005A94;
  return sub_1000052EC();
}

uint64_t sub_100005A94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100005B04, v2, v3);
}

void sub_100005B04()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  exit(0);
}

uint64_t sub_100005B28()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  v1 = (_QWORD *)swift_task_alloc(dword_100020DDC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100005BA0;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_100020DF8 + dword_100020DF8);
  v2 = (_QWORD *)swift_task_alloc(unk_100020DFC);
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_10000699C;
  return v4();
}

uint64_t sub_100005BA0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = *v1;
  v3 = *(_QWORD *)(v6 + 16);
  v4 = *v1;
  v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100005BF0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100005C08(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000066F0(&qword_100020E58, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_1000167BC);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005C48(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000066F0(&qword_100020E58, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_1000167BC);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005C8C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000066F0(&qword_100020E90, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100005CCC()
{
  id *v0;

  return *v0;
}

uint64_t sub_100005CD4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100005CDC()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(SPBeaconManagerErrorDomain);
}

uint64_t sub_100005CEC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000066F0(&qword_100020E90, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100005D2C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000066F0(&qword_100020E90, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100005D6C(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000066F0(&qword_100020E90, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100005DD0()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100005E04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000066F0(&qword_100020E90, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100005E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD v7[10];

  v7[9] = *v3;
  Hasher.init(_seed:)(v7);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

_QWORD *sub_100005EB0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100005EC0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_100005ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1000066F0(&qword_100020E90, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

BOOL sub_100005F24(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

char *sub_100005F38(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100006044(&qword_100020E20);
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
    sub_1000060C4(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006044(uint64_t *a1)
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

uint64_t *sub_100006084(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000060C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
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
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      v8 = sub_100006044(&qword_100020E28);
      swift_arrayInitWithCopy(a3, v6, v4, v8);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1000061CC()
{
  return swift_task_switch(sub_1000061E0, 0, 0);
}

uint64_t sub_1000061E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v1 = type metadata accessor for LocalBeaconing(0);
  v2 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  swift_defaultActor_initialize(v2);
  strcpy((char *)(v2 + 112), "LocalBeaconing");
  *(_BYTE *)(v2 + 127) = -18;
  v3 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  v4 = type metadata accessor for LocalBeaconKeyInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(_BYTE *)(v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_initialFetchComplete) = 0;
  v5 = sub_100005F38(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  v7 = *((_QWORD *)v5 + 2);
  v6 = *((_QWORD *)v5 + 3);
  if (v7 >= v6 >> 1)
    v5 = sub_100005F38((char *)(v6 > 1), v7 + 1, 1, v5);
  v0[4] = v5;
  v8 = sub_1000066F0((unint64_t *)&unk_100020E00, type metadata accessor for LocalBeaconing, (uint64_t)&unk_100017100);
  *((_QWORD *)v5 + 2) = v7 + 1;
  v9 = &v5[16 * v7];
  *((_QWORD *)v9 + 4) = v2;
  *((_QWORD *)v9 + 5) = v8;
  v10 = type metadata accessor for LocalBeaconingXPCService();
  v11 = swift_allocObject(v10, 136, 15);
  v0[5] = v11;
  swift_defaultActor_initialize(v11);
  *(_QWORD *)(v11 + 112) = 0xD000000000000018;
  *(_QWORD *)(v11 + 120) = 0x8000000100017520;
  v0[6] = type metadata accessor for XPCSessionManager(0);
  v12 = (_QWORD *)swift_task_alloc(async function pointer to XPCSessionManager.__allocating_init(name:)[1]);
  v0[7] = v12;
  *v12 = v0;
  v12[1] = sub_100006380;
  return XPCSessionManager.__allocating_init(name:)(0xD000000000000018, 0x8000000100017520);
}

uint64_t sub_100006380(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 56));
  *(_QWORD *)(v3 + 128) = a1;
  return swift_task_switch(sub_1000063E0, 0, 0);
}

uint64_t sub_1000063E0()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *(char **)(v0 + 32);
  v3 = *((_QWORD *)v1 + 2);
  v2 = *((_QWORD *)v1 + 3);
  if (v3 >= v2 >> 1)
    v1 = sub_100005F38((char *)(v2 > 1), v3 + 1, 1, *(char **)(v0 + 32));
  *(_QWORD *)(v0 + 64) = v1;
  v4 = *(_QWORD *)(v0 + 40);
  v5 = sub_1000066F0(&qword_1000218F0, (uint64_t (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService, (uint64_t)&unk_100017260);
  *((_QWORD *)v1 + 2) = v3 + 1;
  v6 = &v1[16 * v3];
  *((_QWORD *)v6 + 4) = v4;
  *((_QWORD *)v6 + 5) = v5;
  v7 = type metadata accessor for SearchPartyPushXPCService();
  v8 = swift_allocObject(v7, 136, 15);
  *(_QWORD *)(v0 + 72) = v8;
  swift_defaultActor_initialize(v8);
  *(_QWORD *)(v8 + 112) = 0xD000000000000016;
  *(_QWORD *)(v8 + 120) = 0x8000000100017540;
  v9 = (_QWORD *)swift_task_alloc(async function pointer to XPCSessionManager.__allocating_init(name:)[1]);
  *(_QWORD *)(v0 + 80) = v9;
  *v9 = v0;
  v9[1] = sub_1000064E0;
  return XPCSessionManager.__allocating_init(name:)(0xD000000000000016, 0x8000000100017540);
}

uint64_t sub_1000064E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 80));
  *(_QWORD *)(v3 + 128) = a1;
  return swift_task_switch(sub_10000653C, 0, 0);
}

uint64_t sub_10000653C()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(char **)(v0 + 64);
  v3 = *((_QWORD *)v1 + 2);
  v2 = *((_QWORD *)v1 + 3);
  if (v3 >= v2 >> 1)
    v1 = sub_100005F38((char *)(v2 > 1), v3 + 1, 1, *(char **)(v0 + 64));
  *(_QWORD *)(v0 + 88) = v1;
  v4 = *(_QWORD *)(v0 + 72);
  v5 = sub_1000066F0(&qword_100020E10, (uint64_t (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService, (uint64_t)&unk_100016ED8);
  *((_QWORD *)v1 + 2) = v3 + 1;
  v6 = &v1[16 * v3];
  *((_QWORD *)v6 + 4) = v4;
  *((_QWORD *)v6 + 5) = v5;
  v7 = type metadata accessor for StorageService();
  swift_allocObject(v7, 144, 15);
  v8 = (_QWORD *)swift_task_alloc(dword_1000212C4);
  *(_QWORD *)(v0 + 96) = v8;
  *v8 = v0;
  v8[1] = sub_100006604;
  return sub_10000A534();
}

uint64_t sub_100006604(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  v2[2] = v1;
  v2[3] = a1;
  swift_task_dealloc(v2[12]);
  return swift_task_switch(sub_10000665C, 0, 0);
}

uint64_t sub_10000665C()
{
  uint64_t v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;

  v1 = *(char **)(v0 + 88);
  v3 = *((_QWORD *)v1 + 2);
  v2 = *((_QWORD *)v1 + 3);
  if (v3 >= v2 >> 1)
    v1 = sub_100005F38((char *)(v2 > 1), v3 + 1, 1, *(char **)(v0 + 88));
  v4 = *(_QWORD *)(v0 + 24);
  v5 = sub_1000066F0(&qword_100020E18, (uint64_t (*)(uint64_t))type metadata accessor for StorageService, (uint64_t)&unk_100016D68);
  *((_QWORD *)v1 + 2) = v3 + 1;
  v6 = &v1[16 * v3];
  *((_QWORD *)v6 + 4) = v4;
  *((_QWORD *)v6 + 5) = v5;
  return (*(uint64_t (**)(char *))(v0 + 8))(v1);
}

uint64_t sub_1000066F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void type metadata accessor for LocalBeaconManagerState(uint64_t a1)
{
  sub_10000688C(a1, &qword_100020E30, (uint64_t)&unk_10001CCF0);
}

void type metadata accessor for BeaconingKeyType(uint64_t a1)
{
  sub_10000688C(a1, &qword_100020E38, (uint64_t)&unk_10001CD10);
}

void type metadata accessor for SPBeaconManagerError(uint64_t a1)
{
  sub_10000688C(a1, &qword_100020E40, (uint64_t)&unk_10001CD30);
}

uint64_t sub_100006770()
{
  return sub_1000066F0(&qword_100020E48, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_1000166D4);
}

uint64_t sub_10000679C()
{
  return sub_1000066F0(&qword_100020E50, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016700);
}

uint64_t sub_1000067C8()
{
  return sub_1000066F0(&qword_100020E58, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_1000167BC);
}

uint64_t sub_1000067F4()
{
  return sub_1000066F0(&qword_100020E60, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016788);
}

uint64_t sub_100006820()
{
  return sub_1000066F0(&qword_100020E68, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016744);
}

uint64_t sub_10000684C()
{
  return sub_1000066F0(&qword_100020E70, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000168A8);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_10000688C(a1, &qword_100020E98, (uint64_t)&unk_10001CD58);
}

void sub_10000688C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1000068D0()
{
  return sub_1000066F0(&qword_100020E78, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_10001686C);
}

unint64_t sub_100006900()
{
  unint64_t result;

  result = qword_100020E80;
  if (!qword_100020E80)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100020E80);
  }
  return result;
}

uint64_t sub_100006944()
{
  return sub_1000066F0(&qword_100020E88, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_1000168E4);
}

uint64_t sub_100006970()
{
  return sub_1000066F0(&qword_100020E90, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
}

uint64_t *sub_1000069A0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID(0);
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for Date(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = a3[7];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = type metadata accessor for PublicKey(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = a3[8];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = type metadata accessor for SharedSecretKey(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  }
  return a1;
}

uint64_t sub_100006AC0(uint64_t a1, int *a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = type metadata accessor for UUID(0);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  v6 = a1 + a2[6];
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + a2[7];
  v9 = type metadata accessor for PublicKey(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + a2[8];
  v11 = type metadata accessor for SharedSecretKey(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
}

uint64_t sub_100006B80(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for PublicKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for SharedSecretKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  return a1;
}

uint64_t sub_100006C74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for PublicKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for SharedSecretKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

uint64_t sub_100006D68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for PublicKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for SharedSecretKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  return a1;
}

uint64_t sub_100006E5C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
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

  v6 = type metadata accessor for UUID(0);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for PublicKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  v16 = a3[8];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for SharedSecretKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_100006F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006F5C);
}

uint64_t sub_100006F5C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = type metadata accessor for Date(0);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = a3[6];
    }
    else
    {
      v14 = type metadata accessor for PublicKey(0);
      v12 = *(_QWORD *)(v14 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v8 = v14;
        v13 = a3[7];
      }
      else
      {
        v8 = type metadata accessor for SharedSecretKey(0);
        v12 = *(_QWORD *)(v8 - 8);
        v13 = a3[8];
      }
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_100007018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100007024);
}

uint64_t sub_100007024(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = type metadata accessor for UUID(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = type metadata accessor for Date(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = a4[6];
    }
    else
    {
      v16 = type metadata accessor for PublicKey(0);
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[7];
      }
      else
      {
        v10 = type metadata accessor for SharedSecretKey(0);
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[8];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for LocalBeaconKeyInfo(uint64_t a1)
{
  uint64_t result;

  result = qword_100020F58;
  if (!qword_100020F58)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LocalBeaconKeyInfo);
  return result;
}

uint64_t sub_100007124(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[5];

  result = type metadata accessor for UUID(319);
  if (v3 <= 0x3F)
  {
    v7[0] = *(_QWORD *)(result - 8) + 64;
    v7[1] = v7[0];
    result = type metadata accessor for Date(319);
    if (v4 <= 0x3F)
    {
      v7[2] = *(_QWORD *)(result - 8) + 64;
      result = type metadata accessor for PublicKey(319);
      if (v5 <= 0x3F)
      {
        v7[3] = *(_QWORD *)(result - 8) + 64;
        result = type metadata accessor for SharedSecretKey(319);
        if (v6 <= 0x3F)
        {
          v7[4] = *(_QWORD *)(result - 8) + 64;
          swift_initStructMetadata(a1, 256, 5, v7, a1 + 16);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000071E0()
{
  uint64_t v0;
  uint64_t v1;
  Swift::String v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  void *object;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  Swift::String v14;
  _QWORD v16[2];

  v1 = v0;
  v16[0] = 0;
  v16[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(44);
  v2._countAndFlagsBits = 0x203A726961703CLL;
  v2._object = (void *)0xE700000000000000;
  String.append(_:)(v2);
  v3 = type metadata accessor for LocalBeaconKeyInfo(0);
  v4 = type metadata accessor for Date(0);
  v5 = sub_1000066F0(&qword_100021008, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v4, v5);
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  v8._countAndFlagsBits = 0x4B63696C62757020;
  v8._object = (void *)0xEC000000203A7965;
  String.append(_:)(v8);
  v9 = v0 + *(int *)(v3 + 28);
  v10 = type metadata accessor for PublicKey(0);
  _print_unlocked<A, B>(_:_:)(v9, v16, v10, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v11._object = (void *)0x8000000100017600;
  v11._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v11);
  v12 = v1 + *(int *)(v3 + 32);
  v13 = type metadata accessor for SharedSecretKey(0);
  _print_unlocked<A, B>(_:_:)(v12, v16, v13, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v14._countAndFlagsBits = 62;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  return v16[0];
}

uint64_t sub_100007360(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100007398 + 4 * byte_100016930[a1]))(0xD000000000000010, 0x8000000100017620);
}

uint64_t sub_100007398()
{
  return 0x6E65644972657375;
}

uint64_t sub_1000073BC()
{
  return 0x6574614472696170;
}

uint64_t sub_1000073D4()
{
  return 0x654B63696C627570;
}

uint64_t sub_1000073F0()
{
  return 0x6553646572616873;
}

BOOL sub_100007414(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100007428()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000746C()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100007494()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_1000074D4()
{
  unsigned __int8 *v0;

  return sub_100007360(*v0);
}

uint64_t sub_1000074DC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100008BFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100007500()
{
  return 0;
}

void sub_10000750C(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_100007518(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000088C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007540(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000088C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007568(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;

  v3 = v1;
  v5 = sub_100006044(&qword_100020FE0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000889C(a1, v9);
  v11 = sub_1000088C0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for LocalBeaconKeyInfo.CodingKeys, &type metadata for LocalBeaconKeyInfo.CodingKeys, v11, v9, v10);
  v31 = 0;
  v12 = type metadata accessor for UUID(0);
  v13 = sub_1000066F0(&qword_100020FE8, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v31, v5, v12, v13);
  if (!v2)
  {
    v14 = (int *)type metadata accessor for LocalBeaconKeyInfo(0);
    v15 = v3 + v14[5];
    v30 = 1;
    KeyedEncodingContainer.encode<A>(_:forKey:)(v15, &v30, v5, v12, v13);
    v16 = v3 + v14[6];
    v29 = 2;
    v17 = type metadata accessor for Date(0);
    v18 = sub_1000066F0(&qword_100020FF0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v16, &v29, v5, v17, v18);
    v19 = v3 + v14[7];
    v28 = 3;
    v20 = type metadata accessor for PublicKey(0);
    v21 = sub_1000066F0(&qword_100020FF8, (uint64_t (*)(uint64_t))&type metadata accessor for PublicKey, (uint64_t)&protocol conformance descriptor for PublicKey);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v19, &v28, v5, v20, v21);
    v22 = v3 + v14[8];
    v27 = 4;
    v23 = type metadata accessor for SharedSecretKey(0);
    v24 = sub_1000066F0(&qword_100021000, (uint64_t (*)(uint64_t))&type metadata accessor for SharedSecretKey, (uint64_t)&protocol conformance descriptor for SharedSecretKey);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v22, &v27, v5, v23, v24);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000077EC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  int *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v39;
  char *v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  _QWORD *v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;

  v44 = a2;
  v46 = type metadata accessor for SharedSecretKey(0);
  v43 = *(_QWORD *)(v46 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v45 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for PublicKey(0);
  v49 = *(_QWORD *)(v51 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v47 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = type metadata accessor for Date(0);
  v50 = *(_QWORD *)(v52 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v48 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UUID(0);
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v55 = (char *)&v39 - v10;
  v57 = sub_100006044(&qword_100020FB0);
  v11 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalBeaconKeyInfo(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v17 = a1[4];
  sub_10000889C(a1, v18);
  v19 = sub_1000088C0();
  v56 = v13;
  v20 = v58;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for LocalBeaconKeyInfo.CodingKeys, &type metadata for LocalBeaconKeyInfo.CodingKeys, v19, v18, v17);
  if (v20)
    return sub_100008904(a1);
  v41 = (int *)v14;
  v42 = v11;
  v40 = v16;
  v58 = a1;
  v63 = 0;
  v21 = sub_1000066F0(&qword_100020FC0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v23 = v54;
  v22 = v55;
  v24 = v57;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v54, &v63, v57, v54, v21);
  v25 = *(void (**)(char *, char *, uint64_t))(v53 + 32);
  v26 = (uint64_t)v40;
  v25(v40, v22, v23);
  v62 = 1;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v23, &v62, v24, v23, v21);
  v27 = v41;
  v25((char *)(v26 + v41[5]), v9, v23);
  v61 = 2;
  v28 = sub_1000066F0(&qword_100020FC8, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v29 = v48;
  v30 = v52;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v52, &v61, v24, v52, v28);
  v31 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v50 + 32))(v26 + v27[6], v29, v30);
  v60 = 3;
  v32 = sub_1000066F0(&qword_100020FD0, (uint64_t (*)(uint64_t))&type metadata accessor for PublicKey, (uint64_t)&protocol conformance descriptor for PublicKey);
  v33 = v47;
  v34 = v51;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v51, &v60, v57, v51, v32);
  (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v26 + v27[7], v33, v34);
  v59 = 4;
  v35 = sub_1000066F0(&qword_100020FD8, (uint64_t (*)(uint64_t))&type metadata accessor for SharedSecretKey, (uint64_t)&protocol conformance descriptor for SharedSecretKey);
  v37 = v45;
  v36 = v46;
  KeyedDecodingContainer.decode<A>(_:forKey:)(v46, &v59, v57, v46, v35);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v56, v57);
  (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v31 + v27[8], v37, v36);
  sub_100008924(v31, v44);
  sub_100008904(v58);
  return sub_100008968(v31);
}

uint64_t sub_100007D6C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000077EC(a1, a2);
}

uint64_t sub_100007D80(_QWORD *a1)
{
  return sub_100007568(a1);
}

uint64_t sub_100007D9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
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
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v29 = type metadata accessor for SharedSecretKey(0);
  v27 = *(_QWORD *)(v29 - 8);
  __chkstk_darwin(v29);
  v28 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PublicKey(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalBeaconKeyInfo.userIdentifier.getter(v8);
  v11 = (int *)type metadata accessor for LocalBeaconKeyInfo(0);
  v12 = a2 + v11[5];
  v13 = LocalBeaconKeyInfo.beaconIdentifier.getter();
  v30 = a2 + v11[6];
  v14 = LocalBeaconKeyInfo.pairDate.getter(v13);
  v15 = LocalBeaconKeyInfo.publicKey.getter(v14);
  PublicKey.init(data:)(v15);
  if (v2)
  {
    v20 = type metadata accessor for LocalBeaconKeyInfo(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a1, v20);
    v21 = type metadata accessor for UUID(0);
    v22 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8);
    v22(a2, v21);
    v22(v12, v21);
    v23 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v30, v23);
  }
  else
  {
    v16 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a2 + v11[7], v10, v6);
    v17 = LocalBeaconKeyInfo.sharedSecretKey.getter(v16);
    v19 = v18;
    sub_1000066F0(&qword_100021010, (uint64_t (*)(uint64_t))&type metadata accessor for SharedSecretKey, (uint64_t)&protocol conformance descriptor for SharedSecretKey);
    KeyRepresentable<>.init(data:)(v17, v19);
    v24 = type metadata accessor for LocalBeaconKeyInfo(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(a1, v24);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(a2 + v11[8], v28, v29);
  }
}

void sub_100007FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_100008038(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x10000821CLL);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_100008240(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_10000829C()
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
  sub_100007FD8((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_100008814(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_100008464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  sub_100007FD8(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_100008518(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_10000855C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_100008590 + *((int *)qword_100008650 + (v0 >> 62))))();
}

uint64_t sub_1000085A0@<X0>(uint64_t a1@<X8>)
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
      sub_100008858(v2, v1);
      sub_100008240(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_100008660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;

  if ((((uint64_t (*)(void))static UUID.== infix(_:_:))() & 1) == 0)
    goto LABEL_6;
  v4 = type metadata accessor for LocalBeaconKeyInfo(0);
  if ((static UUID.== infix(_:_:)(a1 + *(int *)(v4 + 20), a2 + *(int *)(v4 + 20)) & 1) == 0)
    goto LABEL_6;
  if ((static Date.== infix(_:_:)(a1 + *(int *)(v4 + 24), a2 + *(int *)(v4 + 24)) & 1) == 0)
    goto LABEL_6;
  v5 = type metadata accessor for PublicKey(0);
  v6 = sub_1000066F0(&qword_100020FA0, (uint64_t (*)(uint64_t))&type metadata accessor for PublicKey, (uint64_t)&protocol conformance descriptor for PublicKey);
  dispatch thunk of RawRepresentable.rawValue.getter(&v24, v5, v6);
  dispatch thunk of RawRepresentable.rawValue.getter(&v22, v5, v6);
  v7 = v24;
  v8 = v25;
  v9 = v22;
  v10 = v23;
  sub_100008518(v24, v25);
  v12 = v11;
  sub_100008814(v9, v10);
  sub_100008814(v7, v8);
  if ((v12 & 1) != 0)
  {
    v13 = type metadata accessor for SharedSecretKey(0);
    v14 = sub_1000066F0(&qword_100020FA8, (uint64_t (*)(uint64_t))&type metadata accessor for SharedSecretKey, (uint64_t)&protocol conformance descriptor for SharedSecretKey);
    dispatch thunk of RawRepresentable.rawValue.getter(&v24, v13, v14);
    dispatch thunk of RawRepresentable.rawValue.getter(&v22, v13, v14);
    v15 = v24;
    v16 = v25;
    v17 = v22;
    v18 = v23;
    sub_100008518(v24, v25);
    v20 = v19;
    sub_100008814(v17, v18);
    sub_100008814(v15, v16);
  }
  else
  {
LABEL_6:
    v20 = 0;
  }
  return v20 & 1;
}

uint64_t sub_100008814(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100008858(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_retain)();
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

_QWORD *sub_10000889C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1000088C0()
{
  unint64_t result;

  result = qword_100020FB8;
  if (!qword_100020FB8)
  {
    result = swift_getWitnessTable(&unk_100016AD8, &type metadata for LocalBeaconKeyInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100020FB8);
  }
  return result;
}

uint64_t sub_100008904(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100008924(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LocalBeaconKeyInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008968(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LocalBeaconKeyInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_BYTE *initializeBufferWithCopyOfBuffer for LocalBeaconKeyInfo.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LocalBeaconKeyInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LocalBeaconKeyInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_100008A90 + 4 * byte_10001693A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100008AC4 + 4 * byte_100016935[v4]))();
}

uint64_t sub_100008AC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008ACC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100008AD4);
  return result;
}

uint64_t sub_100008AE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100008AE8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100008AEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008AF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008B00(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100008B0C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LocalBeaconKeyInfo.CodingKeys()
{
  return &type metadata for LocalBeaconKeyInfo.CodingKeys;
}

unint64_t sub_100008B28()
{
  unint64_t result;

  result = qword_100021018;
  if (!qword_100021018)
  {
    result = swift_getWitnessTable(&unk_100016AB0, &type metadata for LocalBeaconKeyInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021018);
  }
  return result;
}

unint64_t sub_100008B70()
{
  unint64_t result;

  result = qword_100021020;
  if (!qword_100021020)
  {
    result = swift_getWitnessTable("Ie", &type metadata for LocalBeaconKeyInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021020);
  }
  return result;
}

unint64_t sub_100008BB8()
{
  unint64_t result;

  result = qword_100021028;
  if (!qword_100021028)
  {
    result = swift_getWitnessTable(&unk_100016A48, &type metadata for LocalBeaconKeyInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021028);
  }
  return result;
}

uint64_t sub_100008BFC(uint64_t a1, unint64_t a2)
{
  BOOL v3;
  unint64_t v6;
  char v7;

  v3 = a1 == 0x6E65644972657375 && a2 == 0xEE00726569666974;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6E65644972657375, 0xEE00726569666974, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  if (a1 == 0xD000000000000010)
  {
    v6 = 0x8000000100017620;
    if (a2 == 0x8000000100017620)
      goto LABEL_11;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x8000000100017620, a1, a2, 0) & 1) != 0)
  {
    v6 = a2;
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 1;
  }
  if (a1 == 0x6574614472696170 && a2 == 0xE800000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574614472696170, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2;
  }
  else if (a1 == 0x654B63696C627570 && a2 == 0xE900000000000079
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x654B63696C627570, 0xE900000000000079, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3;
  }
  else if (a1 == 0x6553646572616873 && a2 == 0xEF79654B74657263)
  {
    swift_bridgeObjectRelease(0xEF79654B74657263);
    return 4;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6553646572616873, 0xEF79654B74657263, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_100008E30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021A78);
  v1 = sub_100005BF0(v0, (uint64_t)qword_100021A78);
  if (qword_100020D38 != -1)
    swift_once(&qword_100020D38, sub_100009EB8);
  v2 = sub_100005BF0(v0, (uint64_t)qword_100021B38);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_100008EC0()
{
  URL.appendingPathComponent(_:isDirectory:)(0x2E656761726F7453, 0xEA00000000006264, 0);
  URL.appendingPathComponent(_:isDirectory:)(0x2E656761726F7453, 0xEE006D68732D6264, 0);
  return URL.appendingPathComponent(_:isDirectory:)(0x2E656761726F7453, 0xEE006C61772D6264, 0);
}

uint64_t sub_100008F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 112));
  v1 = v0 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_baseContainerURL;
  v2 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_100008FC4()
{
  return type metadata accessor for StorageDatabase(0);
}

uint64_t type metadata accessor for StorageDatabase(uint64_t a1)
{
  uint64_t result;

  result = qword_100021058;
  if (!qword_100021058)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for StorageDatabase);
  return result;
}

uint64_t sub_100009008(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[5];

  v4[1] = &unk_100016BB0;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    v4[3] = &unk_100016BC8;
    v4[4] = (char *)&value witness table for Builtin.Int32 + 64;
    result = swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1000090A0()
{
  return sub_10000A4F4((unint64_t *)&unk_100021128, (uint64_t)&unk_100016CD8);
}

uint64_t sub_1000090C4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1000090D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_baseContainerURL;
  v4 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_100009114()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 112, v2, 0, 0);
  return swift_retain(*(_QWORD *)(v0 + 112));
}

uint64_t sub_100009148(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  swift_beginAccess(v1 + 112, v5, 1, 0);
  v3 = *(_QWORD *)(v1 + 112);
  *(_QWORD *)(v1 + 112) = a1;
  return swift_release(v3);
}

void *sub_10000918C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + 112, a1, 33, 0);
  return &j__swift_endAccess;
}

uint64_t sub_1000091CC()
{
  return 1;
}

uint64_t sub_1000091D4()
{
  return 0;
}

uint64_t sub_1000091DC()
{
  return sub_100009F38();
}

uint64_t sub_1000091F0()
{
  return sub_100008EC0();
}

void sub_100009204()
{
  type metadata accessor for StorageDatabase(0);
  Database.startup()();
}

void sub_100009238()
{
  type metadata accessor for StorageDatabase(0);
  Database.databaseAvailable()();
}

void sub_100009260(int a1, int a2, uint64_t a3)
{
  sub_10000A0DC(a1, a2, a3);
}

void sub_100009274()
{
  type metadata accessor for StorageDatabase(0);
  Database.purge()();
}

void sub_1000092A8()
{
  type metadata accessor for StorageDatabase(0);
  Database.reset()();
}

void sub_1000092DC()
{
  type metadata accessor for StorageDatabase(0);
  Database.createIfNecessary()();
}

uint64_t sub_100009310()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for StorageDatabase(0);
  v1 = sub_10000A4F4(&qword_1000211C0, (uint64_t)&unk_100016C38);
  return Database.description.getter(v0, v1);
}

uint64_t sub_100009358()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc(async function pointer to Database.isolatedDescription.getter[1]);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = type metadata accessor for StorageDatabase(0);
  v3 = sub_10000A4F4(&qword_1000211C0, (uint64_t)&unk_100016C38);
  *v1 = v0;
  v1[1] = sub_1000093D4;
  return Database.isolatedDescription.getter(v2, v3);
}

uint64_t sub_1000093D4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc(*(_QWORD *)(*v2 + 16));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_10000942C()
{
  return sub_10000A4F4(&qword_100021138, (uint64_t)&unk_100016BE0);
}

uint64_t sub_100009450()
{
  return sub_10000A4F4(&qword_100021140, (uint64_t)&unk_100016C10);
}

uint64_t sub_100009474()
{
  uint64_t v0;

  v0 = type metadata accessor for Table(0);
  sub_100006084(v0, qword_100021A90);
  sub_100005BF0(v0, (uint64_t)qword_100021A90);
  return Table.init(_:database:)(0xD000000000000012, 0x8000000100017750, 0, 0);
}

uint64_t sub_1000094DC()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006044(&qword_100021170);
  sub_100006084(v0, qword_100021AA8);
  sub_100005BF0(v0, (uint64_t)qword_100021AA8);
  v1 = sub_10000A470(&qword_1000211B0, &qword_100021170);
  return ExpressionType.init(_:)(0x797469746E656469, 0xE800000000000000, v0, v1);
}

uint64_t sub_100009564()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006044(&qword_100021180);
  sub_100006084(v0, qword_100021AC0);
  sub_100005BF0(v0, (uint64_t)qword_100021AC0);
  v1 = sub_10000A470(&qword_1000211A8, &qword_100021180);
  return ExpressionType.init(_:)(0x6E65644972657375, 0xEE00726569666974, v0, v1);
}

uint64_t sub_1000095F8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006044(&qword_100021180);
  sub_100006084(v0, qword_100021AD8);
  sub_100005BF0(v0, (uint64_t)qword_100021AD8);
  v1 = sub_10000A470(&qword_1000211A8, &qword_100021180);
  return ExpressionType.init(_:)(0xD000000000000010, 0x8000000100017620, v0, v1);
}

uint64_t sub_100009684()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006044(&qword_100021188);
  sub_100006084(v0, qword_100021AF0);
  sub_100005BF0(v0, (uint64_t)qword_100021AF0);
  v1 = sub_10000A470(&qword_1000211A0, &qword_100021188);
  return ExpressionType.init(_:)(0x6574614472696170, 0xE800000000000000, v0, v1);
}

uint64_t sub_10000970C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006044(&qword_100021190);
  sub_100006084(v0, qword_100021B08);
  sub_100005BF0(v0, (uint64_t)qword_100021B08);
  v1 = sub_10000A470(&qword_100021198, &qword_100021190);
  return ExpressionType.init(_:)(0x654B63696C627570, 0xE900000000000079, v0, v1);
}

uint64_t sub_100009798()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100006044(&qword_100021190);
  sub_100006084(v0, qword_100021B20);
  sub_100005BF0(v0, (uint64_t)qword_100021B20);
  v1 = sub_10000A470(&qword_100021198, &qword_100021190);
  return ExpressionType.init(_:)(0x6553646572616873, 0xEF79654B74657263, v0, v1);
}

uint64_t sub_10000982C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (qword_100020D00 != -1)
    swift_once(&qword_100020D00, sub_100009474);
  v1 = type metadata accessor for Table(0);
  sub_100005BF0(v1, (uint64_t)qword_100021A90);
  v2 = Table.create(temporary:ifNotExists:withoutRowid:block:)(0, 0, 0, sub_1000098F4, 0);
  v4 = v3;
  v5 = Connection.run(_:_:)(v2);
  if (v0)
    return swift_bridgeObjectRelease(v4);
  v7 = v5;
  swift_bridgeObjectRelease(v4);
  return swift_release(v7);
}

uint64_t sub_1000098F4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v32;
  char *v33;

  v0 = sub_100006044(&qword_100021148);
  __chkstk_darwin(v0);
  v2 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100006044(&qword_100021150);
  __chkstk_darwin(v3);
  v33 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006044(&qword_100021158);
  __chkstk_darwin(v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100006044(&qword_100021160);
  __chkstk_darwin(v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100006044(&qword_100021168);
  __chkstk_darwin(v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100020D08 != -1)
    swift_once(&qword_100020D08, sub_1000094DC);
  v14 = sub_100006044(&qword_100021170);
  v15 = sub_100005BF0(v14, (uint64_t)qword_100021AA8);
  v16 = sub_100006044(&qword_100021178);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v13, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, 1, 1, v14);
  TableBuilder.column<A>(_:primaryKey:check:defaultValue:)(v15, 1, v13, v10, &type metadata for Int, &protocol witness table for Int);
  sub_10000A3F0((uint64_t)v10, &qword_100021160);
  sub_10000A3F0((uint64_t)v13, &qword_100021168);
  if (qword_100020D10 != -1)
    swift_once(&qword_100020D10, sub_100009564);
  v18 = sub_100006044(&qword_100021180);
  v19 = sub_100005BF0(v18, (uint64_t)qword_100021AC0);
  v17(v13, 1, 1, v16);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v20(v7, 1, 1, v18);
  v21 = type metadata accessor for UUID(0);
  TableBuilder.column<A>(_:unique:check:defaultValue:)(v19, 0, v13, v7, v21, &protocol witness table for UUID);
  sub_10000A3F0((uint64_t)v7, &qword_100021158);
  sub_10000A3F0((uint64_t)v13, &qword_100021168);
  if (qword_100020D18 != -1)
    swift_once(&qword_100020D18, sub_1000095F8);
  v22 = sub_100005BF0(v18, (uint64_t)qword_100021AD8);
  v17(v13, 1, 1, v16);
  v20(v7, 1, 1, v18);
  TableBuilder.column<A>(_:unique:check:defaultValue:)(v22, 0, v13, v7, v21, &protocol witness table for UUID);
  sub_10000A3F0((uint64_t)v7, &qword_100021158);
  sub_10000A3F0((uint64_t)v13, &qword_100021168);
  if (qword_100020D20 != -1)
    swift_once(&qword_100020D20, sub_100009684);
  v23 = sub_100006044(&qword_100021188);
  v24 = sub_100005BF0(v23, (uint64_t)qword_100021AF0);
  v17(v13, 1, 1, v16);
  v25 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v33, 1, 1, v23);
  v26 = type metadata accessor for Date(0);
  TableBuilder.column<A>(_:unique:check:defaultValue:)(v24, 0, v13, v25, v26, &protocol witness table for Date);
  sub_10000A3F0(v25, &qword_100021150);
  sub_10000A3F0((uint64_t)v13, &qword_100021168);
  if (qword_100020D28 != -1)
    swift_once(&qword_100020D28, sub_10000970C);
  v27 = sub_100006044(&qword_100021190);
  v28 = sub_100005BF0(v27, (uint64_t)qword_100021B08);
  v17(v13, 1, 1, v16);
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56);
  v29(v2, 1, 1, v27);
  TableBuilder.column<A>(_:unique:check:defaultValue:)(v28, 0, v13, v2, &type metadata for Data, &protocol witness table for Data);
  sub_10000A3F0((uint64_t)v2, &qword_100021148);
  sub_10000A3F0((uint64_t)v13, &qword_100021168);
  if (qword_100020D30 != -1)
    swift_once(&qword_100020D30, sub_100009798);
  v30 = sub_100005BF0(v27, (uint64_t)qword_100021B20);
  v17(v13, 1, 1, v16);
  v29(v2, 1, 1, v27);
  TableBuilder.column<A>(_:unique:check:defaultValue:)(v30, 0, v13, v2, &type metadata for Data, &protocol witness table for Data);
  sub_10000A3F0((uint64_t)v2, &qword_100021148);
  return sub_10000A3F0((uint64_t)v13, &qword_100021168);
}

uint64_t sub_100009EB8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021B38);
  sub_100005BF0(v0, (uint64_t)qword_100021B38);
  return Logger.init(subsystem:category:)(0xD000000000000021, 0x8000000100017470, 0x44656761726F7453, 0xEF65736162617461);
}

uint64_t sub_100009F38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v12[2];

  v2 = type metadata accessor for Keychain.DataProtectionClass(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = static Keychain.data(account:service:)(0xD000000000000010, 0x8000000100016B50, 0x656761726F7453, 0xE700000000000000);
  if (!v1)
  {
    if (v7 >> 60 == 15)
    {
      v0 = static Data.random(bytes:)(32);
      v9 = v8;
      v12[0] = v0;
      v12[1] = v8;
      (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for Keychain.DataProtectionClass.d(_:), v2);
      sub_100008858(v0, v9);
      v10 = sub_10000A4B0();
      static Keychain.set<A>(data:account:service:dataProtectionClass:)(v12, 0xD000000000000010, 0x8000000100016B50, 0x656761726F7453, 0xE700000000000000, v5, &type metadata for Data, v10);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      sub_100008814(v0, v9);
    }
    else
    {
      return v6;
    }
  }
  return v0;
}

void sub_10000A0DC(int a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _DWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  Swift::String v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  Swift::String v27;
  void *object;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  int v33;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100020CF8 != -1)
    swift_once(&qword_100020CF8, sub_100008E30);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_100005BF0(v10, (uint64_t)qword_100021A78);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (_DWORD *)swift_slowAlloc(14, -1);
    v30 = v9;
    v15 = v7;
    v16 = v6;
    v17 = v14;
    *v14 = 67109376;
    LODWORD(v31) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, (char *)&v31 + 4, v14 + 1, v14 + 2);
    *((_WORD *)v17 + 4) = 1024;
    LODWORD(v31) = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, (char *)&v31 + 4, (char *)v17 + 10, (char *)v17 + 14);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Migrate schema %d -> %d", (uint8_t *)v17, 0xEu);
    v18 = v17;
    v6 = v16;
    v7 = v15;
    v9 = v30;
    swift_slowDealloc(v18, -1, -1);
  }

  if (a2 == 1)
  {
    v19._countAndFlagsBits = 0xD00000000000001FLL;
    v19._object = (void *)0x8000000100017710;
    Connection.execute(_:)(v19);
    if (!v20)
    {
      v21._countAndFlagsBits = 0xD000000000000018;
      v21._object = (void *)0x8000000100017730;
      Connection.execute(_:)(v21);
      if (!v22)
      {
        v23 = UUID.init()();
        v24 = UUID.uuidString.getter(v23);
        v26 = v25;
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        Connection.savepoint(_:block:)(v24, v26, sub_10000A3D8, a3);
        swift_bridgeObjectRelease(v26);
      }
    }
  }
  else
  {
    v31 = 0;
    v32 = 0xE000000000000000;
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease(v32);
    v31 = 0xD000000000000013;
    v32 = 0x80000001000176F0;
    v33 = a2;
    v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
    object = v27._object;
    String.append(_:)(v27);
    swift_bridgeObjectRelease(object);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v31, v32, "findmybeaconingd/StorageDatabase.swift", 38, 2, 99, 0);
    __break(1u);
  }
}

uint64_t sub_10000A3D8()
{
  return sub_10000982C();
}

uint64_t sub_10000A3F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100006044(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000A42C(uint64_t *a1)
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

uint64_t sub_10000A470(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000A42C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for Expression<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000A4B0()
{
  unint64_t result;

  result = qword_1000211B8;
  if (!qword_1000211B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_1000211B8);
  }
  return result;
}

uint64_t sub_10000A4F4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for StorageDatabase(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000A534()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v1[2] = v0;
  v2 = sub_100006044(&qword_1000212C8);
  v1[3] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL.DirectoryHint(0);
  v1[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v1[5] = v4;
  v1[6] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v1[7] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v1[8] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[9] = swift_task_alloc(v7);
  v1[10] = swift_task_alloc(v7);
  swift_defaultActor_initialize(v0);
  strcpy((char *)(v0 + 112), "StorageService");
  *(_BYTE *)(v0 + 127) = -18;
  v8 = (_QWORD *)swift_task_alloc(async function pointer to daemon.getter[1]);
  v1[11] = v8;
  *v8 = v1;
  v8[1] = sub_10000A630;
  return daemon.getter();
}

uint64_t sub_10000A630(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc(v3);
  v4 = type metadata accessor for Daemon(0);
  v5 = sub_10000AD38((unint64_t *)&unk_1000212D0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, v5);
  return swift_task_switch(sub_10000A6C8, v6, v7);
}

uint64_t sub_10000A6C8()
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
  void *v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = v0[12];
  v2 = v0[10];
  v4 = v0[7];
  v3 = v0[8];
  v6 = v0[5];
  v5 = v0[6];
  v7 = v0[3];
  v17 = v0[4];
  v18 = v0[9];
  v8 = Daemon.identifier.getter();
  v10 = v9;
  swift_release(v1);
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease(0xE000000000000000);
  v11._countAndFlagsBits = v8;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v10);
  v12._countAndFlagsBits = 47;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, enum case for URL.DirectoryHint.isDirectory(_:), v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v7, 1, 1, v4);
  URL.init(filePath:directoryHint:relativeTo:)(0xD000000000000010, 0x80000001000177B0, v5, v7);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v13(v18, v2, v4);
  v14 = type metadata accessor for StorageDatabase(0);
  v15 = swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  v0[13] = v15;
  swift_defaultActor_initialize(v15);
  *(_QWORD *)(v15 + 112) = 0;
  *(_DWORD *)(v15 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_currentVersion) = 1;
  v13(v15 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_baseContainerURL, v18, v4);
  *(_BYTE *)(v15 + OBJC_IVAR____TtC16findmybeaconingd15StorageDatabase_temporary) = 0;
  return swift_task_switch(sub_10000A874, v15, 0);
}

uint64_t sub_10000A874()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  v1 = v0[13];
  v2 = v0[9];
  v3 = v0[7];
  v4 = v0[2];
  v5 = *(void (**)(uint64_t, uint64_t))(v0[8] + 8);
  v0[14] = v5;
  v5(v2, v3);
  *(_QWORD *)(v4 + 128) = v1;
  v6 = type metadata accessor for StorageStore();
  v7 = swift_allocObject(v6, 120, 15);
  v0[15] = v7;
  swift_retain(v1);
  swift_defaultActor_initialize(v7);
  *(_QWORD *)(v7 + 112) = v1;
  return swift_task_switch(sub_10000A8F8, v7, 0);
}

uint64_t sub_10000A8F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 136) = *(_QWORD *)(v0 + 120);
  return swift_task_switch(sub_10000A914, v1, 0);
}

uint64_t sub_10000A914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 24);
  (*(void (**)(uint64_t, _QWORD))(v0 + 112))(v2, *(_QWORD *)(v0 + 56));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_10000A97C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[15]);
  swift_release(v0[16]);
  swift_release(v0[17]);
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for StorageService()
{
  return objc_opt_self(_TtC16findmybeaconingd14StorageService);
}

uint64_t sub_10000A9D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 120));
  return v1;
}

uint64_t sub_10000A9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.initialLaunchProcessing()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for StorageService();
  *v4 = v2;
  v4[1] = sub_10000AD78;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_10000AA5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.migrate(from:to:)[1]);
  *(_QWORD *)(v4 + 16) = v8;
  v9 = type metadata accessor for StorageService();
  *v8 = v4;
  v8[1] = sub_10000AD78;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_10000AAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.firstLaunchSinceReboot()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for StorageService();
  *v4 = v2;
  v4[1] = sub_10000AB38;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_10000AB38()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000AB80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch(sub_10000AB98, v0, 0);
}

uint64_t sub_10000AB98()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 128);
  *(_QWORD *)(v0 + 24) = v1;
  return swift_task_switch(sub_10000ABB4, v1, 0);
}

uint64_t sub_10000ABB4()
{
  uint64_t v0;

  type metadata accessor for StorageDatabase(0);
  sub_10000AD38(&qword_1000211C0, 255, type metadata accessor for StorageDatabase, (uint64_t)&unk_100016C38);
  Database.startup()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000AC34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.run()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for StorageService();
  *v4 = v2;
  v4[1] = sub_10000AB38;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_10000AC94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for StorageService();
  v2 = sub_10000AD38(&qword_100020E18, v1, (uint64_t (*)(uint64_t))type metadata accessor for StorageService, (uint64_t)&unk_100016D68);
  return ActorServiceProtocol.description.getter(v0, v2);
}

uint64_t sub_10000ACE0(uint64_t a1, uint64_t a2)
{
  return sub_10000AD38(&qword_100021288, a2, (uint64_t (*)(uint64_t))type metadata accessor for StorageService, (uint64_t)"ic");
}

uint64_t sub_10000AD0C(uint64_t a1, uint64_t a2)
{
  return sub_10000AD38(qword_100021290, a2, (uint64_t (*)(uint64_t))type metadata accessor for StorageService, (uint64_t)&unk_100016DC8);
}

uint64_t sub_10000AD38(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000AD7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a5;
  return swift_task_switch(sub_10000AD94, a4, 0);
}

uint64_t sub_10000AD94()
{
  uint64_t v0;
  unint64_t v1;

  v1 = sub_10000CC14();
  if ((NSXPCConnection.hasEntitlement<A>(_:)(v1, &type metadata for SearchPartyPushXPCService.Entitlement, v1) & 1) != 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  else
    return swift_task_switch(sub_10000ADF8, 0, 0);
}

uint64_t sub_10000ADF8()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), "invalidate");
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000AE30(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10000A3F0(a1, &qword_100021490);
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
  v16 = swift_allocObject(&unk_10001D210, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000214B0, v16);
}

uint64_t sub_10000AF7C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000A3F0(a1, &qword_100021490);
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
  v16 = swift_allocObject(&unk_10001D238, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = sub_100006044(&qword_1000214D8);
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, &unk_1000214D0, v16);
}

uint64_t sub_10000B0D0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 120));
  swift_release(*(_QWORD *)(v0 + 128));
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for SearchPartyPushXPCService()
{
  return objc_opt_self(_TtC16findmybeaconingd25SearchPartyPushXPCService);
}

uint64_t sub_10000B120(uint64_t a1)
{
  const char *v2;

  v2 = "\b";
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 96);
}

uint64_t sub_10000B160()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1[4] = v0;
  v2 = type metadata accessor for XPCServiceDescription(0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v1[7] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MachServiceName(0);
  v1[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[9] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[10] = swift_task_alloc(v6);
  v1[11] = swift_task_alloc(v6);
  return swift_task_switch(sub_10000B1F8, v0, 0);
}

uint64_t sub_10000B1F8()
{
  objc_super *v0;
  id receiver;
  Class super_class;
  id v3;
  Class v4;
  id v5;
  id v6;
  objc_class *v7;
  char *v8;
  uint64_t v9;
  objc_class *v10;
  objc_class *v11;
  id v12;
  objc_super **v13;
  _OWORD v15[2];
  uint64_t v16;

  receiver = v0[5].receiver;
  super_class = v0[5].super_class;
  v3 = v0[4].receiver;
  v4 = v0[4].super_class;
  v5 = v0[2].receiver;
  MachServiceName.init(_:)(0xD000000000000026, 0x8000000100017410);
  v6 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP7SPOwner33FindMyBeaconDaemonPushXPCProtocol_);
  v0[6].receiver = v6;
  v7 = (objc_class *)sub_100006044(&qword_100021470);
  v8 = (char *)objc_allocWithZone(v7);
  v9 = swift_weakInit(&v8[qword_1000213A0], 0);
  swift_weakAssign(v9, v5);
  v0[1].receiver = v8;
  v0[1].super_class = v7;
  v10 = (objc_class *)objc_msgSendSuper2(v0 + 1, "init");
  v0[6].super_class = v10;
  (*((void (**)(id, Class, id))v4 + 2))(receiver, super_class, v3);
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  v11 = v10;
  v12 = v6;
  swift_retain(v5);
  XPCServiceDescription.init(name:exportedObject:exportedInterface:options:requiredEntitlement:shouldAccept:)(receiver, v11, v12, 4096, v15, &unk_100021480, v5);
  v13 = (objc_super **)swift_task_alloc(async function pointer to daemon.getter[1]);
  v0[7].receiver = v13;
  *v13 = v0;
  v13[1] = (objc_super *)sub_10000B378;
  return daemon.getter();
}

uint64_t sub_10000B378(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 112);
  v5 = *v1;
  *(_QWORD *)(*v1 + 120) = a1;
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceDaemon.getService<A>()[1]);
  *(_QWORD *)(v3 + 128) = v6;
  v7 = type metadata accessor for Daemon(0);
  v8 = type metadata accessor for LocalBeaconing(0);
  v9 = sub_10000AD38(&qword_100020DF0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  v10 = sub_10000AD38((unint64_t *)&unk_100020E00, 255, type metadata accessor for LocalBeaconing, (uint64_t)&unk_100017100);
  *v6 = v5;
  v6[1] = sub_10000B468;
  return ActorServiceDaemon.getService<A>()(v7, v8, v9, v10);
}

uint64_t sub_10000B468(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 128);
  *(_QWORD *)(*v2 + 136) = v1;
  swift_task_dealloc(v5);
  v6 = *(_QWORD *)(v4 + 120);
  v7 = *(_QWORD *)(v4 + 32);
  if (v1)
  {
    swift_release(v6);
    v8 = sub_10000B66C;
  }
  else
  {
    swift_release(a1);
    swift_release(v6);
    v8 = sub_10000B4F8;
  }
  return swift_task_switch(v8, v7, 0);
}

uint64_t sub_10000B4F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v0 + 144) = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 128);
  v1 = type metadata accessor for XPCSessionManager(0);
  v2 = sub_10000AD38(&qword_100021488, 255, (uint64_t (*)(uint64_t))&type metadata accessor for XPCSessionManager, (uint64_t)&protocol conformance descriptor for XPCSessionManager);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, v2);
  return swift_task_switch(sub_10000B578, v3, v4);
}

uint64_t sub_10000B578()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = v0[17];
  dispatch thunk of XPCSessionManager.register(service:)(v0[7]);
  v0[19] = v1;
  if (v1)
    v2 = sub_10000B70C;
  else
    v2 = sub_10000B5D4;
  return swift_task_switch(v2, v0[4], 0);
}

uint64_t sub_10000B5D4()
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

  v1 = *(void **)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_task_dealloc(v3);
  swift_task_dealloc(v2);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B66C()
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

  v1 = *(void **)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B70C()
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

  v1 = *(void **)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 40);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B7AC(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v2[4] = *a2;
  v3 = sub_100006044(&qword_100021490);
  v2[5] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000B810, 0, 0);
}

uint64_t sub_10000B810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v4 = *(void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v5 = type metadata accessor for TaskPriority(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  v6 = (_QWORD *)swift_allocObject(&unk_10001D1E8, 56, 7);
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v3;
  v6[5] = v4;
  v6[6] = v2;
  swift_retain(v3);
  v7 = v4;
  v8 = sub_10000AE30(v1, (uint64_t)&unk_1000214A0, (uint64_t)v6);
  swift_release(v8);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_10000B8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.initialLaunchProcessing()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for SearchPartyPushXPCService();
  *v4 = v2;
  v4[1] = sub_10000AD78;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_10000B928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.migrate(from:to:)[1]);
  *(_QWORD *)(v4 + 16) = v8;
  v9 = type metadata accessor for SearchPartyPushXPCService();
  *v8 = v4;
  v8[1] = sub_10000AD78;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_10000B9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.firstLaunchSinceReboot()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for SearchPartyPushXPCService();
  *v4 = v2;
  v4[1] = sub_10000AD78;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_10000BA04()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10002146C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000AD78;
  return sub_10000B160();
}

uint64_t sub_10000BA48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.run()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for SearchPartyPushXPCService();
  *v4 = v2;
  v4[1] = sub_10000AB38;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_10000BAA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for SearchPartyPushXPCService();
  v2 = sub_10000AD38(&qword_100020E10, v1, (uint64_t (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService, (uint64_t)&unk_100016ED8);
  return ActorServiceProtocol.description.getter(v0, v2);
}

Swift::Int sub_10000BAF4()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  String.hash(into:)(v1, 0xD000000000000026, 0x8000000100017410);
  return Hasher._finalize()();
}

uint64_t sub_10000BB48(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000026, 0x8000000100017410);
}

Swift::Int sub_10000BB64()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  String.hash(into:)(v1, 0xD000000000000026, 0x8000000100017410);
  return Hasher._finalize()();
}

uint64_t sub_10000BBB4@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CBE0, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_10000BC04(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x8000000100017410;
}

uint64_t sub_10000BC24(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to daemon.getter[1]);
  v2[4] = v3;
  *v3 = v2;
  v3[1] = sub_10000BC70;
  return daemon.getter();
}

uint64_t sub_10000BC70(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 32);
  v5 = *v1;
  *(_QWORD *)(*v1 + 40) = a1;
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceDaemon.getService<A>()[1]);
  *(_QWORD *)(v3 + 48) = v6;
  v7 = type metadata accessor for Daemon(0);
  v8 = type metadata accessor for LocalBeaconing(0);
  v9 = sub_10000AD38(&qword_100020DF0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  v10 = sub_10000AD38((unint64_t *)&unk_100020E00, 255, type metadata accessor for LocalBeaconing, (uint64_t)&unk_100017100);
  *v6 = v5;
  v6[1] = sub_10000BD60;
  return ActorServiceDaemon.getService<A>()(v7, v8, v9, v10);
}

uint64_t sub_10000BD60(uint64_t a1)
{
  uint64_t v1;
  uint64_t **v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t **v7;

  v4 = (*v2)[6];
  v5 = *v2;
  v5[7] = a1;
  v5[8] = v1;
  swift_task_dealloc(v4);
  if (v1)
    return swift_task_switch(sub_10000BE74, v5[3], 0);
  swift_release(v5[5]);
  v7 = (uint64_t **)swift_task_alloc(dword_100021674);
  v5[9] = (uint64_t)v7;
  *v7 = v5;
  v7[1] = (uint64_t *)sub_10000BE0C;
  return sub_10000D0D8(v5[2]);
}

uint64_t sub_10000BE0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v4 = sub_10000BEDC;
  else
    v4 = sub_10000BEA8;
  return swift_task_switch(v4, v3, 0);
}

uint64_t sub_10000BE74()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BEA8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BEDC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BF10(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v17;

  v9 = sub_100006044(&qword_100021490);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10001D288, 72, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = a1;
  v13[5] = a2;
  v13[6] = v4;
  v13[7] = a3;
  v13[8] = a4;
  sub_10000CECC(a1, a2);
  v14 = v4;
  swift_retain(a4);
  v15 = sub_10000AE30((uint64_t)v11, (uint64_t)&unk_1000214E8, (uint64_t)v13);
  return swift_release(v15);
}

uint64_t sub_10000C008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  v9 = swift_isaMask;
  v8[8] = *a6;
  v8[9] = v9;
  v10 = type metadata accessor for LocalBeaconKeyInfo(0);
  v8[10] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v8[11] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[12] = swift_task_alloc(v12);
  v8[13] = swift_task_alloc(v12);
  v13 = (*(_QWORD *)(*(_QWORD *)(sub_100006044((uint64_t *)&unk_1000214F0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[14] = swift_task_alloc(v13);
  v8[15] = swift_task_alloc(v13);
  return swift_task_switch(sub_10000C0C8, 0, 0);
}

uint64_t sub_10000C0C8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_QWORD);
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
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1 >> 60 == 15)
  {
    v2 = *(_QWORD *)(v0 + 120);
    v3 = type metadata accessor for LocalBeaconKeyInfo(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 24);
    v11 = *(_QWORD *)(v0 + 80);
    v12 = type metadata accessor for PropertyListDecoder(0);
    swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
    v13 = sub_100008858(v10, v1);
    v14 = PropertyListDecoder.init()(v13);
    v15 = sub_10000AD38(&qword_100021500, 255, (uint64_t (*)(uint64_t))&type metadata accessor for LocalBeaconKeyInfo, (uint64_t)&protocol conformance descriptor for LocalBeaconKeyInfo);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v11, v10, v1, v11, v15);
    v18 = *(_QWORD *)(v0 + 104);
    v17 = *(_QWORD *)(v0 + 112);
    v20 = *(_QWORD *)(v0 + 88);
    v19 = *(_QWORD *)(v0 + 96);
    v21 = *(_QWORD *)(v0 + 80);
    swift_release(v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v18, v21);
    sub_100007D9C(v19, v17);
    v25 = *(_QWORD *)(v0 + 112);
    v26 = *(_QWORD *)(v0 + 120);
    v28 = *(_QWORD *)(v0 + 24);
    v27 = *(_QWORD *)(v0 + 32);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    sub_10000CDD8(v28, v27);
    v29 = type metadata accessor for LocalBeaconKeyInfo(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v25, 0, 1, v29);
    sub_10000CEE0(v25, v26);
  }
  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 40) + qword_1000213A0);
  *(_QWORD *)(v0 + 128) = Strong;
  if (Strong)
  {
    v6 = *(_QWORD *)((*(_QWORD *)(v0 + 64) & *(_QWORD *)(v0 + 72)) + 0x50);
    v5 = *(_QWORD *)((*(_QWORD *)(v0 + 64) & *(_QWORD *)(v0 + 72)) + 0x58);
    v7 = *(int **)(v5 + 8);
    v30 = (int *)((char *)v7 + *v7);
    v8 = (_QWORD *)swift_task_alloc(v7[1]);
    *(_QWORD *)(v0 + 136) = v8;
    *v8 = v0;
    v8[1] = sub_10000C4C8;
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v30)(*(_QWORD *)(v0 + 120), v6, v5);
  }
  else
  {
    v16 = *(void (**)(_QWORD))(v0 + 48);
    sub_10000A3F0(*(_QWORD *)(v0 + 120), (uint64_t *)&unk_1000214F0);
    v16(0);
    v22 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 96);
    v23 = *(_QWORD *)(v0 + 104);
    swift_task_dealloc(*(_QWORD *)(v0 + 120));
    swift_task_dealloc(v22);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10000C4C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 136);
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc(v3);
  swift_unknownObjectRelease(*(_QWORD *)(v2 + 128));
  if (v0)
    v4 = sub_10000C5A4;
  else
    v4 = sub_10000C534;
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000C534()
{
  uint64_t v0;
  void (*v1)(_QWORD);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(_QWORD))(v0 + 48);
  sub_10000A3F0(*(_QWORD *)(v0 + 120), (uint64_t *)&unk_1000214F0);
  v1(0);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 120));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C5A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_10000A3F0(*(_QWORD *)(v0 + 120), (uint64_t *)&unk_1000214F0);
  v1 = *(_QWORD *)(v0 + 144);
  if (qword_100020D40 != -1)
    swift_once(&qword_100020D40, sub_10000C96C);
  v2 = type metadata accessor for Logger(0);
  sub_100005BF0(v2, (uint64_t)qword_100021B68);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    v8 = _convertErrorToNSError(_:)(v1);
    *(_QWORD *)(v0 + 16) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v1);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "TRACE: XPC error: %@", v6, 0xCu);
    v9 = sub_100006044(&qword_100020DE8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }
  else
  {
    swift_errorRelease(v1);
  }

  v10 = *(void (**)(uint64_t))(v0 + 48);
  swift_errorRetain(v1);
  v10(v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  v11 = *(_QWORD *)(v0 + 112);
  v13 = *(_QWORD *)(v0 + 96);
  v12 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 120));
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000C78C(void *a1, int a2, void *a3, void *aBlock)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v5 = _Block_copy(aBlock);
  v6 = a1;
  if (a3)
  {
    v7 = a3;
    v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0xF000000000000000;
  }
  v11 = swift_allocObject(&unk_10001D260, 24, 7);
  *(_QWORD *)(v11 + 16) = v5;
  sub_10000BF10(v8, v10, (uint64_t)sub_10000CDD0, v11);
  swift_release(v11);
  sub_10000CDD8(v8, v10);

}

void sub_10000C85C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_10000C8A8()
{
  sub_10000CD80();
}

id sub_10000C8C4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C8F8(uint64_t a1)
{
  return swift_unknownObjectWeakDestroy(a1 + qword_1000213A0);
}

uint64_t type metadata accessor for SearchPartyPushXPCService.Trampoline(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000CF28(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SearchPartyPushXPCService.Trampoline);
}

uint64_t sub_10000C914(uint64_t a1, uint64_t a2)
{
  return sub_10000AD38(&qword_100021430, a2, (uint64_t (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService, (uint64_t)&unk_100016EB0);
}

uint64_t sub_10000C940(uint64_t a1, uint64_t a2)
{
  return sub_10000AD38(qword_100021438, a2, (uint64_t (*)(uint64_t))type metadata accessor for SearchPartyPushXPCService, (uint64_t)&unk_100016F38);
}

uint64_t sub_10000C96C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021B68);
  sub_100005BF0(v0, (uint64_t)qword_100021B68);
  return Logger.init(subsystem:category:)(0xD000000000000021, 0x8000000100017470, 0xD000000000000019, 0x8000000100016DF0);
}

uint64_t sub_10000C9EC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc(dword_10002147C);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100005BA0;
  return sub_10000B7AC(a1, v1);
}

uint64_t sub_10000CA3C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000CA70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc(dword_10002149C);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_10000AD78;
  v4[2] = v3;
  return swift_task_switch(sub_10000AD94, v2, 0);
}

uint64_t sub_10000CAD0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000CB34;
  return v6(a1);
}

uint64_t sub_10000CB34()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000CB80()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CBA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000214AC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000AD78;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000214A8 + dword_1000214A8))(a1, v4);
}

unint64_t sub_10000CC14()
{
  unint64_t result;

  result = qword_1000214B8;
  if (!qword_1000214B8)
  {
    result = swift_getWitnessTable(&unk_100017014, &type metadata for SearchPartyPushXPCService.Entitlement);
    atomic_store(result, (unint64_t *)&qword_1000214B8);
  }
  return result;
}

uint64_t sub_10000CC58(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_10000CCC0;
  return v5(v2 + 16);
}

uint64_t sub_10000CCC0()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 32));
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10000CD10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000214CC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000AB38;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000214C8 + dword_1000214C8))(a1, v4);
}

void sub_10000CD80()
{
  _swift_stdlib_reportUnimplementedInitializer("findmybeaconingd.Trampoline", 27, "init()", 6, 0);
  __break(1u);
}

uint64_t sub_10000CDAC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000CDD0(uint64_t a1)
{
  uint64_t v1;

  sub_10000C85C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000CDD8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100008814(result, a2);
  return result;
}

uint64_t sub_10000CDEC()
{
  uint64_t v0;
  unint64_t v1;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 40);
  if (v1 >> 60 != 15)
    sub_100008814(*(_QWORD *)(v0 + 32), v1);

  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10000CE38(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = (_QWORD *)v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_1000214E4);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_10000AB38;
  return sub_10000C008(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10000CECC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100008858(a1, a2);
  return a1;
}

uint64_t sub_10000CEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006044((uint64_t *)&unk_1000214F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t getEnumTagSinglePayload for SearchPartyPushXPCService.Entitlement(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchPartyPushXPCService.Entitlement(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000CFE8 + 4 * byte_100016DF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000D008 + 4 * byte_100016DF5[v4]))();
}

_BYTE *sub_10000CFE8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000D008(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000D010(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000D018(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000D020(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000D028(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SearchPartyPushXPCService.Entitlement()
{
  return &type metadata for SearchPartyPushXPCService.Entitlement;
}

unint64_t sub_10000D048()
{
  unint64_t result;

  result = qword_100021508;
  if (!qword_100021508)
  {
    result = swift_getWitnessTable(&unk_100016FEC, &type metadata for SearchPartyPushXPCService.Entitlement);
    atomic_store(result, (unint64_t *)&qword_100021508);
  }
  return result;
}

unint64_t sub_10000D090()
{
  unint64_t result;

  result = qword_100021510;
  if (!qword_100021510)
  {
    result = swift_getWitnessTable("-d", &type metadata for SearchPartyPushXPCService.Entitlement);
    atomic_store(result, (unint64_t *)&qword_100021510);
  }
  return result;
}

uint64_t sub_10000D0D8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2[11] = a1;
  v2[12] = v1;
  v3 = (*(_QWORD *)(*(_QWORD *)(sub_100006044((uint64_t *)&unk_1000214F0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[13] = swift_task_alloc(v3);
  v2[14] = swift_task_alloc(v3);
  v2[15] = swift_task_alloc(v3);
  v4 = type metadata accessor for LocalBeaconKeyInfo(0);
  v2[16] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[17] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[18] = swift_task_alloc(v6);
  v2[19] = swift_task_alloc(v6);
  return swift_task_switch(sub_10000D188, v1, 0);
}

uint64_t sub_10000D188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v35;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 120);
  sub_10000EFCC(*(_QWORD *)(v0 + 88), v3);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v4(v3, 1, v1) == 1)
  {
    sub_10000F014(*(_QWORD *)(v0 + 120));
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD *)(v0 + 96);
    sub_1000101B4(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 152));
    v8 = v7 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess(v8, v0 + 64, 0, 0);
    sub_10000EFCC(v8, v6);
    v9 = v4(v6, 1, v5);
    v10 = *(_QWORD *)(v0 + 152);
    if (v9 == 1)
    {
      v11 = *(_QWORD *)(v0 + 112);
      sub_100008968(*(_QWORD *)(v0 + 152));
      sub_10000F014(v11);
    }
    else
    {
      v12 = *(_QWORD *)(v0 + 144);
      sub_1000101B4(*(_QWORD *)(v0 + 112), v12);
      if ((sub_100008660(v10, v12) & 1) != 0)
      {
        if (qword_100020D48 != -1)
          swift_once(&qword_100020D48, sub_10000D8A0);
        v13 = type metadata accessor for Logger(0);
        v14 = sub_100005BF0(v13, (uint64_t)qword_100021B80);
        v15 = Logger.logObject.getter(v14);
        v16 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Already know about this beacon -- ignoring redundant call.", v17, 2u);
          swift_slowDealloc(v17, -1, -1);
        }
        v19 = *(_QWORD *)(v0 + 144);
        v18 = *(_QWORD *)(v0 + 152);

        sub_100008968(v19);
        sub_100008968(v18);
        goto LABEL_19;
      }
      v20 = *(_QWORD *)(v0 + 152);
      sub_100008968(*(_QWORD *)(v0 + 144));
      sub_100008968(v20);
    }
  }
  v21 = *(_QWORD *)(v0 + 128);
  if (v4(*(_QWORD *)(v0 + 88), 1, v21) == 1)
  {
    v22 = *(_QWORD *)(v0 + 104);
    v23 = *(_QWORD *)(v0 + 96) + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess(v23, v0 + 16, 0, 0);
    sub_10000EFCC(v23, v22);
    v24 = v4(v22, 1, v21);
    sub_10000F014(v22);
    if (v24 == 1)
    {
      if (qword_100020D48 != -1)
        swift_once(&qword_100020D48, sub_10000D8A0);
      v25 = type metadata accessor for Logger(0);
      v26 = sub_100005BF0(v25, (uint64_t)qword_100021B80);
      v27 = Logger.logObject.getter(v26);
      v28 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v29 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Beacon already removed -- ignoring redundant call.", v29, 2u);
        swift_slowDealloc(v29, -1, -1);
      }

LABEL_19:
      v30 = *(_QWORD *)(v0 + 144);
      v32 = *(_QWORD *)(v0 + 112);
      v31 = *(_QWORD *)(v0 + 120);
      v33 = *(_QWORD *)(v0 + 104);
      swift_task_dealloc(*(_QWORD *)(v0 + 152));
      swift_task_dealloc(v30);
      swift_task_dealloc(v31);
      swift_task_dealloc(v32);
      swift_task_dealloc(v33);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  v35 = (_QWORD *)swift_task_alloc(async function pointer to daemon.getter[1]);
  *(_QWORD *)(v0 + 160) = v35;
  *v35 = v0;
  v35[1] = sub_10000D4F4;
  return daemon.getter();
}

uint64_t sub_10000D4F4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 160);
  v5 = *v1;
  *(_QWORD *)(*v1 + 168) = a1;
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceDaemon.getService<A>()[1]);
  *(_QWORD *)(v3 + 176) = v6;
  v7 = type metadata accessor for Daemon(0);
  v8 = type metadata accessor for StorageService();
  v9 = sub_1000066F0(&qword_100020DF0, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  v10 = sub_1000066F0(&qword_100020E18, (uint64_t (*)(uint64_t))type metadata accessor for StorageService, (uint64_t)&unk_100016D68);
  *v6 = v5;
  v6[1] = sub_10000D5DC;
  return ActorServiceDaemon.getService<A>()(v7, v8, v9, v10);
}

uint64_t sub_10000D5DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 176);
  v4[23] = a1;
  v4[24] = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = v4[12];
    v7 = sub_10000D82C;
  }
  else
  {
    swift_release(v4[21]);
    v7 = sub_10000D658;
    v6 = a1;
  }
  return swift_task_switch(v7, v6, 0);
}

uint64_t sub_10000D658()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10002198C);
  *(_QWORD *)(v0 + 200) = v1;
  *v1 = v0;
  v1[1] = sub_10000D6AC;
  return sub_100014190(*(_QWORD *)(v0 + 88));
}

uint64_t sub_10000D6AC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 200);
  *(_QWORD *)(*v1 + 208) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_10000D7B8;
  else
    v4 = sub_10000D710;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 96), 0);
}

uint64_t sub_10000D710()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 184));
  v3 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  swift_beginAccess(v3, v0 + 40, 33, 0);
  sub_10001016C(v1, v3);
  swift_endAccess(v0 + 40);
  v4 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D7B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release(*(_QWORD *)(v0 + 184));
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D82C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release(*(_QWORD *)(v0 + 168));
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D8A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021B80);
  v1 = sub_100005BF0(v0, (uint64_t)qword_100021B80);
  if (qword_100020D50 != -1)
    swift_once(&qword_100020D50, sub_1000100EC);
  v2 = sub_100005BF0(v0, (uint64_t)qword_100021B98);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_10000D930()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 120));
  sub_10000F014(v0 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo);
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_10000D964()
{
  return type metadata accessor for LocalBeaconing(0);
}

uint64_t type metadata accessor for LocalBeaconing(uint64_t a1)
{
  uint64_t result;

  result = qword_100021550;
  if (!qword_100021550)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LocalBeaconing);
  return result;
}

void sub_10000D9A8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[1] = &unk_100017098;
  sub_10000DA30(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    v4[3] = &unk_1000170B0;
    swift_updateClassMetadata2(a1, 256, 4, v4, a1 + 80);
  }
}

void sub_10000DA30(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100021560)
  {
    v2 = type metadata accessor for LocalBeaconKeyInfo(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100021560);
  }
}

uint64_t sub_10000DA84()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch(sub_10000DA9C, v0, 0);
}

uint64_t sub_10000DA9C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  if (&getBeacon(device:count:swizzler:))
    initializeFindMyBeaconingSupport()();
  v1 = (_QWORD *)swift_task_alloc(dword_100021684);
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_10000DB10;
  v2 = *(_QWORD **)(v0 + 40);
  v1[12] = v2;
  v1[13] = *v2;
  return swift_task_switch(sub_10000E0C8, v2, 0);
}

uint64_t sub_10000DB10()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 48);
  v4 = *v1;
  swift_task_dealloc(v3);
  if (v0)
    return (*(uint64_t (**)(void))(v4 + 8))();
  v6 = (_QWORD *)swift_task_alloc(async function pointer to daemon.getter[1]);
  *(_QWORD *)(v2 + 56) = v6;
  *v6 = v4;
  v6[1] = sub_10000DB8C;
  return daemon.getter();
}

uint64_t sub_10000DB8C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 56);
  v5 = *v1;
  *(_QWORD *)(*v1 + 64) = a1;
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceDaemon.getService<A>()[1]);
  *(_QWORD *)(v3 + 72) = v6;
  v7 = type metadata accessor for Daemon(0);
  v8 = type metadata accessor for StorageService();
  v9 = sub_1000066F0(&qword_100020DF0, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  v10 = sub_1000066F0(&qword_100020E18, (uint64_t (*)(uint64_t))type metadata accessor for StorageService, (uint64_t)&unk_100016D68);
  *v6 = v5;
  v6[1] = sub_10000DC74;
  return ActorServiceDaemon.getService<A>()(v7, v8, v9, v10);
}

uint64_t sub_10000DC74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v8;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 72);
  v4[10] = a1;
  v4[11] = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = v4[5];
    v7 = sub_10000E074;
  }
  else
  {
    swift_release(v4[8]);
    v8 = *(_QWORD *)(*(_QWORD *)(sub_100006044((uint64_t *)&unk_1000214F0) - 8) + 64);
    v4[12] = v8;
    v4[13] = swift_task_alloc((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v7 = sub_10000DD18;
    v6 = a1;
  }
  return swift_task_switch(v7, v6, 0);
}

uint64_t sub_10000DD18()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100021994);
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_10000DD6C;
  return sub_100014B34(*(_QWORD *)(v0 + 104));
}

uint64_t sub_10000DD6C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 112);
  *(_QWORD *)(*v1 + 120) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_10000E034;
  else
    v4 = sub_10000DDD0;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 40), 0);
}

uint64_t sub_10000DDD0()
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
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = (*(_QWORD *)(v0 + 96) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = swift_task_alloc(v3);
  sub_10000CEE0(v1, v4);
  v5 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  swift_beginAccess(v5, v0 + 16, 33, 0);
  sub_100010BF4(v4, v5);
  swift_endAccess(v0 + 16);
  swift_task_dealloc(v4);
  swift_task_dealloc(v1);
  v6 = swift_task_alloc(v3);
  sub_10000EFCC(v5, v6);
  v7 = type metadata accessor for LocalBeaconKeyInfo(0);
  LODWORD(v1) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  sub_10000F014(v6);
  swift_task_dealloc(v6);
  if ((_DWORD)v1 != 1)
  {
    if (qword_100020D48 != -1)
      swift_once(&qword_100020D48, sub_10000D8A0);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_100005BF0(v8, (uint64_t)qword_100021B80);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v10, v11))
      goto LABEL_13;
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    v13 = "Beaconing FMIP keys.";
    goto LABEL_12;
  }
  if (!&getBeacon(device:count:swizzler:))
  {
    if (qword_100020D48 != -1)
      swift_once(&qword_100020D48, sub_10000D8A0);
    v14 = type metadata accessor for Logger(0);
    v15 = sub_100005BF0(v14, (uint64_t)qword_100021B80);
    v10 = Logger.logObject.getter(v15);
    v11 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v10, v11))
      goto LABEL_13;
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    v13 = "Not beaconing since FMIP is turned off.";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v13, v12, 2u);
    swift_slowDealloc(v12, -1, -1);
LABEL_13:

    goto LABEL_14;
  }
  logInUse()();
LABEL_14:
  v16 = *(_QWORD *)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 80));
  *(_BYTE *)(v16 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_initialFetchComplete) = 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E034()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 80));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E074()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E0A8()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = v0;
  *(_QWORD *)(v1 + 104) = *v0;
  return swift_task_switch(sub_10000E0C8, v0, 0);
}

uint64_t sub_10000E0C8()
{
  uint64_t v0;
  uint64_t My;
  uint64_t v2;
  _QWORD *v3;
  void (*v4)(_QWORD *, _QWORD, uint64_t);
  char v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  _QWORD *v11;

  My = type metadata accessor for Feature.FindMy(0);
  *(_QWORD *)(v0 + 40) = My;
  v2 = sub_1000066F0(&qword_100021688, (uint64_t (*)(uint64_t))&type metadata accessor for Feature.FindMy, (uint64_t)&protocol conformance descriptor for Feature.FindMy);
  *(_QWORD *)(v0 + 48) = v2;
  v3 = sub_100010C3C((_QWORD *)(v0 + 16));
  v4 = *(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(My - 8) + 104);
  v4(v3, enum case for Feature.FindMy.baLPEM(_:), My);
  v5 = isFeatureEnabled(_:)(v0 + 16);
  v6 = sub_100008904((_QWORD *)(v0 + 16));
  if ((v5 & 1) == 0)
  {
    *(_QWORD *)(v0 + 80) = My;
    *(_QWORD *)(v0 + 88) = v2;
    v7 = sub_100010C3C((_QWORD *)(v0 + 56));
    v4(v7, enum case for Feature.FindMy.baPowerOff(_:), My);
    v8 = isFeatureEnabled(_:)(v0 + 56);
    v6 = sub_100008904((_QWORD *)(v0 + 56));
    if ((v8 & 1) == 0)
      return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if ((static SystemInfo.isFactoryBuild.getter(v6) & 1) == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v9 = swift_task_alloc(48);
  *(_QWORD *)(v0 + 112) = v9;
  v10 = *(_OWORD *)(v0 + 96);
  *(_BYTE *)(v9 + 16) = 0;
  *(_OWORD *)(v9 + 24) = v10;
  v11 = (_QWORD *)swift_task_alloc(async function pointer to withOnceCheckedThrowingContinuation<A>(function:_:)[1]);
  *(_QWORD *)(v0 + 120) = v11;
  *v11 = v0;
  v11[1] = sub_10000E24C;
  return withOnceCheckedThrowingContinuation<A>(function:_:)();
}

uint64_t sub_10000E24C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v6;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 120);
  *(_QWORD *)(*v1 + 128) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = *(_QWORD *)(v2 + 96);
    v5 = sub_10000E2CC;
  }
  else
  {
    v6 = *(_QWORD *)(v2 + 96);
    swift_task_dealloc(*(_QWORD *)(v2 + 112));
    v5 = sub_10000E2C0;
    v4 = v6;
  }
  return swift_task_switch(v5, v4, 0);
}

uint64_t sub_10000E2C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E2CC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000E300(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.initialLaunchProcessing()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for LocalBeaconing(0);
  *v4 = v2;
  v4[1] = sub_10000AD78;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_10000E364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.migrate(from:to:)[1]);
  *(_QWORD *)(v4 + 16) = v8;
  v9 = type metadata accessor for LocalBeaconing(0);
  *v8 = v4;
  v8[1] = sub_10000AD78;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_10000E3E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.firstLaunchSinceReboot()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for LocalBeaconing(0);
  *v4 = v2;
  v4[1] = sub_10000AD78;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_10000E448()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc(dword_10002167C);
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_10000AD78;
  v2[5] = v0;
  return swift_task_switch(sub_10000DA9C, v0, 0);
}

uint64_t sub_10000E4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.run()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for LocalBeaconing(0);
  *v4 = v2;
  v4[1] = sub_10000AB38;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_10000E508()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for LocalBeaconing(0);
  v1 = sub_1000066F0((unint64_t *)&unk_100020E00, type metadata accessor for LocalBeaconing, (uint64_t)&unk_100017100);
  return ActorServiceProtocol.description.getter(v0, v1);
}

uint64_t sub_10000E558(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  BOOL v14;
  uint64_t v15;
  unint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[2];
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;

  v28 = a3;
  v6 = sub_100006044(&qword_1000216C8);
  __chkstk_darwin(v6);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for GeneratedTokens(0);
  v10 = *(_QWORD *)(v9 - 8);
  result = __chkstk_darwin(v9);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a1;
  v30 = a2;
  v14 = __OFSUB__(a2, a1);
  v15 = a2 - a1;
  if (v14)
  {
LABEL_16:
    __break(1u);
  }
  else
  {
    v16 = (unint64_t *)&_swiftEmptyArrayStorage;
    if (!v15)
      return (uint64_t)v16;
    v17 = v13;
    v31 = (unint64_t *)&_swiftEmptyArrayStorage;
    result = sub_100010838(0, v15 & ~(v15 >> 63), 0);
    if ((v15 & 0x8000000000000000) == 0)
    {
      v26[1] = v3;
      v27 = v8;
      v16 = v31;
      v18 = v30;
      if (v30 <= v29)
        v18 = v29;
      v19 = v18 - v29;
      v20 = v9;
      v21 = v17;
      v22 = v10;
      while (1)
      {
        TokenSequence.next()(result);
        result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v8, 1, v20);
        if ((_DWORD)result == 1)
          goto LABEL_18;
        v23 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
        v23(v21, v8, v20);
        v31 = v16;
        v25 = v16[2];
        v24 = v16[3];
        if (v25 >= v24 >> 1)
        {
          sub_100010838(v24 > 1, v25 + 1, 1);
          v16 = v31;
        }
        v16[2] = v25 + 1;
        result = ((uint64_t (*)(char *, char *, uint64_t))v23)((char *)v16+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(_QWORD *)(v22 + 72) * v25, v21, v20);
        if (v30 < v29)
        {
          __break(1u);
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
        if (!v19)
          goto LABEL_15;
        --v19;
        --v15;
        v8 = v27;
        if (!v15)
          return (uint64_t)v16;
      }
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

_QWORD *sub_10000E764(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = &_swiftEmptyArrayStorage;
  if (v6)
  {
    v17 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v6);
    v9 = *(_QWORD *)(type metadata accessor for GeneratedTokens(0) - 8);
    v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = *(_QWORD *)(v9 + 72);
    while (1)
    {
      v12 = a1(&v16, v10);
      if (v4)
        break;
      v4 = 0;
      v13 = v16;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
      v14 = v17[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v13);
      specialized ContiguousArray._endMutation()(v15);
      v10 += v11;
      if (!--v6)
        return v17;
    }
    return (_QWORD *)swift_release(v17);
  }
  return result;
}

uint64_t sub_10000E86C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  Class isa;
  Class v52;
  id v53;
  void (*v54)(char *, uint64_t);
  uint64_t result;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;

  v72 = a4;
  v60 = a3;
  v63 = a2;
  v5 = type metadata accessor for NearOwnerAdvertisement(0);
  v58 = *(_QWORD *)(v5 - 8);
  v59 = v5;
  __chkstk_darwin(v5);
  v57 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Advertisement(0);
  v68 = *(_QWORD *)(v7 - 8);
  v69 = v7;
  __chkstk_darwin(v7);
  v67 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PublicKey(0);
  v65 = *(_QWORD *)(v9 - 8);
  v66 = v9;
  __chkstk_darwin(v9);
  v64 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DiversifiedRootKeys(0);
  v61 = *(_QWORD *)(v11 - 8);
  v62 = v11;
  __chkstk_darwin(v11);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for KeyGenerationHint(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for Date(0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = type metadata accessor for DateInterval(0);
  v73 = *(_QWORD *)(v71 - 8);
  v22 = __chkstk_darwin(v71);
  v70 = (char *)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v25 = (char *)&v56 - v24;
  v26 = type metadata accessor for LocalBeaconKeyInfo(0);
  v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v63 + *(int *)(v26 + 24), v18);
  v63 = a1;
  v28 = GeneratedTokens.hint.getter(v27);
  v29 = KeyGenerationHint.index.getter(v28);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  dateInterval(baseTime:bucket:bucketSizeInMinutes:)(v21, v29, 15);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  if (v60 == 1)
  {
    v31 = v70;
    v30 = v71;
    v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v73 + 16))(v70, v25, v71);
  }
  else
  {
    if (!v60)
    {
      v31 = v70;
      v30 = v71;
      v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v73 + 16))(v70, v25, v71);
      goto LABEL_9;
    }
    v31 = v70;
    v30 = v71;
    if (v60 != -1)
    {
      v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v73 + 16))(v70, v25, v71);
LABEL_9:
      v44 = GeneratedTokens.diversifiedRootKeys.getter(v43);
      v45 = v64;
      DiversifiedRootKeys.publicKey.getter(v44);
      v46 = (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v13, v62);
      v47 = v67;
      PublicKey.advertisement.getter(v46);
      v48 = (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v45, v66);
      v40 = Advertisement.data.getter(v48);
      v42 = v49;
      (*(void (**)(char *, uint64_t))(v68 + 8))(v47, v69);
      goto LABEL_10;
    }
    v32 = (*(uint64_t (**)(char *, char *, uint64_t))(v73 + 16))(v70, v25, v71);
  }
  v33 = GeneratedTokens.diversifiedRootKeys.getter(v32);
  v34 = v64;
  DiversifiedRootKeys.publicKey.getter(v33);
  v35 = (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v13, v62);
  v36 = v67;
  PublicKey.advertisement.getter(v35);
  v37 = (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v34, v66);
  v38 = v57;
  Advertisement.nearOwner.getter(v37);
  v39 = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v36, v69);
  v40 = NearOwnerAdvertisement.data.getter(v39);
  v42 = v41;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v38, v59);
LABEL_10:
  v50 = objc_allocWithZone((Class)SPBeaconingKey);
  isa = DateInterval._bridgeToObjectiveC()().super.isa;
  v52 = Data._bridgeToObjectiveC()().super.isa;
  v53 = objc_msgSend(v50, "initWithDateInterval:key:", isa, v52);

  sub_100008814(v40, v42);
  v54 = *(void (**)(char *, uint64_t))(v73 + 8);
  v54(v31, v30);
  result = ((uint64_t (*)(char *, uint64_t))v54)(v25, v30);
  *v72 = v53;
  return result;
}

unint64_t *sub_10000ECCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  unint64_t *v12;
  _BYTE v15[24];

  v4 = sub_100006044((uint64_t *)&unk_1000214F0);
  __chkstk_darwin(v4);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for LocalBeaconKeyInfo(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = (_QWORD *)(v1 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo);
  swift_beginAccess(v11, v15, 0, 0);
  sub_10000EFCC((uint64_t)v11, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10000F014((uint64_t)v6);
    v12 = sub_1000111C4();
    if (!v2)
      return v12;
  }
  else
  {
    sub_1000101B4((uint64_t)v6, (uint64_t)v10);
    v11 = sub_100010E9C(a1, (uint64_t)v10);
    sub_100008968((uint64_t)v10);
  }
  return v11;
}

uint64_t sub_10000EE1C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch(sub_10000EE34, v0, 0);
}

uint64_t sub_10000EE34()
{
  uint64_t v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (&getBeacon(device:count:swizzler:))
  {
    v1 = 1;
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 40);
    v3 = sub_100006044((uint64_t *)&unk_1000214F0);
    v4 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    v5 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess(v5, v0 + 16, 0, 0);
    sub_10000EFCC(v5, v4);
    v6 = type metadata accessor for LocalBeaconKeyInfo(0);
    v1 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 1, v6) != 1;
    sub_10000F014(v4);
    swift_task_dealloc(v4);
  }
  return (*(uint64_t (**)(_BOOL8))(v0 + 8))(v1);
}

uint64_t sub_10000EF10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch(sub_10000EF28, v1, 0);
}

uint64_t sub_10000EF28()
{
  uint64_t v0;
  unint64_t *v1;

  v1 = sub_10000ECCC(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(unint64_t *))(v0 + 8))(v1);
}

uint64_t sub_10000EF74()
{
  return sub_1000066F0(&qword_100021638, type metadata accessor for LocalBeaconing, (uint64_t)&unk_1000170D8);
}

uint64_t sub_10000EFA0()
{
  return sub_1000066F0(qword_100021640, type metadata accessor for LocalBeaconing, (uint64_t)&unk_100017160);
}

uint64_t sub_10000EFCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006044((uint64_t *)&unk_1000214F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F014(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100006044((uint64_t *)&unk_1000214F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000F054(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;

  v8 = (void *)objc_opt_self(NFHardwareManager);
  v9 = swift_allocObject(&unk_10001D438, 48, 7);
  *(_QWORD *)(v9 + 16) = a1;
  *(_BYTE *)(v9 + 24) = a2;
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a4;
  v12[4] = sub_100010C88;
  v13 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100010098;
  v12[3] = &unk_10001D450;
  v10 = _Block_copy(v12);
  v11 = v13;
  swift_retain(a1);
  swift_retain(a3);
  swift_release(v11);
  objc_msgSend(v8, "sharedHardwareManager:", v10);
  _Block_release(v10);
}

uint64_t sub_10000F140(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;

  v10 = sub_100006044(&qword_100021490);
  __chkstk_darwin(v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v13 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
    v14 = swift_allocObject(&unk_10001D488, 72, 7);
    *(_QWORD *)(v14 + 16) = 0;
    *(_QWORD *)(v14 + 24) = 0;
    *(_QWORD *)(v14 + 32) = a1;
    *(_QWORD *)(v14 + 40) = a2;
    *(_BYTE *)(v14 + 48) = a3 & 1;
    *(_QWORD *)(v14 + 56) = a4;
    *(_QWORD *)(v14 + 64) = a5;
    v15 = a1;
    swift_retain(a2);
    swift_retain(a4);
    v16 = sub_10000AF7C((uint64_t)v12, (uint64_t)&unk_100021698, v14);
    return swift_release(v16);
  }
  else
  {
    if (qword_100020D48 != -1)
      swift_once(&qword_100020D48, sub_10000D8A0);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_100005BF0(v18, (uint64_t)qword_100021B80);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "NFHardwareManager.sharedHardwareManager returned a nil hardwareManager!", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000047, 0x80000001000179A0, "findmybeaconingd/LocalBeaconing.swift", 37, 2, 206, 0);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000F33C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  *(_QWORD *)(v8 + 88) = a7;
  *(_QWORD *)(v8 + 96) = a8;
  *(_BYTE *)(v8 + 104) = a6;
  *(_QWORD *)(v8 + 72) = a4;
  *(_QWORD *)(v8 + 80) = a5;
  *(_QWORD *)(v8 + 64) = a1;
  return swift_task_switch(sub_10000F360, 0, 0);
}

uint64_t sub_10000F360()
{
  uint64_t v0;
  char v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  __int128 v10;

  v1 = *(_BYTE *)(v0 + 104);
  v2 = *(void **)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD **)(v0 + 64);
  v5 = swift_allocObject(&unk_10001D4B0, 48, 7);
  *(_QWORD *)(v5 + 16) = v3;
  *(_BYTE *)(v5 + 24) = v1;
  v10 = *(_OWORD *)(v0 + 88);
  *(_OWORD *)(v5 + 32) = v10;
  *(_QWORD *)(v0 + 48) = sub_100010D9C;
  *(_QWORD *)(v0 + 56) = v5;
  *(_QWORD *)(v0 + 16) = _NSConcreteStackBlock;
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_100010024;
  *(_QWORD *)(v0 + 40) = &unk_10001D4C8;
  v6 = _Block_copy((const void *)(v0 + 16));
  v7 = *(_QWORD *)(v0 + 56);
  swift_retain(v3);
  swift_retain(v10);
  swift_release(v7);
  v8 = objc_msgSend(v2, "startLPEMConfigSession:", v6);
  _Block_release(v6);
  *v4 = v8;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000F45C(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;

  v12 = sub_100006044(&qword_100021490);
  __chkstk_darwin(v12);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_100020D48 != -1)
      swift_once(&qword_100020D48, sub_10000D8A0);
    v15 = type metadata accessor for Logger(0);
    sub_100005BF0(v15, (uint64_t)qword_100021B80);
    v16 = swift_errorRetain(a2);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v19 = 138543362;
      v21 = _convertErrorToNSError(_:)(a2);
      v32 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v19 + 4, v19 + 12);
      *v20 = v21;
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Error starting LPEM configuration session: %{public}@", v19, 0xCu);
      v22 = sub_100006044(&qword_100020DE8);
      swift_arrayDestroy(v20, 1, v22);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v19, -1, -1);
    }
    else
    {
      swift_errorRelease(a2);
    }

    v32 = a2;
    OnceCheckedContinuation.resume(throwing:)(&v32);
    swift_errorRelease(a2);
  }
  else if (a1)
  {
    v23 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 1, 1, v23);
    v24 = swift_allocObject(&unk_10001D500, 72, 7);
    *(_QWORD *)(v24 + 16) = 0;
    *(_QWORD *)(v24 + 24) = 0;
    *(_BYTE *)(v24 + 32) = a4 & 1;
    *(_QWORD *)(v24 + 40) = a5;
    *(_QWORD *)(v24 + 48) = a1;
    *(_QWORD *)(v24 + 56) = a3;
    *(_QWORD *)(v24 + 64) = a6;
    v25 = a1;
    swift_retain(a5);
    swift_retain(a3);
    v26 = sub_10000AE30((uint64_t)v14, (uint64_t)&unk_1000216A8, v24);
    swift_release(v26);
  }
  else
  {
    if (qword_100020D48 != -1)
      swift_once(&qword_100020D48, sub_10000D8A0);
    v27 = type metadata accessor for Logger(0);
    v28 = sub_100005BF0(v27, (uint64_t)qword_100021B80);
    v31 = Logger.logObject.getter(v28);
    v29 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v31, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v29, "startLPEMConfigSession returned a nil session!", v30, 2u);
      swift_slowDealloc(v30, -1, -1);
    }

  }
}

uint64_t sub_10000F7A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 + 192) = a6;
  *(_QWORD *)(v7 + 200) = a7;
  *(_QWORD *)(v7 + 184) = a5;
  *(_BYTE *)(v7 + 216) = a4;
  return swift_task_switch(sub_10000F810, 0, 0);
}

uint64_t sub_10000F810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned int v41;
  id v42;
  uint64_t v44;

  v1 = v0 + 144;
  if (*(_BYTE *)(v0 + 216) != 1)
  {
    if (qword_100020D48 != -1)
      swift_once(&qword_100020D48, sub_10000D8A0);
    v16 = *(_QWORD *)(v0 + 184);
    v17 = type metadata accessor for Logger(0);
    sub_100005BF0(v17, (uint64_t)qword_100021B80);
    v18 = swift_retain_n(v16, 2);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.default.getter();
    v21 = os_log_type_enabled(v19, v20);
    v22 = *(_QWORD *)(v0 + 184);
    if (v21)
    {
      v23 = (uint8_t *)swift_slowAlloc(12, -1);
      v24 = swift_slowAlloc(32, -1);
      v44 = v24;
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)(v0 + 144) = v22;
      v25 = type metadata accessor for LocalBeaconing(0);
      v26 = sub_1000066F0(&qword_100021638, type metadata accessor for LocalBeaconing, (uint64_t)&unk_1000170D8);
      v27 = v25;
      v1 = v0 + 144;
      v28 = dispatch thunk of CustomStringConvertible.description.getter(v27, v26);
      v30 = v29;
      *(_QWORD *)(v0 + 144) = sub_1000101F8(v28, v29, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v23 + 4, v23 + 12);
      swift_release_n(v22, 2);
      swift_bridgeObjectRelease(v30);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s: Disabling NFHeadlessModeFeatureFindMy", v23, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);

    }
    else
    {

      swift_release_n(v22, 2);
    }
    v40 = *(void **)(v0 + 192);
    *(_QWORD *)(v0 + 144) = 0;
    v41 = objc_msgSend(v40, "disableLPEMFeature:error:", 4, v1);
    v33 = *(void **)(v0 + 144);
    if (!v41)
      goto LABEL_12;
LABEL_15:
    v36 = v0 + 80;
    v37 = *(void **)(v0 + 192);
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_10000FCEC;
    v42 = v33;
    *(_QWORD *)(v0 + 176) = swift_continuation_init(v0 + 80, 0);
    *(_QWORD *)(v0 + 144) = _NSConcreteStackBlock;
    *(_QWORD *)(v0 + 152) = 0x40000000;
    v39 = &unk_10001D530;
    goto LABEL_16;
  }
  if (qword_100020D48 != -1)
    swift_once(&qword_100020D48, sub_10000D8A0);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = type metadata accessor for Logger(0);
  sub_100005BF0(v3, (uint64_t)qword_100021B80);
  v4 = swift_retain_n(v2, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 184);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v44 = v10;
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v0 + 144) = v8;
    v11 = type metadata accessor for LocalBeaconing(0);
    v12 = sub_1000066F0(&qword_100021638, type metadata accessor for LocalBeaconing, (uint64_t)&unk_1000170D8);
    v13 = dispatch thunk of CustomStringConvertible.description.getter(v11, v12);
    v15 = v14;
    *(_QWORD *)(v0 + 144) = sub_1000101F8(v13, v14, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v9 + 4, v9 + 12);
    swift_release_n(v8, 2);
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s: Enabling NFHeadlessModeFeatureFindMy", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    swift_release_n(v8, 2);
  }
  v31 = *(void **)(v0 + 192);
  *(_QWORD *)(v0 + 144) = 0;
  v32 = objc_msgSend(v31, "enableLPEMFeature:error:", 4, v0 + 144);
  v33 = *(void **)(v0 + 144);
  if ((v32 & 1) != 0)
    goto LABEL_15;
LABEL_12:
  v34 = v33;
  v35 = _convertNSErrorToError(_:)(v33);

  v36 = v0 + 16;
  *(_QWORD *)(v0 + 208) = v35;
  v37 = *(void **)(v0 + 192);
  swift_willThrow(v38);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_10000FDC0;
  *(_QWORD *)(v0 + 176) = swift_continuation_init(v0 + 16, 0);
  *(_QWORD *)(v0 + 144) = _NSConcreteStackBlock;
  *(_QWORD *)(v0 + 152) = 0x40000000;
  v39 = &unk_10001D518;
LABEL_16:
  *(_QWORD *)(v0 + 160) = sub_10001001C;
  *(_QWORD *)(v0 + 168) = v39;
  objc_msgSend(v37, "endSessionWithCompletion:", v1);
  return swift_continuation_await(v36);
}

uint64_t sub_10000FCEC()
{
  return swift_task_switch(sub_10000FD64, 0, 0);
}

uint64_t sub_10000FD64()
{
  uint64_t v0;

  OnceCheckedContinuation.resume<>()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000FDC0()
{
  return swift_task_switch(sub_10000FE38, 0, 0);
}

uint64_t sub_10000FE38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  v1 = v0 + 144;
  if (qword_100020D48 != -1)
    swift_once(&qword_100020D48, sub_10000D8A0);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = type metadata accessor for Logger(0);
  sub_100005BF0(v3, (uint64_t)qword_100021B80);
  v4 = swift_errorRetain(v2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 208);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v9 = 138543362;
    v11 = _convertErrorToNSError(_:)(v8);
    *(_QWORD *)(v0 + 144) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 144, v0 + 152, v9 + 4, v9 + 12);
    *v10 = v11;
    swift_errorRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "LPEM error: %{public}@", v9, 0xCu);
    v12 = sub_100006044(&qword_100020DE8);
    swift_arrayDestroy(v10, 1, v12);
    v13 = v10;
    v1 = v0 + 144;
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 208));
  }
  v14 = *(_QWORD *)(v0 + 208);

  *(_QWORD *)(v0 + 144) = v14;
  OnceCheckedContinuation.resume(throwing:)(v1);
  swift_errorRelease(v14);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001001C(uint64_t a1)
{
  return swift_continuation_resume(*(_QWORD *)(a1 + 32));
}

void sub_100010024(uint64_t a1, void *a2, void *a3)
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

void sub_100010098(uint64_t a1, void *a2)
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

uint64_t sub_1000100EC()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021B98);
  sub_100005BF0(v0, (uint64_t)qword_100021B98);
  return Logger.init(subsystem:category:)(0xD000000000000021, 0x8000000100017470, 0x6165426C61636F4CLL, 0xEE00676E696E6F63);
}

uint64_t sub_10001016C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006044((uint64_t *)&unk_1000214F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000101B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LocalBeaconKeyInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000101F8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000102C8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100010E60((uint64_t)v12, *a3);
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
      sub_100010E60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008904(v12);
  return v7;
}

uint64_t sub_1000102C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100010480(a5, a6);
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

uint64_t sub_100010480(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100010514(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000106EC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000106EC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100010514(uint64_t a1, unint64_t a2)
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
      v5 = sub_100010688(v4, 0);
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

_QWORD *sub_100010688(uint64_t a1, uint64_t a2)
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
  v4 = sub_100006044(&qword_1000216B0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000106EC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100006044(&qword_1000216B0);
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

uint64_t sub_100010838(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100010870(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100010854(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100010A50(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100010870(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
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
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100006044(&qword_1000216D0);
  v11 = *(_QWORD *)(type metadata accessor for GeneratedTokens(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for GeneratedTokens(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21, v22, v8, v18);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100010A50(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v17;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100006044(&qword_1000216D8);
    v11 = (_QWORD *)swift_allocObject(v10, 24 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v13 = (unint64_t)(v11 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= v14 + 24 * v8)
      memmove(v11 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v14 >= v13 + 24 * v8 || v13 >= v14 + 24 * v8)
  {
    v17 = sub_100006044((uint64_t *)&unk_1000216E0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v17);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100010BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100006044((uint64_t *)&unk_1000214F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

_QWORD *sub_100010C3C(_QWORD *a1)
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

void sub_100010C78(uint64_t a1)
{
  uint64_t v1;

  sub_10000F054(a1, *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_100010C88(void *a1)
{
  uint64_t v1;

  return sub_10000F140(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_100010C98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100010CA8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100010CB0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100010CEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_BYTE *)(v1 + 48);
  v5 = swift_task_alloc(dword_100021694);
  v6 = *(_OWORD *)(v1 + 32);
  v7 = *(_OWORD *)(v1 + 56);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_10000AB38;
  *(_OWORD *)(v5 + 88) = v7;
  *(_BYTE *)(v5 + 104) = v4;
  *(_OWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 64) = a1;
  return swift_task_switch(sub_10000F360, 0, 0);
}

uint64_t sub_100010D70()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 48, 7);
}

void sub_100010D9C(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000F45C(a1, a2, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_100010DAC()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));

  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100010DE8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_BYTE *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = swift_task_alloc(dword_1000216A4);
  v5 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_10000AD78;
  *(_QWORD *)(v4 + 200) = v3;
  *(_OWORD *)(v4 + 184) = v5;
  *(_BYTE *)(v4 + 216) = v2;
  return swift_task_switch(sub_10000F810, 0, 0);
}

uint64_t sub_100010E60(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_100010E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v39;

  v32 = a1;
  v3 = sub_100006044(&qword_1000216B8);
  __chkstk_darwin(v3);
  v37 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SharedSecretKey(0);
  v34 = *(_QWORD *)(v5 - 8);
  v35 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = type metadata accessor for PublicKey(0);
  v8 = *(_QWORD **)(v33 - 8);
  __chkstk_darwin(v33);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100006044(&qword_1000216C0);
  __chkstk_darwin(v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TokenSequence(0);
  v30 = *(_QWORD *)(v14 - 8);
  v31 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for Date(0);
  v36 = *(_QWORD *)(v38 - 8);
  v17 = __chkstk_darwin(v38);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static ReferenceClock.now.getter(v17);
  v20 = (int *)type metadata accessor for LocalBeaconKeyInfo(0);
  v21 = bucket(beaconIdentifier:baseTime:date:bucketSizeInMinutes:)(a2 + v20[5], a2 + v20[6], v19, 15);
  v22 = type metadata accessor for PrivateKey(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v13, 1, 1, v22);
  ((void (*)(char *, uint64_t, uint64_t))v8[2])(v10, a2 + v20[7], v33);
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v7, a2 + v20[8], v35);
  v23 = type metadata accessor for KeyGenerationHint(0);
  v24 = v37;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v37, 1, 1, v23);
  v25 = v39;
  TokenSequence.init(privateKey:publicKey:sharedKey:startIndex:hint:)(v13, v10, v7, v21, v24);
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v38);
  }
  else
  {
    v26 = sub_10000E558(0, 5, (uint64_t)v16);
    __chkstk_darwin(v26);
    v27 = v32;
    *(&v29 - 2) = a2;
    *(&v29 - 1) = v27;
    v8 = sub_10000E764((_QWORD *(*)(uint64_t *__return_ptr, uint64_t))sub_100011520, (uint64_t)(&v29 - 4), v26);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v38);
    swift_bridgeObjectRelease(v26);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v31);
  }
  return v8;
}

unint64_t *sub_1000111C4()
{
  uint64_t v0;
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  double v30;
  id v31;
  Class isa;
  Class v33;
  id v34;
  void (*v35)(char *, uint64_t);
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t *v51;

  v1 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (&getBeacon(device:count:swizzler:))
  {
    sub_100010854(0, 5, 0);
    v2 = v0;
    v3 = 0;
    v4 = (unint64_t *)&_swiftEmptyArrayStorage;
    do
    {
      v5 = getBeacon(device:count:swizzler:)(0, v3, 0, 0xF000000000000000);
      if (v2)
      {
        swift_release(v4);
        return v1;
      }
      v8 = v5;
      v9 = v6;
      v10 = v7;
      v51 = v4;
      v12 = v4[2];
      v11 = v4[3];
      v13 = v4;
      if (v12 >= v11 >> 1)
      {
        v43 = 0;
        v5 = sub_100010854(v11 > 1, v12 + 1, 1);
        v2 = 0;
        v13 = v51;
      }
      ++v3;
      v13[2] = v12 + 1;
      v14 = &v13[3 * v12];
      v14[4] = v8;
      v14[5] = v9;
      v14[6] = v10;
      v4 = v13;
    }
    while (v3 != 5);
    v15 = keyDuration.getter(v5);
    v16 = v4[2];
    if (v16)
    {
      v17 = v15;
      v41 = (uint64_t)&v41;
      v43 = v2;
      v51 = (unint64_t *)&_swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v16);
      v18 = (double)v17;
      v19 = type metadata accessor for Date(0);
      v49 = *(_QWORD *)(v19 - 8);
      v50 = v19;
      v44 = *(_QWORD *)(v49 + 64);
      v42 = v4;
      v20 = (char *)(v4 + 6);
      do
      {
        v47 = &v41;
        v48 = v16;
        v21 = *((_QWORD *)v20 - 2);
        v22 = *((_QWORD *)v20 - 1);
        v20 += 24;
        v23 = (char *)&v41 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
        v24 = (double)COERCE_UNSIGNED_INT64(__chkstk_darwin(v19));
        v25 = sub_100008858(v21, v22);
        Date.init(timeIntervalSince1970:)(v25, v24);
        v45 = type metadata accessor for DateInterval(0);
        v46 = &v41;
        v26 = *(_QWORD *)(v45 - 8);
        __chkstk_darwin(v45);
        v28 = (char *)&v41 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
        v30 = __chkstk_darwin(v29);
        (*(void (**)(char *, char *, uint64_t, double))(v49 + 16))(v23, v23, v50, v30);
        DateInterval.init(start:duration:)(v23, v18);
        v31 = objc_allocWithZone((Class)SPBeaconingKey);
        sub_100008858(v21, v22);
        isa = DateInterval._bridgeToObjectiveC()().super.isa;
        v33 = Data._bridgeToObjectiveC()().super.isa;
        v34 = objc_msgSend(v31, "initWithDateInterval:key:", isa, v33);

        sub_100008814(v21, v22);
        v35 = *(void (**)(char *, uint64_t))(v26 + 8);
        v36 = v48;
        v35(v28, v45);
        (*(void (**)(char *, uint64_t))(v49 + 8))(v23, v50);
        v37 = sub_100008814(v21, v22);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v37);
        v38 = v51[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v38);
        v39 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v38, v34);
        v19 = specialized ContiguousArray._endMutation()(v39);
        v16 = v36 - 1;
      }
      while (v16);
      v1 = v51;
      swift_release(v42);
    }
    else
    {
      swift_release(v4);
      return (unint64_t *)&_swiftEmptyArrayStorage;
    }
  }
  return v1;
}

uint64_t sub_100011520@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_10000E86C(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_100011544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021BB8);
  v1 = sub_100005BF0(v0, (uint64_t)qword_100021BB8);
  if (qword_100020D60 != -1)
    swift_once(&qword_100020D60, sub_100013930);
  v2 = sub_100005BF0(v0, (uint64_t)qword_100021BD0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t type metadata accessor for LocalBeaconingXPCService()
{
  return objc_opt_self(_TtC16findmybeaconingd24LocalBeaconingXPCService);
}

uint64_t sub_1000115F4(uint64_t a1)
{
  const char *v2;

  v2 = "\b";
  return swift_initClassMetadata2(a1, 0, 1, &v2, a1 + 96);
}

uint64_t sub_100011634()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1[4] = v0;
  v2 = type metadata accessor for XPCServiceDescription(0);
  v1[5] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[6] = v3;
  v1[7] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MachServiceName(0);
  v1[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[9] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1[10] = swift_task_alloc(v6);
  v1[11] = swift_task_alloc(v6);
  return swift_task_switch(sub_1000116CC, v0, 0);
}

uint64_t sub_1000116CC()
{
  objc_super *v0;
  id receiver;
  Class super_class;
  id v3;
  Class v4;
  id v5;
  id v6;
  objc_class *v7;
  char *v8;
  uint64_t v9;
  objc_class *v10;
  objc_super **v11;
  _QWORD v13[5];

  receiver = v0[5].receiver;
  super_class = v0[5].super_class;
  v3 = v0[4].receiver;
  v4 = v0[4].super_class;
  v5 = v0[2].receiver;
  MachServiceName.init(_:)(0xD00000000000001FLL, 0x8000000100017CB0);
  v6 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL___SPLocalBeaconManagerXPCProtocol);
  v0[6].receiver = v6;
  v7 = (objc_class *)sub_100006044(&qword_1000218D8);
  v8 = (char *)objc_allocWithZone(v7);
  v9 = swift_weakInit(&v8[qword_1000217A0], 0);
  swift_weakAssign(v9, v5);
  v0[1].receiver = v8;
  v0[1].super_class = v7;
  v10 = (objc_class *)objc_msgSendSuper2(v0 + 1, "init");
  v0[6].super_class = v10;
  (*((void (**)(id, Class, id))v4 + 2))(receiver, super_class, v3);
  v13[3] = &type metadata for LocalBeaconingXPCService.Entitlement;
  v13[4] = sub_1000139B0();
  XPCServiceDescription.init(name:exportedObject:exportedInterface:options:requiredEntitlement:shouldAccept:)(receiver, v10, v6, 4096, v13, 0, 0);
  v11 = (objc_super **)swift_task_alloc(async function pointer to daemon.getter[1]);
  v0[7].receiver = v11;
  *v11 = v0;
  v11[1] = (objc_super *)sub_10000B378;
  return daemon.getter();
}

uint64_t sub_100011844(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.initialLaunchProcessing()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for LocalBeaconingXPCService();
  *v4 = v2;
  v4[1] = sub_10000AD78;
  return ActorServiceProtocol.initialLaunchProcessing()(v5, a2);
}

uint64_t sub_1000118A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.migrate(from:to:)[1]);
  *(_QWORD *)(v4 + 16) = v8;
  v9 = type metadata accessor for LocalBeaconingXPCService();
  *v8 = v4;
  v8[1] = sub_10000AD78;
  return ActorServiceProtocol.migrate(from:to:)(a1, a2, v9, a4);
}

uint64_t sub_100011920(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.firstLaunchSinceReboot()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for LocalBeaconingXPCService();
  *v4 = v2;
  v4[1] = sub_10000AD78;
  return ActorServiceProtocol.firstLaunchSinceReboot()(v5, a2);
}

uint64_t sub_100011980()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000218D4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000AD78;
  return sub_100011634();
}

uint64_t sub_1000119C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceProtocol.run()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = type metadata accessor for LocalBeaconingXPCService();
  *v4 = v2;
  v4[1] = sub_10000AB38;
  return ActorServiceProtocol.run()(v5, a2);
}

uint64_t sub_100011A24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for LocalBeaconingXPCService();
  v2 = sub_10000AD38(&qword_1000218F0, v1, (uint64_t (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService, (uint64_t)&unk_100017260);
  return ActorServiceProtocol.description.getter(v0, v2);
}

Swift::Int sub_100011A70()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  String.hash(into:)(v1, 0xD00000000000002BLL, 0x8000000100017440);
  return Hasher._finalize()();
}

uint64_t sub_100011AC4(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD00000000000002BLL, 0x8000000100017440);
}

Swift::Int sub_100011AE0()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  String.hash(into:)(v1, 0xD00000000000002BLL, 0x8000000100017440);
  return Hasher._finalize()();
}

uint64_t sub_100011B30@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CC18, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100011B80(_QWORD *a1@<X8>)
{
  *a1 = 0xD00000000000002BLL;
  a1[1] = 0x8000000100017440;
}

uint64_t sub_100011BA0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 56) = v0;
  v2 = (_QWORD *)swift_task_alloc(async function pointer to daemon.getter[1]);
  *(_QWORD *)(v1 + 64) = v2;
  *v2 = v1;
  v2[1] = sub_100011BEC;
  return daemon.getter();
}

uint64_t sub_100011BEC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(*v1 + 72) = a1;
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceDaemon.getService<A>()[1]);
  *(_QWORD *)(v3 + 80) = v6;
  v7 = type metadata accessor for Daemon(0);
  v8 = type metadata accessor for LocalBeaconing(0);
  v9 = sub_10000AD38(&qword_100020DF0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  v10 = sub_10000AD38((unint64_t *)&unk_100020E00, 255, type metadata accessor for LocalBeaconing, (uint64_t)&unk_100017100);
  *v6 = v5;
  v6[1] = sub_100011CDC;
  return ActorServiceDaemon.getService<A>()(v7, v8, v9, v10);
}

uint64_t sub_100011CDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v3[11] = a1;
  v3[12] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v5 = v3[7];
    v6 = sub_1000120C4;
  }
  else
  {
    v7 = v3[7];
    swift_release(v3[9]);
    v6 = sub_100011D58;
    v5 = v7;
  }
  return swift_task_switch(v6, v5, 0);
}

uint64_t sub_100011D58()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  type metadata accessor for Transaction(0);
  v1 = static Transaction.currentNSXPCConnection.getter();
  v0[13] = v1;
  if (v1)
  {
    v2 = NSXPCConnection.shortDescription.getter();
  }
  else
  {
    v3 = 0xE90000000000003ELL;
    v2 = 0x4E574F4E4B4E553CLL;
  }
  v0[14] = v2;
  v0[15] = v3;
  return swift_task_switch(sub_100011DCC, v0[11], 0);
}

uint64_t sub_100011DCC()
{
  _QWORD *v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (&getBeacon(device:count:swizzler:))
  {
    v1 = 1;
  }
  else
  {
    v2 = v0[11];
    v3 = sub_100006044((uint64_t *)&unk_1000214F0);
    v4 = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
    v5 = v2 + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
    swift_beginAccess(v5, v0 + 2, 0, 0);
    sub_100013E54(v5, v4, (uint64_t *)&unk_1000214F0);
    v6 = type metadata accessor for LocalBeaconKeyInfo(0);
    v1 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v4, 1, v6) != 1;
    sub_10000F014(v4);
    swift_task_dealloc(v4);
  }
  v0[16] = v1;
  return swift_task_switch(sub_100011EBC, v0[7], 0);
}

uint64_t sub_100011EBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  if (qword_100020D58 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v1 = *(_QWORD *)(v0 + 120);
  v2 = type metadata accessor for Logger(0);
  sub_100005BF0(v2, (uint64_t)qword_100021BB8);
  v3 = swift_bridgeObjectRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 120);
    v7 = *(_QWORD *)(v0 + 112);
    v15 = *(void **)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 128);
    v14 = *(_QWORD *)(v0 + 88);
    v8 = swift_slowAlloc(22, -1);
    v9 = swift_slowAlloc(32, -1);
    v16 = v9;
    *(_DWORD *)v8 = 136446466;
    swift_bridgeObjectRetain(v6);
    *(_QWORD *)(v0 + 40) = sub_1000101F8(v7, v6, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v8 + 4, v8 + 12);
    swift_bridgeObjectRelease_n(v6, 3);
    *(_WORD *)(v8 + 12) = 2048;
    *(_QWORD *)(v0 + 48) = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v8 + 14, v8 + 22);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s: beaconingState() -> %ld", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
    swift_release(v14);

  }
  else
  {
    v10 = *(void **)(v0 + 104);
    v11 = *(_QWORD *)(v0 + 88);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 120), 2);
    swift_release(v11);

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 128));
}

uint64_t sub_1000120C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 72));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000120F8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2[9] = a1;
  v2[10] = v1;
  v3 = type metadata accessor for DateInterval(0);
  v2[11] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[12] = v4;
  v2[13] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006044((uint64_t *)&unk_1000214F0);
  v2[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalBeaconKeyInfo(0);
  v2[15] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[16] = v7;
  v2[17] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (_QWORD *)swift_task_alloc(async function pointer to daemon.getter[1]);
  v2[18] = v8;
  *v8 = v2;
  v8[1] = sub_1000121B8;
  return daemon.getter();
}

uint64_t sub_1000121B8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 144);
  v5 = *v1;
  *(_QWORD *)(*v1 + 152) = a1;
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to ActorServiceDaemon.getService<A>()[1]);
  *(_QWORD *)(v3 + 160) = v6;
  v7 = type metadata accessor for Daemon(0);
  v8 = type metadata accessor for LocalBeaconing(0);
  v9 = sub_10000AD38(&qword_100020DF0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for Daemon, (uint64_t)&protocol conformance descriptor for Daemon);
  v10 = sub_10000AD38((unint64_t *)&unk_100020E00, 255, type metadata accessor for LocalBeaconing, (uint64_t)&unk_100017100);
  *v6 = v5;
  v6[1] = sub_1000122A8;
  return ActorServiceDaemon.getService<A>()(v7, v8, v9, v10);
}

uint64_t sub_1000122A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v3 = *(_QWORD **)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 160);
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v3[21] = a1;
  v3[22] = v1;
  swift_task_dealloc(v4);
  if (v1)
  {
    v6 = sub_100012A80;
  }
  else
  {
    swift_release(v3[19]);
    v6 = sub_100012328;
  }
  return swift_task_switch(v6, v5, 0);
}

uint64_t sub_100012328()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  type metadata accessor for Transaction(0);
  v1 = static Transaction.currentNSXPCConnection.getter();
  v0[23] = v1;
  if (v1)
  {
    v2 = NSXPCConnection.shortDescription.getter();
  }
  else
  {
    v3 = 0xE90000000000003ELL;
    v2 = 0x4E574F4E4B4E553CLL;
  }
  v0[24] = v2;
  v0[25] = v3;
  return swift_task_switch(sub_10001239C, v0[21], 0);
}

uint64_t sub_10001239C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();
  uint64_t v12;

  v1 = v0[15];
  v2 = v0[16];
  v3 = v0[14];
  v4 = v0[21] + OBJC_IVAR____TtC16findmybeaconingd14LocalBeaconing_beaconInfo;
  swift_beginAccess(v4, v0 + 2, 0, 0);
  sub_100013E54(v4, v3, (uint64_t *)&unk_1000214F0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v5 = v0[22];
    sub_10000F014(v0[14]);
    v6 = sub_1000111C4();
    if (!v5)
    {
      v7 = v6;
LABEL_6:
      v0[27] = v7;
      v12 = v0[10];
      v11 = sub_100012514;
      return swift_task_switch(v11, v12, 0);
    }
  }
  else
  {
    v5 = v0[22];
    v8 = v0[17];
    v9 = v0[9];
    sub_1000101B4(v0[14], v8);
    v7 = sub_100010E9C(v9, v8);
    sub_100008968(v0[17]);
    if (!v5)
      goto LABEL_6;
  }
  v0[26] = v5;
  v10 = v0[10];
  swift_bridgeObjectRelease(v0[25]);
  v11 = sub_1000124B4;
  v12 = v10;
  return swift_task_switch(v11, v12, 0);
}

uint64_t sub_1000124B4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 184);
  swift_release(*(_QWORD *)(v0 + 168));

  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  swift_task_dealloc(*(_QWORD *)(v0 + 136));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012514()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  if (qword_100020D58 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v1 = *(_QWORD *)(v0 + 200);
  v2 = type metadata accessor for Logger(0);
  sub_100005BF0(v2, (uint64_t)qword_100021BB8);
  v3 = swift_bridgeObjectRetain_n(v1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 200);
  v57 = v0;
  if (v6)
  {
    v59 = v0 + 56;
    v8 = v0 + 64;
    v10 = v0 + 72;
    v9 = *(_QWORD *)(v0 + 72);
    v11 = *(_QWORD *)(v10 + 120);
    v12 = swift_slowAlloc(22, -1);
    v13 = swift_slowAlloc(32, -1);
    v61 = v13;
    *(_DWORD *)v12 = 136446466;
    swift_bridgeObjectRetain(v7);
    *(_QWORD *)(v10 - 16) = sub_1000101F8(v11, v7, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v59, v8, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(v7, 3);
    *(_WORD *)(v12 + 12) = 2048;
    *(_QWORD *)(v10 - 8) = v9;
    v0 = v57;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v8, v10, v12 + 14, v12 + 22);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%{public}s: beaconingKeys(keyType: %ld) -> ", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n(v7, 2);
  }

  v14 = *(_QWORD *)(v0 + 216);
  if (!((unint64_t)v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(*(_QWORD *)(v0 + 216));
    if (v15)
      goto LABEL_8;
LABEL_21:
    v47 = *(_QWORD *)(v0 + 216);
    v48 = *(_QWORD *)(v0 + 200);
    v49 = *(void **)(v0 + 184);
    v50 = *(_QWORD *)(v0 + 136);
    v52 = *(_QWORD *)(v0 + 104);
    v51 = *(_QWORD *)(v0 + 112);
    swift_release(*(_QWORD *)(v0 + 168));
    swift_bridgeObjectRelease(v47);
    swift_bridgeObjectRelease(v48);

    swift_task_dealloc(v50);
    swift_task_dealloc(v51);
    swift_task_dealloc(v52);
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 216));
  }
  if (v14 < 0)
    v46 = *(_QWORD *)(v0 + 216);
  else
    v46 = v14 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 216));
  result = _CocoaArrayWrapper.endIndex.getter(v46);
  v15 = result;
  if (!result)
    goto LABEL_21;
LABEL_8:
  if (v15 >= 1)
  {
    v17 = 0;
    v55 = *(_QWORD *)(v0 + 96);
    v18 = v14 & 0xC000000000000001;
    v53 = *(_QWORD *)(v0 + 216) + 32;
    v56 = v15;
    v54 = v14 & 0xC000000000000001;
    do
    {
      if (v18)
        v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, *(_QWORD *)(v0 + 216));
      else
        v19 = *(id *)(v53 + 8 * v17);
      v20 = *(_QWORD *)(v0 + 200);
      v21 = v19;
      swift_bridgeObjectRetain_n(v20, 2);
      v22 = v21;
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.default.getter();
      v25 = os_log_type_enabled(v23, v24);
      v26 = *(_QWORD *)(v0 + 200);
      if (v25)
      {
        v27 = *(_QWORD *)(v0 + 192);
        v28 = *(_QWORD *)(v0 + 104);
        v58 = *(_QWORD *)(v0 + 88);
        v29 = swift_slowAlloc(32, -1);
        v60 = swift_slowAlloc(96, -1);
        v61 = v60;
        *(_DWORD *)v29 = 136446722;
        swift_bridgeObjectRetain(v26);
        *(_QWORD *)(v29 + 4) = sub_1000101F8(v27, v26, &v61);
        swift_bridgeObjectRelease_n(v26, 3);
        *(_WORD *)(v29 + 12) = 2080;
        v30 = objc_msgSend(v22, "key");
        v31 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v30);
        v33 = v32;

        *(_QWORD *)(v0 + 40) = v31;
        *(_QWORD *)(v0 + 48) = v33;
        v34 = sub_10000A4B0();
        v35 = DataProtocol.hexString.getter(&type metadata for Data, v34);
        v37 = v36;
        v38 = v31;
        v15 = v56;
        sub_100008814(v38, v33);
        *(_QWORD *)(v29 + 14) = sub_1000101F8(v35, v37, &v61);
        swift_bridgeObjectRelease(v37);

        *(_WORD *)(v29 + 22) = 2082;
        v39 = objc_msgSend(v22, "dateInterval");
        static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();

        v40 = sub_10000AD38(&qword_100021900, 255, (uint64_t (*)(uint64_t))&type metadata accessor for DateInterval, (uint64_t)&protocol conformance descriptor for DateInterval);
        v41 = dispatch thunk of CustomStringConvertible.description.getter(v58, v40);
        v43 = v42;
        (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v28, v58);
        *(_QWORD *)(v29 + 24) = sub_1000101F8(v41, v43, &v61);
        v44 = v43;
        v0 = v57;
        swift_bridgeObjectRelease(v44);

        _os_log_impl((void *)&_mh_execute_header, v23, v24, "%{public}s:   %s -- %{public}s", (uint8_t *)v29, 0x20u);
        swift_arrayDestroy(v60, 3, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v60, -1, -1);
        v45 = v29;
        v18 = v54;
        swift_slowDealloc(v45, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v26, 2);
      }
      ++v17;
    }
    while (v15 != v17);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_100012A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 152));
  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  swift_task_dealloc(*(_QWORD *)(v0 + 136));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012AD8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)swift_task_alloc(dword_10002190C);
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_10001418C;
  v2[7] = v0;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to daemon.getter[1]);
  v2[8] = v3;
  *v3 = v2;
  v3[1] = sub_100011BEC;
  return daemon.getter();
}

uint64_t sub_100012B44(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_1000218FC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100012B90;
  return sub_1000120F8(a1);
}

uint64_t sub_100012B90(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 16);
  v5 = *v2;
  v6 = swift_task_dealloc(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_100012BE4(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD *v5;
  id v6;

  type metadata accessor for Transaction(0);
  v5 = (_QWORD *)swift_allocObject(&unk_10001D748, 40, 7);
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  v6 = v2;
  swift_retain(a2);
  static Transaction.asyncTask(name:block:)("beaconingState(completion:)", 27, 2, &unk_100021948, v5);
  return swift_release(v5);
}

uint64_t sub_100012C74(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = swift_isaMask;
  v3[5] = *a1;
  v3[6] = v4;
  return swift_task_switch(sub_100012CA4, 0, 0);
}

uint64_t sub_100012CA4()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 16) + qword_1000217A0);
  *(_QWORD *)(v0 + 56) = Strong;
  if (Strong)
  {
    v3 = *(_QWORD *)((*(_QWORD *)(v0 + 40) & *(_QWORD *)(v0 + 48)) + 0x50);
    v2 = *(_QWORD *)((*(_QWORD *)(v0 + 40) & *(_QWORD *)(v0 + 48)) + 0x58);
    v4 = *(int **)(v2 + 8);
    v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    v5 = (_QWORD *)swift_task_alloc(v4[1]);
    *(_QWORD *)(v0 + 64) = v5;
    *v5 = v0;
    v5[1] = sub_100012D58;
    return v7(v3, v2);
  }
  else
  {
    (*(void (**)(uint64_t))(v0 + 24))(-1);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100012D58(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 64);
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100012E08;
  }
  else
  {
    swift_unknownObjectRelease(*(_QWORD *)(v4 + 56));
    *(_QWORD *)(v4 + 80) = a1;
    v6 = sub_100012DD4;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_100012DD4()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 24))(*(_QWORD *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012E08()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(void (**)(uint64_t))(v0 + 24);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 56));
  v2(-1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012E58(void *a1, int a2, void *aBlock)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = _Block_copy(aBlock);
  v5 = swift_allocObject(&unk_10001D720, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = a1;
  sub_100012BE4((uint64_t)sub_100013F9C, v5);

  return swift_release(v5);
}

uint64_t sub_100012EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _QWORD *v7;
  id v8;

  type metadata accessor for Transaction(0);
  v7 = (_QWORD *)swift_allocObject(&unk_10001D6F8, 48, 7);
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  v8 = v3;
  swift_retain(a3);
  static Transaction.asyncTask(name:block:)("beaconingKeys(keyType:withCompletion:)", 38, 2, &unk_100021930, v7);
  return swift_release(v7);
}

uint64_t sub_100012F58(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v5 = swift_isaMask;
  v4[6] = *a1;
  v4[7] = v5;
  return swift_task_switch(sub_100012F88, 0, 0);
}

uint64_t sub_100012F88()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  int *v7;

  Strong = swift_unknownObjectWeakLoadStrong(*(_QWORD *)(v0 + 16) + qword_1000217A0);
  *(_QWORD *)(v0 + 64) = Strong;
  if (Strong)
  {
    v3 = *(_QWORD *)((*(_QWORD *)(v0 + 48) & *(_QWORD *)(v0 + 56)) + 0x50);
    v2 = *(_QWORD *)((*(_QWORD *)(v0 + 48) & *(_QWORD *)(v0 + 56)) + 0x58);
    v4 = *(int **)(v2 + 16);
    v7 = (int *)((char *)v4 + *v4);
    v5 = (_QWORD *)swift_task_alloc(v4[1]);
    *(_QWORD *)(v0 + 72) = v5;
    *v5 = v0;
    v5[1] = sub_100013054;
    return ((uint64_t (*)(_QWORD, uint64_t, uint64_t))v7)(*(_QWORD *)(v0 + 24), v3, v2);
  }
  else
  {
    (*(void (**)(void *))(v0 + 32))(&_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100013054(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 72);
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = sub_100013110;
  }
  else
  {
    swift_unknownObjectRelease(*(_QWORD *)(v4 + 64));
    *(_QWORD *)(v4 + 88) = a1;
    v6 = sub_1000130D0;
  }
  return swift_task_switch(v6, 0, 0);
}

uint64_t sub_1000130D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  (*(void (**)(uint64_t))(v0 + 32))(v1);
  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013110()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void *);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(void (**)(void *))(v0 + 32);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 64));
  v2(&_swiftEmptyArrayStorage);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013164(void *a1, int a2, uint64_t a3, void *aBlock)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = _Block_copy(aBlock);
  v7 = swift_allocObject(&unk_10001D6D0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a1;
  sub_100012EC4(a3, (uint64_t)sub_100013EA8, v7);

  return swift_release(v7);
}

void sub_1000131D8(uint64_t a1, uint64_t a2)
{
  Class isa;

  sub_100013F60();
  isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, isa);

}

uint64_t sub_10001322C(void *a1, int a2, void *aBlock)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = _Block_copy(aBlock);
  v5 = swift_allocObject(&unk_10001D6A8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = a1;
  sub_100013CD0((void (*)(_QWORD, void *))sub_100013E4C);

  return swift_release(v5);
}

void sub_1000132B8(uint64_t a1, uint64_t a2, uint64_t a3)
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

void sub_100013310(void *a1, int a2, int a3, void *aBlock)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;

  v5 = _Block_copy(aBlock);
  v6 = qword_100020D58;
  v12 = a1;
  if (v6 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v7 = type metadata accessor for Logger(0);
  v8 = sub_100005BF0(v7, (uint64_t)qword_100021BB8);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "TRACE: Trampoline offlineAdvertisingKeys:completion:", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  _Block_release(v5);
}

uint64_t sub_100013408(void *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v20;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (void (**)(_QWORD))_Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = qword_100020D58;
  v13 = a1;
  if (v12 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v14 = type metadata accessor for Logger(0);
  v15 = sub_100005BF0(v14, (uint64_t)qword_100021BB8);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "poisonBeaconIdentifier is not supported by FindMyBeaconDaemon!", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  v11[2](v11);
  _Block_release(v11);

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_100013574(void *a1, int a2, void *a3)
{
  sub_10001358C(a1, a2, a3, "isLPEMModeSupported is not supported by FindMyBeaconDaemon!");
}

void sub_100013580(void *a1, int a2, void *a3)
{
  sub_10001358C(a1, a2, a3, "userHasAcknowledgeFindMy is not supported by FindMyBeaconDaemon!");
}

void sub_10001358C(void *a1, int a2, void *aBlock, const char *a4)
{
  void (**v6)(void *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v7 = qword_100020D58;
  v13 = a1;
  if (v7 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v8 = type metadata accessor for Logger(0);
  v9 = sub_100005BF0(v8, (uint64_t)qword_100021BB8);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a4, v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  v6[2](v6, 0);
  _Block_release(v6);

}

void sub_10001369C(void *a1, int a2, int a3, void *a4)
{
  sub_1000136B4(a1, a2, a3, a4, "setUserHasAcknowledgedFindMy is not supported by FindMyBeaconDaemon!");
}

void sub_1000136A8(void *a1, int a2, int a3, void *a4)
{
  sub_1000136B4(a1, a2, a3, a4, "setSuppressLPEMBeaconing is not supported by FindMyBeaconDaemon!");
}

void sub_1000136B4(void *a1, int a2, int a3, void *aBlock, const char *a5)
{
  void (**v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;

  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = qword_100020D58;
  v14 = a1;
  if (v8 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v9 = type metadata accessor for Logger(0);
  v10 = sub_100005BF0(v9, (uint64_t)qword_100021BB8);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, a5, v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  v7[2](v7);
  _Block_release(v7);

}

void sub_1000137C0(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  v1 = qword_100020D58;
  v2 = a1;
  if (v1 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_100005BF0(v3, (uint64_t)qword_100021BB8);
  oslog = Logger.logObject.getter(v4);
  v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "bluetoothPowerStateUpdated is not supported by FindMyBeaconDaemon!", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

}

void sub_1000138A0()
{
  sub_10000CD80();
}

uint64_t sub_1000138BC(uint64_t a1)
{
  return swift_unknownObjectWeakDestroy(a1 + qword_1000217A0);
}

uint64_t type metadata accessor for LocalBeaconingXPCService.Trampoline(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000CF28(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LocalBeaconingXPCService.Trampoline);
}

uint64_t sub_1000138D8(uint64_t a1, uint64_t a2)
{
  return sub_10000AD38(&qword_100021898, a2, (uint64_t (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService, (uint64_t)&unk_100017238);
}

uint64_t sub_100013904(uint64_t a1, uint64_t a2)
{
  return sub_10000AD38(qword_1000218A0, a2, (uint64_t (*)(uint64_t))type metadata accessor for LocalBeaconingXPCService, (uint64_t)&unk_1000172C0);
}

uint64_t sub_100013930()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100006084(v0, qword_100021BD0);
  sub_100005BF0(v0, (uint64_t)qword_100021BD0);
  return Logger.init(subsystem:category:)(0xD000000000000021, 0x8000000100017470, 0xD000000000000018, 0x80000001000171A0);
}

unint64_t sub_1000139B0()
{
  unint64_t result;

  result = qword_1000218E0;
  if (!qword_1000218E0)
  {
    result = swift_getWitnessTable(&unk_100017394, &type metadata for LocalBeaconingXPCService.Entitlement);
    atomic_store(result, (unint64_t *)&qword_1000218E0);
  }
  return result;
}

unint64_t sub_1000139F4(uint64_t a1)
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
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006044(&qword_100021918);
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
    sub_100013E54(v7, (uint64_t)&v16, &qword_100021920);
    v8 = v16;
    v9 = v17;
    result = sub_100013B28(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100013E98(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_100013B28(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  String.hash(into:)(v6, a1, a2);
  v4 = Hasher._finalize()();
  return sub_100013B8C(a1, a2, v4);
}

unint64_t sub_100013B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v17;
  uint64_t v18;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    v11 = v10[1];
    if ((*v10 != a1 || v11 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      i = (i + 1) & v13;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v14 = (_QWORD *)(v9 + 16 * i);
        v15 = v14[1];
        if ((*v14 != a1 || v15 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0)
        {
          for (i = (i + 1) & v13; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v13)
          {
            v17 = (_QWORD *)(v9 + 16 * i);
            v18 = v17[1];
            if (*v17 == a1 && v18 == a2)
              break;
            if ((_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

void sub_100013CD0(void (*a1)(_QWORD, void *))
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (qword_100020D58 != -1)
    swift_once(&qword_100020D58, sub_100011544);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100005BF0(v2, (uint64_t)qword_100021BB8);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "getMacBeaconingConfig is not supported by FindMyBeaconDaemon!", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  type metadata accessor for SPBeaconManagerError(0);
  v8 = v7;
  v12 = 0;
  v9 = sub_1000139F4((uint64_t)&_swiftEmptyArrayStorage);
  v10 = sub_10000AD38(&qword_100020E90, 255, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconManagerError, (uint64_t)&unk_100016800);
  _BridgedStoredNSError.init(_:userInfo:)(&v13, &v12, v9, v8, v10);
  v11 = v13;
  a1(0, v13);

}

uint64_t sub_100013E28()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100013E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000132B8(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100013E54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100006044(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_100013E98(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_100013EA8(uint64_t a1)
{
  uint64_t v1;

  sub_1000131D8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100013EB0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100013EDC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = swift_task_alloc(dword_10002192C);
  v5 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_10000AB38;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  v6 = swift_isaMask;
  *(_QWORD *)(v4 + 48) = *v2;
  *(_QWORD *)(v4 + 56) = v6;
  return swift_task_switch(sub_100012F88, 0, 0);
}

unint64_t sub_100013F60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021938;
  if (!qword_100021938)
  {
    v1 = objc_opt_self(SPBeaconingKey);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_100021938);
  }
  return result;
}

uint64_t sub_100013F9C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_100013FAC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100013FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc(dword_100021944);
  v4 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_10000AD78;
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  v5 = swift_isaMask;
  *(_QWORD *)(v3 + 40) = *(_QWORD *)v4;
  *(_QWORD *)(v3 + 48) = v5;
  return swift_task_switch(sub_100012CA4, 0, 0);
}

uint64_t storeEnumTagSinglePayload for LocalBeaconingXPCService.Entitlement(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100014098 + 4 * byte_1000171A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000140B8 + 4 * byte_1000171A5[v4]))();
}

_BYTE *sub_100014098(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000140B8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000140C0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000140C8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000140D0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000140D8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LocalBeaconingXPCService.Entitlement()
{
  return &type metadata for LocalBeaconingXPCService.Entitlement;
}

unint64_t sub_1000140F8()
{
  unint64_t result;

  result = qword_100021950;
  if (!qword_100021950)
  {
    result = swift_getWitnessTable(&unk_10001736C, &type metadata for LocalBeaconingXPCService.Entitlement);
    atomic_store(result, (unint64_t *)&qword_100021950);
  }
  return result;
}

unint64_t sub_100014140()
{
  unint64_t result;

  result = qword_100021958;
  if (!qword_100021958)
  {
    result = swift_getWitnessTable("ue", &type metadata for LocalBeaconingXPCService.Entitlement);
    atomic_store(result, (unint64_t *)&qword_100021958);
  }
  return result;
}

uint64_t sub_100014190(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[2] = a1;
  v2[3] = v1;
  v3 = type metadata accessor for UUID(0);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100006044((uint64_t *)&unk_1000214F0);
  v2[7] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalBeaconKeyInfo(0);
  v2[8] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v2[9] = v7;
  v2[10] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Table(0);
  v2[11] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v2[12] = v9;
  v2[13] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100014264, v1, 0);
}

uint64_t sub_100014264()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 112);
  *(_QWORD *)(v0 + 112) = v1;
  return swift_task_switch(sub_100014280, v1, 0);
}

uint64_t sub_100014280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = type metadata accessor for StorageDatabase(0);
  v3 = sub_1000066F0(&qword_1000211C0, type metadata accessor for StorageDatabase, (uint64_t)&unk_100016C38);
  *(_QWORD *)(v0 + 120) = Database.writeConnection.getter(v2, v3);
  return swift_task_switch(sub_1000142FC, v1, 0);
}

uint64_t sub_1000142FC()
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
  int v10;
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
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(void);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;

  v1 = v0[15];
  if (v1)
  {
    if (qword_100020D00 != -1)
      swift_once(&qword_100020D00, sub_100009474);
    v3 = v0[12];
    v2 = v0[13];
    v4 = v0[11];
    v5 = v0[8];
    v6 = v0[9];
    v7 = v0[7];
    v8 = v0[2];
    v9 = sub_100005BF0(v4, (uint64_t)qword_100021A90);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v9, v4);
    sub_10000EFCC(v8, v7);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
    v11 = v0[13];
    v43 = v0[12];
    v12 = v0[11];
    if (v10 == 1)
    {
      v13 = v0[6];
      v14 = v0[4];
      v15 = v0[5];
      sub_10000A3F0(v0[7], (uint64_t *)&unk_1000214F0);
      v16 = swift_task_alloc(32);
      *(_QWORD *)(v16 + 16) = v11;
      *(_QWORD *)(v16 + 24) = v1;
      v17 = UUID.init()();
      v18 = UUID.uuidString.getter(v17);
      v20 = v19;
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
      Connection.savepoint(_:block:)(v18, v20, sub_1000157B8, v16);
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v11, v12);
      swift_bridgeObjectRelease(v20);
      swift_release(v1);
      swift_task_dealloc(v16);
    }
    else
    {
      v25 = v0[10];
      v26 = v0[6];
      v27 = v0[4];
      v28 = v0[5];
      sub_1000101B4(v0[7], v25);
      v29 = (_QWORD *)swift_task_alloc(48);
      v29[2] = v11;
      v29[3] = v25;
      v29[4] = v1;
      v30 = UUID.init()();
      v31 = UUID.uuidString.getter(v30);
      v42 = v12;
      v33 = v32;
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
      Connection.savepoint(_:block:)(v31, v33, sub_1000157D0, v29);
      swift_bridgeObjectRelease(v33);
      swift_release(v1);
      swift_task_dealloc(v29);
      sub_100008968(v25);
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v11, v42);
    }
    v38 = v0[10];
    v40 = v0[6];
    v39 = v0[7];
    swift_task_dealloc(v0[13]);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    v37 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v21 = type metadata accessor for DatabaseError(0);
    v22 = sub_1000066F0(&qword_100021A30, (uint64_t (*)(uint64_t))&type metadata accessor for DatabaseError, (uint64_t)&protocol conformance descriptor for DatabaseError);
    swift_allocError(v21, v22, 0, 0);
    v24 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, enum case for DatabaseError.notConnected(_:), v21);
    swift_willThrow(v24);
    v34 = v0[10];
    v36 = v0[6];
    v35 = v0[7];
    swift_task_dealloc(v0[13]);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    v37 = (uint64_t (*)(void))v0[1];
  }
  return v37();
}

uint64_t sub_1000145F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t);
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
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v47 = a3;
  v42 = a1;
  v4 = type metadata accessor for OnConflict(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = type metadata accessor for Insert(0);
  v44 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v41 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = v5;
  v9 = *(void (**)(char *, _QWORD, uint64_t))(v5 + 104);
  v40 = v7;
  v45 = v4;
  v9(v7, enum case for OnConflict.replace(_:), v4);
  v10 = sub_100006044(&qword_100021A58);
  v11 = *(_QWORD *)(type metadata accessor for Setter(0) - 8);
  v12 = swift_allocObject(v10, ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ 6 * *(_QWORD *)(v11 + 72), *(unsigned __int8 *)(v11 + 80) | 7);
  *(_OWORD *)(v12 + 16) = xmmword_1000173C0;
  v39 = v12;
  if (qword_100020D08 != -1)
    swift_once(&qword_100020D08, sub_1000094DC);
  v13 = sub_100006044(&qword_100021170);
  v14 = sub_100005BF0(v13, (uint64_t)qword_100021AA8);
  v48 = 1;
  <- infix<A>(_:_:)(v14, &v48, &type metadata for Int, &protocol witness table for Int);
  if (qword_100020D10 != -1)
    swift_once(&qword_100020D10, sub_100009564);
  v15 = sub_100006044(&qword_100021180);
  v16 = sub_100005BF0(v15, (uint64_t)qword_100021AC0);
  v17 = type metadata accessor for UUID(0);
  <- infix<A>(_:_:)(v16, a2, v17, &protocol witness table for UUID);
  if (qword_100020D18 != -1)
    swift_once(&qword_100020D18, sub_1000095F8);
  v18 = sub_100005BF0(v15, (uint64_t)qword_100021AD8);
  v19 = type metadata accessor for LocalBeaconKeyInfo(0);
  <- infix<A>(_:_:)(v18, a2 + *(int *)(v19 + 20), v17, &protocol witness table for UUID);
  if (qword_100020D20 != -1)
    swift_once(&qword_100020D20, sub_100009684);
  v20 = sub_100006044(&qword_100021188);
  v21 = sub_100005BF0(v20, (uint64_t)qword_100021AF0);
  v22 = a2 + *(int *)(v19 + 24);
  v23 = type metadata accessor for Date(0);
  <- infix<A>(_:_:)(v21, v22, v23, &protocol witness table for Date);
  if (qword_100020D28 != -1)
    swift_once(&qword_100020D28, sub_10000970C);
  v24 = sub_100006044(&qword_100021190);
  v25 = sub_100005BF0(v24, (uint64_t)qword_100021B08);
  v26 = PublicKey.data.getter();
  v28 = v27;
  v48 = v26;
  v49 = v27;
  <- infix<A>(_:_:)(v25, &v48, &type metadata for Data, &protocol witness table for Data);
  sub_100008814(v26, v28);
  if (qword_100020D30 != -1)
    swift_once(&qword_100020D30, sub_100009798);
  v29 = sub_100005BF0(v24, (uint64_t)qword_100021B20);
  v30 = SharedSecretKey.data.getter();
  v32 = v31;
  v48 = v30;
  v49 = v31;
  <- infix<A>(_:_:)(v29, &v48, &type metadata for Data, &protocol witness table for Data);
  sub_100008814(v30, v32);
  v33 = type metadata accessor for Table(0);
  v35 = v40;
  v34 = v41;
  v36 = v39;
  QueryType.insert(or:_:)(v40, v39, v33, &protocol witness table for Table);
  swift_bridgeObjectRelease(v36);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v45);
  Connection.run(_:)(v34);
  return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v34, v46);
}

uint64_t sub_100014A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = type metadata accessor for Delete(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Table(0);
  QueryType.delete()(v4, &protocol witness table for Table);
  Connection.run(_:)(v3);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_100014B34(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v2[7] = a1;
  v2[8] = v1;
  v3 = sub_100006044(&qword_100021A28);
  v2[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Row(0);
  v2[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[11] = v5;
  v6 = (*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[12] = swift_task_alloc(v6);
  v2[13] = swift_task_alloc(v6);
  v7 = type metadata accessor for Table(0);
  v2[14] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[15] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[16] = swift_task_alloc(v9);
  v2[17] = swift_task_alloc(v9);
  v2[18] = swift_task_alloc(v9);
  return swift_task_switch(sub_100014C0C, v1, 0);
}

uint64_t sub_100014C0C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 64) + 112);
  *(_QWORD *)(v0 + 152) = v1;
  return swift_task_switch(sub_100014C28, v1, 0);
}

uint64_t sub_100014C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = type metadata accessor for StorageDatabase(0);
  v3 = sub_1000066F0(&qword_1000211C0, type metadata accessor for StorageDatabase, (uint64_t)&unk_100016C38);
  *(_QWORD *)(v0 + 160) = Database.readConnection.getter(v2, v3);
  return swift_task_switch(sub_100014CA4, v1, 0);
}

uint64_t sub_100014CA4()
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
  _QWORD *v11;
  void (*v12)(_QWORD *, uint64_t, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void (*v22)(_QWORD *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void (*v27)(uint64_t, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(void);
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
  _QWORD *v73;
  void (*v74)(uint64_t, uint64_t, uint64_t);
  uint64_t v75;

  v1 = v0[20];
  if (v1)
  {
    if (qword_100020D00 != -1)
      swift_once(&qword_100020D00, sub_100009474);
    v2 = v0[18];
    v4 = v0[14];
    v3 = v0[15];
    v5 = sub_100005BF0(v4, (uint64_t)qword_100021A90);
    v74 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v74(v2, v5, v4);
    v6 = sub_100006044(&qword_100021A38);
    v7 = swift_allocObject(v6, 232, 7);
    *(_OWORD *)(v7 + 16) = xmmword_1000173D0;
    if (qword_100020D10 != -1)
      swift_once(&qword_100020D10, sub_100009564);
    v8 = sub_100006044(&qword_100021180);
    v9 = sub_100005BF0(v8, (uint64_t)qword_100021AC0);
    *(_QWORD *)(v7 + 56) = v8;
    v10 = sub_100015778(&qword_100021A40, &qword_100021180);
    *(_QWORD *)(v7 + 64) = v10;
    v11 = sub_100010C3C((_QWORD *)(v7 + 32));
    v12 = *(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    v12(v11, v9, v8);
    if (qword_100020D18 != -1)
      swift_once(&qword_100020D18, sub_1000095F8);
    v13 = sub_100005BF0(v8, (uint64_t)qword_100021AD8);
    *(_QWORD *)(v7 + 96) = v8;
    *(_QWORD *)(v7 + 104) = v10;
    v14 = sub_100010C3C((_QWORD *)(v7 + 72));
    v12(v14, v13, v8);
    if (qword_100020D20 != -1)
      swift_once(&qword_100020D20, sub_100009684);
    v75 = v1;
    v15 = sub_100006044(&qword_100021188);
    v16 = sub_100005BF0(v15, (uint64_t)qword_100021AF0);
    *(_QWORD *)(v7 + 136) = v15;
    *(_QWORD *)(v7 + 144) = sub_100015778(&qword_100021A48, &qword_100021188);
    v17 = sub_100010C3C((_QWORD *)(v7 + 112));
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v17, v16, v15);
    if (qword_100020D28 != -1)
      swift_once(&qword_100020D28, sub_10000970C);
    v73 = v0 + 2;
    v18 = sub_100006044(&qword_100021190);
    v19 = sub_100005BF0(v18, (uint64_t)qword_100021B08);
    *(_QWORD *)(v7 + 176) = v18;
    v20 = sub_100015778(&qword_100021A50, &qword_100021190);
    *(_QWORD *)(v7 + 184) = v20;
    v21 = sub_100010C3C((_QWORD *)(v7 + 152));
    v22 = *(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
    v22(v21, v19, v18);
    if (qword_100020D30 != -1)
      swift_once(&qword_100020D30, sub_100009798);
    v23 = v0[16];
    v71 = v0[17];
    v72 = v0[15];
    v24 = v0[14];
    v25 = sub_100005BF0(v18, (uint64_t)qword_100021B20);
    *(_QWORD *)(v7 + 216) = v18;
    *(_QWORD *)(v7 + 224) = v20;
    v26 = sub_100010C3C((_QWORD *)(v7 + 192));
    v22(v26, v25, v18);
    SchemaType.select(_:)(v7, v24, &protocol witness table for Table);
    swift_bridgeObjectRelease(v7);
    QueryType.limit(_:)(1, 0, v24, &protocol witness table for Table);
    v27 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v27(v23, v24);
    v0[5] = v24;
    v0[6] = &protocol witness table for Table;
    v28 = sub_100010C3C(v73);
    v74((uint64_t)v28, v71, v24);
    v40 = Connection.prepare(_:)(v73);
    v41 = sub_100008904(v73);
    v42 = dispatch thunk of _AnySequenceBox.__copyToContiguousArray()(v41);
    swift_release(v40);
    if (*(_QWORD *)(v42 + 16))
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(v0[11] + 16))(v0[9], v42 + ((*(unsigned __int8 *)(v0[11] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[11] + 80)), v0[10]);
      v43 = 0;
    }
    else
    {
      v43 = 1;
    }
    v44 = v0[10];
    v45 = v0[11];
    v46 = v0[9];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v46, v43, 1, v44);
    swift_release(v42);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v46, 1, v44) == 1)
    {
      v47 = v0[17];
      v48 = v0[18];
      v49 = v0[14];
      v50 = v0[9];
      swift_release(v75);
      v27(v47, v49);
      v27(v48, v49);
      sub_10000A3F0(v50, &qword_100021A28);
      v51 = 1;
    }
    else
    {
      v52 = v0[12];
      v53 = v0[13];
      v54 = v0[10];
      v55 = v0[11];
      v56 = v0[7];
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v55 + 32))(v53, v0[9], v54);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v52, v53, v54);
      sub_100015320(v52, v56);
      v57 = v0[17];
      v58 = v0[18];
      v60 = v0[13];
      v59 = v0[14];
      v61 = v0[10];
      v62 = v0[11];
      swift_release(v75);
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v60, v61);
      v27(v57, v59);
      v27(v58, v59);
      v51 = 0;
    }
    v64 = v0[17];
    v63 = v0[18];
    v65 = v0[16];
    v67 = v0[12];
    v66 = v0[13];
    v68 = v0[9];
    v69 = v0[7];
    v70 = type metadata accessor for LocalBeaconKeyInfo(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v70 - 8) + 56))(v69, v51, 1, v70);
    swift_task_dealloc(v63);
    swift_task_dealloc(v64);
    swift_task_dealloc(v65);
    swift_task_dealloc(v66);
    swift_task_dealloc(v67);
    swift_task_dealloc(v68);
    v38 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v29 = type metadata accessor for DatabaseError(0);
    v30 = sub_1000066F0(&qword_100021A30, (uint64_t (*)(uint64_t))&type metadata accessor for DatabaseError, (uint64_t)&protocol conformance descriptor for DatabaseError);
    swift_allocError(v29, v30, 0, 0);
    v32 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v31, enum case for DatabaseError.notConnected(_:), v29);
    swift_willThrow(v32);
    v33 = v0[17];
    v34 = v0[16];
    v36 = v0[12];
    v35 = v0[13];
    v37 = v0[9];
    swift_task_dealloc(v0[18]);
    swift_task_dealloc(v33);
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    v38 = (uint64_t (*)(void))v0[1];
  }
  return v38();
}

uint64_t sub_100015320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
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
  void (*v27)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v32 = type metadata accessor for SharedSecretKey(0);
  v30 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PublicKey(0);
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100020D10 != -1)
    swift_once(&qword_100020D10, sub_100009564);
  v9 = sub_100006044(&qword_100021180);
  v10 = sub_100005BF0(v9, (uint64_t)qword_100021AC0);
  v11 = type metadata accessor for UUID(0);
  Row.subscript.getter(v10, v11, &protocol witness table for UUID);
  if (qword_100020D18 != -1)
    swift_once(&qword_100020D18, sub_1000095F8);
  v12 = sub_100005BF0(v9, (uint64_t)qword_100021AD8);
  v13 = (int *)type metadata accessor for LocalBeaconKeyInfo(0);
  v38 = a2 + v13[5];
  Row.subscript.getter(v12, v11, &protocol witness table for UUID);
  if (qword_100020D20 != -1)
    swift_once(&qword_100020D20, sub_100009684);
  v14 = sub_100006044(&qword_100021188);
  v15 = sub_100005BF0(v14, (uint64_t)qword_100021AF0);
  v16 = a2 + v13[6];
  v17 = type metadata accessor for Date(0);
  v35 = v16;
  Row.subscript.getter(v15, v17, &protocol witness table for Date);
  if (qword_100020D28 != -1)
    swift_once(&qword_100020D28, sub_10000970C);
  v18 = sub_100006044(&qword_100021190);
  v19 = sub_100005BF0(v18, (uint64_t)qword_100021B08);
  Row.subscript.getter(v19, &type metadata for Data, &protocol witness table for Data);
  PublicKey.init(data:)(v36);
  if (v2)
  {
    v20 = type metadata accessor for Row(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a1, v20);
    v27 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v27(a2, v11);
    v27(v38, v11);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v35, v17);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(a2 + v13[7], v8, v34);
    if (qword_100020D30 != -1)
      swift_once(&qword_100020D30, sub_100009798);
    v21 = sub_100005BF0(v18, (uint64_t)qword_100021B20);
    Row.subscript.getter(v21, &type metadata for Data, &protocol witness table for Data);
    v22 = v36;
    v23 = v37;
    sub_1000066F0(&qword_100021010, (uint64_t (*)(uint64_t))&type metadata accessor for SharedSecretKey, (uint64_t)&protocol conformance descriptor for SharedSecretKey);
    v24 = v31;
    v25 = v23;
    v26 = v32;
    KeyRepresentable<>.init(data:)(v22, v25);
    v29 = type metadata accessor for Row(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(a1, v29);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 32))(a2 + v13[8], v24, v26);
  }
}

uint64_t sub_100015734()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 112));
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for StorageStore()
{
  return objc_opt_self(_TtC16findmybeaconingd12StorageStore);
}

uint64_t sub_100015778(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000A42C(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for Expression<A>, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000157B8()
{
  return sub_100014A84();
}

uint64_t sub_1000157D0()
{
  uint64_t *v0;

  return sub_1000145F0(v0[2], v0[3], v0[4]);
}
